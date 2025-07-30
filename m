Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2BDC87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:04:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39277.1753891435238976029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D939A1BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7128B3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/13] python3-webcolors: use new python_pdm class
Date: Wed, 30 Jul 2025 17:03:41 +0100
Message-ID: <20250730160343.4053614-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221132

Instead of using the setuptoools class but not using setuptools, use the
new python_pdm class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-webcolors_24.11.1.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb b/=
meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
index cda63d2a35c..d5376145454 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -5,12 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbaebec43b7d1=
99c7fd8f5411b3b0448"
=20
 SRC_URI[sha256sum] =3D "ecb3d768f32202af770477b8b65f318fa4f566c22948673a=
977b00d589dd80f6"
=20
-inherit pypi python_setuptools_build_meta ptest-python-pytest
-
-DEPENDS +=3D " \
-    python3-pdm-native \
-    python3-pdm-backend-native \
-"
+inherit pypi python_pdm ptest-python-pytest
=20
 RDEPENDS:${PN}:class-target =3D "\
     python3-stringold \
--=20
2.43.0


