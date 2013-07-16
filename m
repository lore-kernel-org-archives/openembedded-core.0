Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 231386B21A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:25:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6GAXrf9003391; Tue, 16 Jul 2013 11:33:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TJcAlKc8Au2J; Tue, 16 Jul 2013 11:33:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6GAXn7S003387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Jul 2013 11:33:50 +0100
Message-ID: <1373970309.29233.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Tue, 16 Jul 2013 11:25:09 +0100
In-Reply-To: <51E5027D.6050003@communistcode.co.uk>
References: <51E5027D.6050003@communistcode.co.uk>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Toolchain Issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 10:25:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-16 at 09:21 +0100, Jack Mitchell wrote:
> Morning everyone,
> 
> I'm trying to create a custom toolchain and sdk for a development board 
> and I'm having some issues.
> 
> I create my toolchain with the following method:
> 
> bitbake image -c populate_sdk
> 
> When I try to compile u-boot with the sdk, I recieve the following error:
> 
>      Configuring for socfpga_cyclone5 board...
>      make[1]: *** [/mnt/SSD/socfpga/u-boot-socfpga.git/spl/u-boot-spl] 
> Error 1
>      make: *** [spl/u-boot-spl.bin] Error 2
>      make: *** [u-boot] Error 1
>      arm-oecore-linux-gnueabi-size: './u-boot': No such file
>      arm-oecore-linux-gnueabi-ld.bfd: cannot find -lgcc
>      make[1]: *** [/mnt/SSD/socfpga/u-boot-socfpga.git/spl/u-boot-spl] 
> Error 1
>      make: *** [spl/u-boot-spl.bin] Error 2
>      make: *** Waiting for unfinished jobs....
>      arm-oecore-linux-gnueabi-ld.bfd: cannot find -lgcc
>      make: *** [u-boot] Error 1

The toolchain environment script requires some --sysroot options to be
passed to the compiler/linker. I'm guessing uboot isn't getting these.
See the uboot recipes for how to pass in those options.

Cheers,

Richard


