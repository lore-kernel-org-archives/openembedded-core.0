Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CDEC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39270.1753891431812401968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B16F1BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1481F3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/13] python3-editables: use correct build backend
Date: Wed, 30 Jul 2025 17:03:36 +0100
Message-ID: <20250730160343.4053614-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221127

This package uses flit, not setuptools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-editables_0.5.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-editables_0.5.bb b/meta=
/recipes-devtools/python/python3-editables_0.5.bb
index f3261183cb4..11566f096b9 100644
--- a/meta/recipes-devtools/python/python3-editables_0.5.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.5.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D41bc1be47=
b7bb8240db3ef928c7cb0bf"
=20
 SRC_URI[sha256sum] =3D "309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f=
60f081f8e80d1de2"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
-RDEPENDS:${PN} +=3D "\
-        python3-io \
-"
+RDEPENDS:${PN} +=3D "python3-io"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


