Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web09.9165.1627380524079611924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 03:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4GYsvF3JNRz1qy4l;
	Tue, 27 Jul 2021 12:08:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4GYsvF2nVrz1qqkP;
	Tue, 27 Jul 2021 12:08:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id n73xLozSKsGh; Tue, 27 Jul 2021 12:08:40 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 27 Jul 2021 12:08:40 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id AE72D4540776;
	Tue, 27 Jul 2021 12:08:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id Pimv7rbGqltx; Tue, 27 Jul 2021 12:08:37 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 5AB3845405FF;
	Tue, 27 Jul 2021 12:08:36 +0200 (CEST)
From: "Stefano Babic" <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH V2] mtd-utils: upgrade 2.1.2 -> 2.1.3
Date: Tue, 27 Jul 2021 12:08:18 +0200
Message-Id: <20210727100818.2553099-1-sbabic@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Drop also --enable-install-tests from configuration options because this
was removed in 2.1.3.

Signed-off-by: Stefano Babic <sbabic@denx.de>
CC: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes since V1:
	- remove obsolete option enable-install-tests

 meta/recipes-devtools/mtd/mtd-utils_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 105a68dad8..d7aa738558 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,17 +11,15 @@ inherit autotools pkgconfig update-alternatives
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
=20
 S =3D "${WORKDIR}/git"
=20
-EXTRA_OECONF +=3D "--enable-install-tests"
-
 # xattr support creates an additional compile-time dependency on acl bec=
ause
 # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr
 # regardless whether acl is enabled or disabled in the distro should be =
okay.
--=20
2.25.1

