Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410131.outbound.protection.outlook.com [40.107.141.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1419E7D3B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Bi7qE4nKXDbeGhcG4jTnORAZlYj2BGc8eihSsbTYXE4n3ODpxaZYaWp1EscVwtkjsZyFMG4eIfVf+u2kZ+3D7NRcyFqfckC2uVDNDDt0QUTIjBR7gv3Uh9TVc44qzW0as5wY19Saw9EwiqmC3Ho7ZzlgLQlz81wXsS01RbEtEgoGyWjfIyvH3iqyQBsI7ebFf4Hi2mGMDpk4VU0q9+GoT9tZSaQoL/FV9b2nsxfL4s5RXSUKpbZ8Lh5khqVuJm9smA1sia8TPbxHv++oMjdTPY9Hi+/t/Yut92i1Ua9174aFIPNM79N+IUfKWgURDwevHBe7SkE7vQvP4vzz7tIwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dL/IOSZs7w5V4SZ4YdB1z+MVxLtNC9g9zzZ6uO5Jepo=;
	b=DVf/1WS7/WsGsp/BAZPoUkbprjugAKF6iXhOk2aiYxiX+5mzET778UhLcsm0QGe4CqzdNsWseLj/+YrvorubF8lEWjYSBCB2+OqbpEijYkCFjYjXym2/GIvbi5ItZ7IDmEGhlcKjaH9BX1oOWNuIDdl4F1+WVKsBnXvcvS//HYUGDIZUKd3o4C36R1WPpmadWmBOqSBICPbUmC9PjREymCOL2XhQgmh/73jpiYdJVOoKeiqIkluWj6R1aDSLD5HqSqZ2d4/QorIEuEf5QFtW9d4EQyGNZ1x4SMNlg4/UJDTqCmdh4+35s1rW9rdkzEpDV/tUJ4oaHdbQPSLdvvU/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector2-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dL/IOSZs7w5V4SZ4YdB1z+MVxLtNC9g9zzZ6uO5Jepo=;
	b=i6HIIEcQSmn0JzYAvsbNCUTxPjXmt9H2+4cOTvaHu+GIR7LgsfrPWMtakEIqEYy4BsOe5k/nGiZJIr+9NFoF326vrS3EFwyr7SkBITiMWSpkg334NwMfoaMPd76jR7lrFEO966oHNEF9ijHrVLVr15wsOYxauOU4NMlkSYsSjmk=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB2704.jpnprd01.prod.outlook.com (20.177.103.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.19; Wed, 28 Aug 2019 05:45:46 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb%7]) with mapi id 15.20.2199.021;
	Wed, 28 Aug 2019 05:45:46 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/2] runqemu: Change to use -device virtio-gpu-pci
	instead of -vga virtio
Thread-Index: AQHVXWPWjNHOdkTmj0+83Qen0fZtFA==
Date: Wed, 28 Aug 2019 05:45:46 +0000
Message-ID: <20190828054629.6735-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0180.jpnprd01.prod.outlook.com
	(2603:1096:404:ba::24) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
x-mailer: git-send-email 2.23.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a23d036-2f27-4307-8a7c-08d72b7af96b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:TYAPR01MB2704; 
x-ms-traffictypediagnostic: TYAPR01MB2704:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2704F3589C2E9C1A6B6C9EC7D6A30@TYAPR01MB2704.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(102836004)(305945005)(7736002)(316002)(186003)(71190400001)(71200400001)(5660300002)(2351001)(52116002)(8936002)(8676002)(256004)(99286004)(36756003)(26005)(2906002)(81156014)(81166006)(1076003)(6506007)(3846002)(6116002)(5640700003)(6436002)(86362001)(386003)(6486002)(2501003)(6512007)(478600001)(107886003)(53936002)(25786009)(6916009)(50226002)(476003)(46636005)(4326008)(64756008)(66446008)(66556008)(2616005)(66066001)(14454004)(486006)(66476007)(66946007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB2704;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6+CUg86NpmpWaWHMwbiszPbaBF79uT2O6SLtKbeE79jL8W51CorxGFpinLjhwUAtKf9uOCzeTWQtZ7lZUK63hzIsHShPiGboPoaiLJk6XoEi0KqWYcp0CTfXcmTgPgPvdDhHiuotDzzjEEbRvLBc6vWdUn5NaubKuR5IRF05mGpY8FGNJtHyb6daYbJpPe5Xf3S4qrvSWfindVGCR7ADM9KOjW0V1l3gXNOKTutWfN8ZfVFf98yF2cmt4iWJV5r1KT3odejsJ4vyoliIVYkKVKbA2s1DtcCdVNvefJsnD8viAANL8XolYHqrCm7h7AcGg03F0KA4fdZvNAHP2HJwqm9McMU38unARIJu/yvPdKQ5DJTAH1wTGERPuMcWaHv1vgMRjw6mR/elKZgXA9yYa4calS0dR+B1pxbGw+iux7c=
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a23d036-2f27-4307-8a7c-08d72b7af96b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 05:45:46.7932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9k/kY0D7hG7MjcosOIUy5OoXvHkKUrNggSRb6p0eH9FwBR8ytHNFKYas2fKBqcwrhnojAKMLA1tX+ete5Anwtkd1Im+Rm6MViOv6fyNt9S1afvY9oaCNU4K1UXS9BOA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2704
Subject: [PATCH v2 1/2] runqemu: Change to use -device virtio-gpu-pci instead of -vga virtio
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
X-List-Received-Date: Wed, 28 Aug 2019 05:45:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

If using qemu-system-aarch64 or qemu-system-arm with the options, an error
occured as follows:

  qemu-system-aarch64: Virtio VGA not available

this commit fixes the error by using -device virtio-gpu-pci instead of
-vga virtio.

Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
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


