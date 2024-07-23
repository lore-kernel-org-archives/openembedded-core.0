Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC7FC52D1F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45841.1721746305929322772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15ED41476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FF4D3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/37] python3-chardet: remove pytest-runner DEPENDS
Date: Tue, 23 Jul 2024 15:51:07 +0100
Message-Id: <20240723145137.74198-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202374

This was removed in 4.0.0[1]

[1] https://github.com/chardet/chardet/commit/6a59c4b19226231fc310a3c11e0=
be939a04f9b3e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-chardet_5.2.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta=
/recipes-devtools/python/python3-chardet_5.2.0.bb
index ed792b1c7ed..9acbeeb3f25 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
@@ -5,9 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 SRC_URI[sha256sum] =3D "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633=
b2dd092ca39c1cf7"
=20
-# setup.py of chardet needs this.
-DEPENDS +=3D "python3-pytest-runner-native"
-
 inherit pypi python_setuptools_build_meta
=20
 PACKAGES =3D+ "${PN}-cli"
--=20
2.34.1


