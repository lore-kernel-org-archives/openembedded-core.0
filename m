Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD9DCCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2340.1762384568966752539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mFcgv0Mh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZG9JueJo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564e5eb7-4716a97a-8e12-4ff9-80de-fbd7f4a51eb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7zhz+B94ifFxdVujRetc24GLz3qE8dnNt9LPmkCMRHE=;
	b=mFcgv0MhCUXnJKAMKILnDDchRS8xqWGVfExMErNoP1nhMjlkRIYZRVZBXZ2ZeNPQ
	eDpANVZznqI3OsiImwjxtRlT7cdt+t5L/vf19AjFnL5+SWpcQnPETE9+5tbBl7rpn1r
	DfiTSGdoVk6fCacBTDxE4YGgaMjdKkvP4+G2MSQU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7zhz+B94ifFxdVujRetc24GLz3qE8dnNt9LPmkCMRHE=;
	b=ZG9JueJo4pl+Sf4VzcDloNMYdmrwhLsokihwXkmsR1PgJ6tzHq5H5cdUP8xZc1O7
	DQkA2U40T+p6ZIoSBG8qmKUq7IyVf7/3bt2zsTQckssAIKaeAbUptodbcj5QSYFXpS/
	iKx++NyZFO+Jzp5EVJklxhRiqAnlP5YeECkZkEyw=
Content-Type: multipart/mixed; boundary="===============2612692933457763302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.1,2.86.1 SUCCEEDED
Message-ID: <0101019a564e5eb7-4716a97a-8e12-4ff9-80de-fbd7f4a51eb2-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225782

