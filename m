Return-Path: <laurent.bonnans@here.com>
X-Greylist: delayed 62359 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Jun 2019 01:28:14 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80122.outbound.protection.outlook.com [40.107.8.122])
	by mail.openembedded.org (Postfix) with ESMTP id 426A87E905
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 01:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmcs.onmicrosoft.com; 
	s=selector2-hmcs-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q28hKzF+ylTmvv/XGD+arngxSUlHBDhF+31V2wFyyys=;
	b=ft8H7sj5EmsVUWKlrt1B9STQe422vJSc9V/vsOlW7H71iq16VhUiwMVufmsyDrz+61Vpl6cMY9G5aDT2BkPNm6+CvQQ2mtfanlTKYDQgy7QPxewojrcOPe8s4Hzwo8L737rwQufGOoe+p+CuElauMntIcqHjgSlfx+1Mv9gAt+o=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
	AM5PR04MB3106.eurprd04.prod.outlook.com (10.173.255.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.10; Thu, 13 Jun 2019 07:53:19 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::38dc:f8e6:b29a:54c6]) by
	AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::38dc:f8e6:b29a:54c6%6]) with mapi id 15.20.1965.017;
	Thu, 13 Jun 2019 07:53:19 +0000
From: "Bonnans, Laurent" <laurent.bonnans@here.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVIb0RzzM/80gL0E2+ylZlblROYQ==
Date: Thu, 13 Jun 2019 07:53:19 +0000
Message-ID: <20190613075255.5790-1-laurent.bonnans@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurent.bonnans@here.com; 
x-originating-ip: [131.228.216.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d54b6a1-e92a-48ba-5578-08d6efd433b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:AM5PR04MB3106; 
x-ms-traffictypediagnostic: AM5PR04MB3106:
x-microsoft-antispam-prvs: <AM5PR04MB3106154F47E8B5C30E1AE7A085EF0@AM5PR04MB3106.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(66446008)(3846002)(5660300002)(6512007)(4326008)(76116006)(66556008)(66476007)(81156014)(4744005)(6116002)(8676002)(486006)(71190400001)(478600001)(68736007)(64756008)(36756003)(71200400001)(6436002)(81166006)(66066001)(2351001)(7736002)(86362001)(2501003)(8936002)(305945005)(6916009)(102836004)(186003)(26005)(53936002)(2906002)(2616005)(107886003)(25786009)(73956011)(256004)(6486002)(6506007)(1076003)(14454004)(5640700003)(316002)(99286004)(476003)(66946007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR04MB3106;
	H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: here.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m+FN9bmjL8WSPPMj42cIsHhU2wv0xJnaWjGzoepnzuzl8Z5pBMqIMzZ0LmaCCoNcYDCTPKwOUhQgZHUORyaAtfvZhqotGOul2Ra8EVp3q+eQV/WTq6DE+UFsI2MbHih2udgvJn5uBRPK8LzM+BO+C0kAxwWB6yHzBHQ0tfXQ6d/TR6ni2InJm+ow+4qzweGd4aFciaK5cfJudbaK/LFdl/pWLFaY+R00/qQmFCKXZe4dYXGfAul1SnQJBOyU1rnweKQIP+g7DaBVBInRBUgxsXSOLHoN6ih6hTRzetQFHcBuSqEnEBxCcQyW9vqP7znfReFaGKhYcLTw5h384un3iXhAurigTCBkD/NrNsnR5sW5YQZg6JL+wbFj6+HPN8RLdBw2j+1sxZj1WZ9JHIk/hj+Q5nZV3Cp0ZUUCjBfZl1g=
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d54b6a1-e92a-48ba-5578-08d6efd433b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 07:53:19.7680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurent.bonnans@here.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3106
Subject: [PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Fri, 14 Jun 2019 01:28:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

AArch64 images are not self-decompressing, thus usually much larger.
Boot times can be reduced by compressing them in FIT and uImages.

Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
---
 meta/classes/kernel-uboot.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.=
bbclass
index 2364053f31..0457c5d1d1 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -5,8 +5,8 @@ uboot_prep_kimage() {
 		linux_comp=3D"none"
 	elif [ -e arch/${ARCH}/boot/Image ] ; then
 		vmlinux_path=3D"vmlinux"
-		linux_suffix=3D""
-		linux_comp=3D"none"
+		linux_suffix=3D".gz"
+		linux_comp=3D"gzip"
 	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
 		rm -f linux.bin
 		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
--=20
2.20.1

