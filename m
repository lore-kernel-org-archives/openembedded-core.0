Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A91C5516F
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19409.1785438015191214223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 12:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F48BVJT1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9368C165C
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 563123F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785438014; bh=s9A01cLbBIfsFdY/YLrgnMuGv7+6qblSwdhXvxKU7m0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F48BVJT1mlbBHvnTpUZUpRqL1/ji15eAct3IkgemrRFuUCck8ghfyGItEydbD8Wsm
	 dpaIKTC+yqJ0z061wNXTVRqzlvbiroF8ctwZf6YC7FveYJw9C/M/eB+CqFJPrtDAL4
	 sLNoyUEacbwwjbwnY8+x/BZgeIsVGpVp2/PLisa4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-maturin: add missing build dependencies
Date: Thu, 30 Jul 2026 20:00:06 +0100
Message-ID: <20260730190007.2440254-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730190007.2440254-1-ross.burton@arm.com>
References: <20260730190007.2440254-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242374

Now that we're disabling more vendoring, add missing build dependencies
for zstd and pkgconfig.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-maturin_1.14.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb b/met=
a/recipes-devtools/python/python3-maturin_1.14.1.bb
index 88ba336022b..854822d3c0b 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
@@ -15,11 +15,12 @@ DEPENDS +=3D "\
     python3-setuptools-rust-native \
     python3-semantic-version-native \
     python3-setuptools-rust \
+    zstd \
 "
=20
 require ${BPN}-crates.inc
=20
-inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_bu=
ild_meta
+inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_bu=
ild_meta pkgconfig
=20
 do_configure() {
     python_pyo3_do_configure
--=20
2.43.0


