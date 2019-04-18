Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 94065 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Apr 2019 11:38:00 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254033.outbound.protection.outlook.com [40.92.254.33])
	by mail.openembedded.org (Postfix) with ESMTP id 172CE7D241
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 11:38:00 +0000 (UTC)
Received: from SG2APC01HT069.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebd::444) by
	HK2APC01HT065.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebc::402) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16;
	Thu, 18 Apr 2019 11:23:26 +0000
Received: from SG2APC01FT064.eop-APC01.prod.protection.outlook.com
	(10.152.250.60) by SG2APC01HT069.eop-APC01.prod.protection.outlook.com
	(10.152.251.188) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16;
	Thu, 18 Apr 2019 04:35:52 +0000
Received: from SL2P216MB0282.KORP216.PROD.OUTLOOK.COM (10.152.250.53) by
	SG2APC01FT064.mail.protection.outlook.com (10.152.251.229) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1771.16 via Frontend Transport; Thu, 18 Apr 2019 04:35:52 +0000
Received: from SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	([fe80::1942:8cfa:9ed:5f6b]) by SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	([fe80::1942:8cfa:9ed:5f6b%10]) with mapi id 15.20.1813.011;
	Thu, 18 Apr 2019 04:35:51 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] u-boot: Fix missing Python.h build failure
Thread-Index: AQHU9aA0bvDwghl6KUCcVBWrduFESw==
Date: Thu, 18 Apr 2019 04:35:51 +0000
Message-ID: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0003.namprd04.prod.outlook.com
	(2603:10b6:a03:40::16) To SL2P216MB0282.KORP216.PROD.OUTLOOK.COM
	(2603:1096:100:1f::8)
x-incomingtopheadermarker: OriginalChecksum:4702211B4E9EB0EEB3D4147EF28951723DD2604AB7715E75FF39B7040F2D22EB;
	UpperCasedChecksum:54C9F16CE898A5710F4E226044835FED9F13ED800E5FBC2682B9AED40123F493;
	SizeAsReceived:7455; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-tmn: [QAw3LDpG68ffkWe5Mhr6X1g7fX0A5tHDno1YcpjW4AjaHw72ocfILihaS+e/rY8U]
x-microsoft-original-message-id: <20190418043536.32249-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:SG2APC01HT069; 
X-MS-TrafficTypeDiagnostic: SG2APC01HT069:|SG2APC01HT069:|HK2APC01HT065:
x-microsoft-antispam-message-info: c5pdCgyCYAj0qFSYyCtXqOzNoM5G8qqXXzLjjLMbRSfH1KpWI2yQEfJmOYB/VpW8tG4tjGFHc1j/gDc0MOz2RKnWYbJQ5WjezUcg2D9kZ4vjYGqKW9ynsiQAmoj7+Ijo+DeVv/p/J9EnZwsO6y8fZi19zq85Hg0ASHxxrk/XZHlnG45j1IMITqaeq0aymA+c
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c40450-a1c5-442f-ab3f-08d6c3b7561e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2019 04:35:51.8041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT069
X-OriginatorOrg: outlook.com
Subject: [PATCH v2] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Thu, 18 Apr 2019 11:38:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 96c1f94011..9a754fd09b 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -13,7 +13,7 @@ DEPENDS +=3D "swig-native python-native"
=20
 EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX}g=
cc ${TOOLCHAIN_OPTIONS}" V=3D1'
 EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"=
'
-EXTRA_OEMAKE +=3D 'PYTHON=3Dnativepython STAGING_INCDIR=3D${STAGING_INCDIR=
_NATIVE} STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE}'
+EXTRA_OEMAKE +=3D 'PYTHON2=3Dnativepython STAGING_INCDIR=3D${STAGING_INCDI=
R_NATIVE} STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE}'
=20
 PACKAGECONFIG ??=3D "openssl"
 # u-boot will compile its own tools during the build, with specific
--=20
2.20.1


