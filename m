Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8F5CA9ED4
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3765.1684186747637735175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BGnpOLjM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a4f36-57d2856e-9bef-4c69-83b1-2b09b9704d99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t+ik5bUsgWosmuQmSym3Yz3ARJRscO2CzNLmInsIZFI=;
	b=BGnpOLjMa+ks82oFgtQ5HiXR4fHQ6C15PDLWdKpaorstn1tVvXvlfMXhowozup6j
	TerBa58Hm238sZMd6Uyrf/fQaClbE6vNbmdmvSc9AVCi1om3rTU473mRotZ9pVLBRb1
	vZkLxllSai3S08T8Tq49to25E5NaI8GOH1OKDUxM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t+ik5bUsgWosmuQmSym3Yz3ARJRscO2CzNLmInsIZFI=;
	b=P/65EKjX1SLM/3F9z7SlUKlJIaHQ2TN9b6pG2IRsUTiMpx+LmGXZZ7M5l77hTQTe
	DN6hChVVQjTHcNoMul6OI81Jh0HJp/T0MDcmwGfLeletC+sUguoFqbeWEVUX8goOX8Z
	xz6k9srkyd+mCgL+3HZ9s5d/e/R+lBF85B9rpxvI=
Content-Type: multipart/mixed; boundary="===============3349016749690431424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 145c74ab6f2e13a9a8ccdbbf1758afedb8a3965c FAILED
Message-ID: <01010188215a4f36-57d2856e-9bef-4c69-83b1-2b09b9704d99-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181300

--===============3349016749690431424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *145c74ab6f2e13a9a8ccdbbf1758afedb8a3965c* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============3349016749690431424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8150ae1beb5f79ae853af8d0710d9bc1102dd637"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 15 Mirrors 0 Missed 7 Current 142 (68% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 653 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_fetch: Succeeded
NOTE: Running task 671 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 672 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_unpack: Succeeded
NOTE: Running task 673 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_patch: Succeeded
NOTE: Running task 674 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 675 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_populate_lic: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 676 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_configure: Succeeded
NOTE: Running task 677 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot  -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/m
 mc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot-native=  -Wp,-MMD,./.mmc.o.d,-MT,mmc.o -c mmc.c -o mmc.o
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot  -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/m
 mc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot-native=  -Wp,-MMD,./.mmc_cmds.o.d,-MT,mmc_cmds.o -c mmc_cmds.c -o mmc_cmds.o
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot  -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/m
 mc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot-native=  -Wp,-MMD,./.lsmmc.o.d,-MT,lsmmc.o -c lsmmc.c -o lsmmc.o
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot  -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/m
 mc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot-native=  -Wp,-MMD,3rdparty/hmac_sha/.hmac_sha2.o.d,-MT,3rdparty/hmac_sha/hmac_sha2.o -c 3rdparty/hmac_sha/hmac_sha2.c -o 3rdparty/hmac_sha/hmac_sha2.o
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot  -Wall -Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/m
 mc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git=/usr/src/debug/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/recipe-sysroot-native=  -Wp,-MMD,3rdparty/hmac_sha/.sha2.o.d,-MT,3rdparty/hmac_sha/sha2.o -c 3rdparty/hmac_sha/sha2.c -o 3rdparty/hmac_sha/sha2.o
| make -C man
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git/man'
| make[1]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/git/man'
| mmc.c: In function 'help':
| mmc.c:320:26: error: 'VERSION' undeclared (first use in this function)
|   320 |         printf("\n%s\n", VERSION);
|       |                          ^~~~~~~
| mmc.c:320:26: note: each undeclared identifier is reported only once for each function it appears in
| mmc.c: In function 'parse_args':
| mmc.c:501:34: error: 'VERSION' undeclared (first use in this function)
|   501 |                 printf("\n%s\n", VERSION);
|       |                                  ^~~~~~~
| make: *** [Makefile:37: mmc.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 179
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 164
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 169
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 147
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 141
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538, line 189
NOTE: recipe mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 677 tasks of which 669 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0 do_compile: oe_runmake failed
ERROR: mmc-utils-0.1+gitAUTOINC+145c74ab6f-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/run.do_compile.3601538', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+145c74ab6f-r0/temp/log.do_compile.3601538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile) failed with exit code '1'

--===============3349016749690431424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA4MzNkMmJkMzM5MzRmNzFjYzIwNzMwZjFiYzBiNmFhY2MzNWJjYTA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDk6Mzk6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAxZTJlMTdiZmQzLi41OTkxMmEwYmRiIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJkNGMyOTEwOTgxZmY5OWI5ODM3MzQ0
MjZkZmE5OTYzMmZiODFhYzZiIgorU1JDUkVWID0gIjE0NWM3NGFiNmYyZTEzYTlhOGNjZGJiZjE3
NThhZmVkYjhhMzk2NWMiCiAKIFBWID0gIjAuMStnaXQke1NSQ1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============3349016749690431424==--

