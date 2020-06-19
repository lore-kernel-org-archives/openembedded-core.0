Received: from mailout06.rmx.de (mailout06.rmx.de [94.199.90.92])
 by mx.groups.io with SMTP id smtpd.web10.2581.1592595936617122250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.92, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout06.rmx.de (Postfix) with ESMTPS id 49pTmr5BJlz9wP0
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:32 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49pTmj6D45z2xCX
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:25 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Fri, 19 Jun 2020 21:44:47 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.14) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 19 Jun
 2020 21:44:47 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 4/4] consolekit: Extend for native/nativesdk
Date: Fri, 19 Jun 2020 21:43:52 +0200
Message-ID: <20200619194351.30053-5-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619194351.30053-1-ceggers@arri.de>
References: <20200619194351.30053-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.14]
X-OriginalArrivalTime: 19 Jun 2020 19:44:47.0408 (UTC) FILETIME=[16A42300:01D64672]
X-RMX-ID: 20200619-214531-49pTmj6D45z2xCX-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

consolekit is required by networkmanager.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/r=
ecipes-support/consolekit/consolekit_0.4.6.bb
index 89f2d77b66..ad35e8c6d6 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b=
29e73d4adb9f9f6552 \
                     file://src/main.c;endline=3D21;md5=3D0a994e097697802=
20163255d8f9071c3"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
-RDEPENDS_${PN} +=3D "base-files"
+# base-files is only available for target
+RDEPENDS_${PN}_class-target +=3D "base-files"
=20
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
@@ -47,3 +48,5 @@ do_install_append() {
 	# Remove /var/ directories as the daemon creates them as required
 	rm -rf ${D}${localstatedir}
 }
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

