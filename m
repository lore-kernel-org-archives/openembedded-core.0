Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 28561 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Jan 2019 21:18:35 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
	by mail.openembedded.org (Postfix) with ESMTP id 214B8607E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yzthF2w72NShc36b5LJ/RIT7O7UMlr8KxO7TXDoUYb8=;
	b=x/UjGVZcv68Qr/SEOTp0pfQYYSs22H97F9nUPv2NoA6pLmT25P/sTrdozpZj9xXseQwtycWXkpHgY9g13PveIr+CJYK2y91rtTOaIaubksv3AbwiUTKbruYz38LQh6kihMtNgZZBUzDQv/gYR2OE/V+/Bzw1D4I+/QypRCKVLQo=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4379.eurprd04.prod.outlook.com (52.135.137.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.13; Wed, 9 Jan 2019 09:48:04 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892%3]) with mapi id 15.20.1516.010;
	Wed, 9 Jan 2019 09:48:04 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] meson: add aarch64 big endian support
Thread-Index: AQHUqABqVo65VJbh3EuvIk6O4non2g==
Date: Wed, 9 Jan 2019 09:48:03 +0000
Message-ID: <1547027257-22272-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0069.apcprd03.prod.outlook.com
	(2603:1096:203:52::33) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4379;
	6:Msa1M1Z2hv2r1UvEefC+S9HnB01nlqUDsVovAJAZfbD4n7bAjAZ9lPsCEUM3E4O98fgb66Qh3rWwHqBshjZj/zwcGd/g6prTP1Z+WFcfXAEgAN3h6LVP0oVTwP/Q+dIflC5dL9eqsm9wpllfwo3KAn+p1+clCB8WrEv296q1OxpmXMsV483w2b0fuhbAaHVr0yT7aYpA1mEv80TBQ6AyQV0tOU0WDNdnYttnHsiTOLG+aksX4h2Mcgmxn/VTChyFsjVMlpgmTZXkiY1HiZpJF1mkmmcqSnPwc68S+4wTPSiDQY+an8e5shFIAC/zhhoQGNoW8/2Ae4I8Tes96yBdUfaHSh9+zAcahJFNGO7nW9mJDdjPSYvBvHoHcSscTPUIousv57tpGPIl0qq1/za3jkIlkdU8vvQICz8/BxniT8yGQGekYziOh2RfVIz4De/a1XEPeO+vcOR+4XCiPWlISA==;
	5:/Y73fAd3WkzKnBYT8a57TQ98zIPVWLkfKq6v03n0Z6L+F1oJhiWGkULCjC1JmmuwzIjkDBsmWwBcyyFSxqAUscJrmccWfjXQfqtZ5DmgaCaInlORj80+lGLNTONzuG7BUD1RmAdtBUFfovnSJigW5EGtrbxwWDv15JNjuyQ0EGcOEJ2gWrPwC1EqK0eodeCcKTzkedQhlJNFlgfL5/aGeg==;
	7:VxFE9JBJBi3ohYSKboKP5LPhkPSm+rQPnlH21bUF8gdGLWHSgtYCSpxEC+Pg+Ptixo0iowZFh8vtljo6KJAjTVeGFNkztvkOzChTvO4ywYIKdgs+r2gM6qssDuoR0O5Mz2+cf1FBnWr+BYpGTa58Iw==
x-ms-office365-filtering-correlation-id: 6252c896-d97e-452d-9e42-08d676178cb5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4379; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4379:|DB7PR04MB4379:
x-microsoft-antispam-prvs: <DB7PR04MB4379C4CBFA65B7B61BCBC14D848B0@DB7PR04MB4379.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(6055026)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4379; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4379; 
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(189003)(199004)(36756003)(7736002)(71200400001)(71190400001)(6436002)(68736007)(102836004)(316002)(6916009)(105586002)(53936002)(6116002)(4326008)(3846002)(52116002)(2501003)(106356001)(476003)(2616005)(5640700003)(305945005)(86362001)(575784001)(2351001)(8676002)(6512007)(25786009)(14454004)(81166006)(81156014)(8936002)(256004)(6486002)(5660300001)(2906002)(6306002)(486006)(6506007)(99286004)(186003)(26005)(66066001)(50226002)(966005)(97736004)(478600001)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4379;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /yzGffBz/KBacri8VGWEw7k4nIt00U80R3mGURNc1u9srONuBsIBzYvaz9aHYP1FCwwb8ZIjdY5ROB0Zgi1P/3497cC3QWENjmnmxVBlPqnvnQyphGhaMaEzxJFZhHtIMkrQuyORvSoraUBMKvqYORlxOtDemd5RlAS0uFilHpWbn8Ao9RqPmG8cXhH6RbHTQdsaPvDqs1v8BcAJtTqPk6/qsVsT4YX1bYed7cY6oJfMzhWw6If8OdPAduzAtLnHpspxgBXzzj7ITJH5rTygX12Pg5xi8n+6EZ5G1sASXjiRmjPGvIeIHHrKToYI17/R
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6252c896-d97e-452d-9e42-08d676178cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 09:48:02.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4379
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB4379;
	23:9yo5r/XG6p+QgaHqzXDs88K+Jy87EQNpo0hbtaz3apD0u5lGAO7UhmySpOBfbtYOGjkAq8bRbdFblpwiVEHmPuAmlDqOeuBrF6bqTSPtVN82kC2ZVfpYGQ0dOmBhtE1oEkw+wxY6CjBBkbsa3+JL9w==
X-OriginatorOrg: nxp.com
Subject: [PATCH] meson: add aarch64 big endian support
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
X-List-Received-Date: Wed, 09 Jan 2019 21:18:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

*fix the below error:
|ERROR: Unknown CPU family aarch64_be, see https://wiki.yoctoproject.org/wi=
ki/Meson/UnknownCPU for directions.
|ERROR: meson failed

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 +
 .../meson/meson/0001-support-aarch64_be.patch      | 25 ++++++++++++++++++=
++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-support-aarch64_=
be.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/=
meson/meson.inc
index d37afc3..aa6c9c7 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -19,6 +19,7 @@ SRC_URI[md5sum] =3D "3c35b91e8040901034809576d54007c6"
 SRC_URI_append_class-native =3D " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
     file://0002-Support-building-allarch-recipes-again.patch \
+    file://0001-support-aarch64_be.patch \=20
 "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/mesonbuild/meson/releases"
diff --git a/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patc=
h b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
new file mode 100644
index 0000000..6206e11
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
@@ -0,0 +1,25 @@
+From ce7d006f7d962c9e1777392a98eed2f3984365c5 Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <chunrong.guo@nxp.com>
+Date: Wed, 9 Jan 2019 10:11:49 +0100
+Subject: [PATCH] support aarch64_be
+
+Signed-off-by: C.r. Guo <nxa13725@lsv07005.swis.us-cdc01.nxp.com>
+---
+ mesonbuild/environment.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index b4fc0dc..014ecab 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -74,6 +74,7 @@ build_filename =3D 'meson.build'
+ known_cpu_families =3D (
+     'allarch',
+     'aarch64',
++    'aarch64_be',
+     'arc',
+     'arm',
+     'e2k',
+--=20
+2.7.4
+
--=20
2.7.4


