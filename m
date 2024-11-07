Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7DDD5D66F
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.77813.1731000252806712979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19171497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8BE33F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/8] recipes/python: remove obsolete CLEANBROKEN
Date: Thu,  7 Nov 2024 17:24:00 +0000
Message-Id: <20241107172404.4017047-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206845

These CLEANBROKENs are obsolete: the classes involved set their own
do_configure so the clean in base_do_configure doesn't get ran.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-babel_2.16.0.bb | 2 --
 meta/recipes-devtools/python/python3-click_8.1.7.bb  | 2 --
 meta/recipes-devtools/python/python3-jinja2_3.1.4.bb | 2 --
 meta/recipes-devtools/python/python3-lxml_5.3.0.bb   | 2 --
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 2 --
 5 files changed, 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-babel_2.16.0.bb b/meta/=
recipes-devtools/python/python3-babel_2.16.0.bb
index 929d7e99831..34aa7c9a750 100644
--- a/meta/recipes-devtools/python/python3-babel_2.16.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.16.0.bb
@@ -9,8 +9,6 @@ inherit pypi setuptools3
=20
 S =3D "${WORKDIR}/babel-${PV}"
=20
-CLEANBROKEN =3D "1"
-
 RDEPENDS:${PN} +=3D " \
     python3-codecs \
     python3-difflib \
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/r=
ecipes-devtools/python/python3-click_8.1.7.bb
index 7d91e1af838..3998d0864f5 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -29,8 +29,6 @@ do_install_ptest() {
=20
 UPSTREAM_CHECK_REGEX =3D "click/(?P<pver>\d+(\.\d+)+)/"
=20
-CLEANBROKEN =3D "1"
-
 RDEPENDS:${PN} +=3D "\
     python3-io \
     python3-threading \
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.4.bb
index a11878496c6..98968ffaec4 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -10,8 +10,6 @@ PYPI_PACKAGE =3D "jinja2"
=20
 CVE_PRODUCT =3D "jinja2 jinja"
=20
-CLEANBROKEN =3D "1"
-
 inherit pypi python_flit_core ptest
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "Jinja2"
=20
diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb b/meta/re=
cipes-devtools/python/python3-lxml_5.3.0.bb
index 4c9c22e5c40..f130b567225 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
@@ -40,5 +40,3 @@ BBCLASSEXTEND =3D "native nativesdk"
 RDEPENDS:${PN} +=3D "libxml2 libxslt python3-compression"
=20
 CVE_PRODUCT =3D "lxml"
-
-CLEANBROKEN =3D "1"
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.4.bb
index 4ffbe0d3708..95614361be0 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -27,8 +27,6 @@ S =3D "${WORKDIR}/numpy-${PV}"
 # until we switch to mesonpy we need this.
 B =3D "${S}/build"
=20
-CLEANBROKEN =3D "1"
-
 do_compile:prepend() {
     export NPY_DISABLE_SVML=3D1
 }
--=20
2.34.1


