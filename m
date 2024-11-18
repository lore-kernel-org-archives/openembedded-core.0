Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14997D591BC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4774.1731964596184487346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Nj0dihGp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZXPhzSdX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019341226c19-d3f1f8e3-9f58-4acd-8a09-6969c6efde2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964595;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cx0pxy09E0JXcmUXj9P6Gc9j/jd2Syj9PxB3C2gFEkE=;
	b=Nj0dihGpQz+4vIX0oDTkeyPzRNpjeOM+YGq13lmSaG3AOyAS5HJDydBo1R/zQLr8
	9JDpWDXlORoVPL9q7SfVt7zy9YkbNzywILxYw9e9B8A7GWw+YT0J8l/a/vz4fiXKcA1
	nX1Dk8tqH6iOHCI7e94zmXQ9g49o8ApBouN5TYOo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964595;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cx0pxy09E0JXcmUXj9P6Gc9j/jd2Syj9PxB3C2gFEkE=;
	b=ZXPhzSdXg/k917a/sB2/dEimAo6SlKj4ypT7qkI735kSncDQcG1UF2lBaziwDhk7
	CXoh1gTKvqb8411d1gnfrKEtr6TnhKjbVTBAwjMy4kiH9darZ77X0421eY50tYsEZLO
	4QTR+oGpkh3wKpk6/khzVT/tnMSnGloslOtzu4TQ=
Content-Type: multipart/mixed; boundary="===============6548496173095717342=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.82.2,2.82.2 SUCCEEDED
Message-ID: <0101019341226c19-d3f1f8e3-9f58-4acd-8a09-6969c6efde2a-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207231

--===============6548496173095717342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.82.2,2.82.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.82.1-2.82.2-2.82.patch
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
From 1e4fc5e0d0729f198e7c77757a60acc1b3314d51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Nov 2024 07:18:28 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.82.1 -> 2.82.2,2.82.1 ->
 2.82.2

---
 ...01-Do-not-write-bindir-into-pkg-config-files.patch |  8 ++++----
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch  |  2 +-
 ...-Install-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...he-warning-about-deprecated-paths-in-schemas.patch |  4 ++--
 ...s-resources.c-comment-out-a-build-host-only-.patch |  2 +-
 ...0001-meson-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...ild-do-not-enable-pidfd-features-on-native-g.patch |  6 +++---
 ...-not-hardcode-python-path-into-various-tools.patch |  8 ++++----
 .../glib-2.0/files/gdatetime-test-fail-0001.patch     |  9 +++------
 .../glib-2.0/files/gdatetime-test-fail-0002.patch     |  9 +++------
 .../glib-2.0/files/gdatetime-test-fail-0003.patch     | 11 ++++-------
 .../glib-2.0/files/relocate-modules.patch             |  8 ++++----
 meta/recipes-core/glib-2.0/files/skip-timeout.patch   |  2 +-
 ...0-initial_2.82.1.bb => glib-2.0-initial_2.82.2.bb} |  0
 .../{glib-2.0_2.82.1.bb => glib-2.0_2.82.2.bb}        |  0
 meta/recipes-core/glib-2.0/glib.inc                   |  2 +-
 16 files changed, 37 insertions(+), 46 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.1.bb => glib-2.0-initial_2.82.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.1.bb => glib-2.0_2.82.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index ae140b9930..99ab772150 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From bcf62c2e776b9716880ac65e5d553d75d5fddc2e Mon Sep 17 00:00:00 2001
