Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.44380.1590461622676832351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSN3zBZz1rx8y;
	Tue, 26 May 2020 04:53:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSN3npkz1qr4y;
	Tue, 26 May 2020 04:53:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id zytYz_MrXHqf; Tue, 26 May 2020 04:53:39 +0200 (CEST)
X-Auth-Info: QcBvobdjeNhBUOth2nm+jZkB9EvTP/tuH1oigKDqtco=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:39 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/12] [zeus] gstreamer1.0-vaapi: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:59 +0200
Message-Id: <20200526025300.295408-11-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reamer1.0-vaapi_1.16.1.bb =3D> gstreamer1.0-vaapi_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.1.bb =3D=
> gstreamer1.0-vaapi_1.16.2.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
index 61cf705fd8..3170218abd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
@@ -13,8 +13,8 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/${RE=
ALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
=20
-SRC_URI[md5sum] =3D "15b08f76777359d87b0b4a561db05f1f"
-SRC_URI[sha256sum] =3D "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b6=
2380b9b5abb7603a"
+SRC_URI[md5sum] =3D "13f7cb6a64bde24e67f563377487dcce"
+SRC_URI[sha256sum] =3D "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106b=
eca162004ed7c601"
=20
 S =3D "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS =3D "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-p=
lugins-bad"
--=20
2.25.1

