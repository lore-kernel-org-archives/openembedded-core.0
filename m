Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB357C87FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:04:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39276.1753891434520190964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 342F61BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C05283F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/13] python3-pyproject-metadata: use correct build backend
Date: Wed, 30 Jul 2025 17:03:40 +0100
Message-ID: <20250730160343.4053614-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221131

This package uses flit, not setuptools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.=
1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
index 4c58da3c075..d3a93efa31f 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b=
0fb4780b2ad6907c256c"
 PYPI_PACKAGE =3D "pyproject_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 SRC_URI[sha256sum] =3D "b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa1=
0528e9e1a954a816"
=20
--=20
2.43.0


