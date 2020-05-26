Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.44204.1590461620389535539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSL6znsz1qsZs;
	Tue, 26 May 2020 04:53:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSL6qFpz1qr4y;
	Tue, 26 May 2020 04:53:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id EnCEqWljrqG2; Tue, 26 May 2020 04:53:37 +0200 (CEST)
X-Auth-Info: nUQWS+Im2eyQkqG6d9+GQaVS2B3hRiO59NjmfZVT/JM=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:37 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/12] [zeus] gstreamer1.0-rtsp-server: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:58 +0200
Message-Id: <20200526025300.295408-10-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...sp-server_1.16.1.bb =3D> gstreamer1.0-rtsp-server_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.=
1.bb =3D> gstreamer1.0-rtsp-server_1.16.2.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1=
.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.1=
6.2.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.=
16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16=
.2.bb
index 45302ef4f6..15ef5d1b28 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.b=
b
@@ -13,8 +13,8 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PN=
REAL}/${PNREAL}-${PV}.tar.x
            file://gtk-doc-tweaks.patch \
            "
=20
-SRC_URI[md5sum] =3D "380d6a42e856c32fcefa508ad57129e0"
-SRC_URI[sha256sum] =3D "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbe=
f94124906d700144"
+SRC_URI[md5sum] =3D "8a998725820c771ba45be6e18bfdf73a"
+SRC_URI[sha256sum] =3D "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede=
7926e9cdbb1dc26e"
=20
 S =3D "${WORKDIR}/${PNREAL}-${PV}"
=20
--=20
2.25.1

