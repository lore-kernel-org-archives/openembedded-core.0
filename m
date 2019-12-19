Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410091.outbound.protection.outlook.com [40.107.141.91])
	by mail.openembedded.org (Postfix) with ESMTP id EC8BF7FE36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=g5zIc1MvY2Rkwgp39W3sKvExDHj5aiXpqQcz0Mz7Fkk2Cr5OkamHy0AEREeOl1dYGd3UIQy0714ioe/FMpBAc9QZGio3QM9Uv3LyKnnSTXEqBKmgvsUDeTrrto2gro9LsJLpPAXT7WYzkEZcZ/4wsddMO2jZc3cH4ZIwA1rtz66b273XNEwM4cMcuhTywlmJPZ2Sy39/ZP/5Bv5U3Xb1eRIaqIHPFr/QZIQNVmALvBDrMEuIzD1IJtxzs4THve4t7MitPW6gomNSJeBstx88JzLSCLdWPzHqzwoc1t7JDtywNI3YqI/j1jBJPLItjE6BP2Vbsjg74mZso7JbMN+9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lwtiamu8/NjzS4pnxSl2RJjC4j8vFiPSBsngcPwLbhg=;
	b=VY7Z4PXb3PwNAH48KrHmJzhAnK0o3beZjTaP6eGF2PL0j/e/MF4wAdxuJk6OlSB+l/GWxEEoCuyllziWbA5DDlJ073wiUOE7E6MV9U4vQmFM4XJtsFfR/6KiEhFUKjSxx/ARlBGc+XcUUICfacURcB72MMBGUmFfM//NS524ZmIVJbTnogxiIbjpe1qqbrngjyfkxUKZ+f5fXumP0vVih6ybnN2jdrp/ni1J5balqjsSeJTxf71tDrGe3cNCMFlwA4Cyj8dSo55tWLwH3SBe3uOYxgQYo89nienhTBE/07LBz1dHkSmNgGXROpgg9NO2K32FCtXdhc8AdPTEFO1p4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lwtiamu8/NjzS4pnxSl2RJjC4j8vFiPSBsngcPwLbhg=;
	b=qry5UpAR6xBK/bDCSO+60KARBmxo/wDXIqQlWMWMOLOuxxizqLUVElHdnXuOqTPTzFRLni/bgM9eWbzU8WkhU8ekttHUYH3RzSEapIcpkqldr6SWoOVHUkJE73e7ROhlrXN/dWIJVqq1TA7+mGzTEMWNm4EATD7KEWJXTgHqGwo=
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com (52.134.253.73) by
	OSBPR01MB2262.jpnprd01.prod.outlook.com (52.134.240.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.18; Thu, 19 Dec 2019 12:27:08 +0000
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d]) by
	OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d%7]) with mapi id 15.20.2559.015;
	Thu, 19 Dec 2019 12:27:08 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2][warrior] qemu: Add PACKAGECONFIG for glusterfs
Thread-Index: AQHVtmehOZWtmvbBhEelTRlartKZZA==
Date: Thu, 19 Dec 2019 12:27:08 +0000
Message-ID: <20191219122722.85234-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYXPR01CA0047.jpnprd01.prod.outlook.com
	(2603:1096:403:a::17) To OSBPR01MB2616.jpnprd01.prod.outlook.com
	(2603:1096:604:17::9)
x-mailer: git-send-email 2.24.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cd3b7290-05d9-48ea-a023-08d7847ec3ba
x-ms-traffictypediagnostic: OSBPR01MB2262:|OSBPR01MB2262:
x-ld-processed: 72cc4624-32b4-4dab-b80a-8563e559bd82,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB22626B65208FB820F743D390D6520@OSBPR01MB2262.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39840400004)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(107886003)(5660300002)(316002)(86362001)(6486002)(26005)(1076003)(4326008)(52116002)(2616005)(66946007)(6916009)(64756008)(66476007)(4744005)(66556008)(186003)(2906002)(81156014)(478600001)(8676002)(6512007)(66446008)(36756003)(6506007)(81166006)(8936002)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2262;
	H:OSBPR01MB2616.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YbzUpg5j3PmSyI9q/NfCvy6EKQ58RE8+jKmcK+obZp4XmmxV59bTrwPOYYOwnzAqvv0r8Ap22H/z4vm7deZhwsGM2bDvCnxFhv75uG6WmJOdVGluo8K0fXOJr04nXi+Vwk1HTHYiVPT0PPNsMrksczDgWl5ksypNspLFHCkGGnGcr8Fac6RGmXZV0u0vkAO+7Pni8KJxPLtpXTTPmuu4XW16qdIDEdt5xTtXpSpmupgs5ioZWG9/+zjYJCAYHpVhvvQBti5X93U8iIgBzNC/cNcbost4lQhXeYNvNEnCFaXqgN4qJyLteIiJD5Gfw8baZtWjHT69vXxEtAYe9GT8mfBuCVq3qN4LynrebHPV8XXM9mizimqFWnXROYu9qblLQRpHUl3uBf5sL7LCdyhBUdmftOHxQD0FACr2m3YWQNb2tAQ6cRrP7eRcLzpphC0i
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3b7290-05d9-48ea-a023-08d7847ec3ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 12:27:08.1957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TouqVnzCJKiHxFFsCqZNzYbWUwJjWqADh/06f7iP0ypTopjOEjBObITrLpU9K+pQV6oyoFdoywbyrabzcmCBSeiXQxLIkY3jJdPjrVwNuMMBW1822wf0FGeWqFsfDRji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2262
Subject: [PATCH v2][warrior] qemu: Add PACKAGECONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 12:27:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

This commit adds PACKAGECONFIG for glusterfs. glusterfs is not required f-
or runqemu, so it should be optional to reduce build time.

Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 202134b3d8..e917a96241 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -160,5 +160,6 @@ PACKAGECONFIG[virglrenderer] =3D "--enable-virglrendere=
r,--disable-virglrenderer,v
 PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usbre=
dir"
+PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs"
=20
 INSANE_SKIP_${PN} =3D "arch"
--=20
2.24.1


