Return-Path: <samuli.piippo@qt.io>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80103.outbound.protection.outlook.com [40.107.8.103])
	by mail.openembedded.org (Postfix) with ESMTP id 62E077F874
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=H/sIFco1QIs88T1Vjxb0uFubiOUCK0QP4oy7suVprbtxaIv5lTBNANGob5fJwVXWPm5OWraIESIZjpDH0xUfp4xuLI+TPKlj4hpNrbHYjqe4qZcCrgoELLQCoxOm4Fwi1bGYHL/hVVRevynk6ljQAXfaNNsJAYfzDR0DksMl4OtjeEgj7UVeXTLguS2oUN8Oms9Scqjy4KkKYy0oMW8sLWyfWxkR56zU3401dcGZEqn6Fix7RCP7VruxatW8cFEdYJHlODeK7CvcCMhAAB6uIhY4tRq3V4+fXWSDSAhateB2S17q4MDSMaI7UKd1++TAdrPK+d9mOSmchHH0pJLZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S/SOt9tXyUWOO1kzkfNzNSfBvbbxunAhcHdrtO8jhcE=;
	b=oRNl8hP0wRDwxdmyY17NunpITOmnkpy8xv/JZNpGrZAYpPJMyED/lhv13BWgGX6WKaQaYTGSVvcqYpgPF5+SviKu0LqH4ZQgr2D2uWYkA3Bz4ZbMd3SqNlghriql0U6K9uoJApw2YywvCK2lLMgc/hmxEFEZVCzKYou4OEJe37vrRt7zA8ai/k0c+CwqeQTSohKcYSXWytXt1svQh3WKgvD3nSF+tult2/lswtTyQcNeRI2RjPmveWpd3slszfVfO9i2Yar8w0XamYzmaU8OxdN2Vko3VJHvq4m7KZ2cDkaRIVBy+uzkZCvtwzoumFJ0kLLoROk9h++11rLmuMWoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
	header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S/SOt9tXyUWOO1kzkfNzNSfBvbbxunAhcHdrtO8jhcE=;
	b=p/H9nS7B9iwUboqHanY4QQEE5MZJoa8uwAhS5t8LyrekhU+vNleqMGtyYrgiYa5A8HaC4wSYzaWEuPJhlDFxbOKBLUrUhC12CN3TFoysP0D8ANYRZRNPu+jV5fEBXmX9qjBxe/lgs9U4gHbAs6IUp38DCZzXqJKFX5/YvbeWWJ4=
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com (10.168.149.145) by
	HE1PR0201MB2124.eurprd02.prod.outlook.com (10.168.33.154) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 09:39:27 +0000
Received: from HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::c40c:767b:1615:5cff]) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com
	([fe80::c40c:767b:1615:5cff%5]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 09:39:27 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] linux-firmware: update packaging for brcm files
Thread-Index: AQHVlIYUA9VNhiocW0SOJ0tZyVbnig==
Date: Wed, 6 Nov 2019 09:39:26 +0000
Message-ID: <20191106093831.8076-1-samuli.piippo@qt.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.89.120.62]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HE1PR05CA0305.eurprd05.prod.outlook.com
	(2603:10a6:7:93::36) To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:87::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fad62465-26e1-4531-04cb-08d7629d36a4
x-ms-traffictypediagnostic: HE1PR0201MB2124:
x-microsoft-antispam-prvs: <HE1PR0201MB2124880046C362303F7EF0EEE9790@HE1PR0201MB2124.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:215;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(136003)(39850400004)(346002)(366004)(189003)(199004)(8676002)(26005)(5660300002)(36756003)(66066001)(66946007)(66556008)(64756008)(66446008)(66476007)(1076003)(476003)(4326008)(2616005)(186003)(6512007)(386003)(44832011)(6506007)(2906002)(99286004)(52116002)(2351001)(3846002)(478600001)(14454004)(316002)(256004)(81166006)(86362001)(5640700003)(81156014)(7736002)(6436002)(102836004)(8936002)(486006)(71200400001)(2501003)(6486002)(50226002)(6916009)(71190400001)(6116002)(25786009)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2124;
	H:HE1PR0201MB2265.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAcQgL1PfMqxZ7EfDCDYjbZnBlHihSArBbCTNhLJdIOfa+Xxl9BE+9ZhZbIsgq9anTaX8pRb/V3i6NEpy4ALm/h9fa73AIal9orDlCy1LWOSK5DAjawI6STPqc2deVdSHGVvkJ1Y+EQhLIGLR4pdttgNjWonzw2eY5WbjjJP1+Ob/D9CaR3jIPYPWY/RLZd6FxxSU2lG+/QHticE9WbJ+gNUO7MXBD9o1RPN8YHb/V+yg6+p9+UXo5uzTpPCiaDy8IMKNHg3jC/k4O8myewMX1V8G3bYCtUXQKS+TeU/foeH52W9qPibcEwBJfy2AMd3KC5twngoRqgC/DmH7cjuBVhxYLHpyc9Wu/BNGB9BgKz/ROVYsiil7Bro/VRpQQvHy56ab2M+ZesST/svkqAUjPQ8xdGF6VcjgR0w9LBDEP/7xo3YnzXZwMk/xpdN4Dzo
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: fad62465-26e1-4531-04cb-08d7629d36a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:39:27.1186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZMW2alCzlg/bUwHgGW1LllI/vt2gIwaAzqCGaC6MzHynabrVwp2xDfWvvV/Y9zWey/XpV99domfHN9I3sjTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2124
Cc: "otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Subject: [PATCH] linux-firmware: update packaging for brcm files
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
X-List-Received-Date: Wed, 06 Nov 2019 09:39:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Add new package for bcm4366c and include available NVRAM config files
into the corrent bcm* packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../linux-firmware/linux-firmware_20190815.bb  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 518638806f..d83000b64f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -273,6 +273,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4358 \
              ${PN}-bcm43602 \
              ${PN}-bcm4366b \
