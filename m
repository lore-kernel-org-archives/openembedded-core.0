Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4061C35FF3
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10351.1742048287062527983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CPwfAhle;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FVmw0cnf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2b53d6-ee8c4096-c772-4beb-ad43-e1a90c7dd4cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VEpk6aKigl3lM13HgxtgLpS0Blw46HMM9Uqr2L4SCyM=;
	b=CPwfAhleuYFql081Ix20l7zPxC6IY8HioryCb0yZjOlXSit5sBkUbpq5eQYvE6Hm
	8c3vwUmGztTwWBUajYfU9QO9e5jXxG8UaOSuuODYSHiiXQ/5qzp+3NjWs0EF4CA0oBs
	FeMVdI9fsbgK+AwZ9zgQTuV1HkiX1J7EB6YwfHBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VEpk6aKigl3lM13HgxtgLpS0Blw46HMM9Uqr2L4SCyM=;
	b=FVmw0cnfKMC4unKvRFSb6ou+x4VqdAy2SrXwah2bt678jFqCiYDqpEDyvWGQ9sxn
	+LtVeFJTI3fHV/satxw3eKux1dl1rS/QqnhdWoBA3mh2Q6TCk6pG9DLPFmLeEjcoIgG
	Vu2TeTSBZ7DMTiXyBTcG0xxFdJcDRRsELo+yMMP8=
Content-Type: multipart/mixed; boundary="===============3313658229752894684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.84.0,2.84.0 SUCCEEDED
Message-ID: <010101959a2b53d6-ee8c4096-c772-4beb-ad43-e1a90c7dd4cd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212877

--===============3313658229752894684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.84.0,2.84.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-glib-2.0-initial-upgrade-2.82.4-2.84.0-2.82.patch
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
From 4b5b44c92bc196d5c411ce79d5f786fc577444a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 05:25:36 +0000
Subject: [PATCH] glib-2.0,glib-2.0-initial: upgrade 2.82.4 -> 2.84.0,2.82.4 ->
 2.84.0

---
 ...Do-not-write-bindir-into-pkg-config-files.patch | 14 +++++++-------
 .../0001-Fix-DATADIRNAME-on-uclibc-Linux.patch     |  2 +-
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...warning-about-deprecated-paths-in-schemas.patch |  4 ++--
 ...esources.c-comment-out-a-build-host-only-.patch |  6 +++---
 ...1-meson-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...-do-not-enable-pidfd-features-on-native-g.patch |  6 +++---
 ...t-hardcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/relocate-modules.patch          |  8 ++++----
 .../recipes-core/glib-2.0/files/skip-timeout.patch |  2 +-
 ...nitial_2.82.4.bb => glib-2.0-initial_2.84.0.bb} |  0
 .../{glib-2.0_2.82.4.bb => glib-2.0_2.84.0.bb}     |  0
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 13 files changed, 29 insertions(+), 29 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.4.bb => glib-2.0-initial_2.84.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.4.bb => glib-2.0_2.84.0.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 4ef03f3157..17d66b2672 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 7e00964de0ae27f868726413e46f27145807a50d Mon Sep 17 00:00:00 2001
+From cb45b7e14e613f99cae1a30bbd4e417d716e1cbf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 76d67cd..0584ff5 100644
+index 5d91b89..1a8da12 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -885,17 +885,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+@@ -901,17 +901,18 @@ libgio_dep = declare_dependency(link_with : libgio,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -43,13 +43,13 @@ index 76d67cd..0584ff5 100644
 +    'gresource=gresource',
 +    'gsettings=gsettings',
    ],
