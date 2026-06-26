Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E7ACDE016
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:11:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29767.1782454297104855251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KtOAhufs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DAFzQdbS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f028e1e2a-0098bb21-fd60-4257-a256-91d1a7ef1a65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782454296;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=jku3uD2eGquZxiiTzKhcxLHw6LW5TvqbK1UxjuB0Qdk=;
	b=KtOAhufss1GSbu3MHPWEs7t/V6tbj3qRTEyfTd20u3PBET+YtKfSVnVh26wBCwmp
	IVWcrzmEGEa2elHDC9HwuR9F5TV0+1U2weYvqxZ3G5yZyivrfSuT7bhWjDq18T0f59c
	UuPaqN49Odxy1Ej5ISvVjuqVPZdIHwpqkUcP82Vo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782454296;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=jku3uD2eGquZxiiTzKhcxLHw6LW5TvqbK1UxjuB0Qdk=;
	b=DAFzQdbSwif/YSmI4X+AKWaOH0jJEuY06n8ln4xldkIQXxsRVs6VAdHsyHiiCTlf
	K+oa9joKyA5cNrQOaky+wbPrQvX1cY5ZSqlNOqb6n48+/hKwMRuEJuSHmpoqpXTLSZ5
	0Gh1YLK5vW0b1ro01YOXQ0FGiPrv1zik1vzWR1R0=
Content-Type: multipart/mixed; boundary="===============7222185495370726186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.88.2,2.88.2 SUCCEEDED
Message-ID: <0101019f028e1e2a-0098bb21-fd60-4257-a256-91d1a7ef1a65-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jun 2026 06:11:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.26-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239595

--===============7222185495370726186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.88.2,2.88.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.88.1-2.88.2-2.88.patch
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
From 3f59cd78c005fb729d6099405097742acf90c84a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 26 Jun 2026 05:21:51 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.88.1 -> 2.88.2,2.88.1 ->
 2.88.2

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch      | 2 +-
 .../glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch    | 2 +-
 ...Remove-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...gio-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../files/0001-meson-Run-atomics-test-on-clang-as-well.patch  | 4 ++--
 ...meson.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 .../0010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch       | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch           | 2 +-
 ...{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.88.2.bb} | 0
 .../glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.88.2.bb}       | 0
 meta/recipes-core/glib-2.0/glib.inc                           | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.88.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index b6ad6035c5..11e9508840 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 89c0644254023cfd5a22685fbbb50ebd8c6224df Mon Sep 17 00:00:00 2001
+From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index c698376d3f..40398f25f7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 727d5239c378c820f874b50d539f87b54a3757a9 Mon Sep 17 00:00:00 2001
+From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 18d69c4a43..2af10b1676 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From af1354b16aeffbfefc7e8d32160c97105a93a84f Mon Sep 17 00:00:00 2001
+From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 594c444797..eef7c9db86 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 6237ed5e1677c3b0ea50c92dc36e864ca860e1bd Mon Sep 17 00:00:00 2001
+From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 243961ab8e..14c8c701ba 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 521b129c7c6329a01a5f56b4604ea1b7499b03ad Mon Sep 17 00:00:00 2001
+From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index fda448e3cc..1fe00df8fc 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 69e80e3b936e57eaecda231b12b554c075218deb Mon Sep 17 00:00:00 2001
+From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index bb68398..3e9e03a 100644
+index 25802aa..c53d216 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 711572b139..fa46bee904 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From e79e19bc1e6a7e8fb8596c4a9d60e21032350784 Mon Sep 17 00:00:00 2001
+From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 3e9e03a..f1957f0 100644
+index c53d216..330ccf3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 0f98133802..7a2c168756 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 6d92086a791c2320b46817640ceba901361f34fe Mon Sep 17 00:00:00 2001
+From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 7f326d8588..421dcb8f9a 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 20721d24485a51206189b3128835c3c3098601b3 Mon Sep 17 00:00:00 2001
+From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 43506d69f5..25f5324784 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From d548554b8793d82b93c7c7b2198e368b57916958 Mon Sep 17 00:00:00 2001
+From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8d23092187..92b919e00b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,7 +238,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "51ab804c56f6eab3e5045c774d1290ac5e4c923d4f9a3d8e33123bee45c1840e"
+SRC_URI[archive.sha256sum] = "cf3f215a640c8a4257f14317586b8f1fdd25a10a93cb4bdda147c0f9ad88e74f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============7222185495370726186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.2-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGSIZE changed from 174848 to 209551 (+20%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libgio-2.0.so.0.8800.1 /usr/lib/libgmodule-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1", added "/usr/lib/libgthread-2.0.so.0.8800.2 /usr/lib/libgobject-2.0.so.0.8800.2 /usr/lib/libgirepository-2.0.so.0.8800.2 /usr/lib/libgio-2.0.so.0.8800.2 /usr/lib/libgmodule-2.0.so.0.8800.2 /usr/lib/libglib-2.0.so.0.8800.2"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2

