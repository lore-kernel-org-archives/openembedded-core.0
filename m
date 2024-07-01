Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5367C52D76
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2103.1719853075579927018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hOtOvKHj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=o5hNNDYC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101906f3b4980-ccf83af8-6a71-4086-82f0-148d794d0bb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0CBVOX5QnepzXZt6vjxUJ34B0sc570d22azJfCLst1E=;
	b=hOtOvKHj2haCKwIsl+IiYBvNafyk9PmPJJjl5YBqIiQWBvGxbpwV6O6mSA4rA5Kt
	TbmwSDGVdJohrGI5m3473a/eSCCGHTXxtzVTni6oAa95tzJuNgnpSUfGnO9vbegkpIp
	Z/KcRN45e3LfAm8pMpJt+6+8KGl71qHmsftFzM68=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0CBVOX5QnepzXZt6vjxUJ34B0sc570d22azJfCLst1E=;
	b=o5hNNDYC4Xmb4YxT6OHPawn+zIqOPomXIT1etNPLRW+GdkWUr2eva4TZTgaDCWMx
	Yk8TD1N2MS7TYoGMluFtXbH4/A9vJijUAliCh4hGbdMa9TXeVtuOI13+wPNgVhcBqBb
	4IksP7I+BtQfcLcNN/GkBppGp42sy0+/xWL9v5pY=
Content-Type: multipart/mixed; boundary="===============3136566494397232466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.80.3 FAILED
Message-ID: <010101906f3b4980-ccf83af8-6a71-4086-82f0-148d794d0bb6-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201320

--===============3136566494397232466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.80.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.80.2-2.80.3.patch
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
From 64d74eccda04e884032c4470eebc1f9a3b5ff8b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 05:43:27 +0000
Subject: [PATCH] glib-2.0: upgrade 2.80.2 -> 2.80.3

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch  | 2 +-
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch      | 2 +-
 ...0001-Install-gio-querymodules-as-libexec_PROGRAM.patch | 2 +-
 ...ve-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 ...pository-introspection-correctly-install-.gir-fi.patch | 8 ++++----
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch    | 6 +++---
 ...n.build-do-not-enable-pidfd-features-on-native-g.patch | 6 +++---
 ...0-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch   | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch       | 2 +-
 .../glib-2.0/{glib-2.0_2.80.2.bb => glib-2.0_2.80.3.bb}   | 0
 meta/recipes-core/glib-2.0/glib.inc                       | 2 +-
 13 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.2.bb => glib-2.0_2.80.3.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 10568b7c9f..60b9c2a03b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 10b08af6c7dcb03f954da29b6c4f9636b8796f30 Mon Sep 17 00:00:00 2001
+From f74106cf1df84efde6c4b67eae511da4de0bdff2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b9c9706fc4..de89dfcec5 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 55c49c51d8db5af15132653003d2b65a5215eebf Mon Sep 17 00:00:00 2001
+From a238e5b8c6fd95b20e76981cfe52823f8393d27d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index bc539fe3e8..5a4e3e8595 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 53333cf3ec787cb7e60585237327390e2ca89f4c Mon Sep 17 00:00:00 2001
+From 0e3c55504de8a1d58b4dd11b58d6a13f692a57d8 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 5e543339d8..2f0519fadf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 3db055ce8029372096be534c5cfc385f068bab17 Mon Sep 17 00:00:00 2001
+From 000b8c6ae23ba61f60558de4b847a601ad880a3b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index aa7127b65b..e86ecb84e6 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 97b4f18c65c52c9e6412ecf8affc22f6f42d3465 Mon Sep 17 00:00:00 2001
+From 864fb67f31ed16b10d2d136c8c4cd12d964e3fc9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
index 7be9cd8b84..2ced932afc 100644
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
@@ -1,4 +1,4 @@
-From f1beef5c2d09fae3a5e5a314f984cb3f20abe732 Mon Sep 17 00:00:00 2001
+From 4dab61a871dde2121c2471f9f0f522e5ffc562b1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 23 Apr 2024 11:24:34 +0200
 Subject: [PATCH] girepository/introspection: correctly install .gir files into
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 9 insertions(+)
 
 diff --git a/girepository/introspection/meson.build b/girepository/introspection/meson.build
