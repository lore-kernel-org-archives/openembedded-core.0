Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C68DC83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.12491.1752594939845692264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tTMmRASe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cAkGaETY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101980ecc7c47-94a2e0bc-6d3a-4b46-a61f-82d36ee92613-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594939;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cD3egiDaObAPB1CI1Xf5vrNDICzN08c2qGjAWS24fJI=;
	b=tTMmRASeic3TBc9O6Lob3/1CqfgNyFfiun9Mae9o3TY8Mldi6anYl1Zi1/C+CBw1
	jsq3ohi6R60yAoUqKW2z0DlRh4LIQ8mBipyroNlqsrdz9ub/VWYD51sfQLtm4R24zoR
	LH59ZLf4pKyliUm+DSanq9Oq+HMKcZuLIW8pjoqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594939;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cD3egiDaObAPB1CI1Xf5vrNDICzN08c2qGjAWS24fJI=;
	b=cAkGaETYv9nCx4dhpYi3p7pdLBkTq5+IIZzqTcMIyht428o65O9V46MG+qbQqYsL
	TOPrZkwH+eOlD9iS5JxIF5dryc4r8/a4IAmfEz4pfM9Nd3Et3/J8l1CZI0hifiQs0Em
	xpKUU3Fj501oJdsPnvSxZX9oZdYENmMBV00No1xk=
Content-Type: multipart/mixed; boundary="===============8226063187163091071=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.47.3 FAILED
Message-ID: <010101980ecc7c47-94a2e0bc-6d3a-4b46-a61f-82d36ee92613-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220340

--===============8226063187163091071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *e2fsprogs* to *1.47.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-e2fsprogs-upgrade-1.47.1-1.47.3.patch
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
From 4642f3482df9ad9fcf6b60ceec0243e42e9fb583 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:28:21 +0000
Subject: [PATCH] e2fsprogs: upgrade 1.47.1 -> 1.47.3

---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/mkdir_p.patch         |  4 +-
 .../e2fsprogs/e2fsprogs/ptest.patch           |  8 ++--
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 +--
 .../e2fsprogs/remove.ldconfig.call.patch      |  2 +-
 ...2fsprogs_1.47.1.bb => e2fsprogs_1.47.3.bb} |  5 +--
 7 files changed, 12 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb => e2fsprogs_1.47.3.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
deleted file mode 100644
index 01ab9d5afb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 22 Nov 2024 12:36:32 +0000
-Subject: [PATCH] libext2fs: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `e2fsprogs` fails the build so only typedef int bool
-for __STDC_VERSION__ <= 201710L (C17)
-
-    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
-    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
-      113 | typedef int bool;
-          | ^~~~~~~
-
-https://github.com/tytso/e2fsprogs/issues/202
-
-Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ext2fs/tdb.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
-index b07b2917..98dc95d8 100644
---- a/lib/ext2fs/tdb.c
-+++ b/lib/ext2fs/tdb.c
-@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
- #endif
- #endif
- 
-+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef int bool;
-+#endif
- 
- #include "tdb.h"
- 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 4cd1098597..3bf30c5078 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
+From bc80ff3c25d1494bf993f7440aedff4270e9db29 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index 2dbeba1095..03b7433d67 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,4 +1,4 @@
-From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
+From b6aac5c234fe84a5075362cc748cdc84ef1e79cd Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Tue, 7 Mar 2017 14:53:19 -0800
 Subject: [PATCH] e2fsprogs: expand @mkdir_p@
@@ -14,7 +14,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 131caef3..ca448d97 100644
+index bdd5f1f6..19af9c48 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index f4e1057a36..785c2e9cae 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,4 +1,4 @@
-From 25db5ac7469cedd043a04bcf49ce7553979fbb32 Mon Sep 17 00:00:00 2001
+From 49097146eb3ba8efcb2e0b88a2fef1c87a6c6a43 Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
 Date: Sat, 18 Apr 2015 17:58:17 +0300
 Subject: [PATCH] e2fsprogs: add ptest
@@ -14,10 +14,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/tests/Makefile.in b/tests/Makefile.in
-index ba06b3b6..5a3e48f4 100644
+index 678cc326..58f75900 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
-@@ -20,7 +20,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
+@@ -21,7 +21,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -26,7 +26,7 @@ index ba06b3b6..5a3e48f4 100644
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
-@@ -31,7 +31,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
+@@ -33,7 +33,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
  	@echo "Creating test_script..."
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 4ba150e27d..41e469c29b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
+From 9fe426f8bc01dc0885a07e232aa057288e649d63 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 909c1df3..0842369e 100644
+index b9f248be..b0380975 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2518,7 +2518,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
index 307088d42b..4ce6dfac5c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/remove.ldconfig.call.patch
@@ -1,4 +1,4 @@
-From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
+From b09ea1ab1d4990b2a6198c193c71b8c0c09957df Mon Sep 17 00:00:00 2001
 From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
 Date: Wed, 30 Jan 2013 15:22:04 +0200
 Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbake
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
index 022b016f12..46ca2b5e31 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
@@ -4,14 +4,11 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-libext2fs-fix-std-c23-build-failure.patch \
-           "
-SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "b571b9b4240739a982e8bca62cfc914a3b50190a"
+SRCREV = "46fe1454548d29cc92ab252b0a3a9cc11c245d1c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.47.1


