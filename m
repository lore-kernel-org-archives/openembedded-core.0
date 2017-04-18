Return-Path: <prvs=628173e6b9=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id C14DB71CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 19:57:09 +0000 (UTC)
X-AuditID: 0a000213-badff70000000cd7-36-58f66f924d62
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	1D.04.03287.29F66F85; Tue, 18 Apr 2017 14:57:09 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 18 Apr 2017 14:57:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][morty][PATCH] logrotate: replace fedorahosted.org
	SRC_URI with github.com source
Thread-Index: AQHSuH309tfNOc0hmEqrrDh4BkWKtA==
Date: Tue, 18 Apr 2017 19:57:05 +0000
Message-ID: <20170418195705.9691-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.66]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWyRiBPQ3dq/rcIg3dz2Czu/HzHbvHj2URW
	i4UvFzI5MHss3vOSyWP/3DXsHuc2rmAMYI7itklKLCkLzkzP07dL4M5YvfQUU8EvoYpfp44x
	NzAuFehi5OSQEDCRmLh+OnsXIxeHkMAJRon1bbuYIJxZjBKnly1kAqliEzCSOHd9EyOILSIQ
	LbF0xkx2EJtZIF3iae9yNhBbWCBVYs+dicwQNVkSh1c+Z+1i5ACy9SQ+vGQBCbMIqEocujaB
	FcTmFbCVmP19M1icUUBM4vupNUwQI8Ulbj2ZzwRxnIDEkj3nmSFsUYmXj/+xQthyEuvenYSq
	15O4MXUKG4StLbFs4WtmiPmCEidnPmGZwCg8C8nYWUhaZiFpmYWkZQEjyypGwdzEzBxDvdTi
	4rL8klS95PzcTYzAKOBiYBLewThniu0hRgEORiUe3gs6XyOEWBPLiitzDzFKc7AoifOe5QiO
	EBJITyxJzU5NLUgtii8qzUktPsTIxMF5iFGCg0tKpDg1LyW1KLG0JCMeFEPxxcAokmpgXPeO
	7YuzNavevTdH1c80PBFr//5+XUyTcpuv0DNLaxZh16JNWZc0HI5/y/NaNrXlCNupi3efvp08
	i+k+Z1Sg/KrM5kuCRaHqH81MUrc1dLhIinzl1r6xaPHylUwpy0x/Ch100z6btyl7cXo5Y52/
	/USPf1MmvH/3V+lCxIe2cjWzhf/X/H7dr8RSnJFoqMVcVJwIAIo/XIN+AgAA
Subject: [morty][PATCH] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Tue, 18 Apr 2017 19:57:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to github.com.
Update the ${PN} to ${BPN} in order to pass the autobuilder
mulitlib enable configuration.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/reci=
pes-extended/logrotate/logrotate_3.9.1.bb
index 5f1a601..5bd3381 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Rotates, compresses, removes and mails system log files"
 SECTION =3D "console/utils"
-HOMEPAGE =3D "https://fedorahosted.org/logrotate/"
+HOMEPAGE =3D "https://github.com/logrotate/logrotate/issues"
 LICENSE =3D "GPLv2"
=20
 # TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to =
use it.
@@ -10,14 +10,23 @@ DEPENDS=3D"coreutils popt"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D18810669f13b87348459e611d31ab76=
0"
=20
-SRC_URI =3D "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${P=
V}.tar.gz \
+# When updating logrotate to latest upstream, SRC_URI should point to
+# a proper release tarball from https://github.com/logrotate/logrotate/rel=
eases
+# and we have to take the snapshot for now because there is no such
+# tarball available for 3.9.1.
+
+S =3D "${WORKDIR}/${BPN}-r3-9-1"
+
+UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
+
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
             "
=20
-SRC_URI[md5sum] =3D "4492b145b6d542e4a2f41e77fa199ab0"
-SRC_URI[sha256sum] =3D "022769e3288c80981559a8421703c88e8438b447235e36dd3c=
8e97cd94c52545"
+SRC_URI[md5sum] =3D "8572b7c2cf9ade09a8a8e10098500fb3"
+SRC_URI[sha256sum] =3D "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7=
527856a0ea3617"
=20
 PACKAGECONFIG ?=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
--=20
2.9.3

