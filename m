Received: from mailout12.rmx.de (mailout12.rmx.de [94.199.88.78])
 by mx.groups.io with SMTP id smtpd.web11.7838.1594204487029074363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 03:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.78, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout12.rmx.de (Postfix) with ESMTPS id 4B1wfV4TsCzRl4Y
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 12:34:42 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B1wfT6zJRz2xbK
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 12:34:41 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.174) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 12:34:41 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] avahi: Fix typo in recipe
Date: Wed, 8 Jul 2020 12:34:27 +0200
Message-ID: <20200708103427.18264-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.174]
X-RMX-ID: 20200708-123441-4B1wfT6zJRz2xbK-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

According to the PACKAGES variable, LICENSE_avahi-client is misspelled.
Additionally, the libavahi-client package actually only includes
LGPLv2.1+ software (as opposed to the global LICENSE variable).


Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 35d0c3ea75..c8a3f876aa 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -108,7 +108,7 @@ LICENSE_libavahi-gobject =3D "LGPLv2.1+"
 LICENSE_avahi-daemon =3D "LGPLv2.1+"
 LICENSE_libavahi-common =3D "LGPLv2.1+"
 LICENSE_libavahi-core =3D "LGPLv2.1+"
-LICENSE_avahi-client =3D "LGPLv2.1+"
+LICENSE_libavahi-client =3D "LGPLv2.1+"
 LICENSE_avahi-dnsconfd =3D "LGPLv2.1+"
 LICENSE_libavahi-glib =3D "LGPLv2.1+"
 LICENSE_avahi-autoipd =3D "LGPLv2.1+"
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

