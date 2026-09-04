Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E5BC61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:36:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13854.1788528977114546955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KD7zroDJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9ECF152B
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 334933F7D8
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788528976; bh=OJDLPjjnIACLhS0hrM5tOYlwgDi+iesO84nKzAUHdHk=;
	h=From:To:Subject:Date:From;
	b=KD7zroDJbEuu2VxsMtfltHExY/APc9Ay0Cx0WuxaC3+WWVD363ZN1bznYRy/X11gY
	 /JIP+3//HoGSlWamqMSJD6OQhYCoIm7SnQ187fN6jIgwUmuKCbiSBNTyhN2SWthZSH
	 Ypjlzj77OrclfDI8mVnnEOuPMRAmU0BoTciZ7bP0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python/*: remove spurious CLEANBROKENs
Date: Fri,  4 Sep 2026 14:36:07 +0100
Message-ID: <20260904133610.774110-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245104

CLEANBROKEN doesn't do anything with the current build classes as they
override base_do_configure().

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 2 --
 meta/recipes-devtools/python/python3-click_8.5.0.bb  | 2 --
 meta/recipes-devtools/python/python3-jinja2_3.1.6.bb | 2 --
 meta/recipes-devtools/python/python3-lxml_6.1.2.bb   | 2 --
 4 files changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/=
recipes-devtools/python/python3-babel_2.18.0.bb
index 26847372bf3..cf2752f6a23 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -11,8 +11,6 @@ CVE_PRODUCT =3D "pocoo:babel"
=20
 S =3D "${UNPACKDIR}/babel-${PV}"
=20
-CLEANBROKEN =3D "1"
-
 RDEPENDS:${PN} +=3D " \
     python3-codecs \
     python3-difflib \
diff --git a/meta/recipes-devtools/python/python3-click_8.5.0.bb b/meta/r=
ecipes-devtools/python/python3-click_8.5.0.bb
index 88844676928..05a8fb343a7 100644
--- a/meta/recipes-devtools/python/python3-click_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.0.bb
@@ -25,8 +25,6 @@ do_install_ptest:append() {
     cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
=20
-CLEANBROKEN =3D "1"
-
 RDEPENDS:${PN} +=3D "\
     python3-io \
     python3-threading \
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.6.bb
index 2e96eb0dcb3..add266095df 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -10,8 +10,6 @@ PYPI_PACKAGE =3D "jinja2"
=20
 CVE_PRODUCT =3D "jinja2 jinja"
=20
-CLEANBROKEN =3D "1"
-
 inherit pypi python_flit_core ptest-python-pytest
=20
 do_install_ptest:append() {
diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.2.bb b/meta/re=
cipes-devtools/python/python3-lxml_6.1.2.bb
index a0162cab3ff..17c5d769a0c 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.2.bb
@@ -40,5 +40,3 @@ BBCLASSEXTEND =3D "native nativesdk"
 RDEPENDS:${PN} +=3D "libxml2 libxslt python3-compression"
=20
 CVE_PRODUCT =3D "lxml:lxml"
-
-CLEANBROKEN =3D "1"
--=20
2.43.0


