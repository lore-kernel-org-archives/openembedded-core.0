Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BF0C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6583.1784124319141386549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=J6gCK4P/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723131477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44DC73F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124318; bh=s1xRVGQAVtVRQX7ftBakgMrg2V9cAhSqAprxkl1dT14=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J6gCK4P/a6E6bERAi6YBEfguQzcdfmtLV6BpNJQ2RRnEKvNunqDDuqnch7qCSdjBF
	 KXeeHfFtW2cz6OWwGiI3hj5c4nVSMdexRgFO2d0NHVClriIYTjk0UESWsea10aGFgl
	 3EkayBmRjYJ1jZF2DWWfQ9L8Kol6PhgtM3SOALg4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] xev: build with meson
Date: Wed, 15 Jul 2026 15:05:03 +0100
Message-ID: <20260715140507.2329605-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240967

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xev_1.2.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.7.bb b/meta/recipes-g=
raphics/xorg-app/xev_1.2.7.bb
index 6e866b8f8c1..2b90f701c1f 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
@@ -15,3 +15,5 @@ DEPENDS +=3D "libxrandr xorgproto"
 SRC_URI[sha256sum] =3D "95167895924de58e34b1013b2b0c8476e90d0888c6c39e7a=
e9bc35e3a19dba04"
=20
 SRC_URI_EXT =3D "xz"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