--===============8226063187163091071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1930 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (940 cached, 1 parsed). 1928 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b659c4bee985b111aee78f3849e2efef946fdbb0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b659c4bee985b111aee78f3849e2efef946fdbb0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 483 Local 237 Mirrors 0 Missed 246 Current 329 (49% match, 69% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 67 stale sstate objects for arch qemux86_64...done.
Removing 45 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 514 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 538 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 568 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 620 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 664 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 666 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 670 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 672 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 683 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 687 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 697 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 702 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 704 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 723 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 728 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 729 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 732 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 733 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 734 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 740 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 741 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 748 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 750 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 753 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 755 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 765 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 766 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 767 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 773 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 776 of 812 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 781 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 396 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 789 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 484 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_unpack)
NOTE: Running task 485 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 530 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 790 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 607 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running noexec task 617 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 621 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 629 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 631 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running task 633 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 635 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 649 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: Running task 651 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 675 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 791 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 792 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 676 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: Running task 679 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 686 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 688 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 692 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 701 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 709 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 796 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: Running task 755 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe python3-3.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 756 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Started
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 758 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 759 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 760 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Started
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_fetch: Succeeded
NOTE: Running task 763 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: Running task 764 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running task 775 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_fetch)
NOTE: Running task 782 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_fetch)
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Started
NOTE: Running task 801 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 807 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 837 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running task 840 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_unpack)
NOTE: recipe python3-3.13.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running task 842 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 845 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_fetch)
NOTE: Running task 846 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 847 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_unpack)
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 849 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: Running task 853 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: Running task 855 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_unpack)
NOTE: recipe libffi-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Started
NOTE: Running task 856 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_unpack)
NOTE: Running task 859 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 860 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe libffi-3.5.1-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: Running task 861 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-3.13.5-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Started
NOTE: Running task 865 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 889 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: Running task 941 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 943 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: Running task 945 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 951 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: Running task 953 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 960 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 964 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: Running task 965 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 966 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 967 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: Running task 968 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: Running task 970 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 971 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: Running task 973 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 979 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 980 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 981 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: Running task 1004 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: Running task 1016 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: Running task 1017 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1024 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1033 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: Running task 1050 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: Running task 1051 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: Running task 1065 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: Running task 1066 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: Running task 1069 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: Running task 1070 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: Running task 1072 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe python3-3.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_patch)
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: Running task 1080 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1085 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Succeeded
NOTE: Running task 1090 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: Running task 1091 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1092 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_patch)
NOTE: recipe openssl-3.5.1-r0: task do_patch: Started
NOTE: Running task 1093 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe python3-3.13.5-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 1096 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: Running task 1102 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_configure: Started
NOTE: Running task 1103 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: Running task 1105 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: Running task 1111 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1112 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: Running task 1114 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: Running task 1115 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe openssl-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1118 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 1121 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1128 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: Running task 1129 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 1130 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1132 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: Running task 1135 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1136 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1140 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 1141 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: Running task 1144 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 1152 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: Running task 1153 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1154 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1155 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa)
NOTE: Running task 1174 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: Running task 1176 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_fetch)
NOTE: Running task 1177 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1186 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1187 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1188 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe diffutils-3.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1189 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 1204 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: Running task 1205 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1209 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1210 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1225 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1229 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Started
NOTE: recipe python3-3.13.5-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: Running task 1232 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1243 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1244 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running task 1247 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: Running task 1248 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1249 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe diffutils-3.12-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: Running task 1251 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1252 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1257 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1258 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: Running task 1259 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1264 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Started
NOTE: Running task 1265 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1274 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe diffutils-3.12-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 1282 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: Running task 1292 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: Running task 1293 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1294 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1298 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1299 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe diffutils-3.12-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: Running task 1300 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running task 1301 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: Running task 1303 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe diffutils-3.12-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: Running task 1310 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: Running task 1315 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1316 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: Running task 1325 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1331 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1333 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: Running task 1340 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: Running task 1341 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Running task 1342 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: Running task 1344 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: Running task 1345 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1361 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1362 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: Running task 1384 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: Running task 1385 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1388 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1394 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: Running task 1397 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1399 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1403 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_warn_musl)
NOTE: Running task 1404 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1405 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1406 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Started
NOTE: Running task 1407 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Succeeded
NOTE: Running task 1427 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1458 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: Running task 1461 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_collect_spdx_deps)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1466 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 1468 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_lic)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1469 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1470 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1471 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_lic: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: Running task 1473 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1474 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_lic: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1475 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_patch)
NOTE: Running task 1476 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_collect_spdx_deps)
NOTE: Running task 1477 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_patch)
NOTE: Running task 1479 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: Running task 1482 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Succeeded
NOTE: Running noexec task 1484 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_configure)
NOTE: Running noexec task 1485 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_compile)
NOTE: Running task 1486 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_install)
NOTE: recipe systemd-1_257.6-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_patch: Succeeded
NOTE: Running task 1490 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Succeeded
NOTE: Running task 1508 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_configure)
NOTE: recipe glibc-2.41+git-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_compile)
NOTE: recipe glibc-2.41+git-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 1513 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1514 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_configure)
NOTE: recipe libarchive-native-3.8.1-r0: task do_configure: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_compile)
NOTE: recipe libarchive-native-3.8.1-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_install)
NOTE: recipe libarchive-native-3.8.1-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1518 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1519 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.193-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.193-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_configure)
NOTE: recipe elfutils-native-0.193-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.193-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_compile)
NOTE: recipe elfutils-native-0.193-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.193-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_install)
NOTE: recipe elfutils-native-0.193-r0: task do_install: Started
NOTE: recipe elfutils-native-0.193-r0: task do_install: Succeeded
NOTE: Running task 1523 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.193-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.193-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1524 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1525 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: Running task 1527 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1528 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1530 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1533 of 2222 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1534 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package)
NOTE: Running task 1535 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1536 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: Running task 1537 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1538 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 82dd9f6ece420d22fd4874cae3d41e14460c855041c45a809fc0288c81e9f2e9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to 14cb00e2e55a1cea571133e653c9aae26b193e17a3eb73aa4daf563f1ac565a4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: Running task 1540 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx became valid
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to 5905b40c1527609cb0fe44e61252861e2254e6c9959157cbbca4732d1ff135a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.41+git-r0: task do_compile: Succeeded
NOTE: Running task 1547 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_install)
NOTE: recipe linux-libc-headers-6.15-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package unihash changed to 7758407397e69d2f11498f59bdd18d15bb1ef629282cdbf25e9cc451fa9d119d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata became valid
NOTE: recipe glibc-2.41+git-r0: task do_install: Started
NOTE: Running setscene task 779 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1554 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1558 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package)
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_configure)
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_compile)
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_install)
NOTE: recipe libgcc-15.1.0-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1562 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_multilib_install)
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1563 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1565 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_configure)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package unihash changed to a4da2d6aa55426d7f6266bb56522229a92a48cc3694b910907f1f8ae9b1297a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx became valid
NOTE: Running setscene task 772 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1568 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package)
NOTE: Running task 1570 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.1.0-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package unihash changed to be2c2b247d6846d5534a8a76b9e5880fda154f3a37574277d50a1388410c2f24
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata became valid
NOTE: Running setscene task 774 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1573 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1574 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1582 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1585 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1586 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1588 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1589 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1591 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1592 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1593 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1594 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1595 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1596 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Started
NOTE: Running task 1597 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1599 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_configure)
NOTE: Running task 1601 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: Running task 1602 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1604 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_configure)
NOTE: Running task 1605 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Started
NOTE: Running task 1606 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_configure)
NOTE: Running task 1607 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_configure)
NOTE: Running task 1608 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe libffi-3.5.1-r0: task do_configure: Started
NOTE: Running task 1609 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_configure: Started
NOTE: Running task 1610 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1611 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Started
NOTE: Running task 1612 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: Running task 1614 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1616 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_configure: Started
NOTE: Running task 1622 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1623 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1625 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile)
NOTE: Running task 1626 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.7.1-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1628 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1629 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1631 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1634 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1635 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_install)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1637 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: Running task 1642 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Succeeded
NOTE: Running task 1643 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1644 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1645 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package unihash changed to 5d1408cd30f4b92a157e57d4d4bc0ec71eaaab2acde73b97b763160eedd4c99f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running setscene task 683 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1646 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: Running task 1647 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1649 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1650 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running task 1651 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: Running task 1653 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Started
NOTE: Running task 1654 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1656 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1657 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libffi-3.5.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1661 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1663 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.5.1-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1664 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: Running task 1666 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1668 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_install)
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 35f9b624b87be8d6b754a9a233fce3b0e31c0f5939a527361cf404075418628c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_install)
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1673 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package)
NOTE: recipe libffi-3.5.1-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1675 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1676 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Started
NOTE: recipe libffi-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 1678 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_package)
NOTE: recipe libffi-3.5.1-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 1d0e4f303a7ad63a920c89edb278acf3539da6383f9db941831d440db62856d0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_configure: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Succeeded
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1679 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_configure_ptest_base)
NOTE: Running task 1680 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: Running task 1681 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package unihash changed to 03676175a59a7130eca2224ce62929de2da85b38232470ad04dbd8771c5ff5b7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata became valid
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Succeeded
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1682 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_compile)
NOTE: Running task 1684 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: Running task 1687 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_compile: Started
NOTE: Running task 1688 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to bd254c3face787bf50373f00be38b4527268f76fea2314d4c68c6caaa7c00c28
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe libffi-3.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_package unihash changed to bae8c0c58c87e5b2ae3535929e2dba7adfa0ebe34d09889e1f1408db0bcee073
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx became valid
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1689 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: Running task 1690 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: Running task 1693 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package)
NOTE: Running task 1694 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1695 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1696 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1698 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1700 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1701 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1703 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1707 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1708 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package unihash changed to 28908a549d793e2687463725af3eb4e66f7cfa7ce5a1cfaed8f125dda94f4956
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: Running task 1709 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure_ptest_base)
NOTE: Running task 1710 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: Running task 1711 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1712 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata_setscene)
NOTE: Running task 1713 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1715 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1717 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: Running task 1718 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1720 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 1d6f65b2ee5d6c307d003396b051697640b41eda2b0140092154f81ebdfe4b56
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 1723 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package unihash changed to 846b736897be3465eeaa57aad9d7e016f83c440acb84986edfbd6f04569a1460
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx became valid
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 7badb5e3fb16d6005e50d39f6f02f64ce0039f71d408723183a54b87860592d9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: recipe xz-5.8.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 789 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running task 1724 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile_ptest_base)
NOTE: Running task 1725 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: Running task 1727 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1729 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1731 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure)
NOTE: recipe diffutils-3.12-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1734 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1735 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1736 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Running task 1738 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 3e69ba79b2b1bee48e2a1b977b7ba15bf914cc5572c4bea0b5546386be37eef5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1739 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: Running task 1742 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: Running task 1743 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1745 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1748 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1750 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe libpcre2-10.45-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: Running task 1753 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe libpcre2-10.45-r0: task do_install: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 1763 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: Running task 1764 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1765 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: Running task 1766 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1770 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_install: Succeeded
NOTE: Running task 1771 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1772 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Started
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1774 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1775 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1776 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 1789 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package)
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1790 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to 122b45650138da7519c12147d957d939491d4dd96cd9f6c127d4fccaf494e59d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running setscene task 804 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: Running task 1791 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: Running task 1792 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Succeeded
NOTE: Running task 1794 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1796 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1798 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: Running task 1800 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1801 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to b076cc0d31e927fbc75dc1396d6a88f9dfe842e2aea28a3a6ac355170410e952
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package unihash changed to b030b81b16ad89c2afab6c5aa4917e9f4034087f95972f046db2a6eecb2e0589
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata became valid
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: Running task 1804 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1806 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1808 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package)
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package unihash changed to 403092f5de198db259d2864d6fa9d55f3639afe28d22f5676ba2bf1a9804fff8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata became valid
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to fe4774a8aa10f3208eec13480f7235084857fe3828606299693ea1c878f864d5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx became valid
NOTE: Running setscene task 790 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx_setscene)
NOTE: Running task 1809 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package unihash changed to e9c2bae2d5773a874efde716d7138f1e04e0b42ff96666b176cd39e2df6d30cd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx became valid
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 797 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: Running task 1814 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1816 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1819 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1820 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package)
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_package: Started
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1823 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1824 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to f2d3b68abe236ccba54f85631cd0e6b8e669b901bce2273f0084b14eaa8fe7d0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package unihash changed to 6e6c43f2d0612c2b53e3dab36a9ba46be25ac7ab39a202c9e67a8407d67e2572
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to cf59df92b28f2a1f9a22927635be9fd62518502d6aa55b7154e7bc4c4cfa48ee
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx became valid
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 796 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1825 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: Running task 1827 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1829 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1830 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package unihash changed to 0d8c325799e12d4eec673feb7b5d07569c49ada6732ade1dd6d84165c49c59ab
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1832 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to df39e29a85d0a31428c4ebc1675588a6e583f42e440be6e2b45194b2edc319c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to dec0de9a9a0fffb0395302a2c6557fbf9fc1fe466e694a54f177977ef56894b9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 66139b46e6e2d5b300662d35f5f9e628b8756876ecea1240b76331a09ecb4cc4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 804 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running task 1833 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1839 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: Running task 1840 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1843 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1846 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 929f6b3110dd7598a4d94c0a57d9aa478e1937a331d508f557e4a78c80260146
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1854 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1861 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1868 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1869 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1870 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_configure)
NOTE: Running noexec task 1871 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_compile)
NOTE: Running task 1872 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_install)
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to 9180187dd45aed6d55909fc085f3333de8f453697ff267c073a8747cb24ef698
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx became valid
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 1874 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1875 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe shadow-4.18.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1891 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1904 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1907 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1908 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to cc407db7a31a54bec250929ca60160a9ba25122cfb3905ca11f1cbe0e8f30ef7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running task 1911 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1912 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_collect_spdx_deps)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1913 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: Running task 1914 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1917 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1918 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe shadow-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1921 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package)
NOTE: Running task 1922 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1924 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1928 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Succeeded
NOTE: Running task 1931 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Started
NOTE: Running task 1932 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Started
NOTE: recipe shadow-4.18.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package unihash changed to 7f82f5711552296887e89024331da5aa7d84a08db30004ff6638ca81686bdea5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1935 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1936 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 9ac996d235f956b1e647eef6118019f1b05b31402a64254fa209139059b137ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running task 1938 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1940 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1943 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: Running task 1944 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package unihash changed to 334d2ae18044e14c817751010f82dec824c7e9988491c50f6825dea022f42bbb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata became valid
NOTE: Running setscene task 796 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1946 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to 1ca7d39e94a4e9faec30b38213a3fea9945e3f0badc0602e4371731788302818
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx became valid
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1949 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to dfb556e466e951a9c5115a7fa7d27951179544f2fd387ee8b9a645b5c70dada1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffutils-3.12-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1954 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile)
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to bbd02d10e445c7a87873fa45f7be314c1115e55e42e66264dc38dab8ded382f3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: recipe diffutils-3.12-r0: task do_compile: Started
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to eb21f5a6bfb01e317bd0deba636592831943499b4b8b2f2ba08e04d066d77a52
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1959 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_install)
NOTE: recipe openssl-3.5.1-r0: task do_install: Started
NOTE: recipe diffutils-3.12-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1961 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install)
NOTE: recipe diffutils-3.12-r0: task do_install: Started
NOTE: recipe openssl-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_install_ptest_base)
NOTE: recipe openssl-3.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_install: Succeeded
NOTE: Running task 1963 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1964 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package)
NOTE: recipe diffutils-3.12-r0: task do_package: Started
NOTE: recipe diffutils-3.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package unihash changed to ac338fe9a45ce6c9be33c4fbb86552f47a5e440b0d4e1ca46ad070263bb2e010
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_create_spdx_setscene)
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1968 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1970 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1972 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1973 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1975 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_configure)
NOTE: recipe readline-8.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_configure)
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1978 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure)
NOTE: Running task 1979 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe readline-8.2.13-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_configure: Started
NOTE: Running task 1980 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_configure: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1982 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe readline-8.2.13-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_compile)
NOTE: recipe readline-8.2.13-r0: task do_compile: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Succeeded
NOTE: Running task 1986 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_compile)
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1988 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_install: Started
NOTE: recipe readline-8.2.13-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_install)
NOTE: recipe readline-8.2.13-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 632f3357c33e630c8d631a18660a9f8d664f2cc9e49c6cbaf86e204464cfb572
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx became valid
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to a9352ed3ea80c3b385cf0205157be4ea38939a3638be29be995c37048ae6f1ef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_install: Succeeded
NOTE: Running setscene task 775 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running task 1990 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_install)
NOTE: Running task 1992 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1994 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_package)
NOTE: Running task 1995 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1998 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure)
NOTE: recipe perl-5.40.2-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2002 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_collect_spdx_deps)
NOTE: Running task 2003 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_install: Succeeded
NOTE: Running task 2004 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.2-r0: task do_configure: Started
NOTE: Running task 2005 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Succeeded
NOTE: Running task 2006 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 2008 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Started
NOTE: Running task 2009 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_package: Started
NOTE: Running task 2010 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile)
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.40.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: Running task 2012 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_package: Started
NOTE: recipe python3-3.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2013 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_configure)
NOTE: recipe python3-3.13.5-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_package unihash changed to c50efec047ecae5ab0d0c769c61e37cf910a3146598708ffa7b472ae0a0b17b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata became valid
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package unihash changed to 18c861c39fe768396214e82325774579ef675e5e10bbb3496d3f2f638c20f7c7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx became valid
NOTE: Running setscene task 768 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 2015 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2018 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package unihash changed to b43104eb80c92f3a7f6ee3e4fcfc32961bbdb78a9c845781a635814c5352befc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Running task 2024 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2025 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile)
NOTE: recipe coreutils-9.7-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 24d8096bbc40ec9a7b9c5499c8e2046e9832b08a4cc96b8654c8dd6ef2835e10
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2027 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile)
NOTE: recipe bash-5.2.37-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2031 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 23b48cff9b2bd91e24ff699a981a38dc17614ff9b4bc9bd22db27f5419cf0164
NOTE: recipe openssl-3.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_package unihash changed to 6d0719bd76cd17c79e238b0636f5b3233367b1a3ebecaa532ce7252c94aa295d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx became valid
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2034 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 2036 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_collect_spdx_deps)
NOTE: Running task 2037 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe python3-3.13.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to e1be6a4e07bc77bbac8ce7d9aa6e022c1c699915fb747ba6f13ffc649e6c944e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.41-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2042 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install)
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2043 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile)
NOTE: recipe bash-5.2.37-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_install: Started
NOTE: Running task 2044 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2046 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_install: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2047 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2048 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile)
NOTE: recipe gawk-5.3.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2049 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package)
NOTE: recipe coreutils-9.7-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2053 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install)
NOTE: recipe util-linux-2.41-r0: task do_install: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2055 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2056 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package)
NOTE: recipe gawk-5.3.2-r0: task do_install: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Started
NOTE: recipe util-linux-2.41-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2060 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_package: Started
NOTE: recipe gawk-5.3.2-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_install_ptest_base)
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2063 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package unihash changed to a29d50017ffa05e556abb3359304c1e5e0d252dc76739ccf7869553b3dc15e5e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa became valid
NOTE: Running setscene task 803 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 804 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2064 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm unihash changed to ebb4a980383a8bc4ea6ff9b0459ebd4e474f11e37348a54e0c52a291a3db4ec4
NOTE: recipe coreutils-9.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package unihash changed to 34dc7a4fe95ca722dec1dc680ec4e7133ef95557b4b977aef64ab2970d4d86f6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx became valid
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gawk-5.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package unihash changed to a15de9e86b36a2a844892f12ea03c50a7e8fca1b84261fd4249e23f46d16b0bf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.13.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2074 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_configure_ptest_base)
NOTE: recipe python3-3.13.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.13.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2075 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_compile)
NOTE: recipe python3-3.13.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 2076 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2077 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Started
NOTE: recipe perl-5.40.2-r0: task do_compile: Succeeded
NOTE: Running task 2078 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2079 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package unihash changed to 5b34705f02d6326c521ff24c6116dda430cb74bb95a14bbb3de21aad88800187
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata became valid
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2082 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2083 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2084 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe python3-3.13.5-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Started
NOTE: recipe python3-3.13.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2086 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_install)
NOTE: recipe python3-3.13.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 2087 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2088 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package)
NOTE: Running task 2089 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Succeeded
NOTE: Running task 2090 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2091 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2093 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_package: Started
NOTE: recipe python3-3.13.5-r0: task do_install: Succeeded
NOTE: Running task 2095 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_install_ptest_base)
NOTE: recipe python3-3.13.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.13.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2097 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2098 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2099 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package)
NOTE: recipe libxml2-2.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.13.5-r0: task do_package: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_configure)
NOTE: recipe libxml2-2.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_configure)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_configure: Started
NOTE: recipe libxml2-2.14.3-r0: task do_configure: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2102 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_compile)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_install)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_install: Succeeded
NOTE: Running task 2105 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2106 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package unihash changed to da92c583abc756661319a9ae3e8a08c63ad73278179f9dbcbe10f90bb1b0b4ad
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_packagedata became valid
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.14.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.14.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2108 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_compile)
NOTE: recipe libxml2-2.14.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package unihash changed to da493052c6ae1498ebe6dd0f26de76851241e5716712a0b166a86bd52e16f66a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata became valid
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: Running task 2111 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_package)
NOTE: Running task 2115 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_collect_spdx_deps)
NOTE: Running task 2116 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package: Started
NOTE: recipe libxml2-2.14.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.14.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 2118 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2119 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.14.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2120 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.14.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.14.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2121 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_install)
NOTE: recipe libxml2-2.14.3-r0: task do_install: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_package unihash changed to fb5bc5313cc28ae48eb4a6b368c1e4384409a27137de2973fbf74f6baedd4390
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2123 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: Running task 2125 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_install: Succeeded
NOTE: Running task 2126 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.14.3-r0: task do_install_ptest_base: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to b777a8d81c62be7e7df794392e40b5c8358d802f8a74990a18e5b641cbe756e4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx became valid
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2129 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2130 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2131 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Started
NOTE: recipe libxml2-2.14.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2133 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package)
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package: Started
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2135 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure)
NOTE: recipe wayland-1.23.1-r0: task do_configure: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2137 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile)
NOTE: recipe wayland-1.23.1-r0: task do_compile: Started
NOTE: recipe wayland-1.23.1-r0: task do_compile: Succeeded
NOTE: Running task 2138 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2139 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install)
NOTE: recipe wayland-1.23.1-r0: task do_install: Started
NOTE: recipe wayland-1.23.1-r0: task do_install: Succeeded
NOTE: Running task 2140 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install_ptest_base)
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2142 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2143 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2144 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_install)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package unihash changed to 0c1458afec45eedacb70de8850735fbf10d47f31940f3783dda914fc69136830
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx became valid
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2148 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package)
NOTE: Running task 2150 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.23.1-r0: task do_package: Started
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Succeeded
NOTE: Running task 2151 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2152 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Succeeded
NOTE: Running task 2153 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2155 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2156 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2157 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe wayland-1.23.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package unihash changed to 56204345c0438477837c68d586bc687e4e98df723850744bf9891f327490c1a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata became valid
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2159 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package)
NOTE: Running task 2161 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2162 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package unihash changed to f6eda4d0ebb4aa15a7bccc0954797c0c65ebed8141f4daf65f66b6a5ffaf0431
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2165 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2167 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_257.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_257.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2168 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_configure)
NOTE: recipe systemd-1_257.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package unihash changed to fce5eb68fc02cd9fe010e514355db683091061ca4eecee8e666344a1286b36d8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata became valid
NOTE: Running setscene task 809 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2170 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: Running task 2172 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package unihash changed to 8ad8562455bf36c5922b977b5780e24b48a71efc81e1a307fc45462a92b439eb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa became valid
NOTE: Running setscene task 787 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 788 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 789 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 792 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 793 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 794 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 795 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 802 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 808 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 810 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2177 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm)
NOTE: Running task 2181 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: Running task 2185 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_rpm)
NOTE: Running task 2189 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.12-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package_write_rpm unihash changed to cad2e54becc88592c8afa5b2a7d19db8c709047c3622719b56879328e41dc826
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package unihash changed to 0f7c5b559d3c1584b737a0638cbbec460aee3631ffbc212f347c85914feae90c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm unihash changed to b89dac128b98f6d437f73e49acf9fd57ec3b98f17e31c6933ec3741a6431d3d1
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to 467df05f5323b1ced11a8beb4d59eb5b70ae0d6a2d3affa0efa79adad58c4d7f
NOTE: Setscene tasks completed
NOTE: Running task 2193 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_257.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_257.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm unihash changed to 37b2ec96fbfd1307009064a47f6beda45330e61a8e80a45488504f70d6deb11e
NOTE: recipe systemd-1_257.6-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_compile)
NOTE: recipe systemd-1_257.6-r0: task do_compile: Started
NOTE: recipe systemd-1_257.6-r0: task do_compile: Succeeded
NOTE: Running task 2195 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_install)
NOTE: recipe systemd-1_257.6-r0: task do_install: Started
WARNING: systemd-1_257.6-r0 do_install: Using /home/root as root user's home directory is not fully supported by systemd
NOTE: recipe systemd-1_257.6-r0: task do_install: Succeeded
NOTE: Running task 2196 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_package)
NOTE: Running task 2198 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-4.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_257.6-r0: task do_package: Started
NOTE: recipe procps-4.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2199 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_configure)
NOTE: recipe procps-4.0.5-r0: task do_configure: Started
NOTE: recipe systemd-1_257.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_package unihash changed to 910751df70a283ff9c07ab5f3c9955f5115b3d0a8b99dc54efed4eeb04767cc9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_packagedata became valid
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2202 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2203 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_compile)
NOTE: recipe procps-4.0.5-r0: task do_compile: Started
NOTE: recipe procps-4.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_install)
NOTE: recipe procps-4.0.5-r0: task do_install: Started
NOTE: recipe procps-4.0.5-r0: task do_install: Succeeded
NOTE: Running task 2205 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package)
NOTE: recipe procps-4.0.5-r0: task do_package: Started
NOTE: recipe procps-4.0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package unihash changed to fee426af454fac10638bb261248517b12a0b6a8824ba079cda1f5a7c5ec2bcfc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_create_spdx became valid
NOTE: Running setscene task 798 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 800 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 801 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 805 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 806 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 807 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 811 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 812 of 812 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2211 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_rpm)
NOTE: Running task 2215 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_rpm)
NOTE: Running task 2217 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_ipk)
NOTE: Running task 2218 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_deb)
NOTE: Running task 2219 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_write_rpm)
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm: Started
NOTE: Running task 2220 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_qa)
NOTE: Running task 2221 of 2222 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_create_package_spdx)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_ipk: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_deb: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_package_spdx: Started
NOTE: recipe procps-4.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_package_write_rpm unihash changed to 40c1d997b18017f6d605d2b212007de5c69d1d1d0b058369e6aa592db9eeb759
NOTE: recipe e2fsprogs-1.47.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package_qa: Failed
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2221 tasks of which 1535 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715091812.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715091812.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.3/temp/log.do_package_qa.3781791
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: e2fsprogs-1.47.3-r0 do_package_qa: QA Issue: File /usr/lib/e2fsprogs/ptest/test/test_one in package e2fsprogs-ptest contains reference to TMPDIR [buildpaths]
ERROR: e2fsprogs-1.47.3-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.3/temp/log.do_package_qa.3781791
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package_qa) failed with exit code '1'

