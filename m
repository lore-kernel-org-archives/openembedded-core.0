Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 82804 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 30 Dec 2018 00:39:27 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130101.outbound.protection.outlook.com [40.107.13.101])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE826B005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Dec 2018 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JpJXXUVEtyD6LSRvNazZamsJlNweGM7fCo2hw6UWJfY=;
	b=EskddjY4epLF0Bhxm2U70ki5EcdlfflrEiU1kbfXpaoY2cNEJPZL+hO8MuvCp/obR258F5Zrx4lB7O1QX3GK83uEvZDr+N719zVYPhCDAHk7NRJ1r24kx3Q7AcIV/trC2/lwX5XctjsRO/fwNonGWCYSJ4niujs5w//5l3MlL/s=
Received: from VI1PR10MB2736.EURPRD10.PROD.OUTLOOK.COM (20.178.127.202) by
	VI1PR10MB2272.EURPRD10.PROD.OUTLOOK.COM (20.177.62.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.26; Sat, 29 Dec 2018 00:06:59 +0000
Received: from VI1PR10MB2736.EURPRD10.PROD.OUTLOOK.COM
	([fe80::b416:4e82:94ef:1391]) by
	VI1PR10MB2736.EURPRD10.PROD.OUTLOOK.COM
	([fe80::b416:4e82:94ef:1391%4]) with mapi id 15.20.1471.019;
	Sat, 29 Dec 2018 00:06:59 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH resend^2] wic: allow bitbake variables in kickstarter
	files
Thread-Index: AQHUnwpquhLMeV6xGkCDGVeOoumouQ==
Date: Sat, 29 Dec 2018 00:06:59 +0000
Message-ID: <20181229000646.23975-1-rasmus.villemoes@prevas.dk>
References: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR1001CA0013.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f7::23) To VI1PR10MB2736.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e7::10)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.186.119.68]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB2272;
	6:OR4n0OeH/RDTiefXjxKG4TgRqE8bD6M25BO0o6AGdLEQxz2dp19KzO6NaPkVE6/31Y9fUJUeI/lYNhPbm07vzh9MCO5IqzgAVkCSfTw4toBcH5XpiAahqLjBmgvMySXXWpnYDLWeW+zow91gO2c1yNtpuO3NvEev1C1/OrtbFDvV6B1xBWFPtYoKYeoaTVUwueWlyJEOVy7pCm9xNNAcdfd6fIpqDYZ93CWV7iTPwtO1dWiAIPfGGrU/jvWpxNzvOO2Q+GEqqVuvQIJNM6Y0emhTu0wcNi63CVo8VTASBBgFOoQRod+ekZKkIyNi9do5YG332+nqljb8WloR0L1FjqlIWb+iK5JZvRlNG+NtV+yO7GfOIp4SxPkVgou7nHJwNqjAKM/nIIbfw0gbzY5zKAAc4qSTZNRL0SI2N6+QYR2izoC7MxfCYwPX3yOGCIAAppIiO58K4SNdpRXreAyvnQ==;
	5:mvX17D1lKo/2LE4KStADz64hv4DzvR0iG9jCE4hNj24M8z8MDlcuyCuRyDHOnO+pBruzf9GCpJj+G5RLyGhRk1FdLgfRJWSF1TlddsJXIQRYVVwCl40KgvRkv564eIO4CF4iTEDqFdWIHr1MIKIymXP7gFszSsiTL7/mxb2fms4=;
	7:043Q2vR5ykyo/oTQwYRIhdrQNJyn+MzLZjsYUeM+Mw5Oo+bc4xNvNR3KQ/DfFtGKwfhJyEBUOG0teRUhlZt4iMyvux578sXRlorcD16rE3jyewq3yOaWSzHjMAYhKFtItT379X5DdwygqULhwKLi0A==
