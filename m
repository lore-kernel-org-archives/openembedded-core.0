Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web10.17444.1613313656769070765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 06:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Ddqfb0YRjz1qs0Y;
	Sun, 14 Feb 2021 15:40:55 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Ddqfb0DGPz1t5kb;
	Sun, 14 Feb 2021 15:40:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id z3KMxTV3b7IF; Sun, 14 Feb 2021 15:40:54 +0100 (CET)
X-Auth-Info: P/UHBgZpYk1aHPdfYcEkJ2Ed6LIrDzkwuaEgfgbMtuk=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 14 Feb 2021 15:40:54 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] weston-init: Fix weston-keyboard path in weston.ini
Date: Sun, 14 Feb 2021 15:40:45 +0100
Message-Id: <20210214144045.8344-1-marex@denx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The weston-keyboard executable is installed into /usr/libexec
instead of /usr/lib/weston , correct the path in weston.ini .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NOTE: this could be applied at least all the way to Dunfell / 3.1.y
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/=
recipes-graphics/wayland/weston-init/weston.ini
index b48726d59c..6bd5aef55a 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -42,7 +42,7 @@ require-input=3Dfalse
 #path=3D/build/weston-0lEgCh/weston-1.11.0/weston-flower
=20
 #[input-method]
-#path=3D/usr/lib/weston/weston-keyboard
+#path=3D/usr/libexec/weston-keyboard
=20
 #[output]
 #name=3DLVDS1
--=20
2.30.0

