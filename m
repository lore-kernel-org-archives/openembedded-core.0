Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 67811 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Jul 2018 12:54:25 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0131.outbound.protection.outlook.com [104.47.2.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5FD78A28
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Jy+thYxg+EWBMCkbD6Q2vmp63o2B1UwEXxdCkjHJNi8=;
	b=DpuGTKhY7YMfVkGHYth4whNIIf4tjG1ycCevHpXtqPPFVLJfGSiMkN7kXpDfckx85SbfjH6rK/udGmkfx9QP8N6pYmJby98kWV3mP/qAYCrEmoKYiMpwGehG4YUT1bc/o9vofcj5AQxP9zF+RhJyRACyjJ2obZWMACxqKdgHahs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	VI1PR1001MB1341.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.906.23;
	Tue, 3 Jul 2018 12:54:24 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:54:14 +0200
Message-Id: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: DB6PR0902CA0031.eurprd09.prod.outlook.com
	(2603:10a6:6:2::44) To VI1PR1001MB1341.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::10)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1b091c-fb71-447b-59ac-08d5e0e41aa8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1341;
	3:PXLh8Szp078vqx2x8d3CdgSvj6LPue/u831jGGJcUSHwTFIGnw+DP71XayeEAy9DxylP0/2R7vIo9ncEzxPS8w4y3TsJ8nwQdq7C7fN7V3zY/G7FgrkQ2oWKR9MhSScY3yn0BtZ0XfrdXdgsIHpPdrg1ZMenI5nnYOru7VL6eeTgXxNaLKc6pPoWCqs6B8sBiw+jpvepO1/RefM+x/3K+/whxsPd5QyjeXkhXkJKt8qbPmNDJexDHq0iCXz2NgYI;
	25:TC992010UKReMYsbLk6dEjcnvAruL70/U+xX/qZZlbBWq7Ko7igZ3+1V9+DusDLf30lFL82N5V1WUIIQLYK74eukmJw6aOS3c9la1TtdC5vs3DHVrowB7+Dlzol4EhouT30dwVWJa0vUdmz7c9O0K2KanV5ap32wOgc33Nh8F+ICI3eNWj3gBLEuBMhHnRi6IpBvMS9xmdeI9pq7bR663Qrr8xikNH3cnXZc/KXciXQfYINzkpo0uqKhGlLxlmToIPB+/N3/RY03L+scOm6tQq0DVRbzGdXiv79nvAB3SVPNNeUQC4LYHvBMo38AisJog7Zdn+1JRB8VbBAIaET8bA==;
	31:Jaon44PbOQrdJGgyl2lwqD9Gzw5SWzzHKSEFGDT6oGUBYN/1D8zhxBXYZJr0COB6SjMzxbDuVrfLKSPfqPBjSItP5X474nQysMkm5aZi9lsbyToY6wniYYGlWOCZ2Nj98i2UNbfe3yBFJ9fuwABxVhXCroT2+aj29thjMo69pFt3cIFu29yr30asHCRNDZ9CJ+NzM+sGhBijLvizObywiXLAsyCY6ykIG5mcexlhKsI=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1341:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1341D00EEC27E23A5E4CBFCD8A420@VI1PR1001MB1341.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1341; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1341;
	4:pWirDTnLwW7KRaIonlgAT8wiguQ9jPMPSY0xKCEt6ehlOX7QrOOu3aDW+a9ufXDLNmZdQ3r2QMsoG3YlNkXrkrTTL+epjdthiqw+CiBPCR3p/kD1IyLstDSkfvoaiU1Yt7I7I+A4A1TU9yjE84Oiv+cpGoLpG1cvTSLAZt2WoJIq80TDBFJFZQ7aCBa5ifnHki0+ggsCFjlm+MTSCGl01Lsw17XqiQyqbK+psv5g4M/KOs3xkmteITusLAHDO4g88jCG6V3Sk1Oe/IsPEs/4Ow==
