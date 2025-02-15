Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9260DC021BB
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8095.1739623333398798165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KnSazhmL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YLLj2Ei3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a179d8-bdfb6d1a-2724-42bf-9155-67d7b2c37fea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=62O4CCq8ItLYEapbMkmZysIc9PYcE+FLNHdhpbOanPA=;
	b=KnSazhmLqrThZ1ldWdSnGaDgheyBumPXa6APUWln82EulkLODal7qQPYgPl2yy00
	J37JzCZMR8MbVw6Jx78iSfAkaW+0hAX/uJ2Qgw/mo3d8RjvhgMoYWIO6j35C1289u9v
	YDRPHNpqPL9JfAC7+f42k94Xll5tJLInoRWxqEY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=62O4CCq8ItLYEapbMkmZysIc9PYcE+FLNHdhpbOanPA=;
	b=YLLj2Ei31hdN4EMQCwUMBfVXM0DlnhZe8X0qEWnKqbq7vg1QzWxAnuj7XxV2ylBx
	zkchZKAP3WCyZKr9gcaCuv6GDAXK/AiRQvO5OwWAUjVtrZqOW3nKxJXyK4YlCpTovOL
	7A6jbQ1rkDqrWIse2SJYsS9uRjAAd6zZQzTDCPQw=
Content-Type: multipart/mixed; boundary="===============3858183451317823287=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.6 FAILED
Message-ID: <0101019509a179d8-bdfb6d1a-2724-42bf-9155-67d7b2c37fea-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211411

--===============3858183451317823287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-coreutils-upgrade-9.5-9.6.patch
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
From e792f073a8f71b47c9c1da614ea8d7daeb223ef7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:47:58 +0000
Subject: [PATCH] coreutils: upgrade 9.5 -> 9.6

---
 ...local.mk-fix-cross-compiling-problem.patch |  6 ++---
 .../coreutils/intermittent-testfailure.patch  | 16 +++++++++----
 .../remove-usr-local-lib-from-m4.patch        |  4 ++--
 .../{coreutils_9.5.bb => coreutils_9.6.bb}    | 24 +++++++++++++++++--
 4 files changed, 38 insertions(+), 12 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_9.5.bb => coreutils_9.6.bb} (91%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
index 97a6357ab9..28b2d9c44f 100644
--- a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
+++ b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
@@ -1,4 +1,4 @@
-From 7cb2d20cfa2a27191255031d231cd41917dcffe8 Mon Sep 17 00:00:00 2001
+From 0c038d027b311710fd479cc38153f39cdcc326ef Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 Dec 2016 16:10:35 +0800
 Subject: [PATCH] local.mk: fix cross compiling problem
@@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/local.mk b/src/local.mk
-index 96ee941..cdd47d6 100644
+index fd9dc81..ef6e968 100644
 --- a/src/local.mk
 +++ b/src/local.mk
-@@ -704,4 +704,4 @@ cu_install_program = @INSTALL@
+@@ -731,4 +731,4 @@ cu_install_program = @INSTALL@
  else
  cu_install_program = src/ginstall
  endif
diff --git a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
index 0794532bdf..e4a23e3061 100644
--- a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
+++ b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
@@ -1,4 +1,7 @@
-tests/df: Fix intermittent test failure
+From c77fea064065a906665685f2e531fe03b131181d Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 8 Aug 2024 10:37:58 +0100
+Subject: [PATCH] tests/df: Fix intermittent test failure
 
 The test writes to the disk and means the space used changes. If this
 crosses a number boundary, the heading spacing can change:
@@ -12,11 +15,14 @@ the spacing doesn't matter. Therefore strip any duplicate spaces using tr.
 Submitted: https://github.com/coreutils/coreutils/pull/88
 Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/c5725c8c4bb21903490a48035286d0f94463642e]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ tests/df/df-P.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: coreutils-9.5/tests/df/df-P.sh
-===================================================================
---- coreutils-9.5.orig/tests/df/df-P.sh
-+++ coreutils-9.5/tests/df/df-P.sh
+diff --git a/tests/df/df-P.sh b/tests/df/df-P.sh
+index d35597f..30b3ef1 100755
+--- a/tests/df/df-P.sh
++++ b/tests/df/df-P.sh
 @@ -20,8 +20,8 @@
  print_ver_ df
  
diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 718de0ab78..6364f07201 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,4 +1,4 @@
-From f53ffb5b27ab7d4a4c62df00ebd6a1a6936d1709 Mon Sep 17 00:00:00 2001
+From 606c5efc3296b5c3237f81ba2b9fc8e96f795200 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Aug 2011 14:12:30 -0700
 Subject: [PATCH] coreutils: Fix build on uclibc
@@ -17,7 +17,7 @@ Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
  1 file changed, 12 deletions(-)
 
 diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
-index 9d0236f..68f7c52 100644
+index 8ab613d..5af7571 100644
 --- a/m4/getloadavg.m4
 +++ b/m4/getloadavg.m4
 @@ -46,18 +46,6 @@ if test $ac_cv_func_getloadavg != yes; then
diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
similarity index 91%
rename from meta/recipes-core/coreutils/coreutils_9.5.bb
rename to meta/recipes-core/coreutils/coreutils_9.6.bb
index 5372318312..1a08208a8b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -1,3 +1,23 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/ls.c
+# +++ src/ls.c
+# @@ -1,5 +1,5 @@
+#  /* 'dir', 'vdir' and 'ls' directory listing programs for GNU.
+# -   Copyright (C) 1985-2024 Free Software Foundation, Inc.
+# +   Copyright (C) 1985-2025 Free Software Foundation, Inc.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "The basic file, shell and text manipulation utilities"
 DESCRIPTION = "The GNU Core Utilities provide the basic file, shell and text \
 manipulation utilities. These are the core utilities which are expected to exist on \
@@ -6,7 +26,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=9ac94aaed7fd46fd8df7147a9e3410cb \
+                    file://src/ls.c;beginline=1;endline=15;md5=824c1997414aea9f344747bd81cf5a31 \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -19,7 +39,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"
+SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
-- 
2.44.1


