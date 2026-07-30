Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F38C55171
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19041.1785438015657037759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 12:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lHbCuiWP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31827165C
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E99E03F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785438015; bh=rNwcQikfQCscp5gaNiaLRHSiRnxALyw0BzStQpV46/k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lHbCuiWPzXAYDlCwfqqzAwlbM1qEyE0ihjOxoZCKKeuu0d/5i8u0vW2bHJDsW4W3+
	 hELnHJEvBFDN1i0xETlPXyohpqyCUxcDVOCpe73D7ZRESe3YS5iQhfCHv5xF/XvLe5
	 AjCxbH1GUq3Xuu0U1TTzOn0AJEJ1fRMDPs+rtIuo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-uv-build: add missing build dependencies
Date: Thu, 30 Jul 2026 20:00:07 +0100
Message-ID: <20260730190007.2440254-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730190007.2440254-1-ross.burton@arm.com>
References: <20260730190007.2440254-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242375

Now that we're disabling more vendoring, add missing build dependencies
for zstd and pkgconfig.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-uv-build_0.11.32.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb b/m=
eta/recipes-devtools/python/python3-uv-build_0.11.32.bb
index 7f3487d25ca..037f55e9810 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
@@ -15,7 +15,9 @@ SRC_URI[sha256sum] =3D "906542262cf0e1f507d3e9bcf0a73af=
a9c9269daf261fbd5357a541b53
=20
 require ${BPN}-crates.inc
=20
-inherit pypi python_maturin cargo-update-recipe-crates
+inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
+
+DEPENDS +=3D "zstd"
=20
 PYPI_PACKAGE =3D "uv_build"
=20
--=20
2.43.0


