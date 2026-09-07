Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBCCC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33908.1788785227723303504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QeHHtnAX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5135F1476
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 05:47:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC8903F7D8
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Sep 2026 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788785227; bh=G9xxNxDyk4EvLdoFx2Iv1xhzaMGQVOxcsqVZAkyVcQY=;
	h=From:To:Subject:Date:From;
	b=QeHHtnAXhmRdKzoRrtSlsLTSqjjG+4oMox+gEt0QQhySlg63SyQQT7tgnJy6mNSuT
	 X1wkJNYxfJss95gGv3iVPP4VX4FCyxaFcAVoYCnzze9bFIo9dhtHREczVTDidzOem0
	 AEZPi8taL6jtxkVHEQEeNp1Zhyq6IvUOVJ7T6WzQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: remove redundant PYPI_PACKAGE assignments
Date: Mon,  7 Sep 2026 13:47:01 +0100
Message-ID: <20260907124701.3107864-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245254

Recipes don't need to set PYPI_PACKAGE if the default value (the recipe
name with python3- stripped) is correct.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb        | 2 --
 meta/recipes-devtools/python/python3-dtschema_2026.6.bb         | 2 --
 meta/recipes-devtools/python/python3-gitdb_4.0.12.bb            | 2 --
 meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb      | 1 -
 meta/recipes-devtools/python/python3-jinja2_3.1.6.bb            | 2 --
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb        | 2 --
 meta/recipes-devtools/python/python3-mako_1.4.1.bb              | 2 --
 meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb        | 1 -
 meta/recipes-devtools/python/python3-pyelftools_0.33.bb         | 2 --
 meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb        | 1 -
 meta/recipes-devtools/python/python3-smartypants_2.0.2.bb       | 1 -
 meta/recipes-devtools/python/python3-smmap_6.0.0.bb             | 2 --
 meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb   | 2 --
 .../recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb | 2 --
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb                | 2 --
 meta/recipes-devtools/python/python3-typogrify_2.1.0.bb         | 1 -
 meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb         | 2 --
 meta/recipes-devtools/python/python3-yamllint_1.38.0.bb         | 2 --
 meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb        | 2 --
 19 files changed, 33 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb b/m=
eta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index 322497b09bb..2acf6c16b51 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -4,8 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db5cda97fbd7959ad47a952651a870=
51a"
=20
-PYPI_PACKAGE =3D "asn1crypto"
-
 SRC_URI[sha256sum] =3D "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff3=
1123c805306ccb9c"
=20
 inherit pypi setuptools3
diff --git a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb b/me=
ta/recipes-devtools/python/python3-dtschema_2026.6.bb
index 7e463ed1ad1..bb9ced182c1 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D457495c8fa=
03540db4a576bf7869e811"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "dtschema"
-
 SRC_URI[sha256sum] =3D "05188e3727393334b99abb74ae220ccb8158eec67d6bec79=
3326253f9e76d57a"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb b/meta/=
recipes-devtools/python/python3-gitdb_4.0.12.bb
index 0b7eec876f2..9ee10d949c1 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
@@ -8,8 +8,6 @@ DEPENDS =3D "python3-smmap"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "gitdb"
-
 SRC_URI[sha256sum] =3D "5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c=
21091c349ffdb571"
=20
 RDEPENDS:${PN} +=3D "python3-compression \
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb b=
/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
index 4ab6e27f84a..075a6edca45 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/HypothesisWorks/hypothes=
is/tree/master/hypothesis
 LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4ee62c16ebd0f4f99d906f36b=
7de8c3c"
=20
-PYPI_PACKAGE =3D "hypothesis"
 PTEST_PYTEST_DIR ?=3D "examples"
=20
 require ${BPN}-crates.inc
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.6.bb
index add266095df..0d06b962a1d 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5dc8830078=
6f1c214c1e9827a5229462"
=20
 SRC_URI[sha256sum] =3D "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb=
838183be43f66d6d"
=20
-PYPI_PACKAGE =3D "jinja2"
-
 CVE_PRODUCT =3D "jinja2 jinja"
=20
 inherit pypi python_flit_core ptest-python-pytest
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/m=
eta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 8b5de01b69e..6bb4e491042 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -11,8 +11,6 @@ SRC_URI +=3D " \
         file://run-ptest \
 "
=20
-PYPI_PACKAGE =3D "libarchive-c"
-
 inherit pypi setuptools3 ptest-python-pytest
=20
 SRC_URI[sha256sum] =3D "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a3=
