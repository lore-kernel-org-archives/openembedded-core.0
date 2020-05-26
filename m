Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web10.44377.1590461614137016111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJSC3GH6z1qsZn;
	Tue, 26 May 2020 04:53:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJSC328jz1qr4y;
	Tue, 26 May 2020 04:53:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id jzUdNDkBWcmE; Tue, 26 May 2020 04:53:30 +0200 (CEST)
X-Auth-Info: 0d+CGGHmssf03mJrNtOcHdAxTuFNVgoaKIW0j3iVDXA=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:30 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/12] [zeus] gstreamer1.0-plugins-bad: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:53 +0200
Message-Id: <20200526025300.295408-5-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ugins-bad_1.16.1.bb =3D> gstreamer1.0-plugins-bad_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.=
1.bb =3D> gstreamer1.0-plugins-bad_1.16.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.1=
6.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.=
16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16=
.2.bb
index 1731be8441..756b823e7d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.b=
b
@@ -8,8 +8,8 @@ SRC_URI =3D " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.pat=
ch \
 "
-SRC_URI[md5sum] =3D "24d4d30ecc67d5cbc77c0475bcea1210"
-SRC_URI[sha256sum] =3D "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed=
70e7dcd799c2adb5"
+SRC_URI[md5sum] =3D "ccc7404230afddec723bbdb63c89feec"
+SRC_URI[sha256sum] =3D "f1cb7aa2389569a5343661aae473f0a940a90b872001824b=
c47fa8072a041e74"
=20
 S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
=20
--=20
2.25.1

