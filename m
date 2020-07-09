Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.6362.1594300678812693746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 06:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4B2cDM381Wzlkr4
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2020 15:17:55 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B2cDL5Qqtz2xDN
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2020 15:17:54 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.146) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 9 Jul
 2020 15:17:54 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] libgcc: Set LICENSE for -lic package
Date: Thu, 9 Jul 2020 15:17:34 +0200
Message-ID: <20200709131734.30235-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.146]
X-RMX-ID: 20200709-151754-4B2cDL5Qqtz2xDN-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The default license (GPL-3.0-with-GCC-exception & GPLv3) is not suitable
for installing libgcc-lic on an image where INCOMPATIBLE_LICENSE is set
to "GPL-3.0".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-devtools/gcc/libgcc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools=
/gcc/libgcc.inc
index 6d48ec9809..372da46459 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -35,6 +35,7 @@ PACKAGES =3D "\
 LICENSE_${PN} =3D "GPL-3.0-with-GCC-exception"
 LICENSE_${PN}-dev =3D "GPL-3.0-with-GCC-exception"
 LICENSE_${PN}-dbg =3D "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-lic =3D "GPL-3.0-with-GCC-exception"
=20
=20
 FILES_${PN}-dev =3D "\
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

