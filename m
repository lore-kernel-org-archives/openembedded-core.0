Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073F2CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1551.1780328127355628892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ti9snvj+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EZU1czWr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3581b-bd7d3707-31c9-4aa1-b4ce-84247ee601aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KpgiFLbhv7yO6GBaUob+aYmZnz6zhiiPeaonwq7aHm0=;
	b=ti9snvj+6ljmWyAov9DnllnaE80VZS6+xJBkEtZj3onLanen8Nwaff31Q2mm8s8T
	ryg7KbKNBGWKHwfb3w3IwN0DwB8/ZAFp1fdA6dwpnZ4ejAib3z6bzCbs3pEPMTRDsiA
	88OULbXYRER6+0ItscQFG3aRywvqTzDKPphcu1PE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KpgiFLbhv7yO6GBaUob+aYmZnz6zhiiPeaonwq7aHm0=;
	b=EZU1czWr5CEwdWhZ1prsmpUd7i4eM8Kn/4D4fk9PqTI57+U8SDSkS4waNNpVWO/4
	ZFpWBKyy95cxv67Lt7+1n7LYGNrl3vRU1Gh3TXT5dGDzNxGXgyY88llA+p2KOA/RfiK
	XrEVoaT8dJ4MQbVAeGPi6z05RFkFz+VD+Zo04CmA=
Content-Type: multipart/mixed; boundary="===============0748106493048818382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.88.1,2.88.1 SUCCEEDED
Message-ID: <0101019e83d3581b-bd7d3707-31c9-4aa1-b4ce-84247ee601aa-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237842

--===============0748106493048818382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.88.1,2.88.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.88.0-2.88.1-2.88.patch
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
From 540e7bd65774de41635527cab93c85e174afcfa2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 05:21:39 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.88.0 -> 2.88.1,2.88.0 ->
 2.88.1

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch    | 6 +++---
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch        | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch  | 4 ++--
 ...move-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...o-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch      | 4 ++--
 ...son.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 4 ++--
 meta/recipes-core/glib-2.0/files/relocate-modules.patch     | 4 ++--
 meta/recipes-core/glib-2.0/files/skip-timeout.patch         | 2 +-
 ...lib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.1.bb} | 0
 .../glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.1.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 13 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 8b783e81ea..3a2dc7934a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
