Return-Path: <prvs=8991e90f1=Alistair.Francis@wdc.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jan 2019 22:41:52 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 30EE179D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546555313; x=1578091313;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=szeh/W+EWtoIlXNG7mZwYu/AkmwuCLlL33UR8cbIY50=;
	b=N+waaEZ5mVwosRG3Vp8YpK0+6iTMaE+NK9ZqCX1o9/se9KuN4b1hxfz+
	/r6rafzxY/GXwoegk5t72EENjUdfXoIkoKB/6+Vh9i22vzKj5I2iB8WYI
	+VeF5cZjkXtVY0LmWe/iSLJc5913tR9dCBbnsynnUS0tKlQ3vDxz6SDec
	K15DZCNDhwGjdmHoItJgxGNj+UBb7bkaepOnjGkHA5zLlnHUfuzLpfJeF
	s2b8ZWQ6+2vGK9Oyk3g/a6O2Y649oDH2FbOJCuVTlS6KZihjPCmRJ7J8g
	BJiMhqziZIDv2zUY3+GapalgUrwq14sCEV2k7JXBtqNyUyhv5T7kV2zJ0 A==;
X-IronPort-AV: E=Sophos;i="5.56,436,1539619200"; d="scan'208";a="202759121"
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.52])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2019 06:32:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DNfA3iuWzYmLT/BtHeS8jEq3kQ2elffhOGaUtWawblU=;
	b=RZPKOAgqPTDAIXIVtX4dCfpt8Rw+xOEV31NpumLgdt0qGMqVP+YH2rOjKEQvfAW9AaJvRLjXve+ckjLZFHaMgd28KHlAFMPSedPh7xDYRZYBI0oR83LfWQYkqfW+5+Sv8jcZzjpjHXKMHzO85AJd10d5ye18Gf1Mw42Dg8ldh78=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Thu, 3 Jan 2019 22:32:19 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Thu, 3 Jan 2019 22:32:19 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] fts: Bump FTS to version 1.2.7
Thread-Index: AQHUo7QvlB8mgDjSFEaM9eAulkSKPQ==
Date: Thu, 3 Jan 2019 22:32:19 +0000
Message-ID: <20190103223211.23531-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0056.namprd05.prod.outlook.com
	(2603:10b6:a03:74::33) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:WGkJqHfpByOX8ZjiItPMEVYqI9S4Ksi9vF39JIi/tZutNBW/X8d1sl9A1v7WqHjNyfALY/s4faLkukYD6PAgek9djNUQT5QIiwvF8bMdAt8R0ZGGFreniR0I1UWNZMWiKOHlmqchuULt3PvPSdthrwWwFcZIuQ06Xqy7EicIa5nFe4iApv/vcX+9D+3XOLFhLNu1q3t/3XDwYan817+FR9EiD/XHU60J6FjBnmGNSwE+E5H1BUrfNS1/TzNpC8uM6YGA5JMW0suKY+QC086JOcoi8EqjPKnJKtc5AYr8N+BgmIFrZnf9tTrNtnAnEP6BY7j838fdfdiN6VU02xXJTGzC31W0OxJdR6r1kkGCrNF9XSo7JVtEO4YP8p8XgOPPk5Sb37CdBhu4s/R1wy8SeqDziXFuiwcUnG4y9jewGW/FKt92bhhuz1oaCDZUcXFfewH5ufzZdJkEi+fB0l8IAg==;
	5:4gkOZGZE+CU8xGdj3O5lh3y3rZOlgrXs3yEn09jf55i2H51b3vM2Wz7FdbD26BxzZVtSlZzkc7FawXI/ASFfH7HVoazWD2sHSa6UnaLaK7DhIK+SDGyY8VQgM6DVf8PXAOSaRuhG95kUKpgla6mjgP7eBfL9ZfFJep7wXv+SalpK14jElaocqHrVdQLt8LAHmG9BMLvBRsR0wzxo0bld5Q==;
	7:GD5i5dK4in3OfZ13tGXRJ6c5Dky8NGa9ZlQwTTaqvgJN0mC1PuZ3IBNr3/Hk9aBO7JDKF1y/GbYEp0ZxtUFcXvHP1ruaRXBjQDpLBx7NHOImOiyslb4KehaB1nvy7ICJuil3KMR9HAOjlaIQM/Znpg==
x-ms-office365-filtering-correlation-id: 3ed99960-ad40-4a39-5816-08d671cb5229
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0639399A4BBDC8133D9840D2908D0@MWHPR04MB0639.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(6055026)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(136003)(346002)(376002)(396003)(24433001)(199004)(189003)(2351001)(14454004)(72206003)(14444005)(2501003)(476003)(66066001)(8936002)(102836004)(5640700003)(68736007)(54906003)(2906002)(1076003)(36756003)(71190400001)(71200400001)(478600001)(256004)(97736004)(6916009)(50226002)(7736002)(26005)(86362001)(53936002)(6116002)(6486002)(3846002)(52116002)(105586002)(305945005)(106356001)(39060400002)(6512007)(316002)(25786009)(6506007)(386003)(8676002)(99286004)(81166006)(81156014)(4326008)(186003)(6306002)(44832011)(486006)(5660300001)(2616005)(6436002)(16351025005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +JADJw3wnf3ukB1+1yW7F1RBP8WYuOqiLLc46a781e63fyjepxQzLpklsDmuJHOLmu/B3ZSKZmck90Fz7yaou1lZsVmJmiMCkdO8kGQXxcx3dpbIt1kCy0gBJLQ+ufLtQ4jJ0lo4x/DIvSvgcFNsjnKJB5IaUIqUU9I9ghDqoDP5HUr1oNB282NhG9Ujint2UbAYgWDISE7gVUqJrR1V+EYmt3P73iGw4t988/itdDBDR43qxGKE+CGN1/9lwQ7VBR7xbru8gRNVPs6c0f30wUt5uUWPJDjThpf4rlOYLkO29UIIeic2xIL8r40y9UhU
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed99960-ad40-4a39-5816-08d671cb5229
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 22:32:19.2901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
Subject: [PATCH] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 22:41:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/fts/fts.bb       | 22 ----------------------
 meta/recipes-core/fts/fts_1.2.7.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-core/fts/fts.bb
 create mode 100644 meta/recipes-core/fts/fts_1.2.7.bb

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
deleted file mode 100644
index 02f54086a3..0000000000
--- a/meta/recipes-core/fts/fts.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY =3D "POSIX file tree stream operations library"
-HOMEPAGE =3D "https://sites.google.com/a/bostic.com/keithbostic"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ffe358174aad383f1b69ce3b53da98=
2"
-SECTION =3D "libs"
-
-SRCREV =3D "944333aed9dc24cfa76cc64bfe70c75d25652753"
-PV =3D "1.2+git${SRCPV}"
-
-SRC_URI =3D "git://github.com/voidlinux/musl-fts \
-"
-S =3D "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-#
-# We will skip parsing for non-musl systems
-#
-COMPATIBLE_HOST =3D ".*-musl.*"
-
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts=
_1.2.7.bb
new file mode 100644
index 0000000000..7ede6550f6
--- /dev/null
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Implementation of ftsfor musl libc packages"
+HOMEPAGE =3D "https://github.com/pullmoll/musl-fts"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ffe358174aad383f1b69ce3b53da98=
2"
+SECTION =3D "libs"
+
+SRCREV =3D "0bde52df588e8969879a2cae51c3a4774ec62472"
+
+SRC_URI =3D "git://github.com/pullmoll/musl-fts.git"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST =3D ".*-musl.*"
+
--=20
2.19.1