-index 9405686..862ca61 100644
+index f3ee28f..802a22e 100644
 --- a/girepository/introspection/meson.build
 +++ b/girepository/introspection/meson.build
 @@ -49,6 +49,7 @@ glib_gir = gnome.generate_gir(libglib,
@@ -70,7 +70,7 @@ index 9405686..862ca61 100644
      dependencies: [
        libglib_dep,
        libgobject_dep,
-@@ -277,6 +284,7 @@ else
+@@ -278,6 +285,7 @@ else
      header: 'gio/gio.h',
      includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
      install: true,
@@ -78,7 +78,7 @@ index 9405686..862ca61 100644
      dependencies: [
        libglib_dep,
        libgobject_dep,
-@@ -314,6 +322,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
+@@ -316,6 +324,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
    header: 'girepository/girepository.h',
    includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
    install: true,
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 3a8d3596b0..2f3bf0324d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From f04ea29f9f96892ada81bd0acfcef70183138229 Mon Sep 17 00:00:00 2001
+From d58900f9828d39290207e7c11bda01b8bd525379 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 257afb5..5caa6e6 100644
+index 73299af..513ecc7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2024,7 +2024,7 @@ atomicdefine = '''
+@@ -2021,7 +2021,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 9be04960aa..130d4b2aec 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From a63c865aa9a24f3230e8e2bcb5bce88f179c7e2b Mon Sep 17 00:00:00 2001
+From 9a28ba7667d40069ebd3809dc681bdff0c8b981f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5caa6e6..688f214 100644
+index 513ecc7..4bacc11 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1019,7 +1019,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4dec252c1f..2229b6fe3b 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From dc7f09c4f52638a70768c528d186da6f83dedc97 Mon Sep 17 00:00:00 2001
+From 2f90eb40b83183299a5f0e4291150c3814769809 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index a1ff198aa6..de078db1a2 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 0133aeabd37a9137722abd86039d7d0797b5896f Mon Sep 17 00:00:00 2001
+From c80cbf36d9cf3a91ff548481d03074b913e1159d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 0f8b51294b..0b31afa1fd 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From ac75f5d9206e52eec64fef0db4cd91b58a764c99 Mon Sep 17 00:00:00 2001
+From 75a3b2d733399e5b28906cd4befbe496e837bcfd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 690d1c162c..f667306726 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,7 +232,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"
+SRC_URI[sha256sum] = "3947a0eaddd0f3613d0230bb246d0c69e46142c19022f5c4b1b2e3cba236d417"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.44.0


--===============3136566494397232466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (916 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-a21560ff500f7b4c1925aab184b3dc5c56c29449"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a21560ff500f7b4c1925aab184b3dc5c56c29449"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 635 Local 507 Mirrors 0 Missed 128 Current 407 (79% match, 87% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 25 stale sstate objects for arch qemux86_64...done.
Removing 26 stale sstate objects for arch core2-64...done.
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 483 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 621 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 682 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 687 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 691 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 694 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 706 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 708 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 713 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 714 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 729 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 788 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 808 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 928 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 942 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 945 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 977 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 980 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 989 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 994 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1012 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1016 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1027 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1031 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1038 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 453 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_recipe_qa)
NOTE: Running task 471 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch)
NOTE: Running task 475 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: Running task 476 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_write_config)
NOTE: Running task 485 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 493 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 506 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 511 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 512 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_recipe_qa)
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz
Cleaning and trying again.
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz_bad-checksum_b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1146 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1223 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_fetch)
NOTE: Running task 1276 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1284 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_fetch)
NOTE: Running task 1288 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: Running task 1291 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1307 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1308 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: recipe qemu-native-9.0.0-r0: task do_unpack: Started
NOTE: Running task 1345 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1370 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1371 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_write_config)
NOTE: Running task 1372 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_write_config)
NOTE: Running task 1377 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1378 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1398 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_write_config: Started
NOTE: Running task 1400 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1406 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_unpack)
NOTE: Running task 1407 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1426 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1427 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: Running task 1445 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_write_config: Succeeded
NOTE: Running task 1492 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_fetch)
NOTE: Running task 1493 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 1520 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Started
NOTE: Running task 1527 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1528 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: Running task 1529 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_unpack)
NOTE: Running task 1566 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_patch)
NOTE: Running task 1567 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: Running task 1569 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1570 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1576 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1581 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1582 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1585 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: Running task 1587 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_patch)
NOTE: Running task 1629 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1637 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_unpack)
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Succeeded
NOTE: Running task 1678 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1703 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1723 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1727 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1728 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_write_config)
NOTE: Running task 1730 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Succeeded
NOTE: Running task 1748 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1782 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_warn_musl)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1784 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1785 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Succeeded
NOTE: Running task 1787 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Started
NOTE: Running task 1871 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: Running task 1897 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1899 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1905 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1977 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: Running task 1996 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1997 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 2002 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2010 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 2011 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2054 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: Running task 2129 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2142 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_fetch)
NOTE: Running task 2153 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: Running task 2168 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1c0125cf2439354bc5b9d2d86d0c011da603c250ea3e952ab1960cc5517f8e0e
NOTE: Running task 2190 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Started
NOTE: Running task 2191 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 2192 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: Running task 2193 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 2196 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2228 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_unpack)
NOTE: Running task 2236 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: Running task 2297 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_fetch)
NOTE: Running task 2298 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: Running task 2313 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2361 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Started
NOTE: Running task 2380 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_patch)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: Running task 2406 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_write_config)
NOTE: Running task 2407 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2408 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_create_spdx)
NOTE: Running task 2409 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack)
NOTE: Running task 2410 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_patch: Succeeded
NOTE: Running task 2493 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2535 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_populate_lic)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: Running task 2536 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_create_spdx: Started
NOTE: Running task 2537 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Succeeded
NOTE: Running task 2539 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum failure encountered with download of https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz - will attempt other sources if available
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2542 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Succeeded
NOTE: Running task 2543 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_populate_lic unihash changed to 5dbf548ce667199f92edc4aa322436fe7925489964d2bb456eba2fe1e44d803c
NOTE: Running task 2544 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch unihash changed to e86ccbfab458980d8d7d46f5859c5e62006b1d1485efc0d3bbc417192d979300
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz
Cleaning and trying again.
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz_bad-checksum_b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd
NOTE: recipe systemd-1_255.6-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2545 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2547 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx)
NOTE: Running task 2548 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_255.6-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2552 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2553 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch unihash changed to ec595e052fee4c14b7c5e48386009e2aef8ae0abc59fbf18ef2c6faea5804ca5
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2554 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_configure)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Failed
NOTE: recipe qemu-native-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2555 tasks of which 2442 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701054252.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701054252.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum failure fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz
ERROR: glib-2.0-initial-1_2.80.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz\' has sha256 checksum \'b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd\' when \'3947a0eaddd0f3613d0230bb246d0c69e46142c19022f5c4b1b2e3cba236d417\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glib-2.0-initial/2.80.2/temp/log.do_fetch.31448
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch) failed with exit code '1'

--===============3136566494397232466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.80.2-2.80.3.patch"

RnJvbSA2NGQ3NGVjY2RhMDRlODg0MDMyYzQ0NzBlZWJjMWY5YTNiNWZmOGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNTo0MzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuODAuMiAtPiAyLjgwLjMKCi0tLQogLi4uLzAwMDEtRG8tbm90LXdy
aXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCAgICAgIHwgMiArLQog
Li4uMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNo
IHwgMiArLQogLi4udmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hl
bWFzLnBhdGNoIHwgMiArLQogLi4udGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWls
ZC1ob3N0LW9ubHktLnBhdGNoIHwgMiArLQogLi4ucG9zaXRvcnktaW50cm9zcGVjdGlvbi1jb3Jy
ZWN0bHktaW5zdGFsbC0uZ2lyLWZpLnBhdGNoIHwgOCArKysrLS0tLQogLi4uLzAwMDEtbWVzb24t
UnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoICAgIHwgNiArKystLS0KIC4u
Lm4uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCB8
IDYgKysrLS0tCiAuLi4wLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMt
dG9vbHMucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxv
Y2F0ZS1tb2R1bGVzLnBhdGNoICAgfCAyICstCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy9za2lwLXRpbWVvdXQucGF0Y2ggICAgICAgfCAyICstCiAuLi4vZ2xpYi0yLjAve2dsaWIt
Mi4wXzIuODAuMi5iYiA9PiBnbGliLTIuMF8yLjgwLjMuYmJ9ICAgfCAwCiBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLmluYyAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAxMyBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi44MC4yLmJiID0+IGdsaWItMi4w
XzIuODAuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRl
LWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggMTA1NjhiN2M5Zi4uNjBi
OWMyYTAzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXIt
aW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxMGIwOGFm
NmM3ZGNiMDNmOTU0ZGEyOWI2YzRmOTYzNmI4Nzk2ZjMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmNzQxMDZjZjFkZjg0ZWZkZTZjNGI2N2VhZTUxMWRhNGRlMGJkZmYyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBGcmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBwcmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGluIHBrZy1j
b25maWcgZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51
eC5wYXRjaAppbmRleCBiOWM5NzA2ZmM0Li5kZTg5ZGZjZWM1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMt
TGludXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1G
aXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA1NWM0OWM1MWQ4ZGI1YWYxNTEzMjY1MzAwM2QyYjY1YTUyMTVlZWJmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBhMjM4ZTViOGM2ZmQ5NWIyMGU3Njk4MWNmZTUyODIzZjgzOTNkMjdk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFNhdCwgMTUgTWFyIDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gRml4IERBVEFESVJOQU1FIG9uIHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMt
YXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNo
CmluZGV4IGJjNTM5ZmUzZTguLjVhNGUzZTg1OTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4
ZWNfUFJPR1JBTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDUzMzMzY2YzZWM3ODdjYjdlNjA1ODUyMzczMjczOTBlMmNhODlm
NGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBlM2M1NTUwNGRlOGExZDU4YjRkZDEx
YjU4ZDZhMTNmNjkyYTU3ZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBL
dWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAx
NiAxNToxNDo1OCArMDIwMAogU3ViamVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVs
ZXMgYXMgbGliZXhlY19QUk9HUkFNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhz
LWluLXNjaGVtYXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0
Y2gKaW5kZXggNWU1NDMzMzlkOC4uMmYwNTE5ZmFkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVj
YXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMt
aW4tc2NoZW1hcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2RiMDU1Y2U4MDI5MzcyMDk2
YmU1MzRjNWNmYzM4NWYwNjhiYWIxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDAw
YjhjNmFlMjNiYTYxZjYwNTU4ZGU0Yjg0N2E2MDFhZDg4MGEzYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAxMiBKdW4gMjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBS
ZW1vdmUgdGhlIHdhcm5pbmcgYWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hlbWFzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1y
ZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21t
ZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKaW5kZXggYWE3MTI3YjY1Yi4uZTg2ZWNi
ODRlNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1n
aW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJl
c291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTdiNGYxOGM2NWM1MmM5ZTY0MTJlY2Y4YWZmYzIyZjZmNDJkMzQ2NSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODY0ZmI2N2YzMWVkMTZiMTBkMmQxMzZjOGM0Y2Qx
MmQ5NjRlM2ZjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE4OjIy
OjQ2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdpby90ZXN0cy9yZXNvdXJjZXMuYzogY29tbWVu
dCBvdXQgYSBidWlsZCBob3N0LW9ubHkgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naXJlcG9zaXRvcnktaW50cm9zcGVjdGlvbi1jb3JyZWN0
bHktaW5zdGFsbC0uZ2lyLWZpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1naXJlcG9zaXRvcnktaW50cm9zcGVjdGlvbi1jb3JyZWN0bHktaW5zdGFsbC0uZ2ly
LWZpLnBhdGNoCmluZGV4IDdiZTljZDhiODQuLjJjZWQ5MzJhZmMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lyZXBvc2l0b3J5LWludHJvc3BlY3Rp
b24tY29ycmVjdGx5LWluc3RhbGwtLmdpci1maS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpcmVwb3NpdG9yeS1pbnRyb3NwZWN0aW9uLWNvcnJlY3Rs
eS1pbnN0YWxsLS5naXItZmkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGYxYmVlZjVjMmQw
OWZhZTNhNWU1YTMxNGY5ODRjYjNmMjBhYmU3MzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDRkYWI2MWE4NzFkZGUyMTIxYzI0NzFmOWYwZjUyMmU1ZmZjNTYyYjEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogRGF0ZTogVHVlLCAyMyBBcHIgMjAyNCAxMToyNDozNCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBnaXJlcG9zaXRvcnkvaW50cm9zcGVjdGlvbjogY29ycmVjdGx5IGluc3RhbGwgLmdpciBmaWxl
cyBpbnRvCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQog
CiBkaWZmIC0tZ2l0IGEvZ2lyZXBvc2l0b3J5L2ludHJvc3BlY3Rpb24vbWVzb24uYnVpbGQgYi9n
aXJlcG9zaXRvcnkvaW50cm9zcGVjdGlvbi9tZXNvbi5idWlsZAotaW5kZXggOTQwNTY4Ni4uODYy
Y2E2MSAxMDA2NDQKK2luZGV4IGYzZWUyOGYuLjgwMmEyMmUgMTAwNjQ0CiAtLS0gYS9naXJlcG9z
aXRvcnkvaW50cm9zcGVjdGlvbi9tZXNvbi5idWlsZAogKysrIGIvZ2lyZXBvc2l0b3J5L2ludHJv
c3BlY3Rpb24vbWVzb24uYnVpbGQKIEBAIC00OSw2ICs0OSw3IEBAIGdsaWJfZ2lyID0gZ25vbWUu
Z2VuZXJhdGVfZ2lyKGxpYmdsaWIsCkBAIC03MCw3ICs3MCw3IEBAIGluZGV4IDk0MDU2ODYuLjg2
MmNhNjEgMTAwNjQ0CiAgICAgIGRlcGVuZGVuY2llczogWwogICAgICAgIGxpYmdsaWJfZGVwLAog
ICAgICAgIGxpYmdvYmplY3RfZGVwLAotQEAgLTI3Nyw2ICsyODQsNyBAQCBlbHNlCitAQCAtMjc4
LDYgKzI4NSw3IEBAIGVsc2UKICAgICAgaGVhZGVyOiAnZ2lvL2dpby5oJywKICAgICAgaW5jbHVk
ZXM6IFsgZ2xpYl9naXJbMF0sIGdtb2R1bGVfZ2lyWzBdLCBnb2JqZWN0X2dpclswXSwgZ2lvX2dp
clswXSBdLAogICAgICBpbnN0YWxsOiB0cnVlLApAQCAtNzgsNyArNzgsNyBAQCBpbmRleCA5NDA1
Njg2Li44NjJjYTYxIDEwMDY0NAogICAgICBkZXBlbmRlbmNpZXM6IFsKICAgICAgICBsaWJnbGli
X2RlcCwKICAgICAgICBsaWJnb2JqZWN0X2RlcCwKLUBAIC0zMTQsNiArMzIyLDcgQEAgZ2lyZXBv
c2l0b3J5X2dpciA9IGdub21lLmdlbmVyYXRlX2dpcihsaWJnaXJlcG9zaXRvcnksCitAQCAtMzE2
LDYgKzMyNCw3IEBAIGdpcmVwb3NpdG9yeV9naXIgPSBnbm9tZS5nZW5lcmF0ZV9naXIobGliZ2ly
ZXBvc2l0b3J5LAogICAgaGVhZGVyOiAnZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5oJywKICAg
IGluY2x1ZGVzOiBbIGdsaWJfZ2lyWzBdLCBnbW9kdWxlX2dpclswXSwgZ29iamVjdF9naXJbMF0s
IGdpb19naXJbMF0gXSwKICAgIGluc3RhbGw6IHRydWUsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xh
bmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmluZGV4IDNhOGQz
NTk2YjAuLjJmM2JmMDMyNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0
b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
MDRlYTI5ZjlmOTY4OTJhZGE4MWJkMGFjZmNlZjcwMTgzMTM4MjI5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkNTg5MDBmOTgyOGQzOTI5MDIwN2U3YzExYmRhMDFiOGJkNTI1Mzc5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24gY2xhbmcgYXMgd2VsbApAQCAtMTQsMTAgKzE0
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAyNTdhZmI1Li41Y2FhNmU2IDEwMDY0
NAoraW5kZXggNzMyOTlhZi4uNTEzZWNjNyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysg
Yi9tZXNvbi5idWlsZAotQEAgLTIwMjQsNyArMjAyNCw3IEBAIGF0b21pY2RlZmluZSA9ICcnJwor
QEAgLTIwMjEsNyArMjAyMSw3IEBAIGF0b21pY2RlZmluZSA9ICcnJwogICMgV2Uga25vdyB0aGF0
IHdlIGNhbiBhbHdheXMgdXNlIHJlYWwgKCJsb2NrIGZyZWUiKSBhdG9taWMgb3BlcmF0aW9ucyB3
aXRoIE1TVkMKICBpZiBjYy5nZXRfaWQoKSA9PSAnbXN2Yycgb3IgY2MuZ2V0X2lkKCkgPT0gJ2Ns
YW5nLWNsJyBvciBjYy5saW5rcyhhdG9taWN0ZXN0LCBuYW1lIDogJ2F0b21pYyBvcHMnKQogICAg
aGF2ZV9hdG9taWNfbG9ja19mcmVlID0gdHJ1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZl
YXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2
ZS1nLnBhdGNoCmluZGV4IDliZTA0OTYwYWEuLjEzMGQ0YjJhZWMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJs
ZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVh
dHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE2M2M4NjVhYTlh
MjRmMzIzMGU4ZTJiY2I1YmNlODhmMTc5YzdlMmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDlhMjhiYTc2NjdkNDAwNjllYmQzODA5ZGM2ODFiZGZmMGM4Yjk4MWYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogRGF0ZTogU2F0LCAxNiBTZXAgMjAyMyAyMjoyODoyNyArMDIwMAogU3ViamVjdDogW1BBVENI
XSBtZXNvbi5idWlsZDogZG8gbm90IGVuYWJsZSBwaWRmZCBmZWF0dXJlcyBvbiBuYXRpdmUgZ2xp
YgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5k
ZXggNWNhYTZlNi4uNjg4ZjIxNCAxMDA2NDQKK2luZGV4IDUxM2VjYzcuLjRiYWNjMTEgMTAwNjQ0
CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC0xMDIyLDcgKzEwMjIs
OCBAQCBpZiBjYy5saW5rcygnJycjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KK0BAIC0xMDE5LDcg
KzEwMTksOCBAQCBpZiBjYy5saW5rcygnJycjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KICAgICAg
ICAgICAgICAgICAgIHdhaXRpZCAoUF9QSURGRCwgMCwgJmNoaWxkX2luZm8sIFdFWElURUQgfCBX
Tk9IQU5HKTsKICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICAgICAgICAgIH0n
JycsIG5hbWUgOiAncGlkZmRfb3BlbigyKSBzeXN0ZW0gY2FsbCcpCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24t
cGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9v
bHMucGF0Y2gKaW5kZXggNGRlYzI1MmMxZi4uMjIyOWI2ZmUzYiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBh
dGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10
b29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGM3ZjA5YzRmNTI2MzhhNzA3NjhjNTI4
ZDE4NmRhNmY4M2RlZGM5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmY5MGViNDBi
ODMxODMyOTlhNWYwZTQyOTExNTBjMzgxNDc2OTgwOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
VHVlLCAzIE9jdCAyMDE3IDEwOjQ1OjU1ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBo
YXJkY29kZSBweXRob24gcGF0aCBpbnRvIHZhcmlvdXMgdG9vbHMKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4
IGExZmYxOThhYTYuLmRlMDc4ZGIxYTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMDEzM2FlYWJkMzdhOTEzNzcyMmFiZDg2MDM5ZDdkMDc5N2I1ODk2ZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzgwY2JmMzZkOWNmM2E5MWZmNTQ4NDgxZDAzMDc0YjkxM2Ux
MTU5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJlY3Rv
cnkgZm9yIG5hdGl2ZSBidWlsZHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAppbmRleCAwZjhiNTEyOTRiLi4wYjMxYWZhMWZkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhYzc1ZjVkOTIwNmU1MmVlYzY0ZmVmMGRiNGNk
OTFiNThhNzY0Yzk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NWEzYjJkNzMzMzk5
ZTViMjg5MDZjZDRiZWZiZTQ5NmU4MzdiY2ZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUaHUsIDI4IE1hciAy
MDI0IDE2OjI3OjA5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgL3RpbWVvdXQvcm91bmRp
bmcgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBf
Mi44MC4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44MC4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLTIuMF8yLjgwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wXzIuODAuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwppbmRl
eCA2OTBkMWMxNjJjLi5mNjY3MzA2NzI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmlu
YwpAQCAtMjMyLDcgKzIzMiw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmls
ZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVz
LW9uLW5hdGl2ZS1nLnBhdGNoIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImI5Y2ZiNmY3YTViZDViMzEyMzhmZDVkNTZkZjIyNmIyZGRh
NWVhMzc2MTE0NzViZjg5ZjZhMGY5NDAwZmU4YmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzk0
N2EwZWFkZGQwZjM2MTNkMDIzMGJiMjQ2ZDBjNjllNDYxNDJjMTkwMjJmNWM0YjFiMmUzY2JhMjM2
ZDQxNyIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEggdGhhdCBh
cmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5mbykgYW5k
IGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoyLjQ0LjAKCg==

--===============3136566494397232466==--