+From de2ec3a974e54a929d9899bdb6778e0b3e6b57d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 2f8f188..57c48d2 100644
+index c7da257..8a00989 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep = declare_dependency(link_with : libgio,
@@ -46,7 +46,7 @@ index 2f8f188..57c48d2 100644
    uninstalled_variables : [
      'gio=${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 209bcbf..a86cfd3 100644
+index 0fb6e26..9eebf73 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -480,9 +480,10 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b91624da8b..401eee6a6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
+From df518b757778f26f9649ee9d7eadfb9077474291 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 5b7c323996..ea30a908ac 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
+From e2546fe4a0518c878dccf4a90991c313772de309 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 39256d3..2f8f188 100644
+index a3e6f18..c7da257 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -1071,6 +1071,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d6dd66357a..2f1284d107 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
+From 2fa27e70c08a012119212991e3b7d04396efe8da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 7a2fc0b7ef..bb6017fb39 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
+From 6b29ad4425f6a0734d43953bbdd75b512241d8a0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 149833dc43..ed1182b49b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
+From c9d4bbc3c0fed2d183c5190c268e3f565c1481d5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index dab1d61..cc3a5ed 100644
+index bb68398..3e9e03a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index efd5d3de1b..feb0d8ec49 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
+From 3ae89d68b475f26b8eae3a11af6e4d98b981d4b1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index cc3a5ed..58dd87a 100644
+index 3e9e03a..f1957f0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8dbdf746b7..1157a4808a 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
+From 881de7ab9217d71be383822e646c9e4e6fe7de85 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index 0578b74..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 7e794e9..4b619f8 100755
+index f388714..37ed491 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 4c2638ae61..bff144a91e 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
+From 4db434234cda89524ad6783b34dcfc4eda4d70b9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 38761e4..afa7878 100644
+index 7311775..abc2c79 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -1312,6 +1312,24 @@ get_gio_module_dir (void)
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 8ef140d0d7..4b1c215730 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
+From 1256adb434062ecd3dfa726566bf8b8d9db67e53 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7fcfd2bf38..1c18e1a0cc 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,7 +238,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "3546251ccbb3744d4bc4eb48354540e1f6200846572bab68e3a2b7b2b64dfd07"
+SRC_URI[archive.sha256sum] = "51ab804c56f6eab3e5045c774d1290ac5e4c923d4f9a3d8e33123bee45c1840e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============0748106493048818382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGSIZE changed from 126718 to 143093 (+13%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.8800.0 /usr/lib/libgirepository-2.0.so.0.8800.0 /usr/lib/libgobject-2.0.so.0.8800.0 /usr/lib/libgthread-2.0.so.0.8800.0 /usr/lib/libglib-2.0.so.0.8800.0 /usr/lib/libgio-2.0.so.0.8800.0", added "/usr/lib/libgmodule-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1 /usr/lib/libgio-2.0.so.0.8800.1"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1

--===============0748106493048818382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgio-2.0.so.0.8800.0 /usr/lib/.debug/libgmodule-2.0.so.0.8800.0 /usr/lib/.debug/libglib-2.0.so.0.8800.0 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8800.0 /usr/lib/.debug/libgirepository-2.0.so.0.8800.0 /usr/lib/.debug/libgobject-2.0.so.0.8800.0 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py", added "/usr/lib/.debug/libgio-2.0.so.0.8800.1 /usr/lib/.debug/libgmodule-2.0.so.0.8800.1 /usr/lib/.debug/libglib-2.0.so.0.8800.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8800.1 /usr/lib/.debug/libgirepository-2.0.so.0.8800.1 /usr/lib/.debug/libgobject-2.0.so.0.8800.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 40414962 to 40436634 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 14979398 to 14980402 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-de: PKGSIZE changed from 144034 to 145227 (+1%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGSIZE changed from 167531 to 168452 (+1%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGSIZE changed from 147029 to 146808 (-0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGSIZE changed from 185538 to 186023 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGSIZE changed from 126718 to 143093 (+13%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGSIZE changed from 180405 to 180510 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 14130294 to 14143232 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/tests -> /usr/src/debug/glib-2.0/2.88.1/girepository/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gthread -> /usr/src/debug/glib-2.0/2.88.1/gthread, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests -> /usr/src/debug/glib-2.0/2.88.1/gio/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests/modules -> /usr/src/debug/glib-2.0/2.88.1/gio/tests/modules, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/inspector -> /usr/src/debug/glib-2.0/2.88.1/girepository/inspector, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.88.1/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib -> /usr/src/debug/glib-2.0/2.88.1/glib, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/deprecated -> /usr/src/debug/glib-2.0/2.88.1/glib
 /deprecated, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/compiler -> /usr/src/debug/glib-2.0/2.88.1/girepository/compiler, directory renamed /usr/src/debug/glib-2.0/2.88.0/gmodule -> /usr/src/debug/glib-2.0/2.88.1/gmodule, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio -> /usr/src/debug/glib-2.0/2.88.1/gio, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/xdgmime -> /usr/src/debug/glib-2.0/2.88.1/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.88.1/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/decompiler -> /usr/src/debug/glib-2.0/2.88.1/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.88.1/glib/tests/path-test-subdir, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/inotify -> /usr/src/debug/glib-2.0/2.88.1/gio/inotify, directory renamed /usr/src/debug/glib-2.
 0/2.88.0/gmodule/tests -> /usr/src/debug/glib-2.0/2.88.1/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject -> /usr/src/debug/glib-2.0/2.88.1/gobject, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/tests -> /usr/src/debug/glib-2.0/2.88.1/glib/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/libcharset -> /usr/src/debug/glib-2.0/2.88.1/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject/tests -> /usr/src/debug/glib-2.0/2.88.1/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gthread/tests -> /usr/src/debug/glib-2.0/2.88.1/gthread/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository -> /usr/src/debug/glib-2.0/2.88.1/girepository, directory renamed /usr/src/debug/glib-2.0/2.88.0/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.88.1/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/cmph -> /usr/src/debug/glib-2.0/2.88.1/girepository/cmph
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25837087 to 25850836 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.8800.0 /usr/lib/libgobject-2.0.so.0.8800.0 /usr/lib/libgthread-2.0.so.0.8800.0 /usr/lib/libgirepository-2.0.so.0.8800.0 /usr/lib/libgmodule-2.0.so.0.8800.0 /usr/lib/libglib-2.0.so.0.8800.0", added "/usr/lib/libgio-2.0.so.0.8800.1 /usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libgmodule-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 5050302 to 5054398 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.88/glib-2.88.0.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.88/glib-2.88.1.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-
 on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0: PV changed from "2.88.0" to "2.88.1"
Changes to packages/x86-64-v3-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.0 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.0 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.0 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.0 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.0 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.0 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.0 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.0 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.0 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.0 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.0 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.0 moved to /usr/lib/libgthread-2.0.so.0.8800.1

--===============0748106493048818382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.88.0-2.88.1-2.88.patch"

RnJvbSA1NDBlN2JkNjU3NzRkZTQxNjM1NTI3Y2FiOTNjODVlMTc0YWZjZmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNToyMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wLWluaXRpYWwsZ2xpYi0yLjA6IHVwZ3JhZGUgMi44OC4wIC0+IDIuODguMSwyLjg4LjAg
LT4KIDIuODguMQoKLS0tCiAuLi4vMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNv
bmZpZy1maWxlcy5wYXRjaCAgICB8IDYgKysrLS0tCiAuLi4vZmlsZXMvMDAwMS1GaXgtREFUQURJ
Uk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi8wMDAxLUluc3Rh
bGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggIHwgNCArKy0tCiAu
Li5tb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRj
aCB8IDIgKy0KIC4uLm8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0
LW9ubHktLnBhdGNoIHwgMiArLQogLi4uLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1j
bGFuZy1hcy13ZWxsLnBhdGNoICAgICAgfCA0ICsrLS0KIC4uLnNvbi5idWlsZC1kby1ub3QtZW5h
YmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIHwgNCArKy0tCiAuLi4wMTAtRG8t
bm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaCB8IDQgKyst
LQogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRj
aCAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGlt
ZW91dC5wYXRjaCAgICAgICAgIHwgMiArLQogLi4ubGliLTIuMC1pbml0aWFsXzIuODguMC5iYiA9
PiBnbGliLTIuMC1pbml0aWFsXzIuODguMS5iYn0gfCAwCiAuLi4vZ2xpYi0yLjAve2dsaWItMi4w
XzIuODguMC5iYiA9PiBnbGliLTIuMF8yLjg4LjEuYmJ9ICAgICB8IDAKIG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogMTMg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWluaXRpYWxfMi44OC4wLmJiID0+
IGdsaWItMi4wLWluaXRpYWxfMi44OC4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi44OC4wLmJiID0+IGdsaWItMi4wXzIuODguMS5iYn0g
KDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRv
LXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggOGI3ODNlODFlYS4uM2EyZGM3OTM0YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3Jp
dGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29u
ZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZmUzOTY1MzgzZDk0YjMwMzBl
ODVhYjg5OTk1NTg1ODcxMGZlYzVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkZTJl
YzNhOTc0ZTU0YTkyOWQ5ODk5YmRiNjc3OGUwYjNlNmI1N2QwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBGcmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERv
IG5vdCBwcmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGluIHBrZy1jb25maWcgZmlsZXMK
QEAgLTE1LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2dpby9tZXNvbi5idWlsZCBiL2dpby9tZXNv
bi5idWlsZAotaW5kZXggMmY4ZjE4OC4uNTdjNDhkMiAxMDA2NDQKK2luZGV4IGM3ZGEyNTcuLjhh
MDA5ODkgMTAwNjQ0CiAtLS0gYS9naW8vbWVzb24uYnVpbGQKICsrKyBiL2dpby9tZXNvbi5idWls
ZAogQEAgLTkzNCwxNyArOTM0LDE4IEBAIGxpYmdpb19kZXAgPSBkZWNsYXJlX2RlcGVuZGVuY3ko
bGlua193aXRoIDogbGliZ2lvLApAQCAtNDYsNyArNDYsNyBAQCBpbmRleCAyZjhmMTg4Li41N2M0
OGQyIDEwMDY0NAogICAgdW5pbnN0YWxsZWRfdmFyaWFibGVzIDogWwogICAgICAnZ2lvPSR7cHJl
Zml4fS9naW8vZ2lvJywKIGRpZmYgLS1naXQgYS9nbGliL21lc29uLmJ1aWxkIGIvZ2xpYi9tZXNv
bi5idWlsZAotaW5kZXggMjA5YmNiZi4uYTg2Y2ZkMyAxMDA2NDQKK2luZGV4IDBmYjZlMjYuLjll
ZWJmNzMgMTAwNjQ0CiAtLS0gYS9nbGliL21lc29uLmJ1aWxkCiArKysgYi9nbGliL21lc29uLmJ1
aWxkCiBAQCAtNDgwLDkgKzQ4MCwxMCBAQCBwa2cuZ2VuZXJhdGUobGliZ2xpYiwKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1F
LW9uLXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAppbmRleCBiOTE2MjRk
YThiLi40MDFlZWU2YTZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNs
aWJjLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NjZjNThhYWUzNWY5ZTJiY2Vm
NTIzOGUwMzMxYTExOWUwZTUxYWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkZjUx
OGI3NTc3NzhmMjZmOTY0OWVlOWQ3ZWFkZmI5MDc3NDc0MjkxIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTUg
TWFyIDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IERBVEFESVJOQU1F
IG9uIHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1x
dWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4IDViN2MzMjM5OTYuLmVh
MzBhOTA4YWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5
bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBk
ZTNhM2E3OTFjYTMyZjIzMzBlYjNhOGFkOWRhMGZlNmRjZTk1MGMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGUyNTQ2ZmU0YTA1MThjODc4ZGNjZjRhOTA5OTFjMzEzNzcyZGUzMDkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29u
ZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9HUkFN
CkBAIC0xMyw3ICsxMyw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3Bl
Y2lmaWNdCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9n
aW8vbWVzb24uYnVpbGQgYi9naW8vbWVzb24uYnVpbGQKLWluZGV4IDM5MjU2ZDMuLjJmOGYxODgg
MTAwNjQ0CitpbmRleCBhM2U2ZjE4Li5jN2RhMjU3IDEwMDY0NAogLS0tIGEvZ2lvL21lc29uLmJ1
aWxkCiArKysgYi9naW8vbWVzb24uYnVpbGQKIEBAIC0xMDcxLDYgKzEwNzEsNyBAQCBnaW9fcXVl
cnltb2R1bGVzID0gZXhlY3V0YWJsZSgnZ2lvLXF1ZXJ5bW9kdWxlcycsICdnaW8tcXVlcnltb2R1
bGVzLmMnLCAnZ2lvbW9kdQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1z
Y2hlbWFzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1v
dmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCmlu
ZGV4IGQ2ZGQ2NjM1N2EuLjJmMTI4NGQxMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQt
cGF0aHMtaW4tc2NoZW1hcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNj
aGVtYXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4MjlmMzIwNWU0ZDgzOTBmMDJlYWE4
ZTdhN2JmODVlNTFjYmI3ZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmYTI3ZTcw
YzA4YTAxMjExOTIxMjk5MWUzYjdkMDQzOTZlZmU4ZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IEZyaSwgMTIgSnVuIDIwMTUgMTc6MDg6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3Zl
IHRoZSB3YXJuaW5nIGFib3V0IGRlcHJlY2F0ZWQgcGF0aHMgaW4gc2NoZW1hcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3Vy
Y2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1v
dXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCmluZGV4IDdhMmZjMGI3ZWYuLmJiNjAxN2ZiMzkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRl
c3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJj
ZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDkxMmU2NzRiYjBhM2I1MWRhYmFhNThkYTE4MzQ0OTFlZjk0ZTZhMmEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDZiMjlhZDQ0MjVmNmEwNzM0ZDQzOTUzYmJkZDc1YjUxMjI0
MWQ4YTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoyMjo0NiAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1lbnQgb3V0
IGEgYnVpbGQgaG9zdC1vbmx5IHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxs
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4t
YXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKaW5kZXggMTQ5ODMzZGM0My4uZWQx
MTgyYjQ5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0
LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI2ZGRhZTAyZDc2
NzdiY2ZmN2MzOTMzZWU4NTZkMzRkZjQxYjU0OGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGM5ZDRiYmMzYzBmZWQyZDE4M2M1MTkwYzI2OGUzZjU2NWMxNDgxZDUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTog
U2F0LCAxMiBPY3QgMjAxOSAxNzo0NjoyNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbjog
UnVuIGF0b21pY3MgdGVzdCBvbiBjbGFuZyBhcyB3ZWxsCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWls
ZCBiL21lc29uLmJ1aWxkCi1pbmRleCBkYWIxZDYxLi5jYzNhNWVkIDEwMDY0NAoraW5kZXggYmI2
ODM5OC4uM2U5ZTAzYSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWls
ZAogQEAgLTIxMDAsNyArMjEwMCw3IEBAIGF0b21pY2RlZmluZSA9ICcnJwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3Qt
ZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZl
YXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCmluZGV4IGVmZDVkM2RlMWIuLmZlYjBkOGVjNDkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVp
bGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1l
bmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGM2Y2QzYzBhNjZhZThmMjEwMTg1ZTBjYjA1YjIxNzJkYzE5MmNlOWUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDNhZTg5ZDY4YjQ3NWYyNmI4ZWFlM2ExMWFmNmU0ZDk4Yjk4MWQ0
YjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogRGF0ZTogU2F0LCAxNiBTZXAgMjAyMyAyMjoyODoyNyArMDIwMAog
U3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogZG8gbm90IGVuYWJsZSBwaWRmZCBmZWF0dXJl
cyBvbiBuYXRpdmUgZ2xpYgpAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVz
b24uYnVpbGQKLWluZGV4IGNjM2E1ZWQuLjU4ZGQ4N2EgMTAwNjQ0CitpbmRleCAzZTllMDNhLi5m
MTk1N2YwIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAt
MTA5OCw3ICsxMDk4LDggQEAgaWYgY2MubGlua3MoJycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5v
dC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0
aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKaW5kZXggOGRiZGY3NDZiNy4uMTE1N2E0ODA4YSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3Qt
aGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1w
YXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDBlNDAy
MzBlNmEzYzUyYjc5YzZmOTJlOGMwNjBiZDRkOTNmMDM3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gODgxZGU3YWI5MjE3ZDcxYmUzODM4MjJlNjQ2YzllNGU2ZmU3ZGU4NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVHVlLCAzIE9jdCAyMDE3IDEwOjQ1OjU1ICswMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSBweXRob24gcGF0aCBpbnRvIHZhcmlvdXMgdG9vbHMK
QEAgLTMyLDcgKzMyLDcgQEAgaW5kZXggMDU3OGI3NC4uNTZlOGUyZSAxMDA3NTUKICAjIHB5bGlu
dDogZGlzYWJsZT10b28tbWFueS1saW5lcywgbWlzc2luZy1kb2NzdHJpbmcsIGludmFsaWQtbmFt
ZQogIAogZGlmZiAtLWdpdCBhL2dvYmplY3QvZ2xpYi1ta2VudW1zLmluIGIvZ29iamVjdC9nbGli
LW1rZW51bXMuaW4KLWluZGV4IDdlNzk0ZTkuLjRiNjE5ZjggMTAwNzU1CitpbmRleCBmMzg4NzE0
Li4zN2VkNDkxIDEwMDc1NQogLS0tIGEvZ29iamVjdC9nbGliLW1rZW51bXMuaW4KICsrKyBiL2dv
YmplY3QvZ2xpYi1ta2VudW1zLmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4
IDRjMjYzOGFlNjEuLmJmZjE0NGE5MWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMTRiYmM3N2JjNDY1YjQyNDU0MTEyYmM2YTMzMjY0YzJjM2UwMTNlNSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGRiNDM0MjM0Y2RhODk1MjRhZDY3ODNiMzRkY2ZjNGVkYTRk
NzBiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJlY3Rv
cnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTIxLDcgKzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogUGV0
ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9naW8vZ2lvbW9kdWxlLmMgYi9naW8vZ2lvbW9k
dWxlLmMKLWluZGV4IDM4NzYxZTQuLmFmYTc4NzggMTAwNjQ0CitpbmRleCA3MzExNzc1Li5hYmMy
Yzc5IDEwMDY0NAogLS0tIGEvZ2lvL2dpb21vZHVsZS5jCiArKysgYi9naW8vZ2lvbW9kdWxlLmMK
IEBAIC0xMzEyLDYgKzEzMTIsMjQgQEAgZ2V0X2dpb19tb2R1bGVfZGlyICh2b2lkKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCmlu
ZGV4IDhlZjE0MGQwZDcuLjRiMWMyMTU3MzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGY3N2I5ZGQ3MmRkMDEwM2M3YTI4ZGQ3ZTFjZGY2ZTMxNmVjYmYwMzAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDEyNTZhZGI0MzQwNjJlY2QzZGZhNzI2NTY2YmY4YjhkOWRiNjdlNTMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
YXJtLmNvbT4KIERhdGU6IFRodSwgMjggTWFyIDIwMjQgMTY6Mjc6MDkgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gU2tpcCAvdGltZW91dC9yb3VuZGluZyB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODguMC5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44OC4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIu
MC1pbml0aWFsXzIuODguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAtaW5pdGlhbF8yLjg4LjEuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wXzIuODguMC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuODguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44OC4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg4LjEuYmIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi5pbmMKaW5kZXggN2ZjZmQyYmYzOC4uMWMxOGUxYTBjYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi5pbmMKQEAgLTIzOCw3ICsyMzgsNyBAQCBTUkNfVVJJOmFwcGVuZDpj
bGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVu
YWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjM1NDYyNTFj
Y2JiMzc0NGQ0YmM0ZWI0ODM1NDU0MGUxZjYyMDA4NDY1NzJiYWI2OGUzYTJiN2IyYjY0ZGZkMDci
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1MWFiODA0YzU2ZjZlYWIzZTUwNDVjNzc0
ZDEyOTBhYzVlNGM5MjNkNGY5YTNkOGUzMzEyM2JlZTQ1YzE4NDBlIgogCiAjIEZpbmQgYW55IG1l
c29uIGNyb3NzIGZpbGVzIGluIEZJTEVTUEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1
cnJlbnQKICMgYnVpbGQgKHVzaW5nIHNpdGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VN
RVNPTi4KLS0gCjIuNDcuMQoK

--===============0748106493048818382==--

