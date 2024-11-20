Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7999D743D0
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 19:51:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24287.1732132290897749997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 11:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7612B1480
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:52:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B173F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:51:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-cryptography-vectors: don't remove RECORD
Date: Wed, 20 Nov 2024 19:51:24 +0000
Message-Id: <20241120195124.1041875-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120195124.1041875-1-ross.burton@arm.com>
References: <20241120195124.1041875-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207480

We remove this file in the python_pep517 class now, so we don't need to
do it here.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cryptography-vectors_43.0.1.bb            | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_43=
.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.=
1.bb
index a1a10b7621b..1ad9a8ab867 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
@@ -19,11 +19,6 @@ DEPENDS +=3D " \
     python3-cryptography \
 "
=20
-do_install:append () {
-	# Remove the sha256 checksum lines for pycache files
-	sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info=
/RECORD -e '/__pycache__/d' -i
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 UPSTREAM_CHECK_REGEX =3D ""
--=20
2.34.1


