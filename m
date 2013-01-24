Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TyPmx-0006hQ-Vd
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 17:36:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2013 08:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,530,1355126400"; d="scan'208";a="276162085"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2013 08:20:55 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.60]) with mapi id
	14.01.0355.002; Thu, 24 Jan 2013 16:20:23 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] wpa-supplicant: upgrade to 2.0
Thread-Index: AQHN+kzkJha4wYMW/E+Q54hpnFmcw5hYqApA
Date: Thu, 24 Jan 2013 16:20:21 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161EF398@IRSMSX102.ger.corp.intel.com>
References: <1359043644-11456-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1359043644-11456-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] wpa-supplicant: upgrade to 2.0
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
X-List-Received-Date: Thu, 24 Jan 2013 16:36:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tested on real hardware: FRI2.
Basic tests performed: scan, connected to a WPA2 network, performed pings.
It builds correctly for all YP supported HW architectures.

Regards,
Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Thursday, January 24, 2013 6:07 PM
To: openembedded-core@lists.openembedded.org
Cc: Musca, ConstantinX; Iorga, Cristian
Subject: [PATCH] wpa-supplicant: upgrade to 2.0

From: Constantin Musca <constantinx.musca@intel.com>

- as of February 11, 2012, the project has chosen to use only the BSD licen=
se option for future distribution
- wpa-supplicant-1.0 dir was not version specific, as such it is generic no=
w

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{wpa-supplicant-1.0.inc =3D> wpa-supplicant-2.0.inc}         |    8 ++=
++----
 .../{wpa-supplicant-1.0 =3D> wpa-supplicant}/99_wpa_supplicant   |    0
 .../{wpa-supplicant-1.0 =3D> wpa-supplicant}/defconfig-gnutls    |    0
 .../{wpa-supplicant-1.0 =3D> wpa-supplicant}/wpa-supplicant.sh   |    0
 .../{wpa-supplicant-1.0 =3D> wpa-supplicant}/wpa_supplicant.conf |    0
 .../wpa_supplicant.conf-sane                                   |    0
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb |    6 ----=
--
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb |    6 ++++=
++
 8 files changed, 10 insertions(+), 10 deletions(-)  rename meta/recipes-co=
nnectivity/wpa-supplicant/{wpa-supplicant-1.0.inc =3D> wpa-supplicant-2.0.i=
nc} (92%)  rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-=
1.0 =3D> wpa-supplicant}/99_wpa_supplicant (100%)  rename meta/recipes-conn=
ectivity/wpa-supplicant/{wpa-supplicant-1.0 =3D> wpa-supplicant}/defconfig-=
gnutls (100%)  rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplic=
ant-1.0 =3D> wpa-supplicant}/wpa-supplicant.sh (100%)  rename meta/recipes-=
connectivity/wpa-supplicant/{wpa-supplicant-1.0 =3D> wpa-supplicant}/wpa_su=
pplicant.conf (100%)  rename meta/recipes-connectivity/wpa-supplicant/{wpa-=
supplicant-1.0 =3D> wpa-supplicant}/wpa_supplicant.conf-sane (100%)  delete=
 mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant=
_2.0.bb

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.in=
c b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
similarity index 92%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 0645193..89910a0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -2,10 +2,10 @@ DESCRIPTION =3D "A Client for Wi-Fi Protected Access (WPA=
)."
 HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
 SECTION =3D "network"
-LICENSE =3D "GPLv2 | BSD"
-LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc54ce9345727175ff66d17b67ff5=
1f58 \
-                    file://../README;md5=3D9bee93996fecdb70f807baceb29d84b=
9 \
-                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=
=3D372fb65dc23b228aec4e40e64de3e467"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d379=
1d0e \
+                    file://../README;md5=3D5cb758942d25f6f61fd4ac388fd446f=
a \
+                    file://wpa_supplicant.c;beginline=3D1;endline=3D12;md5=
=3Dcba4fa09fa364da845ca546f21008909"
 DEPENDS =3D "gnutls dbus libnl"
 RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
=20
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99=
_wpa_supplicant b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/9=
9_wpa_supplicant
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_=
wpa_supplicant
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_su=
pplicant
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/de=
fconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/de=
fconfig-gnutls
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/def=
config-gnutls
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig=
-gnutls
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wp=
a-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/w=
pa-supplicant.sh
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa=
-supplicant.sh
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-suppl=
icant.sh
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wp=
a_supplicant.conf b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant=
/wpa_supplicant.conf
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa=
_supplicant.conf
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_suppl=
icant.conf
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wp=
a_supplicant.conf-sane b/meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/wpa_supplicant.conf-sane
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa=
_supplicant.conf-sane
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_suppl=
icant.conf-sane
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb=
 b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
deleted file mode 100644
index 1150075..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require wpa-supplicant-1.0.inc
-
-PR =3D "r3"
-
-SRC_URI[md5sum] =3D "8650f6aa23646ef634402552d0669640"
-SRC_URI[sha256sum] =3D "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31=
feaf7c04482b9c"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb=
 b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
new file mode 100644
index 0000000..22e42dd
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
@@ -0,0 +1,6 @@
+require wpa-supplicant-2.0.inc
+
+PR =3D "r0"
+
+SRC_URI[md5sum] =3D "3be2ebfdcced52e00eda0afe2889839d"
+SRC_URI[sha256sum] =3D "2c115609fbb5223d51381084a5c944455a8afcda81d584173f=
f55ba233379e09"
--
1.7.10.4



