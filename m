Return-Path: <prvs=71068b085e=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2056093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 14:32:55 +0000 (UTC)
X-AuditID: 0a000213-f79036d00000110e-08-580f6d176146
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	BA.7C.04366.71D6F085; Tue, 25 Oct 2016 09:32:56 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 25 Oct 2016 09:32:55 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions
	from BSD
Thread-Index: AQHSLsysmeG7fJrNeEmoTg6H5uPmbQ==
Date: Tue, 25 Oct 2016 14:32:55 +0000
Message-ID: <1477405943-3543-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.128]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWyRiBPQ1cilz/CYPIrFotff6cwW9z5+Y7d
	gclj56y77B7nNq5gDGCK4rZJSiwpC85Mz9O3S+DOeHvtOVvBD6GKnc+2sjYwPuTvYuTkkBAw
	kTjx9TgrhC0mceHeejYQW0jgBKPEvf36EPYsRonGjgIQm03ASOLc9U2MILaIQLTE0hkz2bsY
	OTiYBSIlDjWZg4SFBQIk3t89ygoSFhEIlbj91BGiWk9izZtTzCA2i4CqxMPje1hAbF4BD4nt
	J5eB2YxAF3w/tYYJxGYWEJe49WQ+E8RlAhJL9pxnhrBFJV4+/gd1sZxE/8NtjBD1ehI3pk5h
	g7C1JZYtfM0MMV9Q4uTMJywTGEVmIRk7C0nLLCQts5C0LGBkWcUomJuYmWOol1pcXJZfkqqX
	nJ+7iREYA1wMTMI7GOdMsT3EKMDBqMTDG1DGFyHEmlhWXJl7iFGag0VJnPfah0fhQgLpiSWp
	2ampBalF8UWlOanFhxiZODgPMUpwcEmJFKfmpaQWJZaWZMSDoiq+GBhXUg2MOftblL5yRLqH
	9/ko/ts4d17JL7OQq71vPE/rnizcE5Lpx5mmMT9kv2POnlq2789qsrKOpWWFVG0Q9Ql4WdDx
	YmN7yXKFj3pKbld2BT9L3veZN9p77brf705mLeo7csTdLmzrR1Xl6sdzVLzfv7/wqzr76or8
	EJFPt99MnP0poJlTtmqt9A52JZbijERDLeai4kQAywWxU30CAAA=
Subject: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Tue, 25 Oct 2016 14:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: "Davis, Michael" <michael.davis@essvote.com>

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy and
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 54c7e784c7689d8cff4173db716bb7913c65315f)
Signed-off-by: Michael Davis <michael.davis@essvote.com>
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

