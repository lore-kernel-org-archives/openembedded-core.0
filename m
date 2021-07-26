Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web11.27244.1627285491525112293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 00:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4GYBlh6VQDz1sBR3;
	Mon, 26 Jul 2021 09:44:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4GYBlh5wkZz1qr3M;
	Mon, 26 Jul 2021 09:44:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id bW5OOy7ZDb5U; Mon, 26 Jul 2021 09:44:47 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon, 26 Jul 2021 09:44:46 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 53D8745411E4;
	Mon, 26 Jul 2021 09:44:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jT5C4Udy52ex; Mon, 26 Jul 2021 09:44:43 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id BA5A64540D3F;
	Mon, 26 Jul 2021 09:44:43 +0200 (CEST)
From: "Stefano Babic" <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] mtd-utils: upgrade 2.1.2 -> 2.1.3
Date: Mon, 26 Jul 2021 09:44:40 +0200
Message-Id: <20210726074440.52571-1-sbabic@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 105a68dad8..66c27e0ce1 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests +=3D "bash"
=20
-PV =3D "2.1.2"
+PV =3D "2.1.3"
=20
-SRCREV =3D "7b986779342021bda87c04da3bf729718736d8ab"
+SRCREV =3D "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
 SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
--=20
2.25.1

