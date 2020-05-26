Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.44135.1590461619033229119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSK47rKz1rxcH;
	Tue, 26 May 2020 04:53:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSK3xrhz1qr4y;
	Tue, 26 May 2020 04:53:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id PghFONhSHFz9; Tue, 26 May 2020 04:53:35 +0200 (CEST)
X-Auth-Info: fuXc17Ws0D6Ibytdn1cN748E34LHMlePUwr+zPohCE4=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:35 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/12] [zeus] gstreamer1.0-python: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:57 +0200
Message-Id: <20200526025300.295408-9-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...amer1.0-python_1.16.1.bb =3D> gstreamer1.0-python_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.1.bb =
=3D> gstreamer1.0-python_1.16.2.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.=
bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
index c0f8b5aaa3..989556ce8b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca=
07e725ab0076a5f740"
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz \
            file://0001-meson.build-fix-builds-with-python-3.8.patch \
            "
-SRC_URI[md5sum] =3D "499645fbd1790c5845c02a3998dccc1b"
-SRC_URI[sha256sum] =3D "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8d=
f35b780bd8347489"
+SRC_URI[md5sum] =3D "6ac709767334d8d0a71cb4e016f6abeb"
+SRC_URI[sha256sum] =3D "208df3148d73d9f416d016564737585d8ea763d91201732d=
44b5fe688c6288a8"
=20
 DEPENDS =3D "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"
--=20
2.25.1

