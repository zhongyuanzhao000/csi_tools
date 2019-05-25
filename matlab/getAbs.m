
csi_trace = read_bf_file('D:\time_test.dat');

for i=1:200%这里是取的数据包的个数
        csi_entry = csi_trace{i};
        csi = get_scaled_csi(csi_entry); %提取csi矩阵    
        csi =csi(1,:,:);
        csi1=angle(squeeze(csi).');          %提取幅值(降维+转置)

        %只取一根天线的数据
        first_ant_csi(:,i)=csi1(:,1);           %直接取第一列数据(不需要for循环取)
        second_ant_csi(:,i)=csi1(:,2);
        third_ant_csi(:,i)=csi1(:,3);
                     
        for j=1:30

            csi15_end(i,:)=csi1(j,:);           %3个信道第j个子载波

        end

end

 

%画第一根天线的载波
figure;
plot(first_ant_csi.')
figure;
plot(second_ant_csi.')
figure;
plot(third_ant_csi.')
