Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33253.1793881491094167127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KbaeHwsr;
 spf=pass (domain: est.tech, ip: 52.101.83.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJnFjRZ7AnWPDICIiGRALgBBkZXn3R08Lj027VoPzgGX8mBgeQ78fhs/m7dJVquFZGVxzdQ7cOHnSoJ0rQVZtDQP/9VvIlcttLCufAyZIo2dNoClqVfo6W8olKgk0J69dDSsb5DwpMmewCEy7aorU8VOAdbaJS10TEKIzItCtdT9hquC2plMXmCi+9AXhqsl44TwNyNwN1QqrhEqX/Zn1Vh5qUH5eIe+FZ5llROIVXM31Q6ybQ5i0cm6tJis9NUZxkvTf9qrrqtXR4WP+g99mbPp42LCVxy2WdxK8p5Wpx+vbIaUNT8pINAsFrp7tUhTP0YytAPIVvQ4+Hpp/zK5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhgIZ47mbZ9PO9YlmmqcVISSYk401bhypZavz0jYy0g=;
 b=L0Pckuln9DUo2xSM0GhtiY5Q3cSAqqGcZR27kxzx7Kbh4nBYS75gP+Olyva0t9cmhCvQB/8Xhr/yJbJtSWnEbHn+LbMzLoJk4YDFBnBAFaCSRzdZIy7EtS+VwwlXjXgnZkCV2g0YWvABzBD6MELOxKUvthPLb84dFVoGcQgyDFPazCQVNYE4oioWtQJ0xMNwrqMOPszoNxyNGPr9uINcceXC3tdjWtgH9q6D0SE52rKTQFkSyYyoleNsGZ/ckVZa1XFcz7+A3yxFUoYSPIYa278xAcGrq/V003rbj2giYm9Jq0qi/6A2/uXj/V8iRVDSnwm2olNcSTHL8m2r7aS/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhgIZ47mbZ9PO9YlmmqcVISSYk401bhypZavz0jYy0g=;
 b=KbaeHwsrXmu/c5RunT9VMwXFxazhE//TfjzSv96xwHW7tdQHOi3hrWBNYp/rzYhu8QYpSt9bkMwKDiJ0u3EV4uKS/HH3WatWVUVnAzLeQl7m62WbdK5fxWG0ozwe6BxLUhvjFJOQ1PGBoIWHYcHvZML1q/0FZ18mxfgtQ589Bq73M4Ib/RBCadopErtnz0ljDlPkPyh4l23aZFVNSEtYW1JnYBMwuhi1zub72QaCVliHG35SfHlFNeXJ4WCY0Gk3mvIYikPKT9SeUngswEZKr/+PjJF1bE487wA79PutspU0KrFMltBQi7MX+eUsO39Qc0r9XqAwKfZMBtFM4Fh9AQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB2662.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:461::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:24:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:24:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 1/4] systemtap: mark python3.stpm libpython patch as backport
Date: Thu,  5 Nov 2026 13:24:40 +0100
Message-ID: <20261105122443.53245-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105122443.53245-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261105122443.53245-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB2662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf54519-c7a2-4d02-bada-08df3b37c796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: Pux7N1QHkAXKsdP59XNeFw6RmXGAqtvXsVtowhfB10S1w3gg8j641uFYXh+ke5U6ESnlsxi1MbTNwpMj8/GLTYCK+dFa0TiuMNMk6WtbkT33QnL7yaHuwHPUGUdoQaafZlCIsb5Apiwr2d+KxwteYAlS8EDfzMb7evomP8VN19Z6Gyd+0XLIDds56AIB9MGBu1Z+j2VSVEJg6bNrOJj4L+/j97jJ6Ws7DRkPg68HQ/cII1vyFb2gH8rud1BS3+/bczBiAO6A7Fuc/4a7kscFUakWikcc7mfNt0iteIl9TidjPlYFPt5VfSXuYYBjSeaasVtjpiZRpvfrgU90aS1/XEgxy5GTnJb7eBhnyz4N2yibErfaej/+edJeSIbByRK04PyDYdA/nKwgUjKfENv2zx6d2WPE/7bwzdqmMIhmHOFj7U9i5Bxtqbw6skGnfnmBPwoX+AnMOPM7M64+jZeijnImKMf5rbqYuHtY7U7kNecm7bTD/al9BBbctV4+Ofh9LLMUgsnoG8RXNhjCWh04QBoc9kgVgfA9KCX7m+w15PNf9PZcwhVgvESPgs6D22yZuBaE14ppN7Qh6l8Cjpxj5rLaiYtxklNcL3GC4CMlgLrwA3gplDYaaCuKqoCSvWWg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v90bFnm+FyLQgIiwzJ69gvhLzpHag5N5XSLlZ//FBgpY8n+2frurvlCnNB4f?=
 =?us-ascii?Q?vH56qdWkIV5RnfbSCAPxUpKffISqi445zG9IAfcAF2BpluwaMu14C8CuwkZI?=
 =?us-ascii?Q?44yJOX/E8+dD/EGg8rmfGUd8z3eyK58rtF1mJLMpAIH042r+lft8mtvfJT26?=
 =?us-ascii?Q?hdmK2D/2QTBIupN3IVtQftx6pRb1zfq1NR6liGijiPPJ0c7VC3hB2XtTYUTG?=
 =?us-ascii?Q?GZzEN6DQX2wsI4D3dqW0AkdJZviLFecsBtjBUXNRQ0OFU2ZlF/aBg2NdTeng?=
 =?us-ascii?Q?ImRAdJZJNKx5mk9VxYtSMe4l5lXHGndf+OpSHrR2Z/BpMCzjFfNjeYMkhxTG?=
 =?us-ascii?Q?YyFH/tf3VwqU3V7dn/6Muux1XVOYHu6yDbBX1SKR+8WsveXkkzEBL98FQWoa?=
 =?us-ascii?Q?G29es/i7bHgcWFFY9JgyJ9asEA9o6wQqw3MZdn8xZ8mloN9GLIFmRF10Y+R/?=
 =?us-ascii?Q?1QttYLLCQF8HfhdIRcaNgxTjfK/xaIKv4s1j6T1l5ou4cNt8bKOxtdbH2E/X?=
 =?us-ascii?Q?CbSnTdYw1QaZPrBvf+Ax3SqNHtHsPa4T+FH+CDTTkDEDdI0//iMTtrrjK3fv?=
 =?us-ascii?Q?RP0G6hf9bWBeAxybtYGsVaq3cMPY7vChqwU2gwkx5b4MFbfrzRrLPWRYrazN?=
 =?us-ascii?Q?RLUbfZXmdv4EM3zwgLr3ZnWBf/31pqUjA0ygPpaBNn0ico7beli85Q9IM0kT?=
 =?us-ascii?Q?oTRc19f9+l3GG3UQaTGcmKa3Dina69KgFJpDzcBMdEgeL24O2+qrPs4SovIu?=
 =?us-ascii?Q?zhvf4Q6aLwxHg/HsFUOngd1gckI6GQLjB2y4/wdCoiD2OR5myHh5xK/9wc9T?=
 =?us-ascii?Q?utTQkzDDTHhk1W319sKPKXx3+O78FwDLmLvNHl9IwjxrKvfRNJw10TGZf8ef?=
 =?us-ascii?Q?lkDEPKNsXrDy6NnpmbtgXcQNg1ofEw4f+Cc8eBInDk4KVq9H5Xv81SmzlmQT?=
 =?us-ascii?Q?+EQCLQ/MnveL8+ldIr/W1RWQzJqL28RnIC+dGM6qzcza6aS3+/VUg+h+t5I/?=
 =?us-ascii?Q?W/LiO2v5R/0Qn/4KgSq9hwpK9vXb/H0PsoD2UjzVAWQuBYoUv1Sju+xzYbwY?=
 =?us-ascii?Q?31XroDYHwbGwoBFHvDl4/DBBZrLdtP/yXByaKhf8czcDVycrGQWSFsp+MBq3?=
 =?us-ascii?Q?028YXdsCwZn/VGkx5LRMrIMjRf8KGBKLWTIor7Y3LnHSThczDNG3I8OqMXzW?=
 =?us-ascii?Q?AiOXVK6XhQQPkupnTsJnuemULCIiJuzm5gXowT6ylYl+S2u/s8earmKNp6Cs?=
 =?us-ascii?Q?FBGP7Gp8nrHD/qJUGlwf2H58uUsOBm/40saZ1+WN2Gb7C9kSfi7cDf/YS3AV?=
 =?us-ascii?Q?rX6/woZxdd0T8JE/TKNXDre89B0Wrue4kkouB9fp9JJT0LLN5FYZcdGwIR5E?=
 =?us-ascii?Q?Z9umj0rptMWZuNNd+SgE/7pi3gKGfBRuiVPvK9uGWUW6oXL3I77QhevKQLvm?=
 =?us-ascii?Q?kw6UwKsFG9wXuwqUWCagygyWc0gI2T8yNGBe6fchhpJalXIQyG+vH1owZDWo?=
 =?us-ascii?Q?eSH9g6NAuovtJVlEK9Q+XSQNXeSGNEDJyoHjzdp6cyvLazWv8SXje5nlIO/w?=
 =?us-ascii?Q?KGqoaCnepmE1Md5Y7eoMtfKCFKCte/micu9XeWgE7Lc//kzyVNsPsE/hwB11?=
 =?us-ascii?Q?SbYOku2Z9spq/9n/gC8ZwCoW4sQjFOu/PwMQdrV41VGBt0J3baNmnftjoag0?=
 =?us-ascii?Q?7QIZvbbV63OWcQ1x3UYZ4JqgBgPDoQXX3OYlmi4GkUW+BGyn5k06YFBBdGaN?=
 =?us-ascii?Q?fPDGjHFZxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf54519-c7a2-4d02-bada-08df3b37c796
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:24:46.8783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1Fw/LDb+CHY364+sjopkeQE2RQBlbiiHCR3mMHLZVGF4OLpVMx1lmxnWxYxVxcJY0ptFDYAESvhsR8c8JCSBqFSY7XqmiBdFR9TYPHfiVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249545
Content-Type: text/plain; charset="utf-8"

The python3.stpm libpython-path patch was merged upstream after the 5.6
release (commit b9bd609254f5), so it is a backport now

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-record-the-installed-libpython-path.patch | 41 ++++++++-----------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-reco=
rd-the-installed-libpython-path.patch b/meta/recipes-kernel/systemtap/syste=
mtap/0001-python3.stpm-record-the-installed-libpython-path.patch
index 93efec941b..9759434521 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-record-the-=
installed-libpython-path.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-record-the-=
installed-libpython-path.patch
@@ -1,33 +1,26 @@
-From 0387b9416ad7c25d71685441e1046f1c72cb1d42 Mon Sep 17 00:00:00 2001
+From b9bd609254f54fedba0b7155c63a3b3f6d84993c Mon Sep 17 00:00:00 2001
 From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sat, 19 Sep 2026 13:12:44 +0000
-Subject: [PATCH 1/2] python3.stpm: record the installed libpython path
+Date: Wed, 23 Sep 2026 18:52:56 -0400
+Subject: [PATCH] PR34652: python3.stpm: record the installed libpython pat=
h
=20
 tapset/python3.stpm is generated at build time and installed, and its
-stap_python3_libpython macro is the module argument of the @cast()s in
-tapset/python3.stp:
+stap_python3_libpython macro is the module argument of the @cast()s
+in tapset/python3.stp.  @cast module names are taken literally, so
+the macro has to name libpython as it exists on the machine stap is
+tracing.
=20
-    @cast(@object, "PyFrameObject", @stap_python3_libpython)
+configure instead derives it from sysconfig's LIBDIR for the
+interpreter that built HelperSDT.  When cross compiling that is a
+directory in the build host's staging area, which exists on no
+machine but the builder, so every python3 probe on the installed
+system fails to resolve PyFrameObject.
=20
-@cast module names are taken literally -- dwarf_cast_expanding_visitor
-resolves them with find_executable(module, "", sess.sysenv), i.e. with no
-sysroot translation -- so the macro has to name libpython as it exists on
-the machine stap is tracing.
+Keep only the library soname from sysconfig and anchor it at the
+$(libdir) being installed into, so the macro names the installed
+library.  For a native build where the interpreter's LIBDIR is
+$(libdir) the generated value is unchanged.
=20
-configure instead derives it from sysconfig's LIBDIR for the interpreter
-that built HelperSDT.  When cross compiling that is a directory in the
-build host's staging area, which exists on no machine but the builder, so
-every python3 probe on the installed system fails to resolve
-PyFrameObject.  The installed file also ends up carrying a build
-directory, which distro QA checks reject (OpenEmbedded's buildpaths test
-flags it as a packaging error).
-
-Keep only the library soname from sysconfig and anchor it at the $(libdir)
-being installed into, so the macro names the installed library.  For a
-native build where the interpreter's LIBDIR is $(libdir) -- the usual case
--- the generated value is unchanged.
-
-Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-2-jaipaul.cheernam@est.tech/]
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dsystemtap.git;a=
=3Dcommit;h=3Db9bd609254f54fedba0b7155c63a3b3f6d84993c]
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  Makefile.am | 10 +++++++++-