72027c10615a2721"
diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/re=
cipes-devtools/python/python3-mako_1.4.1.bb
index 90d303e84be..367a65271f5 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
@@ -4,8 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc79ceff89df0a72f29bb0e1b6f0e3=
6ed"
=20
-PYPI_PACKAGE =3D "mako"
-
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 SRC_URI[sha256sum] =3D "d7904710b662996425a21627710c4777c45053146942cf8a=
7aebf757c92b8c27"
diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb b/m=
eta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
index dace235bb8d..58c03766c68 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dffeffa59c9=
0c9c4a033c7574f8f3fb75"
=20
 SRC_URI[sha256sum] =3D "722695808f4b6457b320fdc131280796bdceb04ab50fe179=
5cd540799ebe1698"
=20
-PYPI_PACKAGE =3D "markupsafe"
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D "python3-html python3-stringold"
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb b/me=
ta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 2586d9fd60e..8a696407dba 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ce2a2b07fca32=
6bc7c146d10105ccfc"
=20
 SRC_URI[sha256sum] =3D "660d82dcbeb8e83d1702bd97f223f761625da06111c0cc98=
8eac6b8ab0c1b61f"
=20
-PYPI_PACKAGE =3D "pyelftools"
-
 inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb b/m=
eta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
index a9c8bec84fc..dc98e445e00 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0582f358628f299f29c23bf5fb2f7=
3c9"
=20
-PYPI_PACKAGE =3D "shacl2code"
 SRC_URI[sha256sum] =3D "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133=
de22be477cd75c24"
=20
 inherit pypi python_hatchling
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb b/=
meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
index a439f8a8806..31cc8f1983e 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dca325788d94ee6=
94fef2a308c5073454"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "smartypants"
 SRC_URI +=3D "file://0001-Change-hash-bang-to-python3.patch"
 SRC_URI[sha256sum] =3D "39d64ce1d7cc6964b698297bdf391bc12c3251b7f608e6e5=
5d857cd7c5f800c6"
=20
diff --git a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb b/meta/r=
ecipes-devtools/python/python3-smmap_6.0.0.bb
index 6abed1205fd..bfd3d52865f 100644
--- a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3De910b35b0ef4e1f665
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "smmap"
-
 SRC_URI[sha256sum] =3D "8d79028ea6cc131da5eab099a5d95a998d43c6779956fffe=
3b455040911076da"
=20
 RDEPENDS:${PN} +=3D "python3-codecs \
diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.b=
b b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
index 032197008f5..7ae92deb8e0 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D07c3b61d971c3d=
f6e19ce439cfe1fb8c"
=20
 SRC_URI[sha256sum] =3D "e07bbc54a0d798fe6010a12398422e62a8bfbba95c394fd0=
956ef58cb4d3e260"
=20
-PYPI_PACKAGE =3D "snowballstemmer"
-
 inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.=
1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
index 5f915663c27..d21e802582d 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D926e8b7e89e3eb=
b2a2d1dfaf0873f241"
=20
 SRC_URI[sha256sum] =3D "1620739f04e36a2c779f1a131a2dfd49b2fd07351bf1968c=
ed074365933abc7a"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-jquery"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.=
0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.=
bb
index 7c11cfeec53..c06ba1242f9 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0064c10bd544b=
cffccbc67a41c108d3"
=20
 SRC_URI[sha256sum] =3D "a9925e4a4587247ed2191a22df5f6970656cb8ca2bd62843=
09578f2153e0c4b8"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-jsmath"
-
 inherit pypi setuptools3
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb b/me=
ta/recipes-devtools/python/python3-typogrify_2.1.0.bb
index 0cb31468bdc..8cdfd8e1c22 100644
--- a/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db8558ebcc6=
82078c1a44d0227573006d"
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "typogrify"
 SRC_URI[sha256sum] =3D "f0aa004e98032a6e6be4c9da65e7eb7150e36ca3bf508adb=
cda82b4d003e61ee"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb b/me=
ta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
index 04632de099f..fae85b583fe 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01441d50dc7447=
6db58a41ac10cb9fa2"
=20
 SRC_URI[sha256sum] =3D "6d94c9f834dd9e44514162799d344d815a3a4faec913717a=
9ecbfa5be1bb8e61"
=20
-PYPI_PACKAGE =3D "xmltodict"
-
 CVE_PRODUCT =3D "xmltodict:xmltodict"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb b/me=
ta/recipes-devtools/python/python3-yamllint_1.38.0.bb
index c2f32eef63a..acbe0228bda 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "yamllint"
-
 SRC_URI[sha256sum] =3D "09e5f29531daab93366bb061e76019d5e91691ef0a40328f=
04c927387d1d364d"
=20
 RDEPENDS:${PN} +=3D "python3-pathspec python3-pyyaml"
diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb b/m=
eta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
index 3027d98de03..f9b478ca8d8 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
@@ -11,6 +11,4 @@ SRC_URI[sha256sum] =3D "dc4dc4fa8994b14565a3d4f31bb79d6=
d27102ecbbd4feaef4ebc1e10e9
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "kirk"
-
 RDEPENDS:${PN} +=3D "python3-asyncio python3-json"
--=20
2.43.0


