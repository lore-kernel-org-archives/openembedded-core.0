Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC86EC54EF4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20154.1708018344216714875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g8SMRIKA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ao8USwVo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd39cfb-8384ef46-d4f4-41e8-851e-9d7600ba5b5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ulWCSBzCU4MP8idNFfmv8g6Cqy/kfhyUhl/SRy4zeiQ=;
	b=g8SMRIKAyw4XioMdCkDLvEyu3ZbvowN7QQ3MIDFEuya9FmQkVQJzt6TKtJhKQiXN
	OYNHeC5n9d98O5xzCZ7wTe8rOCSx3qku7zc4P35jKjHX7Sih+jNQbeSlsoDvUUfTtrl
	f20QWVURLwTPHVRa50gMO9QUDt7kskcb/gDzhsYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ulWCSBzCU4MP8idNFfmv8g6Cqy/kfhyUhl/SRy4zeiQ=;
	b=Ao8USwVos9WRmeiPUjOMsfjSM9vKdUbyWi6AXaHGkAKKJ4JL953zE2KYRv50U0FC
	xxiMDIWG8qVdL/MrsOlCOciXng9BrGz58A2+Qh9Vdbl7NVK6QdWglqtZxj4RBj/Ak7T
	xN3JuHm4kHzCavG5JadRApfr8jIFAUjIAlurkNXM=
Content-Type: multipart/mixed; boundary="===============1802451561156970711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.78.4 FAILED
Message-ID: <0101018dadd39cfb-8384ef46-d4f4-41e8-851e-9d7600ba5b5d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195565

--===============1802451561156970711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.78.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.78.3-2.78.4.patch
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
From 31249503e6a91d548991c791a1a1996e08cead01 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:01:31 +0000
Subject: [PATCH] glib-2.0: upgrade 2.78.3 -> 2.78.4

---
 ...t-write-bindir-into-pkg-config-files.patch |  2 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...-correctly-when-building-with-mingw3.patch |  4 ++--
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 ++--
 ...ot-enable-pidfd-features-on-native-g.patch |  4 ++--
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 14 ++++++-------
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} |  5 +++--
 13 files changed, 22 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 0e5f371cb5..ab37ea4809 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From cf7df91cc8c3b4811235ef8aec144c5f0cf90bdb Mon Sep 17 00:00:00 2001
+From adeda9fffb7e27dcdede443fffecec243874a696 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 1254466063..15e9208720 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From b907a6681c4c24e5d3745538d9fcd471cf1c4c4a Mon Sep 17 00:00:00 2001
+From f24506838dd89e11514fe272bf9f06c8a170f432 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 50d369c24e..7a4fae8f30 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 6e2ddcb5465d10618345b12e0b4471ead0f14304 Mon Sep 17 00:00:00 2001
+From bf65bc4317e18babafd5d8d0f7deb544b0dcfea2 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index f810574d97..80fa9af595 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c8c223045821cac97f798cfa63f19853621a8a2a Mon Sep 17 00:00:00 2001
+From 543a25f3d7925134e4e498f94b8b67ab2269850f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index e1d2fb0e54..3dbc7c9d53 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From bafde4eedc0a22b45e73ee6183b9a11393a1e400 Mon Sep 17 00:00:00 2001
+From fdd06afcf6d68f56da1158231bd602582be844de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -66,7 +66,7 @@ index d80c86e..5329cda 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index f7e936e..122f8b5 100644
+index 813c9b7..6ee775e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index e4c2f77459..2aa570b19f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f05b9418c88bbb83c08b57cc5529b006f26fff4 Mon Sep 17 00:00:00 2001
+From f67497ce754f24261c2048fb95b10804cc48426a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 071e4a7c4d..d12cbd1544 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 17d718640ae6f953e5eea714c1bd64eeb6e4799f Mon Sep 17 00:00:00 2001
+From 285a237d902dec6b681e0bc34235f54a2a175bda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 122f8b5..f055079 100644
+index 6ee775e..8bc5fa7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1938,7 +1938,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e03f9a3c84..d7afcff782 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 7865d698b5d392aac3a3d32e9ebd5fea45017d15 Mon Sep 17 00:00:00 2001
+From 8398cdc2032ff450761b119d9a063460c0a04ffa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index f055079..77d78aa 100644
+index 8bc5fa7..df1fa60 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4b75167da6..3d56ff6326 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 53bcd4b6cd3fe3fe4246914462e6724761eecf51 Mon Sep 17 00:00:00 2001
+From 47484aae141645ace3278e8b49792106af57c130 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
index f9dfc5bb05..558afcff3a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
@@ -1,4 +1,4 @@
-From df7506918efc8748dac8b8398021e1b79d694ba4 Mon Sep 17 00:00:00 2001
+From abc54fa304e1ef73be75d0e011e989eb7ecd9e3a Mon Sep 17 00:00:00 2001
 From: Philip Withnall <philip@tecnocode.co.uk>
 Date: Tue, 23 Jan 2024 11:16:52 +0000
 Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
