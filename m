Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95A9C27C55
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1234.1715794337378492627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C0+45Z4/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pbwrVtIq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fdb5e-58f74626-0ac9-4295-a885-eb64e5d17083-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KrYsHHYr+s2eGikZ+qgte5wIdL9VX3vxQBtyaoKtb5E=;
	b=C0+45Z4/MnjqxOySqrL0SIdr9TwoNFigJgz+gtZkN+6GVkeXqiqla5sJQAvqoi41
	59/F/idPAyuMGt/a67iQ53qbecYSZDro2Cs964Sm+SWTtuLqCT79AbIZoPuVLA0byCP
	9ROJL7BjfVD3YV/3V4JjeiOD7tXKnn7ppgPdSI3E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KrYsHHYr+s2eGikZ+qgte5wIdL9VX3vxQBtyaoKtb5E=;
	b=pbwrVtIqxz6P58R170kFMQIhGOIUJRnJGugPxeTJxPWJo5EJjKwxIljv8XZB8Bhc
	6OLKN1q1E1v2SrMZv1HWMmttJtVDxAGPTWEoPeIR55rV9aYwW97faoBzXYPX4Cht4jN
	fQfT0l/zMKStsXa/xqH4113ZN4MfBOkXl8Owmysw=
Content-Type: multipart/mixed; boundary="===============7370721247894959671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.80.2 FAILED
Message-ID: <0101018f7d4fdb5e-58f74626-0ac9-4295-a885-eb64e5d17083-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199308

