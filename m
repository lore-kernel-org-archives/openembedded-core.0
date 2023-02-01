Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A8EC77B6C
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30354.1675272854482428714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MC7KCLbj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b214c-eec11a7f-0a64-4dd2-b115-dd16b0e16346-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1BrDQsd/zSjhrDyy9UFCCwLMdep3Yp1kh9EumoIUCFw=;
	b=MC7KCLbjyzD0BJWrpcBi+kcDljU6+ycSKZgq4wsB53jUYvi8PUHMkNkAWaYr3xlT
	JSyfS21rqof5D9lWbAcCMEj0yhVpkvSdn8XcK60/cf8Y4W8lFODPpQ/sf7FubcGpmaE
	yDjF/yEY9uQoZrvhFY8+Bs3Jsj3BuztJrTsdF/so=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1BrDQsd/zSjhrDyy9UFCCwLMdep3Yp1kh9EumoIUCFw=;
	b=JXOhI6rnXj2EJcbsF2G+Vq7ATvWrpqYMDE37AZyJYKNMVqSg095aBekyNzeN5/JA
	v7P4bhpUtrtnewG6VYQz50XDhBW4sftKtNcIA5o+bCy0CpbmVMqJci5GpP9sGhn6WZd
	8yxuKRIREEDyL10yCiPTi4c94TxbkMv7Ekj3d99M=
Content-Type: multipart/mixed; boundary="===============4780684368011257835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.98.0 FAILED
Message-ID: <010101860e0b214c-eec11a7f-0a64-4dd2-b115-dd16b0e16346-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176611

--===============4780684368011257835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.98.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.96.5-4.98.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4780684368011257835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d392272177be9e72292855280b2fabb65c2cdaf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 18 Mirrors 0 Missed 7 Current 135 (72% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 622 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_fetch)
NOTE: recipe lsof-4.98.0-r0: task do_fetch: Started
NOTE: recipe lsof-4.98.0-r0: task do_fetch: Succeeded
NOTE: Running task 645 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_unpack)
NOTE: Running task 646 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lsof-4.98.0-r0: task do_unpack: Started
NOTE: recipe lsof-4.98.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lsof-4.98.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lsof-4.98.0-r0: task do_unpack: Succeeded
NOTE: Running task 647 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_patch)
NOTE: recipe lsof-4.98.0-r0: task do_patch: Started
NOTE: recipe lsof-4.98.0-r0: task do_patch: Succeeded
NOTE: Running task 648 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 649 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_populate_lic)
NOTE: recipe lsof-4.98.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lsof-4.98.0-r0: task do_populate_lic: Started
NOTE: recipe lsof-4.98.0-r0: task do_populate_lic: Succeeded
NOTE: recipe lsof-4.98.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 650 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_configure)
NOTE: recipe lsof-4.98.0-r0: task do_configure: Started
NOTE: recipe lsof-4.98.0-r0: task do_configure: Succeeded
NOTE: Running task 651 of 658 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_compile)
NOTE: recipe lsof-4.98.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 CC=i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot CFGL=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L./lib -llsof DEBUG= INCL= -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=
| (cd lib; make DEBUG="" CFGF="-DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\"")
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dfile.o dfile.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dmnt.o dmnt.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dnode.o dnode.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dproc.o dproc.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dsock.o dsock.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o dstore.o dstore.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o arg.o arg.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o main.o main.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o misc.o misc.c
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git/lib'
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o ckkv.o ckkv.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o node.o node.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o cvfs.o cvfs.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o print.o print.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o dvch.o dvch.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o proc.o proc.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o fino.o fino.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o store.o store.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o isfn.o isfn.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o lkud.o lkud.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o util.o util.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o pdvn.o pdvn.c
| Constructing version.h
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o prfp.o prfp.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o ptti.o ptti.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rdev.o rdev.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o regex.o regex.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rmnt.o rmnt.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rnam.o rnam.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rnch.o rnch.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rnmh.o rnmh.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o rnmt.o rnmt.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/h
 ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=     -c -o snpf.o snpf.c
