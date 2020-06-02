Received: from mailout09.rmx.de (mailout09.rmx.de [94.199.88.74])
 by mx.groups.io with SMTP id smtpd.web12.11149.1591105983434731441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 06:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.74, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout09.rmx.de (Postfix) with ESMTPS id 49btlv1xRrzbhXw
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2020 15:52:59 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49btlr3bhxz2yxk
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2020 15:52:56 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Tue, 2 Jun 2020 15:52:37 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.51) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 2 Jun
 2020 15:52:36 +0200
From: ceggers@arri.de
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] librsvg: Extend for nativesdk
Date: Tue, 2 Jun 2020 15:52:20 +0200
Message-ID: <20200602135220.22834-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.51]
X-OriginalArrivalTime: 02 Jun 2020 13:52:37.0280 (UTC) FILETIME=[1314BA00:01D638E5]
X-RMX-ID: 20200602-155256-49btlr3bhxz2yxk-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Doxygen in meta-oe has recently been extended for nativesdk. Doxygen is
often used together with dot (graphviz) which in turn depends on
librsvg.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes=
-gnome/librsvg/librsvg_2.40.20.bb
index 6dd0533a5d..337299ff69 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
=20
 SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-i=
ntrospection
=20
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

