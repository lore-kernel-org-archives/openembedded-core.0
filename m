Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A78EC52D6D
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45938.1721746308296604716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B8C41480
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87D9C3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/37] python3-pluggy: clean up RDEPENDS
Date: Tue, 23 Jul 2024 15:51:11 +0100
Message-Id: <20240723145137.74198-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202378

importlib-metadata is no longer needed since 0.13.0.

more-itertools has never been imported directly by pluggy but was likely
a dependency coming via more-itertools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pluggy_1.5.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb b/meta/=
recipes-devtools/python/python3-pluggy_1.5.0.bb
index 9822cd59f3b..4f8412d4b31 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
@@ -6,9 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1c8206d16fd5cc=
02fa9b0bb98955e5c2"
 SRC_URI[sha256sum] =3D "2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c371=
5ca9e2486f1d0cf1"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
-RDEPENDS:${PN} +=3D "python3-importlib-metadata \
-                   python3-more-itertools \
-"
=20
 inherit pypi ptest python_setuptools_build_meta
=20
--=20
2.34.1


