Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web10.12831.1601986233945159482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 05:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C5GWX3r8Lz1r7Qk;
	Tue,  6 Oct 2020 14:10:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C5GWX3QFkz1qv2d;
	Tue,  6 Oct 2020 14:10:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 5SqvndIrnImq; Tue,  6 Oct 2020 14:10:31 +0200 (CEST)
X-Auth-Info: odZ3sG3DYOUgeEtLGnFYvokMJzMJq0ca+ce6rUJNvlw=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  6 Oct 2020 14:10:30 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] [dunfell] stress-ng: Upgrade 0.11.01 -> 0.11.17
Date: Tue,  6 Oct 2020 14:10:24 +0200
Message-Id: <20201006121024.94560-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upgrade to the latest upstream version. This fixes at least one build
error, in which build fails due to undefined FS_IOC_GETFLAGS. See commit
d7b4301d ("stress-efivar: only exercise FS_IOC_*FLAGS if they are defined=
")
in stress-ng for details.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Do-not-preserve-ownership-when-installing-example-jo.patch | 2 +-
 .../stress-ng/{stress-ng_0.11.01.bb =3D> stress-ng_0.11.17.bb}  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb =3D> stress=
-ng_0.11.17.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preser=
ve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/str=
ess-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-j=
o.patch
index c860c717ac..f1911b1d88 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-owne=
rship-when-installing-example-jo.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-owne=
rship-when-installing-example-jo.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile b/Makefile
 index f36e57e..20488af 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -452,6 +452,6 @@ install: stress-ng stress-ng.1.gz
+@@ -461,6 +461,6 @@ install: stress-ng stress-ng.1.gz
  	mkdir -p ${DESTDIR}${MANDIR}
  	cp stress-ng.1.gz ${DESTDIR}${MANDIR}
  	mkdir -p ${DESTDIR}${JOBDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb b/meta/=
recipes-extended/stress-ng/stress-ng_0.11.17.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index 3486be1b03..9b987c7bde 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.=
xz \
            file://0001-Do-not-preserve-ownership-when-installing-example=
-jo.patch \
            "
-SRC_URI[md5sum] =3D "a558fc7fb9d0a851afe6de09080b5401"
-SRC_URI[sha256sum] =3D "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b775=
27549a7736f65494"
+SRC_URI[md5sum] =3D "7b89157c838f2bb4bdeba8f46e3c56ae"
+SRC_URI[sha256sum] =3D "860291dd3a18b985b3483190a627bbede2b5c52113766c19=
21001b3fb4b83af0"
=20
 DEPENDS =3D "coreutils-native"
=20
--=20
2.28.0

