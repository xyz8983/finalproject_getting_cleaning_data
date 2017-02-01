run_analysis <- function(){
	#read training data set
	train_data <- read.table(file = "./train/X_train.txt", header = F)
	
	#read testing data set
	test_data <- read.table(file = "./test/X_test.txt", header = F)
	
	
	#read header from features.txt, colum 2 is the actual header
	headers <- read.table(file = "./features.txt", header = F, sep=" ")
	headers <- headers[,2]
	
	#merge testing data set and training data set
	whole_dataset<-rbind(test_data, train_data)
	#create header using the name from features.txt
	colnames(whole_dataset) <- headers
	
	
	#extract only mean and std measurements
	indices <- grep("mean[()]|std",headers)
	extracted_data <- whole_dataset[,indices]
	#write.table(extracted_data,file="./extracted_data.txt", row.names = F)
	
	avg <- colMeans(extracted_data)
	write.table(avg,file="./avg_of_each_vars.txt",row.names = F)
}