--===============7222185495370726186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.2-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgmodule-2.0.so.0.8800.1 /usr/lib/.debug/libgio-2.0.so.0.8800.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8800.1 /usr/lib/.debug/libglib-2.0.so.0.8800.1 /usr/lib/.debug/libgirepository-2.0.so.0.8800.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.8800.1", added "/usr/lib/.debug/libgmodule-2.0.so.0.8800.2 /usr/lib/.debug/libgio-2.0.so.0.8800.2 /usr/lib/.debug/libgthread-2.0.so.0.8800.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.2-gdb.py /usr/lib/.debug/libglib-2.0.so.0.8800.2 /usr/lib/.debug/libgirepository-2.0.so.0.8800.2 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.2-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.8800.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 14980402 to 14980186 (-0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGSIZE changed from 145227 to 146153 (+1%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGSIZE changed from 142967 to 143051 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGSIZE changed from 142375 to 142890 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGSIZE changed from 146808 to 147028 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGSIZE changed from 174848 to 209551 (+20%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository/tests -> /usr/src/debug/glib-2.0/2.88.2/girepository/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio/xdgmime -> /usr/src/debug/glib-2.0/2.88.2/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.88.1/gmodule/tests -> /usr/src/debug/glib-2.0/2.88.2/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/glib/libcharset -> /usr/src/debug/glib-2.0/2.88.2/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository/cmph -> /usr/src/debug/glib-2.0/2.88.2/girepository/cmph, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio/inotify -> /usr/src/debug/glib-2.0/2.88.2/gio/inotify, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio/tests -> /usr/src/debug/glib-2.0/2.88.2/gio/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository/inspector -> /usr/src/debug/glib-2.0/2.88.2/girepository/inspector, directory renam
 ed /usr/src/debug/glib-2.0/2.88.1/gobject/tests -> /usr/src/debug/glib-2.0/2.88.2/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository -> /usr/src/debug/glib-2.0/2.88.2/girepository, directory renamed /usr/src/debug/glib-2.0/2.88.1/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.88.2/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.88.1/glib/tests -> /usr/src/debug/glib-2.0/2.88.2/glib/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/glib -> /usr/src/debug/glib-2.0/2.88.2/glib, directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository/decompiler -> /usr/src/debug/glib-2.0/2.88.2/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.88.1/girepository/compiler -> /usr/src/debug/glib-2.0/2.88.2/girepository/compiler, directory renamed /usr/src/debug/glib-2.0/2.88.1/gthread/tests -> /usr/src/debug/glib-2.0/2.88.2/gthread/tests, directory renamed /usr/src/debug/glib-2.0/2.88.1/glib/deprecated -> /usr/src/debug/glib-2.
 0/2.88.2/glib/deprecated, directory renamed /usr/src/debug/glib-2.0/2.88.1/gthread -> /usr/src/debug/glib-2.0/2.88.2/gthread, directory renamed /usr/src/debug/glib-2.0/2.88.1/gmodule -> /usr/src/debug/glib-2.0/2.88.2/gmodule, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.88.2/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio/tests/modules -> /usr/src/debug/glib-2.0/2.88.2/gio/tests/modules, directory renamed /usr/src/debug/glib-2.0/2.88.1/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.88.2/glib/tests/path-test-subdir, directory renamed /usr/src/debug/glib-2.0/2.88.1/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.88.2/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.88.1/gio -> /usr/src/debug/glib-2.0/2.88.2/gio, directory renamed /usr/src/debug/glib-2.0/2.88.1/gobject -> /usr/src/debug/glib-2.0/2.88.2/gobject
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25850836 to 25850317 (-0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.8800.1 /usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libgmodule-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1", added "/usr/lib/libgobject-2.0.so.0.8800.2 /usr/lib/libgthread-2.0.so.0.8800.2 /usr/lib/libgio-2.0.so.0.8800.2 /usr/lib/libgmodule-2.0.so.0.8800.2 /usr/lib/libgirepository-2.0.so.0.8800.2 /usr/lib/libglib-2.0.so.0.8800.2"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.88.1" to "2.88.2"
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.88/glib-2.88.1.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.88/glib-2.88.2.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-
 on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.88.1 [default] to 2.88.2 [default]
packages/x86-64-v3-poky-linux/glib-2.0: PV changed from "2.88.1" to "2.88.2"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.1 to libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.1 to libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.1 to libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.1 to libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.1 to libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.1 to libgthread-2.0.so.0.8800.2
  /usr/lib/libgio-2.0.so.0.8800.1 moved to /usr/lib/libgio-2.0.so.0.8800.2
  /usr/lib/libgirepository-2.0.so.0.8800.1 moved to /usr/lib/libgirepository-2.0.so.0.8800.2
  /usr/lib/libglib-2.0.so.0.8800.1 moved to /usr/lib/libglib-2.0.so.0.8800.2
  /usr/lib/libgmodule-2.0.so.0.8800.1 moved to /usr/lib/libgmodule-2.0.so.0.8800.2
  /usr/lib/libgobject-2.0.so.0.8800.1 moved to /usr/lib/libgobject-2.0.so.0.8800.2
  /usr/lib/libgthread-2.0.so.0.8800.1 moved to /usr/lib/libgthread-2.0.so.0.8800.2

--===============7222185495370726186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.88.1-2.88.2-2.88.patch"

RnJvbSAzZjU5Y2Q3OGMwMDVmYjcyOWQ2MDk5NDA1MDk3NzQyYWNmOTBjODRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjYgSnVuIDIwMjYgMDU6MjE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMC1pbml0aWFsLGdsaWItMi4wOiB1cGdyYWRlIDIuODguMSAtPiAyLjg4LjIsMi44OC4x
IC0+CiAyLjg4LjIKCi0tLQogLi4uLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9nbGliLTIuMC9maWxlcy8wMDAxLUZp
eC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggfCAyICstCiAuLi4vMDAwMS1JbnN0
YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoICAgIHwgMiArLQog
Li4uUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5w
YXRjaCB8IDIgKy0KIC4uLmdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxk
LWhvc3Qtb25seS0ucGF0Y2ggfCAyICstCiAuLi4vZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWlj
cy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggIHwgNCArKy0tCiAuLi5tZXNvbi5idWlsZC1k
by1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIHwgNCArKy0tCiAu
Li4vMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBh
dGNoIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9k
dWxlcy5wYXRjaCAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
L3NraXAtdGltZW91dC5wYXRjaCAgICAgICAgICAgfCAyICstCiAuLi57Z2xpYi0yLjAtaW5pdGlh
bF8yLjg4LjEuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjIuYmJ9IHwgMAogLi4uL2dsaWIt
Mi4wL3tnbGliLTIuMF8yLjg4LjEuYmIgPT4gZ2xpYi0yLjBfMi44OC4yLmJifSAgICAgICB8IDAK
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjAtaW5p
dGlhbF8yLjg4LjEuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjIuYmJ9ICgxMDAlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjg4LjEuYmIgPT4gZ2xp
Yi0yLjBfMi44OC4yLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZp
bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qt
d3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAppbmRleCBiNmFkNjAzNWM1
Li4xMWU5NTA4ODQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJp
bmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg5
YzA2NDQyNTQwMjNjZmQ1YTIyNjg1ZmJiYjUwZWJkOGM2MjI0ZGYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDgzMjgyYTk3OGM1MTA3YzY4MmFiNGM3NWFjNzQwNzk2MWJiMTc3ODggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTUgRmViIDIwMTkgMTE6MTc6MjcgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZWZpeCBleGVjdXRhYmxlcyB3aXRoICRiaW5kaXIgaW4g
cGtnLWNvbmZpZyBmaWxlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJj
LUxpbnV4LnBhdGNoCmluZGV4IGM2OTgzNzZkM2YuLjQwMzk4ZjI1ZjcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVj
bGliYy1MaW51eC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDcyN2Q1MjM5YzM3OGM4MjBmODc0YjUwZDUzOWY4N2I1NGEzNzU3YTkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGQwMmUwNjFmODMwYjcwNTE4NzhlOGE0NjdmMzkzZTg1MTEw
ZTRlMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogU2F0LCAxNSBNYXIgMjAxNCAyMjo0MjoyOSAtMDcwMAogU3ViamVj
dDogW1BBVENIXSBGaXggREFUQURJUk5BTUUgb24gdWNsaWJjL0xpbnV4CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9k
dWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0u
cGF0Y2gKaW5kZXggMThkNjljNGE0My4uMmFmMTBiMTY3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMt
bGliZXhlY19QUk9HUkFNLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWYxMzU0YjE2YWVmZmJmZWZjN2U4ZDMyMTYwYzk3MTA1
YTkzYTg0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzJhNThkMTlhZTdmODA5ODVk
OWM5MTc1MWZkNmMzNTk0NjRjZTI5MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEp1
c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDIyIE1h
ciAyMDE2IDE1OjE0OjU4ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEluc3RhbGwgZ2lvLXF1ZXJ5
bW9kdWxlcyBhcyBsaWJleGVjX1BST0dSQU0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQt
cGF0aHMtaW4tc2NoZW1hcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1h
cy5wYXRjaAppbmRleCA1OTRjNDQ0Nzk3Li5lZWY3YzlkYjg2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1k
ZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1w
YXRocy1pbi1zY2hlbWFzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MjM3ZWQ1ZTE2Nzdj
M2IwZWE1MGM5MmRjMzZlODY0Y2E4NjBlMWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjMWVhYTRkZDJlMmMwOWU5OTMwOTQ5ZDRhOWVlMDhlM2UyMWIxYTg4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBGcmksIDEyIEp1biAyMDE1IDE3OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIFJlbW92ZSB0aGUgd2FybmluZyBhYm91dCBkZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRl
c3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5j
LWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAppbmRleCAyNDM5NjFhYjhlLi4x
NGM4YzcwMWJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVz
dHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA1MjFiMTI5YzdjNjMyOWEwMWE1ZjU2YjQ2MDRlYTFiNzQ5OWIwM2Fk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkOWM3NWFlZjhiNjg4ODdlZjRmMWRkOWJi
NzM1NDJjYzBmZjAyYjIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDggSmFuIDIwMjAg
MTg6MjI6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2lvL3Rlc3RzL3Jlc291cmNlcy5jOiBj
b21tZW50IG91dCBhIGJ1aWxkIGhvc3Qtb25seSB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xh
bmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmluZGV4IGZkYTQ0
OGUzY2MuLjFmZTAwZGY4ZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0
b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2
OWU4MGUzYjkzNmU1N2VhZWNkYTIzMWIxMmI1NTRjMDc1MjE4ZGViIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBmNzIyOTZjYmQ2ZjA0ZjRmNzRiNDliOTYxZjNjYjQwNWVmYTExMmYwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24gY2xhbmcgYXMgd2VsbApAQCAtMTQsNyArMTQs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggYmI2ODM5OC4uM2U5ZTAzYSAxMDA2NDQK
K2luZGV4IDI1ODAyYWEuLmM1M2QyMTYgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIv
bWVzb24uYnVpbGQKIEBAIC0yMTAwLDcgKzIxMDAsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVp
bGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJs
ZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRleCA3MTE1NzJiMTM5Li5mYTQ2
YmVlOTA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWls
ZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlNzllMTliYzFlNmE3ZThmYjg1OTZjNGE5ZDYwZTIxMDMyMzUwNzg0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzYxNDQ3NGFjOTk4NDIyZDAzNDhjMTZjNTg4
YTlhZDUwYzk3Mzk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIwMjMgMjI6Mjg6
MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBlbmFibGUgcGlk
ZmQgZmVhdHVyZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5i
dWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAzZTllMDNhLi5mMTk1N2YwIDEwMDY0NAoraW5kZXgg
YzUzZDIxNi4uMzMwY2NmMyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5i
dWlsZAogQEAgLTEwOTgsNyArMTA5OCw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNsdWRlIDxzeXMv
c3lzY2FsbC5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUt
cHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCmluZGV4IDBmOTgxMzM4MDIuLjdh
MmMxNjg3NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29k
ZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDZkOTIwODZhNzkxYzIzMjBiNDY4MTc2NDBjZWJhOTAxMzYxZjM0ZmUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGYzN2NlYzk1MWUzYzU2NGQ5NmFmY2ZlZTEyNzlmNGE5ZmFmY2M4
MjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMyBPY3QgMjAxNyAxMDo0NTo1NSArMDMw
MAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgcHl0aG9uIHBhdGggaW50byB2YXJp
b3VzIHRvb2xzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9y
ZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
cmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCA3ZjMyNmQ4NTg4Li40MjFkY2I4ZjlhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1v
ZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIwNzIxZDI0NDg1YTUxMjA2MTg5YjMx
Mjg4MzVjM2MzMDk4NjAxYjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ5OWU4NWY2
MDY1MzA5NTA1MTQ0NDZhMzExM2ZlMzljOGM2NzkzNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAx
MSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVs
b2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKaW5k
ZXggNDM1MDZkNjlmNS4uMjVmNTMyNDc4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZDU0ODU1NGI4NzkzZDgyYjkzYzdjN2IyMTk4ZTM2OGI1NzkxNjk1OCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTE5NDIzY2VjNWIzMmJmYTVmZjFiY2Q1NjdlNTFmYTU1NzEzZjk0ZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIgMjAyNCAxNjoyNzowOSArMDAwMAogU3ViamVjdDog
W1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5kaW5nIHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44OC4xLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjIuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
LWluaXRpYWxfMi44OC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMC1pbml0aWFsXzIuODguMi5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjBfMi44OC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjBfMi44OC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg4LjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODguMi5iYgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLmluYwppbmRleCA4ZDIzMDkyMTg3Li45MmI5MTllMDBiIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYworKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLmluYwpAQCAtMjM4LDcgKzIzOCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggXAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5h
YmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIFwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTFhYjgwNGM1
NmY2ZWFiM2U1MDQ1Yzc3NGQxMjkwYWM1ZTRjOTIzZDRmOWEzZDhlMzMxMjNiZWU0NWMxODQwZSIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNmM2YyMTVhNjQwYzhhNDI1N2YxNDMxNzU4
NmI4ZjFmZGQyNWExMGE5M2NiNGJkZGExNDdjMGY5YWQ4OGU3NGYiCiAKICMgRmluZCBhbnkgbWVz
b24gY3Jvc3MgZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQgYXJlIHJlbGV2YW50IGZvciB0aGUgY3Vy
cmVudAogIyBidWlsZCAodXNpbmcgc2l0ZWluZm8pIGFuZCBhZGQgdGhlbSB0byBFWFRSQV9PRU1F
U09OLgotLSAKMi40Ny4xCgo=

--===============7222185495370726186==--

