Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1TUQaD-0005TM-5F
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Nov 2012 00:23:25 +0100
Received: from NAEMCASHT01.na.leapfrog.com (unknown [10.16.4.161])
	by mx3.leapfrog.com (Postfix) with ESMTP id 618175FED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2012 15:52:12 -0700 (PDT)
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0379.000;
	Fri, 2 Nov 2012 15:52:12 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] Change mm-common to inherit the gnomebase class
Thread-Index: Ac25TD/SQU2I/rPLRHyUeOQMIAJCEw==
Date: Fri, 2 Nov 2012 22:52:12 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0FB5B71946@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Change mm-common to inherit the gnomebase class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Nov 2012 23:23:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Change mm-common to inherit the gnomebase class instead of
 the gnome class. This allows it to be built in distros that
 don't have x11 support since x11 is not actually a
 dependency of many glib related libraries.


Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb b/meta-oe/re=
cipes-core/mm-common/mm-common_0.9.5.bb
index 79da497..c49b4c8 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
@@ -1,4 +1,4 @@
-inherit gnome
+inherit gnomebase
=20
 SRC_URI[archive.md5sum] =3D "4a4dad67fc8d7e0c529f3a8c6ba4d8b2"
 SRC_URI[archive.sha256sum] =3D "9c602dba89d264a4719db996b9b169716df2d4d10b=
cd24e56fc3572865a5cb8b"
--=20
1.7.9.5



