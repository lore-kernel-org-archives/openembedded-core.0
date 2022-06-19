Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AD9C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 21:25:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22973.1655673924600457195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 14:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0911063;
	Sun, 19 Jun 2022 14:25:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7D663F5A1;
	Sun, 19 Jun 2022 14:25:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] python3-jsonschema: upgrade 4.5.1 -> 4.6.0
Date: Sun, 19 Jun 2022 22:25:20 +0100
Message-Id: <20220619212520.4158865-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619212520.4158865-1-ross.burton@arm.com>
References: <20220619212520.4158865-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 21:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167077

Switch the build system from setuptools to hatch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...hon3-jsonschema_4.5.1.bb =3D> python3-jsonschema_4.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.5.1.bb =3D> py=
thon3-jsonschema_4.6.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb b/m=
eta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
index 9f8719870c2..edd7fafc77d 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
@@ -4,11 +4,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7a60a81c146ec25599a3e1dabb861=
0a8 \
                     file://json/LICENSE;md5=3D9d4de43111d33570c8fe49b4cb=
0e01af"
=20
-SRC_URI[sha256sum] =3D "7c6d882619340c3347a1bf7315e147e6d3dae439033ae638=
3d6acb908c101dfc"
+SRC_URI[sha256sum] =3D "9d6397ba4a6c0bf0300736057f649e3e12ecbc07d3e81a0d=
acb72de4e9801957"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
=20
-DEPENDS +=3D "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-sc=
m-native"
+DEPENDS +=3D "${PYTHON_PN}-hatch-vcs-native"
=20
 PACKAGECONFIG ??=3D "format"
 PACKAGECONFIG[format] =3D ",,,\
--=20
2.25.1


