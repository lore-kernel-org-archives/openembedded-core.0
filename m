Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD456CA0EEE
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11320.1755263215402384407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gY4ZRAbz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=slUBJfz+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add723c2-bbcc200a-cb83-4732-8086-539501921453-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zb1C2/WOHb/16U/zGIA3MAEH8bLmDGUV4Hwa+ZslofI=;
	b=gY4ZRAbzRUsbjG2WbaSRAIBh6XOLhDDp3Me6yXvUKfYih93SN4rTVbP8ObVZ5f/n
	pNKVoetAcvjminZG+FKOUa3EktHkd67mVWC4bqHqJHjAmW4McZlzxCbgDIk/ZjBa01z
	GVr9d5BnUXZo/2XCPmybBCefq7EzNpr2lDQzmgIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zb1C2/WOHb/16U/zGIA3MAEH8bLmDGUV4Hwa+ZslofI=;
	b=slUBJfz+P7acrzPIBOb7iGnZYp65kyk04+NI2h7EhpriRvL3WgcJEVhrBZUg6tlx
	mVYMjla6UiGqQnPkK13QiOpQCeLaKZ2txD+GDSTQYsnY5Z+jHFpA9mh33+a2HNb9Y9z
	a3Oxg2IxkBNAjHAOSB7gzmrY2us00CQzJbooVQhY=
Content-Type: multipart/mixed; boundary="===============4153759187019630519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.84.4,2.84.4 SUCCEEDED
Message-ID: <01010198add723c2-bbcc200a-cb83-4732-8086-539501921453-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221884

--===============4153759187019630519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.84.4,2.84.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-glib-2.0-initial-upgrade-2.84.2-2.84.4-2.84.patch
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
From 23171368de0ad46b81b886fb477ec4506f3c5e16 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 05:25:46 +0000
Subject: [PATCH] glib-2.0,glib-2.0-initial: upgrade 2.84.2 -> 2.84.4,2.84.2 ->
 2.84.4

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch    | 2 +-
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch        | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch  | 2 +-
 ...move-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...o-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch      | 6 +++---
 ...son.build-do-not-enable-pidfd-features-on-native-g.patch | 6 +++---
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch     | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch         | 2 +-
 ...lib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb} | 0
 .../glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 13 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index c394ab3277..d515d83542 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