--===============7370721247894959671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.80.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.80.0-2.80.2.patch
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
From b8dfa18ac5b19e1dd2e65188ccc14d812015e323 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 07:21:30 +0000
Subject: [PATCH] glib-2.0: upgrade 2.80.0 -> 2.80.2

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
 .../{glib-2.0_2.80.0.bb => glib-2.0_2.80.2.bb}     |  1 +
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 14 files changed, 22 insertions(+), 21 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.0.bb => glib-2.0_2.80.2.bb} (94%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index f6eba04fd4..10568b7c9f 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 0561dcbf0918631d8106c3f6c2d8e92a5ec4b887 Mon Sep 17 00:00:00 2001
+From 10b08af6c7dcb03f954da29b6c4f9636b8796f30 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 129bc7f8ae..b9c9706fc4 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From ccb25e8c0bab54eac8ba0e9d7083ce81461ab72a Mon Sep 17 00:00:00 2001
+From 55c49c51d8db5af15132653003d2b65a5215eebf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 3e12f8abbe..bc539fe3e8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From caab40411d8520dae77a4b7933ebaffbb00559fe Mon Sep 17 00:00:00 2001
+From 53333cf3ec787cb7e60585237327390e2ca89f4c Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 9b0b83afa4..5e543339d8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 65c036b1ede453e89893076f4ece21c946505096 Mon Sep 17 00:00:00 2001
+From 3db055ce8029372096be534c5cfc385f068bab17 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index a2f9dd9672..7ac03aa6ac 100644
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
index bb84f3969e..aa7127b65b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From e8b4f53b567339aad90b585673d55a5c6176535a Mon Sep 17 00:00:00 2001
+From 97b4f18c65c52c9e6412ecf8affc22f6f42d3465 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
index 76e5f58748..7be9cd8b84 100644
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
@@ -1,4 +1,4 @@
-From 4e6be5d15e5d2f8e494d22a3d49b623064f9c1a5 Mon Sep 17 00:00:00 2001
+From f1beef5c2d09fae3a5e5a314f984cb3f20abe732 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 23 Apr 2024 11:24:34 +0200
 Subject: [PATCH] girepository/introspection: correctly install .gir files into
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 2f80529987..3a8d3596b0 100644
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
index 82955de671..9be04960aa 100644
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
index a51c186b00..4dec252c1f 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From e6784ba43af83e22556921786c8f15e4cd246298 Mon Sep 17 00:00:00 2001
+From dc7f09c4f52638a70768c528d186da6f83dedc97 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index d6e9019f39..a1ff198aa6 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 47ea2576a13d5bc86692b4ba8cb4a8f2fd38c6ca Mon Sep 17 00:00:00 2001
+From 0133aeabd37a9137722abd86039d7d0797b5896f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index b1c62cc39c..0f8b51294b 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 682d8a616ca111c0e45c8a9cb02e992e63c69586 Mon Sep 17 00:00:00 2001
+From ac75f5d9206e52eec64fef0db4cd91b58a764c99 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
similarity index 94%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
index e22810a55b..ef80cc47cf 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
@@ -1 +1,2 @@
 require glib.inc
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 1a97a0d02a..fbd2b18684 100644
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
2.44.0


--===============7370721247894959671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.80.0-2.80.2.patch"

RnJvbSBiOGRmYTE4YWM1YjE5ZTFkZDJlNjUxODhjY2MxNGQ4MTIwMTVlMzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDc6MjE6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMDogdXBncmFkZSAyLjgwLjAgLT4gMi44MC4yCgotLS0KIC4uLkRvLW5vdC13cml0ZS1i
aW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAxLUZpeC1E
QVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggICAgIHwgIDIgKy0KIC4uLnN0YWxsLWdp
by1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIHwgIDIgKy0KIC4uLndhcm5p
bmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDIgKy0KIC4uLmNo
aW5lLWNvcnJlY3RseS13aGVuLWJ1aWxkaW5nLXdpdGgtbWluZ3czLnBhdGNoIHwgMTQgKysrKysr
Ky0tLS0tLS0KIC4uLmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBh
dGNoIHwgIDIgKy0KIC4uLnktaW50cm9zcGVjdGlvbi1jb3JyZWN0bHktaW5zdGFsbC0uZ2lyLWZp
LnBhdGNoIHwgIDIgKy0KIC4uLjEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13
ZWxsLnBhdGNoIHwgIDQgKystLQogLi4uLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24t
bmF0aXZlLWcucGF0Y2ggfCAgNCArKy0tCiAuLi50LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8t
dmFyaW91cy10b29scy5wYXRjaCB8ICAyICstCiAuLi4vZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUt
bW9kdWxlcy5wYXRjaCAgICAgICAgICB8ICAyICstCiAuLi4vcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCB8ICAyICstCiAuLi4ve2dsaWItMi4wXzIuODAuMC5i
YiA9PiBnbGliLTIuMF8yLjgwLjIuYmJ9ICAgICB8ICAxICsKIG1ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIDE0IGZpbGVzIGNoYW5nZWQs
IDIyIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjgwLjAuYmIgPT4gZ2xpYi0yLjBfMi44MC4yLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
RG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1w
a2ctY29uZmlnLWZpbGVzLnBhdGNoCmluZGV4IGY2ZWJhMDRmZDQuLjEwNTY4YjdjOWYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRl
LWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZp
Zy1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDU2MWRjYmYwOTE4NjMxZDgxMDZj
M2Y2YzJkOGU5MmE1ZWM0Yjg4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTBiMDhh
ZjZjN2RjYjAzZjk1NGRhMjliNmM0Zjk2MzZiODc5NmYzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogRnJpLCAxNSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBEbyBu
b3QgcHJlZml4IGV4ZWN1dGFibGVzIHdpdGggJGJpbmRpciBpbiBwa2ctY29uZmlnIGZpbGVzCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRB
RElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKaW5kZXgg
MTI5YmM3ZjhhZS4uYjljOTcwNmZjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1F
LW9uLXVjbGliYy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2NiMjVlOGMwYmFi
NTRlYWM4YmEwZTlkNzA4M2NlODE0NjFhYjcyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNTVjNDljNTFkOGRiNWFmMTUxMzI2NTMwMDNkMmI2NWE1MjE1ZWViZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBT
YXQsIDE1IE1hciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBEQVRB
RElSTkFNRSBvbiB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJP
R1JBTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFs
bC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAppbmRleCAzZTEyZjhh
YmJlLi5iYzUzOWZlM2U4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdp
by1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjYWFiNDA0MTFkODUyMGRhZTc3YTRiNzkzM2ViYWZmYmIwMDU1OWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA1MzMzM2NmM2VjNzg3Y2I3ZTYwNTg1MjM3MzI3MzkwZTJjYTg5
ZjRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3Np
Lmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjIgTWFyIDIwMTYgMTU6MTQ6NTggKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gSW5zdGFsbCBnaW8tcXVlcnltb2R1bGVzIGFzIGxpYmV4ZWNf
UFJPR1JBTQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdh
cm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCmluZGV4IDliMGI4
M2FmYTQuLjVlNTQzMzM5ZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4t
c2NoZW1hcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1YzAzNmIxZWRlNDUzZTg5ODkzMDc2ZjRlY2UyMWM5
NDY1MDUwOTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNkYjA1NWNlODAyOTM3MjA5
NmJlNTM0YzVjZmMzODVmMDY4YmFiMTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTIg
SnVuIDIwMTUgMTc6MDg6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHRoZSB3YXJu
aW5nIGFib3V0IGRlcHJlY2F0ZWQgcGF0aHMgaW4gc2NoZW1hcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1TZXQtaG9zdF9tYWNoaW5lLWNvcnJlY3Rs
eS13aGVuLWJ1aWxkaW5nLXdpdGgtbWluZ3czLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1TZXQtaG9zdF9tYWNoaW5lLWNvcnJlY3RseS13aGVuLWJ1aWxkaW5n
LXdpdGgtbWluZ3czLnBhdGNoCmluZGV4IGEyZjlkZDk2NzIuLjdhYzAzYWE2YWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtU2V0LWhvc3RfbWFjaGlu
ZS1jb3JyZWN0bHktd2hlbi1idWlsZGluZy13aXRoLW1pbmd3My5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVNldC1ob3N0X21hY2hpbmUtY29ycmVjdGx5
LXdoZW4tYnVpbGRpbmctd2l0aC1taW5ndzMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAx
ODEwZGY4MmZhZTc1MjQyOGQzNzU2Yzg1ZWRiMmViN2JiZjNjMTUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDNmODVkN2RmYjI1NjY2YWVmNDNkZDZkNThiNDE1MWU1MjNmODM2OTMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTMgRmViIDIwMTkgMTU6MzI6MDUgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gU2V0IGhvc3RfbWFjaGluZSBjb3JyZWN0bHkgd2hlbiBidWlsZGluZyB3
aXRoIG1pbmd3MzIKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvbWVzb24u
YnVpbGQgYi9naW8vdGVzdHMvbWVzb24uYnVpbGQKLWluZGV4IDIzMmVjY2EuLjU2MzI5OGIgMTAw
NjQ0CitpbmRleCAzYmZiMzMzLi42MGUzZDNkIDEwMDY0NAogLS0tIGEvZ2lvL3Rlc3RzL21lc29u
LmJ1aWxkCiArKysgYi9naW8vdGVzdHMvbWVzb24uYnVpbGQKIEBAIC0yOSw3ICsyOSw3IEBAIGVu
ZGlmCkBAIC0zMyw3ICszMyw3IEBAIGluZGV4IDIzMmVjY2EuLjU2MzI5OGIgMTAwNjQ0CiAgICBn
aW9fdGVzdHMgKz0gewogICAgICAnZmlsZScgOiB7CiAgICAgICAgIyBGSVhNRTogaHR0cHM6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9pc3N1ZXMvMzE0OAotQEAgLTU5Myw3ICs1OTMs
NyBAQCBpZiBob3N0X21hY2hpbmUuc3lzdGVtKCkgIT0gJ3dpbmRvd3MnCitAQCAtNTk5LDcgKzU5
OSw3IEBAIGlmIGhvc3RfbWFjaGluZS5zeXN0ZW0oKSAhPSAnd2luZG93cycKICBlbmRpZiAjIHVu
aXgKICAKICAjICBUZXN0IHByb2dyYW1zIGJ1aWxkYWJsZSBvbiBXaW5kb3dzIG9ubHkKQEAgLTQy
LDcgKzQyLDcgQEAgaW5kZXggMjMyZWNjYS4uNTYzMjk4YiAxMDA2NDQKICAgIGdpb190ZXN0cyAr
PSB7J3dpbjMyLXN0cmVhbXMnIDoge319CiAgZW5kaWYKICAKLUBAIC02NjMsNyArNjYzLDcgQEAg
aWYgY2MuZ2V0X2lkKCkgIT0gJ21zdmMnIGFuZCBjYy5nZXRfaWQoKSAhPSAnY2xhbmctY2wnCitA
QCAtNjY5LDcgKzY2OSw3IEBAIGlmIGNjLmdldF9pZCgpICE9ICdtc3ZjJyBhbmQgY2MuZ2V0X2lk
KCkgIT0gJ2NsYW5nLWNsJwogICAgfQogIGVuZGlmCiAgCkBAIC01MiwxMCArNTIsMTAgQEAgaW5k
ZXggMjMyZWNjYS4uNTYzMjk4YiAxMDA2NDQKICAgICAgJ2dkYnVzLWV4YW1wbGUtdW5peC1mZC1j
bGllbnQnIDogewogICAgICAgICdpbnN0YWxsJyA6IGZhbHNlLAogZGlmZiAtLWdpdCBhL2dsaWIv
dGVzdHMvbWVzb24uYnVpbGQgYi9nbGliL3Rlc3RzL21lc29uLmJ1aWxkCi1pbmRleCBmNmVmYzU5
Li44M2ViNWE1IDEwMDY0NAoraW5kZXggODVmNDBkMi4uMzlkZTczMiAxMDA2NDQKIC0tLSBhL2ds
aWIvdGVzdHMvbWVzb24uYnVpbGQKICsrKyBiL2dsaWIvdGVzdHMvbWVzb24uYnVpbGQKLUBAIC0y
MjYsNyArMjI2LDcgQEAgaWYgZ2xpYl9jb25mLmhhcygnSEFWRV9FVkVOVEZEJykKK0BAIC0yMzAs
NyArMjMwLDcgQEAgaWYgZ2xpYl9jb25mLmhhcygnSEFWRV9FVkVOVEZEJykKICAgIH0KICBlbmRp
ZgogIApAQCAtNjUsNyArNjUsNyBAQCBpbmRleCBmNmVmYzU5Li44M2ViNWE1IDEwMDY0NAogICAg
ICBnbGliX3Rlc3RzICs9IHsKICAgICAgICAnZ3BvbGwnIDogewogZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDc1MzQ1NDIuLjI1NjA2ODYgMTAwNjQ0CitpbmRl
eCBiOTk1ZWJjLi4yNTdhZmI1IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29u
LmJ1aWxkCiBAQCAtNTQsNiArNTQsOSBAQCBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91
dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qt
b25seS0ucGF0Y2gKaW5kZXggYmI4NGYzOTY5ZS4uYWE3MTI3YjY1YiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMt
Y29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0
LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZThiNGY1M2I1
NjczMzlhYWQ5MGI1ODU2NzNkNTVhNWM2MTc2NTM1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTdiNGYxOGM2NWM1MmM5ZTY0MTJlY2Y4YWZmYzIyZjZmNDJkMzQ2NSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE4OjIyOjQ2ICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGdpby90ZXN0cy9yZXNvdXJjZXMuYzogY29tbWVudCBvdXQgYSBidWlsZCBob3N0LW9u
bHkgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1naXJlcG9zaXRvcnktaW50cm9zcGVjdGlvbi1jb3JyZWN0bHktaW5zdGFsbC0uZ2lyLWZpLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naXJlcG9zaXRvcnkt
aW50cm9zcGVjdGlvbi1jb3JyZWN0bHktaW5zdGFsbC0uZ2lyLWZpLnBhdGNoCmluZGV4IDc2ZTVm
NTg3NDguLjdiZTljZDhiODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtZ2lyZXBvc2l0b3J5LWludHJvc3BlY3Rpb24tY29ycmVjdGx5LWluc3RhbGwt
Lmdpci1maS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LWdpcmVwb3NpdG9yeS1pbnRyb3NwZWN0aW9uLWNvcnJlY3RseS1pbnN0YWxsLS5naXItZmkucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRlNmJlNWQxNWU1ZDJmOGU0OTRkMjJhM2Q0OWI2MjMw
NjRmOWMxYTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYxYmVlZjVjMmQwOWZhZTNh
NWU1YTMxNGY5ODRjYjNmMjBhYmU3MzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVHVlLCAyMyBBcHIg
MjAyNCAxMToyNDozNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBnaXJlcG9zaXRvcnkvaW50cm9z
cGVjdGlvbjogY29ycmVjdGx5IGluc3RhbGwgLmdpciBmaWxlcyBpbnRvCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRl
c3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmlu
ZGV4IDJmODA1Mjk5ODcuLjNhOGQzNTk2YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13
ZWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVz
b24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAzZGMyZTc0MWUxOGNjYjc0MGU5OGViNGU4MDhmZjgzMTUzYjcwZTgzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMDRlYTI5ZjlmOTY4OTJhZGE4MWJkMGFjZmNlZjcwMTgz
MTM4MjI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24gY2xhbmcgYXMgd2VsbApAQCAt
MTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMjU2MDY4Ni4uNWM0NmQw
YiAxMDA2NDQKK2luZGV4IDI1N2FmYjUuLjVjYWE2ZTYgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWls
ZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0yMDI0LDcgKzIwMjQsNyBAQCBhdG9taWNkZWZpbmUg
PSAnJycKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8t
bm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRleCA4Mjk1NWRl
NjcxLi45YmUwNDk2MGFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0
aXZlLWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1t
ZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OTUyNWVlZGZiYmZlNGExNmZkZDBiMzQwYmMzZjI0Nzk0
MzFjN2Q1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNjNjODY1YWE5YTI0ZjMyMzBl
OGUyYmNiNWJjZTg4ZjE3OWM3ZTJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIw
MjMgMjI6Mjg6MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBl
bmFibGUgcGlkZmQgZmVhdHVyZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE0LDcgKzE0LDcgQEAgU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA1YzQ2ZDBiLi4yMjJjMWExIDEwMDY0
NAoraW5kZXggNWNhYTZlNi4uNjg4ZjIxNCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysg
Yi9tZXNvbi5idWlsZAogQEAgLTEwMjIsNyArMTAyMiw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNs
dWRlIDxzeXMvc3lzY2FsbC5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRv
b2xzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3Qt
aGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCmluZGV4IGE1MWMx
ODZiMDAuLjRkZWMyNTJjMWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29s
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5v
dC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGU2Nzg0YmE0M2FmODNlMjI1NTY5MjE3ODZjOGYxNWU0Y2QyNDYyOTggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRjN2YwOWM0ZjUyNjM4YTcwNzY4YzUyOGQxODZk
YTZmODNkZWRjOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMyBPY3QgMjAxNyAxMDo0
NTo1NSArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgcHl0aG9uIHBhdGgg
aW50byB2YXJpb3VzIHRvb2xzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCBkNmU5MDE5ZjM5Li5hMWZmMTk4
YWE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0
ZS1tb2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3Jl
bG9jYXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ3ZWEyNTc2YTEzZDVi
Yzg2NjkyYjRiYThjYjRhOGYyZmQzOGM2Y2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDAxMzNhZWFiZDM3YTkxMzc3MjJhYmQ4NjAzOWQ3ZDA3OTdiNTg5NmYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0
ZTogRnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGli
LTIuMDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRz
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVv
dXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2gKaW5kZXggYjFjNjJjYzM5Yy4uMGY4YjUxMjk0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNjgyZDhhNjE2Y2ExMTFjMGU0NWM4YTljYjAyZTk5MmU2M2M2OTU4NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWM3NWY1ZDkyMDZlNTJlZWM2NGZlZjBkYjRjZDkxYjU4
YTc2NGM5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIgMjAyNCAxNjoyNzowOSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5kaW5nIHRlc3QKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODAuMC5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjgwLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODAuMi5i
YgppbmRleCBlMjI4MTBhNTViLi5lZjgwY2M0N2NmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjgwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjBfMi44MC4yLmJiCkBAIC0xICsxLDIgQEAKIHJlcXVpcmUgZ2xpYi5p
bmMKKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwppbmRleCAxYTk3YTBkMDJhLi5mYmQy
YjE4Njg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwpAQCAtMjMzLDcgKzIzMyw3
IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVs
ZXMucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vMDAwMS1t
ZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNo
IFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjgyMjhhOTJmOTJhNDEyMTYwYjEzOWFlNjhiNjM0NWJkMjhmMjQ0MzRhN2I1YWYxNTBlYmUy
MWZmNTg3YTU2MWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjljZmI2ZjdhNWJkNWIzMTIzOGZk
NWQ1NmRmMjI2YjJkZGE1ZWEzNzYxMTQ3NWJmODlmNmEwZjk0MDBmZThiZCIKIAogIyBGaW5kIGFu
eSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRo
ZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJB
X09FTUVTT04uCi0tIAoyLjQ0LjAKCg==

--===============7370721247894959671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-76d264659776dfba217ab40b8800dd734f18c9e2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:76d264659776dfba217ab40b8800dd734f18c9e2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 637 Local 508 Mirrors 0 Missed 129 Current 405 (79% match, 87% complete)
Removing 6 stale sstate objects for arch x86_64...done.
Removing 25 stale sstate objects for arch qemux86_64...done.
Removing 27 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 481 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_package_setscene)
NOTE: Running setscene task 492 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 544 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 585 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 595 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 616 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 626 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 635 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 636 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 676 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 680 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 710 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 715 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 787 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 788 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 809 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 870 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 938 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 947 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 950 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 994 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 999 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1010 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1020 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 440 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa)
NOTE: Running setscene task 1022 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1027 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1031 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1035 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_recipe_qa: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 988 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_unpack: Started
NOTE: Load average limiting set to False as load average: 1.48907470703125 - using 1/16 bitbake threads
NOTE: Running task 1100 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_fetch)
NOTE: Running task 1107 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_recipe_qa)
NOTE: Running task 1109 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: Running task 1110 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1158 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_write_config)
NOTE: Running task 1227 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 1269 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1281 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 1282 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa)
NOTE: Running task 1286 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1304 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1341 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1366 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Started
NOTE: Running task 1367 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: Running task 1368 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_recipe_qa: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1369 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1370 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_write_config: Succeeded
NOTE: Running task 1371 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: Running task 1377 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Succeeded
NOTE: Running task 1378 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1379 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Started
NOTE: Running task 1380 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 1399 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: Running task 1486 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_fetch)
NOTE: Running task 1487 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1514 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: Running task 1521 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: Running task 1522 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_fetch: Started
NOTE: Running task 1523 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1524 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1545 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1562 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_unpack)
NOTE: Running task 1563 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: Running task 1565 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1573 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: Running task 1576 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_recipe_qa unihash changed to 39e93b8efb60091ea33094503e83c8016ed675ec5f893e028a07017970c5e775
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_fetch)
NOTE: Running task 1579 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1580 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: Running task 1581 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: Running task 1585 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_patch)
NOTE: Running task 1588 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_patch)
NOTE: Running task 1589 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: Running task 1592 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1593 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: Running task 1594 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: Running task 1634 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1658 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_unpack)
NOTE: Running task 1679 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1704 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1727 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_write_config)
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Started
NOTE: recipe libxcb-1.16.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
WARNING: glib-2.0-initial-1_2.80.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz
Cleaning and trying again.
WARNING: glib-2.0-initial-1_2.80.0-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz_bad-checksum_8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1730 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1731 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1750 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Started
NOTE: Running task 1751 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe libxcb-1.16.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Succeeded
NOTE: Running task 1786 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_warn_musl)
NOTE: Running task 1787 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_write_config)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1865 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: Running task 1900 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: Running task 1901 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running task 1902 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1903 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1979 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running task 1999 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 2004 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2005 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 2006 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2016 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 2028 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx)
NOTE: Running task 2058 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2133 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: Running task 2145 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_fetch)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 2146 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 2147 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_create_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1c0125cf2439354bc5b9d2d86d0c011da603c250ea3e952ab1960cc5517f8e0e
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 2179 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 2196 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2197 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: Running task 2228 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
WARNING: glib-2.0-initial-1_2.80.0-r0 do_fetch: Checksum failure encountered with download of https://download.gnome.org/sources//glib/2.80/glib-2.80.0.tar.xz - will attempt other sources if available
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 2297 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_fetch)
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 2298 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 2300 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Started
NOTE: Running task 2316 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_write_config)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 2366 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: Running task 2381 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Started
NOTE: Running task 2409 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_write_config)
NOTE: Running task 2410 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
WARNING: glib-2.0-initial-1_2.80.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz
Cleaning and trying again.
WARNING: glib-2.0-initial-1_2.80.0-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz_bad-checksum_8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Started
NOTE: Running task 2492 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: Running task 2536 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Started
NOTE: Running task 2537 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2539 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2540 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2541 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx)
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2546 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 2547 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2549 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_lic)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2550 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: Running task 2551 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_patch)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_255.4-r0: task do_patch: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2553 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: recipe systemd-1_255.4-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_fetch: Failed
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2555 tasks of which 2441 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515072017.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515072017.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-initial-1_2.80.0-r0 do_fetch: Checksum failure fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.0.tar.xz
ERROR: glib-2.0-initial-1_2.80.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.0.tar.xz\' has sha256 checksum \'8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d\' when \'b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.gnome.org/sources//glib/2.80/glib-2.80.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glib-2.0-initial/2.80.0/temp/log.do_fetch.3704993
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_fetch) failed with exit code '1'

--===============7370721247894959671==--

