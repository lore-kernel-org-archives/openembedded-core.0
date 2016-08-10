Return-Path: <prvs=9030fb0a98=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 35D61771CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:11:30 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-f8-57ab8a730895
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	3F.F6.03522.37A8BA75; Wed, 10 Aug 2016 15:11:31 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 15:11:30 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCHv2] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR80NiS3bugD7BPkC3FZOZ06gHnw==
Date: Wed, 10 Aug 2016 20:11:30 +0000
Message-ID: <1470859858-26333-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWyRiBPQ7e4a3W4weImVYs7P9+xOzB6nNu4
	gjGAMYrbJimxpCw4Mz1P3y6BO+PvitnsBR95Kq6+usHUwNjF3cXIySEhYCJx9d0mRghbTOLC
	vfVsXYxcHEICRxkltnWeYYZwZjFKHJi3ghmkik3ASOLcdYgOEYFoiaUzZrKD2MwCBhLvNm9k
	BbGFBdwl/h5YyAZR4yPx/fcRFghbT+LtwYNMIDaLgKrE1lU9YHFeAU+J3y3HweKMQFd8P7WG
	CWKmuMStJ/OZIK4TkFiy5zwzhC0q8fLxP1YIW1bi244pLBD1ehI3pk5hg7C1JZYtfM0MMV9Q
	4uTMJywTGEVmIRk7C0nLLCQts5C0LGBkWcXIl2ukl1pcXJZfkqqXnJ+7iREY8FwMTLN3MO6Z
	4HCIUYCDUYmHN8BlVbgQa2JZcWXuIUZpDhYlcV4VIaVwIYH0xJLU7NTUgtSi+KLSnNTiQ4xM
	HJyHGCU4uKREilPzUlKLEktLMuJBcRVfDIwsqQZGkz2MkX79za/OH1blZ+Tn3Lki6i77/fWJ
	t+Yt3HVTnEvt8qLc7uK6dkYPOd1XTz6tvZWW4F92Y7MXs8D1PBv/tTMYhC55Ppj4PPy/tRNX
	z99Xc0NYvadJHdIoin8gkC0e9uXH8juau/VdX1+Z/fd9yO5nucvsVnfPlTZbue7zOtlqcfEr
	SY+ylFiKMxINtZiLihMBm9lyBHQCAAA=
Subject: [meta-oe][PATCHv2] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 20:11:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy so the package can =
be used with GPLv3 blacklisted.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..da6a067 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,6 +1,8 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
 LICENSE =3D "BSD & GPLv3+"
+LICENSE_${PN} =3D "BSD"
+LICENSE_${PN}-spy =3D "GPLv3+"
 LICENSE_${PN}-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
@@ -20,14 +22,16 @@ EXTRA_OECONF =3D " \
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

