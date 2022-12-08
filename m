Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060ADC4167B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 19:30:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24588.1670527837607582179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 11:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56173FEC;
	Thu,  8 Dec 2022 11:30:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 258B13F71A;
	Thu,  8 Dec 2022 11:30:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] python3-packaging: upgrade to 22.0
Date: Thu,  8 Dec 2022 19:30:24 +0000
Message-Id: <20221208193024.3189494-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208193024.3189494-1-ross.burton@arm.com>
References: <20221208193024.3189494-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 19:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174411

This has been ported from setuptools to flit_core, and now contains a
hand-written parser instead of using pyparsing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-packaging_21.3.bb =3D> python3-packaging_22.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_21.3.bb =3D> pyth=
on3-packaging_22.0.bb} (58%)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/met=
a/recipes-devtools/python/python3-packaging_22.0.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-packaging_21.3.bb
rename to meta/recipes-devtools/python/python3-packaging_22.0.bb
index e3b9a440c4e..bcf077d2c71 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_22.0.bb
@@ -3,10 +3,8 @@ HOMEPAGE =3D "https://github.com/pypa/packaging"
 LICENSE =3D "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a90b205c9167578c=
e91"
=20
-SRC_URI[sha256sum] =3D "dd47c42927d89ab911e606518907cc2d3a1f38bbd0263859=
70643f9c5b8ecfeb"
+SRC_URI[sha256sum] =3D "2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750=
ab48e2c41de2cfd3"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-pyparsing"
--=20
2.34.1