--===============8226063187163091071==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.47.1-1.47.3.patch"

RnJvbSA0NjQyZjM0ODJkZjlhZDlmY2Y2YjYwY2VlYzAyNDNlNDJlOWZiNTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6Mjg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
MmZzcHJvZ3M6IHVwZ3JhZGUgMS40Ny4xIC0+IDEuNDcuMwoKLS0tCiAuLi4tbGliZXh0MmZzLWZp
eC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0Y2ggfCA0MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4tbWlzc2luZy1jaGVjay1mb3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2ggfCAgMiArLQogLi4u
L2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtkaXJfcC5wYXRjaCAgICAgICAgIHwgIDQgKy0KIC4uLi9l
MmZzcHJvZ3MvZTJmc3Byb2dzL3B0ZXN0LnBhdGNoICAgICAgICAgICB8ICA4ICsrLS0KIC4uLi9l
MmZzcHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMucGF0Y2ggICB8ICA2ICstLQogLi4uL2Uy
ZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaCAgICAgIHwgIDIgKy0KIC4uLjJmc3By
b2dzXzEuNDcuMS5iYiA9PiBlMmZzcHJvZ3NfMS40Ny4zLmJifSB8ICA1ICstLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy8wMDAxLWxpYmV4
dDJmcy1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2UyZnNwcm9ncy97ZTJmc3Byb2dzXzEuNDcuMS5iYiA9PiBlMmZzcHJvZ3NfMS40
Ny4zLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJv
Z3MvZTJmc3Byb2dzLzAwMDEtbGliZXh0MmZzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy8wMDAxLWxpYmV4
dDJmcy1maXgtc3RkLWMyMy1idWlsZC1mYWlsdXJlLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMWFiOWQ1YWZiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzLzAwMDEtbGliZXh0MmZzLWZpeC1zdGQtYzIzLWJ1aWxk
LWZhaWx1cmUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MiArMCwwIEBACi1Gcm9tIDcyZGNl
ZjAyYmVlOTkyNGM0ZDViM2RjNmU3ZWY0ZDA3YmVjZWJjYzYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KLURhdGU6IEZyaSwg
MjIgTm92IDIwMjQgMTI6MzY6MzIgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gbGliZXh0MmZzOiBm
aXggLXN0ZD1jMjMgYnVpbGQgZmFpbHVyZQotCi1nY2MtMTUgc3dpdGNoZWQgdG8gLXN0ZD1jMjMg
YnkgZGVmYXVsdDoKLQotICAgIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1j
b21taXRkaWZmO2g9NTVlM2JkMzc2YjIyMTRlMjAwZmE3NmQxMmI2N2ZmMjU5YjA2YzIxMgotCi1B
cyBhIHJlc3VsdCBgZTJmc3Byb2dzYCBmYWlscyB0aGUgYnVpbGQgc28gb25seSB0eXBlZGVmIGlu
dCBib29sCi1mb3IgX19TVERDX1ZFUlNJT05fXyA8PSAyMDE3MTBMIChDMTcpCi0KLSAgICAuLi8u
Li8uLi9saWIvZXh0MmZzL3RkYi5jOjExMzoxMzogZXJyb3I6IHR3byBvciBtb3JlIGRhdGEgdHlw
ZXMgaW4gZGVjbGFyYXRpb24gc3BlY2lmaWVycwotICAgIC4uLy4uLy4uL2xpYi9leHQyZnMvdGRi
LmM6MTEzOjE6IHdhcm5pbmc6IHVzZWxlc3MgdHlwZSBuYW1lIGluIGVtcHR5IGRlY2xhcmF0aW9u
Ci0gICAgICAxMTMgfCB0eXBlZGVmIGludCBib29sOwotICAgICAgICAgIHwgXn5+fn5+fgotCi1o
dHRwczovL2dpdGh1Yi5jb20vdHl0c28vZTJmc3Byb2dzL2lzc3Vlcy8yMDIKLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3R5dHNvL2UyZnNwcm9ncy9jb21t
aXQvNDlmZDA0ZDc3YjMyNDRjNmM2OTkwYmU0MTE0MjE2OGVlZjM3M2FlZl0KLVNpZ25lZC1vZmYt
Ynk6IFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVpdGJhdW0uY29tPgotTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci9aMEI2MEpoZHZUOWJwU1E2QDZmOTE5MDNlODlkYQotU2lnbmVkLW9mZi1i
eTogVGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVkdT4KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBsaWIvZXh0MmZzL3RkYi5jIHwgMiArKwotIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL2xpYi9leHQyZnMv
dGRiLmMgYi9saWIvZXh0MmZzL3RkYi5jCi1pbmRleCBiMDdiMjkxNy4uOThkYzk1ZDggMTAwNjQ0
Ci0tLS0gYS9saWIvZXh0MmZzL3RkYi5jCi0rKysgYi9saWIvZXh0MmZzL3RkYi5jCi1AQCAtMTEw
LDcgKzExMCw5IEBAIHN0YXRpYyBjaGFyICpyZXBfc3RyZHVwKGNvbnN0IGNoYXIgKnMpCi0gI2Vu
ZGlmCi0gI2VuZGlmCi0gCi0rI2lmIGRlZmluZWQgX19TVERDX18gJiYgZGVmaW5lZCBfX1NURENf
VkVSU0lPTl9fICYmIF9fU1REQ19WRVJTSU9OX18gPD0gMjAxNzEwTAotIHR5cGVkZWYgaW50IGJv
b2w7Ci0rI2VuZGlmCi0gCi0gI2luY2x1ZGUgInRkYi5oIgotIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3Byb2dzLWZpeC1taXNzaW5n
LWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lMmZzcHJvZ3MvZTJmc3Byb2dzL2UyZnNwcm9ncy1maXgtbWlzc2luZy1jaGVjay1mb3ItcGVy
bWlzc2lvbi1kZW5pZWQucGF0Y2gKaW5kZXggNGNkMTA5ODU5Ny4uM2JmMzBjNTA3OCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3Byb2dz
LWZpeC1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJvZ3MtZml4LW1pc3Np
bmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAxYzcwNzhmZGE2ZDIzZjFkODBiMGQ5NWFjM2U5MDgzNjQ3NDllMTg4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBiYzgwZmYzYzI1ZDE0OTRiZjk5M2Y3NDQwYWVkZmY0MjcwZTlkYjI5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVh
bmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTAgQXVnIDIwMTYgMTE6MTk6NDQgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gRml4IG1pc3NpbmcgY2hlY2sgZm9yIHBlcm1pc3Npb24gZGVuaWVk
LgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3Mv
bWtkaXJfcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dz
L21rZGlyX3AucGF0Y2gKaW5kZXggMmRiZWJhMTA5NS4uMDNiNzQzM2Q2NyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvbWtkaXJfcC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9ta2Rpcl9wLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMTQzYTkwMDE5OWM1YmIxMGIyOGYzZmM4ZjRkMzZi
YmI2ZmZkZDVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNmFhYzVjMjM0ZmU4NGE1
MDc1MzYyY2M3NDhjZGM4NGVmMWU3OWNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Sm9lIFNsYXRlciA8anNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA3IE1hciAyMDE3
IDE0OjUzOjE5IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGUyZnNwcm9nczogZXhwYW5kIEBta2Rp
cl9wQApAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqc2xhdGVy
QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAxMzFjYWVmMy4uY2E0
NDhkOTcgMTAwNjQ0CitpbmRleCBiZGQ1ZjFmNi4uMTlhZjljNDggMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTkzOCw2ICs5MzgsOCBAQCBBQ19TVUJT
VChQQUNLQUdFKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9l
MmZzcHJvZ3MvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2Uy
ZnNwcm9ncy9wdGVzdC5wYXRjaAppbmRleCBmNGUxMDU3YTM2Li43ODVjMmU5Y2FlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9wdGVzdC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9wdGVzdC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjVkYjVhYzc0NjljZWRkMDQzYTA0YmNmNDljZTc1
NTM5NzlmYmIzMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDkwOTcxNDZlYjNiYThl
ZmNiMmUwYjg4YTJmZWYxYzg3YTZjNmE0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IERtaXRyeSBFcmVtaW4tU29sZW5pa292IDxkbWl0cnlfZXJlbWluQG1lbnRvci5jb20+CiBEYXRl
OiBTYXQsIDE4IEFwciAyMDE1IDE3OjU4OjE3ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGUyZnNw
cm9nczogYWRkIHB0ZXN0CkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2FpIEth
bmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmlu
IGIvdGVzdHMvTWFrZWZpbGUuaW4KLWluZGV4IGJhMDZiM2I2Li41YTNlNDhmNCAxMDA2NDQKK2lu
ZGV4IDY3OGNjMzI2Li41OGY3NTkwMCAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmluCiAr
KysgYi90ZXN0cy9NYWtlZmlsZS5pbgotQEAgLTIwLDcgKzIwLDcgQEAgdGVzdF9vbmU6ICQoc3Jj
ZGlyKS90ZXN0X29uZS5pbiBNYWtlZmlsZSBta2UyZnMuY29uZiB0ZXN0X2RhdGEudG1wCitAQCAt
MjEsNyArMjEsNyBAQCB0ZXN0X29uZTogJChzcmNkaXIpL3Rlc3Rfb25lLmluIE1ha2VmaWxlIG1r
ZTJmcy5jb25mIHRlc3RfZGF0YS50bXAKICAJQGVjaG8gIiMhL2Jpbi9zaCIgPiB0ZXN0X29uZQog
IAlAZWNobyAiSFRSRUU9eSIgPj4gdGVzdF9vbmUKICAJQGVjaG8gIlFVT1RBPXkiID4+IHRlc3Rf
b25lCkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IGJhMDZiM2I2Li41YTNlNDhmNCAxMDA2NDQKICAJ
QGVjaG8gIkRJRkZfT1BUUz1AVU5JX0RJRkZfT1BUU0AiID4+IHRlc3Rfb25lCiAgCUBlY2hvICJT
SVpFT0ZfVElNRV9UPUBTSVpFT0ZfVElNRV9UQCIgPj4gdGVzdF9vbmUKICAJQGVjaG8gIkREPUBE
REAiID4+dGVzdF9vbmUKLUBAIC0zMSw3ICszMSw3IEBAIHRlc3Rfc2NyaXB0OiB0ZXN0X29uZSB0
ZXN0X3NjcmlwdC5pbiBNYWtlZmlsZSBta2UyZnMuY29uZiB0ZXN0X2RhdGEudG1wCitAQCAtMzMs
NyArMzMsNyBAQCB0ZXN0X3NjcmlwdDogdGVzdF9vbmUgdGVzdF9zY3JpcHQuaW4gTWFrZWZpbGUg
bWtlMmZzLmNvbmYgdGVzdF9kYXRhLnRtcAogIAlAZWNobyAiQ3JlYXRpbmcgdGVzdF9zY3JpcHQu
Li4iCiAgCUBbIC1mIHRlc3Rfc2NyaXB0IF0gJiYgY2htb2QgdSt3IHRlc3Rfc2NyaXB0IHx8IHRy
dWUKICAJQGVjaG8gIiMhL2Jpbi9zaCIgPiB0ZXN0X3NjcmlwdApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMu
cGF0Y2gKaW5kZXggNGJhMTUwZTI3ZC4uNDFlNDY5YzI5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdmcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9xdWlldC1kZWJ1Z2Zz
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNjZjOTczZTAwNGUwYzQ1OGVmMjc1YjQxYWMy
ZDhkOWZmMzNkMjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZmU0MjZmOGJjMDFk
YzA4ODVhMDdlMjMyYWEwNTcyODhlNjQ5ZDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IE1vbiwgMjMgRGVj
IDIwMTMgMTM6Mzg6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3Byb2dzOiBzaWxlbmNl
IGRlYnVnZnMKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGVidWdmcy9kZWJ1Z2ZzLmMgYi9kZWJ1Z2Zz
L2RlYnVnZnMuYwotaW5kZXggOTA5YzFkZjMuLjA4NDIzNjllIDEwMDY0NAoraW5kZXggYjlmMjQ4
YmUuLmIwMzgwOTc1IDEwMDY0NAogLS0tIGEvZGVidWdmcy9kZWJ1Z2ZzLmMKICsrKyBiL2RlYnVn
ZnMvZGVidWdmcy5jCi1AQCAtMjUyOSw3ICsyNTI5LDcgQEAgc3RhdGljIGludCBzb3VyY2VfZmls
ZShjb25zdCBjaGFyICpjbWRfZmlsZSwgaW50IHNzX2lkeCkKK0BAIC0yNTE4LDcgKzI1MTgsNyBA
QCBzdGF0aWMgaW50IHNvdXJjZV9maWxlKGNvbnN0IGNoYXIgKmNtZF9maWxlLCBpbnQgc3NfaWR4
KQogIAkJY3AgPSBzdHJjaHIoYnVmLCAnXHInKTsKICAJCWlmIChjcCkKICAJCQkqY3AgPSAwOwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcmVt
b3ZlLmxkY29uZmlnLmNhbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dz
L2UyZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaAppbmRleCAzMDcwODhkNDJiLi40
Y2U2ZGZhYzVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2Uy
ZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9yZW1vdmUubGRjb25maWcuY2FsbC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gOTcyMDg2OTM1ZDZjN2Y2ZTYwMzAwNGZkN2Y5NGJkMTNhNjVmNDcw
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjA5ZWExYWIxZDQ5OTBiMmE2MTk4YzE5
M2M3MWI4YzBjMDk5NTdkZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlaSBE
aW51IDxhbmRyZWkuYWRyaWFueC5kaW51QGludGVsLmNvbT4KIERhdGU6IFdlZCwgMzAgSmFuIDIw
MTMgMTU6MjI6MDQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gV2hlbiAvZXRjL2xkLnNvLmNhY2hl
IGlzIHdyaXRlYWJsZSBieSB1c2VyIHJ1bm5pbmcgYml0YmFrZQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4xLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzXzEuNDcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9l
MmZzcHJvZ3NfMS40Ny4zLmJiCmluZGV4IDAyMmIwMTZmMTIuLjQ2Y2EyYjVlMzEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjMuYmIK
QEAgLTQsMTQgKzQsMTEgQEAgU1JDX1VSSSArPSAiZmlsZTovL3JlbW92ZS5sZGNvbmZpZy5jYWxs
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6
Ly9wdGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ta2Rpcl9wLnBhdGNoIFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtbGliZXh0MmZzLWZpeC1zdGQtYzIzLWJ1aWxkLWZhaWx1cmUucGF0
Y2ggXAotICAgICAgICAgICAiCi1TUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwKICAg
ICAgICAgICAgZmlsZTovL2UyZnNwcm9ncy1maXgtbWlzc2luZy1jaGVjay1mb3ItcGVybWlzc2lv
bi1kZW5pZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcXVpZXQtZGVidWdmcy5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImI1NzFiOWI0MjQwNzM5YTk4MmU4YmNhNjJjZmM5
MTRhM2I1MDE5MGEiCitTUkNSRVYgPSAiNDZmZTE0NTQ1NDhkMjljYzkyYWIyNTJiMGEzYTljYzEx
YzI0NWQxYyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCtcLlxk
KyhcLlxkKykqKSQiCiAKIEVYVFJBX09FQ09ORiArPSAiLS1saWJkaXI9JHtiYXNlX2xpYmRpcn0g
LS1zYmluZGlyPSR7YmFzZV9zYmluZGlyfSBcCi0tIAoyLjQ3LjEKCg==

--===============8226063187163091071==--

