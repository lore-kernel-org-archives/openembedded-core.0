Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 4675 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Nov 2017 01:55:02 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0077.outbound.protection.outlook.com [104.47.34.77])
	by mail.openembedded.org (Postfix) with ESMTP id 099CD60290
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 01:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aN+qSzGxZeEF9+GXstKDkWvHsW+RbTs13/wuIYjwU4M=;
	b=0haqfM//WGkRD0hB7ZZ5MQhftpZbfeRO8zmpmz8w2g+/pGSkm9U/1RUamFOt/1Kc7DnLOmWLTNX2JkBPWOPaZZN6kmQQ0Nvt1au4FXA54NH6TUJDiHoR9S1HrEWIw7ttORCGlV8L6kEFUPA6fiwxIEqhtXdzghMbyNfJK4TK5jk=
Received: from BLUPR0201CA0027.namprd02.prod.outlook.com (10.163.116.37) by
	MWHPR02MB3280.namprd02.prod.outlook.com (10.164.187.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Tue, 7 Nov 2017 00:21:09 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BLUPR0201CA0027.outlook.office365.com
	(2a01:111:e400:52e7::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.197.13 via
	Frontend Transport; Tue, 7 Nov 2017 00:21:09 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.178.5
	via Frontend Transport; Tue, 7 Nov 2017 00:21:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53499
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eBrdc-0006Mv-87; Mon, 06 Nov 2017 16:21:08 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eBrdc-000829-4y; Mon, 06 Nov 2017 16:21:08 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vA70L57H008672; Mon, 6 Nov 2017 16:21:05 -0800
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eBrdZ-00081b-4b; Mon, 06 Nov 2017 16:21:05 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Nov 2017 16:17:06 -0800
Message-ID: <20171107001706.10052-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23444.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(36756003)(5003940100001)(478600001)(9786002)(356003)(6916009)(50986999)(50226002)(48376002)(305945005)(50466002)(575784001)(6306002)(47776003)(15650500001)(106466001)(4326008)(2351001)(33646002)(106002)(189998001)(36386004)(81156014)(81166006)(16586007)(77096006)(316002)(2906002)(63266004)(39060400002)(8676002)(107886003)(5660300001)(1076002)(54906003)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3280; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT034;
	1:n7g2HWhZzfdo2tiUkyRWyYEFlRKza0+ps4HTJ6upOcykG+bVU1rVmokrBJXhmd9Z6pdtJE/B80nbDQQXyzEs5xvEizbddsgxasGfP4w5jHXLi5u0inpZ0A04Poe0OCzy
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8e689e6-b27b-46fc-b6d3-08d525757192
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603249);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	3:CY9HOMZ6CYdNO9momrFM1S0+fqWBuCAviBkUY8FKJ9XxAegXTsG9wQ6buZwC7gdefEeh7Qv3HpdWTOI/8c58T4HOe4MjMSgnHKYNbZl08/EGGhCgSFEumyTFkK3NjCn6eKgnRCzNjHp5NqOYRAfW3j4/FjsbaRj0Wa17TaGGDWJMGT5zTPRRrP/vc5SLnQj1p9AaUvRIeUH7eVn+KlMsJxrxm6mu0YFe2eLOmCUpuSyXlPdVHI/zyKVxO1ooLKSPJztBQ/Z5GSGmbmKrKw2G9XrEwhvd0SiHTnsVzUAR6qOig9d3q7YfPHq+CKor0IxIYsxzn84Y3kAW2LZSkJZcldobcto19X1u8EMNsi1fnos=;
	25:8SycFezwKaY5m8/PB4SLkESwCFMdr1uT1CcofaYRsR1QX0q/tpNSc4ZFpbAeGowmim8dg1FzfTvnZ/nwAWMqe/pkQMGciKF5ThVVaX6UwZffdfR6o3KnoijvibjAC0U9US6VF6P7GaWlr4pyj+0i30mGHUiNJWqiGKYtZgwvCp8793ySUmy53brh1ENVs5wJWrPWMAadRb3ACPkTw3qO/u0WGi+ltxdc9qKDmKaQf1v+tyUKyfhbmlG1mu+KfAmBZPo0KJ0oPVDyzn4oXreH/yfdeH4i9LIYSzClLNnbtHLp2XBwT6bLt3Avi5JEq3xvxixq4EfWaqAw1488sC+nHQ==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3280:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	31:Ykt2ACaJJ57VTB0p2x3J/TRhJMHjW0kjbmv1BRFU5+gKRI+jzbssZktLEbAdfbj+J9PzZtgNXHWwZsDSc2A1Fav0dSRiTrpLehMAUw2dTuStrafI9viuRkF36Zq2j3LtnOLkU+k7+ADeU11YZupYCw40IoQZl/cU/RPMqf1ZGWh/lShAW1N7lKoBRQiZ/PrXknliJuUpJvyR5Xm5ZcKR5HY1Ni4jtHGD2l8j/HjF4EU=;
	20:Tpi3rNZVGxvu8MTXO2qD3v9lGWflY35JkHi7B5PEEMTrRJnVjf19jaxVoMhJO0zVzwhBNTRZcMabc8kCvrM9lU/OlwpcszuDGqt4m8a/bYVj+aklzZ2Wg7z8GADc5QOrNSUqm5IKDAOATnS4ZCnlxn88nmEpR2XAZSwfaKeqkO3oLKrW4gQGDinvLJ8r3u67N19A+b9VfA7IifBhBZ3U/NFJxXRo6kCeicgB99K87aUTSvy/gm6CI+sMHqI2Nz5Cacre56UAwc4J0eVVX4LTa8jenJarQBp2kQpFIbRKwoNPXVR1KOOolLpSCqw/zWZFXeNyVo1NZZ6LrK25fU3o7ZGArPZow6le2AShvix6fKBRr69TfVqbAi8o8c3YAOZQ/pI1g2V/VKSsaAX9+iAVYt7emy7qXAboMfbuC1Rjpu3tr5am2phfuOntJUwQ1NX/1gzr4oPC1cQepQfwJH82KjHGFm6xuxx0GDPJ2SaiEal8MtHff5c3YiFGnV3TgkqA
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(228905959029699);
X-Microsoft-Antispam-PRVS: <MWHPR02MB3280D392D444B2D876472219DC510@MWHPR02MB3280.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93004095)(3231021)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3280; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	4:a0OT5FxtpPXO+nJ8xTT0GuledgcVuS96+puu5cZUI4rutvIZVZrCIpygr83HfVuCO7y0de1vq61Uid125cz8Hk+3xqpQRyznLsJEKxiLLesl3v3Yt2ulG++B715W0KnnPY5Tz45Kgll5Q7aTmFBvEHoh+7bXOSGuxhD+rK5YMZqZL0j2/HjgtjopWHQlQ/3qOR+hV77QVb5iZ990gJ7AEMw/llzIdUsKo+gaxdjLWiox8wJfoUsLj6NNtfdV9OctBipn2p0F5Q2qOCw7Pzdfj5L6RqzMu8mSzzvd2D93fcp0ftY5royNjG7BxdnFVYxpJZWDe8b4ExkKG22E00JL851zg2Zwmb6ud6ENeLSX0fQ=
X-Forefront-PRVS: 0484063412
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3280;
	23:Zfbysvc8rw0Dey+GuooPSY/dxyVCGhpl8NQlndaDc?=
	=?us-ascii?Q?YWJw4tKZWoakryKrTxE2ID4QhOpbOXetV1YwVza1+hezU/rN7uqUzUf8kQ1t?=
	=?us-ascii?Q?aoDqGI44I5V1+ELV25cpLGw1AwupZwTgP10aQpV1z1KtnygtYWF4M5nn95Ya?=
	=?us-ascii?Q?Az0zhDDu/Ekh3k/Anle4QuFTmlAfPppAjS6tc2yjr0036m7RIS6aL6rOWV5f?=
	=?us-ascii?Q?1SsAfZoSRSMCPWuG5xYq7SF82pAR2zg1J1F7SqPPeOqdT11SOsDdMnZx169x?=
	=?us-ascii?Q?jutNE7VdFzQJwYn/e3QhP6hOM1Jz+1WVkqUbQhIN4IJnfoacK76iplJ6Bcwv?=
	=?us-ascii?Q?cotnMgfZ3QiuQotgo5KdrQBxBxjeF/CJ7NfetZ5m+l6gDB2DZc4de/jqQsl2?=
	=?us-ascii?Q?gJXyaAq8iJLbEVieNwMkPAodTFfMCIcqVSRaoU9u8rHjxM5WyIuctJiHIuVC?=
	=?us-ascii?Q?DI0N0d4On/Xat1k6fTppHYloutKMkUcserlrn5SVsUhromVVZ5ktGFzJKO4C?=
	=?us-ascii?Q?sIcFoj7ohiDDYQBc+63oIZPtIoo6Di3bJcdX+J/AHFhoRGXgsIOXrASBA1bd?=
	=?us-ascii?Q?KYl9vqSroHAdJ+1DTU3XgLhLwwsKWSj/fkS9zBXO5QTuiWD3uDf3xS4wP2Fo?=
	=?us-ascii?Q?W1IOBq8uK+AHZ+lPqENE7C0lMBTuVO/jBDSEGMjJG/Duii8tqXvOW2uTsUMe?=
	=?us-ascii?Q?CHh7iOOlyy9pSKajFFKFiKcDkDv+LByvTPeaKdKdGjjugknII+ur1lhP67jH?=
	=?us-ascii?Q?2bSO5PcFmYKen/8aaMmGS++6mPCNw0YzvDkJ9PCF5meUBlTgRMXxN6NRET5Z?=
	=?us-ascii?Q?8LR6Lo7p4VyA9CLBCXNE1/IdAkJf2TtKRpZa0a4LNEoH+O39VqwD2PGKU//H?=
	=?us-ascii?Q?a7Vu2gQC3Gg+O8OX3jWhSJeuHeyUlTqao58zpLy6sx0fL+PA7IVHgyCP7HLh?=
	=?us-ascii?Q?/lzApOMagI1RwvP5CJ29UXO2zkjYrlbXMb1o+UfNaG+llWHJxb/kK9wVf32l?=
	=?us-ascii?Q?tZ2SnFFSaJxXJp/p1wqXysGnK98Zw+l7Euz2rUZgc1UuS0TukKS3cqb513a3?=
	=?us-ascii?Q?/OJTFWw+ul2tBLBvxqNpXvKEY0AgzRqMleVmz86lLZGer6apg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	6:WtQzR5WZGCs4zkAp1O8yO9sMteeMYjJcrbIkvevJgdvCOxZHj7Wlrcpf8O9T6RoObOex/G3G2D/PPShfdJRBhCz8qkgzCZsN6+67VB7JEiC3009MjeGNTni9XlfAeLsJKK+oQL5RIC/TKY/T1WkP20GVHxollf0+g4SsMfIbcHvFbZBzxIr68D7CYGjvpZW7aRV2LDDRfVDWIq61XNmqb6mnevGgLiKt85w1mEtx7aT2O3eSlGbppaVjFUNBtTPV0NBQHg72N+Blff+hv1GoO/9+wOkqwwkzKfQhht8HttCwD69Un7DQZjPrawVMuI19ZscTwlw1omzP8dseJqDItTCFOdUkFsW87JrHaOaHAgE=;
	5:Wi2ReJ7yjfYtxWfI4l4v1BW6Aj/5E+veIe/yivzDYyc9gfU3SOw964uoYgeauub7mED7R9AOV8oVGzO82KfmxN+rfWeSuqeuH/Fgj4SDngfPPgcI/uVFfjTUWSDJ9o/UJgBE2t8xpKEOBW3asezIzEVSY+TVdI9qQbeL6nZfQpQ=;
	24:ROWmwniSjAYunEqwJMoejKBwP7Z+D8IOjD5w6FwddggtxMJG/lWKiPT2RTAFYOZFJsxjIO4ML6cL47cIh+ZJeq6SXlnHq0srHoiXVogVywM=;
	7:jQODNL5PhsLDbRqwWor3jDznTe3fZT/KYmwiwLxpQXMwWnH6n4ys5kvISfBUjAquMmwcrN9jxjvquDTN+LXPiaxM17sWw65VMMOg7zCu4fmVZow72ejT5HD5HNdBknqK3Lw1NEpYrRaP2dkvCF2v2aaVAAiVsOOWtScO9t6GGxn3bPLs/BTdvluz8tcGpwwxybKU2hFqmFa8J4CAIsLtnMhAfncrQOvUP7YPD5ci9zRhb9RCahBT2KNVDfy0Uron
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2017 00:21:08.7447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e689e6-b27b-46fc-b6d3-08d525757192
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3280
Subject: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Tue, 07 Nov 2017 01:55:03 -0000
Content-Type: text/plain

