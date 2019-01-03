Return-Path: <prvs=8991e90f1=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 0109F7BDB1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 23:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546557572; x=1578093572;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=bJ+S31FIy6f9EZWw9b/04zrBQUP5ODUD2cWssjOGn0k=;
	b=Re/1egCtpQJ3biN6klFY3yzxLbc8LN/dGCO7TFDf5UktyrMlMNi4sLHg
	Wcilv4gxjVX/jmPSm9NgosTmM6isu9QbyhFSQ/eLZI1acHA5Eh+jTjX6m
	WPgUnKFchUgHGb/17BxFV043iUFt4HDECSs7vjXrJz6wJuI56QYkcb3Ex
	F8wkN/3z0+nEQwhCR0lcPZ4+R8ddeeM6zRTpVmjpVNd2KClppFH7BtnuG
	+aacCQfCKR2PO2/aVA7OQQmryfqXikeYUIkOh9nmTiMv+O0Kwjlpq7nRz
	opiqcsQLO+OUoC+N3sTzBaLCM7g0FwRiOHfHkApPE2ip+hhNbrPb2RNYw w==;
X-IronPort-AV: E=Sophos;i="5.56,436,1539619200"; d="scan'208";a="202761041"
Received: from mail-bn3nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.51])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2019 07:19:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bJ+S31FIy6f9EZWw9b/04zrBQUP5ODUD2cWssjOGn0k=;
	b=IFV5FjNiZFMujdPiPwoIlVB0r3pUef7PCxepaMwZPO4jVI4AAAyGFgLF5uHqajv1jHh4IzNK5xjup98dKRBtAiq42iTsmmsxr1zG9UeD1cWBhKsAmOOiK40V34uAmudsnlEZP8ny2IqpJn4ESbnr2SE1nq3H9SBm95H1hLZQJVU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1104.namprd04.prod.outlook.com (10.174.250.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.8; Thu, 3 Jan 2019 23:19:15 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Thu, 3 Jan 2019 23:19:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] fts: Bump FTS to version 1.2.7
Thread-Index: AQHUo7q+KDiyaEjajUejWIZ9F1/bUA==
Date: Thu, 3 Jan 2019 23:19:14 +0000
Message-ID: <20190103231907.1962-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0081.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::22) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1104;
	6:35zT2eLgeAz/Pg8mlfJarl85RNmCWj/4M51DtbK6xfA1qnRhy6k+pCciFfHX64784MnesgSDsAXrHhsNo6Ysl3ND0kwnV2F5r+Cbo12Vkcz0LjK6k/DyO1CWBVKf7cANaVlzwnOgg4zb3VK6SOL6ldjeBzeKS/HbI47WDUSfBfAJQF3OI/ekwN/nOWYk3/aDjfvnuuZ0SrKbhqFQkdmCWNVRbVY7Ucbj8+8EBjaWYyHENbuEL8g3TmMcRlRGaVXjcpyRk3q1sQME1QMe6YWPiuGL3aHp4L+jZkwZGkK0uGlXx/E26XEt16/iTwHzdFpWZeCPsr3KLPyY1PFjde2kBeXFJDfrJ8x41Uvb4yVnGGGYs9UU2oByr48A7Bz68BZxOV7zyU1WTDwSqfGTbUcWw6k0v6mnkEYsc4oOQDgB8kbBIwzZ+Ytx6iovENRtfFXO3+OZmG4M15o9AiM6NAEC6A==;
	5:W8hOOrvkegLa8E8YuMVYSpc435AF870fWK1/jDW+zQiAr64AtxZCTb9Eugk4l2Mwl+5AvtmR4JIc5IKNLQBbcANzF0k76MElZhJtW32FtIl0c6ToF2+MW68SNDpFvh9g4KJZJw09ssZVJAtAZPY9HadcD9iJrI8Z8BSqZZr28aPLbd2b467oMNDJTfIeASnORLIGN7p4tzr0wJ1FSEdlUQ==;
	7:sfpF/AXJpIvZ0WbgpULFJ96zKkMwEb1I6PNIO4R7t71rFt1beCcX4SJTfXWgE/v6InegQS5kqJZlwZWCu+uzWidMpHUs1dnne7kgXboqhnB8oYG7utRa7Uy/gYz5VRiVJCcyj/erU92Sslt2l3DQ5w==
x-ms-office365-filtering-correlation-id: 8dc504cd-4f27-4f0e-023e-08d671d1e06d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1104; 
x-ms-traffictypediagnostic: MWHPR04MB1104:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB11045557A6A688D0F5F127BC908D0@MWHPR04MB1104.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(6055026)(6041310)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1104; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1104; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(396003)(346002)(39860400002)(199004)(189003)(24433001)(8676002)(71190400001)(81156014)(81166006)(6486002)(71200400001)(575784001)(6512007)(476003)(478600001)(5640700003)(52116002)(486006)(72206003)(86362001)(26005)(386003)(102836004)(6506007)(50226002)(6436002)(1076003)(44832011)(36756003)(39060400002)(2906002)(25786009)(4326008)(256004)(305945005)(316002)(6116002)(186003)(54906003)(53936002)(99286004)(2351001)(105586002)(7736002)(6916009)(6306002)(14454004)(66066001)(3846002)(68736007)(2501003)(2616005)(97736004)(106356001)(5660300001)(8936002)(16351025005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1104;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XzsLDWTfdaoYj2oCR3ZKIzCRtKhNdiE8bs/t0XJOthV9YFQtu55CQacss8KJdk4PJCXFq4HRX3YQYCqxF0V6AfeHUYIULQd5afINq4N/WtzBnia/uptd3YnV92CEx4+NAVZn5z0sk+zLvmdJwtBmVYFVvMt7wwONzqTGxEiEtTbMizg/51Fw1+Ry3qj7itylidUco6ufZbDZSsJeOsl0WwH5Nobc33ubUClZ6WovCdc8W6aefQaYS2Oe+hPJiziKiq+S4O0sdXsHQjokuigXa0rTNH0N5aqu0UmHDddEv+z0NqH+7Mqqp/l0Y0gFugaf
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc504cd-4f27-4f0e-023e-08d671d1e06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 23:19:14.9816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1104
Subject: [PATCH v2] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 23:19:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/fts/{fts.bb =3D> fts_1.2.7.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-core/fts/{fts.bb =3D> fts_1.2.7.bb} (59%)

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts_1.2.7=
.bb
similarity index 59%
rename from meta/recipes-core/fts/fts.bb
rename to meta/recipes-core/fts/fts_1.2.7.bb
index 02f54086a3..589ae0e916 100644
--- a/meta/recipes-core/fts/fts.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -1,17 +1,16 @@
 # Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-SUMMARY =3D "POSIX file tree stream operations library"
-HOMEPAGE =3D "https://sites.google.com/a/bostic.com/keithbostic"
+SUMMARY =3D "Implementation of ftsfor musl libc packages"
+HOMEPAGE =3D "https://github.com/pullmoll/musl-fts"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ffe358174aad383f1b69ce3b53da98=
2"
 SECTION =3D "libs"
=20
-SRCREV =3D "944333aed9dc24cfa76cc64bfe70c75d25652753"
-PV =3D "1.2+git${SRCPV}"
+SRCREV =3D "0bde52df588e8969879a2cae51c3a4774ec62472"
+
+SRC_URI =3D "git://github.com/pullmoll/musl-fts.git"
=20
-SRC_URI =3D "git://github.com/voidlinux/musl-fts \
-"
 S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
--=20
2.19.1