X-Forefront-PRVS: 0722981D2A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39850400004)(396003)(346002)(376002)(189003)(199004)(2906002)(305945005)(14444005)(69596002)(8676002)(81156014)(316002)(478600001)(16586007)(6512007)(47776003)(7736002)(66066001)(81166006)(6116002)(50466002)(3846002)(8976002)(72206003)(6486002)(1076002)(53936002)(74482002)(6916009)(48376002)(6666003)(5660300001)(106356001)(105586002)(53416004)(50226002)(68736007)(446003)(956004)(11346002)(8936002)(36756003)(42882007)(486006)(476003)(44832011)(51416003)(26005)(76176011)(52116002)(97736004)(107886003)(2351001)(2616005)(186003)(25786009)(4326008)(2361001)(6506007)(386003)(16526019);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1341;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1341;
	23:kt4sUwPoEVQn972FlZ+Ero4xAcEVBj3c+xnt/63?=
	=?us-ascii?Q?hUtGsOPsqosi/bvXghsCLX5nvZggGDygK4zOCZTSH4IjKpkwlGWQpZedUqWJ?=
	=?us-ascii?Q?zIUp/zxyMC5m5TnU8BBYKfTuaXGQ2oIu0CrLe7oUbCS78SZjGPOIfkq504bb?=
	=?us-ascii?Q?52Ld7ni0rpejUCPGHgiwdJuyg8o0ThEzZPIn9524rxs+H1totKS1lyEIlxvu?=
	=?us-ascii?Q?LfIMZ1NgSFI0/5EsHC/plMQRv3pVd2RAx5nuBRAsZQCeFEywhgq/Knpc+7Bi?=
	=?us-ascii?Q?Tt9/YB+Y4BoHPfGZY/ajP4ITXQgqthfRshw21p2FEVcO1WCk8GmpT4pNfTNy?=
	=?us-ascii?Q?SE2l6H6GafyAEb9wKUUfy/eW5thZgaRNxcAvJHjH+k1COuqGYApM1814X1xB?=
	=?us-ascii?Q?nEwfd9eH130P0OQzB43Xt01eKey6qQAl6pAMnGB6tQRmdYHvia427GOJ/zBU?=
	=?us-ascii?Q?xVKv0cVfue+lR8Cw0ZeFztZitN+Lfxe1dh0jpWF24zLerXuXZJ41MnqLY9Mx?=
	=?us-ascii?Q?HGqAUA2Jf+MSzg66cdudm9HNy2N6yrQJMRG3bDjKcsE7RbndTPj9uA9SGRHu?=
	=?us-ascii?Q?8gCTwuQ34b1+jtxpdvKFVN38CRM9LakERC8tFIxVIsNq7w2nmFBbEnNgjY1U?=
	=?us-ascii?Q?HQF1avjoIUxCHCLY8MbTb9eJElzVGg93NQA6NQdtWJJq9CTq7GTk/Ws9bmR4?=
	=?us-ascii?Q?vC75NwzPpNGSbjJzVuZJnG2CS2vl5+ZnFYKidlwsn2n44NeeuXxXQynXfyxD?=
	=?us-ascii?Q?P+LvBJDY2hZ/qDEMEKcoBl+qX5y4u+gOXMqywdg1YTxibh/ItjD4NbKMG9Tt?=
	=?us-ascii?Q?wiBpb+4mg46BoYxJnD6nfpE5t3sqayhzyR1E9ndfOreYH7d2zVEi06ig7fvz?=
	=?us-ascii?Q?fUc6RTJ/s5H5hUStT159iZCtwwUFsvjDR8vl2Ozcf1D622hkK6q3V16/K6iF?=
	=?us-ascii?Q?duNKK9XS37fTgu5K8MukFhDP0e3TkimPr8BJApCwdF7UBUnKtdmmlwy32mdG?=
	=?us-ascii?Q?lKykKxJxzNwfKp8rIuGsqxSbweHo18Bnti2psAWqQHp/q/xdqq6wUUln9OJ6?=
	=?us-ascii?Q?sLio7hEG3nunJneg9evGMmbp230uAMPHbMtaM4VQAMzoOQrplmsCXFe3zeMp?=
	=?us-ascii?Q?OkE8tjJZkr8+61KcRUBtIwTVPz+FNaOY7LX4NUcC/bvTZqYlJvgTnsVxlY1e?=
	=?us-ascii?Q?S4pnBZRRsmeZfH3hd2G2ctYGDPWQbjKRy6tcL0d9Xm7MRGvD1s/WwqeWcEm9?=
	=?us-ascii?Q?hTa+D5pDWWeNI6UkmKwdO9cWe+KOh7jtTBy414emUSht6z9fdRUxDxWaKYAm?=
	=?us-ascii?Q?FslPbDTJmkNaIDrZRpolLlTC3Fxk1/qBPqO1nr0TIkOhojjR4inELk8nyNNY?=
	=?us-ascii?Q?lAp0WY1POGY37MrFB2poZ6owfSPCflgE34OcmNOJOFJrGFGUv?=
