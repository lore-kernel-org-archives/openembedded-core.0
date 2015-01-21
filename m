Return-Path: <rapphil@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9342C71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:48:42 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so34778771qab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IrSMdukmbVXzK7u3Nl/PFuL7pXMr7PF8ygRf3EJzjSw=;
	b=zrPk1bWbiYeqp8NEdjwbrv2QUsP5De6yA3+9cYL0kbVL/LQXInYt9nb+r6EMxss/Mf
	iR5AKKK4FIW6jn684lhEqoOq7Q28okD4+RFw60s7NsJGHmqDf4E9t1X4EREDfRLt9lHV
	4Dxj9G1VxRPC+1HTMOdIGoqjJ1Jlc5sYiELgMH1KeyXSolH16V89XqsZo5D/6ZWsc6KC
	nlNadPn63FedfqYpwzBeCnoIeA5dtPz0YThs844U5W/XVKoRl9ylcaV9rj1e1XV4cgWX
	788WOq4xWiBcdVKblqSHviBUtlzGrltrmi04MeZhDQRBNCX/IYWgBsyn+a26GtYOtLu/
	W1YA==
MIME-Version: 1.0
X-Received: by 10.140.21.229 with SMTP id 92mr58013304qgl.33.1421873322772;
	Wed, 21 Jan 2015 12:48:42 -0800 (PST)
Received: by 10.140.240.67 with HTTP; Wed, 21 Jan 2015 12:48:42 -0800 (PST)
In-Reply-To: <20150121203531.GM20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<CAENGNhc2gomqGRn3z1UantivS8wkWJn8kfDbjCL96tjTdQ4XAQ@mail.gmail.com>
	<20150121202801.GL20639@denix.org>
	<CAENGNheA=BVgRCcKaCSbya3O3YReTKL7cS6pJmhCm3Z8T_MTgA@mail.gmail.com>
	<20150121203531.GM20639@denix.org>
Date: Wed, 21 Jan 2015 18:48:42 -0200
Message-ID: <CAENGNhex69KTSBjE=Nf6_O+bz5PcfqOfv4h4hYyJYqa1pzf4cQ@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Wed, 21 Jan 2015 20:48:49 -0000
Content-Type: text/plain; charset=UTF-8

Instead of HOSTCC, what is called  in your log.do_compile  ?

Maybe it is a Yocto bug. My Linux distro is supported though.
http://www.yoctoproject.org/docs/1.7/ref-manual/ref-manual.html#detailed-supported-distros.




