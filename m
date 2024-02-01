Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78E4C48297
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2120.1706810407169193315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bEaBaPK9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GPdveGHy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3f5f8-42b8f8eb-39c9-434b-893d-3ac754e0a923-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NbkEGL+iKrVWfhXLWZgCrasoVje8Xr0xHA9QYxlR8GQ=;
	b=bEaBaPK980Pl9qVscIRs2NXN61sho+yi2ms4vv5kfNPrU8BVYWZ47NQwbrDsxMMZ
	z8Ed0Td7MWlrGwWBVoet8VfQDlPEZZI+sZJszjUkbKlUvqtGyfJq1S8Q9Q8AHOA2bCY
	Hi9IohWDSbw9d5j4fRcuFH62y5i6pcpMGCTf6pRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NbkEGL+iKrVWfhXLWZgCrasoVje8Xr0xHA9QYxlR8GQ=;
	b=GPdveGHy10eX1iSIpxsk2h2R/OKZwbc8JQUshZbIbph59GnQU8o5eQ66HDanuiRh
	9o6XbCouaJamaD/afW7Yd9TZSwF9Nu3Cq2KqhRXTiTAEFE8bIMgQuouSBNn15V9Fm86
	4my9ibVmiu4sugt98liPyVKEVL2j/rvP1HZ34Yrk=
Content-Type: multipart/mixed; boundary="===============0501279269928184791=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.3 FAILED
Message-ID: <0101018d65d3f5f8-42b8f8eb-39c9-434b-893d-3ac754e0a923-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194671

--===============0501279269928184791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.99.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.98.0-4.99.3.patch
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

-- >8 --
From 5c657e2f4e6d91ea7983f45d6ca6fc8df157d236 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 11:01:46 +0000
Subject: [PATCH] lsof: upgrade 4.98.0 -> 4.99.3

---
 .../lsof/files/remove-host-information.patch    | 17 +++++++++++++----
 .../lsof/{lsof_4.98.0.bb => lsof_4.99.3.bb}     |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.98.0.bb => lsof_4.99.3.bb} (96%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index fb90366ffa..46e0417b0f 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,3 +1,8 @@
+From 8141a3f8fe91f818540facf7ae10d804006a293c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 30 Aug 2017 15:05:16 +0800
+Subject: [PATCH] lsof: remove host information from version.h
+
 lsof doesn't embed the username or hostname in the build if SOURCE_DATE_EPOCH is
 defined, but this still embeds build paths.  Delete all of the host details to
 ensure that no host information is leaked into the binary.
@@ -5,10 +10,14 @@ ensure that no host information is leaked into the binary.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 176a4c2..ef5a633 100644
---- a/dialects/linux/Makefile
-+++ b/dialects/linux/Makefile
+---
+ lib/dialects/linux/Makefile | 69 ++++++-------------------------------
+ 1 file changed, 11 insertions(+), 58 deletions(-)
+
+diff --git a/lib/dialects/linux/Makefile b/lib/dialects/linux/Makefile
+index f8adaa6..7a79ca7 100644
+--- a/lib/dialects/linux/Makefile
++++ b/lib/dialects/linux/Makefile
 @@ -83,64 +83,17 @@ ${LIB}: FRC
  version.h:	FRC
  	@echo Constructing version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.98.0.bb b/meta/recipes-extended/lsof/lsof_4.99.3.bb
similarity index 96%
rename from meta/recipes-extended/lsof/lsof_4.98.0.bb
rename to meta/recipes-extended/lsof/lsof_4.99.3.bb
index 835ce3b8df..fadafc86dd 100644
--- a/meta/recipes-extended/lsof/lsof_4.98.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "546eb1c9910e7c137fdff551683c35a736021e05"
+SRCREV = "2e4c7a1a9bc7258dc5b6a3ab28ebca44174279a8"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============0501279269928184791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7163c0c87be1ce89cb2f67775aa1cc6f1cfef0a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7163c0c87be1ce89cb2f67775aa1cc6f1cfef0a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 92 Local 80 Mirrors 0 Missed 12 Current 206 (86% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 797 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_recipe_qa)
NOTE: recipe lsof-4.99.3-r0: task do_recipe_qa: Started
NOTE: recipe lsof-4.99.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_fetch)
NOTE: recipe lsof-4.99.3-r0: task do_fetch: Started
NOTE: recipe lsof-4.99.3-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_unpack)
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lsof-4.99.3-r0: task do_unpack: Started
NOTE: recipe lsof-4.99.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lsof-4.99.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lsof-4.99.3-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_patch)
NOTE: Running task 882 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_collect_spdx_deps)
NOTE: recipe lsof-4.99.3-r0: task do_patch: Started
NOTE: recipe lsof-4.99.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe lsof-4.99.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lsof-4.99.3-r0: task do_patch: Succeeded
NOTE: Running task 883 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 884 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_populate_lic)
NOTE: recipe lsof-4.99.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lsof-4.99.3-r0: task do_populate_lic: Started
NOTE: recipe lsof-4.99.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_populate_lic unihash changed to 24f628ed549deea32b6d59db833cd69b5c12b545461238584acf564b634ecef8
NOTE: recipe lsof-4.99.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_deploy_source_date_epoch unihash changed to b848099b07477888958eca27366c657b18c010ffc8969d78b26bad2b98939324
NOTE: Setscene tasks completed
NOTE: Running task 885 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_configure)
NOTE: recipe lsof-4.99.3-r0: task do_configure: Started
NOTE: recipe lsof-4.99.3-r0: task do_configure: Succeeded
NOTE: Running task 886 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile)
NOTE: recipe lsof-4.99.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52 CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot CFGL=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tm
 p/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L./lib -llsof DEBUG= INCL= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokyb
 uild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..
