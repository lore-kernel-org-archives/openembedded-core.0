Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8646FD5C0CD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17383.1765872127805893802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P8nhDAU6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bBsTwJWd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e4cb3-d6425ff8-8901-4887-959f-24ddab8c3a8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hHsPA5WgtSmV+9l7KwJKHjGyAJXHMB2D42YDXx+Idmk=;
	b=P8nhDAU6vh8sY4OKdd8K06zzu+RHKGPJ7XKtJUGzO1Nkx5n7L2SE9J0QKQSbXMPq
	TLctZPeqKG0XmhHQ83j6AcrK2w5bfKLesjlacvJyribcdh3YMbBgCwElNoABarEkadf
	jPGnDD6OWkAl+4K3mJ38UN8EyMww+KernrqmruaA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hHsPA5WgtSmV+9l7KwJKHjGyAJXHMB2D42YDXx+Idmk=;
	b=bBsTwJWdutVLRPRxg5AUDjmsYdSX3OlyGylQi+fFJoWGmsv5iyTirpfxaK1SwQlO
	2szFXz0VW6zedJKFopkv17XKw//z3nEIX2yHUChMmeqPosW3CehKBr/p/85CtCGZ0Vm
	2Jdksz2RDK17/ZSn8BzdX5z+bsln5K2Z+o+sWfTA=
Content-Type: multipart/mixed; boundary="===============7255783400798448315=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.3,2.86.3 SUCCEEDED
Message-ID: <0101019b262e4cb3-d6425ff8-8901-4887-959f-24ddab8c3a8c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227763

--===============7255783400798448315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.86.3,2.86.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.86.1-2.86.3-2.86.patch
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
From 98af1b7ced815574eef65a07cc7f464b659f200f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 19:18:03 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.86.1 -> 2.86.3,2.86.1 ->
 2.86.3

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
-- 
2.47.1


--===============7255783400798448315==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.86.1-2.86.3-2.86.patch"

