Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.12843.1601986276149226862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 05:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C5GXL52hDz1sN8X;
	Tue,  6 Oct 2020 14:11:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C5GXL4tVTz1qv2h;
	Tue,  6 Oct 2020 14:11:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id jTydp2f0MH36; Tue,  6 Oct 2020 14:11:13 +0200 (CEST)
X-Auth-Info: 4ZygiVpvBXU3+VeCy0/CcOTXfxnIisItKdgoluOwecU=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  6 Oct 2020 14:11:13 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] [dunfell] lttng-ust: update to 2.11.1
Date: Tue,  6 Oct 2020 14:11:05 +0200
Message-Id: <20201006121105.94671-3-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006121105.94671-1-marex@denx.de>
References: <20201006121105.94671-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.11.1.bb =3D> lttng-ust_2.11.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb =3D> lttng-ust_2.1=
1.2.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb b/meta/recipes=
-kernel/lttng/lttng-ust_2.11.2.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.11.2.bb
index 3bd0dfad61..8968728dae 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.2.bb
@@ -31,8 +31,8 @@ SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-us=
t-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-se=
tup.patch \
            "
=20
-SRC_URI[md5sum] =3D "7de04a8ff1f0a4effa09a42620ec4081"
-SRC_URI[sha256sum] =3D "7fbab963d60741ffd4d8dd0a246f6cf168cdfe3b2385798b=
d90550f5f0bba869"
+SRC_URI[md5sum] =3D "82556e4ab28c818c80db84296fc28bb3"
+SRC_URI[sha256sum] =3D "6b481cec7fe748503c827319e3356137bceef4cce8adecbd=
a3a94c6effcdd161"
=20
 CVE_PRODUCT =3D "ust"
=20
--=20
2.28.0

