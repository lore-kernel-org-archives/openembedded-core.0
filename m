Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D91ACF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:19:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8930.1727245180647438019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9998c7229c=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P5CE4T004884
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:19:39 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um4xhj8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:19:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFfFkpAGzfwLyU0bH3cJsomgu0GBryhZ6eHLD7oVIlyIN1elXVDpoxyhl+hm850STfOWhk+qw84ablreU8sJkNszXewcMshzwRR/qhqOGszqCglAwmJhffbHQtgOYKIL6r9fLxni/4mQfV3f6QEjXC43ASVBFiX3YU1UPHT43lSvgmtqNfUYETDs1L8JqOqsU/uYMw7JxyTuU91gsLpvHdQp2QDUjrHXTYH1O4N6C5zHSGzIUmbB2WNjJSeNEYpkTltBqUB9PDc05xmfa5gS2BFYhPVk0ZZx0Ne6RQffEbbupwlc+qVrDxA7jgoGp97UtkYOnbe3ZM8yVKy7XhY92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dK2obYWnhXXEvTdqx28QzYGk5lOECbLjl32zfjHg4bA=;
 b=X2t/dZ/chnX25GM0Ic41E1qUny+YeD0nHozE1H9oAyyjgPhJToFz5szlmiTsFBROh47mKU/Cef4LpCL7jFxQgUhY43XB0MNJ5QxTi3AFWiBQf+R8JhVDYcDS39wkzGtBLpgvu8hQ/v180BTxSsZRbXS+EXMpt+ouh1SpTAaJ//LjsyrROWq+XQsRS8ccdCEiaXMF6CI5XAlcTx/BvUdxT/B0vtryc2XuN3PrZVpVbBOIVaiaX5ymOwj6e6v/y9K4R0S96zc/+0n53shquUZc4pwmZyPkyueZ6PSAjWrUfkeKat7MEM+LuCqnM7Me2XqSkwfbpLQPaECJ2fqo5j9mRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 06:19:36 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:19:36 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] glibc: stable 2.40 branch updates
