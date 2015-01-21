Return-Path: <denis@denix.org>
X-Greylist: delayed 3615 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jan 2015 21:35:57 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6736971633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 21:35:57 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIJ00L1JNV82XV0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Jan 2015 14:35:37 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=D9vw8UVm c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=alK4_DS-AAAA:8 a=sozttTNsAAAA:8
	a=x2GZnTqNAAAA:8 a=voM4FWlXAAAA:8	a=Q4-j1AaZAAAA:8
	a=PXQNLf9141H4NX9bA_0A:9
	a=CjuIK1q_8ugA:10	a=jxC1yY7ND0kA:10 a=LklqTVxV3E0A:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E54C42018E; Wed,
	21 Jan 2015 15:35:31 -0500 (EST)
Date: Wed, 21 Jan 2015 15:35:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Raphael Philipe <rapphil@gmail.com>
Message-id: <20150121203531.GM20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<CAENGNhc2gomqGRn3z1UantivS8wkWJn8kfDbjCL96tjTdQ4XAQ@mail.gmail.com>
	<20150121202801.GL20639@denix.org>
	<CAENGNheA=BVgRCcKaCSbya3O3YReTKL7cS6pJmhCm3Z8T_MTgA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAENGNheA=BVgRCcKaCSbya3O3YReTKL7cS6pJmhCm3Z8T_MTgA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Wed, 21 Jan 2015 21:36:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 21, 2015 at 06:31:32PM -0200, Raphael Philipe wrote:
> I just checked 2014.07, and it does not work too. Same output.
> 
> Sorry,am I missing something?

Looks like host-specific issue - it calls HOSTCC in there.


