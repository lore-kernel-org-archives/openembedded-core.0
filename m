Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400101.outbound.protection.outlook.com [40.107.140.101])
	by mail.openembedded.org (Postfix) with ESMTP id 10E2D7E6EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 04:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oHg7CxjWTGNuCba7a+s2+sp5BwDfCC/WYe2MIFh+MIfmZ2M3kjnybmuZKdgTBT6nWI7qczL+h+kCzeH+3Jru5Mej27Pdwi1WuGAF+FXr4cwWJH+ZSoPeHqcU0K3K6KdU8jlvZMk+ejylGDzwAJLZWxltlgM8PG41mHo2pekBxPQD+bRJmi4b1npFlU3tQI02kkd/D6DV3lJ0A5CqIHGapyYMVvjFidR2wtUBaeqJbDPA2C0FEPA+pib0eECVweB7KBlZb+ELMyjRIS/bxHB6octhy6VL02ErpDum3lSel7FPG0wx1f7/Ty4c5Uc9gQldkCPxLUxLgVJgc58mLeuFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dYe77rtFbajcqhj5xAGfyI8hu5nDw7+2zVEDtc0Lg+0=;
	b=YECapEuflCq7ukyxrYj6FlLdufiJGGFEfc1lynyqYoF/T2eEVy2DIMv5JnwTXt1ef0QeLvSb8wpvekN6jef5P1qEenSPguHnFD2JbBcv3BMCTsZjurZ6uRQ1ckiQx/siqVKMf2pEX3H2NxnmGRUx5nJtyRlr4A6ZuwbQIRz4+n5KmYA1NNHQt5J+ObxCXEG2H7S5IcxngwfzxHe5EjZiu97SO48IJhaRJKIdCHUFsevY8d52N4bJy+uAZiZeFrjP/MojfPbmEizl5M1zCkxYVHjLNUNTaoLFczJ2W00BD0ol32RGBa6dM0BcvNTK7eFNSnsfeOG+PChw80d3a+0jDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector2-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dYe77rtFbajcqhj5xAGfyI8hu5nDw7+2zVEDtc0Lg+0=;
	b=L118FNi54/lmicVjZoO+9i5HXpvy7Vk5KT6d4HdHo3IktF22Cut5bUEsZd8d2sdDn65KitG+65KDjYrivGKdgb9wxBMGveybsCsjDGf/zg9eloYAP5xoTk/MXbYl+hzUmviBUL/RddVnod2A0sE8XBqCqpkIvrdMJtjR5K5SXNs=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB3837.jpnprd01.prod.outlook.com (20.178.138.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.19; Wed, 28 Aug 2019 04:35:58 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb%7]) with mapi id 15.20.2199.021;
	Wed, 28 Aug 2019 04:35:58 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] runqemu: Change to use -device virtio-gpu-pci instead of
	-vga virtio
Thread-Index: AQHVXVoWmuBzOh7eKkaLDyGL/I4T8g==
Date: Wed, 28 Aug 2019 04:35:58 +0000
Message-ID: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR06CA0035.apcprd06.prod.outlook.com
	(2603:1096:404:2e::23) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
x-mailer: git-send-email 2.23.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a44652b0-ea2a-48dd-80f3-08d72b7138db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:TYAPR01MB3837; 
x-ms-traffictypediagnostic: TYAPR01MB3837:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3837CFAB8AF2862811B09861D6A30@TYAPR01MB3837.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(2616005)(486006)(476003)(7736002)(1076003)(2351001)(305945005)(46636005)(8936002)(81166006)(316002)(52116002)(81156014)(5660300002)(186003)(8676002)(256004)(50226002)(2906002)(71200400001)(71190400001)(66066001)(36756003)(102836004)(26005)(386003)(6506007)(6486002)(3846002)(66476007)(66446008)(64756008)(66946007)(25786009)(6916009)(86362001)(6436002)(66556008)(2501003)(107886003)(14454004)(478600001)(4326008)(5640700003)(53936002)(6512007)(6116002)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB3837;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jjZQmWG3BwsquAu36H7sDkEKZovFcDuQFyJ3PN6d5AeDZE+Gin6WoNoC/R5X+/VLoL5+JH/V7SL+/GtORVeIoGhv/H55D4EIxMh9zOUR4xnlPlXQqFfGJ+tFhcDqsRjnv8J5AEZTCMdTXZ8g+gG1CA+H6JYdGHONTr4ZE+VDtgR1mNNhnC+nmS3e+5WyJ8to6pl+tvlzApgdLldLuAKnVcpT+XVSQNE4abioEL6cXYKwz1dkgA6VLI0xiz6oP1zT1/fE6/AA4V770c78K9F4AZeckr6cwyirujJEFFyeBraQMM0h3Fxvm4teSWxtFT723cL84R3NdXelUwwRR0ZxexSRtEHgROUk/SH96KkxFhlJEKLmmN5FhYNOBQm85P0xqnpVLTQZ0iWilgPfd+kNUiiIM/V2iBrpjGoBvfQ7Vlk=
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a44652b0-ea2a-48dd-80f3-08d72b7138db
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 04:35:58.2622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aY10qaTJ4Xk855G7LH+LzpZvrt0CavuO20fycr0cVNyb7nJfQwKyGz5VOS7gKFdoKcL2CB70KQXLRVaUbFc3m4txiGjT3E4Y9rvehLr5CxpflG2Lg5Itt0ZT1nxYP4ZF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3837
Subject: [PATCH] runqemu: Change to use -device virtio-gpu-pci instead of -vga virtio
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
X-List-Received-Date: Wed, 28 Aug 2019 04:36:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

If using qemu-system-aarch64 or qemu-system-arm with the options, an error
occured as follows:

  qemu-system-aarch64: Virtio VGA not available

this commit fixes the error to use -device virtio-gpu-pci instead of
-vga virtio.
---
 scripts/runqemu | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 19fd521cd9..28ecee97a7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -398,11 +398,11 @@ class BaseConfig(object):
             elif arg =3D=3D 'sdl':
                 self.qemu_opt_script +=3D ' -display sdl'
             elif arg =3D=3D 'gtk-gl':
-                self.qemu_opt_script +=3D ' -vga virtio -display gtk,gl=3D=
on'
+                self.qemu_opt_script +=3D ' -device virtio-gpu-pci,virgl=
=3Don -display gtk,gl=3Don'
             elif arg =3D=3D 'gtk-gl-es':
-                self.qemu_opt_script +=3D ' -vga virtio -display gtk,gl=3D=
es'
+                self.qemu_opt_script +=3D ' -device virtio-gpu-pci,virgl=
=3Don -display gtk,gl=3Des'
             elif arg =3D=3D 'egl-headless':
-                self.qemu_opt_script +=3D ' -vga virtio -display egl-headl=
ess'
+                self.qemu_opt_script +=3D ' -device virtio-gpu-pci,virgl=
=3Don -display egl-headless'
                 # As runqemu can be run within bitbake (when using testima=
ge, for example),
                 # we need to ensure that we run host pkg-config, and that =
it does not
                 # get mis-directed to native build paths set by bitbake.
--=20
2.23.0


