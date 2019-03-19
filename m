Return-Path: <prvs=974414bc6=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 125EA7CDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553028464; x=1584564464;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=F5ecGXzjN+35dnagC6fwEwrdwgCj9vHs2LrEZ37MZpk=;
	b=fL16bbJXaW6Hksd3LtRTumbS7hMZ7bNbrQ58AqfilBJd2k5Eoyf9J/DA
	QhHEbJAciN/YegqJmcR2bShXzt1qec2ITHZZqwPULdoIshKVPhd6Y4auy
	oW5mWgXRbm2H2vnG7N09Tj6y5TEC0Z5tlM1s+f0xNF/IZht1wUf0+8Kyi
	F27d1MFLI2skLcl1JGHwMjlpHlpkq0IlmiBGYJtK6GjUQGNEe4dXPjT6a
	X7I5pXV8EV4TZYY/u6JHRQqsAncjApYmce2ZujCGi+w0zCGxmWpwCRGyv
	9JNaYB2XsMHdJrV9cW13jeg6HNT2HVRWWy6hbwHzDARub3JUGOFkUebyx g==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="108826314"
Received: from mail-co1nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 04:47:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6tKaoWfOrmc4/OUEuG8bV67qE7Dg9oGqAfgbpJDXqWY=;
	b=nVSjkw4xajZgKoOmjJs5A+3N/LDTBi6v5fXuRSf8piylEKp7fcygMc9iiWSXmmNpRbHxVW197rMbp4Msrj08dBWNlaI5lbUuXnQ9WVAzBSzv43i6tiIzwLrPaJfaOuLnh0Dne17kjRTYtPFQfL+CxhdcoiOqRKekfKBg37SRPqI=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB3831.namprd04.prod.outlook.com (52.135.214.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 20:47:41 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 20:47:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] goarch: Add riscv64
Thread-Index: AQHU3pT/fcmeAuN/AkCe0JddxZS/Zw==
Date: Tue, 19 Mar 2019 20:47:41 +0000
Message-ID: <20190319204600.6930-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR04CA0004.namprd04.prod.outlook.com
	(2603:10b6:a03:40::17) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79cfaa22-ac2a-47f5-be44-08d6acac2151
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB3831; 
x-ms-traffictypediagnostic: BYAPR04MB3831:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3831C0770E02BD815DD7B6B590400@BYAPR04MB3831.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(136003)(39860400002)(376002)(396003)(189003)(199004)(6436002)(26005)(6116002)(6512007)(5640700003)(256004)(44832011)(3846002)(486006)(6506007)(386003)(6346003)(97736004)(14444005)(2616005)(476003)(6486002)(2501003)(71190400001)(71200400001)(186003)(53936002)(6306002)(66066001)(6916009)(52116002)(25786009)(54906003)(99286004)(81166006)(7736002)(8936002)(5660300002)(2351001)(316002)(1076003)(8676002)(72206003)(106356001)(81156014)(50226002)(305945005)(86362001)(102836004)(36756003)(14454004)(478600001)(2906002)(966005)(68736007)(105586002)(4744005)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3831;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OD+lztynsMeuVkVRgdKeymz65DtLXzl8jlglV1whaMhzB7KHrsApK31jLI6P+801+jdmokBKh/a1BmDf6m1ihWYHnB87uwbwfbBJjxwXPLklved4Vmp1lcpp2jrvfpYNLAMlpFVrLCdpAGEThs1JFujW0tlf3+IUMZGRRfG4gwXlogsZgeHxJx5Hqlc2rPNCldsQHWMGW86MCJ7hDPCjFziCQQaOYEZqbp8hgaMioRGvbL4zD9M5O6LvYELyQMox4nXLrAQ3G5yqvxQDEjvbJBzx5CdJ8gpbDvNLz9gag4kfEp2kkKsgerFt7+DBjjaFGjbdfhjw3fDrvhh5vuKbds302u3HeF60pNoRjLH5QsbPXuW0fodVTVaTasASYO5qmPfRq5wrG0cv+QoXCIzA/PUfKYcwCyVuV7r+3DP9oSs=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cfaa22-ac2a-47f5-be44-08d6acac2151
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 20:47:41.5753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3831
Subject: [PATCH] goarch: Add riscv64
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
X-List-Received-Date: Tue, 19 Mar 2019 20:47:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Although RISC-V 64-bit doesn't have official golang support there are
forks that now exist with at least some support and work is ongoing in
the upstream tree. In order to be able to use the goarch class add
support for RISC-V.

For more details see here:
https://github.com/golang/go/issues/27532

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 39fea5e3d1..7aaf26aed1 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -68,6 +68,8 @@ def go_map_arch(a, d):
         return 'ppc64'
     elif re.match('p(pc|owerpc)(64el)', a):
         return 'ppc64le'
+    elif a =3D=3D 'riscv64':
+        return 'riscv64'
     else:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
=20
--=20
2.21.0


