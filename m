Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8F7C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45847.1721746312190956902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E8E91476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E9293F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/37] python3-importlib-metadata: remove obsolete dependencies
Date: Tue, 23 Jul 2024 15:51:18 +0100
Message-Id: <20240723145137.74198-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202385

As we have Python 3.11+, tomllib will be used instead of python3-toml.

Use of pathlib2 was removed in 3.0.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-importlib-metadata_8.0.0.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.=
0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
index 7c920cffa28..1e446c891f1 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
@@ -12,8 +12,8 @@ SRC_URI[sha256sum] =3D "188bd24e4c346d3f0a933f275c2fec6=
7050326a856b9a359881d7c2a69
=20
 S =3D "${WORKDIR}/importlib_metadata-${PV}"
=20
-DEPENDS +=3D "python3-setuptools-scm-native python3-toml-native"
-RDEPENDS:${PN} +=3D "python3-zipp python3-pathlib2"
+DEPENDS +=3D "python3-setuptools-scm-native"
+RDEPENDS:${PN} +=3D "python3-zipp"
 RDEPENDS:${PN}:append:class-target =3D " python3-misc"
 RDEPENDS:${PN}:append:class-nativesdk =3D " python3-misc"
=20
--=20
2.34.1


