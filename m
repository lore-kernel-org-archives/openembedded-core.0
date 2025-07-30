Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FA5C87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39294.1753891431215235114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAC61BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63CBB3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/13] python3-cryptography-vectors: use correct build backend
Date: Wed, 30 Jul 2025 17:03:35 +0100
Message-ID: <20250730160343.4053614-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221126

This package uses flit, not setuptools.

Also there's no need for it to depend on python3-cryptography.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-cryptography-vectors.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb=
 b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index a8f8d0cd17e..3df61315ea9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -14,10 +14,6 @@ SRC_URI[sha256sum] =3D "fbb0408df8ff2d2b3dbd2928bc5b7f=
eebfdd36fb092fa8790d5778a9b9
 PYPI_PACKAGE =3D "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_setuptools_build_meta
-
-DEPENDS +=3D " \
-    python3-cryptography \
-"
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


