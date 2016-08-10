Return-Path: <prvs=80303a7639=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id AA61260722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 21:36:19 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-a2-57ab9e53ede8
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	76.27.03522.35E9BA75; Wed, 10 Aug 2016 16:36:19 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 16:36:19 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR8086hnYKgcvZc0iDTbUZ8+O5Ag==
Date: Wed, 10 Aug 2016 21:36:18 +0000
Message-ID: <1470864947-17916-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWyRiBPQzd43upwg4bDJhZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8bZYw1sBV2CFTMmnmBpYOzh62Lk4JAQMJG4vCW/i5ETyBST
	uHBvPVsXIxeHkMBRRomGA+sYIZxZjBI/ug8yg1SxCRhJnLu+iRHEFhGIllg6YyY7iM0sYCDx
	bvNGVhBbWMBdYs6Fz1A1PhK/JrWwgiwTEdCTuNDCBxJmEVCVaJ8+E2wkr4CnxPGn88DKGYGO
	+H5qDRPESHGJW0/mM0EcJyCxZM95ZghbVOLl43+sELasxLcdU1gg6vUkbkydwgZha0ssW/ga
	ar6gxMmZT1gmMIrMQjJ2FpKWWUhaZiFpWcDIsoqRL9dIL7W4uCy/JFUvOT93EyMw2LkYmGbv
	YNwzweEQowAHoxIP74Wpq8OFWBPLiitzDzFKc7AoifOqCCmFCwmkJ5akZqemFqQWxReV5qQW
	H2Jk4uA8xCjBwSUlUpyal5JalFhakhEPiqn4YmBUSTUwutlLPpgteqvAUsP/29Q51gJ9LQwR
	nAKz/xSv9S+L4jFj63rzdLV6WFtwpAzT3kuzjx7aYly8UqWVm/nZ9fPZKcKhYmpFibf+8Pvq
	/JmuZLFp6q7HLQk5v5x6f89//uUFG8PC6ml5oZEcP4KuvTr078PNaPWaq6a3d/2qCf+3L+Bi
	UNLz73NnKrEUZyQaajEXFScCAD6vKu9yAgAA
Subject: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 21:36:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy and
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.
---
 .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  | 24 ++++++++++++++++++=
----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..0d2cb33 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,7 +1,13 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
 LICENSE =3D "BSD & GPLv3+"
-LICENSE_${PN}-dev =3D "GPLv3+"
+LICENSE_${PN} =3D "BSD"
+LICENSE_${PN}-lib =3D "BSD"
+LICENSE_${PN}-doc =3D "BSD"
+LICENSE_${PN}-dev =3D "BSD"
+LICENSE_${PN}-dbg =3D "BSD & GPLv3+"
+LICENSE_${PN}-spy =3D "GPLv3+"
+LICENSE_${PN}-spy-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
=20
@@ -20,14 +26,24 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
-PACKAGES =3D+ "${PN}-lib"
+PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN=
}-spy-dev"
=20
 RRECOMMENDS_${PN} =3D "ccid"
=20
-FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN} =3D "${sbindir}/pcscd"
+FILES_${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
+FILES_${PN}-dev =3D "${includedir} \
+                   ${libdir}/pkgconfig \
+                   ${libdir}/libpcsclite.la \
+                   ${libdir}/libpcsclite.so"
+                  =20
+FILES_${PN}-spy =3D "${bindir}/pcsc-spy \
+                   ${libdir}/libpcscspy*${SOLIBS}"
+FILES_${PN}-spy-dev =3D "${libdir}/libpcscspy.la \
+                       ${libdir}/libpcscspy.so "
=20
 RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
-RDEPENDS_${PN} +=3D"python"
+RDEPENDS_${PN}-spy +=3D"python"
--=20
2.5.5

