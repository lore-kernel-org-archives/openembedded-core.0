Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 43B82719D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 22:39:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t1ctK5L4cz3hjRm;
	Sun, 23 Oct 2016 00:39:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t1ctH6L7DzvkKd;
	Sun, 23 Oct 2016 00:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id J_eQKkyxVE9o; Sun, 23 Oct 2016 00:39:34 +0200 (CEST)
X-Auth-Info: F3r9mGHLLaMz51LClaxqjUXfg1Gj7B67Ax5UtbwbbwQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 23 Oct 2016 00:39:34 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
Date: Sat, 22 Oct 2016 22:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Sat, 22 Oct 2016 22:39:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/21/2016 09:47 AM, Burton, Ross wrote:

Hi!

> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     Upgrade U-Boot to the latest version.
> 
> 
> As usual, u-boot-mkimage broke again:

That's weird, I successfully built it for nios2 during my tests.
Can you tell me how I can replicate the issue , so I can test for it to
prevent regression and roll out a patch ?

> | DEBUG: Executing shell function do_compile
> |   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse
> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
>  -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
>  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -Wp,-MD,tools/.bin2header.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer    -DCONFIG_FIT_SIGNATURE -include
> ./include/libfdt_env.h -idirafterinclude
> -idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
> -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE  -o tools/bin2header tools/bin2header.c
> | cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
> | tools/bin2header license_gzip > ./include/license.h
> |   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse
> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
>  -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
>  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -Wp,-MD,tools/lib/.crc32.o.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer    -DCONFIG_FIT_SIGNATURE -include
> ./include/libfdt_env.h -idirafterinclude
> -idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
> -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> -D_GNU_SOURCE -pedantic -c -o tools/lib/crc32.o tools/lib/crc32.c
> | /bin/sh: tools/bin2header: /lib/ld-linux-x86-64.so.2: bad ELF
> interpreter: No such file or directory
> | ERROR: oe_runmake failed
> | make[1]: *** [include/license.h] Error 126
> NOTE: recipe u-boot-mkimage-1_2016.09.01-r0: task do_compile: Failed
> ERROR: Task
> (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb:do_compile)
> failed with exit code '1'
> 
> It's using the target compiler/sysroot/options to build a runtime tool
> (so should use BUILD_CC instead of CC, etc).
> 
> Ross


-- 
Best regards,
Marek Vasut

