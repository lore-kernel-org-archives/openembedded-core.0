Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18862.1792661699774749209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Fu4Pfn6S;
 spf=pass (domain: est.tech, ip: 52.101.84.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwOlDeKZrNdhTc1OzExu03a9jRL3zEcVqQqdAz/jzVPKyn3wwU3zFyp2ZXrnbb6cHj9RZ4Y84eb6efe6gudDZB1yRYnWD9ukH14wQqruPbhGw9Gc3YJNRV3UtwhQNCfu0qly2Q9bYdpb3NymFb0ffaoJOtKqvz4jYj4DjhoOlKeHjBqZFW1YpLbQM2qt0mcT5eUQyW8t4tQHBF/DLoCg6KOl22DSpDNqaAIWQu/3yNuOrAwxPfL0GnYGL5EogIkVxoxhxJhCOxEM1GY5TnH4UzmlzYC6+8UOiPqSGkWvWwfylpZar4GW6OoiwE/ZdjzlJHn0G5oyi955rZtdz5qWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS7A06Y+NaicBSLQhMC7tsLjyVb0zfWmWlHUl1/gYxo=;
 b=N8CIjBZvcGeZqiV2ov7i41LFbHCzq3ushJKOkGJr0cYbyApEa+JUxSJG3wyw5+d+DQIEK4/eeykwdqBoySk9duj5lDibIBqsvdJyHTNJTQKYnh2MQ3SS5bXrahgOXTfH4I0aozAAjLFdRbHzkswxTA0tgcwia8z4odBcrnLzy2smZLyjfseebTXwgLERQ22JqE4VLAy51ZpDXU63XNlVlXmg7n4324+1k96fA4IOM1NdOGFWecLRxk31PeYt5JJ51tFJQOVPwhOibpVgedYJgDVMmXq5ihC4HCOVAVesQZmgoLe9ifjpC7Hy7hNXAGLrBXRrpXQWTtAq1nerAsq1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS7A06Y+NaicBSLQhMC7tsLjyVb0zfWmWlHUl1/gYxo=;
 b=Fu4Pfn6SnFVMi1562JzFfDoCSyaNBAd8CwdcQz/rygj00F9KUSKwVxZdgsVWj/YEijLBxzbTwno2VssELj/WSU/+9vUTDyqIi3ZLFTBB0CrSKIPd8Cbq2gNP4s+5DHgfKEnK60tlpjOJtlGW7mv7ZuaVhZ+ADTA81tTkOKWBrSdWpFiNW8HgsNd97h6a3xwxWSeMEd/pHe87NTybjnRi5srQZRc4sWtOeOPAFwZ4yVxeC3fI7MP6jLhPunlHf6iQ780dq4DTI3Zf3rmgAlKyhdt7ojcEu62P0uZFvLBQ/kAWrALt8SOH3Hpt+c+PQA/U2l7fISfAir5P2BVXDs9CgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2934.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 09:34:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] bind: upgrade 9.20.29 -> 9.20.30
