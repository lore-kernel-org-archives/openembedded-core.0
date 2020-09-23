Received: from mailout09.rmx.de (mailout09.rmx.de [94.199.88.74])
 by mx.groups.io with SMTP id smtpd.web10.8697.1600850768446900043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.74, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout09.rmx.de (Postfix) with ESMTPS id 4BxBbc4w5DzbjQj;
	Wed, 23 Sep 2020 10:46:04 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4BxBbZ0GKDz2TTNC;
	Wed, 23 Sep 2020 10:46:02 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.106) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 23 Sep
 2020 10:46:01 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Christian Eggers <ceggers@arri.de>
Subject: [PATCH] packagegroup: rrecommend perf also for musl
Date: Wed, 23 Sep 2020 10:45:44 +0200
Message-ID: <20200923084544.32128-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.106]
X-RMX-ID: 20200923-104602-4BxBbZ0GKDz2TTNC-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The perf recipe builds fine for musl.

Fixes: d758a4445a ("packagegroup: Disable packages not available on musl"=
)
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../packagegroups/packagegroup-core-tools-profile.bb          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.=
bb
index 1c94653d72..a5dca95c2a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -17,7 +17,7 @@ PROFILE_TOOLS_X_nios2 =3D ""
 PROFILE_TOOLS_SYSTEMD =3D "${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', 'systemd-analyze', '', d)}"
=20
 RRECOMMENDS_${PN} =3D "\
-    ${PERF} \
+    perf \
     blktrace \
     ${PROFILE_TOOLS_X} \
     ${PROFILE_TOOLS_SYSTEMD} \
@@ -26,8 +26,6 @@ RRECOMMENDS_${PN} =3D "\
 PROFILETOOLS =3D "\
     powertop \
     "
-PERF =3D "perf"
-PERF_libc-musl =3D ""
=20
 # systemtap needs elfutils which is not fully buildable on some arches/l=
ibcs
 SYSTEMTAP =3D "systemtap"
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

