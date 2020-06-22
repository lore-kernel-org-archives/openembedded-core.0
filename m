Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web12.16702.1592830462048565413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 05:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 49r8Vy0r7Kz34rM
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:18 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49r8Vv2BQLz2TRt0
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:15 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Mon, 22 Jun 2020 14:54:14 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.60) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 22 Jun
 2020 14:54:14 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH v2 1/2] libnl: Extend for native/nativesdk
Date: Mon, 22 Jun 2020 14:53:58 +0200
Message-ID: <20200622125359.11587-2-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622125359.11587-1-ceggers@arri.de>
References: <20200622125359.11587-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.60]
X-OriginalArrivalTime: 22 Jun 2020 12:54:14.0944 (UTC) FILETIME=[3BC9AA00:01D64894]
X-RMX-ID: 20200622-145415-49r8Vv2BQLz2TRt0-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

libnl is required by networkmanager.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-support/libnl/libnl_3.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-sup=
port/libnl/libnl_3.5.0.bb
index c0609c4d90..9d0e1441a9 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -40,3 +40,5 @@ FILES_${PN}-route =3D "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-xfrm  =3D "${libdir}/libnl-xfrm-3.so.*"
 RREPLACES_${PN}-genl =3D "libnl-genl2"
 RCONFLICTS_${PN}-genl =3D "libnl-genl2"
+
+BBCLASSEXTEND =3D "native nativesdk"
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

