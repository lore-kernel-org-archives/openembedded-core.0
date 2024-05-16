Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBAFC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:51:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.10459.1715856700667342611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OsrtgpfC;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715856703; x=1747392703;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gF0LQJ1kHAY+LIU6elgezR4zlQA8o0cN5STaJtFPTrU=;
  b=OsrtgpfCSMQCuPJaZcBSZmQ3VHjlAtDdp+Cc9RvqxsFfPKNb9SmE7lGO
   Ap4dfq6yCfg8b+k88Nu54/z8LdbTLHjsQKF6Q6KmDSCH1yibUE7X1UCOb
   R1OdNNxi4REKSScIdM6wOrTcpQO5tt/DxCHRoKx36OpyOC67OmPpbM2jK
   BV7ME2AKCcJbCZ3UPd9Sq6n1iJrfRuH1U/UtmTAHVBrDuyfQGopvIlc56
   hwkvPktakVFf3JzAA3gNhRav44N2UJrWPD5rI+QcCgUrJbv7Qww2kEP40
   UvmAQ6Bl8qdvGHWQFjWJC/Tt5PEQHMB0EUUO3ehTMBa6TNSSoLct0Y2K/
   w==;
X-CSE-ConnectionGUID: 8VbD/VHBRFCkkVXzrUyGdg==
X-CSE-MsgGUID: Yciim03JQDSZL9OhBLGTow==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22561969"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22561969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:43 -0700
X-CSE-ConnectionGUID: cFtepnOnR4Se3yft6ks8IA==
X-CSE-MsgGUID: Zw3mZcWdTBWEsfvS4UztjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31516343"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.165])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] glib-2.0: upgrade 2.80.0 -> 2.80.2
Date: Thu, 16 May 2024 18:51:28 +0800
Message-ID: <20240516105129.35869-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240516105129.35869-1-anuj.mittal@intel.com>
References: <20240516105129.35869-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199456

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Do-not-write-bindir-into-pkg-config-files.patch |  2 +-
 .../0001-Fix-DATADIRNAME-on-uclibc-Linux.patch     |  2 +-
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...warning-about-deprecated-paths-in-schemas.patch |  2 +-
 ...chine-correctly-when-building-with-mingw3.patch | 14 +++++++-------
 ...esources.c-comment-out-a-build-host-only-.patch |  2 +-
 ...y-introspection-correctly-install-.gir-fi.patch |  2 +-
 ...1-meson-Run-atomics-test-on-clang-as-well.patch |  4 ++--
 ...-do-not-enable-pidfd-features-on-native-g.patch |  4 ++--
 ...t-hardcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/relocate-modules.patch          |  2 +-
 .../recipes-core/glib-2.0/files/skip-timeout.patch |  2 +-
 ...nitial_2.80.0.bb => glib-2.0-initial_2.80.2.bb} |  0
 .../{glib-2.0_2.80.0.bb => glib-2.0_2.80.2.bb}     |  1 +
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 15 files changed, 22 insertions(+), 21 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.80.0.bb => glib-2.0-initial_2.80.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.0.bb => glib-2.0_2.80.2.bb} (94%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index f6eba04fd4c..10568b7c9fe 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 0561dcbf0918631d8106c3f6c2d8e92a5ec4b887 Mon Sep 17 00:00:00 2001
+From 10b08af6c7dcb03f954da29b6c4f9636b8796f30 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 129bc7f8aee..b9c9706fc46 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From ccb25e8c0bab54eac8ba0e9d7083ce81461ab72a Mon Sep 17 00:00:00 2001
+From 55c49c51d8db5af15132653003d2b65a5215eebf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 3e12f8abbeb..bc539fe3e88 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From caab40411d8520dae77a4b7933ebaffbb00559fe Mon Sep 17 00:00:00 2001
+From 53333cf3ec787cb7e60585237327390e2ca89f4c Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 9b0b83afa44..5e543339d8c 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 65c036b1ede453e89893076f4ece21c946505096 Mon Sep 17 00:00:00 2001
+From 3db055ce8029372096be534c5cfc385f068bab17 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index a2f9dd9672f..7ac03aa6ac7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From 01810df82fae752428d3756c85edb2eb7bbf3c15 Mon Sep 17 00:00:00 2001
+From 3f85d7dfb25666aef43dd6d58b4151e523f83693 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 232ecca..563298b 100644
+index 3bfb333..60e3d3d 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -29,7 +29,7 @@ endif
@@ -33,7 +33,7 @@ index 232ecca..563298b 100644
    gio_tests += {
      'file' : {
        # FIXME: https://gitlab.gnome.org/GNOME/glib/-/issues/3148
-@@ -593,7 +593,7 @@ if host_machine.system() != 'windows'
+@@ -599,7 +599,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -42,7 +42,7 @@ index 232ecca..563298b 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -663,7 +663,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -669,7 +669,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -52,10 +52,10 @@ index 232ecca..563298b 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index f6efc59..83eb5a5 100644
+index 85f40d2..39de732 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -226,7 +226,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -230,7 +230,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -65,7 +65,7 @@ index f6efc59..83eb5a5 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 7534542..2560686 100644
+index b995ebc..257afb5 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index bb84f3969e4..aa7127b65b7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From e8b4f53b567339aad90b585673d55a5c6176535a Mon Sep 17 00:00:00 2001
+From 97b4f18c65c52c9e6412ecf8affc22f6f42d3465 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
index 76e5f587480..7be9cd8b845 100644
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
@@ -1,4 +1,4 @@
-From 4e6be5d15e5d2f8e494d22a3d49b623064f9c1a5 Mon Sep 17 00:00:00 2001
+From f1beef5c2d09fae3a5e5a314f984cb3f20abe732 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 23 Apr 2024 11:24:34 +0200
 Subject: [PATCH] girepository/introspection: correctly install .gir files into
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 2f805299874..3a8d3596b0d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 3dc2e741e18ccb740e98eb4e808ff83153b70e83 Mon Sep 17 00:00:00 2001
+From f04ea29f9f96892ada81bd0acfcef70183138229 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 2560686..5c46d0b 100644
+index 257afb5..5caa6e6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2024,7 +2024,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 82955de6715..9be04960aaa 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 59525eedfbbfe4a16fdd0b340bc3f2479431c7d5 Mon Sep 17 00:00:00 2001
+From a63c865aa9a24f3230e8e2bcb5bce88f179c7e2b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5c46d0b..222c1a1 100644
+index 5caa6e6..688f214 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index a51c186b004..4dec252c1f0 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From e6784ba43af83e22556921786c8f15e4cd246298 Mon Sep 17 00:00:00 2001
+From dc7f09c4f52638a70768c528d186da6f83dedc97 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index d6e9019f396..a1ff198aa65 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 47ea2576a13d5bc86692b4ba8cb4a8f2fd38c6ca Mon Sep 17 00:00:00 2001
+From 0133aeabd37a9137722abd86039d7d0797b5896f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index b1c62cc39c8..0f8b51294ba 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 682d8a616ca111c0e45c8a9cb02e992e63c69586 Mon Sep 17 00:00:00 2001
+From ac75f5d9206e52eec64fef0db4cd91b58a764c99 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
similarity index 94%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
index e22810a55bc..ef80cc47cfb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
@@ -1 +1,2 @@
 require glib.inc
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 1a97a0d02a6..fbd2b186847 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -233,7 +233,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d"
+SRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.45.0


