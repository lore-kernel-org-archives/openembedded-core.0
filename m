Return-Path: <prvs=10304a5978=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 060707709E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:12:16 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-06-57ab7c8f4768
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	5F.D6.03522.F8C7BA75; Wed, 10 Aug 2016 14:12:15 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 14:12:15 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR8zsa13pxI4Nz60u9kv5YOhVb6g==
Date: Wed, 10 Aug 2016 19:12:15 +0000
Message-ID: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWyRiBPQ7e/ZnW4wYY2E4s7P9+xOzB6nNu4
	gjGAMYrbJimxpCw4Mz1P3y6BO+Py01eMBe95KlbcK2lg7OTuYuTkkBAwkbj2/iwrhC0mceHe
	ejYQW0jgKKPEwxnSEPYsRont88Dq2QSMJM5d38QIYosIREssnTGTHcRmFjCQeLd5I9gcYQFX
	ifl/lzBB1HhJXDv0n7mLkQPI1pNYNlkTJMwioCoxf9dZoDA7B6+Ap8QpYZAoI9AB30+tYYIY
	KC5x68l8JojDBCSW7DnPDGGLSrx8/A/qYFmJbzumsEDU60ncmDqFDcLWlli28DVYPa+AoMTJ
	mU9YJjCKzEIydhaSlllIWmYhaVnAyLKKkS/XSC+1uLgsvyRVLzk/dxMjMMi5GJhm72DcM8Hh
	EKMAB6MSD2+Ay6pwIdbEsuLK3EOM0hwsSuK8KkJK4UIC6YklqdmpqQWpRfFFpTmpxYcYmTg4
	DzFKcHBJiRSn5qWkFiWWlmTEg2IpvhgYTVINjAlznslPvyaSJ9y9Nker4O0tx8srpJqzD67d
	2nf44NlatY/Rrp0Hq14eCfy/mTP2p43v+awf5zeLJt80bY254vSd64Ny0DF/V9+XQomxX6+L
	pZ28vYkj9sx735DU/1dMp1/+KbT0aYvNi3XGfW+TK/6FbGc5Hqexu2wOg6X9xjzGLyfFbj21
	/qLEUpyRaKjFXFScCADVbQ0ubgIAAA==
Subject: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 19:12:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy so the package can =
be used with GPLv3 blacklisted.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..e1d405b 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,6 +1,7 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
-LICENSE =3D "BSD & GPLv3+"
+LICENSE =3D "BSD"=20
+LICENSE_${PN}-spy =3D "GPLv3+"
 LICENSE_${PN}-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
@@ -20,14 +21,16 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
-PACKAGES =3D+ "${PN}-lib"
+PACKAGES =3D+ "${PN}-lib ${PN}-spy"
=20
 RRECOMMENDS_${PN} =3D "ccid"
=20
-FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-spy +=3D "${bindir}/pcsc-spy \
+                    ${libdir}/libpcscspy*${SOLIBS}"
+FILES_${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
=20
 RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
-RDEPENDS_${PN} +=3D"python"
+RDEPENDS_${PN}-spy +=3D"python"
--=20
2.5.5

