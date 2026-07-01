Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB92C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:25:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49271.1782923156314761695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sd7qf7Hi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70C5A1E7D
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:25:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BDE03F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782923155; bh=O4u17pqTp/a0mER1tPo3SgzEYtf37lZVHMXBbwQESak=;
	h=From:To:Subject:Date:From;
	b=sd7qf7HivHHVDqhd8V6Uk6FrITMCusubMiy7xT1KW5DpMZ4waR2jKjTWG5Q6WR2Q2
	 bgIEYdADd8GbWzwvFXoGDLO/in6jrEbf3K3mS/sOfU6yOgGpnHGOTmYBLHCZkNzMqv
	 ywdoKkp2Z3a4CWVDhs7ckW7jWYglH2sQxXXcWozg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: remove obsolete staticdev packaging
Date: Wed,  1 Jul 2026 17:25:54 +0100
Message-ID: <20260701162554.1047036-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239996

Kea doesn't build pointless static libraries for dynamically loaded
modules anymore, so remove this line.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.3.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.3.bb
index 1c3dae15958..7f05db0b15f 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.3.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -104,5 +104,4 @@ PACKAGES =3D+ "${PN}-python"
 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python =3D "python3"
=20
-FILES:${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES:${PN} +=3D "${libdir}/hooks/*.so"
--=20
2.43.0


