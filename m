Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C660C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:42:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.14258.1691664152938108993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 03:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=giiZnJuu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3ACD4866C2;
	Thu, 10 Aug 2023 12:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691664150;
	bh=1xTWvl3hAInlwb0zoLX9ar39a1NYnxMf4PXM4ISy3OQ=;
	h=From:To:Cc:Subject:Date:From;
	b=giiZnJuuVylx1wLL/++v5aK3WCOvY0/R+WgC5PQaJdM7hHG9Tr8BvDRvVgCQw+85v
	 FGU1CGb9i0HyqC828raSH5uY27ZO2X72kw9DdO2F/PAmI32GYscLb1bYF9Z7OyRWp6
	 lOhwtKsHBsN/aOag++QCDBIY7NdFExT6SHuVcvN1cqw6rPFiloKg64BVJxhOPeqPbu
	 jIEdv0Ja984wxBRq8GlKD2xl9/USPu+y6B2cJjMPw9AYY0EU/fgK5xdUInoz2lLeOe
	 ttIK/Olk+I4P1iCWnPcdjS6rJTrxJdRQBlSvdHkAfierGvDVPktfNpViXpAA/4xsmz
	 +ynKVfHeYiFIA==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [dunfell][PATCH] linux-firmware: Fix mediatek mt7601u firmware path
Date: Thu, 10 Aug 2023 12:42:24 +0200
Message-Id: <20230810104224.5364-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185737

The following linux-firmware commit moved the mt7601u firmware blob
into a mediatek/ subdirectory, update the path accordingly.
8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")

(From OE-Core rev: 6fa5c4967a7e70192e9233c92534f27ec3e394c8)

Fixes: 64603f602d ("linux-firmware: upgrade 20230404 -> 20230515")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
NOTE: Adjusted to the old syntax with underscores
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index a367a9fd01..206de1bcd1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -411,7 +411,7 @@ LICENSE_${PN}-mt7601u-license =3D "Firmware-ralink_a_=
mediatek_company_firmware"
=20
 FILES_${PN}-mt7601u-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.ralink_a_mediatek_company_firmware"
 FILES_${PN}-mt7601u =3D " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
=20
 RDEPENDS_${PN}-mt7601u +=3D "${PN}-mt7601u-license"
--=20
2.40.1