@@ -14,6 +14,7 @@ https://bugzilla.yoctoproject.org/show_bug.cgi?id=15362
 
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 ---
  gio/tests/memory-monitor-dbus.py.in          | 64 +++++++++++++-------
  gio/tests/memory-monitor-portal.py.in        | 54 ++++++++++-------
@@ -22,7 +23,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  4 files changed, 113 insertions(+), 74 deletions(-)
 
 diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-monitor-dbus.py.in
-index bf3291847..7aae01e70 100755
+index bf32918..7aae01e 100755
 --- a/gio/tests/memory-monitor-dbus.py.in
 +++ b/gio/tests/memory-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -130,7 +131,7 @@ index bf3291847..7aae01e70 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-monitor-portal.py.in
-index 748cee850..f570508f9 100755
+index 748cee8..f570508 100755
 --- a/gio/tests/memory-monitor-portal.py.in
 +++ b/gio/tests/memory-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -222,7 +223,7 @@ index 748cee850..f570508f9 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/power-profile-monitor-dbus.py.in
-index 06e594f4a..f955afc80 100755
+index 06e594f..f955afc 100755
 --- a/gio/tests/power-profile-monitor-dbus.py.in
 +++ b/gio/tests/power-profile-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -295,7 +296,7 @@ index 06e594f4a..f955afc80 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/power-profile-monitor-portal.py.in
