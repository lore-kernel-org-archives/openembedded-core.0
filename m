Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC939C54EBE
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1266.1710522010923857241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FZ04OhUf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YNorGOFt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e897d-a64e731e-8dc9-4848-a0fc-1543aa46dc41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fkSejaLlBsHvWrG46HmdLmOwSAm0JpHKUbBlh2eFzu0=;
	b=FZ04OhUfDLex3BZ0dA+mSh38z5UxjBHZY2vujv6rEqJnqqcfcrd32+xlAHPA5U84
	0xbucd7lNRmqTZPohMlEN57dP1CQRVo6U1FQ5mr48eiyjBVebqhFHVGZiYJC4hf7rdS
	/09r1swMLcxeklb77dfz16lZo7AKAWekMpbyw/oA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fkSejaLlBsHvWrG46HmdLmOwSAm0JpHKUbBlh2eFzu0=;
	b=YNorGOFttigQcLshYlwxAV4A2V3BCM2D3r69PAsQLtQ2iyBxyMrj5oA5R2eNIlDm
	Z095LpGtFekM6ApIoZaV/qSS+ksWtrQJOkwQHW3puKvywfYxqcZdccPgAJoAlrH0qvw
	hfs2TyboQxU2kfbJZnxEccw8/DbAXDlh/RXUlrWg=
Content-Type: multipart/mixed; boundary="===============7418911593679625520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ifupdown: upgrading to 0.8.43 FAILED
Message-ID: <0101018e430e897d-a64e731e-8dc9-4848-a0fc-1543aa46dc41-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197151

--===============7418911593679625520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ifupdown* to *0.8.43* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ifupdown-upgrade-0.8.41-0.8.43.patch
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
From cc625f94e2c3a9bc3ebf679935d127d6c56ac690 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 05:44:32 +0000
Subject: [PATCH] ifupdown: upgrade 0.8.41 -> 0.8.43

---
 .../ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch | 3 +--
 ...-Makefile-do-not-use-dpkg-for-determining-OS-type.patch | 7 +++----
 .../files/0001-ifupdown-skip-wrong-test-case.patch         | 3 +--
 ...n2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch | 3 +--
 meta/recipes-core/ifupdown/files/tweak-ptest-script.patch  | 3 +--
 .../ifupdown/{ifupdown_0.8.41.bb => ifupdown_0.8.43.bb}    | 2 +-
 6 files changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.41.bb => ifupdown_0.8.43.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
index 6c4ed526bf..4db452f84b 100644
--- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -1,4 +1,4 @@
-From 8dfbcf02e424ba1fdef587d81c9e08a37ab8c1b6 Mon Sep 17 00:00:00 2001
+From daa3242e369d9b63424ad508e827055098be8940 Mon Sep 17 00:00:00 2001
 From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 Date: Tue, 2 Jul 2019 20:10:42 +0200
 Subject: [PATCH] Define FNM_EXTMATCH for musl