+             ${PN}-bcm4366c \
              ${PN}-bcm4371 \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
@@ -571,7 +572,7 @@ FILES_${PN}-bcm43xx-hdr =3D "${nonarch_base_libdir}/fir=
mware/brcm/bcm43xx_hdr-0.fw
 FILES_${PN}-bcm4329-fullmac =3D "${nonarch_base_libdir}/firmware/brcm/bcm4=
329-fullmac-4.bin"
 FILES_${PN}-bcm43236b =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
236b.bin"
 FILES_${PN}-bcm4329 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329=
-sdio.bin"
-FILES_${PN}-bcm4330 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330=
-sdio.bin"
+FILES_${PN}-bcm4330 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330=
-sdio.*"
 FILES_${PN}-bcm4334 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334=
-sdio.bin"
 FILES_${PN}-bcm4335 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335=
-sdio.bin"
 FILES_${PN}-bcm4339 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339=
-sdio.bin"
@@ -582,8 +583,8 @@ FILES_${PN}-bcm43242a =3D "${nonarch_base_libdir}/firmw=
are/brcm/brcmfmac43242a.bin
 FILES_${PN}-bcm43143 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac431=
43.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
 "
-FILES_${PN}-bcm43430a0 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3430a0-sdio.bin"
-FILES_${PN}-bcm43455 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac434=
55-sdio.bin"
+FILES_${PN}-bcm43430a0 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3430a0-sdio.*"
+FILES_${PN}-bcm43455 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac434=
55-sdio.*"
 FILES_${PN}-bcm4350c2 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
50c2-pcie.bin"
 FILES_${PN}-bcm4350 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350=
-pcie.bin"
 FILES_${PN}-bcm4356 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356=
-sdio.bin"
@@ -594,6 +595,7 @@ FILES_${PN}-bcm43602 =3D "${nonarch_base_libdir}/firmwa=
re/brcm/brcmfmac43602-pcie.
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
 "
 FILES_${PN}-bcm4366b =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac436=
6b-pcie.bin"
+FILES_${PN}-bcm4366c =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac436=
6c-pcie.bin"
 FILES_${PN}-bcm4371 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371=
-pcie.bin"
=20
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do p=
kg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-=
hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE_\${PN}-$pkg =3D \"Firmware=
-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg +=3D \"\${PN}-broadcom-license\""=
; done
@@ -647,6 +649,8 @@ LICENSE_${PN}-bcm43602 =3D "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm43602 +=3D "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4366b =3D "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4366b +=3D "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4366c =3D "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4366c +=3D "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4371 =3D "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4371 +=3D "${PN}-broadcom-license"
=20
@@ -656,11 +660,11 @@ LICENSE_${PN}-cypress-license =3D "Firmware-cypress"
 FILES_${PN}-cypress-license =3D "${nonarch_base_libdir}/firmware/LICENCE.c=
ypress"
=20
 FILES_${PN}-bcm-0bb4-0306 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-0b=
b4-0306.hcd"
-FILES_${PN}-bcm43340 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac433=
40-sdio.bin"
-FILES_${PN}-bcm43362 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac433=
62-sdio.bin"
-FILES_${PN}-bcm43430 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac434=
30-sdio.bin"
+FILES_${PN}-bcm43340 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac433=
40-sdio.*"
+FILES_${PN}-bcm43362 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac433=
62-sdio.*"
+FILES_${PN}-bcm43430 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac434=
30-sdio.*"
 FILES_${PN}-bcm4354 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354=
-sdio.bin"
-FILES_${PN}-bcm4356-pcie =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c4356-pcie.bin"
+FILES_${PN}-bcm4356-pcie =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c4356-pcie.*"
 FILES_${PN}-bcm4373 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373=
-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
 "
--=20
2.17.1


