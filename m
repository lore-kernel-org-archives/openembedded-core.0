Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A62EEE26E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:56:57 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6541.1767301005747701474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Sqei1yYJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026010120564309feb215ef0002071d-ioxw_z@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026010120564309feb215ef0002071d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:56:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qJGGeHJE9wMnR6JujwFzCLLWci1OuhBoihQJrigahuk=;
 b=Sqei1yYJN6Wv06xaNYKkp3IEf9Em/5oqquDOWAls9FcQR8o/VwtdIMl/YL6gRlRqpJ8qE2
 ORBSjQOPgy+0Yh5Goq7BxWSt9lwQ3bqDRrN3IffDaXyJFxvQA1qoGJDbEB7OnCLiA+ymM4BZ
 LEEcihNzbTEMkbpq4EJ1C96irJhJviC89qTKZkuzTnK/2xRqEhQvSHM/FK/x0XeUSucAbDQW
 ylR5OOdsR4KTYqTST8Fvy39oaaWcAoHpRXHnKCIdHfPUti5HgRJSgPWQpR85wcvvIfP5sG3t
 l3X1SiEFOL3EtlbEdsNX6QPwp0nwFk4gH7noI5OV/cOf80e1NqtSZ1pw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 2/2] glib-2.0: upgrade 2.86.1 -> 2.86.3
Date: Thu,  1 Jan 2026 21:56:42 +0100
Message-Id: <20260101205642.98344-2-peter.marko@siemens.com>
In-Reply-To: <20260101205642.98344-1-peter.marko@siemens.com>
References: <20260101205642.98344-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228834

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 2041beac5c9cf081c5c23220c6fb259381611111)

Handles CVE-2025-13601, CVE-2025-14087 and CVE-2025-14512.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 ....0-initial_2.86.1.bb => glib-2.0-initial_2.86.3.bb} |  0
 .../{glib-2.0_2.86.1.bb => glib-2.0_2.86.3.bb}         |  0
 meta/recipes-core/glib-2.0/glib.inc                    |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.1.bb => glib-2.0-initial_2.86.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.1.bb => glib-2.0_2.86.3.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index c394ab3277..06841ddfb8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
+From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
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
index 19fffbdc5f..b91624da8b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
+From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 89ba10ff6d..2ebf01b672 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
+From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
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
index ebdf957272..d6dd66357a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
+From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 771b03e66d..7a2fc0b7ef 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
+From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 5ad2a0375b..e4b0d6be79 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
+From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a8bcadc..041b68e 100644
+index dab1d61..cc3a5ed 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2077,7 +2077,7 @@ atomicdefine = '''
+@@ -2092,7 +2092,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index aa098da379..712ae25b27 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
+From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 041b68e..155bfd4 100644
+index cc3a5ed..58dd87a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1090,7 +1090,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index d26f944d51..8dbdf746b7 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
+From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index ddf464526c..09de155d08 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
+From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
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
index 138e970553..8ef140d0d7 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
+From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5909851896..bd87d9c601 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
+SRC_URI[archive.sha256sum] = "b3211d8d34b9df5dca05787ef0ad5d7ca75dec998b970e1aab0001d229977c65"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

