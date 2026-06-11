Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDA9CD98D7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50602.1781195492842290978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JqJhYfCt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e/cVdw4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb7864a49-83a40f14-99bc-4f33-a388-8693f9a384b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4p+RzFulLbBp/dLiCpBP6WGXo1aO9io/S8g7AQhhJE0=;
	b=JqJhYfCtuhpysg362smYpwtVEMXBEU6gLMOKsGX9nrr1cRATEkVPJTJiQBsjOIht
	GRd+HPkrRS7WSoYgipl7hSn84RvsVuwIx6tml4HAU89YVN5dQG3nbQt8YEvXy1R0eop
	YjFnQS9223GcjvJfYpb+FB9XNiq/n6+gqp1QD3MA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4p+RzFulLbBp/dLiCpBP6WGXo1aO9io/S8g7AQhhJE0=;
	b=e/cVdw4jDzza+wrsqVahPprzITzoBC8PN++jnlGtepDrhr+XIZpORNIQC5acJ3nv
	wC6mfe7qOF1TA/GAZ2UMscJWNxpl6ZUkLJoWLIc2KsqTPidEFSxrTJ3+UtyVEO44tzS
	ypfx2x2s5VJrpZyGuzt9lEhnb0LsYoifXnxm6Pdk=
Content-Type: multipart/mixed; boundary="===============7296757358739440062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.88.1,2.88.1 SUCCEEDED
Message-ID: <0101019eb7864a49-83a40f14-99bc-4f33-a388-8693f9a384b6-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238454

--===============7296757358739440062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.88.1,2.88.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-glib-2.0-initial-upgrade-2.88.0-2.88.1-2.88.patch
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
From 65d308d44255f6c9ff466b8c0dcaedf747b92727 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 06:53:52 +0000
Subject: [PATCH] glib-2.0,glib-2.0-initial: upgrade 2.88.0 -> 2.88.1,2.88.0 ->
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
index 8b783e81ea..b6ad6035c5 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
+From 89c0644254023cfd5a22685fbbb50ebd8c6224df Mon Sep 17 00:00:00 2001
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
index b91624da8b..c698376d3f 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
+From 727d5239c378c820f874b50d539f87b54a3757a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 5b7c323996..18d69c4a43 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
+From af1354b16aeffbfefc7e8d32160c97105a93a84f Mon Sep 17 00:00:00 2001
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
index d6dd66357a..594c444797 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
+From 6237ed5e1677c3b0ea50c92dc36e864ca860e1bd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 7a2fc0b7ef..243961ab8e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
+From 521b129c7c6329a01a5f56b4604ea1b7499b03ad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 149833dc43..fda448e3cc 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
+From 69e80e3b936e57eaecda231b12b554c075218deb Mon Sep 17 00:00:00 2001
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
index efd5d3de1b..711572b139 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
+From e79e19bc1e6a7e8fb8596c4a9d60e21032350784 Mon Sep 17 00:00:00 2001
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
index 8dbdf746b7..0f98133802 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
+From 6d92086a791c2320b46817640ceba901361f34fe Mon Sep 17 00:00:00 2001
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
index 4c2638ae61..7f326d8588 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
+From 20721d24485a51206189b3128835c3c3098601b3 Mon Sep 17 00:00:00 2001
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
index 8ef140d0d7..43506d69f5 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
+From d548554b8793d82b93c7c7b2198e368b57916958 Mon Sep 17 00:00:00 2001
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
index dee94ec060..8d23092187 100644
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


