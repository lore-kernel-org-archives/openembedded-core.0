Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web12.44132.1590461616269876950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSF0hWzz1qsZq;
	Tue, 26 May 2020 04:53:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSF0SwHz1qr4y;
	Tue, 26 May 2020 04:53:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id vqgE-nmJDXo5; Tue, 26 May 2020 04:53:31 +0200 (CEST)
X-Auth-Info: oI0l/uweUNzIzRgteDk1U3qUXcyIsKcd5pWF2e8K5CU=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:31 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/12] [zeus] gstreamer1.0-plugins-ugly: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:54 +0200
Message-Id: <20200526025300.295408-6-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ins-ugly_1.16.1.bb =3D> gstreamer1.0-plugins-ugly_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16=
.1.bb =3D> gstreamer1.0-plugins-ugly_1.16.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.16.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.1=
6.2.bb
index ecab318899..94abc33542 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.=
bb
@@ -10,8 +10,8 @@ SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-p=
lugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG=
_CON.patch \
             "
-SRC_URI[md5sum] =3D "668795903cb4971fba9aa89abdea8369"
-SRC_URI[sha256sum] =3D "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc=
850c5fa425968a1d"
+SRC_URI[md5sum] =3D "10283ff5ef1e34d462dde77042e329bd"
+SRC_URI[sha256sum] =3D "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6=
fc0160d3c560fbca"
=20
 S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
=20
--=20
2.25.1