X-Microsoft-Antispam-Message-Info: MdHYt4Iy0wZT6FSpjzIyg19jN3MbKmmXZHxmtyuv0pQh/RwHqq2TllWmZVL/uJfuWJPXZAZsnSeajttHhMe1sxm/Fo5l3GcuMNhB4xvgk5FrgMg42wEcvDFJnUjpPyhEXiCraAp35OQlWnvvGGQcjbETf22W3cNMWGYcBHZ383wkTtzxFkJTXzZ2tY/jNNXTeTKeMUt7jsi+jtm5W/i9oGO5ldELeBB1lpVwjOGG6hC/Q6Moh01qirTMjduIWN8j1EdLyiqR1GJF74kLZWRsfWlqVjH354D3HlZPMblrTzcfM9GnyVry0Z297jsS6LvT8V9RyZBenYcTEiC7EnoSzPNdZrok2ZqorTIAer8pleQ=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1341;
	6:w7HQX68jzpXBZlrX1zWyXylY6+nRzP/ygFk2V6x1lJKXfsOtMAnyrLCgTWuxMheGARXI6/pOwrbLS3/TIVrihm24JhNmcsFN7qamx712uhZJzXwCcFoFsYm4DGxrYEK+WRioVF1xXAhjsqUxEI4FAJfuKotv7+rPSEFD8skFeJYHNLP12avvOFcMVRI8Mtf0ybvLNCsbBJDeLi2CFfkILJ+JqnqkMBkSak/x+wFliSpPva0V7sUZ/+gtx4m/Mk5i5p0Fq1Fef67py4fF4Mg86rCi4pG1c2MPjnXlRcaStyB1s6cocfzvaAp+H4Qhn7vj70eb86KFYottikPiaLqTN/acES6gw6XlmlEUT16nXtNMVgJEXvOWFLWoQdTXtLElOCChya5TbEN4Qcep6sKXOkBqS0ee79p5Y6Y76oeqM5mfGt63VD6pDOmK7FlohMV8otEQtdFZbiVH7btzLLTICg==;
	5:Ka2bGwWdD3BSzt86mW0Eq+htmbMkMfm61Lv8C0RkRER/ooYXOlJ+YOZLmSUDkz2j41zV7UkJ30OpwDCimkMXIJS/suQV7PR67+1Fkw6Unq4NfBTsq2fs/f05mgHPKMlLYFn5oUy8dFfkXzi1K28T///yrc1yl0PQ/qrQAIdUi34=;
	24:HSgSbjjtisD9xmyFsrCsQJpP6K5fnputX5vUxmfQ9Wk/68G6Odjw0K1QzjrbPDbvQ6/xnw43BKYiLa82rf9bl0ZQT6fRDvh4kWfA3bHNxHA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1341;
	7:mtdcaeRdoiZkLLvWPoXyuZIATeMesLO9tpOMzYIyrjIUCY1dUfZQIdz26afmlrDmqgZykrATJjRuq3LkrHhku0PCeOPnlY9qrL7NnPKEPZoHn0RLDHRPfDmdokm9Kb3AkCPRIc4CDN4pLfvSuyfIDqTC/NDOu3bTaWL57CazzDr+oyFbxF2RBmGS+HyuclMMO7zRhLPF5ywKtPoJZoa4g8Ls/QWM3N/3FJDFAhaaJ4BTWcZBjzGVaBSamCIPsP9y
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2018 12:54:24.3449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1b091c-fb71-447b-59ac-08d5e0e41aa8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1341
Subject: [PATCH resend] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Tue, 03 Jul 2018 12:54:26 -0000
Content-Type: text/plain

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
index e590b2fe3c..3dc17d7fde 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -28,14 +28,30 @@
 import os
 import shlex
 import logging
+import re
 
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
 from wic.engine import find_canned
 from wic.partition import Partition
+from wic.misc import get_bitbake_var
 
 logger = logging.getLogger('wic')
 
+__expand_var_regexp__ = re.compile(r"\${[^{}@\n\t :]+}")
+
+def expand_line(line):
+    while True:
+        m = __expand_var_regexp__.search(line)
+        if not m:
+            return line
+        key = m.group()[2:-1]
+        val = get_bitbake_var(key)
+        if val is None:
+            logger.warning("cannot expand variable %s" % key)
+            return line
+        line = line[:m.start()] + val + line[m.end():]
+
 class KickStartError(Exception):
     """Custom exception."""
     pass
@@ -189,6 +205,7 @@ class KickStart():
                 line = line.strip()
                 lineno += 1
                 if line and line[0] != '#':
+                    line = expand_line(line)
                     try:
                         line_args = shlex.split(line)
                         parsed = parser.parse_args(line_args)
-- 
2.16.4


