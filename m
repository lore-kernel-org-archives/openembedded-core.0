Return-Path: <prvs=925255644=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id AFC136011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548802514; x=1580338514;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=b8m9gjT5rKtbcTr3oh2zjnxVNd/WeKIPzGX3h7rX3DM=;
	b=Xzi0mOcv0skc+ESQElF+nw5iO9wq8t3wqsj+bRjw5CkXyJB2br3YJoV1
	hTMy80A2t3w2M9/7gwzAT5oM4wXO6G754Qu8xMEEh8o3Sx9CWteOMIqdf
	wxB7Av7naE0+GoRqZkA9x0Sjq3xtXK7X7Gxz+SM2PYWbOQClg8vT8mFQU
	HyalN6gtf7KENJAWkJ8JApcz0ISJAC1SrNI5ryB/K7qVuJIqt94sdOrEi
	XHYUb66oMcAfU/xSP4EFFOIt6fod4TQqElsr+xduIcYsSqZKtMgds5t6y
	5klFvX6Vpre6DHcSSa9i7i+p319jrXBmZaENHrzaDMOUb1JrbRr6lP68V w==;
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="101834995"
Received: from mail-co1nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.50])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2019 06:55:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QMSCEEzrjFpoit0owxA4zwR/bv4rxejDTKI8TpnYnTc=;
	b=lSPvq8B0h7QSdHrUWH5/vcS0v9A3TLVmusUZ0h6Zhq1bhQ1vC9o8fajzY+03OaxD9GorYyDvgesMUb/IzTu1oA4n67cybXYJperg62raoYsM0coFo0j8bdxQ1v1hyUI9B+ooFMV8GhOJFK9ByAClcqi3y8g3J+9q2V996WlhjGM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0257.namprd04.prod.outlook.com (10.169.202.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.16; Tue, 29 Jan 2019 22:55:12 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%9]) with mapi id 15.20.1558.023;
	Tue, 29 Jan 2019 22:55:12 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] libgpg-error: Bump to version 1.35
