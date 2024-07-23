Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D3C52D1D
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45956.1721746319118191312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 470BD1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65DDB3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/37] python3-websockets: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:30 +0100
Message-Id: <20240723145137.74198-30-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202397

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-websockets_12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/me=
ta/recipes-devtools/python/python3-websockets_12.0.bb
index a04c63f6af1..e7f5e295238 100644
--- a/meta/recipes-devtools/python/python3-websockets_12.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_12.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/aaugustin/websockets"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51924a6af4495b8cfaee1b1da869b=
6f4"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0=
537f393dd38c8b1b"
=20
--=20
2.34.1


