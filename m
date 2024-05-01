Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA03C3DA45
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1113.1714579215414642812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XJxEBwTe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nc80OlT6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e290fa-e8fc7f33-4f3b-485d-839c-3392fcf7a1a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uef10z2dCeSD5Sesvnomwrehxg8RCNVdEvAPOhkFOqM=;
	b=XJxEBwTePp+R2v3I0GmGp8GO6ZO/rRYxHXr2KdQ15WkHcYiC2onJ3wdOL7S786g7
	cY1tH0BTDW0xWeUkF2XaFCJs4xDz1LqqOj2aVywyU2PbUF7Uc9xXpmqgbaJFz6+LXsz
	qKqomQeDdb/rj/hc2RHfK7bvMQyZ16WKZIn/tyRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uef10z2dCeSD5Sesvnomwrehxg8RCNVdEvAPOhkFOqM=;
	b=nc80OlT6Dsyg9vUEckJC21pwxYiD9y0hO5BTdbAt6vJJm4CrU/ebf3+arW1HcPIx
	ELg2IqxOHRPFMuaC8ilISQuOYzMxW7aEC/4Q087JTlA1U/a/3vwrmPoLMO5qh67ElCB
	3+HzNgaBDxg0Qsx7u7z02vIhUn3H6mFiLneA/umI=
Content-Type: multipart/mixed; boundary="===============7496955739023095640=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ifupdown: upgrading to 0.8.43 FAILED
Message-ID: <0101018f34e290fa-e8fc7f33-4f3b-485d-839c-3392fcf7a1a2-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198798

--===============7496955739023095640==
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
From 1d8a8a3b31b9303cf5508ce24ea4589284848855 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:31:06 +0000
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
index 6c4ed526bf..5526e45684 100644
--- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -1,4 +1,4 @@
-From 8dfbcf02e424ba1fdef587d81c9e08a37ab8c1b6 Mon Sep 17 00:00:00 2001
+From f2dfde6e3b226b3b2e679aca7ab0135bab3bbc4a Mon Sep 17 00:00:00 2001
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
index 6e15a25224..7753e8ce02 100644
--- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
+++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
@@ -1,17 +1,16 @@
-From 7fe516cbaf9fda09d99dcb54d4645367cffc8a4d Mon Sep 17 00:00:00 2001
+From 8ddb190e1ef03fa19481ce2ab6a5a89f51bbf43d Mon Sep 17 00:00:00 2001
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
index 9ae24da51e..d7d05ae499 100644
--- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -1,4 +1,4 @@
-From 782d8a869c266820d0f34974436f244f67afaea7 Mon Sep 17 00:00:00 2001
+From 13fffaccce5adb8069195d53bc5be58322c18c5b Mon Sep 17 00:00:00 2001
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
index 7b4b761e6a..46c193d7a6 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,4 +1,4 @@
-From fc8e8d4cb19ff30e69aa1855332544f1017f974c Mon Sep 17 00:00:00 2001
+From f641ee7b30e80e88e69be3337ed3dc9327d10154 Mon Sep 17 00:00:00 2001
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
index fa6bb84df3..f1154b24c3 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -1,4 +1,4 @@
-From a6bb2ac5f521c678abbbdb1960d28f750f4357a6 Mon Sep 17 00:00:00 2001
+From 290ccf29dc19a4eb5e6b2ca8caf9cc5c5bd40ce3 Mon Sep 17 00:00:00 2001
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
2.44.0


