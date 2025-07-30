Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08C8C87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:04:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39275.1753891433892461708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803C31BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B4F23F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/13] python3-pdm-build-locked: use new python_pdm class
Date: Wed, 30 Jul 2025 17:03:39 +0100
Message-ID: <20250730160343.4053614-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221130

Instead of using the setuptoools class but not using setuptools, use the
new python_pdm class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.=
bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
index 12afe8bcf4f..e8f2ad0e93b 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D19382cdf9c143d=
f4f00b9caa0b60c75a"
=20
 SRC_URI[sha256sum] =3D "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf55=
1ca6adb7f6844201"
=20
-inherit pypi python_setuptools_build_meta
-
-DEPENDS +=3D " python3-pdm-backend-native"
+inherit pypi python_pdm
=20
 PYPI_PACKAGE =3D "pdm_build_locked"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
--=20
2.43.0