--===============7296757358739440062==
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgobject-2.0.so.0.8800.0 /usr/lib/.debug/libgirepository-2.0.so.0.8800.0 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.0-gdb.py /usr/lib/.debug/libglib-2.0.so.0.8800.0 /usr/lib/.debug/libgio-2.0.so.0.8800.0 /usr/lib/.debug/libgmodule-2.0.so.0.8800.0 /usr/lib/.debug/libgthread-2.0.so.0.8800.0", added "/usr/lib/.debug/libgobject-2.0.so.0.8800.1 /usr/lib/.debug/libgirepository-2.0.so.0.8800.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8800.1-gdb.py /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8800.1-gdb.py /usr/lib/.debug/libglib-2.0.so.0.8800.1 /usr/lib/.debug/libgmodule-2.0.so.0.8800.1 /usr/lib/.debug/libgio-2.0.so.0.8800.1 /usr/lib/.debug/libgthread-2.0.so.0.8800.1"
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: FILELIST: directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/compiler -> /usr/src/debug/glib-2.0/2.88.1/girepository/compiler, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/tests/path-test-subdir -> /usr/src/debug/glib-2.0/2.88.1/glib/tests/path-test-subdir, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/tests -> /usr/src/debug/glib-2.0/2.88.1/girepository/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gmodule/tests -> /usr/src/debug/glib-2.0/2.88.1/gmodule/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/xdgmime -> /usr/src/debug/glib-2.0/2.88.1/gio/xdgmime, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/libcharset -> /usr/src/debug/glib-2.0/2.88.1/glib/libcharset, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject/tests -> /usr/src/debug/glib-2.0/2.88.1/gobject/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib -> /usr/src/debug/glib-2.0/2.88.1/glib, dir
 ectory renamed /usr/src/debug/glib-2.0/2.88.0/subprojects/gvdb/gvdb -> /usr/src/debug/glib-2.0/2.88.1/subprojects/gvdb/gvdb, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject/tests/performance -> /usr/src/debug/glib-2.0/2.88.1/gobject/tests/performance, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests -> /usr/src/debug/glib-2.0/2.88.1/gio/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/tests -> /usr/src/debug/glib-2.0/2.88.1/glib/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/inspector -> /usr/src/debug/glib-2.0/2.88.1/girepository/inspector, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests/modules -> /usr/src/debug/glib-2.0/2.88.1/gio/tests/modules, directory renamed /usr/src/debug/glib-2.0/2.88.0/glib/deprecated -> /usr/src/debug/glib-2.0/2.88.1/glib/deprecated, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio -> /usr/src/debug/glib-2.0/2.88.1/gio, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/decomp
 iler -> /usr/src/debug/glib-2.0/2.88.1/girepository/decompiler, directory renamed /usr/src/debug/glib-2.0/2.88.0/gthread -> /usr/src/debug/glib-2.0/2.88.1/gthread, directory renamed /usr/src/debug/glib-2.0/2.88.0/gobject -> /usr/src/debug/glib-2.0/2.88.1/gobject, directory renamed /usr/src/debug/glib-2.0/2.88.0/gthread/tests -> /usr/src/debug/glib-2.0/2.88.1/gthread/tests, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/tests/gdbus-object-manager-example -> /usr/src/debug/glib-2.0/2.88.1/gio/tests/gdbus-object-manager-example, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository/cmph -> /usr/src/debug/glib-2.0/2.88.1/girepository/cmph, directory renamed /usr/src/debug/glib-2.0/2.88.0/gio/inotify -> /usr/src/debug/glib-2.0/2.88.1/gio/inotify, directory renamed /usr/src/debug/glib-2.0/2.88.0/girepository -> /usr/src/debug/glib-2.0/2.88.1/girepository, directory renamed /usr/src/debug/glib-2.0/2.88.0/gmodule -> /usr/src/debug/glib-2.0/2.88.1/gmodule
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25837087 to 25850836 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PV changed from "2.88.0" to "2.88.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.8800.0 /usr/lib/libgobject-2.0.so.0.8800.0 /usr/lib/libglib-2.0.so.0.8800.0 /usr/lib/libgio-2.0.so.0.8800.0 /usr/lib/libgirepository-2.0.so.0.8800.0 /usr/lib/libgmodule-2.0.so.0.8800.0", added "/usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1 /usr/lib/libgio-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libgmodule-2.0.so.0.8800.1"
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 5050302 to 5054398 (+0%)
packages/x86-64-v3-poky-linux/glib-2.0: PKGV changed from 2.88.0 [default] to 2.88.1 [default]
packages/x86-64-v3-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.88/glib-2.88.0.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.88/glib-2.88.1.tar.xz;name=archive file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-
 on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
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

--===============7296757358739440062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-glib-2.0-initial-upgrade-2.88.0-2.88.1-2.88.patch"