-   version : glib_version,
-   install_dir : glib_pkgconfigreldir,
+   uninstalled_variables : [
+     'gio=${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 9f1515b..a40e4f5 100644
+index 837960d..97d4af0 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -447,9 +447,10 @@ pkg.generate(libglib,
+@@ -443,9 +443,10 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index c1d55d87b6..0f42a0f262 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 979d3ddf77abfd00c1e2108cde4aef2d015257b0 Mon Sep 17 00:00:00 2001
+From f5a9a0b4615895fe6ae51e066c649f8bfd281461 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 9599156eaf..fb7015719a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 54f9e7fcbd6345846c379a47c20245259a83d42a Mon Sep 17 00:00:00 2001
+From 7381b5263d0b33c2672ad44e974aebc515aecd57 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 1c9a369..76d67cd 100644
+index 854b95a..5d91b89 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1009,6 +1009,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1038,6 +1038,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index e4c193cfbb..febfa287f5 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 1300572dfc8e488a3edaed8cb1f22fcf2303e452 Mon Sep 17 00:00:00 2001
+From f8c049174b8b9dcd0b85e55cbce921b7d7fd4f23 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index 54b980b..be05894 100644
+index 81e675f..1a10a8d 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
 @@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index bf3fb93bea..61dabce4f0 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From ec777a7f17c28e72f7b0bdcec385656533c50cca Mon Sep 17 00:00:00 2001
+From 3fffeba5b79f3b66c23a30b9d1ee1d17a51dc18d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index f7dc039..f708876 100644
+index ee9cee4..ff844c1 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
-@@ -1068,7 +1068,7 @@ main (int   argc,
+@@ -1196,7 +1196,7 @@ main (int   argc,
    g_test_add_func ("/resource/automatic", test_resource_automatic);
    /* This only uses automatic resources too, so it tests the constructors and destructors */
    g_test_add_func ("/resource/module", test_resource_module);
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 9b26ea8e84..d42b23b9e8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 8b8953adcd0071c39a78e6d2fd437ad0e149591d Mon Sep 17 00:00:00 2001
+From a9d8a5ac826e161722400b9c45733a19b6797c13 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5beb14d..963815f 100644
+index ddd0998..6b99c04 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2050,7 +2050,7 @@ atomicdefine = '''
+@@ -2075,7 +2075,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 80f26b738a..98ebe6057d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 51d592900e8acdec4f043ceeb23e32d27dded8eb Mon Sep 17 00:00:00 2001
+From 911a790d606c3aec3ff2501c700e94a6032e9107 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 963815f..4d4a9f3 100644
+index 6b99c04..c208574 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1048,7 +1048,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8184c9636c..24b8c172c1 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From cc02206c156cb99c441e56a51639cd5ca64efae9 Mon Sep 17 00:00:00 2001
+From 03b71bd246fa183a41117cd818b5fbb88228a1cd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index f4bee2f02e..f430a7102b 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From afe2c1e5854102c0e75f9e70a6569c9f2b6360d8 Mon Sep 17 00:00:00 2001
+From 8d83a22c81b8bfff4a01393f8b8c3efc298c78de Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index aa6272f..26aebf7 100644
+index 76c2028..6deba7c 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1263,11 +1263,6 @@ get_gio_module_dir (void)
+@@ -1260,11 +1260,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index aa6272f..26aebf7 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1286,8 +1281,6 @@ get_gio_module_dir (void)
+@@ -1283,8 +1278,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index e5f09a4e2d..2189aa8e42 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 7cd21568601b78720f92955f1e794ca4f11c225d Mon Sep 17 00:00:00 2001
+From 4615f5afeb31e665fc33407488f250219ae54466 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9d50a95c40..8a51a91af4 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,7 +232,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709"
+SRC_URI[sha256sum] = "f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.44.1


--===============3313658229752894684==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-glib-2.0-initial-upgrade-2.82.4-2.84.0-2.82.patch"

RnJvbSA0YjViNDRjOTJiYzE5NmQ1YzQxMWNlNzlkNWY3ODZmYzU3NzQ0NGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDU6MjU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMCxnbGliLTIuMC1pbml0aWFsOiB1cGdyYWRlIDIuODIuNCAtPiAyLjg0LjAsMi44Mi40
IC0+CiAyLjg0LjAKCi0tLQogLi4uRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWct
ZmlsZXMucGF0Y2ggfCAxNCArKysrKysrLS0tLS0tLQogLi4uLzAwMDEtRml4LURBVEFESVJOQU1F
LW9uLXVjbGliYy1MaW51eC5wYXRjaCAgICAgfCAgMiArLQogLi4uc3RhbGwtZ2lvLXF1ZXJ5bW9k
dWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggfCAgNiArKystLS0KIC4uLndhcm5pbmctYWJv
dXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDQgKystLQogLi4uZXNvdXJj
ZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggfCAgNiArKystLS0KIC4u
LjEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoIHwgIDYgKysr
LS0tCiAuLi4tZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCB8
ICA2ICsrKy0tLQogLi4udC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMu
cGF0Y2ggfCAgMiArLQogLi4uL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gg
ICAgICAgICAgfCAgOCArKysrLS0tLQogLi4uL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9z
a2lwLXRpbWVvdXQucGF0Y2ggfCAgMiArLQogLi4ubml0aWFsXzIuODIuNC5iYiA9PiBnbGliLTIu
MC1pbml0aWFsXzIuODQuMC5iYn0gfCAgMAogLi4uL3tnbGliLTIuMF8yLjgyLjQuYmIgPT4gZ2xp
Yi0yLjBfMi44NC4wLmJifSAgICAgfCAgMAogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi5pbmMgICAgICAgICAgICAgICAgfCAgMiArLQogMTMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAve2dsaWItMi4wLWluaXRpYWxfMi44Mi40LmJiID0+IGdsaWItMi4wLWluaXRpYWxfMi44NC4w
LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBf
Mi44Mi40LmJiID0+IGdsaWItMi4wXzIuODQuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWlu
dG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gK
aW5kZXggNGVmMDNmMzE1Ny4uMTdkNjZiMjY3MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZp
Zy1maWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA3ZTAwOTY0ZGUwYWUyN2Y4Njg3MjY0MTNlNDZmMjcxNDU4MDdhNTBkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjYjQ1YjdlMTRlNjEzZjk5Y2FlMWEzMGJiZDRl
NDE3ZDcxNmUxY2JmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDE1IEZlYiAyMDE5IDEx
OjE3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBwcmVmaXggZXhlY3V0YWJsZXMg
d2l0aCAkYmluZGlyIGluIHBrZy1jb25maWcgZmlsZXMKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAy
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvZ2lvL21lc29uLmJ1aWxkIGIvZ2lvL21lc29uLmJ1aWxkCi1pbmRleCA3NmQ2N2Nk
Li4wNTg0ZmY1IDEwMDY0NAoraW5kZXggNWQ5MWI4OS4uMWE4ZGExMiAxMDA2NDQKIC0tLSBhL2dp
by9tZXNvbi5idWlsZAogKysrIGIvZ2lvL21lc29uLmJ1aWxkCi1AQCAtODg1LDE3ICs4ODUsMTgg
QEAgbGliZ2lvX2RlcCA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX3dpdGggOiBsaWJnaW8sCitA
QCAtOTAxLDE3ICs5MDEsMTggQEAgbGliZ2lvX2RlcCA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5r
X3dpdGggOiBsaWJnaW8sCiAgcGtnLmdlbmVyYXRlKGxpYmdpbywKICAgIHJlcXVpcmVzIDogWydn
bGliLTIuMCcsICdnb2JqZWN0LTIuMCddLAogICAgdmFyaWFibGVzIDogWwpAQCAtNDMsMTMgKzQz
LDEzIEBAIGluZGV4IDc2ZDY3Y2QuLjA1ODRmZjUgMTAwNjQ0CiArICAgICdncmVzb3VyY2U9Z3Jl
c291cmNlJywKICsgICAgJ2dzZXR0aW5ncz1nc2V0dGluZ3MnLAogICAgXSwKLSAgIHZlcnNpb24g
OiBnbGliX3ZlcnNpb24sCi0gICBpbnN0YWxsX2RpciA6IGdsaWJfcGtnY29uZmlncmVsZGlyLAor
ICAgdW5pbnN0YWxsZWRfdmFyaWFibGVzIDogWworICAgICAnZ2lvPSR7cHJlZml4fS9naW8vZ2lv
JywKIGRpZmYgLS1naXQgYS9nbGliL21lc29uLmJ1aWxkIGIvZ2xpYi9tZXNvbi5idWlsZAotaW5k
ZXggOWYxNTE1Yi4uYTQwZTRmNSAxMDA2NDQKK2luZGV4IDgzNzk2MGQuLjk3ZDRhZjAgMTAwNjQ0
CiAtLS0gYS9nbGliL21lc29uLmJ1aWxkCiArKysgYi9nbGliL21lc29uLmJ1aWxkCi1AQCAtNDQ3
LDkgKzQ0NywxMCBAQCBwa2cuZ2VuZXJhdGUobGliZ2xpYiwKK0BAIC00NDMsOSArNDQzLDEwIEBA
IHBrZy5nZW5lcmF0ZShsaWJnbGliLAogICAgc3ViZGlycyA6IFsnZ2xpYi0yLjAnXSwKICAgIGV4
dHJhX2NmbGFncyA6IFsnLUkke2xpYmRpcn0vZ2xpYi0yLjAvaW5jbHVkZSddICsgd2luMzJfY2Zs
YWdzLAogICAgdmFyaWFibGVzIDogWwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24t
dWNsaWJjLUxpbnV4LnBhdGNoCmluZGV4IGMxZDU1ZDg3YjYuLjBmNDJhMGYyNjIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1F
LW9uLXVjbGliYy1MaW51eC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDk3OWQzZGRmNzdhYmZkMDBjMWUyMTA4Y2RlNGFlZjJkMDE1MjU3YjAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY1YTlhMGI0NjE1ODk1ZmU2YWU1MWUwNjZjNjQ5
ZjhiZmQyODE0NjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxNSBNYXIgMjAxNCAyMjo0MjoyOSAtMDcwMAog
U3ViamVjdDogW1BBVENIXSBGaXggREFUQURJUk5BTUUgb24gdWNsaWJjL0xpbnV4CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1
ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BS
T0dSQU0ucGF0Y2gKaW5kZXggOTU5OTE1NmVhZi4uZmI3MDE1NzE5YSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVs
ZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JB
TS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTRmOWU3ZmNiZDYzNDU4NDZjMzc5YTQ3YzIw
MjQ1MjU5YTgzZDQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzM4MWI1MjYzZDBi
MzNjMjY3MmFkNDRlOTc0YWViYzUxNWFlY2Q1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUs
IDIyIE1hciAyMDE2IDE1OjE0OjU4ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEluc3RhbGwgZ2lv
LXF1ZXJ5bW9kdWxlcyBhcyBsaWJleGVjX1BST0dSQU0KQEAgLTEzLDEwICsxMywxMCBAQCBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljXQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL21lc29uLmJ1aWxkIGIvZ2lvL21l
c29uLmJ1aWxkCi1pbmRleCAxYzlhMzY5Li43NmQ2N2NkIDEwMDY0NAoraW5kZXggODU0Yjk1YS4u
NWQ5MWI4OSAxMDA2NDQKIC0tLSBhL2dpby9tZXNvbi5idWlsZAogKysrIGIvZ2lvL21lc29uLmJ1
aWxkCi1AQCAtMTAwOSw2ICsxMDA5LDcgQEAgZ2lvX3F1ZXJ5bW9kdWxlcyA9IGV4ZWN1dGFibGUo
J2dpby1xdWVyeW1vZHVsZXMnLCAnZ2lvLXF1ZXJ5bW9kdWxlcy5jJywgJ2dpb21vZHUKK0BAIC0x
MDM4LDYgKzEwMzgsNyBAQCBnaW9fcXVlcnltb2R1bGVzID0gZXhlY3V0YWJsZSgnZ2lvLXF1ZXJ5
bW9kdWxlcycsICdnaW8tcXVlcnltb2R1bGVzLmMnLCAnZ2lvbW9kdQogICAgY19hcmdzIDogZ2lv
X2NfYXJncywKICAgICMgaW50bC5saWIgaXMgbm90IGNvbXBhdGlibGUgd2l0aCBTQUZFU0VICiAg
ICBsaW5rX2FyZ3MgOiBub3NlaF9saW5rX2FyZ3MsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNh
dGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNj
aGVtYXMucGF0Y2gKaW5kZXggZTRjMTkzY2ZiYi4uZmViZmEyODdmNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJv
dXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0
ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTMwMDU3MmRm
YzhlNDg4YTNlZGFlZDhjYjFmMjJmY2YyMzAzZTQ1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZjhjMDQ5MTc0YjhiOWRjZDBiODVlNTVjYmNlOTIxYjdkN2ZkNGYyMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogRnJpLCAxMiBKdW4gMjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDog
W1BBVENIXSBSZW1vdmUgdGhlIHdhcm5pbmcgYWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hl
bWFzCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL2dpby9nbGliLWNvbXBpbGUtc2NoZW1hcy5jIGIvZ2lvL2dsaWItY29t
cGlsZS1zY2hlbWFzLmMKLWluZGV4IDU0Yjk4MGIuLmJlMDU4OTQgMTAwNjQ0CitpbmRleCA4MWU2
NzVmLi4xYTEwYThkIDEwMDY0NAogLS0tIGEvZ2lvL2dsaWItY29tcGlsZS1zY2hlbWFzLmMKICsr
KyBiL2dpby9nbGliLWNvbXBpbGUtc2NoZW1hcy5jCiBAQCAtMTIzMiwxOSArMTIzMiw2IEBAIHBh
cnNlX3N0YXRlX3N0YXJ0X3NjaGVtYSAoUGFyc2VTdGF0ZSAgKnN0YXRlLApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2Vz
LmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQt
YS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCmluZGV4IGJmM2ZiOTNiZWEuLjYxZGFiY2U0ZjAgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3Rz
LXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMu
Yy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGVjNzc3YTdmMTdjMjhlNzJmN2IwYmRjZWMzODU2NTY1MzNjNTBjY2EgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDNmZmZlYmE1Yjc5ZjNiNjZjMjNhMzBiOWQxZWUxZDE3YTUxZGMx
OGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoyMjo0NiArMDEw
MAogU3ViamVjdDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1lbnQgb3V0IGEg
YnVpbGQgaG9zdC1vbmx5IHRlc3QKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2dpby90ZXN0
cy9yZXNvdXJjZXMuYyBiL2dpby90ZXN0cy9yZXNvdXJjZXMuYwotaW5kZXggZjdkYzAzOS4uZjcw
ODg3NiAxMDA2NDQKK2luZGV4IGVlOWNlZTQuLmZmODQ0YzEgMTAwNjQ0CiAtLS0gYS9naW8vdGVz
dHMvcmVzb3VyY2VzLmMKICsrKyBiL2dpby90ZXN0cy9yZXNvdXJjZXMuYwotQEAgLTEwNjgsNyAr
MTA2OCw3IEBAIG1haW4gKGludCAgIGFyZ2MsCitAQCAtMTE5Niw3ICsxMTk2LDcgQEAgbWFpbiAo
aW50ICAgYXJnYywKICAgIGdfdGVzdF9hZGRfZnVuYyAoIi9yZXNvdXJjZS9hdXRvbWF0aWMiLCB0
ZXN0X3Jlc291cmNlX2F1dG9tYXRpYyk7CiAgICAvKiBUaGlzIG9ubHkgdXNlcyBhdXRvbWF0aWMg
cmVzb3VyY2VzIHRvbywgc28gaXQgdGVzdHMgdGhlIGNvbnN0cnVjdG9ycyBhbmQgZGVzdHJ1Y3Rv
cnMgKi8KICAgIGdfdGVzdF9hZGRfZnVuYyAoIi9yZXNvdXJjZS9tb2R1bGUiLCB0ZXN0X3Jlc291
cmNlX21vZHVsZSk7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVz
dC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmluZGV4IDliMjZlYThlODQuLmQ0MmIyM2I5ZTggMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVu
LWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1h
cy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Yjg5NTNhZGNkMDA3MWMzOWE3OGU2
ZDJmZDQzN2FkMGUxNDk1OTFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhOWQ4YTVh
YzgyNmUxNjE3MjI0MDBiOWM0NTczM2ExOWI2Nzk3YzEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTIgT2N0
IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb246IFJ1biBhdG9taWNz
IHRlc3Qgb24gY2xhbmcgYXMgd2VsbApAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkCi1pbmRleCA1YmViMTRkLi45NjM4MTVmIDEwMDY0NAoraW5kZXggZGRkMDk5OC4uNmI5
OWMwNCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTIw
NTAsNyArMjA1MCw3IEBAIGF0b21pY2RlZmluZSA9ICcnJworQEAgLTIwNzUsNyArMjA3NSw3IEBA
IGF0b21pY2RlZmluZSA9ICcnJwogICMgV2Uga25vdyB0aGF0IHdlIGNhbiBhbHdheXMgdXNlIHJl
YWwgKCJsb2NrIGZyZWUiKSBhdG9taWMgb3BlcmF0aW9ucyB3aXRoIE1TVkMKICBpZiBjYy5nZXRf
aWQoKSA9PSAnbXN2Yycgb3IgY2MuZ2V0X2lkKCkgPT0gJ2NsYW5nLWNsJyBvciBjYy5saW5rcyhh
dG9taWN0ZXN0LCBuYW1lIDogJ2F0b21pYyBvcHMnKQogICAgaGF2ZV9hdG9taWNfbG9ja19mcmVl
ID0gdHJ1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1k
by1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCmluZGV4IDgwZjI2
YjczOGEuLjk4ZWJlNjA1N2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1u
YXRpdmUtZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUxZDU5MjkwMGU4YWNkZWM0ZjA0M2NlZWIyM2UzMmQy
N2RkZWQ4ZWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkxMWE3OTBkNjA2YzNhZWMz
ZmYyNTAxYzcwMGU5NGE2MDMyZTkxMDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU2F0LCAxNiBTZXAg
MjAyMyAyMjoyODoyNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogZG8gbm90
IGVuYWJsZSBwaWRmZCBmZWF0dXJlcyBvbiBuYXRpdmUgZ2xpYgpAQCAtMTQsMTAgKzE0LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOTYzODE1Zi4uNGQ0YTlmMyAx
MDA2NDQKK2luZGV4IDZiOTljMDQuLmMyMDg1NzQgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAog
KysrIGIvbWVzb24uYnVpbGQKLUBAIC0xMDQ4LDcgKzEwNDgsOCBAQCBpZiBjYy5saW5rcygnJycj
aW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KK0BAIC0xMDczLDcgKzEwNzMsOCBAQCBpZiBjYy5saW5r
cygnJycjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KICAgICAgICAgICAgICAgICAgIHdhaXRpZCAo
UF9QSURGRCwgMCwgJmNoaWxkX2luZm8sIFdFWElURUQgfCBXTk9IQU5HKTsKICAgICAgICAgICAg
ICAgICAgIHJldHVybiAwOwogICAgICAgICAgICAgICAgIH0nJycsIG5hbWUgOiAncGlkZmRfb3Bl
bigyKSBzeXN0ZW0gY2FsbCcpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9v
bHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1o
YXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKaW5kZXggODE4NGM5
NjM2Yy4uMjRiOGMxNzJjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90
LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gY2MwMjIwNmMxNTZjYjk5YzQ0MWU1NmE1MTYzOWNkNWNhNjRlZmFlOSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDNiNzFiZDI0NmZhMTgzYTQxMTE3Y2Q4MThiNWZi
Yjg4MjI4YTFjZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAzIE9jdCAyMDE3IDEwOjQ1
OjU1ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSBweXRob24gcGF0aCBp
bnRvIHZhcmlvdXMgdG9vbHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IGY0YmVlMmYwMmUuLmY0MzBhNzEw
MmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRl
LW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVs
b2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWZlMmMxZTU4NTQxMDJj
MGU3NWY5ZTcwYTY1NjljOWYyYjYzNjBkOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
OGQ4M2EyMmM4MWI4YmZmZjRhMDEzOTNmOGI4YzNlZmMyOThjNzhkZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRl
OiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdsaWIt
Mi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJlY3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMK
QEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKdXNzaSBLdWtrb25lbiA8anVzc2ku
a3Vra29uZW5AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvZ2lvL2dpb21vZHVsZS5jIGIvZ2lvL2dpb21vZHVsZS5jCi1pbmRleCBhYTYy
NzJmLi4yNmFlYmY3IDEwMDY0NAoraW5kZXggNzZjMjAyOC4uNmRlYmE3YyAxMDA2NDQKIC0tLSBh
L2dpby9naW9tb2R1bGUuYwogKysrIGIvZ2lvL2dpb21vZHVsZS5jCi1AQCAtMTI2MywxMSArMTI2
Myw2IEBAIGdldF9naW9fbW9kdWxlX2RpciAodm9pZCkKK0BAIC0xMjYwLDExICsxMjYwLDYgQEAg
Z2V0X2dpb19tb2R1bGVfZGlyICh2b2lkKQogICAgICAgIGdfZnJlZSAoaW5zdGFsbF9kaXIpOwog
ICNlbHNlCiAgICAgICAgbW9kdWxlX2RpciA9IGdfc3RyZHVwIChHSU9fTU9EVUxFX0RJUik7CkBA
IC0zMyw3ICszMyw3IEBAIGluZGV4IGFhNjI3MmYuLjI2YWViZjcgMTAwNjQ0CiAgI2luY2x1ZGUg
PGRsZmNuLmg+CiAgICAgICAgewogICAgICAgICAgZ19hdXRvZnJlZSBnY2hhciAqcGF0aCA9IE5V
TEw7Ci1AQCAtMTI4Niw4ICsxMjgxLDYgQEAgZ2V0X2dpb19tb2R1bGVfZGlyICh2b2lkKQorQEAg
LTEyODMsOCArMTI3OCw2IEBAIGdldF9naW9fbW9kdWxlX2RpciAodm9pZCkKICAgICAgICAgICAg
ICAgIH0KICAgICAgICAgICAgfQogICAgICAgIH0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAppbmRleCBlNWYwOWE0ZTJkLi4yMTg5
YWE4ZTQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lw
LXRpbWVvdXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tp
cC10aW1lb3V0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3Y2QyMTU2ODYwMWI3ODcyMGY5
Mjk1NWYxZTc5NGNhNGYxMWMyMjVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NjE1
ZjVhZmViMzFlNjY1ZmMzMzQwNzQ4OGYyNTAyMTlhZTU0NDY2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUaHUs
IDI4IE1hciAyMDI0IDE2OjI3OjA5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgL3RpbWVv
dXQvcm91bmRpbmcgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAtaW5pdGlhbF8yLjgyLjQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMC1pbml0aWFsXzIuODQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjgyLjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44
NC4wLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8y
LjgyLjQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg0LjAuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wXzIuODIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZ2xpYi0yLjBfMi44NC4wLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCmluZGV4
IDlkNTBhOTVjNDAuLjhhNTFhOTFhZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5j
CkBAIC0yMzIsNyArMjMyLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxl
Oi8vcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMt
b24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMzdkZDA4NzdmZTk2NGNkMTVlOWEyNzEwYjA0NGExODMwZmIx
YmQ5MzY1MmE2ZDBjYjZiOGIyZGZmMTg3YzcwOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmODgy
MzYwMGNiODU0MjVlMjgxNWNmYWQ4MmVhMjBmZGFhNTM4NDgyYWI3NGU3MjkzZDU4YjNmNjRhNWFm
ZjZhIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVzIGluIEZJTEVTUEFUSCB0aGF0IGFy
ZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQgKHVzaW5nIHNpdGVpbmZvKSBhbmQg
YWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuNDQuMQoK

--===============3313658229752894684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 9389328 to 9392616 (+0%)
packages/core2-64-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGSIZE changed from 327280 to 327696 (+0%)
Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGSIZE changed from 346987 to 347564 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgthread-2.0.so.0.8200.4 /usr/lib/.debug/libgmodule-2.0.so.0.8200.4 /usr/lib/.debug/libgirepository-2.0.so.0.8200.4 /usr/lib/.debug/libgio-2.0.so.0.8200.4 /usr/lib/.debug/libglib-2.0.so.0.8200.4 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.8200.4 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py", added "/usr/libexec/installed-tests/glib/.debug/testing-nonfatal /usr/lib/.debug/libgmodule-2.0.so.0.8400.0 /usr/lib/.debug/libgthread-2.0.so.0.8400.0 /usr/lib/.debug/libgirepository-2.0.so.0.8400.0 /usr/lib/.debug/libglib-2.0.so.0.8400.0 /usr/libexec/installed-tests/glib/.debug/callable-info /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.0-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.8400.0 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8400.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 31965874 to 32288762 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 14884407 to 15077216 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGSIZE changed from 183853 to 184521 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGSIZE changed from 146652 to 146650 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGSIZE changed from 140482 to 140539 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGSIZE changed from 144654 to 143935 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGSIZE changed from 132500 to 132502 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGSIZE changed from 166839 to 167281 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGSIZE changed from 143640 to 144076 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGSIZE changed from 144991 to 145455 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGSIZE changed from 135458 to 136290 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGSIZE changed from 220082 to 220893 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGSIZE changed from 150245 to 149788 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGSIZE changed from 138033 to 138448 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGSIZE changed from 145509 to 145982 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 141307 to 141742 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGSIZE changed from 141467 to 141896 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGSIZE changed from 138125 to 138550 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGSIZE changed from 137222 to 137658 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGSIZE changed from 183618 to 183054 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGSIZE changed from 127983 to 128373 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: FILELIST: removed "/usr/libexec/installed-tests/glib/services/org.freedesktop.portal.Documents.service", added "/usr/libexec/installed-tests/glib/glibconfig.py /usr/libexec/installed-tests/glib/callable-info /usr/libexec/installed-tests/glib/testing-nonfatal /usr/share/installed-tests/glib/gi-compile-repository.py.test /usr/libexec/installed-tests/glib/testprogramrunner.py /usr/libexec/installed-tests/glib/gi-compile-repository.py /usr/share/installed-tests/glib/callable-info.test /usr/libexec/installed-tests/glib/gi-inspect-typelib.py /usr/share/installed-tests/glib/gi-inspect-typelib.py.test /usr/share/installed-tests/glib/testing-nonfatal.test"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 11788363 to 12017341 (+2%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.82.4/glib/libcharset -> /usr/src/debug/glib-2.0/2.84.0/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.82.4/girepository -> /usr/src/debug/glib-2.0/2.84.0/girepository, directory renamed /usr/src/debug/glib-2.0/2.82.4/gobject -> /usr/src/debug/glib-2.0/2.84.0/gobject, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio/tests -> /usr/src/debug/glib-2.0/2.84.0/gio/tests, directory renamed /usr/src/debug/glib-2.0/2.82.4/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.84.0/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.82.4/girepository/decompiler -> /usr/src/debug/glib-2.0/2.84.0/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.82.4/girepository/cmph -> /usr/src/debug/glib-2.0/2.84.0/girepository/cmph, directory renamed /usr/src/debug/glib-2.0/2.82.4/girepository/compiler -> /usr/src/debug/glib-2.0/2.84.0/girepository/compiler
 , directory renamed /usr/src/debug/glib-2.0/2.82.4/gobject/tests -> /usr/src/debug/glib-2.0/2.84.0/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.82.4/glib/deprecated -> /usr/src/debug/glib-2.0/2.84.0/glib/deprecated, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio/inotify -> /usr/src/debug/glib-2.0/2.84.0/gio/inotify, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio -> /usr/src/debug/glib-2.0/2.84.0/gio, directory renamed /usr/src/debug/glib-2.0/2.82.4/gmodule -> /usr/src/debug/glib-2.0/2.84.0/gmodule, directory renamed /usr/src/debug/glib-2.0/2.82.4/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.84.0/glib/tests/path-test-subdir, directory renamed /usr/src/debug/glib-2.0/2.82.4/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.84.0/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.82.4/gthread -> /usr/src/debug/glib-2.0/2.84.0/gthread, directory renamed /usr/src/debug/glib-2.0/2.82.4/girepository/inspector -> /usr/src/debug/g
 lib-2.0/2.84.0/girepository/inspector, directory renamed /usr/src/debug/glib-2.0/2.82.4/gmodule/tests -> /usr/src/debug/glib-2.0/2.84.0/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.84.0/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio/xdgmime -> /usr/src/debug/glib-2.0/2.84.0/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.82.4/gio/tests/modules -> /usr/src/debug/glib-2.0/2.84.0/gio/tests/modules, directory renamed /usr/src/debug/glib-2.0/2.82.4/gthread/tests -> /usr/src/debug/glib-2.0/2.84.0/gthread/tests, removed "/usr/src/debug/glib-2.0/2.82.4/glib/goption.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/sort.c /usr/src/debug/glib-2.0/2.82.4/glib/goption.h /usr/src/debug/glib-2.0/2.82.4/glib/gunicollate.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/utils-isolated.c /usr/src/debug/glib-2.0/2.82.4/glib/gunicode.h /usr/src/debug/glib-2.0/2.82.4/glib/te
 sts/markup-subparser.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/hmac.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/environment.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/refstring.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/1bit-mutex.c /usr/src/debug/glib-2.0/2.82.4/glib/gmain-internal.h /usr/src/debug/glib-2.0/2.82.4/glib/gqsort.c /usr/src/debug/glib-2.0/2.82.4/glib/gqsort.h /usr/src/debug/glib-2.0/2.82.4/glib/gmappedfile.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/uri.c /usr/src/debug/glib-2.0/2.82.4/glib/gmappedfile.c /usr/src/debug/glib-2.0/2.82.4/glib/gmirroringtable.h /usr/src/debug/glib-2.0/2.82.4/glib/gfileutils.h /usr/src/debug/glib-2.0/2.82.4/glib/gfileutils.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/messages-low-memory.c /usr/src/debug/glib-2.0/2.82.4/glib/gdatetime.h /usr/src/debug/glib-2.0/2.82.4/glib/ghash.h /usr/src/debug/glib-2.0/2.82.4/glib/ghash.c /usr/src/debug/glib-2.0/2.82.4/glib/gdatetime.c /usr/src/debug/glib-2.0/2.82.4/glib/gtrashstack.c /usr/src/debug/glib
 -2.0/2.82.4/glib/tests/mem-overflow.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/bookmarkfile.c /usr/src/debug/glib-2.0/2.82.4/glib/gtrashstack.h /usr/src/debug/glib-2.0/2.82.4/glib/garray.h /usr/src/debug/glib-2.0/2.82.4/glib/garray.c /usr/src/debug/glib-2.0/2.82.4/glib/gstrfuncs.c /usr/src/debug/glib-2.0/2.82.4/glib/gstrfuncs.h /usr/src/debug/glib-2.0/2.82.4/glib/grcboxprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/protocol.c /usr/src/debug/glib-2.0/2.82.4/glib/gtranslit.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/relation.c /usr/src/debug/glib-2.0/2.82.4/glib/gbacktrace.c /usr/src/debug/glib-2.0/2.82.4/glib/glibconfig.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/io-channel.c /usr/src/debug/glib-2.0/2.82.4/glib/gthread.h /usr/src/debug/glib-2.0/2.82.4/glib/gshell.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/markup-escape.c /usr/src/debug/glib-2.0/2.82.4/glib/gthread.c /usr/src/debug/glib-2.0/2.82.4/glib/gshell.c /usr/src/debug/glib-2.0/2.82.4/glib/gstdio.h /usr/src/debug/glib-2.
 0/2.82.4/glib/gstdio.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/rand.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/test-printf.c /usr/src/debug/glib-2.0/2.82.4/glib/guriprivate.h /usr/src/debug/glib-2.0/2.82.4/girepository/tests/cmph-bdz.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/memchunk.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-test-helper.c /usr/src/debug/glib-2.0/2.82.4/glib/gdatetime-private.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/onceinit.c /usr/src/debug/glib-2.0/2.82.4/glib/gdatetime-private.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/search-utils.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/repository.c /usr/src/debug/glib-2.0/2.82.4/glib/gutf8.c /usr/src/debug/glib-2.0/2.82.4/glib/gasyncqueueprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/glibintl.h /usr/src/debug/glib-2.0/2.82.4/glib/gmarkup.c /usr/src/debug/glib-2.0/2.82.4/glib/gmarkup.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/gutils-user-database.c /usr/src/debug/glib-2.0/2.82.4/glib/gunibreak.h /usr/
 src/debug/glib-2.0/2.82.4/glib/gunibreak.c /usr/src/debug/glib-2.0/2.82.4/glib/gspawn-private.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/charset.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/convert.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/dataset.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/timeout.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/registered-type-info.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/utf8-pointer.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/object-info.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/struct-info.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/thread-pool.c /usr/src/debug/glib-2.0/2.82.4/glib/gcharset.h /usr/src/debug/glib-2.0/2.82.4/glib/gprimes.h /usr/src/debug/glib-2.0/2.82.4/glib/gchecksum.c /usr/src/debug/glib-2.0/2.82.4/glib/gvarianttypeinfo.c /usr/src/debug/glib-2.0/2.82.4/glib/gcharset.c /usr/src/debug/glib-2.0/2.82.4/glib/gchecksum.h /usr/src/debug/glib-2.0/2.82.4/glib/gprimes.c /usr/src/debug/glib-2.0/2.82.4/glib/gvaria
 nttypeinfo.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/array-test.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-test.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/pattern.c /usr/src/debug/glib-2.0/2.82.4/glib/gtimer.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/scannerapi.c /usr/src/debug/glib-2.0/2.82.4/glib/gtimer.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/dir.c /usr/src/debug/glib-2.0/2.82.4/glib/guniprop.c /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-core.h /usr/src/debug/glib-2.0/2.82.4/glib/gregex.c /usr/src/debug/glib-2.0/2.82.4/glib/gregex.h /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-core.c /usr/src/debug/glib-2.0/2.82.4/glib/gasyncqueue.c /usr/src/debug/glib-2.0/2.82.4/glib/gasyncqueue.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/hook.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/function-info.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-singlethread.c /usr/src/debug/glib-2.0/2.82.4/glib/grand.h /usr/src/debug/glib-2.0/2.82.4/glib/guuid.h /usr/src/debug/glib-2.
 0/2.82.4/glib/grand.c /usr/src/debug/glib-2.0/2.82.4/glib/guuid.c /usr/src/debug/glib-2.0/2.82.4/glib/glist.h /usr/src/debug/glib-2.0/2.82.4/glib/glist.c /usr/src/debug/glib-2.0/2.82.4/glib/gcharsetprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/gunicodeprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-path-search-helper.c /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-internal.h /usr/src/debug/glib-2.0/2.82.4/girepository/tests/union-info.c /usr/src/debug/glib-2.0/2.82.4/glib/gdir.h /usr/src/debug/glib-2.0/2.82.4/glib/gmem.h /usr/src/debug/glib-2.0/2.82.4/glib/guri.h /usr/src/debug/glib-2.0/2.82.4/glib/gdir.c /usr/src/debug/glib-2.0/2.82.4/glib/gmem.c /usr/src/debug/glib-2.0/2.82.4/glib/guri.c /usr/src/debug/glib-2.0/2.82.4/glib/gjournal-private.c /usr/src/debug/glib-2.0/2.82.4/glib/gwakeup.c /usr/src/debug/glib-2.0/2.82.4/glib/gmain.c /usr/src/debug/glib-2.0/2.82.4/glib/gmain.h /usr/src/debug/glib-2.0/2.82.4/glib/gwakeup.h /usr/src/debug/glib-2.0/2.82.4/glib/gjournal-private.h
  /usr/src/debug/glib-2.0/2.82.4/glib/gpoll.c /usr/src/debug/glib-2.0/2.82.4/glib/gpoll.h /usr/src/debug/glib-2.0/2.82.4/glib/gstring.h /usr/src/debug/glib-2.0/2.82.4/glib/gqueue.h /usr/src/debug/glib-2.0/2.82.4/glib/gqueue.c /usr/src/debug/glib-2.0/2.82.4/glib/gstring.c /usr/src/debug/glib-2.0/2.82.4/glib/gconvertprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/utf8-performance.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/fileutils.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/hostutils.c /usr/src/debug/glib-2.0/2.82.4/glib/gthreadpool.c /usr/src/debug/glib-2.0/2.82.4/glib/gthreadpool.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/testutils.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/testing-helper.c /usr/src/debug/glib-2.0/2.82.4/glib/gkeyfile.h /usr/src/debug/glib-2.0/2.82.4/glib/gkeyfile.c /usr/src/debug/glib-2.0/2.82.4/glib/grefcount.c /usr/src/debug/glib-2.0/2.82.4/glib/gdatasetprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/grefcount.h /usr/src/debug/glib-2.0/2.82.4/glib/gconvert.c
  /usr/src/debug/glib-2.0/2.82.4/glib/gconvert.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/asyncqueue.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/bytes.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/cache.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/guuid.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/mutex.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/queue.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/rcbox.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/regex.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/shell.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/slice.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/slist.c /usr/src/debug/glib-2.0/2.82.4/glib/gversion.h /usr/src/debug/glib-2.0/2.82.4/glib/gversion.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/date.c /usr/src/debug/glib-2.0/2.82.4/glib/ghostutils.h /usr/src/debug/glib-2.0/2.82.4/glib/gpattern.h /usr/src/debug/glib-2.0/2.82.4/glib/gtestutils.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/tree.c /usr/src/debug/glib-2.0/2.82.4/glib/ghostutils.c /usr/src
 /debug/glib-2.0/2.82.4/glib/gpattern.c /usr/src/debug/glib-2.0/2.82.4/glib/gtestutils.c /usr/src/debug/glib-2.0/2.82.4/glib/gtranslit-data.h /usr/src/debug/glib-2.0/2.82.4/girepository/tests/test-common.c /usr/src/debug/glib-2.0/2.82.4/glib/gmessages.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/642026.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/atomic.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/test-common.h /usr/src/debug/glib-2.0/2.82.4/glib/gmessages.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/base64.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/macros.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/markup.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/rwlock.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/string.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/thread.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/timer.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/types.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/utils.c /usr/src/debug/glib-2.0/2.82.4/glib/gtester.c /usr/src/debug/glib-2.0/2.82
 .4/glib/gprintf.h /usr/src/debug/glib-2.0/2.82.4/glib/gprintf.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/node.c /usr/src/debug/glib-2.0/2.82.4/glib/gsequence.h /usr/src/debug/glib-2.0/2.82.4/glib/gsequence.c /usr/src/debug/glib-2.0/2.82.4/glib/gunichartables.h /usr/src/debug/glib-2.0/2.82.4/glib/gutilsprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/valgrind.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/markup-collect.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/option-context.c /usr/src/debug/glib-2.0/2.82.4/glib/ggettext.c /usr/src/debug/glib-2.0/2.82.4/glib/ggettext.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/overflow.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/completion.c /usr/src/debug/glib-2.0/2.82.4/glib/gerror.h /usr/src/debug/glib-2.0/2.82.4/glib/glib-private.c /usr/src/debug/glib-2.0/2.82.4/glib/gerror.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/checksum.c /usr/src/debug/glib-2.0/2.82.4/glib/glib-private.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/mappedfile.c /usr/src/debug/g
 lib-2.0/2.82.4/glib/gstrvbuilder.c /usr/src/debug/glib-2.0/2.82.4/glib/gstrvbuilder.h /usr/src/debug/glib-2.0/2.82.4/glib/giounix.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/getpwuid-preload.c /usr/src/debug/glib-2.0/2.82.4/glib/grcbox.c /usr/src/debug/glib-2.0/2.82.4/glib/grcbox.h /usr/src/debug/glib-2.0/2.82.4/girepository/tests/repository-search-paths.c /usr/src/debug/glib-2.0/2.82.4/glib/gthreadprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-path-search.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/pathbuf.c /usr/src/debug/glib-2.0/2.82.4/glib/gstringchunk.c /usr/src/debug/glib-2.0/2.82.4/glib/gscanner.c /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-parser.c /usr/src/debug/glib-2.0/2.82.4/glib/gstringchunk.h /usr/src/debug/glib-2.0/2.82.4/glib/gscanner.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/spawn-multithreaded.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/test-spawn-echo.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/rec-mutex.c /usr/src/debug/glib-2.0/2.82.4/glib/gunicom
 p.h /usr/src/debug/glib-2.0/2.82.4/glib/gspawn-posix.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/gvariant.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/refcount.c /usr/src/debug/glib-2.0/2.82.4/glib/gutils.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/markup-parse.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/once.c /usr/src/debug/glib-2.0/2.82.4/glib/gutils.c /usr/src/debug/glib-2.0/2.82.4/glib/gatomic.h /usr/src/debug/glib-2.0/2.82.4/glib/giochannel.h /usr/src/debug/glib-2.0/2.82.4/glib/giochannel.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/thread-pool-slow.c /usr/src/debug/glib-2.0/2.82.4/glib/gatomic.c /usr/src/debug/glib-2.0/2.82.4/glib/gbookmarkfile.c /usr/src/debug/glib-2.0/2.82.4/glib/gbookmarkfile.h /usr/src/debug/glib-2.0/2.82.4/glib/gbitlock.h /usr/src/debug/glib-2.0/2.82.4/glib/gbitlock.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/sequence.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/cond.c /usr/src/debug/glib-2.0/2.82.4/glib/gvarianttype.c /usr/src/debug/glib-2.0/2.82.4/glib/gb
 ase64.h /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-serialiser.h /usr/src/debug/glib-2.0/2.82.4/glib/gbase64.c /usr/src/debug/glib-2.0/2.82.4/glib/gvarianttype.h /usr/src/debug/glib-2.0/2.82.4/girepository/tests/gthash.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/throws.c /usr/src/debug/glib-2.0/2.82.4/glib/gvariant-serialiser.c /usr/src/debug/glib-2.0/2.82.4/glib/gpathbuf.c /usr/src/debug/glib-2.0/2.82.4/glib/gpathbuf.h /usr/src/debug/glib-2.0/2.82.4/glib/glib-unixprivate.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/io-channel-basic.c /usr/src/debug/glib-2.0/2.82.4/glib/glib-init.c /usr/src/debug/glib-2.0/2.82.4/glib/glib-init.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/utf8-validate.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/mainloop.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/hash.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/strvbuilder.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/utf8-misc.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/logging.c /usr/src/debug/glib-2.0/2.82.4
 /glib/tests/mapping.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/collate.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/include.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/keyfile.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/private.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/unicode.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/dump.c /usr/src/debug/glib-2.0/2.82.4/glib/gtimezone.c /usr/src/debug/glib-2.0/2.82.4/glib/gtimezone.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/thread-deprecated.c /usr/src/debug/glib-2.0/2.82.4/glib/gbsearcharray.h /usr/src/debug/glib-2.0/2.82.4/glib/gvariant.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/option-argv0.c /usr/src/debug/glib-2.0/2.82.4/glib/gvariant.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/list.c /usr/src/debug/glib-2.0/2.82.4/glib/garcbox.c /usr/src/debug/glib-2.0/2.82.4/glib/gslist.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/unicode-encoding.c /usr/src/debug/glib-2.0/2.82.4/glib/gslist.c /usr/src/debug/glib-2.0/2.82.4/girepository/tests/a
 utoptr.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/unix.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/strfuncs.c /usr/src/debug/glib-2.0/2.82.4/glib/ghook.h /usr/src/debug/glib-2.0/2.82.4/glib/genviron.c /usr/src/debug/glib-2.0/2.82.4/glib/ghook.c /usr/src/debug/glib-2.0/2.82.4/glib/gscripttable.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/gdatetime.c /usr/src/debug/glib-2.0/2.82.4/glib/genviron.h /usr/src/debug/glib-2.0/2.82.4/glib/glib-autocleanups.h /usr/src/debug/glib-2.0/2.82.4/glib/ghmac.c /usr/src/debug/glib-2.0/2.82.4/glib/gspawn.h /usr/src/debug/glib-2.0/2.82.4/glib/ghmac.h /usr/src/debug/glib-2.0/2.82.4/glib/tests/assert-msg-test.c /usr/src/debug/glib-2.0/2.82.4/glib/gspawn.c /usr/src/debug/glib-2.0/2.82.4/glib/gdataset.c /usr/src/debug/glib-2.0/2.82.4/glib/gdate.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/unicode-normalize.c /usr/src/debug/glib-2.0/2.82.4/glib/gnode.c /usr/src/debug/glib-2.0/2.82.4/glib/gslice.c /usr/src/debug/glib-2.0/2.82.4/glib/gtrace.c /usr/src/debug/gli
 b-2.0/2.82.4/glib/gdataset.h /usr/src/debug/glib-2.0/2.82.4/glib/gtree.c /usr/src/debug/glib-2.0/2.82.4/glib/gslice.h /usr/src/debug/glib-2.0/2.82.4/glib/gdate.h /usr/src/debug/glib-2.0/2.82.4/glib/gnode.h /usr/src/debug/glib-2.0/2.82.4/glib/gtree.h /usr/src/debug/glib-2.0/2.82.4/glib/glib-unix.c /usr/src/debug/glib-2.0/2.82.4/glib/glib-unix.h /usr/src/debug/glib-2.0/2.82.4/glib/gthread-posix.c /usr/src/debug/glib-2.0/2.82.4/glib/tests/bitlock.c /usr/src/debug/glib-2.0/2.82.4/glib/gunidecomp.h /usr/src/debug/glib-2.0/2.82.4/glib/gbytes.c /usr/src/debug/glib-2.0/2.82.4/glib/gquark.c /usr/src/debug/glib-2.0/2.82.4/glib/gunidecomp.c /usr/src/debug/glib-2.0/2.82.4/glib/gquark.h /usr/src/debug/glib-2.0/2.82.4/glib/gbytes.h /usr/src/debug/glib-2.0/2.82.4/glib/gtypes.h /usr/src/debug/glib-2.0/2.82.4/glib/grefstring.c /usr/src/debug/glib-2.0/2.82.4/glib/grefstring.h", added "/usr/src/debug/glib-2.0/2.84.0/glib/goption.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/sort.c /usr/src/debug/glib-2.
 0/2.84.0/glib/goption.h /usr/src/debug/glib-2.0/2.84.0/glib/gunicollate.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/utils-isolated.c /usr/src/debug/glib-2.0/2.84.0/glib/gunicode.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/markup-subparser.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/hmac.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/environment.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/refstring.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/1bit-mutex.c /usr/src/debug/glib-2.0/2.84.0/glib/gmain-internal.h /usr/src/debug/glib-2.0/2.84.0/glib/gqsort.c /usr/src/debug/glib-2.0/2.84.0/glib/gqsort.h /usr/src/debug/glib-2.0/2.84.0/glib/gvarianttype-private.h /usr/src/debug/glib-2.0/2.84.0/glib/gmappedfile.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/uri.c /usr/src/debug/glib-2.0/2.84.0/glib/gmappedfile.c /usr/src/debug/glib-2.0/2.84.0/glib/gmirroringtable.h /usr/src/debug/glib-2.0/2.84.0/glib/gfileutils.h /usr/src/debug/glib-2.0/2.84.0/glib/gfileutils.c /usr/src/debug/glib-2.0/2.84.0/glib/test
 s/messages-low-memory.c /usr/src/debug/glib-2.0/2.84.0/glib/gdatetime.h /usr/src/debug/glib-2.0/2.84.0/glib/ghash.h /usr/src/debug/glib-2.0/2.84.0/glib/ghash.c /usr/src/debug/glib-2.0/2.84.0/glib/gdatetime.c /usr/src/debug/glib-2.0/2.84.0/glib/gtrashstack.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/mem-overflow.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/bookmarkfile.c /usr/src/debug/glib-2.0/2.84.0/glib/gtrashstack.h /usr/src/debug/glib-2.0/2.84.0/glib/garray.h /usr/src/debug/glib-2.0/2.84.0/glib/garray.c /usr/src/debug/glib-2.0/2.84.0/glib/gstrfuncs.c /usr/src/debug/glib-2.0/2.84.0/glib/gstrfuncs.h /usr/src/debug/glib-2.0/2.84.0/glib/grcboxprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/protocol.c /usr/src/debug/glib-2.0/2.84.0/glib/gtranslit.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/relation.c /usr/src/debug/glib-2.0/2.84.0/glib/gbacktrace.c /usr/src/debug/glib-2.0/2.84.0/glib/glibconfig.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/io-channel.c /usr/src/debug/glib-2.0/2.84.0
 /glib/gthread.h /usr/src/debug/glib-2.0/2.84.0/glib/gshell.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/markup-escape.c /usr/src/debug/glib-2.0/2.84.0/glib/gthread.c /usr/src/debug/glib-2.0/2.84.0/glib/gshell.c /usr/src/debug/glib-2.0/2.84.0/glib/gstdio.h /usr/src/debug/glib-2.0/2.84.0/glib/gstdio.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/rand.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/test-printf.c /usr/src/debug/glib-2.0/2.84.0/glib/guriprivate.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/cmph-bdz.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/memchunk.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-test-helper.c /usr/src/debug/glib-2.0/2.84.0/glib/gdatetime-private.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/onceinit.c /usr/src/debug/glib-2.0/2.84.0/glib/gdatetime-private.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/search-utils.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/repository.c /usr/src/debug/glib-2.0/2.84.0/glib/gutf8.c /usr/src/debug/glib-2.0/2.84.0/glib/g
 asyncqueueprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/glibintl.h /usr/src/debug/glib-2.0/2.84.0/glib/gmarkup.c /usr/src/debug/glib-2.0/2.84.0/glib/gmarkup.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/gutils-user-database.c /usr/src/debug/glib-2.0/2.84.0/glib/gunibreak.h /usr/src/debug/glib-2.0/2.84.0/glib/gunibreak.c /usr/src/debug/glib-2.0/2.84.0/glib/gspawn-private.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/charset.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/convert.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/dataset.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/timeout.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/registered-type-info.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/utf8-pointer.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/object-info.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/struct-info.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/thread-pool.c /usr/src/debug/glib-2.0/2.84.0/glib/gcharset.h /usr/src/debug/glib-2.0/2.84.0/glib/gprimes.h /usr/src/
 debug/glib-2.0/2.84.0/glib/gchecksum.c /usr/src/debug/glib-2.0/2.84.0/glib/gvarianttypeinfo.c /usr/src/debug/glib-2.0/2.84.0/glib/gcharset.c /usr/src/debug/glib-2.0/2.84.0/glib/gchecksum.h /usr/src/debug/glib-2.0/2.84.0/glib/gprimes.c /usr/src/debug/glib-2.0/2.84.0/glib/gvarianttypeinfo.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/array-test.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-test.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/pattern.c /usr/src/debug/glib-2.0/2.84.0/glib/gtimer.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/scannerapi.c /usr/src/debug/glib-2.0/2.84.0/glib/gtimer.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/dir.c /usr/src/debug/glib-2.0/2.84.0/glib/guniprop.c /usr/src/debug/glib-2.0/2.84.0/glib/gvariant-core.h /usr/src/debug/glib-2.0/2.84.0/glib/gregex.c /usr/src/debug/glib-2.0/2.84.0/glib/gregex.h /usr/src/debug/glib-2.0/2.84.0/glib/gvariant-core.c /usr/src/debug/glib-2.0/2.84.0/glib/gasyncqueue.c /usr/src/debug/glib-2.0/2.84.0/glib/gasyncqueue.h /usr/src/de
 bug/glib-2.0/2.84.0/glib/tests/hook.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/function-info.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-singlethread.c /usr/src/debug/glib-2.0/2.84.0/glib/grand.h /usr/src/debug/glib-2.0/2.84.0/glib/guuid.h /usr/src/debug/glib-2.0/2.84.0/glib/grand.c /usr/src/debug/glib-2.0/2.84.0/glib/guuid.c /usr/src/debug/glib-2.0/2.84.0/glib/glist.h /usr/src/debug/glib-2.0/2.84.0/glib/glist.c /usr/src/debug/glib-2.0/2.84.0/glib/gcharsetprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/gunicodeprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-path-search-helper.c /usr/src/debug/glib-2.0/2.84.0/glib/gvariant-internal.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/union-info.c /usr/src/debug/glib-2.0/2.84.0/glib/gdir.h /usr/src/debug/glib-2.0/2.84.0/glib/gmem.h /usr/src/debug/glib-2.0/2.84.0/glib/guri.h /usr/src/debug/glib-2.0/2.84.0/glib/gdir.c /usr/src/debug/glib-2.0/2.84.0/glib/gmem.c /usr/src/debug/glib-2.0/2.84.0/glib/guri.c /usr/src/deb
 ug/glib-2.0/2.84.0/glib/gjournal-private.c /usr/src/debug/glib-2.0/2.84.0/glib/gwakeup.c /usr/src/debug/glib-2.0/2.84.0/glib/gmain.c /usr/src/debug/glib-2.0/2.84.0/glib/gmain.h /usr/src/debug/glib-2.0/2.84.0/glib/gwakeup.h /usr/src/debug/glib-2.0/2.84.0/glib/gjournal-private.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/callable-info.c /usr/src/debug/glib-2.0/2.84.0/glib/gpoll.c /usr/src/debug/glib-2.0/2.84.0/glib/gpoll.h /usr/src/debug/glib-2.0/2.84.0/glib/gstring.h /usr/src/debug/glib-2.0/2.84.0/glib/gqueue.h /usr/src/debug/glib-2.0/2.84.0/glib/gqueue.c /usr/src/debug/glib-2.0/2.84.0/glib/gstring.c /usr/src/debug/glib-2.0/2.84.0/glib/gconvertprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/utf8-performance.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/fileutils.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/hostutils.c /usr/src/debug/glib-2.0/2.84.0/glib/gthreadpool.c /usr/src/debug/glib-2.0/2.84.0/glib/gthreadpool.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/testutils.h /usr/s
 rc/debug/glib-2.0/2.84.0/glib/tests/testing-helper.c /usr/src/debug/glib-2.0/2.84.0/glib/gkeyfile.h /usr/src/debug/glib-2.0/2.84.0/glib/gkeyfile.c /usr/src/debug/glib-2.0/2.84.0/glib/grefcount.c /usr/src/debug/glib-2.0/2.84.0/glib/gdatasetprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/grefcount.h /usr/src/debug/glib-2.0/2.84.0/glib/gconvert.c /usr/src/debug/glib-2.0/2.84.0/glib/gconvert.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/asyncqueue.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/bytes.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/cache.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/guuid.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/mutex.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/queue.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/rcbox.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/regex.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/shell.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/slice.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/slist.c /usr/src/debug/glib-2.0/2.84.0/glib/gversion.h /usr
 /src/debug/glib-2.0/2.84.0/glib/gversion.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/date.c /usr/src/debug/glib-2.0/2.84.0/glib/ghostutils.h /usr/src/debug/glib-2.0/2.84.0/glib/gpattern.h /usr/src/debug/glib-2.0/2.84.0/glib/gtestutils.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/tree.c /usr/src/debug/glib-2.0/2.84.0/glib/ghostutils.c /usr/src/debug/glib-2.0/2.84.0/glib/gpattern.c /usr/src/debug/glib-2.0/2.84.0/glib/gtestutils.c /usr/src/debug/glib-2.0/2.84.0/glib/gtranslit-data.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/test-common.c /usr/src/debug/glib-2.0/2.84.0/glib/gmessages.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/642026.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/atomic.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/test-common.h /usr/src/debug/glib-2.0/2.84.0/glib/gmessages.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/base64.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/macros.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/markup.c /usr/src/debug/glib-2.0/2.84.0/gli
 b/tests/rwlock.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/string.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/thread.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/timer.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/types.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/utils.c /usr/src/debug/glib-2.0/2.84.0/glib/gtester.c /usr/src/debug/glib-2.0/2.84.0/glib/gprintf.h /usr/src/debug/glib-2.0/2.84.0/glib/gprintf.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/node.c /usr/src/debug/glib-2.0/2.84.0/glib/gsequence.h /usr/src/debug/glib-2.0/2.84.0/glib/gsequence.c /usr/src/debug/glib-2.0/2.84.0/glib/gunichartables.h /usr/src/debug/glib-2.0/2.84.0/glib/gutilsprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/valgrind.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/markup-collect.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/option-context.c /usr/src/debug/glib-2.0/2.84.0/glib/ggettext.c /usr/src/debug/glib-2.0/2.84.0/glib/ggettext.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/overflow.c /usr/src/debug/glib-2.0/2.84
 .0/glib/tests/completion.c /usr/src/debug/glib-2.0/2.84.0/glib/gerror.h /usr/src/debug/glib-2.0/2.84.0/glib/glib-private.c /usr/src/debug/glib-2.0/2.84.0/glib/gerror.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/checksum.c /usr/src/debug/glib-2.0/2.84.0/glib/glib-private.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/mappedfile.c /usr/src/debug/glib-2.0/2.84.0/glib/gstrvbuilder.c /usr/src/debug/glib-2.0/2.84.0/glib/gstrvbuilder.h /usr/src/debug/glib-2.0/2.84.0/glib/giounix.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/getpwuid-preload.c /usr/src/debug/glib-2.0/2.84.0/glib/grcbox.c /usr/src/debug/glib-2.0/2.84.0/glib/grcbox.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/repository-search-paths.c /usr/src/debug/glib-2.0/2.84.0/glib/gthreadprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-path-search.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/pathbuf.c /usr/src/debug/glib-2.0/2.84.0/glib/gstringchunk.c /usr/src/debug/glib-2.0/2.84.0/glib/gscanner.c /usr/src/debug/glib-2.0/2.84.0
 /glib/gvariant-parser.c /usr/src/debug/glib-2.0/2.84.0/glib/gstringchunk.h /usr/src/debug/glib-2.0/2.84.0/glib/gscanner.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/spawn-multithreaded.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/test-spawn-echo.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/rec-mutex.c /usr/src/debug/glib-2.0/2.84.0/glib/gunicomp.h /usr/src/debug/glib-2.0/2.84.0/glib/gspawn-posix.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/gvariant.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/refcount.c /usr/src/debug/glib-2.0/2.84.0/glib/gutils.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/markup-parse.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/once.c /usr/src/debug/glib-2.0/2.84.0/glib/gutils.c /usr/src/debug/glib-2.0/2.84.0/glib/gatomic.h /usr/src/debug/glib-2.0/2.84.0/glib/giochannel.h /usr/src/debug/glib-2.0/2.84.0/glib/giochannel.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/thread-pool-slow.c /usr/src/debug/glib-2.0/2.84.0/glib/gatomic.c /usr/src/debug/glib-2.0/2.84.0/glib/gbookmarkf
 ile.c /usr/src/debug/glib-2.0/2.84.0/glib/gbookmarkfile.h /usr/src/debug/glib-2.0/2.84.0/glib/gbitlock.h /usr/src/debug/glib-2.0/2.84.0/glib/gbitlock.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/sequence.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/cond.c /usr/src/debug/glib-2.0/2.84.0/glib/gvarianttype.c /usr/src/debug/glib-2.0/2.84.0/glib/gbase64.h /usr/src/debug/glib-2.0/2.84.0/glib/gvariant-serialiser.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/testing-nonfatal.c /usr/src/debug/glib-2.0/2.84.0/glib/gbase64.c /usr/src/debug/glib-2.0/2.84.0/glib/gvarianttype.h /usr/src/debug/glib-2.0/2.84.0/girepository/tests/gthash.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/throws.c /usr/src/debug/glib-2.0/2.84.0/glib/gvariant-serialiser.c /usr/src/debug/glib-2.0/2.84.0/glib/gpathbuf.c /usr/src/debug/glib-2.0/2.84.0/glib/gpathbuf.h /usr/src/debug/glib-2.0/2.84.0/glib/glib-unixprivate.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/io-channel-basic.c /usr/src/debug/glib-2.0/2.84.0/glib/glib-ini
 t.c /usr/src/debug/glib-2.0/2.84.0/glib/glib-init.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/utf8-validate.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/mainloop.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/hash.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/strvbuilder.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/utf8-misc.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/logging.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/mapping.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/collate.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/include.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/keyfile.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/private.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/unicode.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/dump.c /usr/src/debug/glib-2.0/2.84.0/glib/gtimezone.c /usr/src/debug/glib-2.0/2.84.0/glib/gtimezone.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/thread-deprecated.c /usr/src/debug/glib-2.0/2.84.0/glib/gbsearcharray.h /usr/src/debug/glib-2.0/2.84.0/glib/gvariant
 .c /usr/src/debug/glib-2.0/2.84.0/glib/tests/option-argv0.c /usr/src/debug/glib-2.0/2.84.0/glib/gvariant.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/list.c /usr/src/debug/glib-2.0/2.84.0/glib/garcbox.c /usr/src/debug/glib-2.0/2.84.0/glib/gslist.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/unicode-encoding.c /usr/src/debug/glib-2.0/2.84.0/glib/gslist.c /usr/src/debug/glib-2.0/2.84.0/girepository/tests/autoptr.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/unix.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/strfuncs.c /usr/src/debug/glib-2.0/2.84.0/glib/ghook.h /usr/src/debug/glib-2.0/2.84.0/glib/genviron.c /usr/src/debug/glib-2.0/2.84.0/glib/ghook.c /usr/src/debug/glib-2.0/2.84.0/glib/gscripttable.h /usr/src/debug/glib-2.0/2.84.0/glib/tests/gdatetime.c /usr/src/debug/glib-2.0/2.84.0/glib/genviron.h /usr/src/debug/glib-2.0/2.84.0/glib/glib-autocleanups.h /usr/src/debug/glib-2.0/2.84.0/glib/ghmac.c /usr/src/debug/glib-2.0/2.84.0/glib/gspawn.h /usr/src/debug/glib-2.0/2.84.0/glib/ghmac.h /usr/s
 rc/debug/glib-2.0/2.84.0/glib/tests/assert-msg-test.c /usr/src/debug/glib-2.0/2.84.0/glib/gspawn.c /usr/src/debug/glib-2.0/2.84.0/glib/gdataset.c /usr/src/debug/glib-2.0/2.84.0/glib/gdate.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/unicode-normalize.c /usr/src/debug/glib-2.0/2.84.0/glib/gnode.c /usr/src/debug/glib-2.0/2.84.0/glib/gslice.c /usr/src/debug/glib-2.0/2.84.0/glib/gtrace.c /usr/src/debug/glib-2.0/2.84.0/glib/gdataset.h /usr/src/debug/glib-2.0/2.84.0/glib/gtree.c /usr/src/debug/glib-2.0/2.84.0/glib/gslice.h /usr/src/debug/glib-2.0/2.84.0/glib/gdate.h /usr/src/debug/glib-2.0/2.84.0/glib/gnode.h /usr/src/debug/glib-2.0/2.84.0/glib/gtree.h /usr/src/debug/glib-2.0/2.84.0/glib/glib-unix.c /usr/src/debug/glib-2.0/2.84.0/glib/glib-unix.h /usr/src/debug/glib-2.0/2.84.0/glib/gthread-posix.c /usr/src/debug/glib-2.0/2.84.0/glib/tests/bitlock.c /usr/src/debug/glib-2.0/2.84.0/glib/gunidecomp.h /usr/src/debug/glib-2.0/2.84.0/glib/gbytes.c /usr/src/debug/glib-2.0/2.84.0/glib/gquark.c /usr
 /src/debug/glib-2.0/2.84.0/glib/gunidecomp.c /usr/src/debug/glib-2.0/2.84.0/glib/gquark.h /usr/src/debug/glib-2.0/2.84.0/glib/gbytes.h /usr/src/debug/glib-2.0/2.84.0/glib/gtypes.h /usr/src/debug/glib-2.0/2.84.0/glib/grefstring.c /usr/src/debug/glib-2.0/2.84.0/glib/grefstring.h"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25119485 to 25403501 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGSIZE changed from 750725 to 754821 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.82.4" to "2.84.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.8200.4 /usr/lib/libgthread-2.0.so.0.8200.4 /usr/lib/libgirepository-2.0.so.0.8200.4 /usr/lib/libgmodule-2.0.so.0.8200.4 /usr/lib/libgio-2.0.so.0.8200.4 /usr/lib/libglib-2.0.so.0.8200.4", added "/usr/lib/libgobject-2.0.so.0.8400.0 /usr/lib/libgthread-2.0.so.0.8400.0 /usr/lib/libglib-2.0.so.0.8400.0 /usr/lib/libgirepository-2.0.so.0.8400.0 /usr/lib/libgmodule-2.0.so.0.8400.0 /usr/lib/libgio-2.0.so.0.8400.0"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 4796490 to 4848770 (+1%)
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.82/glib-2.82.4.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.84/glib-2.84.0.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file
 ://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.82.4 [default] to 2.84.0 [default]
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.82.4" to "2.84.0"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py
packages/core2-64-poky-linux/gnome-desktop-testing/gnome-desktop-testing-dbg: PKGSIZE changed from 81888 to 82144 (+0%)
packages/core2-64-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGSIZE changed from 1887792 to 1895688 (+0%)
packages/core2-64-poky-linux/python3-dbus/python3-dbus-dbg: PKGSIZE changed from 544096 to 544152 (+0%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1440096 to 1442456 (+0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dbg: PKGSIZE changed from 703064 to 707448 (+1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: PKGSIZE changed from 2862995 to 2867091 (+0%)
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/libexec/installed-tests was added
  /usr/libexec/installed-tests/glib was added
  /usr/libexec/installed-tests/glib/taptestrunner.py was added
  /usr/libexec/installed-tests/glib/testprogramrunner.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============3313658229752894684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: FILELIST: removed "/usr/libexec/installed-tests/glib/services/org.freedesktop.portal.Documents.service", added "/usr/share/installed-tests/glib/gi-inspect-typelib.py.test /usr/share/installed-tests/glib/gi-compile-repository.py.test /usr/libexec/installed-tests/glib/glibconfig.py /usr/libexec/installed-tests/glib/gi-compile-repository.py /usr/share/installed-tests/glib/callable-info.test /usr/libexec/installed-tests/glib/testing-nonfatal /usr/libexec/installed-tests/glib/testprogramrunner.py /usr/libexec/installed-tests/glib/callable-info /usr/libexec/installed-tests/glib/gi-inspect-typelib.py /usr/share/installed-tests/glib/testing-nonfatal.test"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.8200.4 /usr/lib/libgirepository-2.0.so.0.8200.4 /usr/lib/libgio-2.0.so.0.8200.4 /usr/lib/libgmodule-2.0.so.0.8200.4 /usr/lib/libglib-2.0.so.0.8200.4 /usr/lib/libgobject-2.0.so.0.8200.4", added "/usr/lib/libgmodule-2.0.so.0.8400.0 /usr/lib/libgirepository-2.0.so.0.8400.0 /usr/lib/libgthread-2.0.so.0.8400.0 /usr/lib/libglib-2.0.so.0.8400.0 /usr/lib/libgio-2.0.so.0.8400.0 /usr/lib/libgobject-2.0.so.0.8400.0"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8400.0
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8400.0
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.0
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8400.0
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.0
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8400.0
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8400.0
  /usr/libexec/installed-tests was added
  /usr/libexec/installed-tests/glib was added
  /usr/libexec/installed-tests/glib/taptestrunner.py was added
  /usr/libexec/installed-tests/glib/testprogramrunner.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============3313658229752894684==--

