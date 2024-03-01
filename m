Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0812C54E5C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.36620.1709330716144369960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SVOXlVxh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hytt3t+j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dfc0cd2d3-d76cbe87-402a-463b-9b53-4ce34d022c77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1hIlBhSIpimlw4Tov3H3QSPNNVl8JmsjlPg2S0jMxgA=;
	b=SVOXlVxhxe4CvsuSP/dDTUD5skhbfXJ7gswhQ3ZPsWOtxGlQ1IVJtl6PHwPHrO7Y
	+EgAKPWPNjZoS7d+mH2nnWwlzH030xVZJrF9TjyDiKaE5GhqD5U1fNXYkmdCZ+letJD
	6d589GqXR5rL3jrinfueqkjbxuSuVu2Wi/15xa6k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1hIlBhSIpimlw4Tov3H3QSPNNVl8JmsjlPg2S0jMxgA=;
	b=Hytt3t+jUVAqnIX26ZUtQqwxkHTsGA70+Sfk84xf479cqb4dSwNCUR2l/K0WTjHD
	xl/YWlqZ2i2ZuyAIaRPC8LTvWCSXu6Sj3Ncsy1kp4gDc/78LLIFFaAcqttDEU2bROlh
	uSNwFchVMYjmC0VPua2BFrsMTSoHPbRYHBSVpLfo=
Content-Type: multipart/mixed; boundary="===============3979945687980949998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.78.4 FAILED
Message-ID: <0101018dfc0cd2d3-d76cbe87-402a-463b-9b53-4ce34d022c77-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196468

--===============3979945687980949998==
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
From ff19b3192f6fd679f7b080d3c0aa815ceae25e48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 10:48:47 +0000
Subject: [PATCH] glib-2.0: upgrade 2.78.3 -> 2.78.4

---
 ...t-write-bindir-into-pkg-config-files.patch |  3 +--
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  3 +--
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  3 +--
 ...ng-about-deprecated-paths-in-schemas.patch |  3 +--
 ...-correctly-when-building-with-mingw3.patch |  5 ++---
 ...deprecated-distutils-module-to-the-p.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  3 +--
 ...on-Run-atomics-test-on-clang-as-well.patch |  5 ++---
 ...ot-enable-pidfd-features-on-native-g.patch |  5 ++---
 ...dcode-python-path-into-various-tools.patch |  3 +--
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 13 +++++-------
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  3 +--
 ...{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} |  5 +++--
 14 files changed, 22 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 0e5f371cb5..8e6598fbef 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From cf7df91cc8c3b4811235ef8aec144c5f0cf90bdb Mon Sep 17 00:00:00 2001
+From e7077aa23bfcd31a8e72e39dc93ce4f854678376 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -9,7 +9,6 @@ rather than use target paths).
 
 Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/meson.build  | 16 ++++++++--------
  glib/meson.build |  6 +++---
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 1254466063..eb9dfdbcf9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From b907a6681c4c24e5d3745538d9fcd471cf1c4c4a Mon Sep 17 00:00:00 2001
+From 9a5d4bf65b658d744d610ee27ecd2ae65b14b158 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
@@ -8,7 +8,6 @@ based systems therefore lets set DATADIRNAME to "share".
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-
 ---
  m4macros/glib-gettext.m4 | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 50d369c24e..ad69f7ec65 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 6e2ddcb5465d10618345b12e0b4471ead0f14304 Mon Sep 17 00:00:00 2001
+From 4933aef791857a5aac650b60af800778658b875b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -8,7 +8,6 @@ renamer does not cope with library packages with files in ${bindir}
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
-
 ---
  gio/meson.build | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index f810574d97..0e3a62af6a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c8c223045821cac97f798cfa63f19853621a8a2a Mon Sep 17 00:00:00 2001