Date: Thu, 22 Oct 2026 11:34:42 +0200
Message-ID: <20261022093445.66335-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
References: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0339.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be27894-0444-4388-e01b-08df301fb84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261021121427099003|11063799006|260925021911599003|56012099006|261021123027099003|261009221227099003|260925022911599003|260925021311599003|261009223027099003|10067099003|18002099003|12006099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7NdxQSTnNnxNU4FB7bVHni/RMT79UJWGsOxz4y/JADkcf9EJG3bn3w7HanFpiq1psJAuSNVOvsaciLuLmCQjQWwQqpL6rOTVQmg0f/DmAOUot8FjeVnsh1bYkwZ6HvOrMuWBzaOGdtaD4SCeLDjFMNaUMwSElnac2p0KYLJOjG/sek0O9icr0NxMxT9BBLPrWWEmUEqkjVXBqHods9QWCe+i7wEByB81ebL0E/HV4ZtaP3ZsAsHj328zrfXwhYF0rJ1oJKhY/bYzYyASLHyJyA6Maqg0hmYuh2Yi/ghGP4oiQ03br/dv0jZvz0pFjPp3Bu/QF28CeRwwD/y1ld+hdbL3FGaWx+gc9Xvbvp6DgnJk84Fu9DVZpkbriiIYG8cBLF9LZu3pzwI13jWDlL9gB9H8JumxycpohMdp1NXugIa0OeeWBukudOBZTxFJMdbr1gWbf1GOt95pIw29ZKg33AigfWXPE3DZHh0LpdhimpabfRgmwalvIG1v5rJN0OqvvGbZaouLeUCQtlldwm0yfw4kw8Ga8YKP/Ob1uBmYPB3JCEcnFdTXuzbLNcvVV/TlHDeeXd+cXEHRtpYfuy/njJNcxFOtQ7IFnZu77jcJU8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(11063799006)(260925021911599003)(56012099006)(261021123027099003)(261009221227099003)(260925022911599003)(260925021311599003)(261009223027099003)(10067099003)(18002099003)(12006099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7McP0et4caaJ03jD5gHeuryZ5kyJfF/k59uOWa6Cs2g9UjYa2fJfzpxpG3jC?=
 =?us-ascii?Q?zQ+3ZGEHIxq4C5dktY6Bhk0njCeu6LBf7Qe/Liz2Ldqyt0OeqrOvq7kAw8Wg?=
 =?us-ascii?Q?v/Z54VRNFXy1mQ8I9J0ca3BYyep1N7k/Zd9I1vHkeHhxkDCfP3cayO2MMdwX?=
 =?us-ascii?Q?+CTT4a6zccBpUJWR2TkpYiIdU28CMDwSY+ubDZn2KuZjJyfjXm+qy9z2PAwj?=
 =?us-ascii?Q?1nDLojn8VYHaLO9ysRl9mVbMju33xSpqPALbIgUHxCXnWlbKu5CElAPIMC1K?=
 =?us-ascii?Q?NpbJSP5dB0/mrSEVYSpsd6Ty97tvhNOniG5JIJPNFTyWulDvwkcwswyRp9+X?=
 =?us-ascii?Q?zhYbWFYqHrxecR5s0W+REnzOw17R9IkUaTYSBs1OEfFUACf7zi++hixWtELu?=
 =?us-ascii?Q?Bo/z8g8kgfVaseo550nTVBNdYWbhtFMlppyK+AW6TndrSAcBpiovaROsZ5TX?=
 =?us-ascii?Q?xj6b50OxZxmWCnFXijIrUwTp7KuaVptPZkBZCXN0Uj/8RamKXWVWm77ROWjo?=
 =?us-ascii?Q?frpmAkv7gMHr4t8GnwGstWBU4U0Mn6qmz2fMjQq0aSyQhfUoFji/BppBuz7o?=
 =?us-ascii?Q?QjhG3IeCpI9JClH4lueQbqMiF3e8oJ406lZlvPFri1uFg/hIzFU/iWXcamGX?=
 =?us-ascii?Q?kgl+8ns3DF1CreENxdz7LilF3zz1ckmsDo/QtBQjSuXVia/zg7zz96k4aszc?=
 =?us-ascii?Q?KHbubdwdCYBOW1xsU3t+d8k98p9QJXAp+fLTpL9wJrkVVpuHikONuWrYlDZH?=
 =?us-ascii?Q?B4vrHm2jbonw4tQm9l0ktvHsKN7SckLba7azCbikrectZCWExQnS3+FlLCGP?=
 =?us-ascii?Q?FmrYEdIlJiRFVf2Itor0idgnvZcfw/6sZnvdnnHWfuZFyQ4VXs32/jyPFAe5?=
 =?us-ascii?Q?LwmyfBkRDtTvpsk7asEuv332Gb13izKtmWhEfCWq3+zu1/F3IQkVQBpqGh4q?=
 =?us-ascii?Q?HZADWxDKKl44uH/M6lu7xSFdPbmtYVo5cY6ETwh17YAzynVzH0rj6MuIjN7f?=
 =?us-ascii?Q?KHu0wXZqlGaiXvpmTniWXbPTGaIPqM7DvDxIeM4wIge5sRZoHyCv6felDuys?=
 =?us-ascii?Q?maato9rUge4JxcDfraO6/2UYsG+sNMy4/KGdPfNJYX5ewusGDbGgwi7qfaBp?=
 =?us-ascii?Q?T2Da3pL+Q4LYD59buSaPhQm8Jnr2QRs8OvWPfX3tead/L2HpaPeLQj5pKRpL?=
 =?us-ascii?Q?9qo8FZAZsq4p8NPleLprP/up1ejKBYtrc9sQg4tggkOPrlbjAiAnQzm8ufdC?=
 =?us-ascii?Q?ZOAJtt3/ywFh/Tk0Oqht1WkYfED6DiOUnESXbGUN0OMbLPXHZzvUDzGz/Sqv?=
 =?us-ascii?Q?dcDXUsHvowR4GQrw2If3MdDlKWMaKUL7w+U7VJu0SktvE7xDLeRsxX5ik+Ux?=
 =?us-ascii?Q?RLGEz2CxXzwN3cvQbU2IR/cBlW6+n7Pd65QQw0iw1c1UrfybgRBRcG33MgM0?=
 =?us-ascii?Q?aGMVk0afSn6EvuHOvqpZjuxYo07pOlzJ/bwgYG7ZYT0GBjEG5/qnh5ZhaoHk?=
 =?us-ascii?Q?j833/xxPLwbQkB/vHseXJ2NJa3xUEuEVIh1yyaaRQvlpkMWcSuhv0C/Lq47s?=
 =?us-ascii?Q?hStZmayO0qIADslkMafMkFZz2cc2T70vfe6CxB7tLaKhbKO+86tpSWJj1ZBF?=
 =?us-ascii?Q?/b+RUfEbBKZHH1KjS59gKsmBjTCHyY4ideFCYxUQqwUDCt+aMNGVzmiJF3VK?=
 =?us-ascii?Q?pctJNT1FqJHxx9+ywWoyJjLKALY21MicDIZArqtnFlEtq7qACfzkm+8rYqIz?=
 =?us-ascii?Q?W/O/wxilLA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be27894-0444-4388-e01b-08df301fb84b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:50.5369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8S8s9wpEcA7FQ7UhVXOcb+RWRsV7iP1RLRHDKYBXQxmxxeRMFTFvN1Q+yZmOU/hyDcK7JZukhXt3UOazMBMs91OKSvCe/0hPBZZzKZFP14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248431
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://bind9.readthedocs.io/en/v9.20.30/notes.html#notes-for=
-bind-9-20-30

CVE fixes: CVE-2026-19630, CVE-2026-96888, CVE-2026-97313, CVE-2026-94300

- Other bug fixes are mentioned in ReleaseNotes.
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.29.bb =3D> bind_9.20.30.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb =3D> bind_9.20.30.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-w=
ith-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-=
failure-with-bind-user.patch
index 15796a15fb..d302bc1481 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
@@ -1,4 +1,4 @@
-From 95141cf9494292fc5645165ef3d5e9e2ed2208c6 Mon Sep 17 00:00:00 2001
+From 1c087c24e8162c7a042cf1f19ad313e0f3a21196 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index 99e781799d..eb0adcfabe 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From 06e9624eb7e474a08ed7e1a456bfe9759ba211da Mon Sep 17 00:00:00 2001
+From aa978a473328123575af0270dc1dd274050bdfc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch
index 80a4f2abde..5871fb433c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
@@ -1,4 +1,4 @@
-From f28920a59b658fcda24efde1c45322f785a0b0fe Mon Sep 17 00:00:00 2001
+From 525570781b873c3434df49ac753afca7c1bd9613 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 0bc3965..e1c2b12 100644
+index 4d02c6e..225f59c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTR=
A]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch
index 323985a402..73300b46e8 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
@@ -1,4 +1,4 @@
-From f003f396067e6cc1e2ec609b296bb642b8ddf47b Mon Sep 17 00:00:00 2001
+From 4388bec9a8ebd7d9dded4b1942a5670cdaec064f Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.c=
om>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 26c442a..0bc3965 100644
+index 75088e5..4d02c6e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-=
connectivity/bind/bind/conf.patch
index 28ee4ae74d..f88f93951f 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 5fc3dfd3f994b5fd97e97837eee2ad808cd8af93 Mon Sep 17 00:00:00 2001
+From 65c90b60cc9f30c383b8e30b900abd04bc977bd1 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-rea=
d-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
index b373251c47..388335b271 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
@@ -1,4 +1,4 @@
-From 42c109317070d19fda70635b7043cbc6f9ec36ef Mon Sep 17 00:00:00 2001
+From c58e1309e80449ecc1fa1fa793630b53c08f958e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-w=
ork.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-wo=
rk.patch
index 74cf947787..bd6ada8822 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
@@ -1,4 +1,4 @@
-From 2e1314f2e71be15704ba18756250185b36a5c0da Mon Sep 17 00:00:00 2001
+From ad9cb821a119f441f6131e01715d5e0eab368fc0 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.29.bb b/meta/recipes-=
connectivity/bind/bind_9.20.30.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.29.bb
rename to meta/recipes-connectivity/bind/bind_9.20.30.bb
index c280d5b98d..44f09ceaa8 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.29.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.30.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "587029508b3b1b43229fae416c97e5543aba45809cefaca98a=
5004a02a5736c1"
+SRC_URI[sha256sum] =3D "9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e1=
01e82e1e3b4fef"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
