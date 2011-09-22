Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1R6XFk-00006P-RN
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 02:35:01 +0200
Received: from mx3.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 7AFDB5F84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 17:29:28 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx3.leapfrog.com (Postfix) with ESMTP id 58B755E8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 17:29:28 -0700 (PDT)
Received: from NAEMCASHT02.na.leapfrog.com (10.12.2.36) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Wed, 21 Sep 2011 17:29:28 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Wed, 21 Sep 2011 17:29:27 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] alsa-lib: Don't use versioned symbols on uclibc
	builds as it causes strange hangs
Thread-Index: Acx4vq91Q7gh5/l5TMqCcPsDEa2RIQ==
Date: Thu, 22 Sep 2011 00:29:27 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F01254E@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: [PATCH 1/1] alsa-lib: Don't use versioned symbols on uclibc builds as it causes strange hangs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 00:35:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

alsa-lib: Don't use versioned symbols on uclibc builds as it causes strange=
 hangs. Taken from oe-classic.

Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.0.24.1.bb
index 6f32b57..b787c54 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -29,6 +29,8 @@ EXTRA_OECONF +=3D "${@get_alsa_fpu_setting(bb, d)} "
=20
 EXTRA_OECONF =3D "--with-cards=3Dpdaudiocf --with-oss=3Dyes --disable-pyth=
on"
=20
+EXTRA_OECONF_append_libc-uclibc =3D " --with-versioned=3Dno "
+
 PACKAGES =3D+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc als=
a-dev"
 FILES_${PN}-dbg +=3D "${libdir}/alsa-lib/*/.debu*"
 FILES_libasound =3D "${libdir}/libasound.so.*"
--=20
1.7.0.4



