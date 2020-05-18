Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web12.37546.1589790507319855012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 01:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49QXGJ2r8gz1rQHv;
	Mon, 18 May 2020 10:28:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49QXGJ2YZkz1qrKW;
	Mon, 18 May 2020 10:28:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id w7Oea_jCFH8m; Mon, 18 May 2020 10:28:23 +0200 (CEST)
X-Auth-Info: esEae6HXd8EFyxiZSS2npY/RlQAVyHe/8Q/dLO0aC8c=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 18 May 2020 10:28:23 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Stefano Babic <sbabic@denx.de>
Subject: [PATCH] libubootenv: Depend on zlib
Date: Mon, 18 May 2020 10:27:55 +0200
Message-Id: <20200518082755.4198-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The libubootenv depends on zlib as it calls at least crc32() from
there and links against it. Add the DEPENDS entry.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bs=
p/u-boot/libubootenv_0.2.bb
index 3251d0f05b..fa90a12bf8 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "U-Boot libraries and tools to access environment"
-DEPENDS +=3D "mtd-utils"
+DEPENDS +=3D "mtd-utils zlib"
=20
 DESCRIPTION =3D "This package contains tools and libraries to read \
 and modify U-Boot environment. \
--=20
2.25.1

