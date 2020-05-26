Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.44202.1590461612003846929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJS83TRZz1qs4G;
	Tue, 26 May 2020 04:53:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJS83CMkz1qr4y;
	Tue, 26 May 2020 04:53:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id DF2nj8NE6gqU; Tue, 26 May 2020 04:53:27 +0200 (CEST)
X-Auth-Info: ifDaghNB09boYbe93X67BlSsM/QBdRAJAPogoMY2Tys=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:27 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/12] [zeus] gstreamer1.0: upgrade 1.16.1 -> 1.16.2
Date: Tue, 26 May 2020 04:52:50 +0200
Message-Id: <20200526025300.295408-2-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526025300.295408-1-marex@denx.de>
References: <20200526025300.295408-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{gstreamer1.0_1.16.1.bb =3D> gstreamer1.0_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.1.bb =3D> gs=
treamer1.0_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
index ff92f63bac..cf7c1bca12 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
@@ -27,8 +27,8 @@ SRC_URI =3D " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] =3D "c505fb818b36988daaa846e9e63eabe8"
-SRC_URI[sha256sum] =3D "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af=
0639d46f1cf4377d"
+SRC_URI[md5sum] =3D "0e661ed5bdf1d8996e430228d022628e"
+SRC_URI[sha256sum] =3D "e3f044246783fd685439647373fa13ba14f7ab0b346eadd0=
6437092f8419e94e"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
                    "
--=20
2.25.1