RnJvbSA5OGFmMWI3Y2VkODE1NTc0ZWVmNjVhMDdjYzdmNDY0YjY1OWYyMDBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMTk6MTg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMC1pbml0aWFsLGdsaWItMi4wOiB1cGdyYWRlIDIuODYuMSAtPiAyLjg2LjMsMi44Ni4x
IC0+CiAyLjg2LjMKCi0tLQogLi4uMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29u
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
Li4uLjAtaW5pdGlhbF8yLjg2LjEuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjMuYmJ9IHwg
IDAKIC4uLi97Z2xpYi0yLjBfMi44Ni4xLmJiID0+IGdsaWItMi4wXzIuODYuMy5iYn0gICAgICAg
ICB8ICAwCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYyAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogMTMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWlu
aXRpYWxfMi44Ni4xLmJiID0+IGdsaWItMi4wLWluaXRpYWxfMi44Ni4zLmJifSAoMTAwJSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi44Ni4xLmJiID0+IGds
aWItMi4wXzIuODYuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1m
aWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90
LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggYzM5NGFiMzI3
Ny4uMDY4NDFkZGZiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1i
aW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
OTgxZGI1ZDc3NWUwNGI3MmZiNjhiNmE0NTUzYzg3ZmRhZWRlZTY1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA2ZmUzOTY1MzgzZDk0YjMwMzBlODVhYjg5OTk1NTg1ODcxMGZlYzVjIE1v
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
Zi4uYjkxNjI0ZGE4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGli
Yy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDhiZmM4N2U5Zjc1N2NmNjVhZDk2
NzUyMDg2MGJmZDc1MjZjMzZmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTY2YzU4
YWFlMzVmOWUyYmNlZjUyMzhlMDMzMWExMTllMGU1MWFiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IE1h
ciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBEQVRBRElSTkFNRSBv
biB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVl
cnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAppbmRleCA4OWJhMTBmZjZkLi4yZWJm
MDFiNjcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1v
ZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiOGRj
YmYwM2IzMTVkMzE3NTkxNzZlOWQ0ZmQzODllOGZkYTZmZmNkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwZGUzYTNhNzkxY2EzMmYyMzMwZWIzYThhZDlkYTBmZTZkY2U5NTBjIE1vbiBT
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
LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaAppbmRleCBlYmRmOTU3MjcyLi5kNmRk
NjYzNTdhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhl
LXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiZGIyNzcyZDY3MmU5NTU4NDU4NWU5MDI2ODk5MzY1NTljNWRiMDVkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiODI5ZjMyMDVlNGQ4MzkwZjAyZWFhOGU3YTdi
Zjg1ZTUxY2JiN2VkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEyIEp1biAyMDE1IDE3
OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB0aGUgd2FybmluZyBhYm91dCBk
ZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEt
YnVpbGQtaG9zdC1vbmx5LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5
LS5wYXRjaAppbmRleCA3NzFiMDNlNjZkLi43YTJmYzBiN2VmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21t
ZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1i
dWlsZC1ob3N0LW9ubHktLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Y2I3NWQzYmMzNjhl
ZTEwOGE0YjE0YmM1N2E5MmJkMGMwYjJlMTBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5MTJlNjc0YmIwYTNiNTFkYWJhYTU4ZGExODM0NDkxZWY5NGU2YTJhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDggSmFuIDIwMjAgMTg6MjI6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZ2lvL3Rlc3RzL3Jlc291cmNlcy5jOiBjb21tZW50IG91dCBhIGJ1aWxkIGhvc3Qtb25seSB0
ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1l
c29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFu
Zy1hcy13ZWxsLnBhdGNoCmluZGV4IDVhZDJhMDM3NWIuLmU0YjBkNmJlNzkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3Mt
dGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MDI5ODRmZTM0MGE3NmM5MmUyYzA0MjM1ZjQzZmRj
YjQ3NzI4ODA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNmRkYWUwMmQ3Njc3YmNm
ZjdjMzkzM2VlODU2ZDM0ZGY0MWI1NDhmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6
NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24g
Y2xhbmcgYXMgd2VsbApAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCBhOGJjYWRjLi4wNDFiNjhlIDEwMDY0NAoraW5kZXggZGFiMWQ2MS4uY2MzYTVlZCAxMDA2
NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTIwNzcsNyArMjA3
Nyw3IEBAIGF0b21pY2RlZmluZSA9ICcnJworQEAgLTIwOTIsNyArMjA5Miw3IEBAIGF0b21pY2Rl
ZmluZSA9ICcnJwogICMgV2Uga25vdyB0aGF0IHdlIGNhbiBhbHdheXMgdXNlIHJlYWwgKCJsb2Nr
IGZyZWUiKSBhdG9taWMgb3BlcmF0aW9ucyB3aXRoIE1TVkMKICBpZiBjYy5nZXRfaWQoKSA9PSAn
bXN2Yycgb3IgY2MuZ2V0X2lkKCkgPT0gJ2NsYW5nLWNsJyBvciBjYy5saW5rcyhhdG9taWN0ZXN0
LCBuYW1lIDogJ2F0b21pYyBvcHMnKQogICAgaGF2ZV9hdG9taWNfbG9ja19mcmVlID0gdHJ1ZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5i
dWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5h
YmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCmluZGV4IGFhMDk4ZGEzNzkuLjcx
MmFlMjViMjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1
aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGQ1ZTU2NmM0NWE5YWI0ZDdlNTExMDRhYjE3NmU2ZWI1ZjcwNWY5MWQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM2Y2QzYzBhNjZhZThmMjEwMTg1ZTBjYjA1
YjIxNzJkYzE5MmNlOWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU2F0LCAxNiBTZXAgMjAyMyAyMjoy
ODoyNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogZG8gbm90IGVuYWJsZSBw
aWRmZCBmZWF0dXJlcyBvbiBuYXRpdmUgZ2xpYgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVz
b24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMDQxYjY4ZS4uMTU1YmZkNCAxMDA2NDQKK2lu
ZGV4IGNjM2E1ZWQuLjU4ZGQ4N2EgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVz
b24uYnVpbGQKLUBAIC0xMDc1LDcgKzEwNzUsOCBAQCBpZiBjYy5saW5rcygnJycjaW5jbHVkZSA8
c3lzL3N5c2NhbGwuaD4KK0BAIC0xMDkwLDcgKzEwOTAsOCBAQCBpZiBjYy5saW5rcygnJycjaW5j
bHVkZSA8c3lzL3N5c2NhbGwuaD4KICAgICAgICAgICAgICAgICAgIHdhaXRpZCAoUF9QSURGRCwg
MCwgJmNoaWxkX2luZm8sIFdFWElURUQgfCBXTk9IQU5HKTsKICAgICAgICAgICAgICAgICAgIHJl
dHVybiAwOwogICAgICAgICAgICAgICAgIH0nJycsIG5hbWUgOiAncGlkZmRfb3BlbigyKSBzeXN0
ZW0gY2FsbCcpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1w
eXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKaW5kZXggZDI2Zjk0NGQ1MS4uOGRi
ZGY3NDZiNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAx
MC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2Rl
LXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMjExOTI3ZDJjYWE0YTgxZTExMzFjMjIxMGUxZGI4MzgxMDRhMWZiOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNDBlNDAyMzBlNmEzYzUyYjc5YzZmOTJlOGMwNjBiZDRkOTNmMDM3
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAzIE9jdCAyMDE3IDEwOjQ1OjU1ICswMzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSBweXRob24gcGF0aCBpbnRvIHZhcmlv
dXMgdG9vbHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3Jl
bG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9y
ZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IGRkZjQ2NDUyNmMuLjA5ZGUxNTVkMDggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9k
dWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDU2YmFjNTNmMTlkMzA5NGFhMjAwNzA1
NGM4N2Q4NmM5ZDY1YjQyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTRiYmM3N2Jj
NDY1YjQyNDU0MTEyYmM2YTMzMjY0YzJjM2UwMTNlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
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
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAppbmRleCAxMzhlOTcwNTUzLi44ZWYxNDBkMGQ3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MWJmY2FiMGI2MGJkNTdmNGQzNDYzYzQ3OWZk
ZjQ3ZTY0NWNkNmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNzdiOWRkNzJkZDAx
MDNjN2EyOGRkN2UxY2RmNmUzMTZlY2JmMDMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUaHUsIDI4IE1hciAy
MDI0IDE2OjI3OjA5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgL3RpbWVvdXQvcm91bmRp
bmcgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAt
aW5pdGlhbF8yLjg2LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1p
bml0aWFsXzIuODYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44Ni4zLmJiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg2LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg2LjMuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIt
Mi4wXzIuODYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjBfMi44Ni4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCmluZGV4IDU5MDk4NTE4
OTYuLmJkODdkOWM2MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCkBAIC0yMzYs
NyArMjM2LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcmVsb2Nh
dGUtbW9kdWxlcy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZl
LWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICIxMTlkMTcwOGNhMDIyNTU2ZDZkMjk4OWVlOTBhZDFiODJiZDlj
MGQxNjY3ZTA2Njk0NGE2ZDAwMjBlMmQ1ZTU3IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiYjMyMTFkOGQzNGI5ZGY1ZGNhMDU3ODdlZjBhZDVkN2NhNzVkZWM5OThiOTcwZTFhYWIwMDAx
ZDIyOTk3N2M2NSIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEgg
dGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5m
bykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoyLjQ3LjEKCg==

