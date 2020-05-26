Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web12.44129.1590461612002079799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJS93xxPz1qs4H;
	Tue, 26 May 2020 04:53:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJS92zrrz1qr50;
	Tue, 26 May 2020 04:53:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id Mm2me7e86L2j; Tue, 26 May 2020 04:53:28 +0200 (CEST)
X-Auth-Info: x8nJzNdDOID2dzoRCgfhqgxBwCDJtGWxx1HgDbLPRlc=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:28 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/12] [zeus] gstreamer1.0-plugins-base: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:51 +0200
Message-Id: <20200526025300.295408-3-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ins-base_1.16.1.bb =3D> gstreamer1.0-plugins-base_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16=
.1.bb =3D> gstreamer1.0-plugins-base_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.1=
6.2.bb
index cb99fba5ff..95d3a3679e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.=
bb
@@ -18,8 +18,8 @@ SRC_URI =3D " \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFL=
AGS.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] =3D "b5eb0651bab70bf1714f103bdd66ce47"
-SRC_URI[sha256sum] =3D "5c3cc489933d0597087c9bc6ba251c93693d64554bcc5635=
39a084fa2d5fcb2b"
+SRC_URI[md5sum] =3D "3fdb32823535799a748c1fc14f978e2c"
+SRC_URI[sha256sum] =3D "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa6=
00d910ec6987816a"
=20
 S =3D "${WORKDIR}/gst-plugins-base-${PV}"
=20
--=20
2.25.1

