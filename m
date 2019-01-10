Return-Path: <prvs=906996e92=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id B95F77C092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547149892; x=1578685892;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=n3h4iTWKHE9Si/MQfL1DhrH4jIe88W63UgKYgRHpWXQ=;
	b=CjPnfm9JnJQm070ujYjCQtTrJTPKqc4TH0f9GJvZWizvIoMmT6g3oxHI
	0HECRwutPEEWuj7IrGDFkHyZ0EF9zuCWSF0QR4j3uOclSFZ1xvWhZVS3k
	ugAaXhURiG+KzDkFRBiQ2NAAB/n1qV7mKaKdy0RcSQsdoTxc+gLuy3XgC
	UpPIejH4v5fl73WT7Rswj9hlZ1v9nsZNSYtfB8aBtAGA2PP53+Cgw++B6
	MujkAsExApedhip7JnuYaf6VfGrfPMml73WzuyV8J+G0sB9icFa9418y4
	enTKzJYfP1t3HsocVdNB93D16yxOq9oe2vaVn0UeFJIF6RN4Jy/8A84zL g==;
X-IronPort-AV: E=Sophos;i="5.56,462,1539619200"; d="scan'208";a="100266232"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
	by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2019 03:51:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=n3h4iTWKHE9Si/MQfL1DhrH4jIe88W63UgKYgRHpWXQ=;
	b=nPKFFpg/HnT2gazEjD7PJ8v6l/mle2EKuOLfhyWCVDLkNnlyUEcgE2/0qjbjoqnxEuY5i2u/PbS5V7poAKJPGyaH59HenXWCLIzzRHIBbfVUj3eF3+99isaH1IRx5lQhwGePTD/0lI/Idgw5wzCahdpNDYZjREDMMtgGWZaIq44=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0718.namprd04.prod.outlook.com (10.172.167.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.15; Thu, 10 Jan 2019 19:51:30 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016;
	Thu, 10 Jan 2019 19:51:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
Thread-Index: AQHUqR3hl9Iyq1M7hEeszQv64ERr2Q==
Date: Thu, 10 Jan 2019 19:51:30 +0000
Message-ID: <20190110195121.13070-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0003.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::16) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0718;
	6:Fh40IM6/PMwf3Z1gzwCUOczflYwpZ4RO4cA5AtHewXluY6iZlO3fDJZ1o+aIVlYXVzXNYvCT3x242Af959i4qe+jdaJaG9LyfhT9/ha/EN3dWmC4eagFzjyZV9q32LgpBCEp0qAEFdPEqr+nRGaJ8zlaFbkFI2q7eISbAE6enkrmTma7trzvb7DVvoX/QTgnMzfCVSCAfW/LCua4iKf+Y8vtlcPcztGPGQzi80FXg/Bxxz0thnGqSKnVFnLYNjKJ064dB/UyMAmuoRsQUOCE4NAuzf98FA+TVyqaPE4nSvK4mVtvfPIWknPWJh/n/lPvfJgHOX4Mg0jHaT6Iet46W1vr69XMBHvD3UchwmxcGzeUWOREwmdTsudB6n4q+OPvlYzxZVh8UrRi3JG9Ih2YEp2u3kC//vHiusWrf6vPsj1zJIH0WS3ml/RmINgkivq4DiIP/pir0v+oe01eq9FyQw==;
	5:qMmCDLRurAIB2aBRr1az6h4f9JqF1vJ4ShRxwonarxC5lpgES42oYlDBVFkqavZNRhn61AwAVCgM+PDqiCLefExWi7HjVG6uGEHANIlxDZz0SOfFDONCHvTFZ5O1rNEBshJ/sxbSXAGLWK+Ur1zzst7pseiFrypztYAK9LKsqg62YKnCx4DVqnqFt453bGsbjPItFTypw7MGFy3II4ub/g==;
	7:xohrvpUHMttQnY7Fj7Kxuds3RLyuOwV+r1gWPtFB2sMcsTBYiBQ5LPrqF+HWqip/U2TbyEoingMleyZ8bnB+c30s/+PMVILEz7NhulEmWTecWX9IR5BnZmYA4JcsuFshMpAf7GST+etG26bazv6CHQ==
x-ms-office365-filtering-correlation-id: 21198f12-22f7-4e36-ccca-08d6773503b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0718; 
x-ms-traffictypediagnostic: MWHPR04MB0718:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0718B5EC9E740647AC14FC1090840@MWHPR04MB0718.namprd04.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(25786009)(4326008)(14444005)(256004)(44832011)(99286004)(105586002)(106356001)(2351001)(26005)(186003)(102836004)(386003)(2616005)(486006)(476003)(1076003)(66066001)(71200400001)(71190400001)(6506007)(478600001)(52116002)(14454004)(72206003)(5660300001)(36756003)(97736004)(6512007)(4744005)(6916009)(7736002)(50226002)(8936002)(8676002)(81156014)(81166006)(39060400002)(316002)(6486002)(3846002)(6116002)(54906003)(5640700003)(6436002)(305945005)(53936002)(68736007)(2501003)(86362001)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0718;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PvLzoKGjSlEhqebjIZ/K+gWPV6fZI6ad7J0lGkz5DljOP0w7eUdiUaXDyM5QU4bx9ViCTQHPROvwWb6vpdnpC7KKin6cP1ROGVfD2DSKe+kH3w2OmKv5hwFWCWIEGRbM1/R6Bx15uEIjBDRFSZLTJMjG7aMP2kJFa0CE3yH2RLf4NuoCcUSqTogPQhmZxFTJPoF7PTYQvpsFhqYDzG1l2pE/Hxnl42pdSrC5niDaraWE/f5X5BdYTnXRs+M5cYs6CKyh+Q5PaEN1EPxI2/dOD821bWv+M3NvgXlX6+huwnYXBGp1AYF6AKkTxSPYzWvdpUJC+YuCq3nyGJNMaL0M1BncrTLvdgfAxP3Kn5snvqLtSXzDkgSNT5Tj9GrhGrQ4ZNi4llf4LJBxwEnhfEcm/0Mxik+sILyQiTdNAUWfIvIpBdBCm8lJSrFw3vNohcCT+smKRsSsATWBgYVU7Xgs0w==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21198f12-22f7-4e36-ccca-08d6773503b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 19:51:30.1652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0718
Subject: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 19:51:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Most users are going to be using libinput with some sort of display, so
enable gui in the PACKAGECONFIG by default.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/wayland/libinput_1.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.12.3.bb b/meta/recipe=
s-graphics/wayland/libinput_1.12.3.bb
index 3d1ab59309..d3f34c5040 100644
--- a/meta/recipes-graphics/wayland/libinput_1.12.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "f266ff861a2e7a97e1402c4345e3547b9=
00efde68adbd40e56403e2617
 UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "gui"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue,-Dlibwacom=3Dfalse,libwacom=
"
 PACKAGECONFIG[gui] =3D "-Ddebug-gui=3Dtrue,-Ddebug-gui=3Dfalse,cairo gtk+3=
"
=20
--=20
2.19.1