Thread-Index: AQHUuCWw0/vn8QTxrEewevDmoujdNA==
Date: Tue, 29 Jan 2019 22:55:11 +0000
Message-ID: <20190129225502.5698-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: MWHPR12CA0057.namprd12.prod.outlook.com
	(2603:10b6:300:103::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0257;
	6:wvHfnsxt2M0UtpzUT3bCGMWSm+XXxtIxu2dWzN29YgEGH8gr9YB1Z2RtlAVlQ/SkaHsU21BEbY2mMNoOJ7QqN8P7H3rMfncfmgHxv89i1R7FVK7jh5FFgLZ1HfInBD33ore48Hgud2FfdAspKTA1rv1G/rW1npX56z/M5z8fNPaw7djkJQZm+hfyUKaCeE0pSjTEXcJOVNtMWT080F+W0V/TlAb+dVc77P8n/GkCVAUpkS23kI7Ci++4KUzcA8FdffYmp1/lzEyzGGGcDbp+pQaJ7D5j+ESj1gLsLtQwFu9QFuIHkp5hIQR3vi/vum8bFFCL9uQZ+Phm92c7ignMePZDUi8RsOvTQeHRZLhuBJULdoE+npIGgmHkIttZAlX/y91IzqOC+RpkIM8btkOSLD5MzcqNJMEkeVtB3Mn0Q+mQSsYcVdu40R9RbbcTgo2KxZZotjzbFqiXIOUln8+smA==;
	5:DvlomawJymPsKt2Z9j36qcrkU3qCO6otEdRqblUA6X+A98XdR+jEXFU3YTuw4PRDAyp+14B8ca0pKSww+EO/kK9dJD9hoq5pnJnFG6OKU9JJm9/PpE9eGGJyR3DpAknmYRZbO7nEXOerjEZDna8TwgOZso0XNGcXXJiOhyp5n2J6oZoe1Lk9dezrHXdxiCgONjXMh4q3IkLnwIEb+jk0yw==;
	7:Ekc7IV48TYdD71ly8syBY9/fezBTm7t07EIVMSemuOVR5DK2lpEYEP5LZW9X8GIgbSRVMgFXvHXw7FOEYn6knraK4tSdk1vlZP8Yt1d3r3QcTK6SGQiSV3IplnOiAW8GOp2g5hyKmdLUKVS4Oofb4w==
x-ms-office365-filtering-correlation-id: 74fc114e-b97a-40d3-b795-08d6863cd2ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0257; 
x-ms-traffictypediagnostic: MWHPR04MB0257:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0257E01D0DB0B50B1AEA8C7F90970@MWHPR04MB0257.namprd04.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(24433001)(6306002)(6436002)(478600001)(6916009)(6512007)(2501003)(5640700003)(386003)(72206003)(305945005)(7736002)(476003)(14454004)(2616005)(486006)(97736004)(6116002)(99286004)(71200400001)(8676002)(68736007)(2351001)(26005)(6506007)(81156014)(71190400001)(106356001)(50226002)(4326008)(8936002)(25786009)(2906002)(66066001)(105586002)(39060400002)(81166006)(52116002)(102836004)(6486002)(53936002)(3846002)(36756003)(86362001)(44832011)(54906003)(1076003)(186003)(256004)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0257;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZRWvuUkP7Gpl6qndG2Kp1xao9Z2wQSap0vYKGw0OCpIg1H5PkD5RKwVDIcYKc9/I6IB/N1GYMcA9jwK9PR2313jCV6A9Ej7i6koHEvltoeQG6Y5XLhmL5AbTFMKgCj6Yy4nLOnovQBW6XH2cQ+P/bhqZF7S8IpZCRu+KsSOv/w1D9hZdpmgb94O7A7gmfww1/7v6q7wRwUGSZKMF16foXqQ8GxDHvq2ZKWkHWbs0e5dxAcRqwdd62pQHK/6NwYR8bBEMAdgppjlq/xH4AsGpvye2VYwmxNjUlVrqfuYyGiX5oJ6lJvnKbM08k72KfKCGMX3Q2J34zzL+p6ahrCtXXifOLd+G9tyi399OJKbPHypUK1S67wNc4+hkYLbhgqfP7A70f9FiSD0RXedK9mp42Bhp3s0pUm4Jb/UX7k3Zrrw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fc114e-b97a-40d3-b795-08d6863cd2ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 22:55:11.3011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0257
Subject: [PATCH] libgpg-error: Bump to version 1.35
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
X-List-Received-Date: Tue, 29 Jan 2019 22:55:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../{libgpg-error_1.33.bb =3D> libgpg-error_1.35.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.33.bb =3D> libgpg=
-error_1.35.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb b/meta/=
recipes-support/libgpg-error/libgpg-error_1.35.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
index 325529d149..9a822add32 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
@@ -5,7 +5,7 @@ BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
 LICENSE =3D "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2 \
                     file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \
-                    file://src/gpg-error.h.in;beginline=3D2;endline=3D18;m=
d5=3D524d4e810c4dcdc38e4fa28e70a13bf8 \
+                    file://src/gpg-error.h.in;beginline=3D2;endline=3D18;m=
d5=3Dcd91e3ad1265a0c268efad541a39345e \
                     file://src/init.c;beginline=3D2;endline=3D17;md5=3Df01=
cdfcf747af5380590cfd9bbfeaaf7"
=20
=20
@@ -16,8 +16,8 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${=
PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
=20
-SRC_URI[md5sum] =3D "680495572d5d4c700ea73a2f793ce531"
-SRC_URI[sha256sum] =3D "5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a=
56813612bf03ff"
+SRC_URI[md5sum] =3D "2808a9e044f883f7554c5ba6a380b711"
+SRC_URI[sha256sum] =3D "cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb79=
1f9f997d07e067"
=20
 BINCONFIG =3D "${bindir}/gpg-error-config"
=20
--=20
2.20.1


