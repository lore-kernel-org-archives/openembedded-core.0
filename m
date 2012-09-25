Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGQhI-000448-8n
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 10:40:52 +0200
Received: from localhost ([127.0.0.1]:52115 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGQUt-0007pY-9o
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 08:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=IxVheHFjZU5X2CTx8CNtb7l1LgQ=; b=L6vbIUvdp6Maj9B+zl2l4V0WAZ1a
	n8q0deyKi5aWgg5sHniAwcyjaG6j66xFVka3N0Qm5trRS8YcxXVoQe3uO9os/6Zr
	KPSx7NBDIXWutbAXXpI+i0tdWwSUQjTID4XkZ8p7M0Q8qBdkay8xszu9aSXiBFUC
	Eie/8Lfr4iSdkw8=
Received: from [195.171.99.130] (port=48025 helo=[192.168.0.59])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TGQUt-0007pV-6C
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 08:28:03 +0000
Message-ID: <50616B77.1030007@communistcode.co.uk>
Date: Tue, 25 Sep 2012 09:29:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk> <50601D62.8070408@intel.com>
	<50601FD9.4080009@communistcode.co.uk>
	<CAMKF1sqGGc+mE-0JpxznkC1KkbqMrVOzMqRiUtxX8fOR7FqwTQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqGGc+mE-0JpxznkC1KkbqMrVOzMqRiUtxX8fOR7FqwTQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Sep 2012 08:40:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/12 16:28, Khem Raj wrote:
>
>
> On Monday, September 24, 2012, Jack Mitchell <ml@communistcode.co.uk 
> <mailto:ml@communistcode.co.uk>> wrote:
> > On 24/09/12 09:44, Laurentiu Palcu wrote:
> >>
> >> On 09/24/2012 11:37 AM, Jack Mitchell wrote:
> >>>
> >>> On 24/09/12 03:17, Khem Raj wrote:
> >>>
> >>> [snip]
> >>>
> >>>>
> >>>> What does linker command looks like, its not in the above log you 
> posted.
> >>>>
> >>>>
> >>> Hi Khem,
> >>>
> >>> Is this enough information?
> >>>
> >>> Building target: R0005
> >>> Invoking: GCC C Linker
> >>>
> >>> arm-poky-linux-gnueabi-gcc
> >>> 
> -L/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib
> >>> -o "R0005"  ./src/webInterfaces/webInterface_rJSON.o
> >>> ./src/webInterfaces/webInterface_sqlite.o
> >>> ./src/webInterfaces/webInterface_webSockets.o
> >>> ./src/storageInterfaces/sqlite.o 
> ./src/management/management_database.o
> >>> ./src/hardwareProtocols/hardwareProtocol_B092SPIImage.o
> >>> ./src/hardwareProtocols/hardwareProtocol_axonSPI.o
> >>> ./src/hardwareInterfaces/interface_gpio_mmap.o
> >>> ./src/hardwareInterfaces/interface_gpio_sysfs.o
> >>> ./src/hardwareInterfaces/interface_kMod.o
> >>> ./src/hardwareInterfaces/interface_serial.o
> >>> ./src/hardwareInterfaces/interface_spidev.o  ./src/B092/B092.o
> >>> ./src/B092/B092_config.o ./src/B092/B092_database.o
> >>> ./src/B092/B092_init.o ./src/B092/B092_socket.o
> >>> ./src/B092/B092_thumbnail.o ./src/B092/BO92_data.o ./src/AX02/AX02.o
> >>> ./src/AX02/AX02_PIDs.o ./src/AX02/AX02_config.o ./src/AX02/AX02_data.o
> >>> ./src/AX02/AX02_database.o ./src/AX02/AX02_init.o 
> ./src/AX02/AX02_log.o
> >>> ./src/AX02/AX02_socket.o ./src/AX02/AX02_tables.o  ./src/R0005.o
> >>> ./src/errors.o ./src/systemConfig.o -lsqlite3 -ljansson -lwebsockets
> >>> -lz -lpthread -ljpeg -lpng
> >>>
> >>> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> >>> cannot find crt1.o: No such file or directory
> >>> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> >>> cannot find crti.o: No such file or directory
> >>> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> >>> cannot find crtbegin.o: No such file or directory
> >>
> >> Can you please try the little test app I wrote in order to test this? I
> >> attached it in the bug. Let me know if it works.
> >>
> >>> /lib/libpthread.so.0: file not recognized: File format not recognized
> >>
> >> This is kind of weird... It looks like it tries to link against the 
> host
> >> libpthread library.
> >
> > I agree, I also can't find libpthread.so.0 in my sysroot either, 
> only libpthread.so, so maybe it is trying to fallback to host libs?
> >
>
> Libpthread.so should be a linker script stub and that might not be 
> adjusted for relocation since linker now will need sysroot option as 
> the built in defaults aren't valid after relocation
>
> Btw I needed the real LD command which you will get with -v
> > I have attached the output from the test cases you propsed and 
> attached them to the bug report.

Ok, I passed the compiler and the linker the sysroot flag and it 
compiled successfully. Thank you everyone for all your help and I'll 
brush up on my compiling/linking knowledge!

> >
> > I also just tried passing the --sysroot= argument to no avail.
> >
> >>
> >> Thanks,
> >> Laurentiu
> >>>
> >>> collect2: error: ld returned 1 exit status
> >>>
> >>> make: *** [R0005] Error 1
> >>>
> >>> Regards,
> >>>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> > --
> >
> >   Jack Mitchell (jack@embed.me.uk <mailto:jack@embed.me.uk>)
> >   Embedded Systems Engineer
> > http://www.embed.me.uk
> >
> > --
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > 


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



