Return-Path: <prvs=95557a815=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 270137CCEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551378785; x=1582914785;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Vhliu5Su2eNJ4RW3+2gfqpWyZU2+X5ozBYpN1dlPBd8=;
	b=RPuIksJ83N4sAVlcmK8hvfhiwms8lfexYm8KmTCOYRs6huABbfdcrzAq
	duncIGaIgynbUvTHjn/9rFlSKSF7RG6yYJgYJ97D2td4jTWYGf24gDak4
	/hInHuz932Ce5Z+ZPtor9MD0uUAso3hlDxC9kI8ZMhu1hUcgJzzbjyJ7V
	PXzbxmxHJ3gGpc6/aRDu+D0+umwBnwUgFVhC0guTDDxXzmq4dL5Cp4RoW
	DharYhEXiFs+EXPdS/xlY7DH3k5WRfomSoorGyEUovijXf7qRyBh9VYMH
	UrvK2vCUma7UwV3V5moRYmlSSkmPxXLq421zj36DLZb5v6yw05XuFP3Tn A==;
X-IronPort-AV: E=Sophos;i="5.58,423,1544457600"; d="scan'208";a="107394448"
Received: from mail-by2nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.52])
	by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2019 02:33:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Vhliu5Su2eNJ4RW3+2gfqpWyZU2+X5ozBYpN1dlPBd8=;
	b=IM3uyJ6FXdON+YQjCm2w8RHf5GUn2HN310rjUppAGI3Mph97hRKLdg1tCTwcGc+x78997dERoKJDNxt70srBtXMg+N6p8Kq8fIwAUZAEHPYXmMJY3q3wTMYrkToTdcxtb4FQTHDlHVGAQC1oB6SI92nIcuJu+vJYFFizjN0P8bQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0689.namprd04.prod.outlook.com (10.172.167.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.18; Thu, 28 Feb 2019 18:33:02 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Thu, 28 Feb 2019 18:33:02 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] qemu-native: Add missing dtc-native dependency
