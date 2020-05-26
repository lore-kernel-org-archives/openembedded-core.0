Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.44379.1590461617380469196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSH6d2Yz1rxYn;
	Tue, 26 May 2020 04:53:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSH6B7rz1qr4y;
	Tue, 26 May 2020 04:53:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 4Ni9XuT3kSVS; Tue, 26 May 2020 04:53:34 +0200 (CEST)
X-Auth-Info: n4rQoB1zwhdT7Roc7thu2Oa6cACuoJcWCxgXAIuPio0=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:34 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/12] [zeus] gstreamer1.0-omx: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:56 +0200
Message-Id: <20200526025300.295408-8-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{gstreamer1.0-omx_1.16.1.bb =3D> gstreamer1.0-omx_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.1.bb =3D=
> gstreamer1.0-omx_1.16.2.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
index cb2f7045a8..c0acf46c22 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}=
.tar.xz"
=20
-SRC_URI[md5sum] =3D "89772e7a277fd0abfc250eaf8e4e9ce9"
-SRC_URI[sha256sum] =3D "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9=
fa8753e42ab24bb2"
+SRC_URI[md5sum] =3D "6362786d2b6cce34de08c86b7847f782"
+SRC_URI[sha256sum] =3D "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69=
225a88bec6d27439"
=20
 S =3D "${WORKDIR}/gst-omx-${PV}"
=20
--=20
2.25.1