+From e2e8d37c827a63e190fbfe82fda03ac5e86af38b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 77cba7b..25d709e 100644
+index 76d67cd..0584ff5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -883,17 +883,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+@@ -885,17 +885,18 @@ libgio_dep = declare_dependency(link_with : libgio,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -46,7 +46,7 @@ index 77cba7b..25d709e 100644
    version : glib_version,
    install_dir : glib_pkgconfigreldir,
 diff --git a/glib/meson.build b/glib/meson.build
-index d2efeba..5f5841d 100644
+index 9f1515b..a40e4f5 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -447,9 +447,10 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 6da9399569..b4c9afb845 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 1d88f52c42a0ed469cb5976f5788b4ba25bb14f9 Mon Sep 17 00:00:00 2001
+From 7e5ee6c570402e95a250442ca5efa7fd311a3855 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 8423f63cbb..3645a64eb7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 75f9eaf2ef760ffb198b0b97a9054f435c79cde9 Mon Sep 17 00:00:00 2001
+From d2b78fe679c516c8cd47b5592d350edb439d0394 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 59c2b0f..77cba7b 100644
+index 1c9a369..76d67cd 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1007,6 +1007,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1009,6 +1009,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index bd7ed77642..4d9b0cc4ad 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 22dcd727203d59a025c8be4280b4654a7054322f Mon Sep 17 00:00:00 2001
+From 8b19e4f52a8ea049210c294c331463e15737ec81 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index 04ef404..e791ce2 100644
+index 54b980b..be05894 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
 @@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 8b4304462e..e8d9ed74b6 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f054111f991a9dd224b6201dafad7e2c28cb78d Mon Sep 17 00:00:00 2001
+From 05135c496a468cdb6e43ca0ca405937d0c180f84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index ea1ab568d1..5e5d28a054 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From de3eabf9295816b4b4eb7428dee504fd505e723d Mon Sep 17 00:00:00 2001
+From a201470dd0facd496b779e3d3cae2fe70419bc12 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index b995ebc..a907736 100644
+index 5beb14d..963815f 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2021,7 +2021,7 @@ atomicdefine = '''
+@@ -2050,7 +2050,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 82a7a5ad23..27b15a9dad 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 546aa941d2fd42f69b3e2bd6625d65c145a5e265 Mon Sep 17 00:00:00 2001
+From bd2f03d3f2a7a7d3655f1b89f63c543b2391beb4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a907736..53cffb5 100644
+index 963815f..4d4a9f3 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1019,7 +1019,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1048,7 +1048,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4609f1fb2b..2d01702501 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 20f64ba4b48e46cf238dc638dc3305036358122b Mon Sep 17 00:00:00 2001
+From ad9da0717632768988b4330ca528e11c9cb330e4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-index 67d3675..4e92a7a 100755
+index 877505e..49a1e8c 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
@@ -22,7 +22,7 @@ index 67d3675..4e92a7a 100755
  # GDBus - GLib D-Bus Library
  #
 diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
-index aa5af43..56e8e2e 100755
+index 0578b74..56e8e2e 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
@@ -32,7 +32,7 @@ index aa5af43..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index e10b910..4b619f8 100755
+index 7e794e9..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
index e78d96c3ce..918cd25887 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
@@ -1,7 +1,7 @@
-From 729d1cbcd599e848bee07c72a276ccc02a06ddc0 Mon Sep 17 00:00:00 2001
+From 7ed88c46aa5d74e78023448493b8b1aeffa250cf Mon Sep 17 00:00:00 2001
 From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
 Date: Fri, 11 Oct 2024 09:38:52 +0100
-Subject: [PATCH 1/3] gdatetime test: Do not assume PST8PDT was always exactly
+Subject: [PATCH] gdatetime test: Do not assume PST8PDT was always exactly
  -8/-7
 
 In newer tzdata, it is an alias for America/Los_Angeles, which has a
@@ -24,7 +24,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 16 insertions(+), 6 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index d46f653ac..2eefc4106 100644
+index d46f653..2eefc41 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2930,6 +2930,7 @@ test_posix_parse (void)
@@ -67,6 +67,3 @@ index d46f653ac..2eefc4106 100644
    g_time_zone_unref (tz);
  
    tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
index d97bec12d6..7c5fd59f39 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
@@ -1,7 +1,7 @@
-From 2702d7ff73649c05297105bab8977e2a9d28fa0b Mon Sep 17 00:00:00 2001
+From 10b4294fe0aff89467a4463f8cc8760a4bdfb5f9 Mon Sep 17 00:00:00 2001
 From: Simon McVittie <smcv@debian.org>
 Date: Fri, 18 Oct 2024 11:03:19 +0100
-Subject: [PATCH 2/3] gdatetime test: Try to make PST8PDT test more obviously
+Subject: [PATCH] gdatetime test: Try to make PST8PDT test more obviously
  correct
 
 Instead of using timestamp 0 as a magic number (in this case interpreted
@@ -23,7 +23,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 2eefc4106..728b87343 100644
+index 2eefc41..728b873 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2954,19 +2954,16 @@ test_posix_parse (void)
@@ -60,6 +60,3 @@ index 2eefc4106..728b87343 100644
  
    tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
  #ifdef G_OS_WIN32
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
index dfeec97810..6f64a9e6b6 100644
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
+++ b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
@@ -1,8 +1,8 @@
-From df251923fb2c80cc7acfe99aaf8c98d7d7cbd29f Mon Sep 17 00:00:00 2001
+From cab911ddec5174af24496990f71ae0aa7e5d5b9d Mon Sep 17 00:00:00 2001
 From: Simon McVittie <smcv@debian.org>
 Date: Fri, 18 Oct 2024 11:23:42 +0100
-Subject: [PATCH 3/3] gdatetime test: Fall back if legacy System V PST8PDT is
- not available
+Subject: [PATCH] gdatetime test: Fall back if legacy System V PST8PDT is not
+ available
 
 On recent versions of Debian, PST8PDT is part of the tzdata-legacy
 package, which is not always installed and might disappear in future.
@@ -19,7 +19,7 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
  1 file changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 728b87343..9e1acd097 100644
+index 728b873..9e1acd0 100644
 --- a/glib/tests/gdatetime.c
 +++ b/glib/tests/gdatetime.c
 @@ -2931,6 +2931,7 @@ test_posix_parse (void)
@@ -58,6 +58,3 @@ index 728b87343..9e1acd097 100644
    /* a date in winter = non-DST */
    gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
    i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index a00703cef8..7252202951 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 41470a56d9ae12912e3f2f9cfb0c126b4f91cd53 Mon Sep 17 00:00:00 2001
+From e23722844ff9c1a18ee510d1d74e1eb6ecc13e7c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 1e14955..3c09bb5 100644
+index aa6272f..26aebf7 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1259,11 +1259,6 @@ get_gio_module_dir (void)
+@@ -1263,11 +1263,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index 1e14955..3c09bb5 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1282,8 +1277,6 @@ get_gio_module_dir (void)
+@@ -1286,8 +1281,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 5ede64fd59..11c1c32850 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 18d6798ba0e4e15d63a63485b729b6ef1b6a4457 Mon Sep 17 00:00:00 2001
+From f708cc9c0dacdd407026a144089d2c8ae4b41b99 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f7631cee83..666d3ef8ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,7 +235,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "478634440bf52ee4ec4428d558787398c0be6b043c521beb308334b3db4489a6"
+SRC_URI[sha256sum] = "ab45f5a323048b1659ee0fbda5cecd94b099ab3e4b9abf26ae06aeb3e781fd63"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.44.1


--===============6548496173095717342==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.82.1-2.82.2-2.82.patch"

RnJvbSAxZTRmYzVlMGQwNzI5ZjE5OGU3Yzc3NzU3YTYwYWNjMWIzMzE0ZDUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTm92IDIwMjQgMDc6MTg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMC1pbml0aWFsLGdsaWItMi4wOiB1cGdyYWRlIDIuODIuMSAtPiAyLjgyLjIsMi44Mi4x
IC0+CiAyLjgyLjIKCi0tLQogLi4uMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25m
aWctZmlsZXMucGF0Y2ggfCAgOCArKysrLS0tLQogLi4uL2ZpbGVzLzAwMDEtRml4LURBVEFESVJO
QU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCAgfCAgMiArLQogLi4uLUluc3RhbGwtZ2lvLXF1ZXJ5
bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggfCAgNiArKystLS0KIC4uLmhlLXdhcm5p
bmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDQgKystLQogLi4u
cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggfCAgMiAr
LQogLi4uMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gg
fCAgNiArKystLS0KIC4uLmlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2
ZS1nLnBhdGNoIHwgIDYgKysrLS0tCiAuLi4tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8t
dmFyaW91cy10b29scy5wYXRjaCB8ICA4ICsrKystLS0tCiAuLi4vZ2xpYi0yLjAvZmlsZXMvZ2Rh
dGV0aW1lLXRlc3QtZmFpbC0wMDAxLnBhdGNoICAgICB8ICA5ICsrKy0tLS0tLQogLi4uL2dsaWIt
Mi4wL2ZpbGVzL2dkYXRldGltZS10ZXN0LWZhaWwtMDAwMi5wYXRjaCAgICAgfCAgOSArKystLS0t
LS0KIC4uLi9nbGliLTIuMC9maWxlcy9nZGF0ZXRpbWUtdGVzdC1mYWlsLTAwMDMucGF0Y2ggICAg
IHwgMTEgKysrKy0tLS0tLS0KIC4uLi9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBh
dGNoICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaCAgIHwgIDIgKy0KIC4uLjAtaW5pdGlhbF8yLjgyLjEu
YmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjgyLjIuYmJ9IHwgIDAKIC4uLi97Z2xpYi0yLjBfMi44
Mi4xLmJiID0+IGdsaWItMi4wXzIuODIuMi5iYn0gICAgICAgIHwgIDAKIG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDE2IGZpbGVz
IGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMC1pbml0aWFsXzIuODIuMS5iYiA9PiBnbGli
LTIuMC1pbml0aWFsXzIuODIuMi5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAve2dsaWItMi4wXzIuODIuMS5iYiA9PiBnbGliLTIuMF8yLjgyLjIuYmJ9ICgxMDAl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8t
bm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ct
Y29uZmlnLWZpbGVzLnBhdGNoCmluZGV4IGFlMTQwYjk5MzAuLjk5YWI3NzIxNTAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJp
bmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1m
aWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmNmNjJjMmU3NzZiOTcxNjg4MGFjNjVl
NWQ1NTNkNzVkNWZkZGMyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTJlOGQzN2M4
MjdhNjNlMTkwZmJmZTgyZmRhMDNhYzVlODZhZjM4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
RnJpLCAxNSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qg
cHJlZml4IGV4ZWN1dGFibGVzIHdpdGggJGJpbmRpciBpbiBwa2ctY29uZmlnIGZpbGVzCkBAIC0x
NSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2dpby9tZXNvbi5idWlsZCBiL2dpby9tZXNvbi5i
dWlsZAotaW5kZXggNzdjYmE3Yi4uMjVkNzA5ZSAxMDA2NDQKK2luZGV4IDc2ZDY3Y2QuLjA1ODRm
ZjUgMTAwNjQ0CiAtLS0gYS9naW8vbWVzb24uYnVpbGQKICsrKyBiL2dpby9tZXNvbi5idWlsZAot
QEAgLTg4MywxNyArODgzLDE4IEBAIGxpYmdpb19kZXAgPSBkZWNsYXJlX2RlcGVuZGVuY3kobGlu
a193aXRoIDogbGliZ2lvLAorQEAgLTg4NSwxNyArODg1LDE4IEBAIGxpYmdpb19kZXAgPSBkZWNs
YXJlX2RlcGVuZGVuY3kobGlua193aXRoIDogbGliZ2lvLAogIHBrZy5nZW5lcmF0ZShsaWJnaW8s
CiAgICByZXF1aXJlcyA6IFsnZ2xpYi0yLjAnLCAnZ29iamVjdC0yLjAnXSwKICAgIHZhcmlhYmxl
cyA6IFsKQEAgLTQ2LDcgKzQ2LDcgQEAgaW5kZXggNzdjYmE3Yi4uMjVkNzA5ZSAxMDA2NDQKICAg
IHZlcnNpb24gOiBnbGliX3ZlcnNpb24sCiAgICBpbnN0YWxsX2RpciA6IGdsaWJfcGtnY29uZmln
cmVsZGlyLAogZGlmZiAtLWdpdCBhL2dsaWIvbWVzb24uYnVpbGQgYi9nbGliL21lc29uLmJ1aWxk
Ci1pbmRleCBkMmVmZWJhLi41ZjU4NDFkIDEwMDY0NAoraW5kZXggOWYxNTE1Yi4uYTQwZTRmNSAx
MDA2NDQKIC0tLSBhL2dsaWIvbWVzb24uYnVpbGQKICsrKyBiL2dsaWIvbWVzb24uYnVpbGQKIEBA
IC00NDcsOSArNDQ3LDEwIEBAIHBrZy5nZW5lcmF0ZShsaWJnbGliLApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNs
aWJjLUxpbnV4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1G
aXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoCmluZGV4IDZkYTkzOTk1NjkuLmI0
YzlhZmI4NDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGlu
dXgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFkODhmNTJjNDJhMGVkNDY5Y2I1OTc2ZjU3
ODhiNGJhMjViYjE0ZjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdlNWVlNmM1NzA0
MDJlOTVhMjUwNDQyY2E1ZWZhN2ZkMzExYTM4NTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxNSBNYXIgMjAx
NCAyMjo0MjoyOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBGaXggREFUQURJUk5BTUUgb24gdWNs
aWJjL0xpbnV4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8w
MDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9k
dWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKaW5kZXggODQyM2Y2M2NiYi4uMzY0NWE2NGVi
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0
YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVz
LWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzVmOWVhZjJl
Zjc2MGZmYjE5OGIwYjk3YTkwNTRmNDM1Yzc5Y2RlOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZDJiNzhmZTY3OWM1MTZjOGNkNDdiNTU5MmQzNTBlZGI0MzlkMDM5NCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRl
bC5jb20+CiBEYXRlOiBUdWUsIDIyIE1hciAyMDE2IDE1OjE0OjU4ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEluc3RhbGwgZ2lvLXF1ZXJ5bW9kdWxlcyBhcyBsaWJleGVjX1BST0dSQU0KQEAgLTEz
LDEwICsxMywxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmlj
XQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL21l
c29uLmJ1aWxkIGIvZ2lvL21lc29uLmJ1aWxkCi1pbmRleCA1OWMyYjBmLi43N2NiYTdiIDEwMDY0
NAoraW5kZXggMWM5YTM2OS4uNzZkNjdjZCAxMDA2NDQKIC0tLSBhL2dpby9tZXNvbi5idWlsZAog
KysrIGIvZ2lvL21lc29uLmJ1aWxkCi1AQCAtMTAwNyw2ICsxMDA3LDcgQEAgZ2lvX3F1ZXJ5bW9k
dWxlcyA9IGV4ZWN1dGFibGUoJ2dpby1xdWVyeW1vZHVsZXMnLCAnZ2lvLXF1ZXJ5bW9kdWxlcy5j
JywgJ2dpb21vZHUKK0BAIC0xMDA5LDYgKzEwMDksNyBAQCBnaW9fcXVlcnltb2R1bGVzID0gZXhl
Y3V0YWJsZSgnZ2lvLXF1ZXJ5bW9kdWxlcycsICdnaW8tcXVlcnltb2R1bGVzLmMnLCAnZ2lvbW9k
dQogICAgY19hcmdzIDogZ2lvX2NfYXJncywKICAgICMgaW50bC5saWIgaXMgbm90IGNvbXBhdGli
bGUgd2l0aCBTQUZFU0VICiAgICBsaW5rX2FyZ3MgOiBub3NlaF9saW5rX2FyZ3MsCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2Fy
bmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXBy
ZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKaW5kZXggYmQ3ZWQ3NzY0Mi4uNGQ5YjBjYzRh
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1SZW1v
dmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJu
aW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMjJkY2Q3MjcyMDNkNTlhMDI1YzhiZTQyODBiNDY1NGE3MDU0MzIyZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGIxOWU0ZjUyYThlYTA0OTIxMGMyOTRjMzMxNDYzZTE1
NzM3ZWM4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxMiBKdW4gMjAxNSAxNzowODo0
NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdGhlIHdhcm5pbmcgYWJvdXQgZGVwcmVj
YXRlZCBwYXRocyBpbiBzY2hlbWFzCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2dpby9nbGliLWNvbXBpbGUtc2NoZW1h
cy5jIGIvZ2lvL2dsaWItY29tcGlsZS1zY2hlbWFzLmMKLWluZGV4IDA0ZWY0MDQuLmU3OTFjZTIg
MTAwNjQ0CitpbmRleCA1NGI5ODBiLi5iZTA1ODk0IDEwMDY0NAogLS0tIGEvZ2lvL2dsaWItY29t
cGlsZS1zY2hlbWFzLmMKICsrKyBiL2dpby9nbGliLWNvbXBpbGUtc2NoZW1hcy5jCiBAQCAtMTIz
MiwxOSArMTIzMiw2IEBAIHBhcnNlX3N0YXRlX3N0YXJ0X3NjaGVtYSAoUGFyc2VTdGF0ZSAgKnN0
YXRlLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1n
aW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3Vy
Y2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCmluZGV4IDhiNDMwNDQ2
MmUuLmU4ZDllZDc0YjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1v
bmx5LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdp
by10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDNmMDU0MTExZjk5MWE5ZGQyMjRiNjIwMWRhZmFkN2UyYzI4
Y2I3OGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA1MTM1YzQ5NmE0NjhjZGI2ZTQz
Y2EwY2E0MDU5MzdkMGMxODBmODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4g
MjAyMCAxODoyMjo0NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2Vz
LmM6IGNvbW1lbnQgb3V0IGEgYnVpbGQgaG9zdC1vbmx5IHRlc3QKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1v
bi1jbGFuZy1hcy13ZWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKaW5kZXgg
ZWExYWI1NjhkMS4uNWU1ZDI4YTA1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1S
dW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGRlM2VhYmY5Mjk1ODE2YjRiNGViNzQyOGRlZTUwNGZkNTA1ZTcyM2QgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGEyMDE0NzBkZDBmYWNkNDk2Yjc3OWUzZDNjYWUyZmU3MDQxOWJj
MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogRGF0ZTogU2F0LCAxMiBPY3QgMjAxOSAxNzo0NjoyNiAtMDcwMAogU3ViamVjdDog
W1BBVENIXSBtZXNvbjogUnVuIGF0b21pY3MgdGVzdCBvbiBjbGFuZyBhcyB3ZWxsCkBAIC0xNCwx
MCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGI5OTVlYmMuLmE5MDc3MzYg
MTAwNjQ0CitpbmRleCA1YmViMTRkLi45NjM4MTVmIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQK
ICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMjAyMSw3ICsyMDIxLDcgQEAgYXRvbWljZGVmaW5lID0g
JycnCitAQCAtMjA1MCw3ICsyMDUwLDcgQEAgYXRvbWljZGVmaW5lID0gJycnCiAgIyBXZSBrbm93
IHRoYXQgd2UgY2FuIGFsd2F5cyB1c2UgcmVhbCAoImxvY2sgZnJlZSIpIGF0b21pYyBvcGVyYXRp
b25zIHdpdGggTVNWQwogIGlmIGNjLmdldF9pZCgpID09ICdtc3ZjJyBvciBjYy5nZXRfaWQoKSA9
PSAnY2xhbmctY2wnIG9yIGNjLmxpbmtzKGF0b21pY3Rlc3QsIG5hbWUgOiAnYXRvbWljIG9wcycp
CiAgICBoYXZlX2F0b21pY19sb2NrX2ZyZWUgPSB0cnVlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlk
ZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24t
bmF0aXZlLWcucGF0Y2gKaW5kZXggODJhN2E1YWQyMy4uMjdiMTVhOWRhZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3Qt
ZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRm
ZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTQ2YWE5
NDFkMmZkNDJmNjliM2UyYmQ2NjI1ZDY1YzE0NWE1ZTI2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYmQyZjAzZDNmMmE3YTdkMzY1NWYxYjg5ZjYzYzU0M2IyMzkxYmViNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIzIDIyOjI4OjI3ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIG1lc29uLmJ1aWxkOiBkbyBub3QgZW5hYmxlIHBpZGZkIGZlYXR1cmVzIG9uIG5hdGl2
ZSBnbGliCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxk
Ci1pbmRleCBhOTA3NzM2Li41M2NmZmI1IDEwMDY0NAoraW5kZXggOTYzODE1Zi4uNGQ0YTlmMyAx
MDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTEwMTksNyAr
MTAxOSw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgorQEAgLTEw
NDgsNyArMTA0OCw4IEBAIGlmIGNjLmxpbmtzKCcnJyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgog
ICAgICAgICAgICAgICAgICAgd2FpdGlkIChQX1BJREZELCAwLCAmY2hpbGRfaW5mbywgV0VYSVRF
RCB8IFdOT0hBTkcpOwogICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgICAgICAg
ICAgfScnJywgbmFtZSA6ICdwaWRmZF9vcGVuKDIpIHN5c3RlbSBjYWxsJykKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5
dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91
cy10b29scy5wYXRjaAppbmRleCA0NjA5ZjFmYjJiLi4yZDAxNzAyNTAxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRo
b24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJp
b3VzLXRvb2xzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMGY2NGJhNGI0OGU0NmNmMjM4
ZGM2MzhkYzMzMDUwMzYzNTgxMjJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZDlk
YTA3MTc2MzI3Njg5ODhiNDMzMGNhNTI4ZTExYzljYjMzMGU0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBUdWUsIDMgT2N0IDIwMTcgMTA6NDU6NTUgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8g
bm90IGhhcmRjb2RlIHB5dGhvbiBwYXRoIGludG8gdmFyaW91cyB0b29scwpAQCAtMTIsNyArMTIs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL2dpby9nZGJ1cy0yLjAvY29kZWdlbi9nZGJ1cy1jb2RlZ2VuLmluIGIv
Z2lvL2dkYnVzLTIuMC9jb2RlZ2VuL2dkYnVzLWNvZGVnZW4uaW4KLWluZGV4IDY3ZDM2NzUuLjRl
OTJhN2EgMTAwNzU1CitpbmRleCA4Nzc1MDVlLi40OWExZThjIDEwMDc1NQogLS0tIGEvZ2lvL2dk
YnVzLTIuMC9jb2RlZ2VuL2dkYnVzLWNvZGVnZW4uaW4KICsrKyBiL2dpby9nZGJ1cy0yLjAvY29k
ZWdlbi9nZGJ1cy1jb2RlZ2VuLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTIyLDcgKzIyLDcgQEAg
aW5kZXggNjdkMzY3NS4uNGU5MmE3YSAxMDA3NTUKICAjIEdEQnVzIC0gR0xpYiBELUJ1cyBMaWJy
YXJ5CiAgIwogZGlmZiAtLWdpdCBhL2dvYmplY3QvZ2xpYi1nZW5tYXJzaGFsLmluIGIvZ29iamVj
dC9nbGliLWdlbm1hcnNoYWwuaW4KLWluZGV4IGFhNWFmNDMuLjU2ZThlMmUgMTAwNzU1CitpbmRl
eCAwNTc4Yjc0Li41NmU4ZTJlIDEwMDc1NQogLS0tIGEvZ29iamVjdC9nbGliLWdlbm1hcnNoYWwu
aW4KICsrKyBiL2dvYmplY3QvZ2xpYi1nZW5tYXJzaGFsLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAg
LTMyLDcgKzMyLDcgQEAgaW5kZXggYWE1YWY0My4uNTZlOGUyZSAxMDA3NTUKICAjIHB5bGludDog
ZGlzYWJsZT10b28tbWFueS1saW5lcywgbWlzc2luZy1kb2NzdHJpbmcsIGludmFsaWQtbmFtZQog
IAogZGlmZiAtLWdpdCBhL2dvYmplY3QvZ2xpYi1ta2VudW1zLmluIGIvZ29iamVjdC9nbGliLW1r
ZW51bXMuaW4KLWluZGV4IGUxMGI5MTAuLjRiNjE5ZjggMTAwNzU1CitpbmRleCA3ZTc5NGU5Li40
YjYxOWY4IDEwMDc1NQogLS0tIGEvZ29iamVjdC9nbGliLW1rZW51bXMuaW4KICsrKyBiL2dvYmpl
Y3QvZ2xpYi1ta2VudW1zLmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL2dkYXRldGltZS10ZXN0LWZhaWwtMDAwMS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL2dkYXRldGltZS10ZXN0LWZhaWwtMDAw
MS5wYXRjaAppbmRleCBlNzhkOTZjM2NlLi45MThjZDI1ODg3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9nZGF0ZXRpbWUtdGVzdC1mYWlsLTAwMDEucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvZ2RhdGV0aW1lLXRlc3QtZmFp
bC0wMDAxLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA3MjlkMWNiY2Q1OTllODQ4YmVlMDdj
NzJhMjc2Y2NjMDJhMDZkZGMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZWQ4OGM0
NmFhNWQ3NGU3ODAyMzQ0ODQ5M2I4YjFhZWZmYTI1MGNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogIlJlYmVjY2EgTi4gUGFsbWVyIiA8cmViZWNjYV9wYWxtZXJAem9oby5jb20+CiBE
YXRlOiBGcmksIDExIE9jdCAyMDI0IDA5OjM4OjUyICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8z
XSBnZGF0ZXRpbWUgdGVzdDogRG8gbm90IGFzc3VtZSBQU1Q4UERUIHdhcyBhbHdheXMgZXhhY3Rs
eQorU3ViamVjdDogW1BBVENIXSBnZGF0ZXRpbWUgdGVzdDogRG8gbm90IGFzc3VtZSBQU1Q4UERU
IHdhcyBhbHdheXMgZXhhY3RseQogIC04Ly03CiAKIEluIG5ld2VyIHR6ZGF0YSwgaXQgaXMgYW4g
YWxpYXMgZm9yIEFtZXJpY2EvTG9zX0FuZ2VsZXMsIHdoaWNoIGhhcyBhCkBAIC0yNCw3ICsyNCw3
IEBAIFNpZ25lZC1vZmYtYnk6IEppbmZlbmcgV2FuZyA8amluZmVuZy53YW5nLmNuQHdpbmRyaXZl
ci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9nbGliL3Rlc3RzL2dkYXRldGltZS5jIGIvZ2xpYi90ZXN0cy9nZGF0
ZXRpbWUuYwotaW5kZXggZDQ2ZjY1M2FjLi4yZWVmYzQxMDYgMTAwNjQ0CitpbmRleCBkNDZmNjUz
Li4yZWVmYzQxIDEwMDY0NAogLS0tIGEvZ2xpYi90ZXN0cy9nZGF0ZXRpbWUuYwogKysrIGIvZ2xp
Yi90ZXN0cy9nZGF0ZXRpbWUuYwogQEAgLTI5MzAsNiArMjkzMCw3IEBAIHRlc3RfcG9zaXhfcGFy
c2UgKHZvaWQpCkBAIC02Nyw2ICs2NywzIEBAIGluZGV4IGQ0NmY2NTNhYy4uMmVlZmM0MTA2IDEw
MDY0NAogICAgZ190aW1lX3pvbmVfdW5yZWYgKHR6KTsKICAKICAgIHR6ID0gZ190aW1lX3pvbmVf
bmV3X2lkZW50aWZpZXIgKCJQU1Q4UERUNjozMjoxNSIpOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvZ2RhdGV0aW1lLXRlc3QtZmFp
bC0wMDAyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvZ2RhdGV0aW1l
LXRlc3QtZmFpbC0wMDAyLnBhdGNoCmluZGV4IGQ5N2JlYzEyZDYuLjdjNWZkNTlmMzkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL2dkYXRldGltZS10ZXN0LWZh
aWwtMDAwMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9nZGF0
ZXRpbWUtdGVzdC1mYWlsLTAwMDIucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDI3MDJkN2Zm
NzM2NDljMDUyOTcxMDViYWI4OTc3ZTJhOWQyOGZhMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDEwYjQyOTRmZTBhZmY4OTQ2N2E0NDYzZjhjYzg3NjBhNGJkZmI1ZjkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBTaW1vbiBNY1ZpdHRpZSA8c21jdkBkZWJpYW4ub3JnPgog
RGF0ZTogRnJpLCAxOCBPY3QgMjAyNCAxMTowMzoxOSArMDEwMAotU3ViamVjdDogW1BBVENIIDIv
M10gZ2RhdGV0aW1lIHRlc3Q6IFRyeSB0byBtYWtlIFBTVDhQRFQgdGVzdCBtb3JlIG9idmlvdXNs
eQorU3ViamVjdDogW1BBVENIXSBnZGF0ZXRpbWUgdGVzdDogVHJ5IHRvIG1ha2UgUFNUOFBEVCB0
ZXN0IG1vcmUgb2J2aW91c2x5CiAgY29ycmVjdAogCiBJbnN0ZWFkIG9mIHVzaW5nIHRpbWVzdGFt
cCAwIGFzIGEgbWFnaWMgbnVtYmVyIChpbiB0aGlzIGNhc2UgaW50ZXJwcmV0ZWQKQEAgLTIzLDcg
KzIzLDcgQEAgU2lnbmVkLW9mZi1ieTogSmluZmVuZyBXYW5nIDxqaW5mZW5nLndhbmcuY25Ad2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvZ2xpYi90ZXN0cy9nZGF0ZXRpbWUuYyBiL2dsaWIvdGVzdHMv
Z2RhdGV0aW1lLmMKLWluZGV4IDJlZWZjNDEwNi4uNzI4Yjg3MzQzIDEwMDY0NAoraW5kZXggMmVl
ZmM0MS4uNzI4Yjg3MyAxMDA2NDQKIC0tLSBhL2dsaWIvdGVzdHMvZ2RhdGV0aW1lLmMKICsrKyBi
L2dsaWIvdGVzdHMvZ2RhdGV0aW1lLmMKIEBAIC0yOTU0LDE5ICsyOTU0LDE2IEBAIHRlc3RfcG9z
aXhfcGFyc2UgKHZvaWQpCkBAIC02MCw2ICs2MCwzIEBAIGluZGV4IDJlZWZjNDEwNi4uNzI4Yjg3
MzQzIDEwMDY0NAogIAogICAgdHogPSBnX3RpbWVfem9uZV9uZXdfaWRlbnRpZmllciAoIlBTVDhQ
RFQ2OjMyOjE1Iik7CiAgI2lmZGVmIEdfT1NfV0lOMzIKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL2dkYXRldGltZS10ZXN0LWZhaWwt
MDAwMy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL2dkYXRldGltZS10
ZXN0LWZhaWwtMDAwMy5wYXRjaAppbmRleCBkZmVlYzk3ODEwLi42ZjY0YTllNmI2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9nZGF0ZXRpbWUtdGVzdC1mYWls
LTAwMDMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvZ2RhdGV0
aW1lLXRlc3QtZmFpbC0wMDAzLnBhdGNoCkBAIC0xLDggKzEsOCBAQAotRnJvbSBkZjI1MTkyM2Zi
MmM4MGNjN2FjZmU5OWFhZjhjOThkN2Q3Y2JkMjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBjYWI5MTFkZGVjNTE3NGFmMjQ0OTY5OTBmNzFhZTBhYTdlNWQ1YjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogU2ltb24gTWNWaXR0aWUgPHNtY3ZAZGViaWFuLm9yZz4KIERh
dGU6IEZyaSwgMTggT2N0IDIwMjQgMTE6MjM6NDIgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSCAzLzNd
IGdkYXRldGltZSB0ZXN0OiBGYWxsIGJhY2sgaWYgbGVnYWN5IFN5c3RlbSBWIFBTVDhQRFQgaXMK
LSBub3QgYXZhaWxhYmxlCitTdWJqZWN0OiBbUEFUQ0hdIGdkYXRldGltZSB0ZXN0OiBGYWxsIGJh
Y2sgaWYgbGVnYWN5IFN5c3RlbSBWIFBTVDhQRFQgaXMgbm90CisgYXZhaWxhYmxlCiAKIE9uIHJl
Y2VudCB2ZXJzaW9ucyBvZiBEZWJpYW4sIFBTVDhQRFQgaXMgcGFydCBvZiB0aGUgdHpkYXRhLWxl
Z2FjeQogcGFja2FnZSwgd2hpY2ggaXMgbm90IGFsd2F5cyBpbnN0YWxsZWQgYW5kIG1pZ2h0IGRp
c2FwcGVhciBpbiBmdXR1cmUuCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEppbmZl
bmcgV2FuZyA8amluZmVuZy53YW5nLmNuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9nbGliL3Rl
c3RzL2dkYXRldGltZS5jIGIvZ2xpYi90ZXN0cy9nZGF0ZXRpbWUuYwotaW5kZXggNzI4Yjg3MzQz
Li45ZTFhY2QwOTcgMTAwNjQ0CitpbmRleCA3MjhiODczLi45ZTFhY2QwIDEwMDY0NAogLS0tIGEv
Z2xpYi90ZXN0cy9nZGF0ZXRpbWUuYwogKysrIGIvZ2xpYi90ZXN0cy9nZGF0ZXRpbWUuYwogQEAg
LTI5MzEsNiArMjkzMSw3IEBAIHRlc3RfcG9zaXhfcGFyc2UgKHZvaWQpCkBAIC01OCw2ICs1OCwz
IEBAIGluZGV4IDcyOGI4NzM0My4uOWUxYWNkMDk3IDEwMDY0NAogICAgLyogYSBkYXRlIGluIHdp
bnRlciA9IG5vbi1EU1QgKi8KICAgIGdkdDEgPSBnX2RhdGVfdGltZV9uZXcgKHR6LCAyMDI0LCAx
LCAxLCAwLCAwLCAwKTsKICAgIGkxID0gZ190aW1lX3pvbmVfZmluZF9pbnRlcnZhbCAodHosIEdf
VElNRV9UWVBFX1NUQU5EQVJELCBnX2RhdGVfdGltZV90b191bml4IChnZHQxKSk7Ci0tLSAKLTIu
MzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxv
Y2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVs
b2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCBhMDA3MDNjZWY4Li43MjUyMjAyOTUxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVs
ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQxNDcwYTU2ZDlhZTEyOTEyZTNmMmY5Y2Zi
MGMxMjZiNGY5MWNkNTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUyMzcyMjg0NGZm
OWMxYTE4ZWU1MTBkMWQ3NGUxZWI2ZWNjMTNlN2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMSBN
YXIgMjAxNiAxNTozNTo1NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVsb2Nh
dGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCkBAIC0xOCwxMCAr
MTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGlu
dGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2dpby9naW9tb2R1bGUuYyBiL2dpby9naW9tb2R1bGUuYwotaW5kZXggMWUxNDk1NS4uM2MwOWJi
NSAxMDA2NDQKK2luZGV4IGFhNjI3MmYuLjI2YWViZjcgMTAwNjQ0CiAtLS0gYS9naW8vZ2lvbW9k
dWxlLmMKICsrKyBiL2dpby9naW9tb2R1bGUuYwotQEAgLTEyNTksMTEgKzEyNTksNiBAQCBnZXRf
Z2lvX21vZHVsZV9kaXIgKHZvaWQpCitAQCAtMTI2MywxMSArMTI2Myw2IEBAIGdldF9naW9fbW9k
dWxlX2RpciAodm9pZCkKICAgICAgICBnX2ZyZWUgKGluc3RhbGxfZGlyKTsKICAjZWxzZQogICAg
ICAgIG1vZHVsZV9kaXIgPSBnX3N0cmR1cCAoR0lPX01PRFVMRV9ESVIpOwpAQCAtMzMsNyArMzMs
NyBAQCBpbmRleCAxZTE0OTU1Li4zYzA5YmI1IDEwMDY0NAogICNpbmNsdWRlIDxkbGZjbi5oPgog
ICAgICAgIHsKICAgICAgICAgIGdfYXV0b2ZyZWUgZ2NoYXIgKnBhdGggPSBOVUxMOwotQEAgLTEy
ODIsOCArMTI3Nyw2IEBAIGdldF9naW9fbW9kdWxlX2RpciAodm9pZCkKK0BAIC0xMjg2LDggKzEy
ODEsNiBAQCBnZXRfZ2lvX21vZHVsZV9kaXIgKHZvaWQpCiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgIH0KICAgICAgICB9CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKaW5kZXggNWVkZTY0ZmQ1OS4uMTFjMWMzMjg1MCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMThkNjc5OGJhMGU0ZTE1ZDYzYTYzNDg1YjcyOWI2
ZWYxYjZhNDQ1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjcwOGNjOWMwZGFjZGQ0
MDcwMjZhMTQ0MDg5ZDJjOGFlNGI0MWI5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIgMjAy
NCAxNjoyNzowOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5kaW5n
IHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWlu
aXRpYWxfMi44Mi4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5p
dGlhbF8yLjgyLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44Mi4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODIuMi5iYgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44Mi4xLmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44Mi4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIu
MF8yLjgyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
XzIuODIuMi5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5p
bmMgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwppbmRleCBmNzYzMWNlZTgz
Li42NjZkM2VmOGVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwpAQCAtMjM1LDcg
KzIzNSw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRl
LW1vZHVsZXMucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
MDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1n
LnBhdGNoIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjQ3ODYzNDQ0MGJmNTJlZTRlYzQ0MjhkNTU4Nzg3Mzk4YzBiZTZiMDQzYzUyMWJl
YjMwODMzNGIzZGI0NDg5YTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWI0NWY1YTMyMzA0OGIx
NjU5ZWUwZmJkYTVjZWNkOTRiMDk5YWIzZTRiOWFiZjI2YWUwNmFlYjNlNzgxZmQ2MyIKIAogIyBG
aW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxFU1BBVEggdGhhdCBhcmUgcmVsZXZhbnQg
Zm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBzaXRlaW5mbykgYW5kIGFkZCB0aGVtIHRv
IEVYVFJBX09FTUVTT04uCi0tIAoyLjQ0LjEKCg==

--===============6548496173095717342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgirepository-2.0.so.0.8200.1 /usr/lib/libgthread-2.0.so.0.8200.1 /usr/lib/libgobject-2.0.so.0.8200.1 /usr/lib/libgio-2.0.so.0.8200.1 /usr/lib/libglib-2.0.so.0.8200.1 /usr/lib/libgmodule-2.0.so.0.8200.1", added "/usr/lib/libgirepository-2.0.so.0.8200.2 /usr/lib/libgthread-2.0.so.0.8200.2 /usr/lib/libgobject-2.0.so.0.8200.2 /usr/lib/libgio-2.0.so.0.8200.2 /usr/lib/libglib-2.0.so.0.8200.2 /usr/lib/libgmodule-2.0.so.0.8200.2"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py was removed

--===============6548496173095717342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.8200.1 /usr/lib/.debug/libgthread-2.0.so.0.8200.1 /usr/lib/.debug/libglib-2.0.so.0.8200.1 /usr/lib/.debug/libgio-2.0.so.0.8200.1 /usr/lib/.debug/libgobject-2.0.so.0.8200.1 /usr/lib/.debug/libgirepository-2.0.so.0.8200.1", added "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.8200.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8200.2 /usr/lib/.debug/libgio-2.0.so.0.8200.2 /usr/lib/.debug/libglib-2.0.so.0.8200.2 /usr/lib/.debug/libgobject-2.0.so.0.8200.2 /usr/lib/.debug/libgirepository-2.0.so.0.8200.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 30820954 to 30824994 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGSIZE changed from 146756 to 146652 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25110199 to 25111798 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.8200.1 /usr/lib/libgirepository-2.0.so.0.8200.1 /usr/lib/libgmodule-2.0.so.0.8200.1 /usr/lib/libgio-2.0.so.0.8200.1 /usr/lib/libglib-2.0.so.0.8200.1 /usr/lib/libgthread-2.0.so.0.8200.1", added "/usr/lib/libgthread-2.0.so.0.8200.2 /usr/lib/libgirepository-2.0.so.0.8200.2 /usr/lib/libgmodule-2.0.so.0.8200.2 /usr/lib/libgio-2.0.so.0.8200.2 /usr/lib/libglib-2.0.so.0.8200.2 /usr/lib/libgobject-2.0.so.0.8200.2"
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.82.1" to "2.82.2"
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.82/glib-2.82.1.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch file://gdatetime-test-fail-0001.patch file://gdatetime-test-fail-0002.patch file://gdatetime-test-fail-0003.patch" to "https://download.gnome.org/sources//glib/2.82/glib-2.82.2.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0
 001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch file://gdatetime-test-fail-0001.patch file://gdatetime-test-fail-0002.patch file://gdatetime-test-fail-0003.patch"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.82.1 [default] to 2.82.2 [default]
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.1 to libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.1 to libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.1 to libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.1 to libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.1 to libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.1 to libgthread-2.0.so.0.8200.2
  /usr/lib/libgio-2.0.so.0.8200.1 moved to /usr/lib/libgio-2.0.so.0.8200.2
  /usr/lib/libgirepository-2.0.so.0.8200.1 moved to /usr/lib/libgirepository-2.0.so.0.8200.2
  /usr/lib/libglib-2.0.so.0.8200.1 moved to /usr/lib/libglib-2.0.so.0.8200.2
  /usr/lib/libgmodule-2.0.so.0.8200.1 moved to /usr/lib/libgmodule-2.0.so.0.8200.2
  /usr/lib/libgobject-2.0.so.0.8200.1 moved to /usr/lib/libgobject-2.0.so.0.8200.2
  /usr/lib/libgthread-2.0.so.0.8200.1 moved to /usr/lib/libgthread-2.0.so.0.8200.2
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.82.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py was removed

--===============6548496173095717342==--