| fino.c:42:10: fatal error: machine.h: No such file or directory
|    42 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| isfn.c:57:10: fatal error: machine.h: No such file or directory
|    57 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| dvch.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| ckkv.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: fino.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| prfp.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: dvch.o] Error 1
| ptti.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: isfn.o] Error 1
| rmnt.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| rnam.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: ckkv.o] Error 1
| lkud.c:42:10: fatal error: machine.h: No such file or directory
|    42 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: prfp.o] Error 1
| make[1]: *** [<builtin>: ptti.o] Error 1
| rdev.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| rnmt.c:16:10: fatal error: machine.h: No such file or directory
|    16 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: rmnt.o] Error 1
| rnch.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: rnam.o] Error 1
| pdvn.c:33:10: fatal error: machine.h: No such file or directory
|    33 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: rdev.o] Error 1
| make[1]: *** [<builtin>: rnmt.o] Error 1
| make[1]: *** [<builtin>: lkud.o] Error 1
| make[1]: *** [<builtin>: rnch.o] Error 1
| make[1]: *** [<builtin>: pdvn.o] Error 1
| rnmh.c:34:10: fatal error: machine.h: No such file or directory
|    34 | #include "machine.h"
|       |          ^~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: rnmh.o] Error 1
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=236 -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefi
 x-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git=/usr/src/debug/lsof/4.98.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot-native=       -c -o usage.o usage.c
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/git/lib'
| make: *** [Makefile:94: lib/liblsof.a] Error 2
| make: *** Waiting for unfinished jobs....
| main.c: In function 'main':
| main.c:68:15: warning: unused variable 'fmtr' [-Wunused-variable]
|    68 |         char *fmtr = (char *)NULL;
|       |               ^~~~
| print.c: In function 'human_readable_size':
| print.c:2872:13: warning: unused variable 'len' [-Wunused-variable]
|  2872 |         int len;
|       |             ^~~
| print.c: In function 'printiproto':
| print.c:2019:63: warning: '%d' directive output may be truncated writing between 1 and 9 bytes into a region of size 7 [-Wformat-truncation=]
|  2019 |                 (void) snpf(Lf->iproto, sizeof(Lf->iproto), "*%d?", p % (m/10));
|       |                                                               ^~
| print.c:2019:61: note: directive argument in the range [0, 214748363]
|  2019 |                 (void) snpf(Lf->iproto, sizeof(Lf->iproto), "*%d?", p % (m/10));
|       |                                                             ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot/usr/include/stdio.h:906,
|                  from lsof.h:61,
|                  from print.c:32:
| In function 'snprintf',
|     inlined from 'printiproto' at print.c:2019:10:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 12 bytes into a destination of size 8
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504, line 170
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504, line 154
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504, line 149
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504, line 183
NOTE: recipe lsof-4.98.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 651 tasks of which 643 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lsof-4.98.0-r0 do_compile: oe_runmake failed
ERROR: lsof-4.98.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/run.do_compile.161504', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lsof/4.98.0-r0/temp/log.do_compile.161504
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lsof/lsof_4.98.0.bb:do_compile) failed with exit code '1'

--===============4780684368011257835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.96.5-4.98.0.patch"