Date: Tue, 24 Sep 2024 23:19:19 -0700
Message-ID: <20240925061919.2013743-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|SA0PR11MB4701:EE_
X-MS-Office365-Filtering-Correlation-Id: 971ff501-9a52-4e99-1184-08dcdd2a077c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CkFcLGO6MOHE4dr+Di0bAxrvTROeOMEPGrhDz7NgUm0eGkb1RSed/rp/y7hj?=
 =?us-ascii?Q?QBEDBvgGlzOxP4Dyb/yIf0a+4V21gsxN40GEeCCkh4Vo5r6fw8IdnZBFAIiQ?=
 =?us-ascii?Q?Y+Nmdbs6s4y2k4D0RuWi2umInWMCVhjIhbo0IHy1TMI1Nx34GZXYc5/npRsK?=
 =?us-ascii?Q?X9DyI11AS29zLlTFDIfYz7Z5AvrdLxDkQoG+Q53xqpm8AESuvifzZOERHzJv?=
 =?us-ascii?Q?ULbwC3hIhkSDQvxZRvtQ37twOwwmVqNP69rAtJ3FehNYxPFU36gJjfWe24Xv?=
 =?us-ascii?Q?WNoLUkLut04QQ8mjOH9hbZbTiRHIFis3pTrVmWsZPYl2FD3vLb8xsfDISPeZ?=
 =?us-ascii?Q?wIw91tERizuGUqIHlhxp8KM+71AwnPOfVCZO7gbK2xpEODGa/ORQOLkX17sk?=
 =?us-ascii?Q?REagog5fPKT4ypxNK8zPjUTEHMkFBDXhI8bxQCCk4v4dfYpubkxNEU5BKLoV?=
 =?us-ascii?Q?sRSk9L6D9Pyyp6uvu43lZIeeC+sG95w/u4fLlYdpXI4cfGuA+8MHt97QEJAU?=
 =?us-ascii?Q?wm5lbbomFWW65tPunkvzC6SWqgabPKSxr2hfAAgl7XnLuz1FzH/cJapR4WHm?=
 =?us-ascii?Q?7uq/MzuAYTbCS1ntlxBHq80Ce6LgK7rqXkUd9cgo//joB9WT3tHrSZf2Pyv7?=
 =?us-ascii?Q?JHK1pn7rBk8kNQ4nQF4po7qV0QLbT+Xea583BxuarXXNgZPhikjBziG11heL?=
 =?us-ascii?Q?1TSPKCIU4HlknMoHPhPxP3xlkBH6ESNPBSTf+el3C4E1nwEnD64AVAyHlX34?=
 =?us-ascii?Q?e+H+7dTSDyQbqQ0UrN6aCvner+fXc3yxr7mFPpPDMCruwGkV+RT/QL7jGpPW?=
 =?us-ascii?Q?myIJMVj1d5aqot8c5tYyx9omTEVMmHNGjD1Ky4GlvfqiOZEfYDjvDLZk7pLf?=
 =?us-ascii?Q?L5AYe5MyFZ6AjeY7jQ3doOj0fROyTk4DCjfsZXfiHfEhTC+oM+aNRmrsS7CH?=
 =?us-ascii?Q?5/WP+clg/B7cnEI2lUIQIAqdTKajKgK5g59ZLCQ0w7SJg7HUypk0tpOITZC5?=
 =?us-ascii?Q?fw/AHMAlnBYckhTCjuKlaY8sdcr9F/BU406pVmPvXG9/k0pFjtt42lC+XE/k?=
 =?us-ascii?Q?V+yqcU1mAb8x9qPC6UuXCXOJ94dbuQ3/Cvp4VRelYHwrQy0ZGP9DLDIlOT7K?=
 =?us-ascii?Q?qjHr+I+q4e2REFHGJqGKzrjPi4rmwdL2X0xXxLoDpDlRCtLR3TzKwp1h+mV4?=
 =?us-ascii?Q?eizC8+g2+Gi0mhe0y+skn0/U22Ooasghs+Uz12wezZcSReswq8SqIpCzvWlY?=
 =?us-ascii?Q?dRjvK4t0VwttyYgbQuMN1sxoMYbuZDlvYsSAj0sYVDWL1ERtyhJZFD5f6Mf9?=
 =?us-ascii?Q?4XGSd6/hIUWFYfWo9Z/q9iwwap8qr7Rgdp51biqKHpJ4iA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GRuScWXCvVVWpsnofjTNlj04A41xCkfv6S2lbAABFsXxGnC4yjY2FH1O3l7c?=
 =?us-ascii?Q?DPjOQYSI3c0k1vM9mR+u0xggi/QOGlRl4B3IVc7aH5Wsf5ApWKErSXomgzGt?=
 =?us-ascii?Q?pmp/+GMIqsHtcWY/oc30iDjxUJX7CosgSSoTbdzu+aemyZTnSKao3eCZmU9Y?=
 =?us-ascii?Q?sQGV7vxcMFkEfuaBL/a47egRRjN8WcS6oHPGQ6IldV+N0cKmRCjYDO3qDDSz?=
 =?us-ascii?Q?n8f7LVz/FjKCRINP8yl3dZrz6CKieBogwD4Uti6cNwoGkHwcGKPno3Wj9PAo?=
 =?us-ascii?Q?hOSpNeshZxmqdZlyQWi+qcH66h+SRseA3ThVPcuL8SDPZViGzlJ9i4+eHicU?=
 =?us-ascii?Q?WI7Wz7d/GS1lG9sS0mvn+WM8YiufuW+451DBtPta4lZ10PLl6mE5ioU/JPaJ?=
 =?us-ascii?Q?FiduyWIuFYLmFjI6mMfYOIaTkUVPy8KVY+FJePwmpPKVPCdfe8vV1GwcgqrR?=
 =?us-ascii?Q?UkLi6V6lcShnYeZbY/pgH3Es2qjCbCxWVqga09hiomju0LLCaQqS6pZMW/5h?=
 =?us-ascii?Q?TYgwHd1dbnkqUUq+r57DCWcKIY9j9bGsT6k/5IST4i7azNt3A3oV4CU/uGmg?=
 =?us-ascii?Q?0LSDaIGpboAnt9MCA9k07+tm9Hrt8MrXEqK5YjUZnJQTMXQRKW3vtzxKUKsC?=
 =?us-ascii?Q?fd4Vl3pNbqM4fefVJU7Q2Ku+cceumMin9oHDuvmVQiIMpkAjn5sLAaycW81r?=
 =?us-ascii?Q?z2Sdy8YlOEmcR1G2El+C5k3w3MO3mfzWrVRbUPjOA1YUyulnWF8jnQmXuTvM?=
 =?us-ascii?Q?uQtGlwIuFb5DC3y17h9VD5wO/qEPOjIMoYiP414U+U9GvkA5T2PHZMLx0R1d?=
 =?us-ascii?Q?aE8yDmL3rl+3QY2Q3MeCXzuU/xiPFlvILDBh1ucYasCRjW2SSD5jQiG1gvd1?=
 =?us-ascii?Q?9y5xTNO58/zXAQ1KPzWIIcyQJkfjabrYJPlXQEXVy74MfkzhJT4JUz6eBms2?=
 =?us-ascii?Q?AA1fFB5utmUvTYRU+g0LiZTJZlty9CRm52sNwdHdePb0bWC/BYdmXLqRHudv?=
 =?us-ascii?Q?clqhqZ+w15hFWjKm3gSCju/796MiZiM83Ofyl992w0uH2GQ/EHL2HDd2fM3d?=
 =?us-ascii?Q?s1hLDfnP2KVhThS0uEeutBbmjfg1XxOsCLPOu2WwLCUuoHKK2m/RW/2YFWmd?=
 =?us-ascii?Q?YZ7bUNwzGHESQZaf7JdcwWKVDgPl4h2wzbiVzI8keFddz609AO4Kpo3Qgb9A?=
 =?us-ascii?Q?TwsJEwgNh1qNGfy+nRXmuUqrt+3xa7l6m5m31/3ysE47nGTzuvdv8Oz52wrr?=
 =?us-ascii?Q?+B1VBaGp/oytkqY8ISdrDdPDA0+V9XgDWusrrUp/ezhnBi68g9yUmB9FMCaB?=
 =?us-ascii?Q?gVq/3MexWHpFdRQQaoF/7rvclNFizq1TR/M3aOgFNbaetMRiEeUxsSeaWWFv?=
 =?us-ascii?Q?8sRrb731dMDgbixE9JKSXRGn1n9Wk+1NrrjSOXjm7SKzSpuYqJ6PYv/8LbZE?=
 =?us-ascii?Q?ZviclSCs4BGU0WSnkXJ07gyW8HpzknD9O67Xs5Vy8wpCPiXLLMxPRrR0GsZM?=
 =?us-ascii?Q?eYpckL9eepqqPp/+VVo8YCBtRD/9ylUMV9N5dsUBkwAZkrSD/c5vUcrV/G2Y?=
 =?us-ascii?Q?RrX0s8+0K63UukAtqDF3lgAA6l4XqACz2lPRvVy/fgJXncCZEr3HvMDW6cXy?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971ff501-9a52-4e99-1184-08dcdd2a077c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 06:19:36.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWqBKbPkv9ztaiSbKqxZ3oycevHCoBu54HSNWRtiUmuXrCqEmBt5BjKLi0ljcnmYzMsavb9zflw9ROph+zdtpp/fx7aiVKhYClc+a7gwk2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