-index 09e9a450d..ad2abf621 100755
+index 09e9a45..ad2abf6 100755
 --- a/gio/tests/power-profile-monitor-portal.py.in
 +++ b/gio/tests/power-profile-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -359,6 +360,3 @@ index 09e9a450d..ad2abf621 100755
  
          def test_power_profile_power_saver_enabled_portal_default(self):
              '''power-saver-enabled property default value'''
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch b/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
deleted file mode 100644
index f56c2b8564..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-docs/reference: depend on a native gtk-doc
-
-In a cross-compiled environment we don't need a target gtk-doc, but a
-native gtk-doc.
-
-Upstream-Status: Backport [f3ff370d1b24f8afb51cd4e865593d5b678188a9]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/docs/reference/meson.build b/docs/reference/meson.build
-index c417ffecb..67c1dda56 100644
---- a/docs/reference/meson.build
-+++ b/docs/reference/meson.build
-@@ -42,7 +42,7 @@ ignore_decorators = '|'.join(ignore_decorators)
- if get_option('gtk_doc')
-   # Check we have the minimum gtk-doc version required. Older versions won't
-   # generate correct documentation.
--  dependency('gtk-doc', version : '>=1.32.1',
-+  dependency('gtk-doc', version : '>=1.32.1', native: true,
-     fallback : ['gtk-doc', 'dummy_dep'],
-     default_options : ['tests=false'])
- 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 95a73298d8..5f69bb124d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 03a069cb8066d3e8ef72a43f7b1db5c9625e9cc2 Mon Sep 17 00:00:00 2001
+From 90f06568444ea43da56efd62a805af89849468f9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
index 42814ba544..d5932d74f8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -15,13 +15,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://memory-monitor.patch \
-           file://native-gtkdoc.patch \
+           file://relocate-modules.patch \
+           file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "609801dd373796e515972bf95fc0b2daa44545481ee2f465c4f204d224b2bc21"
+SRC_URI[sha256sum] = "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.42.0


--===============1802451561156970711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.78.3-2.78.4.patch"

RnJvbSAzMTI0OTUwM2U2YTkxZDU0ODk5MWM3OTFhMWExOTk2ZTA4Y2VhZDAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6MDE6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMDogdXBncmFkZSAyLjc4LjMgLT4gMi43OC40CgotLS0KIC4uLnQtd3JpdGUtYmluZGly
LWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCB8ICAyICstCiAuLi4wMDAxLUZpeC1EQVRBRElS
TkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggfCAgMiArLQogLi4uLWdpby1xdWVyeW1vZHVsZXMt
YXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIHwgIDIgKy0KIC4uLm5nLWFib3V0LWRlcHJlY2F0ZWQt
cGF0aHMtaW4tc2NoZW1hcy5wYXRjaCB8ICAyICstCiAuLi4tY29ycmVjdGx5LXdoZW4tYnVpbGRp
bmctd2l0aC1taW5ndzMucGF0Y2ggfCAgNCArKy0tCiAuLi5jZXMuYy1jb21tZW50LW91dC1hLWJ1
aWxkLWhvc3Qtb25seS0ucGF0Y2ggfCAgMiArLQogLi4ub24tUnVuLWF0b21pY3MtdGVzdC1vbi1j
bGFuZy1hcy13ZWxsLnBhdGNoIHwgIDQgKystLQogLi4ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVz
LW9uLW5hdGl2ZS1nLnBhdGNoIHwgIDQgKystLQogLi4uZGNvZGUtcHl0aG9uLXBhdGgtaW50by12
YXJpb3VzLXRvb2xzLnBhdGNoIHwgIDIgKy0KIC4uLi9nbGliLTIuMC9nbGliLTIuMC9tZW1vcnkt
bW9uaXRvci5wYXRjaCAgICB8IDE0ICsrKysrKy0tLS0tLS0KIC4uLi9nbGliLTIuMC9nbGliLTIu
MC9uYXRpdmUtZ3RrZG9jLnBhdGNoICAgICB8IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9n
bGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoICB8ICAyICstCiAuLi57Z2xp
Yi0yLjBfMi43OC4zLmJiID0+IGdsaWItMi4wXzIuNzguNC5iYn0gfCAgNSArKystLQogMTMgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbmF0aXZlLWd0a2Rv
Yy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjc4
LjMuYmIgPT4gZ2xpYi0yLjBfMi43OC40LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRv
LXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LTIuMC8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNo
CmluZGV4IDBlNWYzNzFjYjUuLmFiMzdlYTQ4MDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjAvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gY2Y3ZGY5MWNjOGMzYjQ4MTEyMzVlZjhhZWMxNDRjNWYwY2Y5
MGJkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWRlZGE5ZmZmYjdlMjdkY2RlZGU0
NDNmZmZlY2VjMjQzODc0YTY5NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxNSBGZWIg
MjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgd3JpdGUgJGJpbmRp
ciBpbnRvIHBrZy1jb25maWcgZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRml4LURBVEFESVJO
QU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAppbmRleCAxMjU0NDY2MDYzLi4xNWU5MjA4NzIwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLUZpeC1E
QVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiOTA3YTY2ODFjNGMyNGU1ZDM3NDU1MzhkOWZjZDQ3
MWNmMWM0YzRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMjQ1MDY4MzhkZDg5ZTEx
NTE0ZmUyNzJiZjlmMDZjOGExNzBmNDMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTUgTWFyIDIwMTQgMjI6
NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IERBVEFESVJOQU1FIG9uIHVjbGliYy9M
aW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAw
MS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1v
ZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4IDUwZDM2OWMyNGUuLjdhNGZhZThm
MzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEt
SW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5
bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZl
MmRkY2I1NDY1ZDEwNjE4MzQ1YjEyZTBiNDQ3MWVhZDBmMTQzMDQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGJmNjViYzQzMTdlMThiYWJhZmQ1ZDhkMGY3ZGViNTQ0YjBkY2ZlYTIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29u
ZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9HUkFN
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVJl
bW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVJlbW92ZS10aGUtd2Fy
bmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKaW5kZXggZjgxMDU3
NGQ5Ny4uODBmYTlhZjU5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1p
bi1zY2hlbWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
LzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1h
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzhjMjIzMDQ1ODIxY2FjOTdmNzk4Y2ZhNjNm
MTk4NTM2MjFhOGEyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTQzYTI1ZjNkNzky
NTEzNGU0ZTQ5OGY5NGI4YjY3YWIyMjY5ODUwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJp
LCAxMiBKdW4gMjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdGhl
IHdhcm5pbmcgYWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hlbWFzCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVNldC1ob3N0X21hY2hpbmUt
Y29ycmVjdGx5LXdoZW4tYnVpbGRpbmctd2l0aC1taW5ndzMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVNldC1ob3N0X21hY2hpbmUtY29ycmVjdGx5LXdo
ZW4tYnVpbGRpbmctd2l0aC1taW5ndzMucGF0Y2gKaW5kZXggZTFkMmZiMGU1NC4uM2RiYzdjOWQ1
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1T
ZXQtaG9zdF9tYWNoaW5lLWNvcnJlY3RseS13aGVuLWJ1aWxkaW5nLXdpdGgtbWluZ3czLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtU2V0LWhvc3Rf
bWFjaGluZS1jb3JyZWN0bHktd2hlbi1idWlsZGluZy13aXRoLW1pbmd3My5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYmFmZGU0ZWVkYzBhMjJiNDVlNzNlZTYxODNiOWExMTM5M2ExZTQwMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmRkMDZhZmNmNmQ2OGY1NmRhMTE1ODIzMWJk
NjAyNTgyYmU4NDRkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAxMyBGZWIgMjAxOSAx
NTozMjowNSArMDEwMAogU3ViamVjdDogW1BBVENIXSBTZXQgaG9zdF9tYWNoaW5lIGNvcnJlY3Rs
eSB3aGVuIGJ1aWxkaW5nIHdpdGggbWluZ3czMgpAQCAtNjYsNyArNjYsNyBAQCBpbmRleCBkODBj
ODZlLi41MzI5Y2RhIDEwMDY0NAogICAgICBnbGliX3Rlc3RzICs9IHsKICAgICAgICAnZ3BvbGwn
IDogewogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGY3ZTkz
NmUuLjEyMmY4YjUgMTAwNjQ0CitpbmRleCA4MTNjOWI3Li42ZWU3NzVlIDEwMDY0NAogLS0tIGEv
bWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNTQsNiArNTQsOSBAQCBlbHNlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWdpby10
ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWdpby10ZXN0cy1yZXNvdXJj
ZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKaW5kZXggZTRjMmY3NzQ1
OS4uMmFhNTcwYjE5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi0yLjAvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0
LW9ubHktLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAw
MDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2YwNWI5NDE4Yzg4YmJiODNjMDhiNTdjYzU1Mjli
MDA2ZjI2ZmZmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjY3NDk3Y2U3NTRmMjQy
NjFjMjA0OGZiOTViMTA4MDRjYzQ4NDI2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA4
IEphbiAyMDIwIDE4OjIyOjQ2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdpby90ZXN0cy9yZXNv
dXJjZXMuYzogY29tbWVudCBvdXQgYSBidWlsZCBob3N0LW9ubHkgdGVzdApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1tZXNvbi1SdW4tYXRvbWlj
cy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5w
YXRjaAppbmRleCAwNzFlNGE3YzRkLi5kMTJjYmQxNTQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24t
Y2xhbmctYXMtd2VsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMTdkNzE4NjQwYWU2Zjk1M2U1ZWVhNzE0YzFiZDY0ZWViNmU0
Nzk5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjg1YTIzN2Q5MDJkZWM2YjY4MWUw
YmMzNDIzNWY1NGEyYTE3NWJkYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEyIE9jdCAyMDE5IDE3OjQ2OjI2
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBSdW4gYXRvbWljcyB0ZXN0IG9uIGNsYW5n
IGFzIHdlbGwKQEAgLTE1LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDEy
MmY4YjUuLmYwNTUwNzkgMTAwNjQ0CitpbmRleCA2ZWU3NzVlLi44YmM1ZmE3IDEwMDY0NAogLS0t
IGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTkzOCw3ICsxOTM4LDcgQEAg
YXRvbWljZGVmaW5lID0gJycnCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMt
b24tbmF0aXZlLWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8w
MDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcu
cGF0Y2gKaW5kZXggZTAzZjlhM2M4NC4uZDdhZmNmZjc4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxl
LXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1m
ZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzg2NWQ2OThi
NWQzOTJhYWMzYTNkMzJlOWViZDVmZWE0NTAxN2QxNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODM5OGNkYzIwMzJmZjQ1MDc2MWIxMTlkOWEwNjM0NjBjMGEwNGZmYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXgu
ZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIzIDIyOjI4OjI3ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIG1lc29uLmJ1aWxkOiBkbyBub3QgZW5hYmxlIHBpZGZkIGZlYXR1cmVzIG9uIG5hdGl2ZSBn
bGliCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5k
ZXggZjA1NTA3OS4uNzdkNzhhYSAxMDA2NDQKK2luZGV4IDhiYzVmYTcuLmRmMWZhNjAgMTAwNjQ0
CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC05ODEsNyArOTgxLDgg
QEAgaWYgY2MubGlua3MoJycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDEwLURvLW5vdC1oYXJkY29kZS1w
eXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLTIuMC8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZh
cmlvdXMtdG9vbHMucGF0Y2gKaW5kZXggNGI3NTE2N2RhNi4uM2Q1NmZmNjMyNiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAxMC1Eby1ub3QtaGFyZGNv
ZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRo
LWludG8tdmFyaW91cy10b29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTNiY2Q0YjZj
ZDNmZTNmZTQyNDY5MTQ0NjJlNjcyNDc2MWVlY2Y1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNDc0ODRhYWUxNDE2NDVhY2UzMjc4ZThiNDk3OTIxMDZhZjU3YzEzMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogVHVlLCAzIE9jdCAyMDE3IDEwOjQ1OjU1ICswMzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIERvIG5vdCBoYXJkY29kZSBweXRob24gcGF0aCBpbnRvIHZhcmlvdXMgdG9vbHMKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL21lbW9yeS1tb25p
dG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbWVtb3J5LW1v
bml0b3IucGF0Y2gKaW5kZXggZjlkZmM1YmIwNS4uNTU4YWZjZmYzYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbWVtb3J5LW1vbml0b3IucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbWVtb3J5LW1vbml0b3IucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRmNzUwNjkxOGVmYzg3NDhkYWM4YjgzOTgwMjFlMWI3
OWQ2OTRiYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFiYzU0ZmEzMDRlMWVmNzNi
ZTc1ZDBlMDExZTk4OWViN2VjZDllM2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQ
aGlsaXAgV2l0aG5hbGwgPHBoaWxpcEB0ZWNub2NvZGUuY28udWs+CiBEYXRlOiBUdWUsIDIzIEph
biAyMDI0IDExOjE2OjUyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1lcmdlIGJyYW5jaCAnMjg4
Ny1tZW1vcnktbW9uaXRvci10ZXN0cycgaW50byAnbWFpbicKQEAgLTE0LDYgKzE0LDcgQEAgaHR0
cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNTM2MgogCiBV
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0CiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4KKwogLS0tCiAgZ2lvL3Rlc3RzL21lbW9yeS1tb25pdG9yLWRidXMu
cHkuaW4gICAgICAgICAgfCA2NCArKysrKysrKysrKysrLS0tLS0tLQogIGdpby90ZXN0cy9tZW1v
cnktbW9uaXRvci1wb3J0YWwucHkuaW4gICAgICAgIHwgNTQgKysrKysrKysrKy0tLS0tLS0KQEAg
LTIyLDcgKzIzLDcgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+CiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItZGJ1cy5weS5pbiBi
L2dpby90ZXN0cy9tZW1vcnktbW9uaXRvci1kYnVzLnB5LmluCi1pbmRleCBiZjMyOTE4NDcuLjdh
YWUwMWU3MCAxMDA3NTUKK2luZGV4IGJmMzI5MTguLjdhYWUwMWUgMTAwNzU1CiAtLS0gYS9naW8v
dGVzdHMvbWVtb3J5LW1vbml0b3ItZGJ1cy5weS5pbgogKysrIGIvZ2lvL3Rlc3RzL21lbW9yeS1t
b25pdG9yLWRidXMucHkuaW4KIEBAIC0xNiw3ICsxNiw2IEBAIGltcG9ydCBzeXMKQEAgLTEzMCw3
ICsxMzEsNyBAQCBpbmRleCBiZjMyOTE4NDcuLjdhYWUwMWU3MCAxMDA3NTUKICBleGNlcHQgSW1w
b3J0RXJyb3IgYXMgZToKICAgICAgQHVuaXR0ZXN0LnNraXAoIkNhbm5vdCBpbXBvcnQgJXMiICUg
ZS5uYW1lKQogZGlmZiAtLWdpdCBhL2dpby90ZXN0cy9tZW1vcnktbW9uaXRvci1wb3J0YWwucHku
aW4gYi9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCi1pbmRleCA3NDhjZWU4
NTAuLmY1NzA1MDhmOSAxMDA3NTUKK2luZGV4IDc0OGNlZTguLmY1NzA1MDggMTAwNzU1CiAtLS0g
YS9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCiArKysgYi9naW8vdGVzdHMv
bWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCiBAQCAtMTYsNyArMTYsNiBAQCBpbXBvcnQgc3lz
CkBAIC0yMjIsNyArMjIzLDcgQEAgaW5kZXggNzQ4Y2VlODUwLi5mNTcwNTA4ZjkgMTAwNzU1CiAg
ZXhjZXB0IEltcG9ydEVycm9yIGFzIGU6CiAgICAgIEB1bml0dGVzdC5za2lwKCJDYW5ub3QgaW1w
b3J0ICVzIiAlIGUubmFtZSkKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1t
b25pdG9yLWRidXMucHkuaW4gYi9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9yLWRidXMu
cHkuaW4KLWluZGV4IDA2ZTU5NGY0YS4uZjk1NWFmYzgwIDEwMDc1NQoraW5kZXggMDZlNTk0Zi4u
Zjk1NWFmYyAxMDA3NTUKIC0tLSBhL2dpby90ZXN0cy9wb3dlci1wcm9maWxlLW1vbml0b3ItZGJ1
cy5weS5pbgogKysrIGIvZ2lvL3Rlc3RzL3Bvd2VyLXByb2ZpbGUtbW9uaXRvci1kYnVzLnB5Lmlu
CiBAQCAtMTYsNyArMTYsNiBAQCBpbXBvcnQgc3lzCkBAIC0yOTUsNyArMjk2LDcgQEAgaW5kZXgg
MDZlNTk0ZjRhLi5mOTU1YWZjODAgMTAwNzU1CiAgZXhjZXB0IEltcG9ydEVycm9yIGFzIGU6CiAg
ICAgIEB1bml0dGVzdC5za2lwKCJDYW5ub3QgaW1wb3J0ICVzIiAlIGUubmFtZSkKIGRpZmYgLS1n
aXQgYS9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9yLXBvcnRhbC5weS5pbiBiL2dpby90
ZXN0cy9wb3dlci1wcm9maWxlLW1vbml0b3ItcG9ydGFsLnB5LmluCi1pbmRleCAwOWU5YTQ1MGQu
LmFkMmFiZjYyMSAxMDA3NTUKK2luZGV4IDA5ZTlhNDUuLmFkMmFiZjYgMTAwNzU1CiAtLS0gYS9n
aW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9yLXBvcnRhbC5weS5pbgogKysrIGIvZ2lvL3Rl
c3RzL3Bvd2VyLXByb2ZpbGUtbW9uaXRvci1wb3J0YWwucHkuaW4KIEBAIC0xNiw3ICsxNiw2IEBA
IGltcG9ydCBzeXMKQEAgLTM1OSw2ICszNjAsMyBAQCBpbmRleCAwOWU5YTQ1MGQuLmFkMmFiZjYy
MSAxMDA3NTUKICAKICAgICAgICAgIGRlZiB0ZXN0X3Bvd2VyX3Byb2ZpbGVfcG93ZXJfc2F2ZXJf
ZW5hYmxlZF9wb3J0YWxfZGVmYXVsdChzZWxmKToKICAgICAgICAgICAgICAnJydwb3dlci1zYXZl
ci1lbmFibGVkIHByb3BlcnR5IGRlZmF1bHQgdmFsdWUnJycKLS0tIAotMi4zNC4xCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL25hdGl2ZS1ndGtkb2Mu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9uYXRpdmUtZ3RrZG9j
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmNTZjMmI4NTY0Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL25hdGl2ZS1ndGtk
b2MucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyMSArMCwwIEBACi1kb2NzL3JlZmVyZW5jZTog
ZGVwZW5kIG9uIGEgbmF0aXZlIGd0ay1kb2MKLQotSW4gYSBjcm9zcy1jb21waWxlZCBlbnZpcm9u
bWVudCB3ZSBkb24ndCBuZWVkIGEgdGFyZ2V0IGd0ay1kb2MsIGJ1dCBhCi1uYXRpdmUgZ3RrLWRv
Yy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbZjNmZjM3MGQxYjI0ZjhhZmI1MWNkNGU4
NjU1OTNkNWI2NzgxODhhOV0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgotCi1kaWZmIC0tZ2l0IGEvZG9jcy9yZWZlcmVuY2UvbWVzb24uYnVpbGQgYi9k
b2NzL3JlZmVyZW5jZS9tZXNvbi5idWlsZAotaW5kZXggYzQxN2ZmZWNiLi42N2MxZGRhNTYgMTAw
NjQ0Ci0tLS0gYS9kb2NzL3JlZmVyZW5jZS9tZXNvbi5idWlsZAotKysrIGIvZG9jcy9yZWZlcmVu
Y2UvbWVzb24uYnVpbGQKLUBAIC00Miw3ICs0Miw3IEBAIGlnbm9yZV9kZWNvcmF0b3JzID0gJ3wn
LmpvaW4oaWdub3JlX2RlY29yYXRvcnMpCi0gaWYgZ2V0X29wdGlvbignZ3RrX2RvYycpCi0gICAj
IENoZWNrIHdlIGhhdmUgdGhlIG1pbmltdW0gZ3RrLWRvYyB2ZXJzaW9uIHJlcXVpcmVkLiBPbGRl
ciB2ZXJzaW9ucyB3b24ndAotICAgIyBnZW5lcmF0ZSBjb3JyZWN0IGRvY3VtZW50YXRpb24uCi0t
ICBkZXBlbmRlbmN5KCdndGstZG9jJywgdmVyc2lvbiA6ICc+PTEuMzIuMScsCi0rICBkZXBlbmRl
bmN5KCdndGstZG9jJywgdmVyc2lvbiA6ICc+PTEuMzIuMScsIG5hdGl2ZTogdHJ1ZSwKLSAgICAg
ZmFsbGJhY2sgOiBbJ2d0ay1kb2MnLCAnZHVtbXlfZGVwJ10sCi0gICAgIGRlZmF1bHRfb3B0aW9u
cyA6IFsndGVzdHM9ZmFsc2UnXSkKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IDk1YTczMjk4
ZDguLjVmNjliYjEyNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDNhMDY5Y2I4MDY2ZDNlOGVmNzJhNDNmN2IxZGI1Yzk2MjVlOWNjMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOTBmMDY1Njg0NDRlYTQzZGE1NmVmZDYyYTgwNWFmODk4NDk0Njhm
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJlY3Rvcnkg
Zm9yIG5hdGl2ZSBidWlsZHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuNzguMy5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
XzIuNzguNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc4LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzguNC5iYgppbmRleCA0MjgxNGJhNTQ0Li5kNTkzMmQ3
NGY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc4
LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43OC40LmJi
CkBAIC0xNSwxMyArMTUsMTQgQEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vZ2xpYi8ke1NI
UlRfVkVSfS9nbGliLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29u
LVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qt
b25seS0ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vbWVtb3J5LW1vbml0b3IucGF0Y2ggXAot
ICAgICAgICAgICBmaWxlOi8vbmF0aXZlLWd0a2RvYy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtbWVzb24u
YnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBcCiAg
ICAgICAgICAgICIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9j
YXRlLW1vZHVsZXMucGF0Y2ggXCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmls
ZTovLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRp
dmUtZy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI2MDk4MDFkZDM3Mzc5NmU1MTU5NzJiZjk1ZmMwYjJkYWE0NDU0NTQ4MWVl
MmY0NjVjNGYyMDRkMjI0YjJiYzIxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI0YjhlMDY3MmRj
YTEyMGNjMzJkMzk0YmNjYjg1ODQ0ZTczMmUwNGZlNzVkMThiYjA1NzNiMmRiYzc1NDhmNjMiCiAK
ICMgRmluZCBhbnkgbWVzb24gY3Jvc3MgZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQgYXJlIHJlbGV2
YW50IGZvciB0aGUgY3VycmVudAogIyBidWlsZCAodXNpbmcgc2l0ZWluZm8pIGFuZCBhZGQgdGhl
bSB0byBFWFRSQV9PRU1FU09OLgotLSAKMi40Mi4wCgo=

--===============1802451561156970711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1860 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a687f288a7d734c391a163c93a886fc3e3a89e8f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a687f288a7d734c391a163c93a886fc3e3a89e8f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 646 Local 525 Mirrors 0 Missed 121 Current 395 (81% match, 88% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 23 stale sstate objects for arch core2-64...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 24 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 476 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb:do_package_setscene)
NOTE: Running setscene task 484 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 541 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 579 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygobject-3.46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 595 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 601 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.25.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 603 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 606 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_package_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 608 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 611 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygobject-3.46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 633 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 638 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 649 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 664 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 667 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 668 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 699 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 705 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 709 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 710 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 718 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 723 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 762 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 782 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 806 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.41.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 925 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 928 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 930 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 933 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 984 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 989 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1001 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1002 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1003 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1009 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1011 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1013 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1024 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1030 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_create_spdx_setscene)
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 471 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa)
NOTE: Running task 474 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_fetch)
NOTE: Running task 488 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 494 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running setscene task 1034 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 500 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa)
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 503 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 513 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 524 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: Running task 525 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 530 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Started
NOTE: Running task 533 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1039 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa unihash changed to 0836d006d85e0230f18c6930dd85d1cd1975bc94d899c72e471504eb7e31d815
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa unihash changed to 9f2b0a367b7aea884e07bd2a093f616cdeee4523b774923289d12e5608cbe158
NOTE: Running setscene task 940 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 1235 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_unpack)
NOTE: Running task 1279 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 1302 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1313 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 1386 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: Running task 1406 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1407 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Started
NOTE: Running task 1473 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_fetch)
NOTE: Running task 1474 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_fetch)
NOTE: Running task 1501 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1507 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: Running task 1540 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_fetch)
NOTE: Running task 1545 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1553 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: Running task 1591 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: Running task 1592 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_fetch: Succeeded
NOTE: Running task 1593 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: Running task 1594 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: Running task 1595 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1596 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_unpack)
NOTE: Running task 1597 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 1598 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1599 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: Running task 1600 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1645 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1661 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1671 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1672 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1673 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1693 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 1694 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1698 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Started
NOTE: Running task 1699 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1702 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1704 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1705 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_write_config)
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Started
NOTE: Running task 1730 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: Running task 1767 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_warn_musl)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1768 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: Running task 1769 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Succeeded
NOTE: Running task 1771 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_write_config)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1898 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1899 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1909 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1978 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: Running task 1994 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Started
NOTE: Running task 2048 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 2051 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2121 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e455ceb04bee1ac2b6b79e3200c1dee8107e4af3ab4bac932d9e8577748d08ab
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 2134 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 2136 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_fetch)
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2137 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: Running task 2138 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: Running task 2149 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2169 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 2170 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2171 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 2183 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Started
NOTE: Running task 2214 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.25.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 2274 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: Running task 2283 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: Running task 2288 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_fetch)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_fetch: Succeeded
NOTE: Running task 2289 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: Running task 2290 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 2291 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 2293 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.25.1-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.25.1-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: Running task 2321 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: Running task 2322 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb:do_write_config)
NOTE: Running task 2327 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 2328 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: Running task 2329 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 2330 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_collect_spdx_deps)
NOTE: Running task 2378 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 2422 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_write_config)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.25.1-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2423 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: Running task 2424 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-pycairo-1.25.1-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycairo-1.25.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pygobject-3.46.0-r0: task do_write_config: Started
NOTE: Running task 2496 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2549 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.46.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 2552 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2553 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Succeeded
NOTE: Running task 2556 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2557 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_lic)
NOTE: recipe python3-pygobject-3.46.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2563 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_255.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_lic unihash changed to 87ddbd9f76a1eaf11478c68895d8b9d0fa644aced0f0362443108e9010f08a40
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2565 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_deploy_source_date_epoch unihash changed to 7cf92e5659104f00f0dd888e98f73b858caedd2238eea037cae66c619a6f4ed4
NOTE: recipe systemd-1_255.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2567 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Failed
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2568 tasks of which 2461 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215060056.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215060056.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glib-2.0-native-1_2.78.4-r0 do_patch: Applying patch 'relocate-modules.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/glib-2.78.4'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/temp/log.do_patch.1266838
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch) failed with exit code '1'

--===============1802451561156970711==--

