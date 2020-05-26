Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.44378.1590461615869943569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSG3Rgcz1rx8y;
	Tue, 26 May 2020 04:53:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSG3DQ0z1qr4y;
	Tue, 26 May 2020 04:53:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 0cAT_FPlhatC; Tue, 26 May 2020 04:53:33 +0200 (CEST)
X-Auth-Info: 3S7K/uWvSJBlrDNFVvwOgS21TTGdM8YBowILjjOW2Ck=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:33 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/12] [zeus] gstreamer1.0-libav: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:55 +0200
Message-Id: <20200526025300.295408-7-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reamer1.0-libav_1.16.1.bb =3D> gstreamer1.0-libav_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.1.bb =3D=
> gstreamer1.0-libav_1.16.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
index 10955ff161..b57b744a80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
@@ -19,8 +19,8 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-=
libav/gst-libav-${PV}.tar.x
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] =3D "58023f4c71bbd711061e350fcd76c09d"
-SRC_URI[sha256sum] =3D "e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916=
548e9d4381ca61c4"
+SRC_URI[md5sum] =3D "eacebd0136ede3a9bd3672eeb338806b"
+SRC_URI[sha256sum] =3D "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b5=
4d4d2d94188deef2"
=20
 S =3D "${WORKDIR}/gst-libav-${PV}"
=20
--=20
2.25.1