On Wed, Jan 21, 2015 at 6:35 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Jan 21, 2015 at 06:31:32PM -0200, Raphael Philipe wrote:
>> I just checked 2014.07, and it does not work too. Same output.
>>
>> Sorry,am I missing something?
>
> Looks like host-specific issue - it calls HOSTCC in there.
>
>
>> On Wed, Jan 21, 2015 at 6:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Wed, Jan 21, 2015 at 06:25:35PM -0200, Raphael Philipe wrote:
>> >> Denys, I tested your patch and It seems not to be working for
>> >> u-boot-fw-utils-cross
>> >
>> > Did the old version work for you?
>> >
>> >
>> >> $ bitbake u-boot-fw-utils-cross
>> >> Loading cache: 100%
>> >> |########################################################################################################################################################################|
>> >> ETA:  00:00:00
>> >> Loaded 1921 entries from dependency cache.
>> >> Parsing recipes: 100%
>> >> |######################################################################################################################################################################|
>> >> Time: 00:00:00
>> >> Parsing of 1451 .bb files complete (1450 cached, 1 parsed). 1914
>> >> targets, 85 skipped, 0 masked, 0 errors.
>> >> NOTE: Resolving any missing task queue dependencies
>> >>
>> >> Build Configuration:
>> >> BB_VERSION        = "1.25.0"
>> >> BUILD_SYS         = "x86_64-linux"
>> >> NATIVELSBSTRING   = "Ubuntu-14.04"
>> >> TARGET_SYS        = "arm-poky-linux-gnueabi"
>> >> MACHINE           = "beaglebone"
>> >> DISTRO            = "poky"
>> >> DISTRO_VERSION    = "1.7"
>> >> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
>> >> TARGET_FPU        = "vfp-neon"
>> >> meta
>> >> meta-yocto
>> >> meta-yocto-bsp    = "master:45d090024d7b88c434fef2e88317946449e32c2c"
>> >> meta-oe           = "mymaster:5b4413ccf329a981bee976c9fcde5d2872f0defb"
>> >>
>> >> NOTE: Preparing RunQueue
>> >> NOTE: Executing SetScene Tasks
>> >> NOTE: Executing RunQueue Tasks
>> >> ERROR: Function failed: do_compile (log file is located at
>> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549)
>> >> ERROR: Logfile of failure stored in:
>> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549
>> >> Log data follows:
>> >> | DEBUG: Executing shell function do_compile
>> >> | NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
>> >> CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard
>> >> -mfpu=neon -mtune=cortex-a8  am335x_evm_config
>> >> |   HOSTCC  scripts/basic/fixdep
>> >> |   HOSTCC  scripts/kconfig/conf.o
>> >> |   HOSTCC  scripts/kconfig/zconf.tab.o
>> >> |   HOSTLD  scripts/kconfig/conf
>> >> | #
>> >> | # configuration written to .config
>> >> | #
>> >> | #
>> >> | # configuration written to spl/.config
>> >> | #
>> >> | NOTE: make -j 4 CROSS_COMPILE=arm-poky-linux-gnueabi-
>> >> CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard
>> >> -mfpu=neon -mtune=cortex-a8  env
>> >> | scripts/kconfig/conf --silentoldconfig Kconfig
>> >> | scripts/kconfig/conf --silentoldconfig Kconfig
>> >> |   CHK     include/config.h
>> >> |   GEN     include/autoconf.mk
>> >> |   GEN     include/autoconf.mk.dep
>> >> |   GEN     spl/include/autoconf.mk
>> >> |   HOSTCC  tools/env/fw_env.o
>> >> |   HOSTCC  tools/env/fw_env_main.o
>> >> |   HOSTCC  tools/env/crc32.o
>> >> |   HOSTCC  tools/env/ctype.o
>> >> | tools/env/fw_env_main.c:30:19: fatal error: fcntl.h: No such file or directory
>> >> |  #include <fcntl.h>
>> >> |                    ^
>> >> | compilation terminated.
>> >> | In file included from tools/env/crc32.c:1:0:
>> >> | tools/env/../../lib/crc32.c:12:23: fatal error: arpa/inet.h: No such
>> >> file or directory
>> >> |  #include <arpa/inet.h>
>> >> |                        ^
>> >> | compilation terminated.
>> >> | make[1]: *** [tools/env/fw_env_main.o] Error 1
>> >> | make[1]: *** Waiting for unfinished jobs....
>> >> | make[1]: *** [tools/env/crc32.o] Error 1
>> >> | tools/env/fw_env.c:16:19: fatal error: fcntl.h: No such file or directory
>> >> |  #include <fcntl.h>
>> >> |                    ^
>> >> | compilation terminated.
>> >> | make[1]: *** [tools/env/fw_env.o] Error 1
>> >> | make: *** [env] Error 2
>> >> | ERROR: oe_runmake failed
>> >> | WARNING: exit code 1 from a shell command.
>> >> | ERROR: Function failed: do_compile (log file is located at
>> >> /home/rapphil/work/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot-fw-utils-cross/v2015.01+gitAUTOINC+92fa7f53f1-r0/temp/log.do_compile.31549)
>> >> ERROR: Task 6 (/home/rapphil/work/poky/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb,
>> >> do_compile) failed with exit code '1'
>> >> NOTE: Tasks Summary: Attempted 658 tasks of which 656 didn't need to
>> >> be rerun and 1 failed.
>> >> No currently running tasks (658 of 661)
>> >>
>> >> Summary: 1 task failed:
>> >>   /home/rapphil/work/poky/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb,
>> >> do_compile
>> >>
>> >> On Wed, Jan 21, 2015 at 6:11 PM, Otavio Salvador
>> >> <otavio@ossystems.com.br> wrote:
>> >> > On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> >> >> On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
>> >> >>> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> >> >>> > From: Denys Dmytriyenko <denys@ti.com>
>> >> >>> >
>> >> >>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >> >>> ...
>> >> >>> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
>> >> >>> > @@ -0,0 +1,36 @@
>> >> >>> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
>> >> >>> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> >> >>> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
>> >> >>> > +Subject: [PATCH] tools: env: fix build error
>> >> >>> > +
>> >> >>> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
>> >> >>> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
>> >> >>> > +is defined.
>> >> >>> > +(I do not think this is the right way to fix the problem, but
>> >> >>> > +for now I do not have enough time to take a close look.)
>> >> >>> > +
>> >> >>> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
>> >> >>> > +
>> >> >>> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> >> >>> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
>> >> >>>
>> >> >>> Is it necessary? In meta-fsl-arm we don't have this patch and get the
>> >> >>> tools built.
>> >> >>
>> >> >> Really? The patch above is rather self-explanatory. The issue was confirmed by
>> >> >> U-boot maintainers and the workaround provided by one of the core developers.
>> >> >> I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
>> >> >> defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
>> >> >> whether your platforms are affected or not. It does affect our platforms
>> >> >> (among many others), including beaglebone.
>> >> >
>> >> > I think this is for the cross tool only.
>> >> >
>> >> > --
>> >> > Otavio Salvador                             O.S. Systems
>> >> > http://www.ossystems.com.br        http://code.ossystems.com.br
>> >> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>
>>

