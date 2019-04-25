Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 16209 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Apr 2019 02:34:27 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254086.outbound.protection.outlook.com [40.92.254.86])
	by mail.openembedded.org (Postfix) with ESMTP id 726E37D44E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 02:34:27 +0000 (UTC)
Received: from HK2APC01HT157.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebc::275) by
	PU1APC01HT154.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebe::195) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.25;
	Fri, 26 Apr 2019 02:01:35 +0000
Received: from HK2APC01FT040.eop-APC01.prod.protection.outlook.com
	(10.152.248.56) by HK2APC01HT157.eop-APC01.prod.protection.outlook.com
	(10.152.249.19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.25;
	Thu, 25 Apr 2019 04:30:06 +0000
Received: from SL2P216MB0282.KORP216.PROD.OUTLOOK.COM (10.152.248.51) by
	HK2APC01FT040.mail.protection.outlook.com (10.152.249.42) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1792.25 via Frontend Transport; Thu, 25 Apr 2019 04:30:06 +0000
Received: from SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	([fe80::1942:8cfa:9ed:5f6b]) by SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	([fe80::1942:8cfa:9ed:5f6b%10]) with mapi id 15.20.1813.011;
	Thu, 25 Apr 2019 04:30:06 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] libsoup: Upgrade from 2.64.2 to 2.66.1
Thread-Index: AQHU+x+OKaJNs/82Y02AF/qYyEaaYA==
Date: Thu, 25 Apr 2019 04:30:05 +0000
Message-ID: <SL2P216MB0282859C16C8AA587EF91CB2DD3D0@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0051.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::28) To SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	(2603:1096:100:1f::8)
x-incomingtopheadermarker: OriginalChecksum:C4229AB89E6F44A7734E64E46D86F7C2B5E7B527009AF410F4EC36B680792C68;
	UpperCasedChecksum:BF6B6D88BDC2A279CC3F8720DA5D11ECA0729C7C57E05C98518ACEDBD9D89129;
	SizeAsReceived:7443; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-tmn: [ATAU92wpsoboSg2O6+z05IlcWwLD4UKiR/7l/pFnAWp8U6ZRwXgkDt24UTIQ28hK]
x-microsoft-original-message-id: <20190425042946.22855-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:HK2APC01HT157; 
X-MS-TrafficTypeDiagnostic: HK2APC01HT157:|HK2APC01HT157:|PU1APC01HT154:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: 3CxCCMvesDFeT+Bjs774r7tfHYvxZIANRPYKwomQ/gZviWcoZ/D6eGLC9vAIcp/Dg4EbMMTmGpt63fSgTrF49fO8jyneM2QYM2bHGLpXOczcPl+2VurUh/p1jIG2smKrygeuw8HNhr/+PLxE3CBwEDijY0aSoDpauBN1z6qwLfUxU6zyeUrPxJC5M1w2Mzgr
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9f25d7-a759-4aa0-8ed8-08d6c936b104
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 04:30:05.9771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT157
X-OriginatorOrg: outlook.com
Subject: [PATCH v2] libsoup: Upgrade from 2.64.2 to 2.66.1
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
X-List-Received-Date: Fri, 26 Apr 2019 02:34:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...no-introspection-when-cross-building.patch | 20 +++++++++++--------
 ...up-2.4_2.64.2.bb =3D> libsoup-2.4_2.66.1.bb} |  4 ++--
 2 files changed, 14 insertions(+), 10 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.64.2.bb =3D> libsoup-2.=
4_2.66.1.bb} (92%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-n=
o-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/li=
bsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
index 72b029a80b..cd6de853e5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-intro=
spection-when-cross-building.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-intro=
spection-when-cross-building.patch
@@ -1,24 +1,28 @@
-From 921888affe66953c92a08ae440e911b016b124be Mon Sep 17 00:00:00 2001
+From 85f7b74fc602214297928afe09347c31d696173d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 14:21:06 +0100
 Subject: [PATCH] Do not enforce no-introspection when cross-building
=20
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 5a92cda..cfb3520 100644
+index 25887f9..6261a7c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -262,7 +262,7 @@ enable_gnome =3D get_option('gnome') and host_machine.=
system() !=3D 'windows'
- #########################
- # GObject introspection #
- #########################
--enable_introspection =3D get_option('introspection') and find_program('g-=
ir-scanner', required: false).found() and not meson.is_cross_build()
-+enable_introspection =3D get_option('introspection') and find_program('g-=
ir-scanner', required: false).found()
+@@ -281,7 +281,7 @@ enable_gnome =3D get_option('gnome') and host_machine.=
system() !=3D 'windows'
+ # FIXME: once we start to require meson 0.49.0+ and gnome-introspection 1=
.58.1+
+ # the we can enable the introspection even for the static build. See
+ # https://github.com/mesonbuild/meson/pull/4478.
+-enable_introspection =3D get_option('introspection') and find_program('g-=
ir-scanner', required: false).found() and not meson.is_cross_build() and no=
t is_static_library
++enable_introspection =3D get_option('introspection') and find_program('g-=
ir-scanner', required: false).found() and not is_static_library
 =20
  ############
  # Vala API #
+--=20
+2.20.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/reci=
pes-support/libsoup/libsoup-2.4_2.66.1.bb
similarity index 92%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
index b095397ec2..99fb65844e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
@@ -12,8 +12,8 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVa=
r('PV').split('.')[1]}"
 SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building=
.patch \
            "
-SRC_URI[md5sum] =3D "cac755dc6c6acd6e0c70007f547548f5"
-SRC_URI[sha256sum] =3D "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774=
104457b3a786c6"
+SRC_URI[md5sum] =3D "5f04c09a06f6dbe4c4d3f003992145ce"
+SRC_URI[sha256sum] =3D "4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7b=
ee3c7e355c43ff"
=20
 S =3D "${WORKDIR}/libsoup-${PV}"
=20
--=20
2.21.0