--===============2612692933457763302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.86.1,2.86.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.86.0-2.86.1-2.86.patch
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
From 829476289a95f49e5fd6a9142171360bf53a171a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 12:03:11 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.86.0 -> 2.86.1,2.86.0 ->
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
index c394ab3277..0c5ced3545 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
+From 130b27884b35f5b393cefd9117fbf15c87eb0cea Mon Sep 17 00:00:00 2001
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
index 19fffbdc5f..3cbbf0ff59 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
+From 6d67f632da0f57423c19e2ffba9b743c0380f4ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 89ba10ff6d..b917b10d3c 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
+From 970f1c2f0f0e9246d3741227240d60b7c9e37516 Mon Sep 17 00:00:00 2001
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
index ebdf957272..964230a4a3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
+From 79dd7678b469b10de07ce631661ac0187b767535 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 771b03e66d..656c99608a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
+From 37f43c967fd1c3e3392836781a2d117d6f92f041 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 5ad2a0375b..15dceece1d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
+From 14a5320c40a1ecf56d031534963f092fed0c496d Mon Sep 17 00:00:00 2001
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
index aa098da379..52cb6bf23a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
+From b3413d3fa9c57bab12be8ede6ae97e3e57f35c5c Mon Sep 17 00:00:00 2001
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
index d26f944d51..66d12b88ef 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
+From ac76bdeaf5934e8e4d8373fa43bc4eaf999c186f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index ddf464526c..16847fee1c 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
+From 4eaf90727430f5ae706bb24272e9ad6e6ea14aad Mon Sep 17 00:00:00 2001
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
index 138e970553..9002f57be9 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
+From 47086e02cc5c5850ad725207f0a93eaf78e91944 Mon Sep 17 00:00:00 2001
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
index f9cb3417ec..e6cfd8394f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
+SRC_URI[sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============2612692933457763302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.86.0-2.86.1-2.86.patch"

RnJvbSA4Mjk0NzYyODlhOTVmNDllNWZkNmE5MTQyMTcxMzYwYmY1M2ExNzFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMjowMzoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wLWluaXRpYWwsZ2xpYi0yLjA6IHVwZ3JhZGUgMi44Ni4wIC0+IDIuODYuMSwyLjg2LjAg
LT4KIDIuODYuMQoKLS0tCiAuLi4wMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25m
aWctZmlsZXMucGF0Y2ggfCAxMCArKysrKy0tLS0tCiAuLi4vZmlsZXMvMDAwMS1GaXgtREFUQURJ
Uk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoICAgfCAgMiArLQogLi4uMS1JbnN0YWxsLWdpby1x
dWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIHwgIDYgKysrLS0tCiAuLi50aGUt
d2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2ggfCAgMiArLQog
Li4udHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIHwg
IDIgKy0KIC4uLi8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5w
YXRjaCB8ICA2ICsrKy0tLQogLi4udWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9u
LW5hdGl2ZS1nLnBhdGNoIHwgIDYgKysrLS0tCiAuLi5vLW5vdC1oYXJkY29kZS1weXRob24tcGF0
aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggfCAgMiArLQogLi4uL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIHwgIDggKysrKy0tLS0KIG1ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCAgICB8ICAyICstCiAu
Li4uMC1pbml0aWFsXzIuODYuMC5iYiA9PiBnbGliLTIuMC1pbml0aWFsXzIuODYuMS5iYn0gfCAg
MAogLi4uL3tnbGliLTIuMF8yLjg2LjAuYmIgPT4gZ2xpYi0yLjBfMi44Ni4xLmJifSAgICAgICAg
IHwgIDAKIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyNCBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjAtaW5p
dGlhbF8yLjg2LjAuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjEuYmJ9ICgxMDAlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjg2LjAuYmIgPT4gZ2xp
Yi0yLjBfMi44Ni4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZp
bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qt
d3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAppbmRleCBjMzk0YWIzMjc3
Li4wYzVjZWQzNTQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJp
bmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg5
ODFkYjVkNzc1ZTA0YjcyZmI2OGI2YTQ1NTNjODdmZGFlZGVlNjUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDEzMGIyNzg4NGIzNWY1YjM5M2NlZmQ5MTE3ZmJmMTVjODdlYjBjZWEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTUgRmViIDIwMTkgMTE6MTc6MjcgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZWZpeCBleGVjdXRhYmxlcyB3aXRoICRiaW5kaXIgaW4g
cGtnLWNvbmZpZyBmaWxlcwpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9naW8vbWVz
b24uYnVpbGQgYi9naW8vbWVzb24uYnVpbGQKLWluZGV4IDVkOTFiODkuLjFhOGRhMTIgMTAwNjQ0
CitpbmRleCAyZjhmMTg4Li41N2M0OGQyIDEwMDY0NAogLS0tIGEvZ2lvL21lc29uLmJ1aWxkCiAr
KysgYi9naW8vbWVzb24uYnVpbGQKLUBAIC05MDEsMTcgKzkwMSwxOCBAQCBsaWJnaW9fZGVwID0g
ZGVjbGFyZV9kZXBlbmRlbmN5KGxpbmtfd2l0aCA6IGxpYmdpbywKK0BAIC05MTIsMTcgKzkxMiwx
OCBAQCBsaWJnaW9fZGVwID0gZGVjbGFyZV9kZXBlbmRlbmN5KGxpbmtfd2l0aCA6IGxpYmdpbywK
ICBwa2cuZ2VuZXJhdGUobGliZ2lvLAogICAgcmVxdWlyZXMgOiBbJ2dsaWItMi4wJywgJ2dvYmpl
Y3QtMi4wJ10sCiAgICB2YXJpYWJsZXMgOiBbCkBAIC00NiwxMCArNDYsMTAgQEAgaW5kZXggNWQ5
MWI4OS4uMWE4ZGExMiAxMDA2NDQKICAgIHVuaW5zdGFsbGVkX3ZhcmlhYmxlcyA6IFsKICAgICAg
J2dpbz0ke3ByZWZpeH0vZ2lvL2dpbycsCiBkaWZmIC0tZ2l0IGEvZ2xpYi9tZXNvbi5idWlsZCBi
L2dsaWIvbWVzb24uYnVpbGQKLWluZGV4IDgzNzk2MGQuLjk3ZDRhZjAgMTAwNjQ0CitpbmRleCAy
MDliY2JmLi5hODZjZmQzIDEwMDY0NAogLS0tIGEvZ2xpYi9tZXNvbi5idWlsZAogKysrIGIvZ2xp
Yi9tZXNvbi5idWlsZAotQEAgLTQ0Myw5ICs0NDMsMTAgQEAgcGtnLmdlbmVyYXRlKGxpYmdsaWIs
CitAQCAtNDY0LDkgKzQ2NCwxMCBAQCBwa2cuZ2VuZXJhdGUobGliZ2xpYiwKICAgIHN1YmRpcnMg
OiBbJ2dsaWItMi4wJ10sCiAgICBleHRyYV9jZmxhZ3MgOiBbJy1JJHtsaWJkaXJ9L2dsaWItMi4w
L2luY2x1ZGUnXSArIHdpbjMyX2NmbGFncywKICAgIHZhcmlhYmxlcyA6IFsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9u
LXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAppbmRleCAxOWZmZmJkYzVm
Li4zY2JiZjBmZjU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJj
LUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0OGJmYzg3ZTlmNzU3Y2Y2NWFkOTY3
NTIwODYwYmZkNzUyNmMzNmYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZDY3ZjYz
MmRhMGY1NzQyM2MxOWUyZmZiYTliNzQzYzAzODBmNGFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTUgTWFy
IDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IERBVEFESVJOQU1FIG9u
IHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVy
eW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4IDg5YmExMGZmNmQuLmI5MTdi
MTBkM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
SW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9k
dWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4ZGNi
ZjAzYjMxNWQzMTc1OTE3NmU5ZDRmZDM4OWU4ZmRhNmZmY2QgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDk3MGYxYzJmMGYwZTkyNDZkMzc0MTIyNzI0MGQ2MGI3YzllMzc1MTYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5A
aW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAogU3ViamVj
dDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9HUkFNCkBA
IC0xMywxMCArMTMsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVj
aWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL2dp
by9tZXNvbi5idWlsZCBiL2dpby9tZXNvbi5idWlsZAotaW5kZXggODU0Yjk1YS4uNWQ5MWI4OSAx
MDA2NDQKK2luZGV4IDM5MjU2ZDMuLjJmOGYxODggMTAwNjQ0CiAtLS0gYS9naW8vbWVzb24uYnVp
bGQKICsrKyBiL2dpby9tZXNvbi5idWlsZAotQEAgLTEwMzgsNiArMTAzOCw3IEBAIGdpb19xdWVy
eW1vZHVsZXMgPSBleGVjdXRhYmxlKCdnaW8tcXVlcnltb2R1bGVzJywgJ2dpby1xdWVyeW1vZHVs
ZXMuYycsICdnaW9tb2R1CitAQCAtMTA0OSw2ICsxMDQ5LDcgQEAgZ2lvX3F1ZXJ5bW9kdWxlcyA9
IGV4ZWN1dGFibGUoJ2dpby1xdWVyeW1vZHVsZXMnLCAnZ2lvLXF1ZXJ5bW9kdWxlcy5jJywgJ2dp
b21vZHUKICAgIGNfYXJncyA6IGdpb19jX2FyZ3MsCiAgICAjIGludGwubGliIGlzIG5vdCBjb21w
YXRpYmxlIHdpdGggU0FGRVNFSAogICAgbGlua19hcmdzIDogbm9zZWhfbGlua19hcmdzLApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhl
LXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQt
ZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCmluZGV4IGViZGY5NTcyNzIuLjk2NDIz
MGE0YTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
UmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUt
d2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGJkYjI3NzJkNjcyZTk1NTg0NTg1ZTkwMjY4OTkzNjU1OWM1ZGIwNWQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc5ZGQ3Njc4YjQ2OWIxMGRlMDdjZTYzMTY2MWFj
MDE4N2I3Njc1MzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTIgSnVuIDIwMTUgMTc6
MDg6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHRoZSB3YXJuaW5nIGFib3V0IGRl
cHJlY2F0ZWQgcGF0aHMgaW4gc2NoZW1hcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1i
dWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHkt
LnBhdGNoCmluZGV4IDc3MWIwM2U2NmQuLjY1NmM5OTYwOGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1l
bnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1
aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhjYjc1ZDNiYzM2OGVl
MTA4YTRiMTRiYzU3YTkyYmQwYzBiMmUxMGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDM3ZjQzYzk2N2ZkMWMzZTMzOTI4MzY3ODFhMmQxMTdkNmY5MmYwNDEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoyMjo0NiArMDEwMAogU3ViamVjdDogW1BBVENI
XSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1lbnQgb3V0IGEgYnVpbGQgaG9zdC1vbmx5IHRl
c3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVz
b24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5n
LWFzLXdlbGwucGF0Y2gKaW5kZXggNWFkMmEwMzc1Yi4uMTVkY2VlY2UxZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10
ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUwMjk4NGZlMzQwYTc2YzkyZTJjMDQyMzVmNDNmZGNi
NDc3Mjg4MDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0YTUzMjBjNDBhMWVjZjU2
ZDAzMTUzNDk2M2YwOTJmZWQwYzQ5NmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMiBPY3QgMjAxOSAxNzo0
NjoyNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbjogUnVuIGF0b21pY3MgdGVzdCBvbiBj
bGFuZyBhcyB3ZWxsCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IGE4YmNhZGMuLjA0MWI2OGUgMTAwNjQ0CitpbmRleCAyOWI5Y2NiLi5lYmY5YTMyIDEwMDY0
NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMjA3Nyw3ICsyMDc3
LDcgQEAgYXRvbWljZGVmaW5lID0gJycnCitAQCAtMjA4OCw3ICsyMDg4LDcgQEAgYXRvbWljZGVm
aW5lID0gJycnCiAgIyBXZSBrbm93IHRoYXQgd2UgY2FuIGFsd2F5cyB1c2UgcmVhbCAoImxvY2sg
ZnJlZSIpIGF0b21pYyBvcGVyYXRpb25zIHdpdGggTVNWQwogIGlmIGNjLmdldF9pZCgpID09ICdt
c3ZjJyBvciBjYy5nZXRfaWQoKSA9PSAnY2xhbmctY2wnIG9yIGNjLmxpbmtzKGF0b21pY3Rlc3Qs
IG5hbWUgOiAnYXRvbWljIG9wcycpCiAgICBoYXZlX2F0b21pY19sb2NrX2ZyZWUgPSB0cnVlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1
aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFi
bGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKaW5kZXggYWEwOThkYTM3OS4uNTJj
YjZiZjIzYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVp
bGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZDVlNTY2YzQ1YTlhYjRkN2U1MTEwNGFiMTc2ZTZlYjVmNzA1ZjkxZCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjM0MTNkM2ZhOWM1N2JhYjEyYmU4ZWRlNmFl
OTdlM2U1N2YzNWM1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIzIDIyOjI4
OjI3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBkbyBub3QgZW5hYmxlIHBp
ZGZkIGZlYXR1cmVzIG9uIG5hdGl2ZSBnbGliCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNv
bi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwNDFiNjhlLi4xNTViZmQ0IDEwMDY0NAoraW5k
ZXggZWJmOWEzMi4uYmZlNDU3YSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNv
bi5idWlsZAotQEAgLTEwNzUsNyArMTA3NSw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNsdWRlIDxz
eXMvc3lzY2FsbC5oPgorQEAgLTEwODYsNyArMTA4Niw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNs
dWRlIDxzeXMvc3lzY2FsbC5oPgogICAgICAgICAgICAgICAgICAgd2FpdGlkIChQX1BJREZELCAw
LCAmY2hpbGRfaW5mbywgV0VYSVRFRCB8IFdOT0hBTkcpOwogICAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7CiAgICAgICAgICAgICAgICAgfScnJywgbmFtZSA6ICdwaWRmZF9vcGVuKDIpIHN5c3Rl
bSBjYWxsJykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5
dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAppbmRleCBkMjZmOTQ0ZDUxLi42NmQx
MmI4OGVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEw
LURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUt
cHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAyMTE5MjdkMmNhYTRhODFlMTEzMWMyMjEwZTFkYjgzODEwNGExZmI5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBhYzc2YmRlYWY1OTM0ZThlNGQ4MzczZmE0M2JjNGVhZjk5OWMxODZm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDMgT2N0IDIwMTcgMTA6NDU6NTUgKzAzMDAK
IFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGhhcmRjb2RlIHB5dGhvbiBwYXRoIGludG8gdmFyaW91
cyB0b29scwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVs
b2NhdGUtbW9kdWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3Jl
bG9jYXRlLW1vZHVsZXMucGF0Y2gKaW5kZXggZGRmNDY0NTI2Yy4uMTY4NDdmZWUxYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1
bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTZiYWM1M2YxOWQzMDk0YWEyMDA3MDU0
Yzg3ZDg2YzlkNjViNDIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZWFmOTA3Mjc0
MzBmNWFlNzA2YmIyNDI3MmU5YWQ2ZTZlYTE0YWFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEg
TWFyIDIwMTYgMTU6MzU6NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9j
YXRlIHRoZSBHSU8gbW9kdWxlIGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpAQCAtMTgsMTAg
KzE4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBp
bnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9naW8vZ2lvbW9kdWxlLmMgYi9naW8vZ2lvbW9kdWxlLmMKLWluZGV4IDc2YzIwMjguLjZkZWJh
N2MgMTAwNjQ0CitpbmRleCAzODc2MWU0Li5hZmE3ODc4IDEwMDY0NAogLS0tIGEvZ2lvL2dpb21v
ZHVsZS5jCiArKysgYi9naW8vZ2lvbW9kdWxlLmMKLUBAIC0xMjYwLDExICsxMjYwLDYgQEAgZ2V0
X2dpb19tb2R1bGVfZGlyICh2b2lkKQorQEAgLTEyNzIsMTEgKzEyNzIsNiBAQCBnZXRfZ2lvX21v
ZHVsZV9kaXIgKHZvaWQpCiAgICAgICAgZ19mcmVlIChpbnN0YWxsX2Rpcik7CiAgI2Vsc2UKICAg
ICAgICBtb2R1bGVfZGlyID0gZ19zdHJkdXAgKEdJT19NT0RVTEVfRElSKTsKQEAgLTMzLDcgKzMz
LDcgQEAgaW5kZXggNzZjMjAyOC4uNmRlYmE3YyAxMDA2NDQKICAjaW5jbHVkZSA8ZGxmY24uaD4K
ICAgICAgICB7CiAgICAgICAgICBnX2F1dG9mcmVlIGdjaGFyICpwYXRoID0gTlVMTDsKLUBAIC0x
MjgzLDggKzEyNzgsNiBAQCBnZXRfZ2lvX21vZHVsZV9kaXIgKHZvaWQpCitAQCAtMTI5NSw4ICsx
MjkwLDYgQEAgZ2V0X2dpb19tb2R1bGVfZGlyICh2b2lkKQogICAgICAgICAgICAgICAgfQogICAg
ICAgICAgICB9CiAgICAgICAgfQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCmluZGV4IDEzOGU5NzA1NTMuLjkwMDJmNTdiZTkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUxYmZjYWIwYjYwYmQ1N2Y0ZDM0NjNjNDc5ZmRm
NDdlNjQ1Y2Q2ZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ3MDg2ZTAyY2M1YzU4
NTBhZDcyNTIwN2YwYTkzZWFmNzhlOTE5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFRodSwgMjggTWFyIDIw
MjQgMTY6Mjc6MDkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tpcCAvdGltZW91dC9yb3VuZGlu
ZyB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1p
bml0aWFsXzIuODYuMC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWlu
aXRpYWxfMi44Ni4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODYuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg2LjEuYmIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODYuMC5iYiBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODYuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjBfMi44Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIu
MF8yLjg2LjEuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIu
aW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKaW5kZXggZjljYjM0MTdl
Yy4uZTZjZmQ4Mzk0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKQEAgLTIzNiw3
ICsyMzYsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0
ZS1tb2R1bGVzLnBhdGNoIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZTov
LzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUt
Zy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiNTczOTk3MmQ3MzdjZmIwZDZmZDFlN2YxNjNkZmU2NTBlMmUwMzc0MGJiM2I4
ZDQwOGU0ZDFmYWVhNTgwZDZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExOWQxNzA4Y2EwMjI1
NTZkNmQyOTg5ZWU5MGFkMWI4MmJkOWMwZDE2NjdlMDY2OTQ0YTZkMDAyMGUyZDVlNTciCiAKICMg
RmluZCBhbnkgbWVzb24gY3Jvc3MgZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQgYXJlIHJlbGV2YW50
IGZvciB0aGUgY3VycmVudAogIyBidWlsZCAodXNpbmcgc2l0ZWluZm8pIGFuZCBhZGQgdGhlbSB0
byBFWFRSQV9PRU1FU09OLgotLSAKMi40Ny4xCgo=

--===============2612692933457763302==
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.8600.0 /usr/lib/libgthread-2.0.so.0.8600.0 /usr/lib/libgmodule-2.0.so.0.8600.0 /usr/lib/libgio-2.0.so.0.8600.0 /usr/lib/libgobject-2.0.so.0.8600.0 /usr/lib/libgirepository-2.0.so.0.8600.0", added "/usr/lib/libglib-2.0.so.0.8600.1 /usr/lib/libgmodule-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgthread-2.0.so.0.8600.1 /usr/lib/libgirepository-2.0.so.0.8600.1"
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

--===============2612692933457763302==
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgobject-2.0.so.0.8600.0 /usr/lib/.debug/libglib-2.0.so.0.8600.0 /usr/lib/.debug/libgirepository-2.0.so.0.8600.0 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8600.0 /usr/lib/.debug/libgmodule-2.0.so.0.8600.0 /usr/lib/.debug/libgthread-2.0.so.0.8600.0 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py", added "/usr/lib/.debug/libglib-2.0.so.0.8600.1 /usr/lib/.debug/libgobject-2.0.so.0.8600.1 /usr/lib/.debug/libgirepository-2.0.so.0.8600.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py /usr/libexec/installed-tests/glib/.debug/field-info /usr/lib/.debug/libgio-2.0.so.0.8600.1 /usr/lib/.debug/libgmodule-2.0.so.0.8600.1 /usr/lib/.debug/libgthread-2.0.so.0.8600.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py /usr/libexec/installed-tests/glib/.debug/utils-unisolated"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 37294290 to 37392722 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 14942675 to 14943793 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGSIZE changed from 147071 to 147277 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGSIZE changed from 132502 to 133089 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGSIZE changed from 60288 to 136515 (+126%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGSIZE changed from 142571 to 142265 (-0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGSIZE changed from 144076 to 144273 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGSIZE changed from 145455 to 145666 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGSIZE changed from 134573 to 161236 (+20%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGSIZE changed from 149788 to 149985 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGSIZE changed from 138448 to 138636 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 141742 to 141949 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGSIZE changed from 142004 to 142678 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGSIZE changed from 144386 to 144579 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGSIZE changed from 125979 to 140717 (+12%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGSIZE changed from 175004 to 179491 (+3%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGSIZE changed from 139397 to 139586 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGSIZE changed from 183195 to 183335 (+0%)
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: FILELIST: added "/usr/share/installed-tests/glib/utils-unisolated.test /usr/share/installed-tests/glib/field-info.test /usr/libexec/installed-tests/glib/field-info /usr/libexec/installed-tests/glib/utils-unisolated"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 13737927 to 13807895 (+1%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.8600.0 /usr/lib/libgthread-2.0.so.0.8600.0 /usr/lib/libgio-2.0.so.0.8600.0 /usr/lib/libgobject-2.0.so.0.8600.0 /usr/lib/libgirepository-2.0.so.0.8600.0 /usr/lib/libglib-2.0.so.0.8600.0", added "/usr/lib/libgmodule-2.0.so.0.8600.1 /usr/lib/libgobject-2.0.so.0.8600.1 /usr/lib/libgio-2.0.so.0.8600.1 /usr/lib/libgthread-2.0.so.0.8600.1 /usr/lib/libgirepository-2.0.so.0.8600.1 /usr/lib/libglib-2.0.so.0.8600.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 4860842 to 4861098 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.86.0" to "2.86.1"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.86.0 [default] to 2.86.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.86/glib-2.86.0.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.86/glib-2.86.1.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch fil
 e://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
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

--===============2612692933457763302==--