x-ms-office365-filtering-correlation-id: 34659d35-6695-4159-8f8b-08d66d218d1f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB2272; 
x-ms-traffictypediagnostic: VI1PR10MB2272:
x-microsoft-antispam-prvs: <VI1PR10MB2272BDAC8D31957EC1474AC68AB00@VI1PR10MB2272.EURPRD10.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(3230021)(908002)(999002)(5005026)(6040522)(8220055)(2401047)(8121501046)(3002001)(10201501046)(93006095)(3231475)(944501520)(52105112)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR10MB2272; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB2272; 
x-forefront-prvs: 09011458FC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(366004)(136003)(39840400004)(189003)(199004)(71200400001)(71190400001)(102836004)(53936002)(76176011)(8936002)(8676002)(7736002)(8976002)(305945005)(97736004)(107886003)(99286004)(44832011)(256004)(14444005)(81156014)(6512007)(72206003)(486006)(478600001)(316002)(2906002)(54906003)(52116002)(68736007)(71446004)(81166006)(36756003)(476003)(386003)(14454004)(4326008)(66066001)(6506007)(2351001)(106356001)(3846002)(6436002)(6116002)(11346002)(446003)(5640700003)(6486002)(105586002)(42882007)(2616005)(6916009)(1076003)(26005)(2501003)(74482002)(25786009)(5660300001)(186003)(81973001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2272;
	H:VI1PR10MB2736.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +jh25rz6dm0vqctk2Z3+f4xavCvaYJ7/MEQcCTZcQIHDy5QdeSP3enLLKDWKsZecawQ5FxuOs24HiS5YVTtXva8trKQTGjmI2ngBWK9guTUznkRJhDLOFBYdRIHmmjBVZ8lzHqQnovrUjTHVQC5v2VMd3mj7IFQweIMWmA/rLLg0EkuPxIstniia/OwGMD+LjGPtxQFBn41/dT1a5xTLouZti0veoyzF5qoMJgECXISsiOWBtBWP9N1VgSChK25nRxSfQkJOyHmj+BuFLAWEukS1IInUOOEkJb1e8xuhKBhA3obnqEpSTBoyVSc+m6T+
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 34659d35-6695-4159-8f8b-08d66d218d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2018 00:06:59.1440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2272
Cc: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Ed Bartosh <ed.bartosh@linux.intel.com>
Subject: [PATCH resend^2] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Sun, 30 Dec 2018 00:39:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

image_types_wic.bbclass has a mechanism for doing variable substitution
on .wks files by simply letting the input file be called
.wks.in. However, that doesn't allow using variables in files included
via the include directive. This is unfortunate, because lacking either
the ability to include other files or variable substitution leads to
fragile and error-prone duplication between kickstarter files and
recipes/configuration files used for various boards.

This adds (somewhat naive) support for variable substitution in all
files parsed by wic. The user should add all required variables to
WICVARS to get them exported appropriately.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
scripts/lib/wic/ksparser.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7e5a9c5092..08baf76123 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -28,14 +28,30 @@
 import os
 import shlex
 import logging
+import re
=20
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
=20
 from wic.engine import find_canned
 from wic.partition import Partition
+from wic.misc import get_bitbake_var
=20
 logger =3D logging.getLogger('wic')
=20
+__expand_var_regexp__ =3D re.compile(r"\${[^{}@\n\t :]+}")
+
+def expand_line(line):
+    while True:
+        m =3D __expand_var_regexp__.search(line)
+        if not m:
+            return line
+        key =3D m.group()[2:-1]
+        val =3D get_bitbake_var(key)
+        if val is None:
+            logger.warning("cannot expand variable %s" % key)
+            return line
+        line =3D line[:m.start()] + val + line[m.end():]
+
 class KickStartError(Exception):
     """Custom exception."""
     pass
@@ -190,6 +206,7 @@ class KickStart():
                 line =3D line.strip()
                 lineno +=3D 1
                 if line and line[0] !=3D '#':
+                    line =3D expand_line(line)
                     try:
                         line_args =3D shlex.split(line)
                         parsed =3D parser.parse_args(line_args)
--=20
2.19.1.6.gbde171bbf5