--===============3858183451317823287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1f9c405852e6f603a3de29e9f6ec2786e834411a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 482 Local 447 Mirrors 0 Missed 35 Current 434 (92% match, 96% complete)
Removing 24 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 609 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_setscene)
NOTE: Running setscene task 660 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: Running setscene task 678 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_setscene)
NOTE: Running setscene task 700 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 846 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 981 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1295 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: Running setscene task 855 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1542 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: Running task 1543 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1544 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_lic)
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_lic unihash changed to 7376a5635d47450fcdc51a74f5fab8e8242187df424d7cf43920142cefd3be3e
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch unihash changed to 84a73556b97ea8ce98958d1f81d235cefd317f7c5bebe76b43ee060edd0cd20c
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 869 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 883 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 916 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 916 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1938 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2374 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2450 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2452 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 2453 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2454 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2456 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: Running task 2457 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata)
NOTE: recipe coreutils-9.6-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx)
NOTE: Running task 2460 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk)
NOTE: Running task 2461 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb)
NOTE: Running task 2462 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: Running task 2463 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa)
NOTE: Running task 2464 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk)
NOTE: Running task 2465 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb)
NOTE: Running task 2466 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.6-r0: task do_create_spdx: Started
NOTE: Running task 2467 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa)
NOTE: Running task 2468 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Started
NOTE: Running task 2469 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb)
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: Running task 2470 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Started
NOTE: Running task 2471 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2472 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_ipk)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Started
NOTE: Running task 2473 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_deb)
NOTE: Running task 2474 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_rpm)
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_ipk unihash changed to 647ecc708d5105301ecc1d52c8e6b6849d83eddf14f2943dba00e53a7eb64b1b
NOTE: Running task 2475 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_qa)
NOTE: recipe gawk-5.3.1-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2476 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk)
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk unihash changed to 17b3d5830e31ad3b0e5a370d0fcd25714d0653a50cc1ab3da4a43b533f620d3d
NOTE: Running task 2477 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb)
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_deb unihash changed to b6bdc2a5fd01295fd5326101d5baccccdafdd0304e35d6b8a6ec1aa5bcbaf53f
NOTE: Running task 2478 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm)
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb: Started
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa unihash changed to 647ad6a1962527f3c2dfd036df5b0dcad351aaa710eee8c8c80f1664df813407
NOTE: Running task 2479 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk unihash changed to f1e87c72428f7ba27ba853309a65b72c93cd572ed2d13acd7d0518af112504fc
NOTE: Running task 2480 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk)
NOTE: recipe acl-2.3.2-r0: task do_package_qa: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb unihash changed to 013b6b6945f274be9fcd35d1b2e6be4376c1fff126288e5c0610e26cee92a9ed
NOTE: Running task 2481 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm unihash changed to 9179adfff948a53b57e14489107121468b5105d91a81edadac893e8aa338dcf4
NOTE: Running task 2482 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm)
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb unihash changed to 864b1a77256f914612e2b8d00b1427cf54837fdded02b14d61d1560d1be28246
NOTE: Running task 2483 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa unihash changed to 28a56c50bc5226b89937afd6ae031869e2a039b6f819e844858f9a5d249363ae
NOTE: Running task 2484 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_ipk)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb unihash changed to 2a105be3e6d29589e1d283dd6d37ea0a59c686df4471c3e664bdfef34aad1362
NOTE: Running task 2485 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_deb)
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_rpm unihash changed to 5f43097bf4cb29798b4653d6d2df44dab0906660cbed1a70e8f1ef78356da412
NOTE: Running task 2486 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk unihash changed to d55efb97bdc1856d3c997937ee872eb0d6992bc5a1560b0149dec4983e05eb69
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk unihash changed to 9631bb6402b70c4bf2f3172dd328eef382cc8a6b6e57078db4f13f8525613a53
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_qa unihash changed to 893ad043f70ae8621c48f0fd3c2ea219f62a6b90605a3cf365ef817fd2da7ddd
NOTE: Running task 2487 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa)
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk unihash changed to a984766e65431c34e579556029456bd720e2525f9a4ca55ab336fd3ef79ce259
NOTE: Running task 2488 of 2489 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_package_spdx)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb unihash changed to 16fe3f55b042f92f4d59fc04e21c88bdf08f646d65137a1f0c687740f8282dd0
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.6-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.6-r0: task do_create_package_spdx: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to cf97de778b592c7094f69084f97701ef0f3fd6e18699b0f7994a06d78ed360e4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa unihash changed to 07ce86c89eb04890417832227e689a7ae47eaa18e733e0c652a6d2b50b5cbcfa
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm unihash changed to 0c153fece1c318232e19ff47e1ff1bc0424b7c544f3f3f1c32c7a0389bc8a2a2
NOTE: recipe attr-2.5.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa unihash changed to 9f3d8d2b59312599c51df9fa41cbfd308690e05cbd7d05d69cf8df93d6ce544a
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm unihash changed to f3c33a58bc62576ad79acddf5bedf889e1430415092e443d8d06cc8373433793
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa unihash changed to c4728f390186206176ecd1116883e4c7d3ecd993fc6106369ac8ea043173bcc4
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm unihash changed to f66d456eccd042ed8d74ffb68e58aae000d5fdd72a18f7f40ea08524ba76ecce
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb unihash changed to ba2f5c4de82cbba1240c8d43a637bf345724f09880192d362c09a8a7015bfe12
NOTE: recipe coreutils-9.6-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2488 tasks of which 2442 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215064619.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215064619.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/coreutils/9.6/temp/log.do_package_qa.2599166
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: File /usr/lib/coreutils/ptest/Makefile in package coreutils-ptest contains reference to TMPDIR [buildpaths]
ERROR: coreutils-9.6-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/coreutils/9.6/temp/log.do_package_qa.2599166
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa) failed with exit code '1'

--===============3858183451317823287==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-coreutils-upgrade-9.5-9.6.patch"

