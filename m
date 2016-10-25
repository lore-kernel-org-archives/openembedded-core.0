Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D98136013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 18:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F306D20911;
	Tue, 25 Oct 2016 18:32:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YgACVbEb0uLk; Tue, 25 Oct 2016 18:32:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AABF5204E0;
	Tue, 25 Oct 2016 18:32:40 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id C25CD16217E; Tue, 25 Oct 2016 14:32:39 -0400 (EDT)
Date: Tue, 25 Oct 2016 14:32:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161025183239.GF2494@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
MIME-Version: 1.0
In-Reply-To: <016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 25 Oct 2016 18:32:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
> On 10/21/2016 09:47 AM, Burton, Ross wrote:
> 
> Hi!
> 
> > On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
> > <mailto:marex@denx.de>> wrote:
> > 
> >     Upgrade U-Boot to the latest version.
> > 
> > 
> > As usual, u-boot-mkimage broke again:
> 
> That's weird, I successfully built it for nios2 during my tests.
> Can you tell me how I can replicate the issue , so I can test for it to
> prevent regression and roll out a patch ?

Marek, Ross,

Any progress on this? Need any help testing?

-- 
Denys


> > | DEBUG: Executing shell function do_compile
> > |   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
> > -mfpmath=sse
> > --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
> >  -O2 -pipe -g -feliminate-unused-debug-types
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
> >  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > -Wp,-MD,tools/.bin2header.d -Wall -Wstrict-prototypes -O2
> > -fomit-frame-pointer    -DCONFIG_FIT_SIGNATURE -include
> > ./include/libfdt_env.h -idirafterinclude
> > -idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
> > -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> > -D_GNU_SOURCE  -o tools/bin2header tools/bin2header.c
> > | cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
> > | tools/bin2header license_gzip > ./include/license.h
> > |   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
> > -mfpmath=sse
> > --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
> >  -O2 -pipe -g -feliminate-unused-debug-types
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
> > -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
> >  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > -Wp,-MD,tools/lib/.crc32.o.d -Wall -Wstrict-prototypes -O2
> > -fomit-frame-pointer    -DCONFIG_FIT_SIGNATURE -include
> > ./include/libfdt_env.h -idirafterinclude
> > -idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
> > -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES
> > -D_GNU_SOURCE -pedantic -c -o tools/lib/crc32.o tools/lib/crc32.c
> > | /bin/sh: tools/bin2header: /lib/ld-linux-x86-64.so.2: bad ELF
> > interpreter: No such file or directory
> > | ERROR: oe_runmake failed
> > | make[1]: *** [include/license.h] Error 126
> > NOTE: recipe u-boot-mkimage-1_2016.09.01-r0: task do_compile: Failed
> > ERROR: Task
> > (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb:do_compile)
> > failed with exit code '1'
> > 
> > It's using the target compiler/sysroot/options to build a runtime tool
> > (so should use BUILD_CC instead of CC, etc).
> > 
> > Ross
> 
> 
> -- 
> Best regards,
> Marek Vasut
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

