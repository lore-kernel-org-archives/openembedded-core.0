Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 730A76017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:24:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2015 05:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="759790359"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2015 05:24:25 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.245]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.200]) with mapi id
	14.03.0224.002; Fri, 10 Jul 2015 13:24:24 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V2] libical: upgrade to 1.0.1
Thread-Index: AQHQuwjt6kJloJFvREiFKvW6wnJLFp3UoIFw
Date: Fri, 10 Jul 2015 12:24:24 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44B13070@irsmsx105.ger.corp.intel.com>
References: <1436530026-31823-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1436530026-31823-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH V2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Fri, 10 Jul 2015 12:24:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For now, please ignore this one, it seems I haven't tested properly, sorry.
/Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Friday, July 10, 2015 3:07 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V2] libical: upgrade to 1.0.1

Bugfix release mainly.
autotools build system removed, cmake is now used.
perl is needed during the configure phase.
Switched to releases download link.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libical/{libical_1.0.0.bb =3D> libical_1.0.1.bb}            | 11 +++++=
++----
 1 file changed, 7 insertions(+), 4 deletions(-)  rename meta/recipes-suppo=
rt/libical/{libical_1.0.0.bb =3D> libical_1.0.1.bb} (55%)

diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-s=
upport/libical/libical_1.0.1.bb
similarity index 55%
rename from meta/recipes-support/libical/libical_1.0.0.bb
rename to meta/recipes-support/libical/libical_1.0.1.bb
index be6b635..eb93b4f 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.1.bb
@@ -6,8 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4fc58309d8ed46=
587ac63bb449d82f8 \
                     file://LICENSE;md5=3Dd1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION =3D "libs"
=20
-SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] =3D "f4b8e33ae5efb2f025eb43ce69682a36"
-SRC_URI[sha256sum] =3D "0072e83834092315772e6719b85fc8b11530b1ff53f4d10831=
5fb38cddbce8c2"
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${B=
P}.tar.gz"
+SRC_URI[md5sum] =3D "af91db06b22559f863869c5a382ad08a"
+SRC_URI[sha256sum] =3D "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb142=
49d1413d6c610c"
+
+inherit cmake perlnative
+
+FILES_${PN}-dev +=3D "${libdir}/cmake"
=20
-inherit autotools
--
2.1.4