RnJvbSBlNzkyZjA3M2E4ZjcxYjQ3YzljMWRhNjE0ZWE4ZDdkYWViMjIzZWY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6NDc6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
b3JldXRpbHM6IHVwZ3JhZGUgOS41IC0+IDkuNgoKLS0tCiAuLi5sb2NhbC5tay1maXgtY3Jvc3Mt
Y29tcGlsaW5nLXByb2JsZW0ucGF0Y2ggfCAgNiArKy0tLQogLi4uL2NvcmV1dGlscy9pbnRlcm1p
dHRlbnQtdGVzdGZhaWx1cmUucGF0Y2ggIHwgMTYgKysrKysrKysrLS0tLQogLi4uL3JlbW92ZS11
c3ItbG9jYWwtbGliLWZyb20tbTQucGF0Y2ggICAgICAgIHwgIDQgKystLQogLi4uL3tjb3JldXRp
bHNfOS41LmJiID0+IGNvcmV1dGlsc185LjYuYmJ9ICAgIHwgMjQgKysrKysrKysrKysrKysrKyst
LQogNCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMve2NvcmV1dGlsc185LjUuYmIgPT4gY29y
ZXV0aWxzXzkuNi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9jb3Jl
dXRpbHMvY29yZXV0aWxzLzAwMDEtbG9jYWwubWstZml4LWNyb3NzLWNvbXBpbGluZy1wcm9ibGVt
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy8wMDAxLWxvY2Fs
Lm1rLWZpeC1jcm9zcy1jb21waWxpbmctcHJvYmxlbS5wYXRjaAppbmRleCA5N2E2MzU3YWI5Li4y
OGIyZDljNDRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0
aWxzLzAwMDEtbG9jYWwubWstZml4LWNyb3NzLWNvbXBpbGluZy1wcm9ibGVtLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvMDAwMS1sb2NhbC5tay1maXgt
Y3Jvc3MtY29tcGlsaW5nLXByb2JsZW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdjYjJk
MjBjZmEyYTI3MTkxMjU1MDMxZDIzMWNkNDE5MTdkY2ZmZTggTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDBjMDM4ZDAyN2IzMTE3MTBmZDQ3OWNjMzgxNTNmMzljZGNjMzI2ZWYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDI2IERlYyAyMDE2IDE2OjEwOjM1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGxvY2FsLm1rOiBmaXggY3Jvc3MgY29tcGlsaW5nIHByb2JsZW0KQEAgLTE1LDEwICsxNSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9z
cmMvbG9jYWwubWsgYi9zcmMvbG9jYWwubWsKLWluZGV4IDk2ZWU5NDEuLmNkZDQ3ZDYgMTAwNjQ0
CitpbmRleCBmZDlkYzgxLi5lZjZlOTY4IDEwMDY0NAogLS0tIGEvc3JjL2xvY2FsLm1rCiArKysg
Yi9zcmMvbG9jYWwubWsKLUBAIC03MDQsNCArNzA0LDQgQEAgY3VfaW5zdGFsbF9wcm9ncmFtID0g
QElOU1RBTExACitAQCAtNzMxLDQgKzczMSw0IEBAIGN1X2luc3RhbGxfcHJvZ3JhbSA9IEBJTlNU
QUxMQAogIGVsc2UKICBjdV9pbnN0YWxsX3Byb2dyYW0gPSBzcmMvZ2luc3RhbGwKICBlbmRpZgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy9pbnRlcm1p
dHRlbnQtdGVzdGZhaWx1cmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29y
ZXV0aWxzL2ludGVybWl0dGVudC10ZXN0ZmFpbHVyZS5wYXRjaAppbmRleCAwNzk0NTMyYmRmLi5l
NGEyM2UzMDYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0
aWxzL2ludGVybWl0dGVudC10ZXN0ZmFpbHVyZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9jb3JldXRpbHMvY29yZXV0aWxzL2ludGVybWl0dGVudC10ZXN0ZmFpbHVyZS5wYXRjaApAQCAt
MSw0ICsxLDcgQEAKLXRlc3RzL2RmOiBGaXggaW50ZXJtaXR0ZW50IHRlc3QgZmFpbHVyZQorRnJv
bSBjNzdmZWEwNjQwNjVhOTA2NjY1Njg1ZjJlNTMxZmUwM2IxMzExODFkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CitEYXRlOiBUaHUsIDggQXVnIDIwMjQgMTA6Mzc6NTggKzAxMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gdGVzdHMvZGY6IEZpeCBpbnRlcm1pdHRlbnQgdGVzdCBmYWlsdXJlCiAKIFRo
ZSB0ZXN0IHdyaXRlcyB0byB0aGUgZGlzayBhbmQgbWVhbnMgdGhlIHNwYWNlIHVzZWQgY2hhbmdl
cy4gSWYgdGhpcwogY3Jvc3NlcyBhIG51bWJlciBib3VuZGFyeSwgdGhlIGhlYWRpbmcgc3BhY2lu
ZyBjYW4gY2hhbmdlOgpAQCAtMTIsMTEgKzE1LDE0IEBAIHRoZSBzcGFjaW5nIGRvZXNuJ3QgbWF0
dGVyLiBUaGVyZWZvcmUgc3RyaXAgYW55IGR1cGxpY2F0ZSBzcGFjZXMgdXNpbmcgdHIuCiBTdWJt
aXR0ZWQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9jb3JldXRpbHMvY29yZXV0aWxzL3B1bGwvODgKIFVw
c3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9jb3JldXRpbHMvY29y
ZXV0aWxzL2NvbW1pdC9jNTcyNWM4YzRiYjIxOTAzNDkwYTQ4MDM1Mjg2ZDBmOTQ0NjM2NDJlXQog
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CistLS0KKyB0ZXN0cy9kZi9kZi1QLnNoIHwgNCArKy0tCisgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAotSW5kZXg6IGNvcmV1dGlscy05
LjUvdGVzdHMvZGYvZGYtUC5zaAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGNvcmV1dGlscy05LjUub3JpZy90
ZXN0cy9kZi9kZi1QLnNoCi0rKysgY29yZXV0aWxzLTkuNS90ZXN0cy9kZi9kZi1QLnNoCitkaWZm
IC0tZ2l0IGEvdGVzdHMvZGYvZGYtUC5zaCBiL3Rlc3RzL2RmL2RmLVAuc2gKK2luZGV4IGQzNTU5
N2YuLjMwYjNlZjEgMTAwNzU1CistLS0gYS90ZXN0cy9kZi9kZi1QLnNoCisrKysgYi90ZXN0cy9k
Zi9kZi1QLnNoCiBAQCAtMjAsOCArMjAsOCBAQAogIHByaW50X3Zlcl8gZGYKICAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvcmVtb3ZlLXVzci1sb2Nh
bC1saWItZnJvbS1tNC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRp
bHMvcmVtb3ZlLXVzci1sb2NhbC1saWItZnJvbS1tNC5wYXRjaAppbmRleCA3MThkZTBhYjc4Li42
MzY0ZjA3MjAxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0
aWxzL3JlbW92ZS11c3ItbG9jYWwtbGliLWZyb20tbTQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy9yZW1vdmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNTNmZmI1YjI3YWI3ZDRhNGM2MmRmMDBlYmQ2YTFh
NjkzNmQxNzA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MDZjNWVmYzMyOTZiNWMz
MjM3ZjgxYmEyYjlmYzhlOTZmNzk1MjAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBBdWcgMjAxMSAxNDox
MjozMCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb3JldXRpbHM6IEZpeCBidWlsZCBvbiB1Y2xp
YmMKQEAgLTE3LDcgKzE3LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtVcHN0
cmVhbSBkb2VzIGNhcmUgZm9yIEFJWCB3aGlsZSB3ZSBtYXkgbm90XQogIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL200L2dldGxvYWRhdmcubTQgYi9tNC9n
ZXRsb2FkYXZnLm00Ci1pbmRleCA5ZDAyMzZmLi42OGY3YzUyIDEwMDY0NAoraW5kZXggOGFiNjEz
ZC4uNWFmNzU3MSAxMDA2NDQKIC0tLSBhL200L2dldGxvYWRhdmcubTQKICsrKyBiL200L2dldGxv
YWRhdmcubTQKIEBAIC00NiwxOCArNDYsNiBAQCBpZiB0ZXN0ICRhY19jdl9mdW5jX2dldGxvYWRh
dmcgIT0geWVzOyB0aGVuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMv
Y29yZXV0aWxzXzkuNS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNf
OS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2NvcmV1dGlscy9jb3JldXRpbHNfOS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9j
b3JldXRpbHMvY29yZXV0aWxzXzkuNi5iYgppbmRleCA1MzcyMzE4MzEyLi4xYTA4MjA4YThiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzkuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzkuNi5iYgpAQCAtMSwz
ICsxLDIzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL2xzLmMKKyMgKysrIHNyYy9scy5j
CisjIEBAIC0xLDUgKzEsNSBAQAorIyAgLyogJ2RpcicsICd2ZGlyJyBhbmQgJ2xzJyBkaXJlY3Rv
cnkgbGlzdGluZyBwcm9ncmFtcyBmb3IgR05VLgorIyAtICAgQ29weXJpZ2h0IChDKSAxOTg1LTIw
MjQgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjICsgICBDb3B5cmlnaHQgKEMpIDE5
ODUtMjAyNSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgIAorIyAgICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnkKKyMgICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIAorIworCiBTVU1NQVJZID0gIlRoZSBiYXNpYyBm
aWxlLCBzaGVsbCBhbmQgdGV4dCBtYW5pcHVsYXRpb24gdXRpbGl0aWVzIgogREVTQ1JJUFRJT04g
PSAiVGhlIEdOVSBDb3JlIFV0aWxpdGllcyBwcm92aWRlIHRoZSBiYXNpYyBmaWxlLCBzaGVsbCBh
bmQgdGV4dCBcCiBtYW5pcHVsYXRpb24gdXRpbGl0aWVzLiBUaGVzZSBhcmUgdGhlIGNvcmUgdXRp
bGl0aWVzIHdoaWNoIGFyZSBleHBlY3RlZCB0byBleGlzdCBvbiBcCkBAIC02LDcgKzI2LDcgQEAg
SE9NRVBBR0UgPSAiaHR0cDovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2NvcmV1dGlscy8iCiBCVUdU
UkFDS0VSID0gImh0dHA6Ly9kZWJidWdzLmdudS5vcmcvY29yZXV0aWxzIgogTElDRU5TRSA9ICJH
UEwtMy4wLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
MWViYmQzZTM0MjM3YWYyNmRhNWRjMDhhNGU0NDA0NjQgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vc3JjL2xzLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0xNTttZDU9OWFjOTRhYWVkN2ZkNDZm
ZDhkZjcxNDdhOWUzNDEwY2IgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2xzLmM7
YmVnaW5saW5lPTE7ZW5kbGluZT0xNTttZDU9ODI0YzE5OTc0MTRhZWE5ZjM0NDc0N2JkODFjZjVh
MzEgXAogICAgICAgICAgICAgICAgICAgICAiCiBERVBFTkRTID0gImdtcCBsaWJjYXAiCiBERVBF
TkRTOmNsYXNzLW5hdGl2ZSA9ICIiCkBAIC0xOSw3ICszOSw3IEBAIFNSQ19VUkkgPSAiJHtHTlVf
TUlSUk9SfS9jb3JldXRpbHMvJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL2ludGVy
bWl0dGVudC10ZXN0ZmFpbHVyZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3Qg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2QzMjhlZGVhYzkyZjZhNjY1
ZGU5ZjMyM2M5M2I3MTJhZjE4NThiYzJlMGQ4OGYzZjcxMDA0Njk0NzBhMWI4YSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI3YTAxMjQzMjdiMzk4ZmQ5ZWIxYTZhYmRlNTgzMzg5ODIxNDIyYzc0NGZm
YTEwNzM0YjI0ZjU1NzYxMGQzMjgzIgogCiAjIGh0dHA6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9j
Z2l0L2NvcmV1dGlscy5naXQvY29tbWl0Lz9pZD12OC4yNy0xMDEtZ2Y1ZDdjMDg0MgogIwotLSAK
Mi40NC4xCgo=

--===============3858183451317823287==--