| (cd lib; make DEBUG="" CFGF="-DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\"")
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dfile.o dfile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dmnt.o dmnt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dnode.o dnode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dprint.o dprint.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dproc.o dproc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dsock.o dsock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dstore.o dstore.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o arg.o arg.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o main.o main.c
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git/lib'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o ckkv.o ckkv.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o print.o print.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o cvfs.o cvfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o store.o store.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o dvch.o dvch.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o fino.o fino.c
| Constructing version.h
| dprint.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dfile.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dmnt.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dnode.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| compilation terminated.
| compilation terminated.
| compilation terminated.
| dproc.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dsock.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dstore.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| compilation terminated.
| make: *** [<builtin>: dmnt.o] Error 1
| arg.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| make: *** Waiting for unfinished jobs....
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o isfn.o isfn.c
| make: *** [<builtin>: dfile.o] Error 1
| main.c:33:10: fatal error: common.h: No such file or directory
|    33 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make: *** [<builtin>: dnode.o] Error 1
| make: *** [<builtin>: dprint.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o lkud.o lkud.c
| print.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| store.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make: *** [<builtin>: dproc.o] Error 1
| make: *** [<builtin>: dstore.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o lsof.o lsof.c
| make: *** [<builtin>: dsock.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o misc.o misc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o node.o node.c
| make: *** [<builtin>: arg.o] Error 1
| In file included from ckkv.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make: *** [<builtin>: main.o] Error 1
| In file included from cvfs.c:42:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o pdvn.o pdvn.c
| make: *** [<builtin>: print.o] Error 1
| make: *** [<builtin>: store.o] Error 1
| In file included from dvch.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o prfp.o prfp.c
| In file included from fino.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o print.o print.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o proc.o proc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o ptti.o ptti.c
| make[1]: *** [<builtin>: cvfs.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [<builtin>: dvch.o] Error 1
| make[1]: *** [<builtin>: ckkv.o] Error 1
| make[1]: *** [<builtin>: fino.o] Error 1
| In file included from isfn.c:54:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from lkud.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from lsof.c:34:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from misc.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from node.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: lkud.o] Error 1
| make[1]: *** [<builtin>: isfn.o] Error 1
| make[1]: *** [<builtin>: lsof.o] Error 1
| In file included from pdvn.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from prfp.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from print.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| make[1]: *** [<builtin>: misc.o] Error 1
| compilation terminated.
| make[1]: *** [<builtin>: node.o] Error 1
| In file included from proc.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: pdvn.o] Error 1
| make[1]: *** [<builtin>: prfp.o] Error 1
| make[1]: *** [<builtin>: print.o] Error 1
| make[1]: *** [<builtin>: proc.o] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git/lib'
| make: *** [Makefile:96: lib/liblsof.a] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292, line 169
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292, line 153
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292, line 148
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292, line 143
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292, line 182
NOTE: recipe lsof-4.99.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 886 tasks of which 876 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201110126.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201110126.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lsof-4.99.3-r0 do_compile: oe_runmake failed
ERROR: lsof-4.99.3-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.2425292', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/log.do_compile.2425292
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile) failed with exit code '1'

--===============0501279269928184791==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.98.0-4.99.3.patch"

RnJvbSA1YzY1N2UyZjRlNmQ5MWVhNzk4M2Y0NWQ2Y2E2ZmM4ZGYxNTdkMjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMTowMTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45OC4wIC0+IDQuOTkuMwoKLS0tCiAuLi4vbHNvZi9maWxlcy9yZW1vdmUt
aG9zdC1pbmZvcm1hdGlvbi5wYXRjaCAgICB8IDE3ICsrKysrKysrKysrKystLS0tCiAuLi4vbHNv
Zi97bHNvZl80Ljk4LjAuYmIgPT4gbHNvZl80Ljk5LjMuYmJ9ICAgICB8ICAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xzb2Yve2xzb2ZfNC45OC4wLmJiID0+IGxzb2ZfNC45OS4zLmJifSAo
OTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92
ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvZmls
ZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKaW5kZXggZmI5MDM2NmZmYS4uNDZlMDQx
N2IwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvZmlsZXMvcmVtb3Zl
LWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2Yv
ZmlsZXMvcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0Y2gKQEAgLTEsMyArMSw4IEBACitGcm9t
IDgxNDFhM2Y4ZmU5MWY4MTg1NDBmYWNmN2FlMTBkODA0MDA2YTI5M2MgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KK0RhdGU6
IFdlZCwgMzAgQXVnIDIwMTcgMTU6MDU6MTYgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gbHNvZjog
cmVtb3ZlIGhvc3QgaW5mb3JtYXRpb24gZnJvbSB2ZXJzaW9uLmgKKwogbHNvZiBkb2Vzbid0IGVt
YmVkIHRoZSB1c2VybmFtZSBvciBob3N0bmFtZSBpbiB0aGUgYnVpbGQgaWYgU09VUkNFX0RBVEVf
RVBPQ0ggaXMKIGRlZmluZWQsIGJ1dCB0aGlzIHN0aWxsIGVtYmVkcyBidWlsZCBwYXRocy4gIERl
bGV0ZSBhbGwgb2YgdGhlIGhvc3QgZGV0YWlscyB0bwogZW5zdXJlIHRoYXQgbm8gaG9zdCBpbmZv
cm1hdGlvbiBpcyBsZWFrZWQgaW50byB0aGUgYmluYXJ5LgpAQCAtNSwxMCArMTAsMTQgQEAgZW5z
dXJlIHRoYXQgbm8gaG9zdCBpbmZvcm1hdGlvbiBpcyBsZWFrZWQgaW50byB0aGUgYmluYXJ5Lgog
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIAotZGlmZiAtLWdpdCBhL2RpYWxlY3RzL2xpbnV4L01h
a2VmaWxlIGIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKLWluZGV4IDE3NmE0YzIuLmVmNWE2MzMg
MTAwNjQ0Ci0tLS0gYS9kaWFsZWN0cy9saW51eC9NYWtlZmlsZQotKysrIGIvZGlhbGVjdHMvbGlu
dXgvTWFrZWZpbGUKKy0tLQorIGxpYi9kaWFsZWN0cy9saW51eC9NYWtlZmlsZSB8IDY5ICsrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9saWIvZGlhbGVjdHMv
bGludXgvTWFrZWZpbGUgYi9saWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKK2luZGV4IGY4YWRh
YTYuLjdhNzljYTcgMTAwNjQ0CistLS0gYS9saWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKKysr
KyBiL2xpYi9kaWFsZWN0cy9saW51eC9NYWtlZmlsZQogQEAgLTgzLDY0ICs4MywxNyBAQCAke0xJ
Qn06IEZSQwogIHZlcnNpb24uaDoJRlJDCiAgCUBlY2hvIENvbnN0cnVjdGluZyB2ZXJzaW9uLmgK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk5LjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk4LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS4zLmJiCmlu
ZGV4IDgzNWNlM2I4ZGYuLmZhZGFmYzg2ZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2xzb2ZfNC45OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2xzb2ZfNC45OS4zLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1hNDhhYzk3YTg1NTBlZmYxMjM5NWEyYzBkNjE1MTUxMCIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2xzb2Ytb3JnL2xzb2Y7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRj
aCIKLVNSQ1JFViA9ICI1NDZlYjFjOTkxMGU3YzEzN2ZkZmY1NTE2ODNjMzVhNzM2MDIxZTA1Igor
U1JDUkVWID0gIjJlNGM3YTFhOWJjNzI1OGRjNWI2YTNhYjI4ZWJjYTQ0MTc0Mjc5YTgiCiAKIFMg
PSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDIuMAoK

--===============0501279269928184791==--

