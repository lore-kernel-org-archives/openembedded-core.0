Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 25268 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Mar 2019 23:45:02 UTC
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
	(mail-eopbgr120040.outbound.protection.outlook.com [40.107.12.40])
	by mail.openembedded.org (Postfix) with ESMTP id 3885E7CF4C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 23:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gM02DPdkXFzlx+uHQqSQqqsJSYuQABTQPNtTY9nrpfg=;
	b=sgfpEtNFnRYXLljXkfHFW7CuM0G7a7EcLp6o6tN0pth47C11jPuBHizmMmuEcUYtrAU2w1t5IFAFovwWbfjYCqyXX2VWCU3rc8hi7YICrr9v5s+mAkbDOoxdbB3+D2jrbJXP3nfQMt4qtae92OMmjJ+XJflFL0hHQq+rVP9kYn4=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0659.FRAP264.PROD.OUTLOOK.COM (52.134.33.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.18; Fri, 8 Mar 2019 23:29:07 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.018;
	Fri, 8 Mar 2019 23:29:07 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH]     cpulimit: introduce support for this package
Thread-Index: AQHU1ga5OCD7jbUXk0id/IUOJTuO2w==
Date: Fri, 8 Mar 2019 23:29:07 +0000
Message-ID: <1552087738-14673-1-git-send-email-bassem.boubaker@actia.fr>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0201CA0006.eurprd02.prod.outlook.com
	(2603:10a6:4:3f::16) To MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:c::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [185.69.189.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bd0e80f-098a-41cc-f233-08d6a41ddc36
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:MR2P264MB0659; 
x-ms-traffictypediagnostic: MR2P264MB0659:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0659;
	23:YvXc3fQNlyz2xzo3MU9jzI8kz490r5otBoS8BHM?=
	=?iso-8859-1?Q?MyQ0ClErfILvEUhf09a6zxxnT+s0ZtKiusXKIZLag0UENwjp+aHAiEra07?=
	=?iso-8859-1?Q?8MZBf+Madfhd53v02u9zAJ9UA5bh9tYsDlTNXIqPR0n6B8zPP+20tv28pB?=
	=?iso-8859-1?Q?B7DAzwbEV7IHZeZazD54XxWKjTeUt4Y+5KpIh6HP6m7KXtNJk7uQtX7KVK?=
	=?iso-8859-1?Q?Vwqzmnin8H8mlCBnOkGMZg6YLSpmONPObeE+pPe5T2ZUtv2AvE6miJF7FV?=
	=?iso-8859-1?Q?mLHoKct/nPEipFaW5yW8mos3AEfsKVYgNmncwgdWEM4n7dQcHcOq5FFkQd?=
	=?iso-8859-1?Q?3HLtnqytyIBGb1lyKBu8uZ1+8WG4phO6djHPGW62sXQ4pMwC2jL0sXmVI6?=
	=?iso-8859-1?Q?Jv9urrphcRt93B2BUFnEw0aw/HtbVBWfi+V7HJuPCHIfwfm8avx0q6/KPb?=
	=?iso-8859-1?Q?/9aDrZjJhQa/zlpqtdKK9kXmevV1QsgcMqgAY5RXF0qm/j2wgpo4R5XmQj?=
	=?iso-8859-1?Q?E6KrK0lD2xbKtGZ9dsKN3LnCpbgPPwfyMR5QC/ajWE6UPZsPPd/JSRjXrP?=
	=?iso-8859-1?Q?ptFafMFX7jNskaFCri26WnVqxJEFLKkUvgawa4qUsQd944B4OA8FgwQvsK?=
	=?iso-8859-1?Q?4rR6hR10T1Q15cQwpfKX0+6SDhAKf0H4UGCKZYYW5DqZ/IzBV03id6dNKy?=
	=?iso-8859-1?Q?wuKs4VekNEZUmUBlN6sbqMgM8VkpxS+ixjKSI+mmfO/CrjYlBzHrLDg0C2?=
	=?iso-8859-1?Q?PU/7G90Ky1M/jwCHtYGXFEqeFYyVjhf2Xd5gvEPBjzn0/AXSWn+t5fgAfc?=
	=?iso-8859-1?Q?imFAYTq5dWQZXSZFzpR+DADRao//ZCCKJ5ShTjjQcCuv+4YCE/7KIvxDjE?=
	=?iso-8859-1?Q?l0OkUl5lWUyYpl6h3+5tIZ1EZJZw8NVpgDh1AMKtjwH9dGIRSa96q2QcfB?=
	=?iso-8859-1?Q?mHjZT5be72NNX+WT4WOwKHrq/cIznDeFu/DvRA9FjfAyk/2Q584FDxXEkJ?=
	=?iso-8859-1?Q?iye1fiLv8inmsZ4Hs/Jppsd5iQDZ98sv+7ATyThvtQJDm78QfU3ZdGegkm?=
	=?iso-8859-1?Q?xSyA83XJ2yRc0HncVHlmbks1PzdqFUzdrLGlyNMBp6trY6+Me19JntUyWF?=
	=?iso-8859-1?Q?sUQ3kS1i7+/ZpbpSZRSspxneMsjqLgGAAsV8vmaIKDkkBfxrks6xVJtMxk?=
	=?iso-8859-1?Q?iSkovu4pprU3057OFJt8PRuOO7sVb3T+eWEpTBw/7LOruCxWxvObzoRa05?=
	=?iso-8859-1?Q?LsS2KxDH0s7/oHJ54OCZXFM3X40B4apIqgtMOncAY7gty4dMfS/UF/r6l1?=
	=?iso-8859-1?Q?ws=3D?=
x-microsoft-antispam-prvs: <MR2P264MB0659C4CA45DA160A5D1D03FB9C4D0@MR2P264MB0659.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(366004)(376002)(39850400004)(396003)(189003)(199004)(97736004)(2616005)(186003)(53936002)(74482002)(316002)(386003)(6506007)(6436002)(25786009)(2351001)(6306002)(486006)(2906002)(86362001)(50226002)(102836004)(6512007)(2501003)(6486002)(68736007)(5640700003)(476003)(81166006)(26005)(107886003)(6116002)(4326008)(105586002)(99286004)(52116002)(106356001)(478600001)(3846002)(5660300002)(14454004)(305945005)(14444005)(8936002)(7736002)(71190400001)(256004)(66066001)(36756003)(6916009)(8676002)(81156014)(71200400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0659;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bTFTuJ/P47I7kTb2j0xNUJEiF2yJxiQqHWuKn3ktNNodk7HOtb/rEGMEWSTvc2mwDAaWRo/lgy9gUaeCqxtDZZajT0fycRymWGG+g8GI+LLekS/IqAtbWz106ruxlfKFHCLDTrz6upC45snUWlrgs+FxOWtGKVxITP+tC6bdgiKKQ001comMyrpab0ODLtYQuRfbdmHFgohwqjrZF0KA4QN/yzrtFw/p+8tPSJIkM6cJD0CRHu2frhmpyOe98srTqPmDrm79xGmuzwzznGFco/9PW0AzB++Pr6i2N/kzF1SMlYLLy0zo+nOB8pHpzTmcaiRuBURVTq4EGMA0XA15RVTZ9cs2MO/0w2MLNDgu1hmo87/43I5+LtHIuI0eYj1YyGO0YeYWd3wICq7OgcHde6/7c8wsb1aCH5tjbwMTzKI=
MIME-Version: 1.0
X-OriginatorOrg: actia.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd0e80f-098a-41cc-f233-08d6a41ddc36
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 23:29:07.7681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0659
Subject: [meta-oe][PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Fri, 08 Mar 2019 23:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

    * Now, cpulimit recipe is put under recipes-support. Binary will be ins=
talled by the recipe under /usr/sbin

	# cpulimit -h
	Usage: cpulimit [OPTIONS...] TARGET
		OPTIONS
		-l, --limit=3DN          percentage of cpu allowed from 0 to 100 (require=
d)
		-v, --verbose          show control statistics
		-z, --lazy             exit if there is no target process, or if it dies
		-i, --include-children limit also the children processes
		-h, --help             display this help and exit
		TARGET must be exactly one of these:
		-p, --pid=3DN            pid of the process (implies -z)
		-e, --exe=3DFILE         name of the executable program file or path name
		COMMAND [ARGS]         run this command and limit it (implies -z)

		Report bugs to <marlonx80@hotmail.com>.

Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 22 ++++++++++++++++++++=
++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/rec=
ipes-support/cpulimit/cpulimit_0.2.bb
new file mode 100644
index 0000000..d0c524e
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "cpulimit is a tool which limits the CPU usage of a proces=
s from bash prespective"
+HOMEPAGE =3D "http://cpulimit.sourceforge.net/"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb32dc=
4"
+
+PR =3D "r0"
+
+SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
+
+SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhttps"
+
+SRC_URI[md5sum] =3D "4f805fe26c8cf28e8251d64d0ace21d4"
+SRC_URI[sha256sum] =3D "544516d0d80c685b1df1344a71c900e845270551cf210300fa=
4d13876e10817a"
+
+inherit autotools
+
+S =3D "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -m 0755 ${S}/src/${PN} ${D}${sbindir}/
+}
\ No newline at end of file
--=20
2.7.4