Thread-Index: AQHUz5QJZRdYgfuCikuDZVabivtWIw==
Date: Thu, 28 Feb 2019 18:33:02 +0000
Message-ID: <20190228183224.26536-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR21CA0009.namprd21.prod.outlook.com
	(2603:10b6:a03:114::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fff08bcf-30ec-459b-39a0-08d69dab2bad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0689; 
x-ms-traffictypediagnostic: MWHPR04MB0689:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0689;
	23:Pb+Z5FRKd8ARHp/D+nd+subJICAHAGbI/JmII0Y?=
	=?iso-8859-1?Q?8Fmjjj4A8CzG3ATSDTuoBMBN4sHuxBRwc44DCxMNuffBq/P+i4jdC6AEUO?=
	=?iso-8859-1?Q?HNHIsQ2cHRnj/kvpWfbI6MUH1u/5xXc7uZ7QqkU4i8/M7iHGTOE0HXJulJ?=
	=?iso-8859-1?Q?dkUlc4ZzFBC6uQdo54iTathCx6HqgPmUjnPTXVa+UckUFevTUz4T5yLn4J?=
	=?iso-8859-1?Q?4fopA0h3HnSpPXPEgbB8kngMLW8mGWkgJod1218Wo2qA5BlDTB967XqEn7?=
	=?iso-8859-1?Q?sJQt4bPPDEc2QGMnRHOKR/r1ynb6WHa/FpAdfVNQbfqBKLdlCijpBqtJ5I?=
	=?iso-8859-1?Q?oktX4NU3L6S3TJxKd4yz1dedGLdnGklryAVN8pcmd/donK0N21pmd8+x2J?=
	=?iso-8859-1?Q?90mISXNq8YT2MiBMMXnhPkJEedIn9Sh2ceOZvkrT5K6vg49GgcMfIy0/df?=
	=?iso-8859-1?Q?rvQ2C/sNxPpIrqMkrZaN9qJT8rPXVBgsFCmqx8hF+kNHk72u8rGoIYIpLr?=
	=?iso-8859-1?Q?M57Zm96gD4xqrG6bSpXPio5gdsOnkbHf4KdPLq5Cwxj/6JjQEiT1Kt2+H6?=
	=?iso-8859-1?Q?XHWGTk0MXvfH4KyMlKMIqLjz/64QnUrhkkO5NTilc6j4HNA/o8nGa9GsIO?=
	=?iso-8859-1?Q?jR//qcdBSsiRZt1UiqkrhtC87EFEzAloMUxmuhC9KQbu3q7IX6o3tsbkGs?=
	=?iso-8859-1?Q?8d5PnBmkhbr9ICmOf2hpEf9o/79nb/X3icOQI/UIRPjFK/pC1TWcsa5s+x?=
	=?iso-8859-1?Q?/lSkoZS7d+DmLAgyVkw1OhGvro9deKjV5j1fo8iIV0Q2Y3olcM2D4rU4Ju?=
	=?iso-8859-1?Q?dK3f8RGE73ZDJ9GsNbgnVyoB4kJWKZ1yYLhDCUDiVuTLKjRON8iqc4tq0Z?=
	=?iso-8859-1?Q?/y9kpoazVc4IWTKJjllqeYS6kfSIjKo/f+ItQGh66wZKgwgV9/IjEQwatk?=
	=?iso-8859-1?Q?D5zL3V8WkKuD4Ux7Kzmiwv33OTwNCiMYRk+kSk8xZ0GdHVtWwVo38T8iBd?=
	=?iso-8859-1?Q?gryklHLigD0JSIV9wnU0r30UZM6ZEQwepr2LiIfx6ajz08uv2jdN/klqvr?=
	=?iso-8859-1?Q?p25a4xGHTPZ1OnioHWLhVvZwvbC4FXeo59RxnEXs5XL1cYoubFXn6h5eUb?=
	=?iso-8859-1?Q?SI5PlZTjiMRlXteTgAZv/R2bqoluKeEQc7x6/9nB0HzmLWOubNVBKIrUvQ?=
	=?iso-8859-1?Q?w6zks06YFgeDLDxk/8eG7Y9An/hN8Tqo5ADFt1KOU2Xr4jSap17NVQbO9o?=
	=?iso-8859-1?Q?Ouy5BGXii2OLQt9XXrVMuw7FlJyqm4k9ae6P2X+phs8tiQfGhdbxYNmI5o?=
	=?iso-8859-1?Q?ncTkGukvkjYCVY7JO6XjWPHpSEFyTnpN8I5bemSU61dDA=3D=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB068963424BF5E5DB51B3F35E90750@MWHPR04MB0689.namprd04.prod.outlook.com>
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39860400002)(366004)(376002)(346002)(199004)(189003)(6506007)(478600001)(72206003)(6486002)(6436002)(5640700003)(53936002)(14454004)(2906002)(8676002)(3846002)(6512007)(6116002)(81156014)(7736002)(305945005)(1076003)(50226002)(8936002)(81166006)(68736007)(66066001)(4744005)(6916009)(106356001)(316002)(71190400001)(2501003)(52116002)(99286004)(186003)(105586002)(14444005)(2351001)(256004)(36756003)(5660300002)(26005)(4326008)(102836004)(97736004)(476003)(86362001)(44832011)(2616005)(486006)(25786009)(71200400001)(54906003)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0689;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QaOX0v7+MF/PT3pnSm/KYma40gwPBDNdh011NLK9wbSYReq58srpOm6gfNS1c/ZDkozH2cnhoWWk3YbiL380M9k7FDE6TSFSHYwY0WFa64RTh1OeZUoCMqmNFnOFi4l03n65NhBBZ7yuPtLwqW1z6JzBE9fmRNcw5YUMs8upHSeOBPmgfMy0BCZ/M2UCuRU4XAJfKaIsjfJMYCDEG82w4+gkDwHb3JRWwIX7qeE9bdW0PFxUkb2fyOQYxBqCIba6PkbH0sPW5D/vguresmt1zI7q0WFnVOnntnYwlsxPCDs5zJTlIoi0Ow9dURcKzTs8LvUAI1ofkebWB/fHCxfTGQunYd2g7WXhi4LNv/zuoBKs1EN63hweqaxnYP6O81wuYUC/vP5kdsVXEga1qoxxFI0fqtzUMI6k0F/AQbJarxM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff08bcf-30ec-459b-39a0-08d69dab2bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 18:33:01.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0689
Subject: [PATCH] qemu-native: Add missing dtc-native dependency
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
X-List-Received-Date: Thu, 28 Feb 2019 18:33:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes=
-devtools/qemu/qemu-native_3.1.0.bb
index c8acff8e19..e3efd873ca 100644
--- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
@@ -1,6 +1,6 @@
 BPN =3D "qemu"
=20
-DEPENDS =3D "glib-2.0-native zlib-native"
+DEPENDS =3D "glib-2.0-native zlib-native dtc-native"
=20
 require qemu-native.inc
=20
--=20
2.20.1