@@ -24,7 +24,6 @@ function); did you mean 'FNM_NOMATCH'?
 Upstream-Status: Submitted [https://salsa.debian.org/debian/ifupdown/merge_requests/5]
 
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-
 ---
  archcommon.h | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
index 6e15a25224..e045e4772d 100644
--- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
@@ -1,17 +1,16 @@
-From 7fe516cbaf9fda09d99dcb54d4645367cffc8a4d Mon Sep 17 00:00:00 2001
+From f8e6213826c1554117610ceb5e1e517a684473dd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Jan 2020 15:38:06 +0100
 Subject: [PATCH] Makefile: do not use dpkg for determining OS type
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 0ce2fa3..739aef2 100644
+index 9cd758b..58b4173 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
@@ -21,4 +20,4 @@ index 0ce2fa3..739aef2 100644
 +ARCH := linux
  
  BASEDIR ?= $(DESTDIR)
- 
+ PKGLIBDIR ?= /lib/ifupdown
diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
index 9ae24da51e..70b8e52cd8 100644
--- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -1,4 +1,4 @@
-From 782d8a869c266820d0f34974436f244f67afaea7 Mon Sep 17 00:00:00 2001
+From 5fb6b14bd3068700dfa90a24712b38df8439ffcc Mon Sep 17 00:00:00 2001
 From: Zqiang <qiang.zhang@windriver.com>
 Date: Mon, 19 Apr 2021 14:15:45 +0800
 Subject: [PATCH] ifupdown: skip wrong test case
@@ -10,7 +10,6 @@ and are skipped directly.
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Zqiang <qiang.zhang@windriver.com>
-
 ---
  tests/testbuild-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index 7b4b761e6a..0a888d2534 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,4 +1,4 @@
-From fc8e8d4cb19ff30e69aa1855332544f1017f974c Mon Sep 17 00:00:00 2001
+From f81618da4b54c84220f9afe84610cda08d714e6a Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Wed, 6 Aug 2014 14:54:12 -0400
 Subject: [PATCH] defn2[c|man]: don't rely on dpkg-architecture to set arch
@@ -13,7 +13,6 @@ like the loopback device not being configured/enabled.
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 Upstream-Status: Pending
-
 ---
  defn2c.pl   | 6 +++---
  defn2man.pl | 6 +++---
diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
index fa6bb84df3..aeb97d2123 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -1,4 +1,4 @@
-From a6bb2ac5f521c678abbbdb1960d28f750f4357a6 Mon Sep 17 00:00:00 2001
+From 9ec2bc6e0bce72862acef5fa43df52752905fd06 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Mon, 3 Feb 2020 17:33:11 +0800
 Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
@@ -7,7 +7,6 @@ Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  tests/testbuild-linux | 11 ++++++-----
  1 file changed, 6 insertions(+), 5 deletions(-)
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
index 16425ea9e4..3e95a09d16 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://tweak-ptest-script.patch \
            "
-SRCREV = "369d9d3c13a0c56ad09fd4f13b4a80eb9a94e270"
+SRCREV = "cf86ad5819aba8f9b020a95257c9a8c4911b1c85"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============7418911593679625520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-e84a609b917a28596f9cdf9c29f25b762b990819"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e84a609b917a28596f9cdf9c29f25b762b990819"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 159 Local 145 Mirrors 0 Missed 14 Current 248 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 903 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_recipe_qa)
NOTE: recipe ifupdown-0.8.43-r0: task do_recipe_qa: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1154 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_fetch)
NOTE: recipe ifupdown-0.8.43-r0: task do_fetch: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_unpack)
NOTE: Running task 1156 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe ifupdown-0.8.43-r0: task do_unpack: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ifupdown-0.8.43-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_patch)
NOTE: Running task 1158 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_collect_spdx_deps)
NOTE: recipe ifupdown-0.8.43-r0: task do_patch: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ifupdown-0.8.43-r0: task do_patch: Succeeded
NOTE: Running task 1159 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_deploy_source_date_epoch)
NOTE: Running task 1160 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_populate_lic)
NOTE: recipe ifupdown-0.8.43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_populate_lic: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_populate_lic: Succeeded
NOTE: recipe ifupdown-0.8.43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1161 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_configure)
NOTE: recipe ifupdown-0.8.43-r0: task do_configure: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_configure: Succeeded
NOTE: Running task 1162 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_configure_ptest_base)
NOTE: recipe ifupdown-0.8.43-r0: task do_configure_ptest_base: Started
NOTE: recipe ifupdown-0.8.43-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1163 of 1176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_compile)
NOTE: recipe ifupdown-0.8.43-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o main.o main.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o addrfam.o addrfam.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o execute.o execute.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o config.o config.c
| ./defn2c.pl inet.defn > inet.c
| ./defn2c.pl ipx.defn > ipx.c
| ./defn2c.pl inet6.defn > inet6.c
| ./defn2c.pl can.defn > can.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o archcommon.o archcommon.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o archlinux.o archlinux.c
| ./defn2c.pl meta.defn > meta.c
| ./defn2c.pl link.defn > link.c
| ln -sf ifup.8 ifdown.8
| ln -sf ifup.8 ifquery.8
| ./defn2man.pl inet.defn > inet.man
| ./defn2man.pl ipx.defn > ipx.man
| ./defn2man.pl inet6.defn > inet6.man
| ./defn2man.pl can.defn > can.man
| Use of uninitialized value $line in pattern match (m//) at ./defn2c.pl line 40, <> line 30.
| Use of uninitialized value $line in pattern match (m//) at ./defn2c.pl line 40, <> line 30.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o ipx.o ipx.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o can.o can.c
| Use of uninitialized value $line in pattern match (m//) at ./defn2c.pl line 40, <> line 7.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o meta.o meta.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o inet.o inet.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o link.o link.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o inet6.o inet6.c
| sed -e '/^##ADDRESSFAM##$/r inet.man' -e '/^##ADDRESSFAM##$/r ipx.man' -e '/^##ADDRESSFAM##$/r inet6.man' -e '/^##ADDRESSFAM##$/r can.man' \
|      -e '/^##ADDRESSFAM##$/d' < interfaces.5.pre > interfaces.5
| ipx.c: In function '_static_rename':
| ipx.c:27:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    27 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| ipx.c:27:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    27 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| can.c: In function '_static_rename':
| ipx.c: In function '_dynamic_rename':
| ipx.c:46:44: warning: unused parameter 'ifd' [-Wunused-parameter]
|    46 | static int _dynamic_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                            ~~~~~~~~~~~~~~~~^~~
| ipx.c:46:57: warning: unused parameter 'exec' [-Wunused-parameter]
|    46 | static int _dynamic_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                 ~~~~~~~~^~~~
| can.c:48:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    48 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| can.c:48:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    48 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| meta.c: In function '_none_up':
| meta.c:15:37: warning: unused parameter 'ifd' [-Wunused-parameter]
|    15 | static int _none_up(interface_defn *ifd, execfn *exec) {
|       |                     ~~~~~~~~~~~~~~~~^~~
| meta.c:15:50: warning: unused parameter 'exec' [-Wunused-parameter]
|    15 | static int _none_up(interface_defn *ifd, execfn *exec) {
|       |                                          ~~~~~~~~^~~~
| meta.c: In function '_none_down':
| meta.c:18:39: warning: unused parameter 'ifd' [-Wunused-parameter]
|    18 | static int _none_down(interface_defn *ifd, execfn *exec) {
|       |                       ~~~~~~~~~~~~~~~~^~~
| meta.c:18:52: warning: unused parameter 'exec' [-Wunused-parameter]
|    18 | static int _none_down(interface_defn *ifd, execfn *exec) {
|       |                                            ~~~~~~~~^~~~
| meta.c: In function '_none_rename':
| meta.c:21:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|    21 | static int _none_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| meta.c:21:54: warning: unused parameter 'exec' [-Wunused-parameter]
|    21 | static int _none_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet.c: In function '_loopback_rename':
| inet.c:27:45: warning: unused parameter 'ifd' [-Wunused-parameter]
|    27 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                             ~~~~~~~~~~~~~~~~^~~
| inet.c:27:58: warning: unused parameter 'exec' [-Wunused-parameter]
|    27 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                  ~~~~~~~~^~~~
| inet.c: In function '_static_rename':
| inet.c:68:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    68 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:68:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    68 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c: In function '_manual_rename':
| inet.c:97:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    97 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:97:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    97 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_auto_rename':
| inet6.c:67:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|    67 | static int _auto_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet6.c:67:54: warning: unused parameter 'exec' [-Wunused-parameter]
|    67 | static int _auto_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet.c: In function '_dhcp_rename':
| inet.c:143:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|   143 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet6.c: In function '_loopback_rename':
| inet.c:143:54: warning: unused parameter 'exec' [-Wunused-parameter]
|   143 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet6.c:92:45: warning: unused parameter 'ifd' [-Wunused-parameter]
|    92 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                             ~~~~~~~~~~~~~~~~^~~
| inet6.c:92:58: warning: unused parameter 'exec' [-Wunused-parameter]
|    92 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                  ~~~~~~~~^~~~
| inet.c: In function '_bootp_rename':
| inet.c:163:42: warning: unused parameter 'ifd' [-Wunused-parameter]
|   163 | static int _bootp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                          ~~~~~~~~~~~~~~~~^~~
| inet.c:163:55: warning: unused parameter 'exec' [-Wunused-parameter]
|   163 | static int _bootp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                               ~~~~~~~~^~~~
| inet.c: In function '_tunnel_rename':
| inet.c:192:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   192 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:192:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   192 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_static_rename':
| inet6.c:159:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   159 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c: In function '_ppp_rename':
| inet6.c:159:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   159 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c:211:40: warning: unused parameter 'ifd' [-Wunused-parameter]
|   211 | static int _ppp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                        ~~~~~~~~~~~~~~~~^~~
| inet.c:211:53: warning: unused parameter 'exec' [-Wunused-parameter]
|   211 | static int _ppp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                             ~~~~~~~~^~~~
| inet.c: In function '_wvdial_rename':
| inet6.c: In function '_manual_rename':
| inet.c:232:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   232 | static int _wvdial_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet6.c:188:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   188 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet6.c:188:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   188 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c:232:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   232 | static int _wvdial_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c: In function '_ipv4ll_rename':
| inet.c:251:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   251 | static int _ipv4ll_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:251:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   251 | static int _ipv4ll_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_dhcp_rename':
| inet6.c:242:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|   242 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet6.c:242:54: warning: unused parameter 'exec' [-Wunused-parameter]
|   242 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet6.c: In function '_tunnel_rename':
| inet6.c:277:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   277 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet6.c:277:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   277 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_v4tunnel_rename':
| inet6.c:314:45: warning: unused parameter 'ifd' [-Wunused-parameter]
|   314 | static int _v4tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                             ~~~~~~~~~~~~~~~~^~~
| inet6.c:314:58: warning: unused parameter 'exec' [-Wunused-parameter]
|   314 | static int _v4tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                  ~~~~~~~~^~~~
| inet6.c: In function '_6to4_rename':
| inet6.c:355:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|   355 | static int _6to4_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet6.c:355:54: warning: unused parameter 'exec' [-Wunused-parameter]
|   355 | static int _6to4_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| archcommon.c: In function 'cleanup_hwaddress':
| archcommon.c:82:40: warning: unused parameter 'ifd' [-Wunused-parameter]
|    82 | void cleanup_hwaddress(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                        ~~~~~~~~~~~~~~~~^~~
| archcommon.c:82:64: warning: unused parameter 'argc' [-Wunused-parameter]
|    82 | void cleanup_hwaddress(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                            ~~~~^~~~
| archcommon.c:82:77: warning: unused parameter 'argv' [-Wunused-parameter]
|    82 | void cleanup_hwaddress(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                      ~~~~~~~^~~~
| archcommon.c: In function 'make_hex_address':
| archcommon.c:120:39: warning: unused parameter 'ifd' [-Wunused-parameter]
|   120 | void make_hex_address(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                       ~~~~~~~~~~~~~~~~^~~
| archcommon.c:120:63: warning: unused parameter 'argc' [-Wunused-parameter]
|   120 | void make_hex_address(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                           ~~~~^~~~
| archcommon.c:120:76: warning: unused parameter 'argv' [-Wunused-parameter]
|   120 | void make_hex_address(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                     ~~~~~~~^~~~
| archcommon.c: In function 'compute_v4_addr':
| archcommon.c:134:38: warning: unused parameter 'ifd' [-Wunused-parameter]
|   134 | void compute_v4_addr(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                      ~~~~~~~~~~~~~~~~^~~
| archcommon.c:134:62: warning: unused parameter 'argc' [-Wunused-parameter]
|   134 | void compute_v4_addr(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                          ~~~~^~~~
| archcommon.c:134:75: warning: unused parameter 'argv' [-Wunused-parameter]
|   134 | void compute_v4_addr(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                    ~~~~~~~^~~~
| archcommon.c: In function 'compute_v4_mask':
| config.c: In function 'add_allow_up':
| archcommon.c:150:38: warning: unused parameter 'ifd' [-Wunused-parameter]
|   150 | void compute_v4_mask(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                      ~~~~~~~~~~~~~~~~^~~
| config.c:182:47: warning: unused parameter 'filename' [-Wunused-parameter]
|   182 | static allowup_defn *add_allow_up(const char *filename, int line, allowup_defn *allow_up, const char *iface_name) {
|       |                                   ~~~~~~~~~~~~^~~~~~~~
| archcommon.c:150:62: warning: unused parameter 'argc' [-Wunused-parameter]
|   150 | void compute_v4_mask(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                          ~~~~^~~~
| config.c:182:61: warning: unused parameter 'line' [-Wunused-parameter]
|   182 | static allowup_defn *add_allow_up(const char *filename, int line, allowup_defn *allow_up, const char *iface_name) {
|       |                                                         ~~~~^~~~
| archcommon.c:150:75: warning: unused parameter 'argv' [-Wunused-parameter]
|   150 | void compute_v4_mask(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                    ~~~~~~~^~~~
| archcommon.c: In function 'compute_v4_broadcast':
| archcommon.c:201:67: warning: unused parameter 'argc' [-Wunused-parameter]
|   201 | void compute_v4_broadcast(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                               ~~~~^~~~
| archcommon.c:201:80: warning: unused parameter 'argv' [-Wunused-parameter]
|   201 | void compute_v4_broadcast(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                         ~~~~~~~^~~~
| archcommon.c: In function 'set_preferred_lft':
| archcommon.c:252:64: warning: unused parameter 'argc' [-Wunused-parameter]
|   252 | void set_preferred_lft(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                            ~~~~^~~~
| archcommon.c:252:77: warning: unused parameter 'argv' [-Wunused-parameter]
|   252 | void set_preferred_lft(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                      ~~~~~~~^~~~
| archcommon.c: In function 'get_token':
| archcommon.c:266:32: warning: unused parameter 'ifd' [-Wunused-parameter]
|   266 | void get_token(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                ~~~~~~~~~~~~~~~~^~~
| archcommon.c: In function 'to_decimal':
| archcommon.c:297:33: warning: unused parameter 'ifd' [-Wunused-parameter]
|   297 | void to_decimal(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                 ~~~~~~~~~~~~~~~~^~~
| archcommon.c: In function 'map_value':
| archcommon.c:312:32: warning: unused parameter 'ifd' [-Wunused-parameter]
|   312 | void map_value(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                ~~~~~~~~~~~~~~~~^~~
| archcommon.c: In function 'if_set':
| archcommon.c:331:29: warning: unused parameter 'ifd' [-Wunused-parameter]
|   331 | void if_set(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |             ~~~~~~~~~~~~~~~~^~~
| execute.c: In function 'set_environ':
| execute.c:107:48: error: 'PKGLIBDIR' undeclared (first use in this function)
|   107 |         *ppch++ = setlocalenv("%s=%s", "PATH", PKGLIBDIR ":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
|       |                                                ^~~~~~~~~
| execute.c:107:48: note: each undeclared identifier is reported only once for each function it appears in
| execute.c:107:57: error: expected ')' before string constant
|   107 |         *ppch++ = setlocalenv("%s=%s", "PATH", PKGLIBDIR ":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
|       |                              ~                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         )
| make: *** [<builtin>: execute.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878:167 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878, line 167
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878, line 151
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878, line 146
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878, line 141
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878, line 180
NOTE: recipe ifupdown-0.8.43-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1163 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315054408.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315054408.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ifupdown-0.8.43-r0 do_compile: oe_runmake failed
ERROR: ifupdown-0.8.43-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.2661878', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/log.do_compile.2661878
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_compile) failed with exit code '1'

--===============7418911593679625520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ifupdown-upgrade-0.8.41-0.8.43.patch"

RnJvbSBjYzYyNWY5NGUyYzNhOWJjM2ViZjY3OTkzNWQxMjdkNmM1NmFjNjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDU6NDQ6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
ZnVwZG93bjogdXBncmFkZSAwLjguNDEgLT4gMC44LjQzCgotLS0KIC4uLi9pZnVwZG93bi9maWxl
cy8wMDAxLURlZmluZS1GTk1fRVhUTUFUQ0gtZm9yLW11c2wucGF0Y2ggfCAzICstLQogLi4uLU1h
a2VmaWxlLWRvLW5vdC11c2UtZHBrZy1mb3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaCB8IDcg
KysrLS0tLQogLi4uL2ZpbGVzLzAwMDEtaWZ1cGRvd24tc2tpcC13cm9uZy10ZXN0LWNhc2UucGF0
Y2ggICAgICAgICB8IDMgKy0tCiAuLi5uMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0
ZWN0dXJlLXRvLXNldC1hLnBhdGNoIHwgMyArLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3du
L2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5wYXRjaCAgfCAzICstLQogLi4uL2lmdXBkb3duL3tp
ZnVwZG93bl8wLjguNDEuYmIgPT4gaWZ1cGRvd25fMC44LjQzLmJifSAgICB8IDIgKy0KIDYgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29yZS9pZnVwZG93bi97aWZ1cGRvd25fMC44LjQxLmJiID0+IGlmdXBkb3duXzAu
OC40My5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9m
aWxlcy8wMDAxLURlZmluZS1GTk1fRVhUTUFUQ0gtZm9yLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLURlZmluZS1GTk1fRVhUTUFUQ0gtZm9yLW11c2wu
cGF0Y2gKaW5kZXggNmM0ZWQ1MjZiZi4uNGRiNDUyZjg0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1EZWZpbmUtRk5NX0VYVE1BVENILWZvci1tdXNs
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEtRGVmaW5l
LUZOTV9FWFRNQVRDSC1mb3ItbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGRmYmNm
MDJlNDI0YmExZmRlZjU4N2Q4MWM5ZTA4YTM3YWI4YzFiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZGFhMzI0MmUzNjlkOWI2MzQyNGFkNTA4ZTgyNzA1NTA5OGJlODk0MCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE9sZWtzYW5kciBLcmF2Y2h1ayA8b3Blbi5zb3VyY2VA
b2xla3NhbmRyLWtyYXZjaHVrLmNvbT4KIERhdGU6IFR1ZSwgMiBKdWwgMjAxOSAyMDoxMDo0MiAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBEZWZpbmUgRk5NX0VYVE1BVENIIGZvciBtdXNsCkBAIC0y
NCw3ICsyNCw2IEBAIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdGTk1fTk9NQVRDSCc/CiBVcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9p
ZnVwZG93bi9tZXJnZV9yZXF1ZXN0cy81XQogCiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgS3Jh
dmNodWsgPG9wZW4uc291cmNlQG9sZWtzYW5kci1rcmF2Y2h1ay5jb20+Ci0KIC0tLQogIGFyY2hj
b21tb24uaCB8IDQgKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEtTWFrZWZpbGUtZG8t
bm90LXVzZS1kcGtnLWZvci1kZXRlcm1pbmluZy1PUy10eXBlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1NYWtlZmlsZS1kby1ub3QtdXNlLWRwa2ctZm9yLWRl
dGVybWluaW5nLU9TLXR5cGUucGF0Y2gKaW5kZXggNmUxNWEyNTIyNC4uZTA0NWU0NzcyZCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1NYWtlZmlsZS1k
by1ub3QtdXNlLWRwa2ctZm9yLWRldGVybWluaW5nLU9TLXR5cGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1NYWtlZmlsZS1kby1ub3QtdXNlLWRwa2ct
Zm9yLWRldGVybWluaW5nLU9TLXR5cGUucGF0Y2gKQEAgLTEsMTcgKzEsMTYgQEAKLUZyb20gN2Zl
NTE2Y2JhZjlmZGEwOWQ5OWRjYjU0ZDQ2NDUzNjdjZmZjOGE0ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZjhlNjIxMzgyNmMxNTU0MTE3NjEwY2ViNWUxZTUxN2E2ODQ0NzNkZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCA5IEphbiAyMDIwIDE1OjM4OjA2ICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIE1ha2VmaWxlOiBkbyBub3QgdXNlIGRwa2cgZm9yIGRldGVybWluaW5nIE9T
IHR5cGUKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmlj
XQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+Ci0KIC0tLQogIE1ha2VmaWxlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQot
aW5kZXggMGNlMmZhMy4uNzM5YWVmMiAxMDA2NDQKK2luZGV4IDljZDc1OGIuLjU4YjQxNzMgMTAw
NjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKIEBAIC0xLDYgKzEsNiBAQApAQCAt
MjEsNCArMjAsNCBAQCBpbmRleCAwY2UyZmEzLi43MzlhZWYyIDEwMDY0NAogK0FSQ0ggOj0gbGlu
dXgKICAKICBCQVNFRElSID89ICQoREVTVERJUikKLSAKKyBQS0dMSUJESVIgPz0gL2xpYi9pZnVw
ZG93bgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1p
ZnVwZG93bi1za2lwLXdyb25nLXRlc3QtY2FzZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2lm
dXBkb3duL2ZpbGVzLzAwMDEtaWZ1cGRvd24tc2tpcC13cm9uZy10ZXN0LWNhc2UucGF0Y2gKaW5k
ZXggOWFlMjRkYTUxZS4uNzBiOGU1MmNkOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
aWZ1cGRvd24vZmlsZXMvMDAwMS1pZnVwZG93bi1za2lwLXdyb25nLXRlc3QtY2FzZS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLWlmdXBkb3duLXNraXAt
d3JvbmctdGVzdC1jYXNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ODJkOGE4NjljMjY2
ODIwZDBmMzQ5NzQ0MzZmMjQ0ZjY3YWZhZWE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA1ZmI2YjE0YmQzMDY4NzAwZGZhOTBhMjQ3MTJiMzhkZjg0MzlmZmNjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogWnFpYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogTW9uLCAxOSBBcHIgMjAyMSAxNDoxNTo0NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBpZnVw
ZG93bjogc2tpcCB3cm9uZyB0ZXN0IGNhc2UKQEAgLTEwLDcgKzEwLDYgQEAgYW5kIGFyZSBza2lw
cGVkIGRpcmVjdGx5LgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNw
ZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5j
b20+Ci0KIC0tLQogIHRlc3RzL3Rlc3RidWlsZC1saW51eCB8IDIgKy0KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2lmdXBkb3duL2ZpbGVzL2RlZm4yLWMtbWFuLWRvbi10LXJlbHktb24tZHBrZy1hcmNo
aXRlY3R1cmUtdG8tc2V0LWEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxl
cy9kZWZuMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0ZWN0dXJlLXRvLXNldC1hLnBh
dGNoCmluZGV4IDdiNGI3NjFlNmEuLjBhODg4ZDI1MzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL2lmdXBkb3duL2ZpbGVzL2RlZm4yLWMtbWFuLWRvbi10LXJlbHktb24tZHBrZy1hcmNo
aXRlY3R1cmUtdG8tc2V0LWEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24v
ZmlsZXMvZGVmbjItYy1tYW4tZG9uLXQtcmVseS1vbi1kcGtnLWFyY2hpdGVjdHVyZS10by1zZXQt
YS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmM4ZThkNGNiMTlmZjMwZTY5YWExODU1MzMy
NTQ0ZjEwMTdmOTc0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjgxNjE4ZGE0YjU0
Yzg0MjIwZjlhZmU4NDYxMGNkYTA4ZDcxNGU2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTog
V2VkLCA2IEF1ZyAyMDE0IDE0OjU0OjEyIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRlZm4yW2N8
bWFuXTogZG9uJ3QgcmVseSBvbiBkcGtnLWFyY2hpdGVjdHVyZSB0byBzZXQgYXJjaApAQCAtMTMs
NyArMTMsNiBAQCBsaWtlIHRoZSBsb29wYmFjayBkZXZpY2Ugbm90IGJlaW5nIGNvbmZpZ3VyZWQv
ZW5hYmxlZC4KIAogU2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2Vy
QHdpbmRyaXZlci5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLQogLS0tCiAgZGVmbjJj
LnBsICAgfCA2ICsrKy0tLQogIGRlZm4ybWFuLnBsIHwgNiArKystLS0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5wYXRj
aAppbmRleCBmYTZiYjg0ZGYzLi5hZWI5N2QyMTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9pZnVwZG93bi9maWxlcy90d2Vhay1wdGVzdC1zY3JpcHQucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvdHdlYWstcHRlc3Qtc2NyaXB0LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBhNmJiMmFjNWY1MjFjNjc4YWJiYmRiMTk2MGQyOGY3NTBmNDM1N2E2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZWMyYmM2ZTBiY2U3Mjg2MmFjZWY1ZmE0
M2RmNTI3NTI5MDVmZDA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcg
PGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDMgRmViIDIwMjAgMTc6MzM6MTEg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gVHdlYWsgdGVzdHMgb2YgaWZ1cGRvd24gdG8gbWFrZSBp
dCB3b3JrIHdpdGggb2UtY29yZSBwdGVzdApAQCAtNyw3ICs3LDYgQEAgU3ViamVjdDogW1BBVENI
XSBUd2VhayB0ZXN0cyBvZiBpZnVwZG93biB0byBtYWtlIGl0IHdvcmsgd2l0aCBvZS1jb3JlIHB0
ZXN0CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiAK
IFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgotCiAtLS0K
ICB0ZXN0cy90ZXN0YnVpbGQtbGludXggfCAxMSArKysrKystLS0tLQogIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9pZnVwZG93bi9pZnVwZG93bl8wLjguNDEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9p
ZnVwZG93bi9pZnVwZG93bl8wLjguNDMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vaWZ1cGRvd25fMC44LjQxLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9pZnVwZG93bl8wLjguNDMuYmIKaW5kZXggMTY0
MjVlYTllNC4uM2U5NWEwOWQxNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRv
d24vaWZ1cGRvd25fMC44LjQxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2lm
dXBkb3duXzAuOC40My5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImdpdDovL3NhbHNh
LmRlYmlhbi5vcmcvZGViaWFuL2lmdXBkb3duLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dAogICAgICAgICAgICBmaWxlOi8vZGVmbjItYy1tYW4tZG9uLXQtcmVseS1vbi1kcGtnLWFyY2hp
dGVjdHVyZS10by1zZXQtYS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly90d2Vhay1wdGVzdC1z
Y3JpcHQucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMzY5ZDlkM2MxM2EwYzU2YWQw
OWZkNGYxM2I0YTgwZWI5YTk0ZTI3MCIKK1NSQ1JFViA9ICJjZjg2YWQ1ODE5YWJhOGY5YjAyMGE5
NTI1N2M5YThjNDkxMWIxYzg1IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQyLjAK
Cg==

--===============7418911593679625520==--

