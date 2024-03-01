Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90858C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36638.1709330717232964727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TUgEDXjH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P3rXiYby;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd7a8-ebdea2bf-435b-4cf3-bd23-3f466432f902-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wtNLXZtSnTSU3HySspBLtIsJjPswFvyXSDFeuHplBMQ=;
	b=TUgEDXjHSAq/pqpXAEV7Jay56Cr4m5tFFvl1c214VLW/n0uqlJ51FMdBQtsQ4RPc
	xQHYyN4dDui4qxz9ZEZB77e9gzLBT+PgyDeNjCxqoTMQjEYJ7VZ8RjE23ZAbQC73UCm
	Wqb/xyRs7LucBIAhCn0dbdSIJSjAUK42/dAKFsT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wtNLXZtSnTSU3HySspBLtIsJjPswFvyXSDFeuHplBMQ=;
	b=P3rXiYbyxIur2dqm9R05k6W6Zr4WmyrLTchzaZKKBA04ejz1DvdMf2OEoo+V5YoW
	mQYtuzncLw3IDr0vmlHXAX3TgVfkTOiPg0MmhwdxLf/I/gmfOaDd6y8YgOtOEtg45xP
	/QqtldO4sAFY7thKU+3q566c73waNAZnRJBxepHc=
Content-Type: multipart/mixed; boundary="===============6844680371823721701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.3 FAILED
Message-ID: <0101018dfc0cd7a8-ebdea2bf-435b-4cf3-bd23-3f466432f902-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196509

--===============6844680371823721701==
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
From e2a0bdfe14a8646ff673bc07758384e85060b59a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 14:51:30 +0000
Subject: [PATCH] lsof: upgrade 4.98.0 -> 4.99.3

---
 .../lsof/files/remove-host-information.patch     | 16 ++++++++++++----
 .../lsof/{lsof_4.98.0.bb => lsof_4.99.3.bb}      |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.98.0.bb => lsof_4.99.3.bb} (96%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index fb90366ffa..d036e8df0d 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,14 +1,22 @@
+From a4b2baf164664199c4e3cdc0a22ac9bd5981b3cb Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 30 Aug 2017 15:05:16 +0800
+Subject: [PATCH] lsof: remove host information from version.h
+
 lsof doesn't embed the username or hostname in the build if SOURCE_DATE_EPOCH is
 defined, but this still embeds build paths.  Delete all of the host details to
 ensure that no host information is leaked into the binary.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ lib/dialects/linux/Makefile | 69 ++++++-------------------------------
+ 1 file changed, 11 insertions(+), 58 deletions(-)
 
-diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 176a4c2..ef5a633 100644
---- a/dialects/linux/Makefile
-+++ b/dialects/linux/Makefile
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


--===============6844680371823721701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a30b04fc3d291640473f5bae89f1a138b5986fec"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a30b04fc3d291640473f5bae89f1a138b5986fec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 70 Local 58 Mirrors 0 Missed 12 Current 231 (82% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 807 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_recipe_qa)
NOTE: recipe lsof-4.99.3-r0: task do_recipe_qa: Started
NOTE: recipe lsof-4.99.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_recipe_qa unihash changed to beeb5d301ef6d8e84e8495f817ca7339f1be119d07b5f8770c6d647dc09efa3a
NOTE: Setscene tasks completed
NOTE: Running task 888 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_fetch)
NOTE: recipe lsof-4.99.3-r0: task do_fetch: Started
NOTE: recipe lsof-4.99.3-r0: task do_fetch: Succeeded
NOTE: Running task 889 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_unpack)
NOTE: Running task 890 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lsof-4.99.3-r0: task do_unpack: Started
NOTE: recipe lsof-4.99.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lsof-4.99.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lsof-4.99.3-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_patch)
NOTE: Running task 892 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_collect_spdx_deps)
NOTE: recipe lsof-4.99.3-r0: task do_patch: Started
NOTE: recipe lsof-4.99.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe lsof-4.99.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lsof-4.99.3-r0: task do_patch: Succeeded
NOTE: Running task 893 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 894 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_populate_lic)
NOTE: recipe lsof-4.99.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lsof-4.99.3-r0: task do_populate_lic: Started
NOTE: recipe lsof-4.99.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_populate_lic unihash changed to 24f628ed549deea32b6d59db833cd69b5c12b545461238584acf564b634ecef8
NOTE: recipe lsof-4.99.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_deploy_source_date_epoch unihash changed to b848099b07477888958eca27366c657b18c010ffc8969d78b26bad2b98939324
NOTE: Setscene tasks completed
NOTE: Running task 895 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_configure)
NOTE: recipe lsof-4.99.3-r0: task do_configure: Started
NOTE: recipe lsof-4.99.3-r0: task do_configure: Succeeded
NOTE: Running task 896 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile)
NOTE: recipe lsof-4.99.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot CFGL=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tm
 p/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L./lib -llsof DEBUG= INCL= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokyb
 uild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..
| (cd lib; make DEBUG="" CFGF="-DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\"")
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dfile.o dfile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dmnt.o dmnt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dnode.o dnode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dprint.o dprint.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dproc.o dproc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dsock.o dsock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o dstore.o dstore.c
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git/lib'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o ckkv.o ckkv.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o cvfs.o cvfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o dvch.o dvch.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o fino.o fino.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o isfn.o isfn.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o lkud.o lkud.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-
 prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..      -c -o arg.o arg.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o lsof.o lsof.c
| dprint.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=239% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-m
 ap=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git=/usr/src/debug/lsof/4.99.3  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/recipe-sysroot-native=  -I..    -c -o misc.o misc.c