+From ad9590f983930250f745bbd70ab548b41e6a4066 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 19fffbdc5f..97d9ec7506 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
+From 42619a6c7a106fcd3164f109cc4356fe40741a24 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 89ba10ff6d..5f74a0e40c 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
+From f98975f6f5186f266e77a085469153178c5fa8f8 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index ebdf957272..55be1dfad7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
+From 234b66a7b77957e73f1099311ba6f7240e504be7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 771b03e66d..c57963bf5a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
+From 894183b46da3899b8acc6c0eafd4f5b9bee9ea84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e5878a1428..c35b51564c 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
+From 57ab7c0f6bde6a356ccfd8c105dccf3e01b435af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a8bcadc..041b68e 100644
+index 8f3f686..f3328f6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2075,7 +2075,7 @@ atomicdefine = '''
+@@ -2077,7 +2077,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e512940e34..e0c64c633e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
+From 01f170dd95ebb6fe71517017f32a580a4d76a81c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 041b68e..155bfd4 100644
+index f3328f6..cd77ca1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index d26f944d51..ace3e3bd43 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
+From 6d47f60329f7b0a41ba41e302d8bb4bef582dafc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index ddf464526c..e1f14c8e5d 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
+From b879d5d527573a7431513391365b8b8c0cecc6c8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 138e970553..affe4228d1 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
+From 66a797b2a172b055819e00ff29de94c56099fd70 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 404c82ef6e..c0044b4cf9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
+SRC_URI[sha256sum] = "8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============4153759187019630519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.8400.2 /usr/lib/libgirepository-2.0.so.0.8400.2 /usr/lib/libglib-2.0.so.0.8400.2 /usr/lib/libgthread-2.0.so.0.8400.2 /usr/lib/libgobject-2.0.so.0.8400.2 /usr/lib/libgmodule-2.0.so.0.8400.2", added "/usr/lib/libglib-2.0.so.0.8400.4 /usr/lib/libgirepository-2.0.so.0.8400.4 /usr/lib/libgio-2.0.so.0.8400.4 /usr/lib/libgobject-2.0.so.0.8400.4 /usr/lib/libgthread-2.0.so.0.8400.4 /usr/lib/libgmodule-2.0.so.0.8400.4"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============4153759187019630519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgthread-2.0.so.0.8400.2 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py /usr/lib/.debug/libglib-2.0.so.0.8400.2 /usr/lib/.debug/libgio-2.0.so.0.8400.2 /usr/lib/.debug/libgmodule-2.0.so.0.8400.2 /usr/lib/.debug/libgobject-2.0.so.0.8400.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py /usr/lib/.debug/libgirepository-2.0.so.0.8400.2", added "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py /usr/lib/.debug/libgirepository-2.0.so.0.8400.4 /usr/lib/.debug/libgmodule-2.0.so.0.8400.4 /usr/lib/.debug/libgobject-2.0.so.0.8400.4 /usr/lib/.debug/libglib-2.0.so.0.8400.4 /usr/lib/.debug/libgio-2.0.so.0.8400.4 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8400.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 32015610 to 32018754 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.8400.2 /usr/lib/libgirepository-2.0.so.0.8400.2 /usr/lib/libgobject-2.0.so.0.8400.2 /usr/lib/libgthread-2.0.so.0.8400.2 /usr/lib/libgio-2.0.so.0.8400.2 /usr/lib/libgmodule-2.0.so.0.8400.2", added "/usr/lib/libgirepository-2.0.so.0.8400.4 /usr/lib/libglib-2.0.so.0.8400.4 /usr/lib/libgio-2.0.so.0.8400.4 /usr/lib/libgthread-2.0.so.0.8400.4 /usr/lib/libgobject-2.0.so.0.8400.4 /usr/lib/libgmodule-2.0.so.0.8400.4"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.84.2" to "2.84.4"
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.84/glib-2.84.2.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.84/glib-2.84.4.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file
 ://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.84.2 [default] to 2.84.4 [default]
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.84.2" to "2.84.4"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.4
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.4
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.4
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.4
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.4
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.4
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.4
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============4153759187019630519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-glib-2.0-initial-upgrade-2.84.2-2.84.4-2.84.patch"

RnJvbSAyMzE3MTM2OGRlMGFkNDZiODFiODg2ZmI0NzdlYzQ1MDZmM2M1ZTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDU6MjU6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMCxnbGliLTIuMC1pbml0aWFsOiB1cGdyYWRlIDIuODQuMiAtPiAyLjg0LjQsMi44NC4y
IC0+CiAyLjg0LjQKCi0tLQogLi4uLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2ggICAgfCAyICstCiAuLi4vZmlsZXMvMDAwMS1GaXgtREFUQURJUk5B
TUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi8wMDAxLUluc3RhbGwt
Z2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggIHwgMiArLQogLi4ubW92
ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2ggfCAy
ICstCiAuLi5vLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5
LS5wYXRjaCB8IDIgKy0KIC4uLi8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmct
YXMtd2VsbC5wYXRjaCAgICAgIHwgNiArKystLS0KIC4uLnNvbi5idWlsZC1kby1ub3QtZW5hYmxl
LXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIHwgNiArKystLS0KIC4uLjAxMC1Eby1u
b3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoIHwgMiArLQog
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCAg
ICAgfCAyICstCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2ggICAgICAgICB8IDIgKy0KIC4uLmxpYi0yLjAtaW5pdGlhbF8yLjg0LjIuYmIgPT4gZ2xp
Yi0yLjAtaW5pdGlhbF8yLjg0LjQuYmJ9IHwgMAogLi4uL2dsaWItMi4wL3tnbGliLTIuMF8yLjg0
LjIuYmIgPT4gZ2xpYi0yLjBfMi44NC40LmJifSAgICAgfCAwCiBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLmluYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEzIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMC1pbml0aWFsXzIuODQuMi5iYiA9PiBnbGli
LTIuMC1pbml0aWFsXzIuODQuNC5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAve2dsaWItMi4wXzIuODQuMi5iYiA9PiBnbGliLTIuMF8yLjg0LjQuYmJ9ICgxMDAl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8t
bm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ct
Y29uZmlnLWZpbGVzLnBhdGNoCmluZGV4IGMzOTRhYjMyNzcuLmQ1MTVkODM1NDIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJp
bmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1m
aWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODk4MWRiNWQ3NzVlMDRiNzJmYjY4YjZh
NDU1M2M4N2ZkYWVkZWU2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWQ5NTkwZjk4
MzkzMDI1MGY3NDViYmQ3MGFiNTQ4YjQxZTZhNDA2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
RnJpLCAxNSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qg
cHJlZml4IGV4ZWN1dGFibGVzIHdpdGggJGJpbmRpciBpbiBwa2ctY29uZmlnIGZpbGVzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElS
TkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKaW5kZXggMTlm
ZmZiZGM1Zi4uOTdkOWVjNzUwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9u
LXVjbGliYy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDhiZmM4N2U5Zjc1N2Nm
NjVhZDk2NzUyMDg2MGJmZDc1MjZjMzZmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NDI2MTlhNmM3YTEwNmZjZDMxNjRmMTA5Y2M0MzU2ZmU0MDc0MWEyNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQs
IDE1IE1hciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBEQVRBRElS
TkFNRSBvbiB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JB
TS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1n
aW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAppbmRleCA4OWJhMTBmZjZk
Li41Zjc0YTBlNDBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1x
dWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBiOGRjYmYwM2IzMTVkMzE3NTkxNzZlOWQ0ZmQzODllOGZkYTZmZmNkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBmOTg5NzVmNmY1MTg2ZjI2NmU3N2EwODU0NjkxNTMxNzhjNWZhOGY4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1
a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjIgTWFyIDIwMTYgMTU6MTQ6NTggKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gSW5zdGFsbCBnaW8tcXVlcnltb2R1bGVzIGFzIGxpYmV4ZWNfUFJP
R1JBTQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1S
ZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5p
bmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCmluZGV4IGViZGY5NTcy
NzIuLjU1YmUxZGZhZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2No
ZW1hcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJl
bW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGJkYjI3NzJkNjcyZTk1NTg0NTg1ZTkwMjY4OTkzNjU1OWM1
ZGIwNWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzNGI2NmE3Yjc3OTU3ZTczZjEw
OTkzMTFiYTZmNzI0MGU1MDRiZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTIgSnVu
IDIwMTUgMTc6MDg6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHRoZSB3YXJuaW5n
IGFib3V0IGRlcHJlY2F0ZWQgcGF0aHMgaW4gc2NoZW1hcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVu
dC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1o
b3N0LW9ubHktLnBhdGNoCmluZGV4IDc3MWIwM2U2NmQuLmM1Nzk2M2JmNWEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNl
cy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50
LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhjYjc1
ZDNiYzM2OGVlMTA4YTRiMTRiYzU3YTkyYmQwYzBiMmUxMGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDg5NDE4M2I0NmRhMzg5OWI4YWNjNmMwZWFmZDRmNWI5YmVlOWVhODQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoyMjo0NiArMDEwMAogU3ViamVj
dDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1lbnQgb3V0IGEgYnVpbGQgaG9z
dC1vbmx5IHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0
LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKaW5kZXggZTU4NzhhMTQyOC4uYzM1YjUxNTY0YyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4t
YXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFz
LXdlbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUwMjk4NGZlMzQwYTc2YzkyZTJjMDQy
MzVmNDNmZGNiNDc3Mjg4MDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3YWI3YzBm
NmJkZTZhMzU2Y2NmZDhjMTA1ZGNjZjNlMDFiNDM1YWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMiBPY3Qg
MjAxOSAxNzo0NjoyNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbjogUnVuIGF0b21pY3Mg
dGVzdCBvbiBjbGFuZyBhcyB3ZWxsCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24u
YnVpbGQKLWluZGV4IGE4YmNhZGMuLjA0MWI2OGUgMTAwNjQ0CitpbmRleCA4ZjNmNjg2Li5mMzMy
OGY2IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMjA3
NSw3ICsyMDc1LDcgQEAgYXRvbWljZGVmaW5lID0gJycnCitAQCAtMjA3Nyw3ICsyMDc3LDcgQEAg
YXRvbWljZGVmaW5lID0gJycnCiAgIyBXZSBrbm93IHRoYXQgd2UgY2FuIGFsd2F5cyB1c2UgcmVh
bCAoImxvY2sgZnJlZSIpIGF0b21pYyBvcGVyYXRpb25zIHdpdGggTVNWQwogIGlmIGNjLmdldF9p
ZCgpID09ICdtc3ZjJyBvciBjYy5nZXRfaWQoKSA9PSAnY2xhbmctY2wnIG9yIGNjLmxpbmtzKGF0
b21pY3Rlc3QsIG5hbWUgOiAnYXRvbWljIG9wcycpCiAgICBoYXZlX2F0b21pY19sb2NrX2ZyZWUg
PSB0cnVlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRv
LW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKaW5kZXggZTUxMjk0
MGUzNC4uZTBjNjRjNjMzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5h
dGl2ZS1nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDVlNTY2YzQ1YTlhYjRkN2U1MTEwNGFiMTc2ZTZlYjVm
NzA1ZjkxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDFmMTcwZGQ5NWViYjZmZTcx
NTE3MDE3ZjMyYTU4MGE0ZDc2YTgxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAy
MDIzIDIyOjI4OjI3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBkbyBub3Qg
ZW5hYmxlIHBpZGZkIGZlYXR1cmVzIG9uIG5hdGl2ZSBnbGliCkBAIC0xNCwxMCArMTQsMTAgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwNDFiNjhlLi4xNTViZmQ0IDEw
MDY0NAoraW5kZXggZjMzMjhmNi4uY2Q3N2NhMSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiAr
KysgYi9tZXNvbi5idWlsZAotQEAgLTEwNzMsNyArMTA3Myw4IEBAIGlmIGNjLmxpbmtzKCcnJyNp
bmNsdWRlIDxzeXMvc3lzY2FsbC5oPgorQEAgLTEwNzUsNyArMTA3NSw4IEBAIGlmIGNjLmxpbmtz
KCcnJyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgogICAgICAgICAgICAgICAgICAgd2FpdGlkIChQ
X1BJREZELCAwLCAmY2hpbGRfaW5mbywgV0VYSVRFRCB8IFdOT0hBTkcpOwogICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7CiAgICAgICAgICAgICAgICAgfScnJywgbmFtZSA6ICdwaWRmZF9vcGVu
KDIpIHN5c3RlbSBjYWxsJykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29s
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhh
cmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAppbmRleCBkMjZmOTQ0
ZDUxLi5hY2UzZTNiZDQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3Qt
aGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyMTE5MjdkMmNhYTRhODFlMTEzMWMyMjEwZTFkYjgzODEwNGExZmI5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZDQ3ZjYwMzI5ZjdiMGE0MWJhNDFlMzAyZDhiYjRi
ZWY1ODJkYWZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDMgT2N0IDIwMTcgMTA6NDU6
NTUgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGhhcmRjb2RlIHB5dGhvbiBwYXRoIGlu
dG8gdmFyaW91cyB0b29scwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKaW5kZXggZGRmNDY0NTI2Yy4uZTFmMTRjOGU1
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUt
bW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxv
Y2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTZiYWM1M2YxOWQzMDk0
YWEyMDA3MDU0Yzg3ZDg2YzlkNjViNDIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBi
ODc5ZDVkNTI3NTczYTc0MzE1MTMzOTEzNjViOGI4YzBjZWNjNmM4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6
IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0y
LjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9kdWxlIGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBh
dGNoCmluZGV4IDEzOGU5NzA1NTMuLmFmZmU0MjI4ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDUxYmZjYWIwYjYwYmQ1N2Y0ZDM0NjNjNDc5ZmRmNDdlNjQ1Y2Q2ZmUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDY2YTc5N2IyYTE3MmIwNTU4MTllMDBmZjI5ZGU5NGM1NjA5
OWZkNzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AYXJtLmNvbT4KIERhdGU6IFRodSwgMjggTWFyIDIwMjQgMTY6Mjc6MDkgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gU2tpcCAvdGltZW91dC9yb3VuZGluZyB0ZXN0CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODQuMi5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44NC40LmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMC1pbml0aWFsXzIuODQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg0LjQuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODQuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wXzIuODQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44NC4yLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg0LjQuYmIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi5pbmMKaW5kZXggNDA0YzgyZWY2ZS4uYzAwNDRiNGNmOSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKQEAgLTIzNiw3ICsyMzYsNyBAQCBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtZG8t
bm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBcCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4OGU5NjBkZDkz
NzA1NzQwN2Q2MWZjYjNiNDVhODYwNzA0YjI1OTIzYzM3YWUyNDc4Yjg1ZjJlY2I1YTQwMjFmIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhOWVhMTA5NDNjMzZmYzExN2UyNTNmODBjOTFlNDc3YjY3
MzUyNWFlNDU3NjI5NDI4NThhZWY1NzYzMWJiOTAiCiAKICMgRmluZCBhbnkgbWVzb24gY3Jvc3Mg
ZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQgYXJlIHJlbGV2YW50IGZvciB0aGUgY3VycmVudAogIyBi
dWlsZCAodXNpbmcgc2l0ZWluZm8pIGFuZCBhZGQgdGhlbSB0byBFWFRSQV9PRU1FU09OLgotLSAK
Mi40Ny4xCgo=

--===============4153759187019630519==--

