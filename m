Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF23ECEB2E0
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12106.1763224707847198131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WpKz/knk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iNU0ca8O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a8861dea8-58b71d81-4877-40d4-ba8d-b0a65161705b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L/VVbRXXVWi6H7efq3NGq4INDJ/jdr7tsEjaC7Quu2Q=;
	b=WpKz/knkx8mg5Tsjz3hqLZsnA91xZg4mfY3ylBo+jJEVFCqkLiWWpceNhPwWTyJA
	laXZfBeOWBGeQqTygKd4b9hb6DV7EKqQeYOkHdHIlBdEy0HURPioL0CUQZZsC5HPZor
	n+F2U4UiTnyZPLX3m2fbqGjgdrDauTKq9nItKdis=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L/VVbRXXVWi6H7efq3NGq4INDJ/jdr7tsEjaC7Quu2Q=;
	b=iNU0ca8OEuA1yQSxlDoIyjsVRhbJvtBGbX8L+Pn1lukgdDEQhlO59gVmUgizi1A6
	OcnkHZtNpYb4FEyMc/xi1LNgpoE98slzjqATEERHphOTMvByXr817UC17lbW07Ytusi
	FWcDmJLv6m7e2XnzHNIMmBXzNLr8ESAHcznDvE10=
Content-Type: multipart/mixed; boundary="===============6487661621422113170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.86.1,2.86.1 SUCCEEDED
Message-ID: <0101019a8861dea8-58b71d81-4877-40d4-ba8d-b0a65161705b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226304

--===============6487661621422113170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.86.1,2.86.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-glib-2.0-initial-upgrade-2.86.0-2.86.1-2.86.patch
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
From 781f14e2b2ffeb71c4c18d0107bf52a9479f1489 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 05:16:20 +0000
Subject: [PATCH] glib-2.0,glib-2.0-initial: upgrade 2.86.0 -> 2.86.1,2.86.0 ->
 2.86.1

---
 ...001-Do-not-write-bindir-into-pkg-config-files.patch | 10 +++++-----
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch   |  2 +-
 ...1-Install-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...the-warning-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ts-resources.c-comment-out-a-build-host-only-.patch |  2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...uild-do-not-enable-pidfd-features-on-native-g.patch |  6 +++---
 ...o-not-hardcode-python-path-into-various-tools.patch |  2 +-
 .../recipes-core/glib-2.0/files/relocate-modules.patch |  8 ++++----
 meta/recipes-core/glib-2.0/files/skip-timeout.patch    |  2 +-
 ....0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} |  0
 .../{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb}         |  0
 meta/recipes-core/glib-2.0/glib.inc                    |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb => glib-2.0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb => glib-2.0_2.86.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index c394ab3277..9b16f8491b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