| dmnt.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dproc.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dnode.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dfile.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| In file included from ckkv.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from cvfs.c:42:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from fino.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: ckkv.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [<builtin>: cvfs.o] Error 1
| make: *** [<builtin>: dfile.o] Error 1
| make: *** Waiting for unfinished jobs....
| make: *** [<builtin>: dmnt.o] Error 1
| make: *** [<builtin>: dnode.o] Error 1
| make: *** [<builtin>: dproc.o] Error 1
| make: *** [<builtin>: dprint.o] Error 1
| dsock.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| In file included from lsof.c:34:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: fino.o] Error 1
| In file included from lkud.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from misc.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make: *** [<builtin>: dsock.o] Error 1
| In file included from dvch.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: misc.o] Error 1
| In file included from isfn.c:54:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: lkud.o] Error 1
| make[1]: *** [<builtin>: dvch.o] Error 1
| dstore.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: lsof.o] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/git/lib'
| make[1]: *** [<builtin>: isfn.o] Error 1
| arg.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make: *** [Makefile:96: lib/liblsof.a] Error 2
| make: *** [<builtin>: dstore.o] Error 1
| make: *** [<builtin>: arg.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750, line 169
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750, line 153
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750, line 148
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750, line 143
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750, line 182
NOTE: recipe lsof-4.99.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 896 tasks of which 886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301145103.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301145103.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lsof-4.99.3-r0 do_compile: oe_runmake failed
ERROR: lsof-4.99.3-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/run.do_compile.1879750', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.3/temp/log.do_compile.1879750
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.3.bb:do_compile) failed with exit code '1'

--===============6844680371823721701==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.98.0-4.99.3.patch"

RnJvbSBlMmEwYmRmZTE0YTg2NDZmZjY3M2JjMDc3NTgzODRlODUwNjBiNTlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNDo1MTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45OC4wIC0+IDQuOTkuMwoKLS0tCiAuLi4vbHNvZi9maWxlcy9yZW1vdmUt
aG9zdC1pbmZvcm1hdGlvbi5wYXRjaCAgICAgfCAxNiArKysrKysrKysrKystLS0tCiAuLi4vbHNv
Zi97bHNvZl80Ljk4LjAuYmIgPT4gbHNvZl80Ljk5LjMuYmJ9ICAgICAgfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTguMC5iYiA9PiBsc29mXzQuOTkuMy5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9maWxlcy9yZW1v
dmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2Zp
bGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCmluZGV4IGZiOTAzNjZmZmEuLmQwMzZl
OGRmMGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92
ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCkBAIC0xLDE0ICsxLDIyIEBACitG
cm9tIGE0YjJiYWYxNjQ2NjQxOTljNGUzY2RjMGEyMmFjOWJkNTk4MWIzY2IgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KK0Rh
dGU6IFdlZCwgMzAgQXVnIDIwMTcgMTU6MDU6MTYgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gbHNv
ZjogcmVtb3ZlIGhvc3QgaW5mb3JtYXRpb24gZnJvbSB2ZXJzaW9uLmgKKwogbHNvZiBkb2Vzbid0
IGVtYmVkIHRoZSB1c2VybmFtZSBvciBob3N0bmFtZSBpbiB0aGUgYnVpbGQgaWYgU09VUkNFX0RB
VEVfRVBPQ0ggaXMKIGRlZmluZWQsIGJ1dCB0aGlzIHN0aWxsIGVtYmVkcyBidWlsZCBwYXRocy4g
IERlbGV0ZSBhbGwgb2YgdGhlIGhvc3QgZGV0YWlscyB0bwogZW5zdXJlIHRoYXQgbm8gaG9zdCBp
bmZvcm1hdGlvbiBpcyBsZWFrZWQgaW50byB0aGUgYmluYXJ5LgogCiBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPgorLS0tCisgbGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlIHwgNjkgKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCA1OCBkZWxldGlvbnMoLSkKIAotZGlmZiAtLWdpdCBhL2RpYWxlY3RzL2xpbnV4L01h
a2VmaWxlIGIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKLWluZGV4IDE3NmE0YzIuLmVmNWE2MzMg
MTAwNjQ0Ci0tLS0gYS9kaWFsZWN0cy9saW51eC9NYWtlZmlsZQotKysrIGIvZGlhbGVjdHMvbGlu
dXgvTWFrZWZpbGUKK2RpZmYgLS1naXQgYS9saWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUgYi9s
aWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKK2luZGV4IGY4YWRhYTYuLjdhNzljYTcgMTAwNjQ0
CistLS0gYS9saWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKKysrKyBiL2xpYi9kaWFsZWN0cy9s
aW51eC9NYWtlZmlsZQogQEAgLTgzLDY0ICs4MywxNyBAQCAke0xJQn06IEZSQwogIHZlcnNpb24u
aDoJRlJDCiAgCUBlY2hvIENvbnN0cnVjdGluZyB2ZXJzaW9uLmgKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OC4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xzb2YvbHNvZl80Ljk5LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk4LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS4zLmJiCmluZGV4IDgzNWNlM2I4ZGYuLmZh
ZGFmYzg2ZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45
OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS4zLmJiCkBA
IC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hNDhh
Yzk3YTg1NTBlZmYxMjM5NWEyYzBkNjE1MTUxMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2xzb2Ytb3JnL2xzb2Y7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCIKLVNSQ1JFViA9ICI1NDZl
YjFjOTkxMGU3YzEzN2ZkZmY1NTE2ODNjMzVhNzM2MDIxZTA1IgorU1JDUkVWID0gIjJlNGM3YTFh
OWJjNzI1OGRjNWI2YTNhYjI4ZWJjYTQ0MTc0Mjc5YTgiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQi
CiAKLS0gCjIuNDIuMAoK

--===============6844680371823721701==--

