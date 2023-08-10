Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD642C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:42:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.14251.1691664123006937139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 03:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=tZOiBVJ5;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 81B29866C2;
	Thu, 10 Aug 2023 12:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691664120;
	bh=++KnkUMk6RMIfNjGbYfq7isAy3NRORagGgfbRjCR7vg=;
	h=From:To:Cc:Subject:Date:From;
	b=tZOiBVJ5ajSYTsLG29eDmRd0iwXz6FrkwgO2iO375vsEVQaF4LwDHXZ++LcI8gIxP
	 HSc8Zv/nvrypllII3QBGJP40XVeWH3sQGkdQajosBE2EJIU6kMJt2tZs6+/XEQJh8R
	 eWvlKq/uptFhYGGLSMVpNcY2bGSHMAV8vpcWboGkYPGWFv+sC98dLa4KS7oCi8TVR7
	 dT8ztrPWusVXaOqZTcdYtD5mqbKWP010r0UVBAghnB8sAY6l986xO8iqKz6feoFWeJ
	 BaSMUFSpamU4YeAuU3dbCuwGYoasNj9nCX1w1HcjLuIXQiTGSY+/ACb1vuHCW8oIkI
	 DIGaMaqM7XxxA==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [kirkstone][PATCH] linux-firmware: Fix mediatek mt7601u firmware path
Date: Thu, 10 Aug 2023 12:41:47 +0200
Message-Id: <20230810104147.5319-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185736

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
 meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 3470131294..d304b75c5f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -417,7 +417,7 @@ LICENSE:${PN}-mt7601u-license =3D "Firmware-ralink_a_=
mediatek_company_firmware"
=20
 FILES:${PN}-mt7601u-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u =3D " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
=20
 RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt7601u-license"
--=20
2.40.1