+From f6c27e8ac2ae60ae892851ed986a9d525ded08ab Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 5d91b89..1a8da12 100644
+index 2f8f188..57c48d2 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -901,17 +901,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+@@ -912,17 +912,18 @@ libgio_dep = declare_dependency(link_with : libgio,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -46,10 +46,10 @@ index 5d91b89..1a8da12 100644
    uninstalled_variables : [
      'gio=${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 837960d..97d4af0 100644
+index 209bcbf..a86cfd3 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -443,9 +443,10 @@ pkg.generate(libglib,
+@@ -464,9 +464,10 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 19fffbdc5f..60cf684ae8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
+From 00307021a2cc46c2934f484b5ad0b2be0b229a54 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 89ba10ff6d..506f007efc 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
+From e9eab15409374f1478dc505b51eced6e56f05213 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 854b95a..5d91b89 100644
+index 39256d3..2f8f188 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1038,6 +1038,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1049,6 +1049,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index ebdf957272..1e1f6e7cca 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
+From d25370b8d77c76e657fb4b6ee5be080d04f04ebe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 771b03e66d..7c8e871bbb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
+From 374bc18665306676d22aeaf3af0d90300f165da5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 5ad2a0375b..6603513447 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
+From ad55db224498ff4f4d259b10ef37f6ce6220d2d6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a8bcadc..041b68e 100644
+index 29b9ccb..ebf9a32 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2077,7 +2077,7 @@ atomicdefine = '''
+@@ -2088,7 +2088,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index aa098da379..73f0de4abe 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
+From a0d8d5170f605659af38874edd40d543c69cdd46 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 041b68e..155bfd4 100644
+index ebf9a32..bfe457a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1086,7 +1086,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index d26f944d51..6735b2d1da 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
+From 1b0138cf2fb3b255b490adc291d93031c1954251 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index ddf464526c..d4db239790 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
+From b7b1e51a5e90970e864f34e59181a5c343fcb1f4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 76c2028..6deba7c 100644
+index 38761e4..afa7878 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1260,11 +1260,6 @@ get_gio_module_dir (void)
+@@ -1272,11 +1272,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index 76c2028..6deba7c 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1283,8 +1278,6 @@ get_gio_module_dir (void)
+@@ -1295,8 +1290,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 138e970553..157697070a 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
+From 05f86488adbca3bc284552f153d76d930543dc0c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e8dde2820..5909851896 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
+SRC_URI[archive.sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============6487661621422113170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 37294290 to 37392722 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8600.0 /usr/lib/.debug/libgirepository-2.0.so.0.8600.0 /usr/lib/.debug/libgobject-2.0.so.0.8600.0 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.8600.0 /usr/lib/.debug/libgio-2.0.so.0.8600.0 /usr/lib/.debug/libglib-2.0.so.0.8600.0", added "/usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8600.1 /usr/lib/.debug/libgirepository-2.0.so.0.8600.1 /usr/libexec/installed-tests/glib/.debug/utils-unisolated /usr/libexec/installed-tests/glib/.debug/field-info /usr/lib/.debug/libgobject-2.0.so.0.8600.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8600.1 /usr/lib/.debug/libgmodule-2.0.so.0.8600.1 /usr/lib/.debug/libglib-2.0.so.0.8600.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 14942675 to 14943793 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGSIZE changed from 147071 to 147277 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGSIZE changed from 132502 to 133089 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGSIZE changed from 60288 to 136515 (+126%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGSIZE changed from 142571 to 142265 (-0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGSIZE changed from 144076 to 144273 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGSIZE changed from 145455 to 145666 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGSIZE changed from 134573 to 161236 (+20%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGSIZE changed from 149788 to 149985 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGSIZE changed from 138448 to 138636 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 141742 to 141949 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGSIZE changed from 142004 to 142678 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGSIZE changed from 144386 to 144579 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGSIZE changed from 125979 to 140717 (+12%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGSIZE changed from 175004 to 179491 (+3%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGSIZE changed from 139397 to 139586 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGSIZE changed from 183195 to 183335 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 13737927 to 13807895 (+1%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: FILELIST: added "/usr/share/installed-tests/glib/field-info.test /usr/libexec/installed-tests/glib/utils-unisolated /usr/libexec/installed-tests/glib/field-info /usr/share/installed-tests/glib/utils-unisolated.test"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 4860842 to 4861098 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.8600.0 /usr/lib/libgio-2.0.so.0.8600.0 /usr/lib/libgobject-2.0.so.0.8600.0 /usr/lib/libgirepository-2.0.so.0.8600.0 /usr/lib/libgthread-2.0.so.0.8600.0 /usr/lib/libglib-2.0.so.0.8600.0", added "/usr/lib/libgthread-2.0.so.0.8600.1 /usr/lib/libgmodule-2.0.so.0.8600.1 /usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgirepository-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libglib-2.0.so.0.8600.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.86/glib-2.86.0.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.86/glib-2.86.1.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-
 on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0: PV changed from "2.86.0" to "2.86.1"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============6487661621422113170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-glib-2.0-initial-upgrade-2.86.0-2.86.1-2.86.patch"

RnJvbSA3ODFmMTRlMmIyZmZlYjcxYzRjMThkMDEwN2JmNTJhOTQ3OWYxNDg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDU6MTY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMCxnbGliLTIuMC1pbml0aWFsOiB1cGdyYWRlIDIuODYuMCAtPiAyLjg2LjEsMi44Ni4w
IC0+CiAyLjg2LjEKCi0tLQogLi4uMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29u
ZmlnLWZpbGVzLnBhdGNoIHwgMTAgKysrKystLS0tLQogLi4uL2ZpbGVzLzAwMDEtRml4LURBVEFE
SVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCAgIHwgIDIgKy0KIC4uLjEtSW5zdGFsbC1naW8t
cXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaCB8ICA2ICsrKy0tLQogLi4udGhl
LXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDIgKy0K
IC4uLnRzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaCB8
ICAyICstCiAuLi4vMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwu
cGF0Y2ggfCAgNiArKystLS0KIC4uLnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1v
bi1uYXRpdmUtZy5wYXRjaCB8ICA2ICsrKy0tLQogLi4uby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBh
dGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoIHwgIDIgKy0KIC4uLi9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCB8ICA4ICsrKystLS0tCiBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2ggICAgfCAgMiArLQog
Li4uLjAtaW5pdGlhbF8yLjg2LjAuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjEuYmJ9IHwg
IDAKIC4uLi97Z2xpYi0yLjBfMi44Ni4wLmJiID0+IGdsaWItMi4wXzIuODYuMS5iYn0gICAgICAg
ICB8ICAwCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYyAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogMTMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWlu
aXRpYWxfMi44Ni4wLmJiID0+IGdsaWItMi4wLWluaXRpYWxfMi44Ni4xLmJifSAoMTAwJSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi44Ni4wLmJiID0+IGds
aWItMi4wXzIuODYuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1m
aWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90
LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggYzM5NGFiMzI3
Ny4uOWIxNmY4NDkxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1i
aW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
OTgxZGI1ZDc3NWUwNGI3MmZiNjhiNmE0NTUzYzg3ZmRhZWRlZTY1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBmNmMyN2U4YWMyYWU2MGFlODkyODUxZWQ5ODZhOWQ1MjVkZWQwOGFiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBT
dWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBwcmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGlu
IHBrZy1jb25maWcgZmlsZXMKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL21l
c29uLmJ1aWxkIGIvZ2lvL21lc29uLmJ1aWxkCi1pbmRleCA1ZDkxYjg5Li4xYThkYTEyIDEwMDY0
NAoraW5kZXggMmY4ZjE4OC4uNTdjNDhkMiAxMDA2NDQKIC0tLSBhL2dpby9tZXNvbi5idWlsZAog
KysrIGIvZ2lvL21lc29uLmJ1aWxkCi1AQCAtOTAxLDE3ICs5MDEsMTggQEAgbGliZ2lvX2RlcCA9
IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX3dpdGggOiBsaWJnaW8sCitAQCAtOTEyLDE3ICs5MTIs
MTggQEAgbGliZ2lvX2RlcCA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX3dpdGggOiBsaWJnaW8s
CiAgcGtnLmdlbmVyYXRlKGxpYmdpbywKICAgIHJlcXVpcmVzIDogWydnbGliLTIuMCcsICdnb2Jq
ZWN0LTIuMCddLAogICAgdmFyaWFibGVzIDogWwpAQCAtNDYsMTAgKzQ2LDEwIEBAIGluZGV4IDVk
OTFiODkuLjFhOGRhMTIgMTAwNjQ0CiAgICB1bmluc3RhbGxlZF92YXJpYWJsZXMgOiBbCiAgICAg
ICdnaW89JHtwcmVmaXh9L2dpby9naW8nLAogZGlmZiAtLWdpdCBhL2dsaWIvbWVzb24uYnVpbGQg
Yi9nbGliL21lc29uLmJ1aWxkCi1pbmRleCA4Mzc5NjBkLi45N2Q0YWYwIDEwMDY0NAoraW5kZXgg
MjA5YmNiZi4uYTg2Y2ZkMyAxMDA2NDQKIC0tLSBhL2dsaWIvbWVzb24uYnVpbGQKICsrKyBiL2ds
aWIvbWVzb24uYnVpbGQKLUBAIC00NDMsOSArNDQzLDEwIEBAIHBrZy5nZW5lcmF0ZShsaWJnbGli
LAorQEAgLTQ2NCw5ICs0NjQsMTAgQEAgcGtnLmdlbmVyYXRlKGxpYmdsaWIsCiAgICBzdWJkaXJz
IDogWydnbGliLTIuMCddLAogICAgZXh0cmFfY2ZsYWdzIDogWyctSSR7bGliZGlyfS9nbGliLTIu
MC9pbmNsdWRlJ10gKyB3aW4zMl9jZmxhZ3MsCiAgICB2YXJpYWJsZXMgOiBbCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1v
bi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKaW5kZXggMTlmZmZiZGM1
Zi4uNjBjZjY4NGFlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGli
Yy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDhiZmM4N2U5Zjc1N2NmNjVhZDk2
NzUyMDg2MGJmZDc1MjZjMzZmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDAzMDcw
MjFhMmNjNDZjMjkzNGY0ODRiNWFkMGIyYmUwYjIyOWE1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IE1h
ciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBEQVRBRElSTkFNRSBv
biB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVl
cnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAppbmRleCA4OWJhMTBmZjZkLi41MDZm
MDA3ZWZjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1v
ZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiOGRj
YmYwM2IzMTVkMzE3NTkxNzZlOWQ0ZmQzODllOGZkYTZmZmNkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlOWVhYjE1NDA5Mzc0ZjE0NzhkYzUwNWI1MWVjZWQ2ZTU2ZjA1MjEzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVu
QGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjIgTWFyIDIwMTYgMTU6MTQ6NTggKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gSW5zdGFsbCBnaW8tcXVlcnltb2R1bGVzIGFzIGxpYmV4ZWNfUFJPR1JBTQpA
QCAtMTMsMTAgKzEzLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3Bl
Y2lmaWNdCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9n
aW8vbWVzb24uYnVpbGQgYi9naW8vbWVzb24uYnVpbGQKLWluZGV4IDg1NGI5NWEuLjVkOTFiODkg
MTAwNjQ0CitpbmRleCAzOTI1NmQzLi4yZjhmMTg4IDEwMDY0NAogLS0tIGEvZ2lvL21lc29uLmJ1
aWxkCiArKysgYi9naW8vbWVzb24uYnVpbGQKLUBAIC0xMDM4LDYgKzEwMzgsNyBAQCBnaW9fcXVl
cnltb2R1bGVzID0gZXhlY3V0YWJsZSgnZ2lvLXF1ZXJ5bW9kdWxlcycsICdnaW8tcXVlcnltb2R1
bGVzLmMnLCAnZ2lvbW9kdQorQEAgLTEwNDksNiArMTA0OSw3IEBAIGdpb19xdWVyeW1vZHVsZXMg
PSBleGVjdXRhYmxlKCdnaW8tcXVlcnltb2R1bGVzJywgJ2dpby1xdWVyeW1vZHVsZXMuYycsICdn
aW9tb2R1CiAgICBjX2FyZ3MgOiBnaW9fY19hcmdzLAogICAgIyBpbnRsLmxpYiBpcyBub3QgY29t
cGF0aWJsZSB3aXRoIFNBRkVTRUgKICAgIGxpbmtfYXJncyA6IG5vc2VoX2xpbmtfYXJncywKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRo
ZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0
LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaAppbmRleCBlYmRmOTU3MjcyLi4xZTFm
NmU3Y2NhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhl
LXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiZGIyNzcyZDY3MmU5NTU4NDU4NWU5MDI2ODk5MzY1NTljNWRiMDVkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMjUzNzBiOGQ3N2M3NmU2NTdmYjRiNmVlNWJl
MDgwZDA0ZjA0ZWJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEyIEp1biAyMDE1IDE3
OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB0aGUgd2FybmluZyBhYm91dCBk
ZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEt
YnVpbGQtaG9zdC1vbmx5LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5
LS5wYXRjaAppbmRleCA3NzFiMDNlNjZkLi43YzhlODcxYmJiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21t
ZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1i
dWlsZC1ob3N0LW9ubHktLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Y2I3NWQzYmMzNjhl
ZTEwOGE0YjE0YmM1N2E5MmJkMGMwYjJlMTBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAzNzRiYzE4NjY1MzA2Njc2ZDIyYWVhZjNhZjBkOTAzMDBmMTY1ZGE1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDggSmFuIDIwMjAgMTg6MjI6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZ2lvL3Rlc3RzL3Jlc291cmNlcy5jOiBjb21tZW50IG91dCBhIGJ1aWxkIGhvc3Qtb25seSB0
ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1l
c29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFu
Zy1hcy13ZWxsLnBhdGNoCmluZGV4IDVhZDJhMDM3NWIuLjY2MDM1MTM0NDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3Mt
dGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MDI5ODRmZTM0MGE3NmM5MmUyYzA0MjM1ZjQzZmRj
YjQ3NzI4ODA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZDU1ZGIyMjQ0OThmZjRm
NGQyNTliMTBlZjM3ZjZjZTYyMjBkMmQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6
NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24g
Y2xhbmcgYXMgd2VsbApAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCBhOGJjYWRjLi4wNDFiNjhlIDEwMDY0NAoraW5kZXggMjliOWNjYi4uZWJmOWEzMiAxMDA2
NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTIwNzcsNyArMjA3
Nyw3IEBAIGF0b21pY2RlZmluZSA9ICcnJworQEAgLTIwODgsNyArMjA4OCw3IEBAIGF0b21pY2Rl
ZmluZSA9ICcnJwogICMgV2Uga25vdyB0aGF0IHdlIGNhbiBhbHdheXMgdXNlIHJlYWwgKCJsb2Nr
IGZyZWUiKSBhdG9taWMgb3BlcmF0aW9ucyB3aXRoIE1TVkMKICBpZiBjYy5nZXRfaWQoKSA9PSAn
bXN2Yycgb3IgY2MuZ2V0X2lkKCkgPT0gJ2NsYW5nLWNsJyBvciBjYy5saW5rcyhhdG9taWN0ZXN0
LCBuYW1lIDogJ2F0b21pYyBvcHMnKQogICAgaGF2ZV9hdG9taWNfbG9ja19mcmVlID0gdHJ1ZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5i
dWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5h
YmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCmluZGV4IGFhMDk4ZGEzNzkuLjcz
ZjBkZTRhYmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1
aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGQ1ZTU2NmM0NWE5YWI0ZDdlNTExMDRhYjE3NmU2ZWI1ZjcwNWY5MWQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEwZDhkNTE3MGY2MDU2NTlhZjM4ODc0ZWRk
NDBkNTQzYzY5Y2RkNDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU2F0LCAxNiBTZXAgMjAyMyAyMjoy
ODoyNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogZG8gbm90IGVuYWJsZSBw
aWRmZCBmZWF0dXJlcyBvbiBuYXRpdmUgZ2xpYgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVz
b24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMDQxYjY4ZS4uMTU1YmZkNCAxMDA2NDQKK2lu
ZGV4IGViZjlhMzIuLmJmZTQ1N2EgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVz
b24uYnVpbGQKLUBAIC0xMDc1LDcgKzEwNzUsOCBAQCBpZiBjYy5saW5rcygnJycjaW5jbHVkZSA8
c3lzL3N5c2NhbGwuaD4KK0BAIC0xMDg2LDcgKzEwODYsOCBAQCBpZiBjYy5saW5rcygnJycjaW5j
bHVkZSA8c3lzL3N5c2NhbGwuaD4KICAgICAgICAgICAgICAgICAgIHdhaXRpZCAoUF9QSURGRCwg
MCwgJmNoaWxkX2luZm8sIFdFWElURUQgfCBXTk9IQU5HKTsKICAgICAgICAgICAgICAgICAgIHJl
dHVybiAwOwogICAgICAgICAgICAgICAgIH0nJycsIG5hbWUgOiAncGlkZmRfb3BlbigyKSBzeXN0
ZW0gY2FsbCcpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1w
eXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKaW5kZXggZDI2Zjk0NGQ1MS4uNjcz
NWIyZDFkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAx
MC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2Rl
LXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMjExOTI3ZDJjYWE0YTgxZTExMzFjMjIxMGUxZGI4MzgxMDRhMWZiOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMWIwMTM4Y2YyZmIzYjI1NWI0OTBhZGMyOTFkOTMwMzFjMTk1NDI1
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAzIE9jdCAyMDE3IDEwOjQ1OjU1ICswMzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSBweXRob24gcGF0aCBpbnRvIHZhcmlv
dXMgdG9vbHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3Jl
bG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9y
ZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IGRkZjQ2NDUyNmMuLmQ0ZGIyMzk3OTAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9k
dWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDU2YmFjNTNmMTlkMzA5NGFhMjAwNzA1
NGM4N2Q4NmM5ZDY1YjQyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjdiMWU1MWE1
ZTkwOTcwZTg2NGYzNGU1OTE4MWE1YzM0M2ZjYjFmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDEx
IE1hciAyMDE2IDE1OjM1OjU1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxv
Y2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJlY3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTE4LDEw
ICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5A
aW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvZ2lvL2dpb21vZHVsZS5jIGIvZ2lvL2dpb21vZHVsZS5jCi1pbmRleCA3NmMyMDI4Li42ZGVi
YTdjIDEwMDY0NAoraW5kZXggMzg3NjFlNC4uYWZhNzg3OCAxMDA2NDQKIC0tLSBhL2dpby9naW9t
b2R1bGUuYwogKysrIGIvZ2lvL2dpb21vZHVsZS5jCi1AQCAtMTI2MCwxMSArMTI2MCw2IEBAIGdl
dF9naW9fbW9kdWxlX2RpciAodm9pZCkKK0BAIC0xMjcyLDExICsxMjcyLDYgQEAgZ2V0X2dpb19t
b2R1bGVfZGlyICh2b2lkKQogICAgICAgIGdfZnJlZSAoaW5zdGFsbF9kaXIpOwogICNlbHNlCiAg
ICAgICAgbW9kdWxlX2RpciA9IGdfc3RyZHVwIChHSU9fTU9EVUxFX0RJUik7CkBAIC0zMyw3ICsz
Myw3IEBAIGluZGV4IDc2YzIwMjguLjZkZWJhN2MgMTAwNjQ0CiAgI2luY2x1ZGUgPGRsZmNuLmg+
CiAgICAgICAgewogICAgICAgICAgZ19hdXRvZnJlZSBnY2hhciAqcGF0aCA9IE5VTEw7Ci1AQCAt
MTI4Myw4ICsxMjc4LDYgQEAgZ2V0X2dpb19tb2R1bGVfZGlyICh2b2lkKQorQEAgLTEyOTUsOCAr
MTI5MCw2IEBAIGdldF9naW9fbW9kdWxlX2RpciAodm9pZCkKICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgfQogICAgICAgIH0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAppbmRleCAxMzhlOTcwNTUzLi4xNTc2OTcwNzBhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MWJmY2FiMGI2MGJkNTdmNGQzNDYzYzQ3OWZk
ZjQ3ZTY0NWNkNmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNWY4NjQ4OGFkYmNh
M2JjMjg0NTUyZjE1M2Q3NmQ5MzA1NDNkYzBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUaHUsIDI4IE1hciAy
MDI0IDE2OjI3OjA5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgL3RpbWVvdXQvcm91bmRp
bmcgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAt
aW5pdGlhbF8yLjg2LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1p
bml0aWFsXzIuODYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44Ni4xLmJiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg2LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg2LjEuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIt
Mi4wXzIuODYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjBfMi44Ni4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCmluZGV4IDJlOGRkZTI4
MjAuLjU5MDk4NTE4OTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCkBAIC0yMzYs
NyArMjM2LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcmVsb2Nh
dGUtbW9kdWxlcy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZl
LWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICJiNTczOTk3MmQ3MzdjZmIwZDZmZDFlN2YxNjNkZmU2NTBlMmUw
Mzc0MGJiM2I4ZDQwOGU0ZDFmYWVhNTgwZDZkIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMTE5ZDE3MDhjYTAyMjU1NmQ2ZDI5ODllZTkwYWQxYjgyYmQ5YzBkMTY2N2UwNjY5NDRhNmQw
MDIwZTJkNWU1NyIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEgg
dGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5m
bykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoyLjQ3LjEKCg==

--===============6487661621422113170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGSIZE changed from 60288 to 136515 (+126%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGSIZE changed from 134573 to 161236 (+20%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGSIZE changed from 125979 to 140717 (+12%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: FILELIST: added "/usr/share/installed-tests/glib/utils-unisolated.test /usr/share/installed-tests/glib/field-info.test /usr/libexec/installed-tests/glib/field-info /usr/libexec/installed-tests/glib/utils-unisolated"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.8600.0 /usr/lib/libgobject-2.0.so.0.8600.0 /usr/lib/libglib-2.0.so.0.8600.0 /usr/lib/libgthread-2.0.so.0.8600.0 /usr/lib/libgirepository-2.0.so.0.8600.0 /usr/lib/libgmodule-2.0.so.0.8600.0", added "/usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libglib-2.0.so.0.8600.1 /usr/lib/libgthread-2.0.so.0.8600.1 /usr/lib/libgirepository-2.0.so.0.8600.1 /usr/lib/libgmodule-2.0.so.0.8600.1"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.0 to libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.0 to libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.0 to libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.0 to libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.0 to libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.0 to libgthread-2.0.so.0.8600.1
  /usr/lib/libgio-2.0.so.0.8600.0 moved to /usr/lib/libgio-2.0.so.0.8600.1
  /usr/lib/libgirepository-2.0.so.0.8600.0 moved to /usr/lib/libgirepository-2.0.so.0.8600.1
  /usr/lib/libglib-2.0.so.0.8600.0 moved to /usr/lib/libglib-2.0.so.0.8600.1
  /usr/lib/libgmodule-2.0.so.0.8600.0 moved to /usr/lib/libgmodule-2.0.so.0.8600.1
  /usr/lib/libgobject-2.0.so.0.8600.0 moved to /usr/lib/libgobject-2.0.so.0.8600.1
  /usr/lib/libgthread-2.0.so.0.8600.0 moved to /usr/lib/libgthread-2.0.so.0.8600.1
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============6487661621422113170==--

