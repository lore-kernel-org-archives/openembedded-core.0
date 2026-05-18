Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7475ACD4F54
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:33:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5635.1779100376963094314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=d/Af9veR;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39579463D
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E54CD3F85F
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779100376; bh=IRGWHoaDWMTUuayqvbsut32nrCQgEnzaIDH796zlgPE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d/Af9veRL+bMUH3x2Lo6ikd98sOBD3ufqT2+M4R5ISkiFZyr/08nTbo0fz7sS2l3g
	 kz/kqOTRhSH020nkYVmDjuvcHUsS8LTMyQtJSzNmY7KYRGsrv+7e/i5amzqjXLyUdU
	 kPPgBH8UIwc+NrZMEBplxpXn8boRFnqTnDbjsMTo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] groff: do out-of-tree builds
Date: Mon, 18 May 2026 11:32:47 +0100
Message-ID: <20260518103249.592747-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518103249.592747-1-ross.burton@arm.com>
References: <20260518103249.592747-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237214

The use of in-tree builds was done in 2019[1] as a result of a build
failure, which no longer happens so this must have been fixed in either
groff or gnulib.

[1] oe-core 70c2364cae3 ("groff: upgrade 1.22.3 -> 1.22.4")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/groff/groff_1.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-e=
xtended/groff/groff_1.24.1.bb
index 24b8146a727..e780603b1e6 100644
--- a/meta/recipes-extended/groff/groff_1.24.1.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "74e2819795b6aff431aeac983d63a9c=
8968eeaba2a2eba7df8ba4c7b41
 DEPENDS =3D "bison-native groff-native"
 RDEPENDS:${PN} +=3D "perl sed"
=20
-inherit autotools-brokensep texinfo multilib_script pkgconfig
+inherit autotools texinfo multilib_script pkgconfig
=20
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
=20
--=20
2.43.0


