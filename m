Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8370C3DA58
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18381.1718475799648686807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hoLNEfsO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y8c3ocZf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101901d23b9db-32735abe-6032-44df-b85f-f28cc1741b2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CW2yudf7yfcVaaL9kK4hSlIlzaUkeShQT340YDoZwV8=;
	b=hoLNEfsOPbr3ihLoknkvDbHTCjIUAYPB0SEQbZMURzSofYTogXvYTS/sxEEUMre/
	4fLIddykQQRIb4WIR9qeeKwuovvuz8pj6qIPb70LsvrTxAuxVVpWlBDTeZYLdTo5ocE
	lZ02B1ksjfzX19LBw0z71SzABzTSjUANsRCxfM9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CW2yudf7yfcVaaL9kK4hSlIlzaUkeShQT340YDoZwV8=;
	b=Y8c3ocZfaKAXWiamHqXbwO5V9sBsMJD5d6E0fCczgjGG38uDSim+w6qXQ4fKqeT4
	5CgrklJ04hF+MJj4B4R9WvQYQkIKS5cwVWeEG5CgJYBvC5ZtSvcK88VmUyxtR42Iwz4
	Yl7bQo6kAEmxjoZA2gx2JUtCqFQoPFXaCj7dOy3Y=
Content-Type: multipart/mixed; boundary="===============2478861052074256688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.80.3 FAILED
Message-ID: <010101901d23b9db-32735abe-6032-44df-b85f-f28cc1741b2f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200704

--===============2478861052074256688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.80.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.80.2-2.80.3.patch
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
From 0aad15883b59d2b09dce1bb4ac30928e82f2c186 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 06:02:35 +0000
Subject: [PATCH] glib-2.0: upgrade 2.80.2 -> 2.80.3

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch  | 2 +-
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch      | 2 +-
 ...0001-Install-gio-querymodules-as-libexec_PROGRAM.patch | 2 +-
 ...ve-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 ...pository-introspection-correctly-install-.gir-fi.patch | 8 ++++----
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch    | 6 +++---
 ...n.build-do-not-enable-pidfd-features-on-native-g.patch | 6 +++---
 ...0-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch   | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch       | 2 +-
 .../glib-2.0/{glib-2.0_2.80.2.bb => glib-2.0_2.80.3.bb}   | 0
 meta/recipes-core/glib-2.0/glib.inc                       | 2 +-
 13 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.2.bb => glib-2.0_2.80.3.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 10568b7c9f..bf9a4b97a6 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 10b08af6c7dcb03f954da29b6c4f9636b8796f30 Mon Sep 17 00:00:00 2001
+From c33eb37eeb00cef7b12ad67d23b72bb764e6b883 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b9c9706fc4..34836c091b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 55c49c51d8db5af15132653003d2b65a5215eebf Mon Sep 17 00:00:00 2001
+From a30422fe78cf9093453bc9ccb1d18ed82250e055 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index bc539fe3e8..1298558b75 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 53333cf3ec787cb7e60585237327390e2ca89f4c Mon Sep 17 00:00:00 2001
+From e9e33628ba26d6070339dd21fb8705aaf6078ea9 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 5e543339d8..abd6fa64eb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 3db055ce8029372096be534c5cfc385f068bab17 Mon Sep 17 00:00:00 2001
+From c81ca8a61168f2e9c6541e04d8ceba7687b62bce Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index aa7127b65b..76c2e34b19 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 97b4f18c65c52c9e6412ecf8affc22f6f42d3465 Mon Sep 17 00:00:00 2001
+From fbfce1b853e249922219043bcdef174fa89ed6bc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
index 7be9cd8b84..8bb86a7c44 100644
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
@@ -1,4 +1,4 @@
-From f1beef5c2d09fae3a5e5a314f984cb3f20abe732 Mon Sep 17 00:00:00 2001
+From ef24fdb78041875c895d96859def98de94d30834 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 23 Apr 2024 11:24:34 +0200
 Subject: [PATCH] girepository/introspection: correctly install .gir files into
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 9 insertions(+)
 
 diff --git a/girepository/introspection/meson.build b/girepository/introspection/meson.build