RnJvbSA4NjVkOTJlMmE5YjRhMjY1NzE2N2ZiY2UwYjFkMjkyOGUwMzBkM2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzoxNzoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45Ni41IC0+IDQuOTguMAoKLS0tCiAuLi4vbHNvZi97bHNvZl80Ljk2LjUu
YmIgPT4gbHNvZl80Ljk4LjAuYmJ9ICAgfCA0OSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHNvZi97bHNvZl80Ljk2LjUuYmIgPT4gbHNvZl80Ljk4LjAuYmJ9ICg0
MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjUu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTguMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQu
OTYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk4LjAu
YmIKaW5kZXggOWY4MDE3NmVlMS4uODdlYjY3NDExZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xzb2YvbHNvZl80Ljk4LjAuYmIKQEAgLTEsMTQgKzEsNTkgQEAKKyMgRklYTUU6IHRoZSBMSUNf
RklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRl
Jy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5k
IHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVl
IGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1l
c3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVw
ZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisj
IC0tLSAwMFJFQURNRQorIyArKysgMDBSRUFETUUKKyMgQEAgLTEsMTUgKzEsMyBAQAorIyAtTHNv
ZiBoYXMgbm8gbGljZW5zZS4gIEl0cyB1c2UgYW5kIGRpc3RyaWJ1dGlvbiBhcmUgc3ViamVjdCB0
byB0aGVzZQorIyAtdGVybXMgYW5kIGNvbmRpdGlvbnMsIGZvdW5kIGluIGVhY2ggbHNvZiBzb3Vy
Y2UgZmlsZS4gIChUaGUgY29weXJpZ2h0CisjIC15ZWFyIGluIG9yIGZvcm1hdCBvZiB0aGUgbm90
aWNlIG1heSB2YXJ5IHNsaWdodGx5LikKKyMgLQorIyAtICAgIC8qCisjIC0gICAgICogQ29weXJp
Z2h0IDIwMDIgUHVyZHVlIFJlc2VhcmNoIEZvdW5kYXRpb24sIFdlc3QgTGFmYXlldHRlLAorIyAt
ICAgICAqIEluZGlhbmEgNDc5MDcuICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAtICAgICAqCisj
IC0gICAgICogV3JpdHRlbiBieSBWaWN0b3IgQS4gQWJlbGwKKyMgLSAgICAgKgorIyAtICAgICAq
IFRoaXMgc29mdHdhcmUgaXMgbm90IHN1YmplY3QgdG8gYW55IGxpY2Vuc2Ugb2YgdGhlIEFtZXJp
Y2FuCisjIC0gICAgICogVGVsZXBob25lIGFuZCBUZWxlZ3JhcGggQ29tcGFueSBvciB0aGUgUmVn
ZW50cyBvZiB0aGUKKyMgICAgICAgKiBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEuCisjICAgICAg
ICoKKyMgICAgICAgKiBQZXJtaXNzaW9uIGlzIGdyYW50ZWQgdG8gYW55b25lIHRvIHVzZSB0aGlz
IHNvZnR3YXJlIGZvcgorIyBAQCAtMzMsMyArMjEsMTUgQEAKKyMgIAorIyAgCisjICBCdWcgUmVw
b3J0cworIyArPT09PT09PT09PT0KKyMgKworIyArTm93IHRoYXQgdGhlIG9ibGlnYXRvcnkgZGlz
Y2xhaW1lciBpcyBvdXQgb2YgdGhlIHdheSwgbGV0IG1lIGhhc3RlbiB0bworIyArYWRkIHRoYXQg
SSBhY2NlcHQgbHNvZiBidWcgcmVwb3J0cyBhbmQgdHJ5IGhhcmQgdG8gcmVzcG9uZCB0byB0aGVt
LiAgSQorIyArd2lsbCBhbHNvIGNvbnNpZGVyIGFuZCBkaXNjdXNzIHJlcXVlc3RzIGZvciBuZXcg
ZmVhdHVyZXMsIHBvcnRzIHRvIG5ldworIyArZGlhbGVjdHMsIG9yIHBvcnRzIHRvIG5ldyBPUyB2
ZXJzaW9ucy4KKyMgKworIyArUExFQVNFIERPTidUIFNFTkQgQlVHIFJFUE9SVFMgQUJPVVQgTFNP
RiBUTyBUSEUgVU5JWCBESUFMRUNUIE9SIERJQUxFQ1QKKyMgK09QVElPTiBWRU5ET1IuCisjICsK
KyMgK0F0IHdvcnN0IHN1Y2ggYnVnIHJlcG9ydHMgd2lsbCBjb25mdXNlIHRoZSB2ZW5kb3I7IGF0
IGJlc3QsIHRoZSB2ZW5kb3IKKyMgK3dpbGwgZm9yd2FyZCB0aGUgYnVnIHJlcG9ydCB0byBtZS4K
KyMgCisjCisKIFNVTU1BUlkgPSAiTGlTdCBPcGVuIEZpbGVzIHRvb2wiCiBERVNDUklQVElPTiA9
ICJMc29mIGlzIGEgVW5peC1zcGVjaWZpYyBkaWFnbm9zdGljIHRvb2wuIFwKIEl0cyBuYW1lIHN0
YW5kcyBmb3IgTGlTdCBPcGVuIEZpbGVzLCBhbmQgaXQgZG9lcyBqdXN0IHRoYXQuIgogSE9NRVBB
R0UgPSAiaHR0cDovL3Blb3BsZS5mcmVlYnNkLm9yZy9+YWJlLyIKIFNFQ1RJT04gPSAiZGV2ZWwi
CiBMSUNFTlNFID0gIlNwZW5jZXItOTQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly8wMFJF
QURNRTtiZWdpbmxpbmU9NjQ1O2VuZGxpbmU9Njc5O21kNT05NjRkZjI3NWQyNjQyOWJhM2IzOWRi
YjlmMjA1MTcyYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLzAwUkVBRE1FO2JlZ2lubGlu
ZT02NDU7ZW5kbGluZT02Nzk7bWQ1PWM5ZjQ0OGE5MDU2NjVhNjMwZGUzMmQ2ODU0NzExZjhkIgog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbHNvZi1vcmcvbHNvZjticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1ob3N0LWluZm9ybWF0
aW9uLnBhdGNoIgotU1JDUkVWID0gIjg5ODkxNmQ0YzdjMzkwZWE0NjEwYWViYWYxZDMyYjhhM2M0
OWYyNmIiCitTUkNSRVYgPSAiNTQ2ZWIxYzk5MTBlN2MxMzdmZGZmNTUxNjgzYzM1YTczNjAyMWUw
NSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zNy4zCgo=

--===============4780684368011257835==--

