Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15436.1795097621061115589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HG7tPxP9;
 spf=pass (domain: est.tech, ip: 52.101.65.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg3ofR4BlpYUJm368GgSEOKWlurmj20u0NgkNBd2IlX17qxXvAp2a0wRJ7nLlLvgF/Z0ZI5HXQKssxjuqnF9D+A4wbRmxf5CrV5MeStScyC4QLyyzH+BxJMiknVyX3nEc/b9hkEs3tIO3nRJpy+5s0eWZiuM4N9ViWP+R8mkX4E0jj2FvHwQkOmONA+pE+akHu6scQZOSxW8BHfQz+KvlH1yU7PZVbXd8uIdBWDjLazNsXwTy+t35AgiLd4ho/9W376f2TdcQZkGsxRk8cgaIS/3qcCsT1U6TZvX6JS1bGbg/bAQTwO2Ane5tdQtNhjjjOp+eh6kJ/nejQwv5PU4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgyKtCengWxJXgt3PBUIvyoiLrR396ZpkSNCU8CgLOI=;
 b=Usmb0ne+FZjRab2u1H0KlUEvTT4b2ftQR7MPokXAHtDH+Pv/B04b1NwAvgvTMHl20tUomM9DiK91nYMVSSW7qbc8gC7qqnPga9w5Vz7jflTX4Fkp6l4Ak9wM6bGeTU2boKr6XgdGjPFj4rPVbANSXQKa5EiKIVvRXajaxef8xaWxTUAXiVyKiFY6V7agL6muYw9CClecYNVPDGLzKtRhpi/xK1mGucjqcOun3upMoJ4bvMQHW3Zlz3LcZ1cHuNCt4z1hakLyfYiOp1nIhCQvsKDxFR9V1yroM4Tr94M/yPzU/kmyhzVWISaNvf1fn8GqCrcMSFb3GyLh0Taywh38TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgyKtCengWxJXgt3PBUIvyoiLrR396ZpkSNCU8CgLOI=;
 b=HG7tPxP9YFS2padVkEYAnywqU8+Iuar7RUFHaAg2ZAA7rp6br5wcmUSAmB+Hq31Rp/oLaEKPgq8OVLQgTZi5UHBWqUpSQ0p8RqLtCO9wmGVraNUs2axZhi/4oP5mshRkkmwqJG74xj2wPICFq0OJzWyCuVjuuUvfsvNoHGpvQixSGOjYD2Y/D5x20ky6M9xWij+eEob8t1E5XGiwMPCVP4WHdtZsh2YN3BvVT21zO/bnskXGuIx+sjvFA83G3J6y1dQf4Z5bKAtFHTzuo45+8egJn6JFcPWUxLz0FkR5oQdxtVMY29H1nEIRcuCBy1PNUa0o+FG/5q++1Y34N1WNZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] bind: upgrade 9.20.30 -> 9.20.31
