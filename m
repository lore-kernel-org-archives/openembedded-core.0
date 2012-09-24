Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TG4Tk-00060Z-5u
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 10:57:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2012 01:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,474,1344236400"; d="scan'208";a="148310337"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2012 01:44:19 -0700
Message-ID: <50601D62.8070408@intel.com>
Date: Mon, 24 Sep 2012 11:44:18 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk>
In-Reply-To: <50601BC1.9060706@communistcode.co.uk>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 08:57:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 09/24/2012 11:37 AM, Jack Mitchell wrote:
> On 24/09/12 03:17, Khem Raj wrote:
> 
> [snip]
> 
>>
>>
>> What does linker command looks like, its not in the above log you posted.
>>
>>
> 
> Hi Khem,
> 
> Is this enough information?
> 
> Building target: R0005
> Invoking: GCC C Linker
> 
> arm-poky-linux-gnueabi-gcc 
> -L/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib 
> -o "R0005"  ./src/webInterfaces/webInterface_rJSON.o 
> ./src/webInterfaces/webInterface_sqlite.o 
> ./src/webInterfaces/webInterface_webSockets.o 
> ./src/storageInterfaces/sqlite.o ./src/management/management_database.o 
> ./src/hardwareProtocols/hardwareProtocol_B092SPIImage.o 
> ./src/hardwareProtocols/hardwareProtocol_axonSPI.o 
> ./src/hardwareInterfaces/interface_gpio_mmap.o 
> ./src/hardwareInterfaces/interface_gpio_sysfs.o 
> ./src/hardwareInterfaces/interface_kMod.o 
> ./src/hardwareInterfaces/interface_serial.o 
> ./src/hardwareInterfaces/interface_spidev.o  ./src/B092/B092.o 
> ./src/B092/B092_config.o ./src/B092/B092_database.o 
> ./src/B092/B092_init.o ./src/B092/B092_socket.o 
> ./src/B092/B092_thumbnail.o ./src/B092/BO92_data.o ./src/AX02/AX02.o 
> ./src/AX02/AX02_PIDs.o ./src/AX02/AX02_config.o ./src/AX02/AX02_data.o 
> ./src/AX02/AX02_database.o ./src/AX02/AX02_init.o ./src/AX02/AX02_log.o 
> ./src/AX02/AX02_socket.o ./src/AX02/AX02_tables.o  ./src/R0005.o 
> ./src/errors.o ./src/systemConfig.o   -lsqlite3 -ljansson -lwebsockets 
> -lz -lpthread -ljpeg -lpng
> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
> cannot find crt1.o: No such file or directory
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
> cannot find crti.o: No such file or directory
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
> cannot find crtbegin.o: No such file or directory
Can you please try the little test app I wrote in order to test this? I
attached it in the bug. Let me know if it works.

> /lib/libpthread.so.0: file not recognized: File format not recognized
This is kind of weird... It looks like it tries to link against the host
libpthread library.

Thanks,
Laurentiu
> 
> collect2: error: ld returned 1 exit status
> 
> make: *** [R0005] Error 1
> 
> Regards,
> 