-index 9405686..862ca61 100644
+index f3ee28f..802a22e 100644
 --- a/girepository/introspection/meson.build
 +++ b/girepository/introspection/meson.build
 @@ -49,6 +49,7 @@ glib_gir = gnome.generate_gir(libglib,
@@ -70,7 +70,7 @@ index 9405686..862ca61 100644
      dependencies: [
        libglib_dep,
        libgobject_dep,
-@@ -277,6 +284,7 @@ else
+@@ -278,6 +285,7 @@ else
      header: 'gio/gio.h',
      includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
      install: true,
@@ -78,7 +78,7 @@ index 9405686..862ca61 100644
      dependencies: [
        libglib_dep,
        libgobject_dep,
-@@ -314,6 +322,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
+@@ -316,6 +324,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
    header: 'girepository/girepository.h',
    includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
    install: true,
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 3a8d3596b0..6225338491 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From f04ea29f9f96892ada81bd0acfcef70183138229 Mon Sep 17 00:00:00 2001
+From d4f13dd478fc44e4e502b67640848fec29c2101f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 257afb5..5caa6e6 100644
+index 73299af..513ecc7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2024,7 +2024,7 @@ atomicdefine = '''
+@@ -2021,7 +2021,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 9be04960aa..12a72f1bd9 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From a63c865aa9a24f3230e8e2bcb5bce88f179c7e2b Mon Sep 17 00:00:00 2001
+From fb50a210ffadced06b9af1151a884694198402e6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5caa6e6..688f214 100644
+index 513ecc7..4bacc11 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1019,7 +1019,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4dec252c1f..4bc68ab1c5 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From dc7f09c4f52638a70768c528d186da6f83dedc97 Mon Sep 17 00:00:00 2001
+From 0047920393a26ddd77999b79ef95b4838166d6ee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index a1ff198aa6..eb460a6d3b 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 0133aeabd37a9137722abd86039d7d0797b5896f Mon Sep 17 00:00:00 2001
+From 4687e277c721372a11d0c518b812b5c5a977fd3a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 0f8b51294b..0fcb326624 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From ac75f5d9206e52eec64fef0db4cd91b58a764c99 Mon Sep 17 00:00:00 2001
+From aae4a2be8b7045f95debdf318045f784f4a3f073 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 690d1c162c..f667306726 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,7 +232,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"
+SRC_URI[sha256sum] = "3947a0eaddd0f3613d0230bb246d0c69e46142c19022f5c4b1b2e3cba236d417"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.44.0


--===============2478861052074256688==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.80.2-2.80.3.patch"

RnJvbSAwYWFkMTU4ODNiNTlkMmIwOWRjZTFiYjRhYzMwOTI4ZTgyZjJjMTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDY6MDI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLTIuMDogdXBncmFkZSAyLjgwLjIgLT4gMi44MC4zCgotLS0KIC4uLi8wMDAxLURvLW5vdC13
cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggICAgICB8IDIgKy0K
IC4uLjAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRj
aCB8IDIgKy0KIC4uLnZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2No
ZW1hcy5wYXRjaCB8IDIgKy0KIC4uLnRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVp
bGQtaG9zdC1vbmx5LS5wYXRjaCB8IDIgKy0KIC4uLnBvc2l0b3J5LWludHJvc3BlY3Rpb24tY29y
cmVjdGx5LWluc3RhbGwtLmdpci1maS5wYXRjaCB8IDggKysrKy0tLS0KIC4uLi8wMDAxLW1lc29u
LVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCAgICB8IDYgKysrLS0tCiAu
Li5uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gg
fCA2ICsrKy0tLQogLi4uMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3Vz
LXRvb2xzLnBhdGNoIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVs
b2NhdGUtbW9kdWxlcy5wYXRjaCAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoICAgICAgIHwgMiArLQogLi4uL2dsaWItMi4wL3tnbGli
LTIuMF8yLjgwLjIuYmIgPT4gZ2xpYi0yLjBfMi44MC4zLmJifSAgIHwgMAogbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogMTMg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuODAuMi5iYiA9PiBnbGliLTIu
MF8yLjgwLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0
ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCmluZGV4IDEwNTY4YjdjOWYuLmJm
OWE0Yjk3YTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAw
MDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGly
LWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTBiMDhh
ZjZjN2RjYjAzZjk1NGRhMjliNmM0Zjk2MzZiODc5NmYzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYzMzZWIzN2VlYjAwY2VmN2IxMmFkNjdkMjNiNzJiYjc2NGU2Yjg4MyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogRnJpLCAxNSBGZWIgMjAxOSAxMToxNzoyNyArMDEwMAogU3ViamVj
dDogW1BBVENIXSBEbyBub3QgcHJlZml4IGV4ZWN1dGFibGVzIHdpdGggJGJpbmRpciBpbiBwa2ct
Y29uZmlnIGZpbGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGlu
dXgucGF0Y2gKaW5kZXggYjljOTcwNmZjNC4uMzQ4MzZjMDkxYiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJj
LUxpbnV4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
Rml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNTVjNDljNTFkOGRiNWFmMTUxMzI2NTMwMDNkMmI2NWE1MjE1ZWViZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTMwNDIyZmU3OGNmOTA5MzQ1M2JjOWNjYjFkMThlZDgyMjUwZTA1
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBTYXQsIDE1IE1hciAyMDE0IDIyOjQyOjI5IC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEZpeCBEQVRBRElSTkFNRSBvbiB1Y2xpYmMvTGludXgKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVz
LWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRj
aAppbmRleCBiYzUzOWZlM2U4Li4xMjk4NTU4Yjc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJl
eGVjX1BST0dSQU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA1MzMzM2NmM2VjNzg3Y2I3ZTYwNTg1MjM3MzI3MzkwZTJjYTg5
ZjRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOWUzMzYyOGJhMjZkNjA3MDMzOWRk
MjFmYjg3MDVhYWY2MDc4ZWE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kg
S3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMjIgTWFyIDIw
MTYgMTU6MTQ6NTggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gSW5zdGFsbCBnaW8tcXVlcnltb2R1
bGVzIGFzIGxpYmV4ZWNfUFJPR1JBTQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZmlsZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRo
cy1pbi1zY2hlbWFzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAw
MS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBh
dGNoCmluZGV4IDVlNTQzMzM5ZDguLmFiZDZmYTY0ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJl
Y2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhz
LWluLXNjaGVtYXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNkYjA1NWNlODAyOTM3MjA5
NmJlNTM0YzVjZmMzODVmMDY4YmFiMTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM4
MWNhOGE2MTE2OGYyZTljNjU0MWUwNGQ4Y2ViYTc2ODdiNjJiY2UgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IEZyaSwgMTIgSnVuIDIwMTUgMTc6MDg6NDYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
UmVtb3ZlIHRoZSB3YXJuaW5nIGFib3V0IGRlcHJlY2F0ZWQgcGF0aHMgaW4gc2NoZW1hcwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMt
cmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29t
bWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCmluZGV4IGFhNzEyN2I2NWIuLjc2YzJl
MzRiMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
Z2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1y
ZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDk3YjRmMThjNjVjNTJjOWU2NDEyZWNmOGFmZmMyMmY2ZjQyZDM0NjUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZiZmNlMWI4NTNlMjQ5OTIyMjE5MDQzYmNkZWYx
NzRmYTg5ZWQ2YmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKYW4gMjAyMCAxODoy
Mjo0NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBnaW8vdGVzdHMvcmVzb3VyY2VzLmM6IGNvbW1l
bnQgb3V0IGEgYnVpbGQgaG9zdC1vbmx5IHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lyZXBvc2l0b3J5LWludHJvc3BlY3Rpb24tY29ycmVj
dGx5LWluc3RhbGwtLmdpci1maS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtZ2lyZXBvc2l0b3J5LWludHJvc3BlY3Rpb24tY29ycmVjdGx5LWluc3RhbGwtLmdp
ci1maS5wYXRjaAppbmRleCA3YmU5Y2Q4Yjg0Li44YmI4NmE3YzQ0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpcmVwb3NpdG9yeS1pbnRyb3NwZWN0
aW9uLWNvcnJlY3RseS1pbnN0YWxsLS5naXItZmkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naXJlcG9zaXRvcnktaW50cm9zcGVjdGlvbi1jb3JyZWN0
bHktaW5zdGFsbC0uZ2lyLWZpLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMWJlZWY1YzJk
MDlmYWUzYTVlNWEzMTRmOTg0Y2IzZjIwYWJlNzMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlZjI0ZmRiNzgwNDE4NzVjODk1ZDk2ODU5ZGVmOThkZTk0ZDMwODM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KIERhdGU6IFR1ZSwgMjMgQXByIDIwMjQgMTE6MjQ6MzQgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZ2lyZXBvc2l0b3J5L2ludHJvc3BlY3Rpb246IGNvcnJlY3RseSBpbnN0YWxsIC5naXIgZmls
ZXMgaW50bwpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
IAogZGlmZiAtLWdpdCBhL2dpcmVwb3NpdG9yeS9pbnRyb3NwZWN0aW9uL21lc29uLmJ1aWxkIGIv
Z2lyZXBvc2l0b3J5L2ludHJvc3BlY3Rpb24vbWVzb24uYnVpbGQKLWluZGV4IDk0MDU2ODYuLjg2
MmNhNjEgMTAwNjQ0CitpbmRleCBmM2VlMjhmLi44MDJhMjJlIDEwMDY0NAogLS0tIGEvZ2lyZXBv
c2l0b3J5L2ludHJvc3BlY3Rpb24vbWVzb24uYnVpbGQKICsrKyBiL2dpcmVwb3NpdG9yeS9pbnRy
b3NwZWN0aW9uL21lc29uLmJ1aWxkCiBAQCAtNDksNiArNDksNyBAQCBnbGliX2dpciA9IGdub21l
LmdlbmVyYXRlX2dpcihsaWJnbGliLApAQCAtNzAsNyArNzAsNyBAQCBpbmRleCA5NDA1Njg2Li44
NjJjYTYxIDEwMDY0NAogICAgICBkZXBlbmRlbmNpZXM6IFsKICAgICAgICBsaWJnbGliX2RlcCwK
ICAgICAgICBsaWJnb2JqZWN0X2RlcCwKLUBAIC0yNzcsNiArMjg0LDcgQEAgZWxzZQorQEAgLTI3
OCw2ICsyODUsNyBAQCBlbHNlCiAgICAgIGhlYWRlcjogJ2dpby9naW8uaCcsCiAgICAgIGluY2x1
ZGVzOiBbIGdsaWJfZ2lyWzBdLCBnbW9kdWxlX2dpclswXSwgZ29iamVjdF9naXJbMF0sIGdpb19n
aXJbMF0gXSwKICAgICAgaW5zdGFsbDogdHJ1ZSwKQEAgLTc4LDcgKzc4LDcgQEAgaW5kZXggOTQw
NTY4Ni4uODYyY2E2MSAxMDA2NDQKICAgICAgZGVwZW5kZW5jaWVzOiBbCiAgICAgICAgbGliZ2xp
Yl9kZXAsCiAgICAgICAgbGliZ29iamVjdF9kZXAsCi1AQCAtMzE0LDYgKzMyMiw3IEBAIGdpcmVw
b3NpdG9yeV9naXIgPSBnbm9tZS5nZW5lcmF0ZV9naXIobGliZ2lyZXBvc2l0b3J5LAorQEAgLTMx
Niw2ICszMjQsNyBAQCBnaXJlcG9zaXRvcnlfZ2lyID0gZ25vbWUuZ2VuZXJhdGVfZ2lyKGxpYmdp
cmVwb3NpdG9yeSwKICAgIGhlYWRlcjogJ2dpcmVwb3NpdG9yeS9naXJlcG9zaXRvcnkuaCcsCiAg
ICBpbmNsdWRlczogWyBnbGliX2dpclswXSwgZ21vZHVsZV9naXJbMF0sIGdvYmplY3RfZ2lyWzBd
LCBnaW9fZ2lyWzBdIF0sCiAgICBpbnN0YWxsOiB0cnVlLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNs
YW5nLWFzLXdlbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAx
LW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAppbmRleCAzYThk
MzU5NmIwLi42MjI1MzM4NDkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1h
dG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZjA0ZWEyOWY5Zjk2ODkyYWRhODFiZDBhY2ZjZWY3MDE4MzEzODIyOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZDRmMTNkZDQ3OGZjNDRlNGU1MDJiNjc2NDA4NDhmZWMyOWMyMTAxZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBTYXQsIDEyIE9jdCAyMDE5IDE3OjQ2OjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIG1lc29uOiBSdW4gYXRvbWljcyB0ZXN0IG9uIGNsYW5nIGFzIHdlbGwKQEAgLTE0LDEwICsx
NCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMjU3YWZiNS4uNWNhYTZlNiAxMDA2
NDQKK2luZGV4IDczMjk5YWYuLjUxM2VjYzcgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysr
IGIvbWVzb24uYnVpbGQKLUBAIC0yMDI0LDcgKzIwMjQsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycK
K0BAIC0yMDIxLDcgKzIwMjEsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycKICAjIFdlIGtub3cgdGhh
dCB3ZSBjYW4gYWx3YXlzIHVzZSByZWFsICgibG9jayBmcmVlIikgYXRvbWljIG9wZXJhdGlvbnMg
d2l0aCBNU1ZDCiAgaWYgY2MuZ2V0X2lkKCkgPT0gJ21zdmMnIG9yIGNjLmdldF9pZCgpID09ICdj
bGFuZy1jbCcgb3IgY2MubGlua3MoYXRvbWljdGVzdCwgbmFtZSA6ICdhdG9taWMgb3BzJykKICAg
IGhhdmVfYXRvbWljX2xvY2tfZnJlZSA9IHRydWUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1m
ZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRp
dmUtZy5wYXRjaAppbmRleCA5YmUwNDk2MGFhLi4xMmE3MmYxYmQ5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFi
bGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZl
YXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNjNjODY1YWE5
YTI0ZjMyMzBlOGUyYmNiNWJjZTg4ZjE3OWM3ZTJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBmYjUwYTIxMGZmYWRjZWQwNmI5YWYxMTUxYTg4NDY5NDE5ODQwMmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIwMjMgMjI6Mjg6MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBlbmFibGUgcGlkZmQgZmVhdHVyZXMgb24gbmF0aXZlIGds
aWIKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IDVjYWE2ZTYuLjY4OGYyMTQgMTAwNjQ0CitpbmRleCA1MTNlY2M3Li40YmFjYzExIDEwMDY0
NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMTAyMiw3ICsxMDIy
LDggQEAgaWYgY2MubGlua3MoJycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CitAQCAtMTAxOSw3
ICsxMDE5LDggQEAgaWYgY2MubGlua3MoJycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiAgICAg
ICAgICAgICAgICAgICB3YWl0aWQgKFBfUElERkQsIDAsICZjaGlsZF9pbmZvLCBXRVhJVEVEIHwg
V05PSEFORyk7CiAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKICAgICAgICAgICAgICAgICB9
JycnLCBuYW1lIDogJ3BpZGZkX29wZW4oMikgc3lzdGVtIGNhbGwnKQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9u
LXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRv
b2xzLnBhdGNoCmluZGV4IDRkZWMyNTJjMWYuLjRiYzY4YWIxYzUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1w
YXRoLWludG8tdmFyaW91cy10b29scy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9maWxlcy8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMt
dG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRjN2YwOWM0ZjUyNjM4YTcwNzY4YzUy
OGQxODZkYTZmODNkZWRjOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDAwNDc5MjAz
OTNhMjZkZGQ3Nzk5OWI3OWVmOTViNDgzODE2NmQ2ZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFR1ZSwgMyBPY3QgMjAxNyAxMDo0NTo1NSArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qg
aGFyZGNvZGUgcHl0aG9uIHBhdGggaW50byB2YXJpb3VzIHRvb2xzCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRl
eCBhMWZmMTk4YWE2Li5lYjQ2MGE2ZDNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDAxMzNhZWFiZDM3YTkxMzc3MjJhYmQ4NjAzOWQ3ZDA3OTdiNTg5NmYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDQ2ODdlMjc3YzcyMTM3MmExMWQwYzUxOGI4MTJiNWM1YTk3
N2ZkM2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0
b3J5IGZvciBuYXRpdmUgYnVpbGRzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy9za2lwLXRpbWVvdXQucGF0Y2gKaW5kZXggMGY4YjUxMjk0Yi4uMGZjYjMyNjYyNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWM3NWY1ZDkyMDZlNTJlZWM2NGZlZjBkYjRj
ZDkxYjU4YTc2NGM5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWFlNGEyYmU4Yjcw
NDVmOTVkZWJkZjMxODA0NWY3ODRmNGEzZjA3MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIg
MjAyNCAxNjoyNzowOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5k
aW5nIHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
XzIuODAuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODAuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi44MC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLTIuMF8yLjgwLjMuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMKaW5k
ZXggNjkwZDFjMTYyYy4uZjY2NzMwNjcyNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5p
bmMKQEAgLTIzMiw3ICsyMzIsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZp
bGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJl
cy1vbi1uYXRpdmUtZy5wYXRjaCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiOWNmYjZmN2E1YmQ1YjMxMjM4ZmQ1ZDU2ZGYyMjZiMmRk
YTVlYTM3NjExNDc1YmY4OWY2YTBmOTQwMGZlOGJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5
NDdhMGVhZGRkMGYzNjEzZDAyMzBiYjI0NmQwYzY5ZTQ2MTQyYzE5MDIyZjVjNGIxYjJlM2NiYTIz
NmQ0MTciCiAKICMgRmluZCBhbnkgbWVzb24gY3Jvc3MgZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQg
YXJlIHJlbGV2YW50IGZvciB0aGUgY3VycmVudAogIyBidWlsZCAodXNpbmcgc2l0ZWluZm8pIGFu
ZCBhZGQgdGhlbSB0byBFWFRSQV9PRU1FU09OLgotLSAKMi40NC4wCgo=

--===============2478861052074256688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1885 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (918 cached, 2 parsed). 1881 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-3862e8d5f7641e9e2f6721701026b1453706d001"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3862e8d5f7641e9e2f6721701026b1453706d001"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 638 Local 509 Mirrors 0 Missed 129 Current 404 (79% match, 87% complete)
Removing 25 stale sstate objects for arch qemux86_64...done.
Removing 27 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 480 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_package_setscene)
NOTE: Running setscene task 491 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 586 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 592 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 596 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 620 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 645 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 665 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 706 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 710 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 758 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 778 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 787 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 813 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 939 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 942 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 948 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 980 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 994 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 999 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1008 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1016 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1018 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1029 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1030 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-native-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1035 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1038 of 1042 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 453 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_recipe_qa)
NOTE: Running task 471 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 474 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa)
NOTE: Running task 475 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_write_config)
NOTE: Running task 484 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 492 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe wayland-native-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 1042 of 1042 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa: Started
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa unihash changed to 4de98377e32f34e2eee771b48ae1ca63466f3cc981a4685f0a22083d4c685828
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_recipe_qa: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1027 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_fetch)
NOTE: Running task 1125 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: Running task 1127 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_unpack)
NOTE: Running task 1268 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1270 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1282 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 1283 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_recipe_qa)
NOTE: Running task 1287 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: recipe qemu-native-9.0.0-r0: task do_unpack: Started
NOTE: Running task 1305 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1342 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_fetch: Started
NOTE: Running task 1367 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1368 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_write_config)
NOTE: Running task 1369 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_write_config)
NOTE: Running task 1374 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1376 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz
Cleaning and trying again.
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz_bad-checksum_b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd
NOTE: Running task 1395 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 1397 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1398 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Started
NOTE: Running task 1399 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1400 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1426 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Succeeded
NOTE: Running task 1443 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Succeeded
NOTE: Running task 1490 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_fetch)
NOTE: Running task 1491 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 1518 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: Running task 1525 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1558 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: Running task 1563 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_unpack)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: Running task 1566 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1568 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_patch)
NOTE: Running task 1570 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1580 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_patch: Started
NOTE: Running task 1584 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe wayland-protocols-1.36-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: Running task 1627 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: Running task 1673 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1697 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1699 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1723 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_write_config)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1725 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: Running task 1726 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1747 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1780 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_warn_musl)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_fetch: Succeeded
NOTE: Running task 1781 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1782 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_unpack)
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Succeeded
NOTE: Running task 1783 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: Running task 1794 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1829 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1857 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: Running task 1864 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1897 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Succeeded
NOTE: Running task 1898 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1899 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1900 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1979 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: Running task 1999 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 2003 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 2004 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 2005 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2055 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum failure encountered with download of https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz - will attempt other sources if available
NOTE: Running task 2085 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_create_spdx)
NOTE: Running task 2086 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1c0125cf2439354bc5b9d2d86d0c011da603c250ea3e952ab1960cc5517f8e0e
NOTE: Running task 2131 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 2144 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_fetch)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: Running task 2174 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 2175 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 2176 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2177 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_create_spdx: Started
NOTE: Running task 2184 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: Running task 2196 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: Running task 2227 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_unpack)
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz
Cleaning and trying again.
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
WARNING: glib-2.0-initial-1_2.80.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz_bad-checksum_b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 2297 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_fetch)
NOTE: Running task 2298 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2312 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_write_config)
NOTE: Running task 2313 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2370 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_patch)
NOTE: Running task 2371 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb:do_patch)
NOTE: Running task 2409 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_write_config)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Succeeded
NOTE: Running task 2449 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: Running task 2456 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2534 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Started
NOTE: Running task 2535 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Succeeded
NOTE: Running task 2536 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.26.0-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2538 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2539 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2540 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Succeeded
NOTE: Running task 2543 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2544 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 2545 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2548 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_configure)
NOTE: recipe systemd-1_255.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_patch: Succeeded
NOTE: Running task 2549 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2550 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.3.bb:do_populate_lic)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2551 of 2828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.80.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2554 of 2828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Failed
NOTE: recipe qemu-native-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.80.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2555 tasks of which 2441 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615060159.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615060159.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-initial-1_2.80.2-r0 do_fetch: Checksum failure fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz
ERROR: glib-2.0-initial-1_2.80.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/glib-2.80.2.tar.xz\' has sha256 checksum \'b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd\' when \'3947a0eaddd0f3613d0230bb246d0c69e46142c19022f5c4b1b2e3cba236d417\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.gnome.org/sources//glib/2.80/glib-2.80.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glib-2.0-initial/2.80.2/temp/log.do_fetch.421153
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch) failed with exit code '1'

--===============2478861052074256688==--

