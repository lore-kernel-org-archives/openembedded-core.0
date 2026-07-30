Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EEAC5516D
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19036.1785438014160886184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 12:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ebZPG8MY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 609B4204C
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 217C33F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785438013; bh=W+wMYss4/+vlK5o/KSlIn4HXNNz2zCgatfZHQkUxACk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ebZPG8MYUOYZIvV5lZiftFCSD1vPYOKihpljg8Ht5JosSps5jfDbz6+tVarpdZTvD
	 Is/Xue61Zp5Lw8+Wu7wB79qCq3eoX1jv5cpuy8qH9VYHnUkSJ5i6Qx/eLxTarHwZLz
	 46TuT9gx9K3Pg+hnxnOqnvjjqhcpZ/589P9rdoK0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] cargo: add missing build dependencies
Date: Thu, 30 Jul 2026 20:00:04 +0100
Message-ID: <20260730190007.2440254-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730190007.2440254-1-ross.burton@arm.com>
References: <20260730190007.2440254-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242373

Now that we're disabling more vendoring, add missing build dependencies
for libssh2 and sqlite3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/cargo_1.96.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-de=
vtools/rust/cargo_1.96.1.bb
index 179ed2bbb56..5390ad385a1 100644
--- a/meta/recipes-devtools/rust/cargo_1.96.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.96.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://crates.io"
 LICENSE =3D "Apache-2.0 OR MIT"
 SECTION =3D "devel"
=20
-DEPENDS =3D "openssl zlib curl ca-certificates libssh2"
+DEPENDS =3D "openssl zlib curl ca-certificates libgit2 libssh2 sqlite3"
=20
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE-MIT;md5=3Db377b220f43d747efdec40d69fcaa69d \
--=20
2.43.0


