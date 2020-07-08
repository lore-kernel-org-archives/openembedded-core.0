Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web10.9968.1594213568373523859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 06:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 4B20182HFPz30MR
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 15:06:04 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B20174Cw8z2xGF
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 15:06:03 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.174) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 15:06:03 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] util-linux: Set license for library sub packages
Date: Wed, 8 Jul 2020 15:05:49 +0200
Message-ID: <20200708130549.26227-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.174]
X-RMX-ID: 20200708-150603-4B20174Cw8z2xGF-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

- libblkid is exclusively licensed under LGPL-2.1+ (libblkid/COPYING)
- libfdisk is exclusively licensed under LGPL-2.1+ (libfdisk/COPYING)
- libmount is exclusively licensed under LGPL-2.1+ (libmount/COPYING)
- libsmartcols is exclusively licensed under LGPL-2.1+
(libsmartcols/COPYING)
- libuuid is exclusively licensed under BSD-3-Clause (libuuid/COPYING)

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index 532cceb935..06fbf7a229 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,6 +7,11 @@ disk partitioning, kernel message management, filesystem=
 creation, and system lo
 SECTION =3D "base"
=20
 LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE_${PN}-libblkid =3D "LGPLv2.1+"
+LICENSE_${PN}-libfdisk =3D "LGPLv2.1+"
+LICENSE_${PN}-libmount =3D "LGPLv2.1+"
+LICENSE_${PN}-libsmartcols =3D "LGPLv2.1+"
+LICENSE_${PN}-libuuid =3D "BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0a4=
492b7f4e33da \
                     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
@@ -16,7 +21,10 @@ LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0f=
d5c050c6187d2bf0a4492b7f4e33da
                     file://Documentation/licenses/COPYING.BSD-4-Clause-U=
C;md5=3D263860f8968d8bafa5392cab74285262 \
                     file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d=
24b23290c \
                     file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d693a6=
43e29987c2 \
-                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc9=
06bc01cc04"
+                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc9=
06bc01cc04 \
+                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37bc9=
06bc01cc04 \
+                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a4b3=
7bc906bc01cc04 \
+"
=20
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives=
 python3-dir bash-completion ptest
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler

