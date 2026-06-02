Return-Path: <rl@karo-electronics.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0E4CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:22:37 +0000 (UTC)
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26659.1780410154150281094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@karo-electronics.de header.s=kas202603021246 header.b=iF6h176E;
 spf=pass (domain: karo-electronics.de, ip: 85.13.167.58, mailfrom: rl@karo-electronics.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1780410116;
	bh=6ld4a85pAtAHRXPLTPWpk0V1HaE28faFpGxphkiSgE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=iF6h176EnKYxDPaQUtNR+e8aAZWyKh+w45PApPDvCsooXsTqxpZOTfEOWcq5wvWGv
	 IJi6yTPUum7c4m8vzNtJStzJkkatlPt0vOD2/Ll+u22FQb2HvJiBooPnnCgIFPvhf2
	 WsROCgaBImgAP4MyYoXpqG4YP9IcTM+5CeVMh5lxQ9hFmd23LMPHO1T+v/r4kDjzkM
	 KzXC4tnlQOc3EVXnM7vaCKAzOGQn1+HuQJfHifFSDPt+w9YoHQRbEjKdh66s0yR/B8
	 ienHSa0nNfJayc4WScKkze+MjReHEPHAkyzw2lXWI6dT3hR8W7vV6xYpHTEYN0LV4o
	 xMxnaaIEb61EQ==
Received: from robin-MS-7E12.ka-ro.local (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 97EEA772248D;
	Tue,  2 Jun 2026 16:21:56 +0200 (CEST)
From: Robin Lintermann <rl@karo-electronics.de>
To: openembedded-core@lists.openembedded.org
Cc: Robin Lintermann <rl@karo-electronics.de>
Subject: [scarthgap][PATCH 4/5] alsa-utils: add runtime dependency on ncurses for 'alsamixer'
Date: Tue,  2 Jun 2026 16:21:31 +0200
Message-ID: <20260602142132.976138-4-rl@karo-electronics.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602142132.976138-1-rl@karo-electronics.de>
References: <20260602142132.976138-1-rl@karo-electronics.de>
MIME-Version: 1.0
X-Spamd-Bar: ----
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238054

Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.11.bb
index e598fac9f8..8b59417b01 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
@@ -61,6 +61,8 @@ ALSA_UTILS_PKGS =3D "\
 PACKAGES +=3D "${ALSA_UTILS_PKGS}"
 RDEPENDS:${PN} +=3D "${ALSA_UTILS_PKGS}"
=20
+RDEPENDS:alsa-utils-alsamixer +=3D "ncurses"
+
 FILES:${PN} =3D ""
 ALLOW_EMPTY:alsa-utils =3D "1"
 FILES:alsa-utils-alsabat     =3D "${bindir}/alsabat"
--=20
2.43.0


