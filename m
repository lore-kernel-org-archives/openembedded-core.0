Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B87BC27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:20:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20644.1717694419877179616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42AD2F4
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:20:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A2AC3F792
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:20:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-cryptodome: remove redundant PYPI_PACKAGE_EXT
Date: Thu,  6 Jun 2024 17:20:14 +0000
Message-Id: <20240606172015.3118703-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200408

This is the default value, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python-pycryptodome.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/=
recipes-devtools/python/python-pycryptodome.inc
index 8d9b6d911ea..ec9241e6d5d 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D29242a7041=
0a4eeff488a28164e7ab93"
=20
 inherit pypi
=20
-PYPI_PACKAGE_EXT =3D "tar.gz"
-
 RDEPENDS:${PN} +=3D " \
     python3-cffi \
     python3-ctypes \
--=20
2.34.1


