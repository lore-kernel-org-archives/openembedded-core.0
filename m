Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E66C52CDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45861.1721746321427377069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86B9E1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ADF573F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/37] python3-uritools: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:34 +0100
Message-Id: <20240723145137.74198-34-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202401

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-uritools_4.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb b/met=
a/recipes-devtools/python/python3-uritools_4.0.2.bb
index 5ffedccb855..08ebd07705f 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ec55353c80c66=
2e4255f8889a0ca558"
=20
 SRC_URI[sha256sum] =3D "04df2b787d0eb76200e8319382a03562fbfe4741fd66c155=
06b08d3b8211d573"
=20
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


