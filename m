Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.12744.1601986272055348342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 05:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C5GXG4qsmz1r7Qv;
	Tue,  6 Oct 2020 14:11:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C5GXG4L00z1qv2h;
	Tue,  6 Oct 2020 14:11:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id mnWC0rub9n8d; Tue,  6 Oct 2020 14:11:09 +0200 (CEST)
X-Auth-Info: kr3lSPZ+iXwPuqqIinkR32XW8+c6t+72KIiDg1YkA3A=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  6 Oct 2020 14:11:09 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
Date: Tue,  6 Oct 2020 14:11:03 +0200
Message-Id: <20201006121105.94671-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{lttng-modules_2.11.2.bb =3D> lttng-modules_2.11.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb =3D> lttng-mod=
ules_2.11.6.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.11.6.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
index 6fff096a37..a38d8afb7a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -13,8 +13,8 @@ SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV=
}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
=20
-SRC_URI[md5sum] =3D "2e3bc8cfb264fa13f374618b46f170e7"
-SRC_URI[sha256sum] =3D "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e2=
1604c35a51a6441d"
+SRC_URI[md5sum] =3D "8ef09fdfcdec669d33f7fc1c1c80f2c4"
+SRC_URI[sha256sum] =3D "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c6=
63ff3875ba9c8566"
=20
 export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
=20
--=20
2.28.0

