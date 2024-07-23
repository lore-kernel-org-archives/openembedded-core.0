Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55515C52D70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45854.1721746315730284904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C61E51476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0110F3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/37] python3-cffi: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:24 +0100
Message-Id: <20240723145137.74198-24-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202391

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cffi_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/r=
ecipes-devtools/python/python3-cffi_1.16.0.bb
index c5f6578ab20..8e829794a56 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -6,7 +6,7 @@ DEPENDS +=3D "libffi python3-pycparser"
=20
 SRC_URI[sha256sum] =3D "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa=
5647806c25e02cc0"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN}:class-target =3D " \
     python3-ctypes \
--=20
2.34.1


