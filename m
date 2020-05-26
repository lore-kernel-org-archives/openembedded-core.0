Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.44381.1590461623339198836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSP6dsmz1rxYn;
	Tue, 26 May 2020 04:53:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSP6SkNz1qr4y;
	Tue, 26 May 2020 04:53:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id AOeJQoI331gg; Tue, 26 May 2020 04:53:40 +0200 (CEST)
X-Auth-Info: GGqJl5Sjks9sn3zC2zwgvx7GuUZH7fD4bL6+t2VPmaU=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:40 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/12] [zeus] gst-validate: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:53:00 +0200
Message-Id: <20200526025300.295408-12-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{gst-validate_1.16.1.bb =3D> gst-validate_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.1.bb =3D> gs=
t-validate_1.16.2.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb b/m=
eta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
index 7d602eabc6..35492fe861 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343"
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] =3D "793e75f4717f718ad204c554d577b160"
-SRC_URI[sha256sum] =3D "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2=
df0cac5b77562899"
+SRC_URI[md5sum] =3D "688f42c52d62e8c5e506df911553fb2c"
+SRC_URI[sha256sum] =3D "4861ccb9326200e74d98007e316b387d48dd49f072e0b78c=
b9d3303fdecfeeca"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.=
0-plugins-base"
 RRECOMMENDS_${PN} =3D "git"
--=20
2.25.1

