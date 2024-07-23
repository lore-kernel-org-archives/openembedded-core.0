Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E07EC3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45852.1721746314462179533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F881476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D06253F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/37] python3-pyasn1: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:22 +0100
Message-Id: <20240723145137.74198-22-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202389

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb b/meta/=
recipes-devtools/python/python3-pyasn1_0.6.0.bb
index c321f4e58e5..7237557f444 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f792539=
08c986e6cacf380c3a5f6d"
=20
 SRC_URI[sha256sum] =3D "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706=
ccd82328cfc8f64c"
=20
-inherit pypi setuptools3 pytest
+inherit pypi python_setuptools_build_meta ptest
=20
 RDEPENDS:${PN}:class-target +=3D " \
     python3-codecs \
--=20
2.34.1


