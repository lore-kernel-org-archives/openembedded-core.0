Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5C2713AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 08:16:00 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xc8tF-0000i9-Ky from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Oct 2014 01:16:02 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.159]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Thu, 9 Oct 2014 09:16:00 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] latencytop: Creates x11 PACKAGECONFIG.
Thread-Index: AQHP3MgxvnN/UyptJ06KvTvNoeDpLJwneN9Q
Date: Thu, 9 Oct 2014 08:15:58 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994E7529E67@EU-MBX-01.mgc.mentorg.com>
References: <1412093023-3589-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1412093023-3589-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH v2] latencytop: Creates x11 PACKAGECONFIG.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Oct 2014 08:16:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any update on this patch?

Noor

-----Original Message-----
From: Noor, Ahsan [mailto:noor_ahsan@mentor.com]=20
Sent: Tuesday, September 30, 2014 9:04 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH v2] latencytop: Creates x11 PACKAGECONFIG.

From: Noor <noor_ahsan@mentor.com>

* Creates x11 packageconfig and update DEPENDS and EXTRA_OEMAKE_X
  for better handling.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipe=
s-kernel/latencytop/latencytop_0.5.bb
index 516e2c5..e910a96 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.latencytop.org/"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://latencytop.c;endline=3D23;md5=3Dee9ea9b141535=
6e5734adad4a87dc7fa"
=20
-DEPENDS =3D "virtual/libintl ncurses glib-2.0  ${@bb.utils.contains('DISTR=
O_FEATURES', 'x11', 'gtk+', '', d)}"
+DEPENDS =3D "virtual/libintl ncurses glib-2.0"
=20
 PR =3D "r3"
=20
@@ -15,7 +15,11 @@ SRC_URI =3D "http://www.latencytop.org/download/latencyt=
op-${PV}.tar.gz \  SRC_URI[md5sum] =3D "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] =3D "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95=
d62cd57e9203ef"
=20
-EXTRA_OEMAKE_X =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'HAS_GT=
K_GUI=3D1', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
+
+PACKAGECONFIG[x11] =3D ",,gtk+"
+
+EXTRA_OEMAKE_X =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'HAS_GTK_=
GUI=3D1', '', d)}"
=20
 CFLAGS +=3D "${LDFLAGS}"
=20
--
1.7.9.5