--===============7496955739023095640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-bdc91f4a753ee90ef2eb614d3f4018acb6d7dbc9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bdc91f4a753ee90ef2eb614d3f4018acb6d7dbc9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 205 Local 191 Mirrors 0 Missed 14 Current 202 (93% match, 96% complete)
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
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o inet6.o inet6.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/git=/usr/src/debug/ifupdown/0.8.43  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/recipe-sysroot-native=  -Wall -W -D'IFUPDOWN_VERSION="0.8.43"'   -c -o link.o link.c
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
| can.c:48:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    48 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| can.c:48:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    48 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| ipx.c: In function '_dynamic_rename':
| ipx.c:46:44: warning: unused parameter 'ifd' [-Wunused-parameter]
|    46 | static int _dynamic_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                            ~~~~~~~~~~~~~~~~^~~
| ipx.c:46:57: warning: unused parameter 'exec' [-Wunused-parameter]
|    46 | static int _dynamic_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                 ~~~~~~~~^~~~
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
| inet6.c: In function '_auto_rename':
| inet6.c:67:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|    67 | static int _auto_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet6.c:67:54: warning: unused parameter 'exec' [-Wunused-parameter]
|    67 | static int _auto_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet.c: In function '_manual_rename':
| inet.c:97:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|    97 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:97:56: warning: unused parameter 'exec' [-Wunused-parameter]
|    97 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_loopback_rename':
| inet6.c:92:45: warning: unused parameter 'ifd' [-Wunused-parameter]
|    92 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                             ~~~~~~~~~~~~~~~~^~~
| inet6.c:92:58: warning: unused parameter 'exec' [-Wunused-parameter]
|    92 | static int _loopback_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                  ~~~~~~~~^~~~
| inet.c: In function '_dhcp_rename':
| inet.c:143:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|   143 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet.c:143:54: warning: unused parameter 'exec' [-Wunused-parameter]
|   143 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet.c: In function '_bootp_rename':
| inet.c:163:42: warning: unused parameter 'ifd' [-Wunused-parameter]
|   163 | static int _bootp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                          ~~~~~~~~~~~~~~~~^~~
| inet.c:163:55: warning: unused parameter 'exec' [-Wunused-parameter]
|   163 | static int _bootp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                               ~~~~~~~~^~~~
| inet6.c: In function '_static_rename':
| inet6.c:159:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   159 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet6.c:159:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   159 | static int _static_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c: In function '_tunnel_rename':
| inet.c:192:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   192 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:192:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   192 | static int _tunnel_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_manual_rename':
| inet6.c:188:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   188 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c: In function '_ppp_rename':
| inet6.c:188:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   188 | static int _manual_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet.c:211:40: warning: unused parameter 'ifd' [-Wunused-parameter]
|   211 | static int _ppp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                        ~~~~~~~~~~~~~~~~^~~
| inet.c:211:53: warning: unused parameter 'exec' [-Wunused-parameter]
|   211 | static int _ppp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                             ~~~~~~~~^~~~
| inet.c: In function '_wvdial_rename':
| inet.c:232:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   232 | static int _wvdial_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet.c:232:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   232 | static int _wvdial_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
| inet6.c: In function '_dhcp_rename':
| inet.c: In function '_ipv4ll_rename':
| inet6.c:242:41: warning: unused parameter 'ifd' [-Wunused-parameter]
|   242 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                         ~~~~~~~~~~~~~~~~^~~
| inet.c:251:43: warning: unused parameter 'ifd' [-Wunused-parameter]
|   251 | static int _ipv4ll_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                           ~~~~~~~~~~~~~~~~^~~
| inet6.c:242:54: warning: unused parameter 'exec' [-Wunused-parameter]
|   242 | static int _dhcp_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                              ~~~~~~~~^~~~
| inet.c:251:56: warning: unused parameter 'exec' [-Wunused-parameter]
|   251 | static int _ipv4ll_rename(interface_defn *ifd, execfn *exec) { return 0; }
|       |                                                ~~~~~~~~^~~~
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
| config.c: In function 'add_allow_up':
| archcommon.c:134:62: warning: unused parameter 'argc' [-Wunused-parameter]
|   134 | void compute_v4_addr(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                          ~~~~^~~~
| archcommon.c:134:75: warning: unused parameter 'argv' [-Wunused-parameter]
|   134 | void compute_v4_addr(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                                    ~~~~~~~^~~~
| config.c:182:47: warning: unused parameter 'filename' [-Wunused-parameter]
|   182 | static allowup_defn *add_allow_up(const char *filename, int line, allowup_defn *allow_up, const char *iface_name) {
|       |                                   ~~~~~~~~~~~~^~~~~~~~
| config.c:182:61: warning: unused parameter 'line' [-Wunused-parameter]
|   182 | static allowup_defn *add_allow_up(const char *filename, int line, allowup_defn *allow_up, const char *iface_name) {
|       |                                                         ~~~~^~~~
| archcommon.c: In function 'compute_v4_mask':
| archcommon.c:150:38: warning: unused parameter 'ifd' [-Wunused-parameter]
|   150 | void compute_v4_mask(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                      ~~~~~~~~~~~~~~~~^~~
| archcommon.c:150:62: warning: unused parameter 'argc' [-Wunused-parameter]
|   150 | void compute_v4_mask(interface_defn *ifd, char **pparam, int argc, char **argv) {
|       |                                                          ~~~~^~~~
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709:167 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709, line 167
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709, line 151
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709, line 146
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709, line 141
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709, line 180
NOTE: recipe ifupdown-0.8.43-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1163 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501053042.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501053042.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ifupdown-0.8.43-r0 do_compile: oe_runmake failed
ERROR: ifupdown-0.8.43-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/run.do_compile.3698709', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ifupdown/0.8.43/temp/log.do_compile.3698709
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb:do_compile) failed with exit code '1'

--===============7496955739023095640==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ifupdown-upgrade-0.8.41-0.8.43.patch"

RnJvbSAxZDhhOGEzYjMxYjkzMDNjZjU1MDhjZTI0ZWE0NTg5Mjg0ODQ4ODU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNTozMTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlm
dXBkb3duOiB1cGdyYWRlIDAuOC40MSAtPiAwLjguNDMKCi0tLQogLi4uL2lmdXBkb3duL2ZpbGVz
LzAwMDEtRGVmaW5lLUZOTV9FWFRNQVRDSC1mb3ItbXVzbC5wYXRjaCB8IDMgKy0tCiAuLi4tTWFr
ZWZpbGUtZG8tbm90LXVzZS1kcGtnLWZvci1kZXRlcm1pbmluZy1PUy10eXBlLnBhdGNoIHwgNyAr
KystLS0tCiAuLi4vZmlsZXMvMDAwMS1pZnVwZG93bi1za2lwLXdyb25nLXRlc3QtY2FzZS5wYXRj
aCAgICAgICAgIHwgMyArLS0KIC4uLm4yLWMtbWFuLWRvbi10LXJlbHktb24tZHBrZy1hcmNoaXRl
Y3R1cmUtdG8tc2V0LWEucGF0Y2ggfCAzICstLQogbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24v
ZmlsZXMvdHdlYWstcHRlc3Qtc2NyaXB0LnBhdGNoICB8IDMgKy0tCiAuLi4vaWZ1cGRvd24ve2lm
dXBkb3duXzAuOC40MS5iYiA9PiBpZnVwZG93bl8wLjguNDMuYmJ9ICAgIHwgMiArLQogNiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb3JlL2lmdXBkb3duL3tpZnVwZG93bl8wLjguNDEuYmIgPT4gaWZ1cGRvd25fMC44
LjQzLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2Zp
bGVzLzAwMDEtRGVmaW5lLUZOTV9FWFRNQVRDSC1mb3ItbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEtRGVmaW5lLUZOTV9FWFRNQVRDSC1mb3ItbXVzbC5w
YXRjaAppbmRleCA2YzRlZDUyNmJmLi41NTI2ZTQ1Njg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLURlZmluZS1GTk1fRVhUTUFUQ0gtZm9yLW11c2wu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1EZWZpbmUt
Rk5NX0VYVE1BVENILWZvci1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZGZiY2Yw
MmU0MjRiYTFmZGVmNTg3ZDgxYzllMDhhMzdhYjhjMWI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmMmRmZGU2ZTNiMjI2YjNiMmU2NzlhY2E3YWIwMTM1YmFiM2JiYzRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NhbmRyIEtyYXZjaHVrIDxvcGVuLnNvdXJjZUBv
bGVrc2FuZHIta3JhdmNodWsuY29tPgogRGF0ZTogVHVlLCAyIEp1bCAyMDE5IDIwOjEwOjQyICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBGTk1fRVhUTUFUQ0ggZm9yIG11c2wKQEAgLTI0
LDcgKzI0LDYgQEAgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0ZOTV9OT01BVENIJz8KIFVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2lm
dXBkb3duL21lcmdlX3JlcXVlc3RzLzVdCiAKIFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBLcmF2
Y2h1ayA8b3Blbi5zb3VyY2VAb2xla3NhbmRyLWtyYXZjaHVrLmNvbT4KLQogLS0tCiAgYXJjaGNv
bW1vbi5oIHwgNCArKysrCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvMDAwMS1NYWtlZmlsZS1kby1u
b3QtdXNlLWRwa2ctZm9yLWRldGVybWluaW5nLU9TLXR5cGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxlLWRvLW5vdC11c2UtZHBrZy1mb3ItZGV0
ZXJtaW5pbmctT1MtdHlwZS5wYXRjaAppbmRleCA2ZTE1YTI1MjI0Li43NzUzZThjZTAyIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxlLWRv
LW5vdC11c2UtZHBrZy1mb3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLU1ha2VmaWxlLWRvLW5vdC11c2UtZHBrZy1m
b3ItZGV0ZXJtaW5pbmctT1MtdHlwZS5wYXRjaApAQCAtMSwxNyArMSwxNiBAQAotRnJvbSA3ZmU1
MTZjYmFmOWZkYTA5ZDk5ZGNiNTRkNDY0NTM2N2NmZmM4YTRkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA4ZGRiMTkwZTFlZjAzZmExOTQ4MWNlMmFiNmE1YTg5ZjUxYmJmNDNkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDkgSmFuIDIwMjAgMTU6Mzg6MDYgKzAxMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gTWFrZWZpbGU6IGRvIG5vdCB1c2UgZHBrZyBmb3IgZGV0ZXJtaW5pbmcgT1Mg
dHlwZQogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNd
CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KLQogLS0tCiAgTWFrZWZpbGUgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCi1p
bmRleCAwY2UyZmEzLi43MzlhZWYyIDEwMDY0NAoraW5kZXggOWNkNzU4Yi4uNThiNDE3MyAxMDA2
NDQKIC0tLSBhL01ha2VmaWxlCiArKysgYi9NYWtlZmlsZQogQEAgLTEsNiArMSw2IEBACkBAIC0y
MSw0ICsyMCw0IEBAIGluZGV4IDBjZTJmYTMuLjczOWFlZjIgMTAwNjQ0CiArQVJDSCA6PSBsaW51
eAogIAogIEJBU0VESVIgPz0gJChERVNURElSKQotIAorIFBLR0xJQkRJUiA/PSAvbGliL2lmdXBk
b3duCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy8wMDAxLWlm
dXBkb3duLXNraXAtd3JvbmctdGVzdC1jYXNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1
cGRvd24vZmlsZXMvMDAwMS1pZnVwZG93bi1za2lwLXdyb25nLXRlc3QtY2FzZS5wYXRjaAppbmRl
eCA5YWUyNGRhNTFlLi5kN2QwNWFlNDk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9p
ZnVwZG93bi9maWxlcy8wMDAxLWlmdXBkb3duLXNraXAtd3JvbmctdGVzdC1jYXNlLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVzLzAwMDEtaWZ1cGRvd24tc2tpcC13
cm9uZy10ZXN0LWNhc2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc4MmQ4YTg2OWMyNjY4
MjBkMGYzNDk3NDQzNmYyNDRmNjdhZmFlYTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDEzZmZmYWNjY2U1YWRiODA2OTE5NWQ1M2JjNWJlNTgzMjJjMThjNWIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBNb24sIDE5IEFwciAyMDIxIDE0OjE1OjQ1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGlmdXBk
b3duOiBza2lwIHdyb25nIHRlc3QgY2FzZQpAQCAtMTAsNyArMTAsNiBAQCBhbmQgYXJlIHNraXBw
ZWQgZGlyZWN0bHkuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3Bl
Y2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFpxaWFuZyA8cWlhbmcuemhhbmdAd2luZHJpdmVyLmNv
bT4KLQogLS0tCiAgdGVzdHMvdGVzdGJ1aWxkLWxpbnV4IHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvaWZ1cGRvd24vZmlsZXMvZGVmbjItYy1tYW4tZG9uLXQtcmVseS1vbi1kcGtnLWFyY2hp
dGVjdHVyZS10by1zZXQtYS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2ZpbGVz
L2RlZm4yLWMtbWFuLWRvbi10LXJlbHktb24tZHBrZy1hcmNoaXRlY3R1cmUtdG8tc2V0LWEucGF0
Y2gKaW5kZXggN2I0Yjc2MWU2YS4uNDZjMTkzZDdhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvaWZ1cGRvd24vZmlsZXMvZGVmbjItYy1tYW4tZG9uLXQtcmVseS1vbi1kcGtnLWFyY2hp
dGVjdHVyZS10by1zZXQtYS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9m
aWxlcy9kZWZuMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0ZWN0dXJlLXRvLXNldC1h
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYzhlOGQ0Y2IxOWZmMzBlNjlhYTE4NTUzMzI1
NDRmMTAxN2Y5NzRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNjQxZWU3YjMwZTgw
ZTg4ZTY5YmUzMzM3ZWQzZGM5MzI3ZDEwMTU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiBEYXRlOiBX
ZWQsIDYgQXVnIDIwMTQgMTQ6NTQ6MTIgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gZGVmbjJbY3xt
YW5dOiBkb24ndCByZWx5IG9uIGRwa2ctYXJjaGl0ZWN0dXJlIHRvIHNldCBhcmNoCkBAIC0xMyw3
ICsxMyw2IEBAIGxpa2UgdGhlIGxvb3BiYWNrIGRldmljZSBub3QgYmVpbmcgY29uZmlndXJlZC9l
bmFibGVkLgogCiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJA
d2luZHJpdmVyLmNvbT4KIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwotCiAtLS0KICBkZWZuMmMu
cGwgICB8IDYgKysrLS0tCiAgZGVmbjJtYW4ucGwgfCA2ICsrKy0tLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvdHdlYWstcHRlc3Qtc2NyaXB0LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vZmlsZXMvdHdlYWstcHRlc3Qtc2NyaXB0LnBhdGNo
CmluZGV4IGZhNmJiODRkZjMuLmYxMTU0YjI0YzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2lmdXBkb3duL2ZpbGVzL3R3ZWFrLXB0ZXN0LXNjcmlwdC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9pZnVwZG93bi9maWxlcy90d2Vhay1wdGVzdC1zY3JpcHQucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGE2YmIyYWM1ZjUyMWM2NzhhYmJiZGIxOTYwZDI4Zjc1MGY0MzU3YTYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI5MGNjZjI5ZGMxOWE0ZWI1ZTZiMmNhOGNh
ZjljYzVjNWJkNDBjZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8
a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMyBGZWIgMjAyMCAxNzozMzoxMSAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBUd2VhayB0ZXN0cyBvZiBpZnVwZG93biB0byBtYWtlIGl0
IHdvcmsgd2l0aCBvZS1jb3JlIHB0ZXN0CkBAIC03LDcgKzcsNiBAQCBTdWJqZWN0OiBbUEFUQ0hd
IFR3ZWFrIHRlc3RzIG9mIGlmdXBkb3duIHRvIG1ha2UgaXQgd29yayB3aXRoIG9lLWNvcmUgcHRl
c3QKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIAog
U2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+Ci0KIC0tLQog
IHRlc3RzL3Rlc3RidWlsZC1saW51eCB8IDExICsrKysrKy0tLS0tCiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2lmdXBkb3duL2lmdXBkb3duXzAuOC40MS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2lm
dXBkb3duL2lmdXBkb3duXzAuOC40My5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93bi9pZnVwZG93bl8wLjguNDEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL2lmdXBkb3duL2lmdXBkb3duXzAuOC40My5iYgppbmRleCAxNjQy
NWVhOWU0Li4zZTk1YTA5ZDE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pZnVwZG93
bi9pZnVwZG93bl8wLjguNDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaWZ1cGRvd24vaWZ1
cGRvd25fMC44LjQzLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2Eu
ZGViaWFuLm9yZy9kZWJpYW4vaWZ1cGRvd24uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
CiAgICAgICAgICAgIGZpbGU6Ly9kZWZuMi1jLW1hbi1kb24tdC1yZWx5LW9uLWRwa2ctYXJjaGl0
ZWN0dXJlLXRvLXNldC1hLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3R3ZWFrLXB0ZXN0LXNj
cmlwdC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIzNjlkOWQzYzEzYTBjNTZhZDA5
ZmQ0ZjEzYjRhODBlYjlhOTRlMjcwIgorU1JDUkVWID0gImNmODZhZDU4MTlhYmE4ZjliMDIwYTk1
MjU3YzlhOGM0OTExYjFjODUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMAoK

--===============7496955739023095640==--