+From 8ae2e9c2a04e089306693a021149dc6b7d1bd679 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -9,7 +9,6 @@ messages, and meta/lib/oe/rootfs.py complaints about them.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/glib-compile-schemas.c | 13 -------------
  1 file changed, 13 deletions(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index e1d2fb0e54..32b4cea409 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,11 +1,10 @@
-From bafde4eedc0a22b45e73ee6183b9a11393a1e400 Mon Sep 17 00:00:00 2001
+From c0733f7a91dfe13152abc60c5a3064456b3e9d63 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/tests/meson.build  | 8 ++++----
  glib/tests/meson.build | 2 +-
@@ -66,7 +65,7 @@ index d80c86e..5329cda 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index f7e936e..122f8b5 100644
+index 813c9b7..6ee775e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
index 50368ed22c..b11c283e6d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
@@ -1,4 +1,4 @@
-From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 2001
+From a8eb944a10353403241608a084787f6efcbb2eb7 Mon Sep 17 00:00:00 2001
 From: Jordan Williams <jordan@jwillikers.com>
 Date: Fri, 1 Dec 2023 09:53:50 -0600
 Subject: [PATCH] Switch from the deprecated distutils module to the packaging
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index e4c2f77459..aee2986033 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f05b9418c88bbb83c08b57cc5529b006f26fff4 Mon Sep 17 00:00:00 2001
+From 878e51f82100c698236fda0e069e14ea9249350c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -8,7 +8,6 @@ not cross-compatible (hardcodes ld and objcopy).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/tests/resources.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 071e4a7c4d..0b10269114 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 17d718640ae6f953e5eea714c1bd64eeb6e4799f Mon Sep 17 00:00:00 2001
+From b4b523160ef550a53705fcc45ac6e10d086ce491 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -9,13 +9,12 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 122f8b5..f055079 100644
+index 6ee775e..8bc5fa7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1938,7 +1938,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e03f9a3c84..14dcb278e0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 7865d698b5d392aac3a3d32e9ebd5fea45017d15 Mon Sep 17 00:00:00 2001
+From 294f3e6e9a0a9f4733e85ed6810d1b743055370b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -9,13 +9,12 @@ where these features are not implemented.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  meson.build | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index f055079..77d78aa 100644
+index 8bc5fa7..df1fa60 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4b75167da6..6dff5179c7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,11 +1,10 @@
-From 53bcd4b6cd3fe3fe4246914462e6724761eecf51 Mon Sep 17 00:00:00 2001
+From 50636758c73e5e61212a8f801c6c602b8aab5ba7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
  gobject/glib-genmarshal.in             | 2 +-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
index f9dfc5bb05..4f38509da6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
@@ -1,4 +1,4 @@
-From df7506918efc8748dac8b8398021e1b79d694ba4 Mon Sep 17 00:00:00 2001
+From ce840b6b111e1e109e511f6833d6aa419e2b723a Mon Sep 17 00:00:00 2001
 From: Philip Withnall <philip@tecnocode.co.uk>
 Date: Tue, 23 Jan 2024 11:16:52 +0000
 Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
@@ -22,7 +22,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  4 files changed, 113 insertions(+), 74 deletions(-)
 
 diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-monitor-dbus.py.in
-index bf3291847..7aae01e70 100755
+index bf32918..7aae01e 100755
 --- a/gio/tests/memory-monitor-dbus.py.in
 +++ b/gio/tests/memory-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -130,7 +130,7 @@ index bf3291847..7aae01e70 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-monitor-portal.py.in
-index 748cee850..f570508f9 100755
+index 748cee8..f570508 100755
 --- a/gio/tests/memory-monitor-portal.py.in
 +++ b/gio/tests/memory-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -222,7 +222,7 @@ index 748cee850..f570508f9 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/power-profile-monitor-dbus.py.in
-index 06e594f4a..f955afc80 100755
+index 06e594f..f955afc 100755
 --- a/gio/tests/power-profile-monitor-dbus.py.in
 +++ b/gio/tests/power-profile-monitor-dbus.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -295,7 +295,7 @@ index 06e594f4a..f955afc80 100755
  except ImportError as e:
      @unittest.skip("Cannot import %s" % e.name)
 diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/power-profile-monitor-portal.py.in
-index 09e9a450d..ad2abf621 100755
+index 09e9a45..ad2abf6 100755
 --- a/gio/tests/power-profile-monitor-portal.py.in
 +++ b/gio/tests/power-profile-monitor-portal.py.in
 @@ -16,7 +16,6 @@ import sys
@@ -359,6 +359,3 @@ index 09e9a450d..ad2abf621 100755
  
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
index 95a73298d8..3e79bbf679 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 03a069cb8066d3e8ef72a43f7b1db5c9625e9cc2 Mon Sep 17 00:00:00 2001
+From f40e89b3852df37959606ee13b1a14ade81fa886 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,7 +13,6 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
  gio/giomodule.c | 7 -------
  1 file changed, 7 deletions(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
index 6c3e99c641..3139197100 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -16,13 +16,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
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


--===============3979945687980949998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-46d0ee928dff631e47c80933d60d07ab2b921282"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46d0ee928dff631e47c80933d60d07ab2b921282"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 425 Local 307 Mirrors 0 Missed 118 Current 616 (72% match, 88% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 24 stale sstate objects for arch qemux86_64...done.
Removing 47 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 730 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 771 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 772 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 773 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 774 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 778 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 780 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 818 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 837 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 864 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 872 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 875 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 886 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 890 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 906 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 951 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 957 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 958 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 959 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 960 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 969 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 975 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 978 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 986 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 994 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1003 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1015 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1018 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1020 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running task 457 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 474 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: Running task 480 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 487 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 490 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Started
NOTE: Running task 500 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 511 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: Running task 512 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running setscene task 1029 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1033 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.38.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1034 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 538 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Started
NOTE: Running task 539 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 544 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe perl-native-5.38.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: Running task 595 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 596 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_fetch)
NOTE: Running task 608 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 613 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: Running task 621 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_fetch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: Running task 625 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: Running task 627 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: Running task 630 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 649 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: Running task 650 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_write_config)
NOTE: Running task 656 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: Running task 660 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_warn_musl)
NOTE: Running task 661 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_fetch: Succeeded
NOTE: Running task 713 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 714 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: Running task 715 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: Running task 771 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 801 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 818 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1040 of 1041 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.33-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_unpack)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1041 of 1041 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Started
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: Running task 1515 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: Running task 1532 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_unpack)
NOTE: Running task 1563 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1610 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: Running task 1611 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 1693 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1694 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1703 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Started
NOTE: Running task 1770 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: Running task 1771 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_unpack)
NOTE: Running task 1777 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: Running task 1779 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Started
NOTE: Running task 1846 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1886 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1888 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1890 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1891 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe wayland-protocols-1.33-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1892 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_patch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1895 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1954 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe wayland-protocols-1.33-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 2093 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: Running task 2094 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: Running task 2132 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 2385 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 2493 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 2548 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: Running task 2549 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: Running task 2550 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: Running task 2554 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2558 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2563 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2564 of 2826 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Succeeded
NOTE: Running task 2565 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2566 of 2826 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_deploy_source_date_epoch unihash changed to 7cf92e5659104f00f0dd888e98f73b858caedd2238eea037cae66c619a6f4ed4
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_lic unihash changed to 87ddbd9f76a1eaf11478c68895d8b9d0fa644aced0f0362443108e9010f08a40
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Failed
NOTE: recipe qemu-native-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2566 tasks of which 2485 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301104758.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301104758.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glib-2.0-native-1_2.78.4-r0 do_patch: Applying patch 'relocate-modules.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/glib-2.78.4'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/temp/log.do_patch.900188
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch) failed with exit code '1'

