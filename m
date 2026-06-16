Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCA4CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 12:59:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153491.1781614767161323479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=k1KHythz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8C4B3D5D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 05:59:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 144243F915
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781614766; bh=Vb4bMbjvSRvZIrq/CRFjEaKvqtT/80QZqShGznyJaek=;
	h=From:To:Subject:Date:From;
	b=k1KHythzIJ2Jto5HijpVo77lq9KRlIg0eE4+/kxgLE7XrFuWiZ+YbzXba7Wdfxaln
	 G6zvoiqmIXmoND95nbVv8vHqPAW8/djWEOFRRuqaWd3OAZIMnAwboFhN5kOxKeZ0dN
	 NNZluKmV9ElWyBOhI7a2KPASDb/ZRsVZik2YoNcw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] ghostscript: upgrade 10.07.0 -> 10.07.1
Date: Tue, 16 Jun 2026 13:59:19 +0100
Message-ID: <20260616125919.2913988-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238897

From: Wang Mingyu <wangmy@fujitsu.com>

out-of-tree.patch refreshed for 10.07.1.
[ link updated to new ticket - RB ]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ghostscript/ghostscript/out-of-tree.patch | 32 ++++++++-----------
 ...ript_10.07.0.bb =3D> ghostscript_10.07.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 19 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.07.0.bb =3D> gh=
ostscript_10.07.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.pa=
tch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index 202c9d6c7c9..c64e3c69c51 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,14 +1,21 @@
-Fix the build to do out-of-tree properly.
+From 6d9852d5bac17a5fc7f605bd596e93528b0fcf81 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 2 Apr 2026 14:41:42 +0100
+Subject: [PATCH] Fix the build to do out-of-tree properly.
=20
 The patches are in progress but are being submitted upstream.
=20
-Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=
=3D709289]
+Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=
=3D709459]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
-diff -rU3 a/configure.ac b/configure.ac
---- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
-+++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
-@@ -400,7 +400,7 @@
+diff --git a/configure.ac b/configure.ac
+index b2b3678..dd00e86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -400,7 +400,7 @@ if test x"$with_arch_h" =3D x""; then
            *)
              ARCH_CONF_HEADER=3D
              if test x"$host" !=3D x"$build"; then
@@ -17,18 +24,7 @@ diff -rU3 a/configure.ac b/configure.ac
              else
                ARCH_CONF_HEADER=3D
              fi
-@@ -869,8 +869,8 @@
- AC_SUBST(RECURSIVE_MUTEXATTR)
-=20
- dnl Tesseract/Leptonica detection
--TESSERACTDIR=3Dtesseract
--LEPTONICADIR=3Dleptonica
-+TESSERACTDIR=3D$srcdir/tesseract
-+LEPTONICADIR=3D$srcdir/leptonica
- OCR_VERSION=3D0
- OCR_SHARED=3D0
- LEPTONICAINCLUDE=3D
-@@ -886,7 +886,7 @@
+@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-t=
esseract],
 =20
  if test x$with_tesseract !=3D xno; then
    AC_MSG_CHECKING([for local Tesseract library source])
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
index 1b6cb4aaaea..32548720363 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
@@ -28,7 +28,7 @@ SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpd=
l-downloads/releases/downlo
            file://0001-psi-ztype.c-replace-static-const-double-with-macr=
os-.patch \
            "
=20
-SRC_URI[sha256sum] =3D "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0b=
eb897c37885b5cad"
+SRC_URI[sha256sum] =3D "2fc74362f9be6fae1b0a65d38fdcfd4f0b518cc3b07c5581=
fb661eb4d2e15251"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
--=20
2.43.0