Date: Thu, 19 Nov 2026 15:13:29 +0100
Message-ID: <20261119141333.34492-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: f834a0f0-3c66-4c64-4da0-08df46474fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009221227099003|12006099003|261009223027099003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: AdpDmXaaqDPZV2WZgnUAwFgIccsvU7DNrXQFSuW1gGR1RU98bum6TxTlZfeopaOkHEVb5oYmirW9RfpchfKybEdWp3N87HXAa7bLmiDs7VXZI6db2GfkrhaBo5W0OIb9gM7OkdbzspAcIyrNbRY2Cui0ThUiT9vVqgmrn9908iv57ZF569CgF+tIlgSyyKHhO67RAWqz0N/+EZeqelo2EQlPhiy2H3OQJ/0XCXIfHMKG/Oi2O43bqoVr3rLcVsYNpJOH17yB6fdh0Wg9zTjDehNS6m86xXJHgZEkjqPrLqJlFoKfRJbcR2s0/wUsPXoR6AWJ8PEKicqo51JfVRAqKK481Tsak1E6prgiVuA1+7aQCWZ+jv2pHtgIZgxpJx8jElwubrq+UnjQWCi6ZhOPU1xiYSy+jkRp1QXxMm6o5HR8bEa/0g/0qi+9fxUDAce4lu34sQ/Slanm3+e/BVCITITO7Kwzn+ALA9rGwrXCDtgm9x+ipbGINvI519g7S50gsAtxndSxSRHBKkSAv8jRSpFX8n9GceHmVwnpfAjUyKXZHFSV6IBR58wnexDjaxvo/qPJUbopmx7fOMHKhXan9IlbuqNnDeelZbhOO0Id5ps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009221227099003)(12006099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aOre3UxdChSsfaL6pqIOnIWm5Su/MhK/eBh7f4DPpkeYnuG160ewzj9CWKhP?=
 =?us-ascii?Q?V3017UaYPt/3Ofn3SKMBXe3kIyq+SqEAD+BKzn8y7At1/kaVoMjSs5FW6MsA?=
 =?us-ascii?Q?FX9wofu9F17Ujsuee/91kLPXds3Z7Uu7Oj2ehyzUhhz0cAMXq/fJx11gZI+6?=
 =?us-ascii?Q?fDdBt4gGUgZFBK5Rsd3tbI4YO6a/LEQ4zlz/XuiB5R4hh9kvLm+A59IIaLaJ?=
 =?us-ascii?Q?efVYi7tfGnE3xmpsgIUO8L7C62Yd0KmEfFaYwwSlKKLvy05/vxgbcMk2sc1W?=
 =?us-ascii?Q?FbSBOWRQQTCQfNHy5FC6omdgcW0Qy+/A9kuE1tuGiHJ9zl3XCsThYS0Iz77r?=
 =?us-ascii?Q?qYPI8saO3IprKXOzT7OqARMgKBCZg7MOHt9uey4w4SIuixCUAiw1clumnDUq?=
 =?us-ascii?Q?cLq9S1EUGiISERIJY4IgLcVUWp/s/4TkakdTKfSWr0bWht9d7CZxAORIDeJJ?=
 =?us-ascii?Q?/kaLoC9AkzEsiUVkrEbf39hnpRy4QF9zsxiqnlxmdJBPuw5d4s0GgQd8lv4U?=
 =?us-ascii?Q?5uT5WxnPnNZUEn46lDh6U1XpDdBI+BNxgf1lRtlyRIE2L/55vFhkj5oA6ACy?=
 =?us-ascii?Q?eQ8agN4VnHvgTxwk0K9QVtC/ceBubSZ3nE975zseCzigO0N128gunb0Ww7Dz?=
 =?us-ascii?Q?I5WeM7rVnBijNgWQpeShQwZiqZ4m4JuDZzP9lJaRemRnI0llRKd2HaKsFOk2?=
 =?us-ascii?Q?K/stmWUsFofyInWx9sklm2yiy81/abvFFwwNn0FwBBY1IjA0elpJyKP03q0/?=
 =?us-ascii?Q?lHvCOobJgAo9GFJQ6V00IPtm5dA7EspA8GUwida9erMJGQgyaO/ALcAcJNpy?=
 =?us-ascii?Q?ybuq9vd0z0XNSNdfD7H7UG8wGFA255qLSxb6BlLKTBF+4JE+cb32fQkmFzW3?=
 =?us-ascii?Q?DoXhO1VP0iVywQuVt7VGYajWJQr7QiR1FWiWjrmEsEYs3KEzrAQjWlLu3JS1?=
 =?us-ascii?Q?19aGih0A5/hk9A1hy2rOD7YjYJnVV2jYfB7KcHMYaR59D26kNgv6mRiO6nns?=
 =?us-ascii?Q?yRxwtX2+vmVW4WaaUqw2i7lHjApEMxVKeVn8/fbo9f2alWlRNWFR7LWlLpad?=
 =?us-ascii?Q?/+WITQaYltUKA3jhIWzyn/ls/Ly0Wwldzwx/WX9OIe7Pl7dpcPlWwBNvsRBI?=
 =?us-ascii?Q?JTAeccI23nqVdLWcAC+ogll2hVtCQLGUsmD6kD8wTFZ++PpADBkjT18SGAdm?=
 =?us-ascii?Q?VVGp8xPD6zv2rlpHbBhrTwiHTpsF2KShtaM48nw9u1resG6D7H9ivjAJPZXi?=
 =?us-ascii?Q?5/F9nURD5beAPHtXbP9xFExeXtyag/ASac2NGkT6tiXLyCYFsofAcwvP9XfN?=
 =?us-ascii?Q?8wIyKYur/n0yNGTpZ5l40mCMVEdleD19S+BtMjCo/bfUffixdlOcXTREMTxf?=
 =?us-ascii?Q?EeDRVGhHVyRMbgjNvcUgLBOkPZNKG0xL2yGnHY+XvmMeIaooZDJo88HVHg1q?=
 =?us-ascii?Q?jyy3ysKZWsk+bktZqQo2XIZ5ZGG34WW8rUCydU19oxCla6ocxBkIin2DX0eP?=
 =?us-ascii?Q?l8Ao7iDnVuH76unmSwPHnYCg4MPnST5jcnx8WKN/mjajiY8TFCp3WEaeuY6l?=
 =?us-ascii?Q?jMTpBb2qNgzZ8f41UPUI4qwx38BBQHtrrQkEUtMPBHYr3MILGPRrDabf9Ic6?=
 =?us-ascii?Q?pKxFGUNKgYFyH84YF+IBw0VFnSu6FD1TDMq078OApIY0V9yegMCrDPoLO6Ps?=
 =?us-ascii?Q?QBkg254FCaPLaTWjIqydgudMBs3xE4AO8eLxIuiHjaf9uUeLv1xezk3y2jKT?=
 =?us-ascii?Q?xJi3u7CqXA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f834a0f0-3c66-4c64-4da0-08df46474fd3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:40.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fabZcqBoT3t2MgStjEKdGRQmtW9W37nbDUE4vHbDYRdEJGBhqf8WjscPxVmRm7LqloxaoHFnQA/6S2tD5YGKtJR3YqwhRW0ZsOilQ2w+utU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250675
Content-Type: text/plain; charset="utf-8"

Release-Notes: https://bind9.readthedocs.io/en/bind-9.20/notes.html#notes-f=
or-bind-9-20-31

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.30.bb =3D> bind_9.20.31.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.30.bb =3D> bind_9.20.31.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-w=
ith-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-=
failure-with-bind-user.patch
index d302bc14810..3a38cf93f14 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
@@ -1,4 +1,4 @@
-From 1c087c24e8162c7a042cf1f19ad313e0f3a21196 Mon Sep 17 00:00:00 2001
+From afe4b5d9a541f5efeb8011742cf3b93fb27dc21e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index eb0adcfabef..d8fff6ffb78 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From aa978a473328123575af0270dc1dd274050bdfc0 Mon Sep 17 00:00:00 2001
+From 1e61b2de8a8b08d189008fca9ddb06b6e841bcca Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch
index 5871fb433cd..7302c78614b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 525570781b873c3434df49ac753afca7c1bd9613 Mon Sep 17 00:00:00 2001
+From baad654564c727f12528783f4921f323c6cf578c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 4d02c6e..225f59c 100644
+index 86ebf44..bfef855 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTR=
A]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch
index 73300b46e87..4779ca7589b 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 4388bec9a8ebd7d9dded4b1942a5670cdaec064f Mon Sep 17 00:00:00 2001
+From f28e5124ddc30a24f2ef31e0bab1fbbd19b6dab7 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.c=
om>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 75088e5..4d02c6e 100644
+index 9993b41..86ebf44 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-=
connectivity/bind/bind/conf.patch
index f88f93951f1..ec45a611fd7 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 65c90b60cc9f30c383b8e30b900abd04bc977bd1 Mon Sep 17 00:00:00 2001
+From d2634205b11e4831d62b27ccaf382c1a3ddb2439 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-rea=
d-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
index 388335b2711..7716731396b 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
@@ -1,4 +1,4 @@
-From c58e1309e80449ecc1fa1fa793630b53c08f958e Mon Sep 17 00:00:00 2001
+From 045016c1e720c91c5e0821a8d64e550de1c823af Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-w=
ork.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-wo=
rk.patch
index bd6ada88228..2d59a54b8d4 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
@@ -1,4 +1,4 @@
-From ad9cb821a119f441f6131e01715d5e0eab368fc0 Mon Sep 17 00:00:00 2001
+From 198caf2507a3b51b11e3abc3a3ac27cd75152dab Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.30.bb b/meta/recipes-=
connectivity/bind/bind_9.20.31.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.30.bb
rename to meta/recipes-connectivity/bind/bind_9.20.31.bb
index 44f09ceaa81..d982b1f6fc8 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.30.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.31.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e1=
01e82e1e3b4fef"
+SRC_URI[sha256sum] =3D "9bfecd503ec79209d321053689c794da9f8dba993a24e9cd6b=
d7aa87cdf4122f"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