> On Wed, Jan 21, 2015 at 6:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Jan 21, 2015 at 06:25:35PM -0200, Raphael Philipe wrote:
> >> Denys, I tested your patch and It seems not to be working for
> >> u-boot-fw-utils-cross
> >
> > Did the old version work for you?
> >
> >
> >> $ bitbake u-boot-fw-utils-cross
> >> Loading cache: 100%
> >> |########################################################################################################################################################################|
> >> ETA:  00:00:00
> >> Loaded 1921 entries from dependency cache.
> >> Parsing recipes: 100%
> >> |######################################################################################################################################################################|
> >> Time: 00:00:00
> >> Parsing of 1451 .bb files complete (1450 cached, 1 parsed). 1914
> >> targets, 85 skipped, 0 masked, 0 errors.
> >> NOTE: Resolving any missing task queue dependencies
> >>
> >> Build Configuration:
> >> BB_VERSION        = "1.25.0"
> >> BUILD_SYS         = "x86_64-linux"
> >> NATIVELSBSTRING   = "Ubuntu-14.04"
> >> TARGET_SYS        = "arm-poky-linux-gnueabi"
> >> MACHINE           = "beaglebone"
> >> DISTRO            = "poky"
> >> DISTRO_VERSION    = "1.7"
> >> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
> >> TARGET_FPU        = "vfp-neon"
> >> meta
> >> meta-yocto
> >> meta-yocto-bsp    = "master:45d090024d7b88c434fef2e88317946449e32c2c"
> >> meta-oe           = "mymaster:5b4413ccf329a981bee976c9fcde5d2872f0defb"
> >>
> >> NOTE: Preparing RunQueue
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >> ERROR: Function failed: do_compile (log file is located at
> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549)
> >> ERROR: Logfile of failure stored in:
> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549
> >> Log data follows:
> >> | DEBUG: Executing shell function do_compile
> >> | NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
> >> CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard
> >> -mfpu=neon -mtune=cortex-a8  am335x_evm_config
> >> |   HOSTCC  scripts/basic/fixdep
> >> |   HOSTCC  scripts/kconfig/conf.o
> >> |   HOSTCC  scripts/kconfig/zconf.tab.o
> >> |   HOSTLD  scripts/kconfig/conf
> >> | #
> >> | # configuration written to .config
> >> | #
> >> | #
> >> | # configuration written to spl/.config
> >> | #
> >> | NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
> >> CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard
> >> -mfpu=neon -mtune=cortex-a8  env
> >> | scripts/kconfig/conf --silentoldconfig Kconfig
> >> | scripts/kconfig/conf --silentoldconfig Kconfig
> >> |   CHK     include/config.h
> >> |   GEN     include/autoconf.mk
> >> |   GEN     include/autoconf.mk.dep
> >> |   GEN     spl/include/autoconf.mk
> >> |   HOSTCC  tools/env/fw_env.o
> >> |   HOSTCC  tools/env/fw_env_main.o
> >> |   HOSTCC  tools/env/crc32.o
> >> |   HOSTCC  tools/env/ctype.o
> >> | tools/env/fw_env_main.c:30:19: fatal error: fcntl.h: No such file or directory
> >> |  #include <fcntl.h>
> >> |                    ^
> >> | compilation terminated.
> >> | In file included from tools/env/crc32.c:1:0:
> >> | tools/env/../../lib/crc32.c:12:23: fatal error: arpa/inet.h: No such
> >> file or directory
> >> |  #include <arpa/inet.h>
> >> |                        ^
> >> | compilation terminated.
> >> | make[1]: *** [tools/env/fw_env_main.o] Error 1
> >> | make[1]: *** Waiting for unfinished jobs....
> >> | make[1]: *** [tools/env/crc32.o] Error 1
> >> | tools/env/fw_env.c:16:19: fatal error: fcntl.h: No such file or directory
> >> |  #include <fcntl.h>
> >> |                    ^
> >> | compilation terminated.
> >> | make[1]: *** [tools/env/fw_env.o] Error 1
> >> | make: *** [env] Error 2
> >> | ERROR: oe_runmake failed
> >> | WARNING: exit code 1 from a shell command.
> >> | ERROR: Function failed: do_compile (log file is located at
> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549)
> >> ERROR: Task 6 (/home/rapphil/work/poky/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb,
> >> do_compile) failed with exit code '1'
> >> NOTE: Tasks Summary: Attempted 658 tasks of which 656 didn't need to
> >> be rerun and 1 failed.
> >> No currently running tasks (658 of 661)
> >>
> >> Summary: 1 task failed:
> >>   /home/rapphil/work/poky/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb,
> >> do_compile
> >>
> >> On Wed, Jan 21, 2015 at 6:11 PM, Otavio Salvador
> >> <otavio@ossystems.com.br> wrote:
> >> > On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> >> On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
> >> >>> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> >>> > From: Denys Dmytriyenko <denys@ti.com>
> >> >>> >
> >> >>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> >>> ...
> >> >>> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> >> >>> > @@ -0,0 +1,36 @@
> >> >>> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
> >> >>> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> >>> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
> >> >>> > +Subject: [PATCH] tools: env: fix build error
> >> >>> > +
> >> >>> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
> >> >>> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
> >> >>> > +is defined.
> >> >>> > +(I do not think this is the right way to fix the problem, but
> >> >>> > +for now I do not have enough time to take a close look.)
> >> >>> > +
> >> >>> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
> >> >>> > +
> >> >>> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> >>> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
> >> >>>
> >> >>> Is it necessary? In meta-fsl-arm we don't have this patch and get the
> >> >>> tools built.
> >> >>
> >> >> Really? The patch above is rather self-explanatory. The issue was confirmed by
> >> >> U-boot maintainers and the workaround provided by one of the core developers.
> >> >> I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
> >> >> defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
> >> >> whether your platforms are affected or not. It does affect our platforms
> >> >> (among many others), including beaglebone.
> >> >
> >> > I think this is for the cross tool only.
> >> >
> >> > --
> >> > Otavio Salvador                             O.S. Systems
> >> > http://www.ossystems.com.br        http://code.ossystems.com.br
> >> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> 