--===============3979945687980949998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.78.3-2.78.4.patch"

RnJvbSBmZjE5YjMxOTJmNmZkNjc5ZjdiMDgwZDNjMGFhODE1Y2VhZTI1ZTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMDo0ODo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzguMyAtPiAyLjc4LjQKCi0tLQogLi4udC13cml0ZS1iaW5kaXIt
aW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoIHwgIDMgKy0tCiAuLi4wMDAxLUZpeC1EQVRBRElS
TkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggfCAgMyArLS0KIC4uLi1naW8tcXVlcnltb2R1bGVz
LWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaCB8ICAzICstLQogLi4ubmctYWJvdXQtZGVwcmVjYXRl
ZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDMgKy0tCiAuLi4tY29ycmVjdGx5LXdoZW4tYnVp
bGRpbmctd2l0aC1taW5ndzMucGF0Y2ggfCAgNSArKy0tLQogLi4uZGVwcmVjYXRlZC1kaXN0dXRp
bHMtbW9kdWxlLXRvLXRoZS1wLnBhdGNoIHwgIDIgKy0KIC4uLmNlcy5jLWNvbW1lbnQtb3V0LWEt
YnVpbGQtaG9zdC1vbmx5LS5wYXRjaCB8ICAzICstLQogLi4ub24tUnVuLWF0b21pY3MtdGVzdC1v
bi1jbGFuZy1hcy13ZWxsLnBhdGNoIHwgIDUgKystLS0KIC4uLm90LWVuYWJsZS1waWRmZC1mZWF0
dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCB8ICA1ICsrLS0tCiAuLi5kY29kZS1weXRob24tcGF0aC1p
bnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggfCAgMyArLS0KIC4uLi9nbGliLTIuMC9nbGliLTIuMC9t
ZW1vcnktbW9uaXRvci5wYXRjaCAgICB8IDEzICsrKysrLS0tLS0tLQogLi4uL2dsaWItMi4wL2ds
aWItMi4wL25hdGl2ZS1ndGtkb2MucGF0Y2ggICAgIHwgMjEgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggIHwgIDMgKy0tCiAu
Li57Z2xpYi0yLjBfMi43OC4zLmJiID0+IGdsaWItMi4wXzIuNzguNC5iYn0gfCAgNSArKystLQog
MTQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbmF0aXZl
LWd0a2RvYy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIu
MF8yLjc4LjMuYmIgPT4gZ2xpYi0yLjBfMi43OC40LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRp
ci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVz
LnBhdGNoCmluZGV4IDBlNWYzNzFjYjUuLjhlNjU5OGZiZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRv
LXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2Y3ZGY5MWNjOGMzYjQ4MTEyMzVlZjhhZWMxNDRj
NWYwY2Y5MGJkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTcwNzdhYTIzYmZjZDMx
YThlNzJlMzlkYzkzY2U0Zjg1NDY3ODM3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAx
NSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgd3JpdGUg
JGJpbmRpciBpbnRvIHBrZy1jb25maWcgZmlsZXMKQEAgLTksNyArOSw2IEBAIHJhdGhlciB0aGFu
IHVzZSB0YXJnZXQgcGF0aHMpLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3Vw
c3RyZWFtIHdhbnRzIHRoZSBwYXRocyBpbiAucGMgZmlsZXNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgZ2lvL21lc29u
LmJ1aWxkICB8IDE2ICsrKysrKysrLS0tLS0tLS0KICBnbGliL21lc29uLmJ1aWxkIHwgIDYgKysr
LS0tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAx
LUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgu
cGF0Y2gKaW5kZXggMTI1NDQ2NjA2My4uZWI5ZGZkYmNmOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJj
LUxpbnV4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAw
MDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYjkwN2E2NjgxYzRjMjRlNWQzNzQ1NTM4ZDlmY2Q0NzFjZjFjNGM0YSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWE1ZDRiZjY1YjY1OGQ3NDRkNjEwZWUyN2VjZDJhZTY1YjE0
YjE1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IE1hciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEZpeCBEQVRBRElSTkFNRSBvbiB1Y2xpYmMvTGludXgKQEAgLTgsNyArOCw2IEBA
IGJhc2VkIHN5c3RlbXMgdGhlcmVmb3JlIGxldHMgc2V0IERBVEFESVJOQU1FIHRvICJzaGFyZSIu
CiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBVcHN0cmVh
bS1TdGF0dXM6IFBlbmRpbmcKLQogLS0tCiAgbTRtYWNyb3MvZ2xpYi1nZXR0ZXh0Lm00IHwgNCAr
KysrCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVs
ZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFN
LnBhdGNoCmluZGV4IDUwZDM2OWMyNGUuLmFkNjlmN2VjNjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVz
LWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dS
QU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZlMmRkY2I1NDY1ZDEwNjE4MzQ1YjEyZTBi
NDQ3MWVhZDBmMTQzMDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ5MzNhZWY3OTE4
NTdhNWFhYzY1MGI2MGFmODAwNzc4NjU4Yjg3NWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogVHVl
LCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAogU3ViamVjdDogW1BBVENIXSBJbnN0YWxsIGdp
by1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9HUkFNCkBAIC04LDcgKzgsNiBAQCByZW5hbWVy
IGRvZXMgbm90IGNvcGUgd2l0aCBsaWJyYXJ5IHBhY2thZ2VzIHdpdGggZmlsZXMgaW4gJHtiaW5k
aXJ9CiAKIFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRl
bC5jb20+CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljXQotCiAt
LS0KICBnaW8vbWVzb24uYnVpbGQgfCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEt
UmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtUmVtb3ZlLXRoZS13
YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaAppbmRleCBmODEw
NTc0ZDk3Li4wZTNhNjJhZjZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhz
LWluLXNjaGVtYXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjAvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hl
bWFzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjOGMyMjMwNDU4MjFjYWM5N2Y3OThjZmE2
M2YxOTg1MzYyMWE4YTJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YWUyZTljMmEw
NGUwODkzMDY2OTNhMDIxMTQ5ZGM2YjdkMWJkNjc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBG
cmksIDEyIEp1biAyMDE1IDE3OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB0
aGUgd2FybmluZyBhYm91dCBkZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMKQEAgLTksNyArOSw2
IEBAIG1lc3NhZ2VzLCBhbmQgbWV0YS9saWIvb2Uvcm9vdGZzLnB5IGNvbXBsYWludHMgYWJvdXQg
dGhlbS4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgZ2lvL2ds
aWItY29tcGlsZS1zY2hlbWFzLmMgfCAxMyAtLS0tLS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQs
IDEzIGRlbGV0aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvMDAwMS1TZXQtaG9zdF9tYWNoaW5lLWNvcnJlY3RseS13aGVuLWJ1aWxkaW5nLXdp
dGgtbWluZ3czLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAw
MS1TZXQtaG9zdF9tYWNoaW5lLWNvcnJlY3RseS13aGVuLWJ1aWxkaW5nLXdpdGgtbWluZ3czLnBh
dGNoCmluZGV4IGUxZDJmYjBlNTQuLjMyYjRjZWE0MDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtU2V0LWhvc3RfbWFjaGluZS1jb3JyZWN0bHkt
d2hlbi1idWlsZGluZy13aXRoLW1pbmd3My5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLTIuMC8wMDAxLVNldC1ob3N0X21hY2hpbmUtY29ycmVjdGx5LXdoZW4tYnVp
bGRpbmctd2l0aC1taW5ndzMucGF0Y2gKQEAgLTEsMTEgKzEsMTAgQEAKLUZyb20gYmFmZGU0ZWVk
YzBhMjJiNDVlNzNlZTYxODNiOWExMTM5M2ExZTQwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYzA3MzNmN2E5MWRmZTEzMTUyYWJjNjBjNWEzMDY0NDU2YjNlOWQ2MyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAxMyBGZWIgMjAxOSAxNTozMjowNSArMDEwMAogU3ViamVjdDog
W1BBVENIXSBTZXQgaG9zdF9tYWNoaW5lIGNvcnJlY3RseSB3aGVuIGJ1aWxkaW5nIHdpdGggbWlu
Z3czMgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNd
CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KLQogLS0tCiAgZ2lvL3Rlc3RzL21lc29uLmJ1aWxkICB8IDggKysrKy0tLS0KICBnbGliL3Rl
c3RzL21lc29uLmJ1aWxkIHwgMiArLQpAQCAtNjYsNyArNjUsNyBAQCBpbmRleCBkODBjODZlLi41
MzI5Y2RhIDEwMDY0NAogICAgICBnbGliX3Rlc3RzICs9IHsKICAgICAgICAnZ3BvbGwnIDogewog
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGY3ZTkzNmUuLjEy
MmY4YjUgMTAwNjQ0CitpbmRleCA4MTNjOWI3Li42ZWU3NzVlIDEwMDY0NAogLS0tIGEvbWVzb24u
YnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNTQsNiArNTQsOSBAQCBlbHNlCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVN3aXRjaC1mcm9t
LXRoZS1kZXByZWNhdGVkLWRpc3R1dGlscy1tb2R1bGUtdG8tdGhlLXAucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVN3aXRjaC1mcm9tLXRoZS1kZXByZWNh
dGVkLWRpc3R1dGlscy1tb2R1bGUtdG8tdGhlLXAucGF0Y2gKaW5kZXggNTAzNjhlZDIyYy4uYjEx
YzI4M2U2ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAv
MDAwMS1Td2l0Y2gtZnJvbS10aGUtZGVwcmVjYXRlZC1kaXN0dXRpbHMtbW9kdWxlLXRvLXRoZS1w
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtU3dp
dGNoLWZyb20tdGhlLWRlcHJlY2F0ZWQtZGlzdHV0aWxzLW1vZHVsZS10by10aGUtcC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMDVmMDY3NGM5M2Q5NGZlNmIyOWMxYjcwNzk4MGFhYzQ2OWRk
Y2Q3MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYThlYjk0NGExMDM1MzQwMzI0MTYw
OGEwODQ3ODdmNmVmY2JiMmViNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvcmRh
biBXaWxsaWFtcyA8am9yZGFuQGp3aWxsaWtlcnMuY29tPgogRGF0ZTogRnJpLCAxIERlYyAyMDIz
IDA5OjUzOjUwIC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN3aXRjaCBmcm9tIHRoZSBkZXByZWNh
dGVkIGRpc3R1dGlscyBtb2R1bGUgdG8gdGhlIHBhY2thZ2luZwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMt
Y29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQt
YS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCmluZGV4IGU0YzJmNzc0NTkuLmFlZTI5ODYwMzMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtZ2lvLXRl
c3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWdpby10ZXN0cy1yZXNv
dXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDNmMDViOTQxOGM4OGJiYjgzYzA4YjU3Y2M1NTI5YjAwNmYyNmZmZjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg3OGU1MWY4MjEwMGM2OTgyMzZmZGEwZTA2OWUxNGVh
OTI0OTM1MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoyMjo0
NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1lbnQg
b3V0IGEgYnVpbGQgaG9zdC1vbmx5IHRlc3QKQEAgLTgsNyArOCw2IEBAIG5vdCBjcm9zcy1jb21w
YXRpYmxlIChoYXJkY29kZXMgbGQgYW5kIG9iamNvcHkpLgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgZ2lvL3Rlc3RzL3Jlc291
cmNlcy5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAw
MS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qt
b24tY2xhbmctYXMtd2VsbC5wYXRjaAppbmRleCAwNzFlNGE3YzRkLi4wYjEwMjY5MTE0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1
bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xh
bmctYXMtd2VsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTdkNzE4NjQwYWU2Zjk1M2U1
ZWVhNzE0YzFiZDY0ZWViNmU0Nzk5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjRi
NTIzMTYwZWY1NTBhNTM3MDVmY2M0NWFjNmUxMGQwODZjZTQ5MSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEy
IE9jdCAyMDE5IDE3OjQ2OjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBSdW4gYXRv
bWljcyB0ZXN0IG9uIGNsYW5nIGFzIHdlbGwKQEAgLTksMTMgKzksMTIgQEAgRml4ZXMKIAogVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgotCiAtLS0KICBtZXNvbi5idWlsZCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxk
IGIvbWVzb24uYnVpbGQKLWluZGV4IDEyMmY4YjUuLmYwNTUwNzkgMTAwNjQ0CitpbmRleCA2ZWU3
NzVlLi44YmM1ZmE3IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxk
CiBAQCAtMTkzOCw3ICsxOTM4LDcgQEAgYXRvbWljZGVmaW5lID0gJycnCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLmJ1aWxkLWRvLW5v
dC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlk
ZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKaW5kZXggZTAzZjlhM2M4NC4uMTRkY2IyNzhl
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1t
ZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtbWVzb24uYnVp
bGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNzg2NWQ2OThiNWQzOTJhYWMzYTNkMzJlOWViZDVmZWE0NTAxN2QxNSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjk0ZjNlNmU5YTBhOWY0NzMzZTg1ZWQ2ODEw
ZDFiNzQzMDU1MzcwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIzIDIyOjI4
OjI3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBkbyBub3QgZW5hYmxlIHBp
ZGZkIGZlYXR1cmVzIG9uIG5hdGl2ZSBnbGliCkBAIC05LDEzICs5LDEyIEBAIHdoZXJlIHRoZXNl
IGZlYXR1cmVzIGFyZSBub3QgaW1wbGVtZW50ZWQuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0KIC0tLQogIG1lc29uLmJ1aWxkIHwgMyArKy0KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBmMDU1MDc5Li43N2Q3OGFhIDEw
MDY0NAoraW5kZXggOGJjNWZhNy4uZGYxZmE2MCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiAr
KysgYi9tZXNvbi5idWlsZAogQEAgLTk4MSw3ICs5ODEsOCBAQCBpZiBjYy5saW5rcygnJycjaW5j
bHVkZSA8c3lzL3N5c2NhbGwuaD4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91
cy10b29scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMTAt
RG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAppbmRl
eCA0Yjc1MTY3ZGE2Li42ZGZmNTE3OWM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLTIuMC8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZh
cmlvdXMtdG9vbHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjAvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBh
dGNoCkBAIC0xLDExICsxLDEwIEBACi1Gcm9tIDUzYmNkNGI2Y2QzZmUzZmU0MjQ2OTE0NDYyZTY3
MjQ3NjFlZWNmNTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUwNjM2NzU4YzczZTVl
NjEyMTJhOGY4MDFjNmM2MDJiOGFhYjViYTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwg
MyBPY3QgMjAxNyAxMDo0NTo1NSArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNv
ZGUgcHl0aG9uIHBhdGggaW50byB2YXJpb3VzIHRvb2xzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBnaW8vZ2RidXMtMi4wL2Nv
ZGVnZW4vZ2RidXMtY29kZWdlbi5pbiB8IDIgKy0KICBnb2JqZWN0L2dsaWItZ2VubWFyc2hhbC5p
biAgICAgICAgICAgICB8IDIgKy0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wL21lbW9yeS1tb25pdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvbWVtb3J5LW1vbml0b3IucGF0Y2gKaW5kZXggZjlkZmM1YmIwNS4uNGYz
ODUwOWRhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAv
bWVtb3J5LW1vbml0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi0yLjAvbWVtb3J5LW1vbml0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRmNzUwNjkx
OGVmYzg3NDhkYWM4YjgzOTgwMjFlMWI3OWQ2OTRiYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGNlODQwYjZiMTExZTFlMTA5ZTUxMWY2ODMzZDZhYTQxOWUyYjcyM2EgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsaXAgV2l0aG5hbGwgPHBoaWxpcEB0ZWNub2NvZGUu
Y28udWs+CiBEYXRlOiBUdWUsIDIzIEphbiAyMDI0IDExOjE2OjUyICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIE1lcmdlIGJyYW5jaCAnMjg4Ny1tZW1vcnktbW9uaXRvci10ZXN0cycgaW50byAnbWFp
bicKQEAgLTIyLDcgKzIyLDcgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGFybS5jb20+CiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKSwgNzQgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItZGJ1cy5w
eS5pbiBiL2dpby90ZXN0cy9tZW1vcnktbW9uaXRvci1kYnVzLnB5LmluCi1pbmRleCBiZjMyOTE4
NDcuLjdhYWUwMWU3MCAxMDA3NTUKK2luZGV4IGJmMzI5MTguLjdhYWUwMWUgMTAwNzU1CiAtLS0g
YS9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItZGJ1cy5weS5pbgogKysrIGIvZ2lvL3Rlc3RzL21l
bW9yeS1tb25pdG9yLWRidXMucHkuaW4KIEBAIC0xNiw3ICsxNiw2IEBAIGltcG9ydCBzeXMKQEAg
LTEzMCw3ICsxMzAsNyBAQCBpbmRleCBiZjMyOTE4NDcuLjdhYWUwMWU3MCAxMDA3NTUKICBleGNl
cHQgSW1wb3J0RXJyb3IgYXMgZToKICAgICAgQHVuaXR0ZXN0LnNraXAoIkNhbm5vdCBpbXBvcnQg
JXMiICUgZS5uYW1lKQogZGlmZiAtLWdpdCBhL2dpby90ZXN0cy9tZW1vcnktbW9uaXRvci1wb3J0
YWwucHkuaW4gYi9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCi1pbmRleCA3
NDhjZWU4NTAuLmY1NzA1MDhmOSAxMDA3NTUKK2luZGV4IDc0OGNlZTguLmY1NzA1MDggMTAwNzU1
CiAtLS0gYS9naW8vdGVzdHMvbWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCiArKysgYi9naW8v
dGVzdHMvbWVtb3J5LW1vbml0b3ItcG9ydGFsLnB5LmluCiBAQCAtMTYsNyArMTYsNiBAQCBpbXBv
cnQgc3lzCkBAIC0yMjIsNyArMjIyLDcgQEAgaW5kZXggNzQ4Y2VlODUwLi5mNTcwNTA4ZjkgMTAw
NzU1CiAgZXhjZXB0IEltcG9ydEVycm9yIGFzIGU6CiAgICAgIEB1bml0dGVzdC5za2lwKCJDYW5u
b3QgaW1wb3J0ICVzIiAlIGUubmFtZSkKIGRpZmYgLS1naXQgYS9naW8vdGVzdHMvcG93ZXItcHJv
ZmlsZS1tb25pdG9yLWRidXMucHkuaW4gYi9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9y
LWRidXMucHkuaW4KLWluZGV4IDA2ZTU5NGY0YS4uZjk1NWFmYzgwIDEwMDc1NQoraW5kZXggMDZl
NTk0Zi4uZjk1NWFmYyAxMDA3NTUKIC0tLSBhL2dpby90ZXN0cy9wb3dlci1wcm9maWxlLW1vbml0
b3ItZGJ1cy5weS5pbgogKysrIGIvZ2lvL3Rlc3RzL3Bvd2VyLXByb2ZpbGUtbW9uaXRvci1kYnVz
LnB5LmluCiBAQCAtMTYsNyArMTYsNiBAQCBpbXBvcnQgc3lzCkBAIC0yOTUsNyArMjk1LDcgQEAg
aW5kZXggMDZlNTk0ZjRhLi5mOTU1YWZjODAgMTAwNzU1CiAgZXhjZXB0IEltcG9ydEVycm9yIGFz
IGU6CiAgICAgIEB1bml0dGVzdC5za2lwKCJDYW5ub3QgaW1wb3J0ICVzIiAlIGUubmFtZSkKIGRp
ZmYgLS1naXQgYS9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9yLXBvcnRhbC5weS5pbiBi
L2dpby90ZXN0cy9wb3dlci1wcm9maWxlLW1vbml0b3ItcG9ydGFsLnB5LmluCi1pbmRleCAwOWU5
YTQ1MGQuLmFkMmFiZjYyMSAxMDA3NTUKK2luZGV4IDA5ZTlhNDUuLmFkMmFiZjYgMTAwNzU1CiAt
LS0gYS9naW8vdGVzdHMvcG93ZXItcHJvZmlsZS1tb25pdG9yLXBvcnRhbC5weS5pbgogKysrIGIv
Z2lvL3Rlc3RzL3Bvd2VyLXByb2ZpbGUtbW9uaXRvci1wb3J0YWwucHkuaW4KIEBAIC0xNiw3ICsx
Niw2IEBAIGltcG9ydCBzeXMKQEAgLTM1OSw2ICszNTksMyBAQCBpbmRleCAwOWU5YTQ1MGQuLmFk
MmFiZjYyMSAxMDA3NTUKICAKICAgICAgICAgIGRlZiB0ZXN0X3Bvd2VyX3Byb2ZpbGVfcG93ZXJf
c2F2ZXJfZW5hYmxlZF9wb3J0YWxfZGVmYXVsdChzZWxmKToKICAgICAgICAgICAgICAnJydwb3dl
ci1zYXZlci1lbmFibGVkIHByb3BlcnR5IGRlZmF1bHQgdmFsdWUnJycKLS0tIAotMi4zNC4xCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL25hdGl2ZS1n
dGtkb2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9uYXRpdmUt
Z3RrZG9jLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmNTZjMmI4NTY0Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL25hdGl2
ZS1ndGtkb2MucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyMSArMCwwIEBACi1kb2NzL3JlZmVy
ZW5jZTogZGVwZW5kIG9uIGEgbmF0aXZlIGd0ay1kb2MKLQotSW4gYSBjcm9zcy1jb21waWxlZCBl
bnZpcm9ubWVudCB3ZSBkb24ndCBuZWVkIGEgdGFyZ2V0IGd0ay1kb2MsIGJ1dCBhCi1uYXRpdmUg
Z3RrLWRvYy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbZjNmZjM3MGQxYjI0ZjhhZmI1
MWNkNGU4NjU1OTNkNWI2NzgxODhhOV0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgotCi1kaWZmIC0tZ2l0IGEvZG9jcy9yZWZlcmVuY2UvbWVzb24uYnVp
bGQgYi9kb2NzL3JlZmVyZW5jZS9tZXNvbi5idWlsZAotaW5kZXggYzQxN2ZmZWNiLi42N2MxZGRh
NTYgMTAwNjQ0Ci0tLS0gYS9kb2NzL3JlZmVyZW5jZS9tZXNvbi5idWlsZAotKysrIGIvZG9jcy9y
ZWZlcmVuY2UvbWVzb24uYnVpbGQKLUBAIC00Miw3ICs0Miw3IEBAIGlnbm9yZV9kZWNvcmF0b3Jz
ID0gJ3wnLmpvaW4oaWdub3JlX2RlY29yYXRvcnMpCi0gaWYgZ2V0X29wdGlvbignZ3RrX2RvYycp
Ci0gICAjIENoZWNrIHdlIGhhdmUgdGhlIG1pbmltdW0gZ3RrLWRvYyB2ZXJzaW9uIHJlcXVpcmVk
LiBPbGRlciB2ZXJzaW9ucyB3b24ndAotICAgIyBnZW5lcmF0ZSBjb3JyZWN0IGRvY3VtZW50YXRp
b24uCi0tICBkZXBlbmRlbmN5KCdndGstZG9jJywgdmVyc2lvbiA6ICc+PTEuMzIuMScsCi0rICBk
ZXBlbmRlbmN5KCdndGstZG9jJywgdmVyc2lvbiA6ICc+PTEuMzIuMScsIG5hdGl2ZTogdHJ1ZSwK
LSAgICAgZmFsbGJhY2sgOiBbJ2d0ay1kb2MnLCAnZHVtbXlfZGVwJ10sCi0gICAgIGRlZmF1bHRf
b3B0aW9ucyA6IFsndGVzdHM9ZmFsc2UnXSkKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IDk1
YTczMjk4ZDguLjNlNzliYmY2NzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMDNhMDY5Y2I4MDY2ZDNlOGVmNzJhNDNmN2IxZGI1Yzk2MjVlOWNjMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjQwZTg5YjM4NTJkZjM3OTU5NjA2ZWUxM2IxYTE0YWRl
ODFmYTg4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJl
Y3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTEzLDcgKzEzLDYgQEAgU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIAogUG9ydCBwYXRjaCB0byAyLjQ4
CiBTaWduZWQtb2ZmLWJ5OiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29t
PgotCiAtLS0KICBnaW8vZ2lvbW9kdWxlLmMgfCA3IC0tLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwg
NyBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWItMi4wXzIuNzguMy5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIu
NzguNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMF8yLjc4LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wXzIuNzguNC5iYgppbmRleCA2YzNlOTljNjQxLi4zMTM5MTk3MTAw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc4LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43OC40LmJiCkBA
IC0xNiwxMyArMTYsMTQgQEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vZ2xpYi8ke1NIUlRf
VkVSfS9nbGliLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdpby10ZXN0
cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1Td2l0Y2gtZnJvbS10aGUtZGVwcmVjYXRlZC1kaXN0dXRpbHMt
bW9kdWxlLXRvLXRoZS1wLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL21lbW9yeS1tb25pdG9y
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL25hdGl2ZS1ndGtkb2MucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8w
MDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcu
cGF0Y2ggXAogICAgICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZp
bGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVy
ZXMtb24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjA5ODAxZGQzNzM3OTZlNTE1OTcyYmY5NWZjMGIyZGFh
NDQ1NDU0ODFlZTJmNDY1YzRmMjA0ZDIyNGIyYmMyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIy
NGI4ZTA2NzJkY2ExMjBjYzMyZDM5NGJjY2I4NTg0NGU3MzJlMDRmZTc1ZDE4YmIwNTczYjJkYmM3
NTQ4ZjYzIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVzIGluIEZJTEVTUEFUSCB0aGF0
IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQgKHVzaW5nIHNpdGVpbmZvKSBh
bmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuNDIuMAoK

--===============3979945687980949998==--

