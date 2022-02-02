Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40417C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.63778.1643809394183818459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=DNWZ1P0o;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 948DD838DD;
	Wed,  2 Feb 2022 14:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809382;
	bh=8NvEYrHRfxfGf7I5s7cpUfigLCHD00VhJwT6dj0/W9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNWZ1P0ohnvEGvrZAp3HZl8rHPk0frK7mTHniuCMVdlaEwAYTbvBbePHG8hkHuB+M
	 yd37ULLlNO1Pq8OiTAu6wIvHo/R0eBTeSuNulxlV9j2AAV1yXci1K+HiOafQbdLeWO
	 aruj+nQIYiTdOtBMOA2hnUlzz//AIq6c6KKlC8J3NrVqOnhAxal1vx/Z0Uaag3jAFG
	 BvwEoLuIkQa1mUkjOed9/TInthQJ6Z/QZnOAHBS3LZR2ZZT0ZxZMwAjSURddsb4inV
	 LKYTN7ogU4o3d1BGCDuBzQFs2ek9jNXBprzwjX7ZMUkwkfNfGG/NPJtvZGdiR+DIq3
	 JIrtYQ0VffIGw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 08/12] gstreamer1.0-omx: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:29 +0100
Message-Id: <20220202134233.2091916-9-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202134233.2091916-1-ch@denx.de>
References: <20220202134233.2091916-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161207

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../{gstreamer1.0-omx_1.18.5.bb =3D> gstreamer1.0-omx_1.19.90.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb =3D=
> gstreamer1.0-omx_1.19.90.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.19.90.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.19.90.bb
index b2c1eb3ea0..45a304f624 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.19.90.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}=
.tar.xz"
=20
-SRC_URI[sha256sum] =3D "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b=
1453a32e7be93b42"
+SRC_URI[sha256sum] =3D "1699520169e5fb61e4583dfbc18c0674485592ca5bba1da3=
4fd25bb8bed0a0c7"
=20
 S =3D "${WORKDIR}/gst-omx-${PV}"
=20
--=20
2.34.1