RnJvbSA2NWQzMDhkNDQyNTVmNmM5ZmY0NjZiOGMwZGNhZWRmNzQ3YjkyNzI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDY6NTM6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMCxnbGliLTIuMC1pbml0aWFsOiB1cGdyYWRlIDIuODguMCAtPiAyLjg4LjEsMi44OC4w
IC0+CiAyLjg4LjEKCi0tLQogLi4uLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4uL2ZpbGVzLzAwMDEtRml4LURBVEFE
SVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCAgICAgICAgfCAyICstCiAuLi4vMDAwMS1JbnN0
YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoICB8IDQgKystLQog
Li4ubW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0
Y2ggfCAyICstCiAuLi5vLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9z
dC1vbmx5LS5wYXRjaCB8IDIgKy0KIC4uLi8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24t
Y2xhbmctYXMtd2VsbC5wYXRjaCAgICAgIHwgNCArKy0tCiAuLi5zb24uYnVpbGQtZG8tbm90LWVu
YWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCB8IDQgKystLQogLi4uMDEwLURv
LW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggfCA0ICsr
LS0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0
Y2ggICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRp
bWVvdXQucGF0Y2ggICAgICAgICB8IDIgKy0KIC4uLmxpYi0yLjAtaW5pdGlhbF8yLjg4LjAuYmIg
PT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjEuYmJ9IHwgMAogLi4uL2dsaWItMi4wL3tnbGliLTIu
MF8yLjg4LjAuYmIgPT4gZ2xpYi0yLjBfMi44OC4xLmJifSAgICAgfCAwCiBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLmluYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEz
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMC1pbml0aWFsXzIuODguMC5iYiA9
PiBnbGliLTIuMC1pbml0aWFsXzIuODguMS5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuODguMC5iYiA9PiBnbGliLTIuMF8yLjg4LjEuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50
by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCmluZGV4IDhiNzgzZTgxZWEuLmI2YWQ2MDM1YzUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdy
aXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNv
bmZpZy1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmZlMzk2NTM4M2Q5NGIzMDMw
ZTg1YWI4OTk5NTU4NTg3MTBmZWM1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODlj
MDY0NDI1NDAyM2NmZDVhMjI2ODVmYmJiNTBlYmQ4YzYyMjRkZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAxNSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBE
byBub3QgcHJlZml4IGV4ZWN1dGFibGVzIHdpdGggJGJpbmRpciBpbiBwa2ctY29uZmlnIGZpbGVz
CkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9naW8vbWVzb24uYnVpbGQgYi9naW8vbWVz
b24uYnVpbGQKLWluZGV4IDJmOGYxODguLjU3YzQ4ZDIgMTAwNjQ0CitpbmRleCBjN2RhMjU3Li44
YTAwOTg5IDEwMDY0NAogLS0tIGEvZ2lvL21lc29uLmJ1aWxkCiArKysgYi9naW8vbWVzb24uYnVp
bGQKIEBAIC05MzQsMTcgKzkzNCwxOCBAQCBsaWJnaW9fZGVwID0gZGVjbGFyZV9kZXBlbmRlbmN5
KGxpbmtfd2l0aCA6IGxpYmdpbywKQEAgLTQ2LDcgKzQ2LDcgQEAgaW5kZXggMmY4ZjE4OC4uNTdj
NDhkMiAxMDA2NDQKICAgIHVuaW5zdGFsbGVkX3ZhcmlhYmxlcyA6IFsKICAgICAgJ2dpbz0ke3By
ZWZpeH0vZ2lvL2dpbycsCiBkaWZmIC0tZ2l0IGEvZ2xpYi9tZXNvbi5idWlsZCBiL2dsaWIvbWVz
b24uYnVpbGQKLWluZGV4IDIwOWJjYmYuLmE4NmNmZDMgMTAwNjQ0CitpbmRleCAwZmI2ZTI2Li45
ZWViZjczIDEwMDY0NAogLS0tIGEvZ2xpYi9tZXNvbi5idWlsZAogKysrIGIvZ2xpYi9tZXNvbi5i
dWlsZAogQEAgLTQ4MCw5ICs0ODAsMTAgQEAgcGtnLmdlbmVyYXRlKGxpYmdsaWIsCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFN
RS1vbi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKaW5kZXggYjkxNjI0
ZGE4Yi4uYzY5ODM3NmQzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVj
bGliYy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTY2YzU4YWFlMzVmOWUyYmNl
ZjUyMzhlMDMzMWExMTllMGU1MWFiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzI3
ZDUyMzljMzc4YzgyMGY4NzRiNTBkNTM5Zjg3YjU0YTM3NTdhOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1
IE1hciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBEQVRBRElSTkFN
RSBvbiB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8t
cXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAppbmRleCA1YjdjMzIzOTk2Li4x
OGQ2OWM0YTQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVy
eW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAw
ZGUzYTNhNzkxY2EzMmYyMzMwZWIzYThhZDlkYTBmZTZkY2U5NTBjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBhZjEzNTRiMTZhZWZmYmZlZmM3ZThkMzIxNjBjOTcxMDVhOTNhODRmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tv
bmVuQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjIgTWFyIDIwMTYgMTU6MTQ6NTggKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gSW5zdGFsbCBnaW8tcXVlcnltb2R1bGVzIGFzIGxpYmV4ZWNfUFJPR1JB
TQpAQCAtMTMsNyArMTMsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNw
ZWNpZmljXQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEv
Z2lvL21lc29uLmJ1aWxkIGIvZ2lvL21lc29uLmJ1aWxkCi1pbmRleCAzOTI1NmQzLi4yZjhmMTg4
IDEwMDY0NAoraW5kZXggYTNlNmYxOC4uYzdkYTI1NyAxMDA2NDQKIC0tLSBhL2dpby9tZXNvbi5i
dWlsZAogKysrIGIvZ2lvL21lc29uLmJ1aWxkCiBAQCAtMTA3MSw2ICsxMDcxLDcgQEAgZ2lvX3F1
ZXJ5bW9kdWxlcyA9IGV4ZWN1dGFibGUoJ2dpby1xdWVyeW1vZHVsZXMnLCAnZ2lvLXF1ZXJ5bW9k
dWxlcy5jJywgJ2dpb21vZHUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4t
c2NoZW1hcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVt
b3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaApp
bmRleCBkNmRkNjYzNTdhLi41OTRjNDQ0Nzk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVk
LXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1z
Y2hlbWFzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODI5ZjMyMDVlNGQ4MzkwZjAyZWFh
OGU3YTdiZjg1ZTUxY2JiN2VkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MjM3ZWQ1
ZTE2NzdjM2IwZWE1MGM5MmRjMzZlODY0Y2E4NjBlMWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBGcmksIDEyIEp1biAyMDE1IDE3OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92
ZSB0aGUgd2FybmluZyBhYm91dCBkZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291
cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQt
b3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAppbmRleCA3YTJmYzBiN2VmLi4yNDM5NjFhYjhl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10
ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3Vy
Y2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA5MTJlNjc0YmIwYTNiNTFkYWJhYTU4ZGExODM0NDkxZWY5NGU2YTJhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MjFiMTI5YzdjNjMyOWEwMWE1ZjU2YjQ2MDRlYTFiNzQ5
OWIwM2FkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDggSmFuIDIwMjAgMTg6MjI6NDYg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2lvL3Rlc3RzL3Jlc291cmNlcy5jOiBjb21tZW50IG91
dCBhIGJ1aWxkIGhvc3Qtb25seSB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2Vs
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVu
LWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmluZGV4IDE0OTgzM2RjNDMuLmZk
YTQ0OGUzY2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVz
dC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNmRkYWUwMmQ3
Njc3YmNmZjdjMzkzM2VlODU2ZDM0ZGY0MWI1NDhmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA2OWU4MGUzYjkzNmU1N2VhZWNkYTIzMWIxMmI1NTRjMDc1MjE4ZGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IFNhdCwgMTIgT2N0IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb246
IFJ1biBhdG9taWNzIHRlc3Qgb24gY2xhbmcgYXMgd2VsbApAQCAtMTQsNyArMTQsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVp
bGQgYi9tZXNvbi5idWlsZAotaW5kZXggZGFiMWQ2MS4uY2MzYTVlZCAxMDA2NDQKK2luZGV4IGJi
NjgzOTguLjNlOWUwM2EgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVp
bGQKIEBAIC0yMTAwLDcgKzIxMDAsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90
LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1m
ZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRleCBlZmQ1ZDNkZTFiLi43MTE1NzJiMTM5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1
aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3Qt
ZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjNmNkM2MwYTY2YWU4ZjIxMDE4NWUwY2IwNWIyMTcyZGMxOTJjZTllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBlNzllMTliYzFlNmE3ZThmYjg1OTZjNGE5ZDYwZTIxMDMyMzUw
Nzg0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIwMjMgMjI6Mjg6MjcgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBlbmFibGUgcGlkZmQgZmVhdHVy
ZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCi1pbmRleCBjYzNhNWVkLi41OGRkODdhIDEwMDY0NAoraW5kZXggM2U5ZTAzYS4u
ZjE5NTdmMCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAg
LTEwOTgsNyArMTA5OCw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5o
PgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1u
b3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBh
dGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCmluZGV4IDhkYmRmNzQ2YjcuLjBmOTgxMzM4MDIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90
LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24t
cGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQwZTQw
MjMwZTZhM2M1MmI3OWM2ZjkyZThjMDYwYmQ0ZDkzZjAzNzQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDZkOTIwODZhNzkxYzIzMjBiNDY4MTc2NDBjZWJhOTAxMzYxZjM0ZmUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMyBPY3QgMjAxNyAxMDo0NTo1NSArMDMwMAogU3ViamVj
dDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgcHl0aG9uIHBhdGggaW50byB2YXJpb3VzIHRvb2xz
CkBAIC0zMiw3ICszMiw3IEBAIGluZGV4IDA1NzhiNzQuLjU2ZThlMmUgMTAwNzU1CiAgIyBweWxp
bnQ6IGRpc2FibGU9dG9vLW1hbnktbGluZXMsIG1pc3NpbmctZG9jc3RyaW5nLCBpbnZhbGlkLW5h
bWUKICAKIGRpZmYgLS1naXQgYS9nb2JqZWN0L2dsaWItbWtlbnVtcy5pbiBiL2dvYmplY3QvZ2xp
Yi1ta2VudW1zLmluCi1pbmRleCA3ZTc5NGU5Li40YjYxOWY4IDEwMDc1NQoraW5kZXggZjM4ODcx
NC4uMzdlZDQ5MSAxMDA3NTUKIC0tLSBhL2dvYmplY3QvZ2xpYi1ta2VudW1zLmluCiArKysgYi9n
b2JqZWN0L2dsaWItbWtlbnVtcy5pbgogQEAgLTEsNCArMSw0IEBACmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRl
eCA0YzI2MzhhZTYxLi43ZjMyNmQ4NTg4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDE0YmJjNzdiYzQ2NWI0MjQ1NDExMmJjNmEzMzI2NGMyYzNlMDEzZTUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDIwNzIxZDI0NDg1YTUxMjA2MTg5YjMxMjg4MzVjM2MzMDk4
NjAxYjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0
b3J5IGZvciBuYXRpdmUgYnVpbGRzCkBAIC0yMSw3ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IFBl
dGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL2dpb21vZHVsZS5jIGIvZ2lvL2dpb21v
ZHVsZS5jCi1pbmRleCAzODc2MWU0Li5hZmE3ODc4IDEwMDY0NAoraW5kZXggNzMxMTc3NS4uYWJj
MmM3OSAxMDA2NDQKIC0tLSBhL2dpby9naW9tb2R1bGUuYwogKysrIGIvZ2lvL2dpb21vZHVsZS5j
CiBAQCAtMTMxMiw2ICsxMzEyLDI0IEBAIGdldF9naW9fbW9kdWxlX2RpciAodm9pZCkKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaApp
bmRleCA4ZWYxNDBkMGQ3Li40MzUwNmQ2OWY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBmNzdiOWRkNzJkZDAxMDNjN2EyOGRkN2UxY2RmNmUzMTZlY2JmMDMwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBkNTQ4NTU0Yjg3OTNkODJiOTNjN2M3YjIxOThlMzY4YjU3OTE2OTU4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9u
QGFybS5jb20+CiBEYXRlOiBUaHUsIDI4IE1hciAyMDI0IDE2OjI3OjA5ICswMDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFNraXAgL3RpbWVvdXQvcm91bmRpbmcgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODguMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjAtaW5pdGlhbF8yLjg4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wLWluaXRpYWxfMi44OC4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMF8yLjg4LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMF8yLjg4LjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODguMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44OC4xLmJiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jCmluZGV4IGRlZTk0ZWMwNjAuLjhkMjMwOTIxODcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWIuaW5jCkBAIC0yMzgsNyArMjM4LDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBcCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1l
bmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIzNTQ2MjUx
Y2NiYjM3NDRkNGJjNGViNDgzNTQ1NDBlMWY2MjAwODQ2NTcyYmFiNjhlM2EyYjdiMmI2NGRmZDA3
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTFhYjgwNGM1NmY2ZWFiM2U1MDQ1Yzc3
NGQxMjkwYWM1ZTRjOTIzZDRmOWEzZDhlMzMxMjNiZWU0NWMxODQwZSIKIAogIyBGaW5kIGFueSBt
ZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBj
dXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09F
TUVTT04uCi0tIAoyLjQ3LjEKCg==

--===============7296757358739440062==
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
packages/x86-64-v3-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgirepository-2.0.so.0.8800.0 /usr/lib/libgthread-2.0.so.0.8800.0 /usr/lib/libgobject-2.0.so.0.8800.0 /usr/lib/libgio-2.0.so.0.8800.0 /usr/lib/libglib-2.0.so.0.8800.0 /usr/lib/libgmodule-2.0.so.0.8800.0", added "/usr/lib/libgobject-2.0.so.0.8800.1 /usr/lib/libgthread-2.0.so.0.8800.1 /usr/lib/libgio-2.0.so.0.8800.1 /usr/lib/libgirepository-2.0.so.0.8800.1 /usr/lib/libglib-2.0.so.0.8800.1 /usr/lib/libgmodule-2.0.so.0.8800.1"
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

--===============7296757358739440062==--

