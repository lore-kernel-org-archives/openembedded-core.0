Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.1656.1589332456715586670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 18:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: YL3aIOJONpRpSwz048FjIOkH0enjnWtmxsJIJk9De073tUXuGk72xrvOoMZyFzROxCsfMtAZs3
 xJQlAXIw93pg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 18:14:16 -0700
IronPort-SDR: XbXSMEy5t4NUnXEetFOshxvI7IU8Y0W7HgHyXUzOkQ9CDwjauZvveuB60Zl/3dykqoMYSxjZWz
 lbsB3Xb0jlBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,385,1583222400"; 
   d="scan'208";a="463955228"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
  by fmsmga006.fm.intel.com with ESMTP; 12 May 2020 18:14:15 -0700
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.12]) by
 KMSMSX154.gar.corp.intel.com ([169.254.12.226]) with mapi id 14.03.0439.000;
 Wed, 13 May 2020 09:14:14 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
Thread-Topic: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
Thread-Index: AQHWJSdm87v6OsnbU0acsnIJfZJzkqilPStg
Date: Wed, 13 May 2020 01:14:13 +0000
Message-ID: <C996A1173CD66043A3AEC0C7B2C3906904DB50FE@PGSMSX102.gar.corp.intel.com>
References: <160D08561718B7AF.8752@lists.openembedded.org>
In-Reply-To: <160D08561718B7AF.8752@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping


-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Naveen Saini
Sent: Friday, May 8, 2020 7:03 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1

For release details:
https://github.com/intel/libva/releases/tag/2.7.1
https://github.com/intel/libva/releases/tag/2.7.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva-initial_2.6.1.bb =3D> libva-initial_2.7.1.bb}   | 3 +--
 meta/recipes-graphics/libva/{libva_2.6.1.bb =3D> libva_2.7.1.bb} | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)  rename meta/recipes-grap=
hics/libva/{libva-initial_2.6.1.bb =3D> libva-initial_2.7.1.bb} (50%)  rena=
me meta/recipes-graphics/libva/{libva_2.6.1.bb =3D> libva_2.7.1.bb} (84%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/reci=
pes-graphics/libva/libva-initial_2.7.1.bb
similarity index 50%
rename from meta/recipes-graphics/libva/libva-initial_2.6.1.bb
rename to meta/recipes-graphics/libva/libva-initial_2.7.1.bb
index 2c845238da..3e2b806c6d 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.7.1.bb
@@ -1,8 +1,7 @@
 require libva.inc
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef03537800=
f"
-SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
-SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62=
e48629401eaea5"
+SRC_URI[sha256sum] =3D "a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27=
c230efd5d98a04"
=20
 do_install_append () {
 	rm -f ${D}${libdir}/*.so*
diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-grap=
hics/libva/libva_2.7.1.bb
similarity index 84%
rename from meta/recipes-graphics/libva/libva_2.6.1.bb
rename to meta/recipes-graphics/libva/libva_2.7.1.bb
index e8cb8678bc..b2deb017ac 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.7.1.bb
@@ -1,8 +1,7 @@
 require libva.inc
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef03537800=
f"
-SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
-SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62=
e48629401eaea5"
+SRC_URI[sha256sum] =3D "a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27=
c230efd5d98a04"
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
--
2.17.1

