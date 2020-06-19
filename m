Received: from mailout02.rmx.de (mailout02.rmx.de [62.245.148.41])
 by mx.groups.io with SMTP id smtpd.web11.2701.1592595929750385626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 62.245.148.41, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout02.rmx.de (Postfix) with ESMTPS id 49pTmj6285zNqvN
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:25 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49pTmV6zkvz2xFS
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:14 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Fri, 19 Jun 2020 21:44:46 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.14) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 19 Jun
 2020 21:44:46 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 3/4] dbus/dbus-glib: Extend for nativesdk
Date: Fri, 19 Jun 2020 21:43:51 +0200
Message-ID: <20200619194351.30053-4-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619194351.30053-1-ceggers@arri.de>
References: <20200619194351.30053-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.14]
X-OriginalArrivalTime: 19 Jun 2020 19:44:46.0332 (UTC) FILETIME=[15FFF3C0:01D64672]
X-RMX-ID: 20200619-214518-49pTmV6zkvz2xFS-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

dbus-glib is required by consolekit which in turn is required by
networkmanager.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-core/dbus/dbus-glib_0.110.bb | 2 +-
 meta/recipes-core/dbus/dbus_1.12.18.bb    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-cor=
e/dbus/dbus-glib_0.110.bb
index 0b45805cf4..f3f20fc7e1 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
@@ -36,4 +36,4 @@ FILES_${PN}-dev +=3D "${bindir}/dbus-binding-tool"
 RDEPENDS_${PN}-tests +=3D "dbus-x11"
 FILES_${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb b/meta/recipes-core/d=
bus/dbus_1.12.18.bb
index 2fcb3079ad..5bbdd8dd50 100644
--- a/meta/recipes-core/dbus/dbus_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.18.bb
@@ -43,7 +43,6 @@ DEBIANNAME_${PN} =3D "dbus-1"
 PACKAGES =3D+ "${PN}-lib"
=20
 OLDPKGNAME =3D "dbus-x11"
-OLDPKGNAME_class-nativesdk =3D ""
=20
 # for compatibility
 RPROVIDES_${PN} =3D "${OLDPKGNAME}"
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