X-Proofpoint-ORIG-GUID: lTZqquTJn1mZCYR9s_dupR02lKNbg0Mr
X-Authority-Analysis: v=2.4 cv=e+1USrp/ c=1 sm=1 tr=0 ts=66f3ab7b cx=c_pps a=+bMTgItWFAhHnRFiF+AwZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=4pmsyirx9xFazBe9i4wA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: lTZqquTJn1mZCYR9s_dupR02lKNbg0Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409250043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204889

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.40 stable branch are updated.
7073164add libio: Attempt wide backup free only for non-legacy code
adfb14e71f debug: Fix read error handling in pcprofiledump
f4a9b6e97b elf: Fix tst-dlopen-tlsreinit1.out test dependency
f496b750f1 elf: Avoid re-initializing already allocated TLS in dlopen (bug 31717)
b7edcfa0f4 elf: Clarify and invert second argument of _dl_allocate_tls_init
3414b17e9d nptl: Use <support/check.h> facilities in tst-setuid3
3b3350d7ba posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
e24902f409 ungetc: Fix backup buffer leak on program exit [BZ #27821]
dac7a0694b ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
2f749d2b15 Make tst-ungetc use libsupport
27fb563bfe stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
bc240ba7c8 support: Add FAIL test failure helper
709319f9de string: strerror, strsignal cannot use buffer after dlmopen (bug 32026)
586e4cd8c6 Define __libc_initial for the static libc
c0af0c2ba0 x86: Fix bug in strchrnul-evex512 [BZ #32078]
898f25e0b1 x32/cet: Support shadow stack during startup for Linux 6.10
e3556937c2 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
39ee60a719 support: Add options list terminator to the test driver
5641780762 manual/stdio: Further clarify putc, putwc, getc, and getwc
6a97e2ba14 Fix name space violation in fortify wrappers (bug 32052)
aa533d58ff x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (bug 32047)
928769737c resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
ca53bc68ab Add mremap tests
2eb2d78ca7 mremap: Update manual entry
3433a35842 linux: Update the mremap C implementation [BZ #31968]
46f19b2342 Enhanced test coverage for strncmp, wcsncmp
509166c9a5 Enhance test coverage for strnlen, wcsnlen
132a72f93c manual: make setrlimit() description less ambiguous
65fbcfe589 manual/stdio: Clarify putc and putwc
5d2a931a81 malloc: add multi-threaded tests for aligned_alloc/calloc/malloc
2aebac5e15 malloc: avoid global locks in tst-aligned_alloc-lib.c
145b588637 Fix version number in NEWS file
b6aeba2de1 manual: Do not mention STATIC_TLS in dynamic linker hardening recommendations
ef14142663 resolv: Do not wait for non-existing second DNS response after error (bug 30081)
8bbb8d7b16 resolv: Allow short error responses to match any query (bug 31890)

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 61996781bd..c8614e3c60 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.40/master"
 PV = "2.40+git"
-SRCREV_glibc ?= "6daa77104520ca992a9369bd01cccd4d98c82984"
+SRCREV_glibc ?= "7073164add3b874cf0c19ca0fb84236f6bb0985d"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