--===============7255783400798448315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.8600.1 /usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgirepository-2.0.so.0.8600.1 /usr/lib/libglib-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libgthread-2.0.so.0.8600.1", added "/usr/lib/libgthread-2.0.so.0.8600.3 /usr/lib/libgmodule-2.0.so.0.8600.3 /usr/lib/libglib-2.0.so.0.8600.3 /usr/lib/libgirepository-2.0.so.0.8600.3 /usr/lib/libgio-2.0.so.0.8600.3 /usr/lib/libgobject-2.0.so.0.8600.3"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was removed

--===============7255783400798448315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 37448346 to 37451594 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgmodule-2.0.so.0.8600.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8600.1 /usr/lib/.debug/libgirepository-2.0.so.0.8600.1 /usr/lib/.debug/libglib-2.0.so.0.8600.1 /usr/lib/.debug/libgobject-2.0.so.0.8600.1 /usr/lib/.debug/libgio-2.0.so.0.8600.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py", added "/usr/lib/.debug/libgmodule-2.0.so.0.8600.3 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8600.3 /usr/lib/.debug/libgirepository-2.0.so.0.8600.3 /usr/lib/.debug/libglib-2.0.so.0.8600.3 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.8600.3 /usr/lib/.debug/libgio-2.0.so.0.8600.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25708825 to 25712076 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.86.1/gobject/tests -> /usr/src/debug/glib-2.0/2.86.3/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.86.3/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio/xdgmime -> /usr/src/debug/glib-2.0/2.86.3/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.86.1/glib/deprecated -> /usr/src/debug/glib-2.0/2.86.3/glib/deprecated, directory renamed /usr/src/debug/glib-2.0/2.86.1/gthread -> /usr/src/debug/glib-2.0/2.86.3/gthread, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository/cmph -> /usr/src/debug/glib-2.0/2.86.3/girepository/cmph, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository/compiler -> /usr/src/debug/glib-2.0/2.86.3/girepository/compiler, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository/inspector -> /usr/src/debug
 /glib-2.0/2.86.3/girepository/inspector, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository/tests -> /usr/src/debug/glib-2.0/2.86.3/girepository/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio -> /usr/src/debug/glib-2.0/2.86.3/gio, directory renamed /usr/src/debug/glib-2.0/2.86.1/gmodule -> /usr/src/debug/glib-2.0/2.86.3/gmodule, directory renamed /usr/src/debug/glib-2.0/2.86.1/glib/libcharset -> /usr/src/debug/glib-2.0/2.86.3/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.86.1/gobject -> /usr/src/debug/glib-2.0/2.86.3/gobject, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio/inotify -> /usr/src/debug/glib-2.0/2.86.3/gio/inotify, directory renamed /usr/src/debug/glib-2.0/2.86.1/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.86.3/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.86.1/glib -> /usr/src/debug/glib-2.0/2.86.3/glib, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio/tests/modules -> /usr/src/debug/gli
 b-2.0/2.86.3/gio/tests/modules, directory renamed /usr/src/debug/glib-2.0/2.86.1/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.86.3/glib/tests/path-test-subdir, directory renamed /usr/src/debug/glib-2.0/2.86.1/gthread/tests -> /usr/src/debug/glib-2.0/2.86.3/gthread/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository/decompiler -> /usr/src/debug/glib-2.0/2.86.3/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.86.1/gio/tests -> /usr/src/debug/glib-2.0/2.86.3/gio/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/glib/tests -> /usr/src/debug/glib-2.0/2.86.3/glib/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/gmodule/tests -> /usr/src/debug/glib-2.0/2.86.3/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.86.1/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.86.3/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.86.1/girepository -> /usr/src/debug/glib-2.0/2.86.3/girepository
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgirepository-2.0.so.0.8600.1 /usr/lib/libgmodule-2.0.so.0.8600.1 /usr/lib/libglib-2.0.so.0.8600.1 /usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libgthread-2.0.so.0.8600.1", added "/usr/lib/libgirepository-2.0.so.0.8600.3 /usr/lib/libgmodule-2.0.so.0.8600.3 /usr/lib/libglib-2.0.so.0.8600.3 /usr/lib/libgobject-2.0.so.0.8600.3 /usr/lib/libgio-2.0.so.0.8600.3 /usr/lib/libgthread-2.0.so.0.8600.3"
packages/x86-64-v3-poky-linux/glib-2.0: PV changed from "2.86.1" to "2.86.3"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.86.1 [default] to 2.86.3 [default]
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.86/glib-2.86.1.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.86/glib-2.86.3.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-
 on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was removed

--===============7255783400798448315==--

