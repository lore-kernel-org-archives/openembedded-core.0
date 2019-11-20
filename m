Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410129.outbound.protection.outlook.com [40.107.141.129])
	by mail.openembedded.org (Postfix) with ESMTP id F100D7CBE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cF6RnFgkN2apOCOUuFHXFvEvt2sewMSmj+NWTYQiPNA1U2ZLGoSrBAz7telIa9jmrclCgrewmuHIIpYRAPqIOnb3pRncuwOQ78Hq1+14cUy8vl8Sx+Icg4TOWcYyU9lxcIsytN3vpI2raJZoWXcKO0MsneKzxXKEPz/et0h/JkxK8PJ5QaluXRwphnlqAJqfxbGU2YvEgHKiGSxzJSbWUrbVCuplcJdOaC9WgxbK8AQM1QDU32nVSM9S6tS026mfhu/8RhAt97DrSzNYQUhTggqkJP7O3qu/ISyYjVg/OP6870Z0vFiIWXW/RX7pWDCUuiojuXvFwqMiqFZzak13hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YbPMhquggQdaOLb/HfULruj44TLDD9Ys3IESXG2+uIo=;
	b=jdS55LLxzyy8iysLmeYvXeW3JsOotl0xGUZwzKD5J1NxrxpmRrliOw1P3LrsxiaD7II7aEJLjKf8pmKzgY7zw1vuYzg/+n5QdjIC7lJQYhH69sXJAWBAcdv8RXe9fSfIZCoslSt6E/nMl/cbtjge1/nl9FOIU/GL5Ti1t1EAOSKFWo08y+R3xGw5QBpmwqsOvoBWOIJ86PY3R15JzAJyp4W/1WUzCsPR2whazR677b07ELwEgppmR9P7DchBkqAW94T9UKfITArg3PdG09eTq7idL+TiY29bA+DNIPBUdYdxlDfu63E93cVm2w8Len9oCFQfd4+jQILT4CUA0c54fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YbPMhquggQdaOLb/HfULruj44TLDD9Ys3IESXG2+uIo=;
	b=APlhFnO2qOd2XHw9e36YAMhnQzBYbJRTMJL69/yyGQeJBJeiMbRWobMgVpz07Er10oIHwsZMGYXkky4dgX6ResQ4zWUE2Y3UEuK2lMHrGXJuCTnwygsZWapjtf9Q09qnuXpOeHCtfBva7s9Op2gQYn6MIHaumToRckky97Mxv2g=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB4829.jpnprd01.prod.outlook.com (20.179.175.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.23; Wed, 20 Nov 2019 06:25:53 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e%7]) with mapi id 15.20.2451.029;
	Wed, 20 Nov 2019 06:25:53 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] pseudo: Update checksum of the license file
Thread-Index: AQHVn2tbLXUnTBJliUWpp5/qn+xIcA==
Date: Wed, 20 Nov 2019 06:25:53 +0000
Message-ID: <20191120062728.105714-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0140.jpnprd01.prod.outlook.com
	(2603:1096:404:2d::32) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
x-mailer: git-send-email 2.24.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 099cfbe2-99f2-4de1-0944-08d76d827e61
x-ms-traffictypediagnostic: TYAPR01MB4829:|TYAPR01MB4829:
x-ms-exchange-purlcount: 1
x-ld-processed: 72cc4624-32b4-4dab-b80a-8563e559bd82,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB48293EA26D2AF010B5DC03D8D64F0@TYAPR01MB4829.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:338;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(6306002)(1076003)(36756003)(3846002)(71200400001)(26005)(2501003)(478600001)(71190400001)(25786009)(186003)(4744005)(102836004)(52116002)(14454004)(2616005)(476003)(7736002)(305945005)(6506007)(5660300002)(86362001)(6916009)(7110500001)(14444005)(256004)(64756008)(66446008)(66556008)(66476007)(66946007)(8936002)(6512007)(2906002)(6486002)(50226002)(15650500001)(2420400007)(486006)(316002)(386003)(8676002)(2351001)(6116002)(107886003)(5640700003)(4326008)(66066001)(81166006)(81156014)(6436002)(99286004)(562404015);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB4829;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6LCyfO3gjOhredEPk9fGJn5R0Iu6OMZ2UUZ85oe5paTcVdzn3whEcLb17nkdP1cS7IpkJ53uDm1umIoz56wK7u+s6/aXlu8aVhDCkjYGWuQh/0lm+q23e7mnTY4HfGVIQPCk0TGpMKJctm0VqTnz6SfoBavNRGa05i5Ymi3pjU4cpGD6qndbgBiJqHQQbR8AVoTCXCeEkPrmzHqN4jFtTSO+v6naPy3JEfmkxLYbK/cKVvfpSrVegT7VLJ8pfgwXtPIAY8E/aSuEcuUfo3yl4WSHnBgcZd9mqy8FcVfJ8LEtwd9B2Y6evHCcR6VgOw4A9pLZ0qDap4zNof2/yA8WZ9GcJtoQoXVjl42OIRJqkrkfyCC3ziwYkh86RPuoUszenCChVTb5pJimcR5GS2MuOxXlUxAAS5ln11S1bjdWavz/8cGSdWJZgZ1E48N77Yw2gDVc+L7Yk8f5rG1tWQf76+zZ/oEExT1hwer0gqS+9PA=
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 099cfbe2-99f2-4de1-0944-08d76d827e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:25:53.1048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dyVsudbz7Hs0/fJpCWWiHqe4jSH3PyOK7aIXZiHn3aP5H7HjdoOO6RfojKCBuah+GkjfVUNyS5n8N9kWPR2MCIMHw+hjJwd6R+Iont+TYq+votg3/8I9m6tfaBGFMXhm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4829
Subject: [PATCH] pseudo: Update checksum of the license file
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
X-List-Received-Date: Wed, 20 Nov 2019 06:25:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Recently pseudo.inc has been updated to latest master (d50b9c511e17c6f582e
f39b61eaaa8d4555eabba), but checksum of the license file did not change.
This commit updates the checksum to latest one.

Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtool=
s/pseudo/pseudo.inc
index 7ff8e449e9..6fc40e9e9e 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -4,7 +4,7 @@
=20
 SUMMARY =3D "Pseudo gives fake root capabilities to a normal user"
 HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da1d8023a6f953ac6ea4af765ff62d57=
4"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b86a=
d"
 SECTION =3D "base"
 LICENSE =3D "LGPL2.1"
 DEPENDS =3D "sqlite3 attr"
--=20
2.24.0


