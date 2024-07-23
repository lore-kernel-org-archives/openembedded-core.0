Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E502C52D74
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45947.1721746312830076740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2D11476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 261F83F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/37] python3-pathspec: use python_flit_core
Date: Tue, 23 Jul 2024 15:51:19 +0100
Message-Id: <20240723145137.74198-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202386

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pathspec_0.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb b/me=
ta/recipes-devtools/python/python3-pathspec_0.12.1.bb
index b61f6733972..2c80b24c289 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df24=
7a0c7f619bab123dad"
=20
 SRC_URI[sha256sum] =3D "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacae=
f9a838c4e29f5712"
=20
-inherit pypi setuptools3
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


