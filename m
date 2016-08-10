Return-Path: <prvs=10304a5978=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 0A89F771D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:54:05 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-48-57ab946d1448
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	91.17.03522.D649BA75; Wed, 10 Aug 2016 15:54:05 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 15:54:05 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCHv3] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR80lUr7goP3n39kCFLVcWIx3bNA==
Date: Wed, 10 Aug 2016 20:54:05 +0000
Message-ID: <1470862413-5030-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWyRiBPQzd3yupwgy13tC3u/HzH7sDocW7j
	CsYAxihum6TEkrLgzPQ8fbsE7owpy/8zFlzlq2h9uIyxgXEfTxcjJ4eEgInEu+sLmCFsMYkL
	99azdTFycQgJHGWU2Li2G8qZxSjx8lAHG0gVm4CRxLnrmxhBbBGBaImlM2ayg9jMAgYS7zZv
	ZAWxhQXcJaaf3cwKUeMjsXbxJzYIW0/i34kLTCA2i4CqxMfD78Hm8Ap4SHx/85QFxGYEuuL7
	qTVMEDPFJW49mc8EcZ2AxJI956EuFZV4+fgfK4QtK/FtxxQWiHo9iRtTp7BB2NoSyxa+ZoaY
	LyhxcuYTlgmMIrOQjJ2FpGUWkpZZSFoWMLKsYuTLNdJLLS4uyy9J1UvOz93ECAx4Lgam2TsY
	90xwOMQowMGoxMMb4LIqXIg1say4MvcQozQHi5I4r4qQUriQQHpiSWp2ampBalF8UWlOavEh
	RiYOzkOMEhxcUiLFqXkpqUWJpSUZ8aC4ii8GRpZUAyPzb+2Fhj0c2wKlwjIuJ7zk8pK5t7JP
	f77KxU+tr6ZrzWLKcTPU/75gzo4N744YLzpf7ZF3X8x2j8s6x8/HXBZfrP3cN7m1pcxGpWaH
	SuU9C4f7wR++tlzXOdxX8GX+Eg4z87x3k9nWPW0S6zoUsbrS369IN25ejM0+kdRtc/leTHx+
	+pyg+RYlluKMREMt5qLiRABe+aA9dAIAAA==
Subject: [meta-oe][PATCHv3] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 20:54:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy so the package can =
be used with GPLv3 blacklisted.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 16 ++++++++++++---=
-
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..7213276 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,7 +1,12 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
 LICENSE =3D "BSD & GPLv3+"
-LICENSE_${PN}-dev =3D "GPLv3+"
+LICENSE_${PN} =3D "BSD"
+LICENSE_${PN}-lib =3D "BSD"
+LICENSE_${PN}-dev =3D "BSD"
+LICENSE_${PN}-doc =3D "BSD"
+LICENSE_${PN}-dbg =3D "BSD & GPLv3+"
+LICENSE_${PN}-spy =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
=20
@@ -20,14 +25,17 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
-PACKAGES =3D+ "${PN}-lib"
+PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy"
=20
 RRECOMMENDS_${PN} =3D "ccid"
=20
-FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-spy +=3D "${bindir}/pcsc-spy \
+                    ${libdir}/libpcscspy*${SOLIBS} \
+                    ${libdir{/libpcscspy.la"
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