Update to Glib version 2.53.7.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...evert-meson-Substitute-the-Python-shebang.patch | 54 ++++++++++++++++++++++
 .../glib-2.0/glib-2.0/configure-libtool.patch      | 34 +++-----------
 .../{glib-2.0_2.52.3.bb => glib-2.0_2.53.7.bb}     |  6 +--
 meta/recipes-core/glib-2.0/glib.inc                |  8 ++--
 4 files changed, 67 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.3.bb => glib-2.0_2.53.7.bb} (76%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
new file mode 100644
index 0000000000..979247cbba
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
@@ -0,0 +1,54 @@
+From be007b2e6fbe93904e36ccddc707f96b30ad8300 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 6 Nov 2017 15:23:16 -0800
+Subject: [PATCH] Partially Revert: meson: Substitute the Python shebang
+
+Partially revert this patch:
+commit 0f18a2ebda4ec0440ec545542f9fc2f60cd54c5d
+Author: Emmanuele Bassi <ebassi@gnome.org>
+Date:   Fri Jul 14 20:43:19 2017 +0100
+
+    meson: Substitute the Python shebang
+
+    Just like we do with Autotools. This allows building glib-mkenums and
+    glib-genmarshal on older platforms that only have Python 2.
+
+The above patch stops using the hardcoded python3 enviroment to run
+Python scripts and instead uses the PYTHON variable used from configure.
+
+This patch casues QA issues when building Glib and results in the env
+string being too long (resulting in clipping) which results in build
+failures.
+
+As we always have Python 3 we don't need a workaround for Python 2.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+Upstream-Status: Inappropriate [OE specific]
+---
+ gobject/glib-genmarshal.in | 2 +-
+ gobject/glib-mkenums.in    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
+index ed6de0ae8..ec30410bd 100755
+--- a/gobject/glib-genmarshal.in
++++ b/gobject/glib-genmarshal.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python3
+ 
+ # pylint: disable=too-many-lines, missing-docstring, invalid-name
+ 
+diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
+index d4bfd11c3..051fce4ca 100755
+--- a/gobject/glib-mkenums.in
++++ b/gobject/glib-mkenums.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python3
+ 
+ # If the code below looks horrible and unpythonic, do not panic.
+ #
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
index aa5de27d12..d759ea1d7f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
@@ -14,28 +14,20 @@ from PATH though
 Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
 Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
 Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
+Rebased to glib-2.53.4+ by Alistair Francis <alistair.francis@xilinx.com>
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1af90c5..f6b7a73 100644
+index f322edfea..7cf86c2fa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1378,7 +1378,7 @@ if test x"$glib_native_win32" = xyes; then
-   G_MODULE_LDFLAGS=
- else
-   export SED
--  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- fi
- dnl G_MODULE_IMPL= don't reset, so cmd-line can override
- G_MODULE_NEED_USCORE=0
-@@ -1427,13 +1427,13 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
+@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
  	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
  dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
  	echo "void glib_plugin_test(void) { }" > plugin.c
@@ -47,20 +39,6 @@ index 1af90c5..f6b7a73 100644
  		${LDFLAGS} -module -o plugin.la -export-dynamic \
  		-shrext ".o" -avoid-version plugin.lo \
  		-rpath /dont/care >/dev/null 2>&1
--	eval `./libtool --config | grep ^objdir`
-+	eval `./$host_alias-libtool --config | grep ^objdir`
- 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
- 		glib_cv_rtldglobal_broken,[
- 		AC_TRY_RUN([
-@@ -1506,7 +1506,7 @@ fi
- 
- AC_MSG_CHECKING(for the suffix of module shared libraries)
- export SED
--shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
-+shrext_cmds=`./$host_alias-libtool --config | grep '^shrext_cmds='`
- eval $shrext_cmds
- module=yes eval std_shrext=$shrext_cmds
- # chop the initial dot
 -- 
-1.9.1
+2.11.0
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
similarity index 76%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
index b1fe600992..c3807a23ab 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
@@ -10,14 +10,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://ptest-paths.patch \
            file://uclibc_musl_translation.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
-           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
+           file://0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "89265d0289a436e99cad54491eb21ef4"
-SRC_URI[sha256sum] = "25ee7635a7c0fcd4ec91cbc3ae07c7f8f5ce621d8183511f414ded09e7e4e128"
+SRC_URI[md5sum] = "fad7444e5c03c9bd174140fdd5c460f8"
+SRC_URI[sha256sum] = "028efbf6df4d88d7725314456524b923169f4d4f8503347194b2baf2222f3e33"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8434b7dae3..48d3dc5b43 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domai'-like license!
 LICENSE = "LGPLv2+ & BSD & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://glib/glib.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
-                    file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
+                    file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
                     file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283 \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
-- 
2.11.0


