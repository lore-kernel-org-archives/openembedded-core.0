Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG4bx-0006b1-00
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 11:05:53 +0200
Received: from localhost ([127.0.0.1]:38039 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG4PZ-0005Hu-KA
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=mzAHyhIrld+yUIxjRP8tfnm5M/w=; b=IZtfdkuvwMm0/PJ2Y0iQefnHkpob
	wQI0MvTiYKRRP3ssiwv5DcFk0vGpN4d86uME3HfvfywHqH72B+HZk83MPzHIYIs6
	d0BekfJ2WyPu/jrluJZRgF7bSqeec06ucFIxBh3litpzUKfjhHYI8/UkSDwAMUKG
	x+yFLjzZJVLO4U8=
Received: from [195.171.99.130] (port=40931 helo=[192.168.0.59])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TG4PZ-0005Hq-Hp
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:53:05 +0000
Message-ID: <50601FD9.4080009@communistcode.co.uk>
Date: Mon, 24 Sep 2012 09:54:49 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk> <50601D62.8070408@intel.com>
In-Reply-To: <50601D62.8070408@intel.com>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 09:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/12 09:44, Laurentiu Palcu wrote:
>
> On 09/24/2012 11:37 AM, Jack Mitchell wrote:
>> On 24/09/12 03:17, Khem Raj wrote:
>>
>> [snip]
>>
>>>
>>> What does linker command looks like, its not in the above log you posted.
>>>
>>>
>> Hi Khem,
>>
>> Is this enough information?
>>
>> Building target: R0005
>> Invoking: GCC C Linker
>>
>> arm-poky-linux-gnueabi-gcc
>> -L/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib
>> -o "R0005"  ./src/webInterfaces/webInterface_rJSON.o
>> ./src/webInterfaces/webInterface_sqlite.o
>> ./src/webInterfaces/webInterface_webSockets.o
>> ./src/storageInterfaces/sqlite.o ./src/management/management_database.o
>> ./src/hardwareProtocols/hardwareProtocol_B092SPIImage.o
>> ./src/hardwareProtocols/hardwareProtocol_axonSPI.o
>> ./src/hardwareInterfaces/interface_gpio_mmap.o
>> ./src/hardwareInterfaces/interface_gpio_sysfs.o
>> ./src/hardwareInterfaces/interface_kMod.o
>> ./src/hardwareInterfaces/interface_serial.o
>> ./src/hardwareInterfaces/interface_spidev.o  ./src/B092/B092.o
>> ./src/B092/B092_config.o ./src/B092/B092_database.o
>> ./src/B092/B092_init.o ./src/B092/B092_socket.o
>> ./src/B092/B092_thumbnail.o ./src/B092/BO92_data.o ./src/AX02/AX02.o
>> ./src/AX02/AX02_PIDs.o ./src/AX02/AX02_config.o ./src/AX02/AX02_data.o
>> ./src/AX02/AX02_database.o ./src/AX02/AX02_init.o ./src/AX02/AX02_log.o
>> ./src/AX02/AX02_socket.o ./src/AX02/AX02_tables.o  ./src/R0005.o
>> ./src/errors.o ./src/systemConfig.o   -lsqlite3 -ljansson -lwebsockets
>> -lz -lpthread -ljpeg -lpng
>>
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crt1.o: No such file or directory
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crti.o: No such file or directory
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crtbegin.o: No such file or directory
> Can you please try the little test app I wrote in order to test this? I
> attached it in the bug. Let me know if it works.
>
>> /lib/libpthread.so.0: file not recognized: File format not recognized
> This is kind of weird... It looks like it tries to link against the host
> libpthread library.

I agree, I also can't find libpthread.so.0 in my sysroot either, only 
libpthread.so, so maybe it is trying to fallback to host libs?

I have attached the output from the test cases you propsed and attached 
them to the bug report.

I also just tried passing the --sysroot= argument to no avail.

>
> Thanks,
> Laurentiu
>> collect2: error: ld returned 1 exit status
>>
>> make: *** [R0005] Error 1
>>
>> Regards,
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



