Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400112.outbound.protection.outlook.com [40.107.140.112])
	by mail.openembedded.org (Postfix) with ESMTP id 66DC07FE6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jPSOR7VxDt4Qxx/Y2OxdKK5xsla19LNoGZOwDxtL4QuiPWe0ni5i9RxYlXrvFydJCZTnvYnCgH4r1vC4Pui0uT/rQ6jQ8PixJaUn6xmNYjtn7V3Nv2FIpsAxNIfFLyqhSf7vfHUFCSaH9oZcSUDnkiQtw0ALLNfG02f+zIwOPC2k3pLsng3M55STxAoGe69q8TYx7mWY3t6KvO64rT2NIyZ6NHxhA0sQKFxsHLShbia9oTbnnI4wctwacH9ULfKYbgsthNZoVBJJPqS2MLxtP0YqC7L2hDpC2+QC9OElO33ZrdmD0pz1i+j4VWYPhgsLHfYL5wJbdPz/7n/nCvgvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NQD8XTqBFB5Dk7GYTvI8Q+o0sYa95jaGVvFIJ8UVTJg=;
	b=Z+QXzjjja9/zRff8aH6a9FzOrBuz7xUB1PvD0H/GXsz6/9c2BV9bo99bVlGV3ZTSxB8ECkjrlanEY6zpbRoEPiIkfwF+SV8TsVINKlEo5hukZdketzpRiYzcigmKhxhE6MFcw27e3u1cm+i9JI29eceLFeYgEM6Bl/kVmlFwzNl/oNQOpCzhDE+7WmwDSaGEiTLivcGaPBt1LltQs7t2i00JlHi+Ib6iqic5TguDxj5xG0nWiWS1aPqQbqt4ZGSxOJcUsqfiOranT3Wpqoee1H3+Kv+UjDGHE4Pi3dKANbcw7xbgfp9eiG+gEbWUmU5Dt2X9wuSnIioIqqbTmNyxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NQD8XTqBFB5Dk7GYTvI8Q+o0sYa95jaGVvFIJ8UVTJg=;
	b=J38krPlxEuWaboLAKrfgLRxUWG7EhUNyF3M+tKuHgT81WAVIO2NaW9AeAnzgr2Ok6lF4FC7j+7nbLbWPbpgxFrTsACpcZe0Yy/SgQTOn2AD6BDY71YpwYZbtEO6a4pJgD0+loQ6zncghkOt7nUqigPg9BL79RVegYJGS5PoFI8A=
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com (52.134.253.73) by
	OSBPR01MB4967.jpnprd01.prod.outlook.com (20.179.183.83) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.14; Thu, 19 Dec 2019 14:00:05 +0000
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d]) by
	OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d%7]) with mapi id 15.20.2559.015;
	Thu, 19 Dec 2019 14:00:05 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] qemu: Add PACKAGECONFIG for glusterfs
Thread-Index: AQHVtnSdbKCpKDHKf06KTvg7P4dLmg==
Date: Thu, 19 Dec 2019 14:00:05 +0000
Message-ID: <20191219140020.88536-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR01CA0038.jpnprd01.prod.outlook.com
	(2603:1096:404:ce::26) To OSBPR01MB2616.jpnprd01.prod.outlook.com
	(2603:1096:604:17::9)
x-mailer: git-send-email 2.24.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 585c8b6d-23a7-4bb2-75ff-08d7848bbfe6
x-ms-traffictypediagnostic: OSBPR01MB4967:|OSBPR01MB4967:
x-ld-processed: 72cc4624-32b4-4dab-b80a-8563e559bd82,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB496718C47DBD0CCC4F094CB7D6520@OSBPR01MB4967.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(6916009)(5660300002)(186003)(6512007)(81166006)(316002)(2906002)(36756003)(8936002)(6486002)(64756008)(66946007)(478600001)(66476007)(66446008)(8676002)(2616005)(4744005)(52116002)(4326008)(107886003)(71200400001)(81156014)(86362001)(26005)(6506007)(1076003)(66556008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB4967;
	H:OSBPR01MB2616.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuzAGpvrJhAe1zCpgrZ04R4IvYgBKlYLB4gm6GOvbYxluGmHhK216mvmU2vzIW/JqbCWZRvsa07zogBrxfStnpEe+x5CUW0cDTQ1LBh+wTlIcnrhgVMXnO0tK5bG/LrMsoNf/vyxQ33P6hcIha9prVfs8iCX4/pUUx27okHa7dvJe2nyo/t2lh5VsoKRAs3M82aNeObYxjGfn2q2zMsUOxfnsAVsnhZ0B7ApOFYDI/Ba3PPYIcw+cnpLrZoQ47bgBZ955vBZq8AywnwFcNvmNOjbgB4Xe1rN36I0g2Vo5wn3MrcGepi7RB5I/D4G1x9Y7CuaZmtK5FsLqzv+/ykG7MbtzfWul0aHWTlsYJ3D2jwQ6y7rDZ+iVz4UYgYZZQ6DDu/fiib0qn+V0Cop55Ue1fbe5wtxm9ahojP6DugT51NSt2gEK/0RXr6iScPIEki4
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 585c8b6d-23a7-4bb2-75ff-08d7848bbfe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 14:00:05.2785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hI+0A1vDbP3KJO9dqK0T6iCQ9wof+Cwky8Bo6x34VXWxJHXAbsLidQY1WM1RnPMuyyElXQ2sDHYqdMO0J6SixAe5MEBzFwYXL446PshP9JC3qzeJUxLhkay5yCU92dK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4967
Subject: [PATCH v3] qemu: Add PACKAGECONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 14:00:15 -0000
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
index 601fc2286b..993ca90cf5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -165,6 +165,7 @@ PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spic=
e,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usbre=
dir"
 PACKAGECONFIG[snappy] =3D "--enable-snappy,--disable-snappy,snappy"
+PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs"
=20
 INSANE_SKIP_${PN} =3D "arch"
=20
--=20
2.24.1


