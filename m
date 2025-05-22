Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94963C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 08:15:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19024.1747901741856765710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 01:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7237718411=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6o2bC008750
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:41 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfsa9v4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nrvbh/c4sG9cyr/AwzFJd8AN/X64L912f0ZLDT8PDJm9zwVZ0ASWoYKHgccyTEAgQGeSsPbHiZO37GaVcXOUG1iSRfV9yzmaqp2nSYOvXQg+gNo0nV83byP1qjKdRHDe8fa1czMKR1sBtMu0vJX3OueJbg+2mt5ZOk3EfYs1iFdzZjdYpcUVTqnRKrU6Ms/wU100PQp/ybTIC7c8tIP19/MRqQARj4jGUXEANMfRM4Z7YQHS287YghBAp1vkG/ykioWLH4ixT8ReEMBRhMuOFnXSzdJjuVmkWXjk7+S5JakQYgh48TVtacESvbXPO2TZJS2qZmYSb4tFZbu1JSy2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC2/ojDIae8nr8hYpL1dzJ7K2mccCaNF1QIQxNGU5SM=;
 b=P5yij/1h3ZYPgjS9XnEvHtUq1249JcSznJkmGtSWIZsPqo+MvI8p/J60CqURXurHo1ClTkNg77c3zqkRxAXmgk+RibvIjTTuObQ7cls9vau9pdQmWV6jcOGh/eZn4wWwTmJByFsbtWtcMVE3KaHm+5c3LL5AeJ+RM2XkBKsNP+J9B945B09kl+XKhMkVGJt/03g5L4qBosDBw6l/SWLl2U968E2e8lZBjtw10b+H7G5M8eeCDvd+iDvvwAoQnPPSwlCZq4iMULMiqfWQwtp69gEcwd2pRt+QhlgbvhxzWa2ZFJrtpc4dtl5JwnqpStpFffZkoZhFg8wmCyqCiptuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPF2720D4410.namprd11.prod.outlook.com (2603:10b6:f:fc02::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 08:15:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:15:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] gnu-efi: upgrade 4.0.0 -> 4.0.1
Date: Thu, 22 May 2025 16:15:11 +0800
Message-ID: <20250522081514.552836-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522081514.552836-1-yi.zhao@windriver.com>
References: <20250522081514.552836-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPF2720D4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0a3a6f-b614-42b3-db91-08dd9908d636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dOjpTkEDdZ1CH2R0Yu/S6OHingVOjexYvUzRpqdoNYr+vyx4o4JCapqvu9PE?=
 =?us-ascii?Q?4ADOUznkHYh9NZJ48RqL8zr1L5lpQ4pBE/YrH9ED5nnLHSt5sAgCAbFaCduN?=
 =?us-ascii?Q?mNdi+lcDLj85FFwlrK++eVt28RkElhRkoiK6Zl7rT2I7u5Rt+YvreFl/czVc?=
 =?us-ascii?Q?UJ1MFl10E/EhygeESIPtnNO135HkPzS1jcFYeTFu7IaCn5I7V3Ae2++Tn3t9?=
 =?us-ascii?Q?W6jxamGdbxhaA+S+oqIgA3BJer5VcmMxKPyqmhNg1kDZYVGToDWKR22ozZfO?=
 =?us-ascii?Q?QMpw5aG3QJDiAEYY0WhlCOXr52kbMG4iwS3qtadnxTMVxTJ/5eAx/X82LHlp?=
 =?us-ascii?Q?HrdMrrln1mnU81Kz11N+FW97ujA5E8I3YHgFSTE2pq88RL5LMGahzOTAg7Pq?=
 =?us-ascii?Q?zvvX57xU6cnplL5jQP/eN2X42miGDa2svzkNNgJ5UNJWvSTJkPGr1zdiWnHT?=
 =?us-ascii?Q?jMxib281D68CpXLSh4zTFj4Q4s1QkdzA+AWFnAydMparh9/v2mhVesIiJ5AA?=
 =?us-ascii?Q?TTD3s007u2yYgF8lgs8xiketS4WfXNtVcja7LvBafkXNSpto3EjSLiaxEBBI?=
 =?us-ascii?Q?AFxbSSP+Jony0dZ8XM0iBOhtM1XSm8p1b45WTzFHpzWYCGs0ADL08fxw5W7c?=
 =?us-ascii?Q?vTyABIRtIWHtxjZh/a0wl3MmFpqhbwhOVMVRPDohgvS+ip/UcfdszeIWm+Vc?=
 =?us-ascii?Q?ld6L2KiYBYdFbeINHi07h7OdNEs0VtBWszFHEpbiQgIhP6xEnxZeYlsb6aUr?=
 =?us-ascii?Q?maVuSeYU5f9izZTv6oq8i5qmwZFpBVk6Ws4Co9uGwQYsOvle1X/8uCbEPhxk?=
 =?us-ascii?Q?lYgnnmASkRjW1diFYsJ7Yp4+JqRuFXt9RcHkQzeCbk39fKWVn7VhExckr95P?=
 =?us-ascii?Q?JybEeRYdSktViSZKtNwo4SJNhba4U+rDtqydLSKn39papt21QxsQ2/ievzYY?=
 =?us-ascii?Q?1ruccVHq+Jrmp450KHjzy4+Q/FpKRJdaZlbEQJEQ4J/NbBvmu0nH6k4YS8WA?=
 =?us-ascii?Q?Zc8RZQN8D1V1o8YhDpGjYU3lYfznuZOHJAYTY2OX6/1AUoo6k8H/Q45FMOA/?=
 =?us-ascii?Q?Mx1quzWupqMocx06q228Ai9ROiLlH6GbB7fhMCykeADJr1cQn8ezCHEnHPlz?=
 =?us-ascii?Q?P3LO7BacGRv0H+sHKc078vqAYeUog3otwixnLQH2rVzBOSRBwGZCoZZpIc0v?=
 =?us-ascii?Q?gS2fPqGc6h/odk+y2EVEz71AmIdrAy9yacWOsY6iLIK3A57zFSIQ/Mmz+ILq?=
 =?us-ascii?Q?MFjx7bMvhEKPiQyuUyCf/kEDZzSYyZ/tizXuJk+g23Mk7JjAXzZPJ6GcBxAJ?=
 =?us-ascii?Q?Kv7pVGU8w2oncrsaeZJX8t4DTyNgfAoprKkyRu4xy2Fq14q1ZeWH6GR5y/k+?=
 =?us-ascii?Q?JmubaSvdBQbN8vxB/KafjapcVG8G4Q8dZccbJysnt6wSmfogQu8n/sNDJUWH?=
 =?us-ascii?Q?pLId7fwnVvQCyLgKe4HANFSXs+1MQ6Kfc1nRyyj2OFbMXTYwvVtHUx4U70u/?=
 =?us-ascii?Q?+fPW6DSpHoW4ntk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yAL30Gx0UGN+wzj4iqBlJl5qFT5EUZv7EC0pEmdJsoW764z1C6GEaP/JFe9F?=
 =?us-ascii?Q?vwPFfF0pXeF1DqqEtyvBMzCix/J/f0Y1//eaX1EtcjoQfp3pwhAliGGkrR+9?=
 =?us-ascii?Q?y5BWyCBRC3t1wXsbfeoDpwLr6NQx9WYfbbNgK0EqQQ6KP+5cD82+ynkpznUv?=
 =?us-ascii?Q?nEA1Pfv/HhQ7sm1SrFbCPOBqgNruLAO+nv/Jkq2jqMfKt5MpEGJGavKAFlZo?=
 =?us-ascii?Q?2JKCb6n4NE7ikHFTuugI0h0R4IebfZ8bYfQa0Txabua52AvJW2vxX1opkaeu?=
 =?us-ascii?Q?BoTVFpfeQamPeI8emDj6IbEKyzz2AMygS4iDRmO+a3fLT9hP3ZL2Q9DCeOeJ?=
 =?us-ascii?Q?E2ohKa5+CR3ug+38lMfKMNpvKqs7lQS2dWv6aiDlhuMthgsXekt8QcKuXI75?=
 =?us-ascii?Q?4++h20KD8to0uMHLl+XeCFL6LB2GNhckZkQR/Iw1EFh8UeXQbOmW4ILBF7dx?=
 =?us-ascii?Q?L0iDVsu9PJPE8UmeInqZurSiQJWAZoKp7CZf5RVqg6ILkdTTXJSEOouREWgU?=
 =?us-ascii?Q?m6fFQSC+A+C2mY7NM0IBUFABSb40ZEAu+8CQKjjeCXXnV2vEjme+CLLV3sCg?=
 =?us-ascii?Q?bteh+wiIXlY1IinvIdm6K+eigSXwnJqWBj/5fsiv5IChcPLQhvqQ+y9LM6Kb?=
 =?us-ascii?Q?9Ne0MWLucob+A+0Pdp2y/icfoEeqgw+sUQdjKhS0jSWgj6eN8G2tmkiD5iBb?=
 =?us-ascii?Q?O05irY/E0tKMVzHyOPfS8TKYMF3VIIJBYd3UaJoxaJQDja6O2ErEU49+uqv8?=
 =?us-ascii?Q?+tzCF8hdp5LGHULbikU7Wznvyfkjj6zFLXfvZuaqZJeYhm7MHKBxW52VMxR8?=
 =?us-ascii?Q?2SFg1fcyD8l9hJcdwDxzJAyDs1PRjd1Ek40rMLeruz5nMvOX8uX42VIAXO7j?=
 =?us-ascii?Q?E5pSJTLpZd+tP5v6mFVv66XPT7U1lIMKJNdHFXkZTeQPXvEju4LTjSrUYxkx?=
 =?us-ascii?Q?YFD8Ul7rs5ESe5zBijL/nuYFEGzNJRHGwJauh8c5R9sqb8Ve9MPl39Hd57Rh?=
 =?us-ascii?Q?4sKVVzB8vHQnUTRAJLhGKXbkQXo016HoZLfqdZfZCC1WTry2Oddz3DfJIQ0z?=
 =?us-ascii?Q?WCCmDIircgE0rwY9cOkHBC1a5taM9JyW8oTf47eerTqPe+y1iM6SV8xQ9/it?=
 =?us-ascii?Q?DW4f4Mp8/oEO8K/Gok/4tzXNZyl8Yi7IxzTxLfx3fp9pkUeSFdZ3ThFdkiRU?=
 =?us-ascii?Q?ffEyM0tzHhHPPkJN/TrCbZN++0Zxq4d7HZkPdR7k8rd9fom0jEGa9jkxjKP2?=
 =?us-ascii?Q?SZoM2jhhu12kUnrLVru6lodsBdEKa9XmkRlnuoCMqhVmjTv2iveTjfXwgkjV?=
 =?us-ascii?Q?PoEuefBVgHfJ+vd42ty5/+/AM3oGyp6Pk0ZjrxO+1E49ed9TEJ0fbubWbPFz?=
 =?us-ascii?Q?0P+EhIa3aRYthGm0MIS/yoWRpoBWFHmDeCTchL7HRKqh5r9QrrDlPHTmCpg3?=
 =?us-ascii?Q?3SAFG5Az7H5I6oqUPSWeZSdHPARaEquMVI7cNLd5CjL7cBJgpCl7LwH0hhto?=
 =?us-ascii?Q?zPy6CMKWt1hc/hAcOfsyGFQa29ixJBA81cUvhCljxkNdilYH90zNRhH5g8Gz?=
 =?us-ascii?Q?ZDA3yeHsurxR/u3IFtFg5vuygOycrMkzxq/PSWIh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0a3a6f-b614-42b3-db91-08dd9908d636
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:15:39.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcZttkJETXqEuN2MnHqR+6NDw4ZhPpNynDEl66VU3Hsmdj3wUq/1/xSDw5QYjQhkUKuCNFUYvz2dDP24+4+MhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2720D4410
X-Proofpoint-GUID: rsnliDqQaTh6ytk5s22hQB76NIJcZSeq
X-Proofpoint-ORIG-GUID: rsnliDqQaTh6ytk5s22hQB76NIJcZSeq
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682edd2d cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=nfzQaT_c_gpvEbjEeCcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MiBTYWx0ZWRfX5tZyLl/w+oeD w/M7QgF8kTq4hAP3Yup55fwa7KH+A9WdE1b0ivCZ8B+4YcMxQKkhRf+CWftvVTEJEtO1An66oL6 q8G7u7nNbWAcFMJWqzdV5Q+gxiHMSMxKRjuJ6DJki3Ph2BFZysaj52ZNgzOwZTCAo8ShEResY1h
 WXOcZ0MsikHEPtmp50wW/dtgYfVqkLPIM3XxNAAJahaJvGfP7rkii+fT/VXmzK3C3UitYI1DYaB dzczvPX6o8n4f9+HdJzHPoo54N+mMxmJcITkbHUPF+SFdcE4HBq3CQD1LK3DZNbe0cepfEIxjpU NliEAOQAjL/FLgcP8qXshSnuAl59ZB6E9xjhWka7PDnbztzjqDyoKeMZNVs4hM6oCKphtd5DSie
 gZqxTbIWBDqmCkrG1YqMJDJvoDreX0eud7pvfFlh5R7dRl4h80Rz/TXnyY40qKf/KZu8+z82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=911 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217067

ChangeLog:
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1

Refresh local patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ... => 0001-Do-not-treat-warnings-as-errors.patch} | 14 +++++++++-----
 .../gnu-efi/{gnu-efi_4.0.0.bb => gnu-efi_4.0.1.bb} |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/gnu-efi/gnu-efi/{0002-Do-not-treat-warnings-as-errors.patch => 0001-Do-not-treat-warnings-as-errors.patch} (55%)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_4.0.0.bb => gnu-efi_4.0.1.bb} (96%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
similarity index 55%
rename from meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch
rename to meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
index 84966c484e..0c10e66a12 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
@@ -1,4 +1,4 @@
-From 89218bb3c5eb7b97987769cb4f7bf8323d35ca7e Mon Sep 17 00:00:00 2001
+From 80e17bcdf45dcf40b8f356cf68389612407b9f7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 May 2024 21:38:32 +0800
 Subject: [PATCH] Do not treat warnings as errors
@@ -15,11 +15,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Make.defaults b/Make.defaults
-index 1347aca..1834d1c 100755
+index 6d3cf51..23b9383 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -262,3 +262,3 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+@@ -267,7 +267,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+            -fno-strict-aliasing \
+            -ffreestanding -fno-stack-protector
  else
--CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign -Werror \
-+CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
             -fno-strict-aliasing \
+            -ffreestanding -fno-stack-protector \
+            $(if $(findstring 0,$(USING_CLANG)),-fno-merge-all-constants,)
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
similarity index 96%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
index 29d9e695a9..ea7b74080a 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.0.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
@@ -16,9 +16,9 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
 
 SRC_URI = "git://github.com/ncroxon/gnu-efi;protocol=https;branch=master \
-           file://0002-Do-not-treat-warnings-as-errors.patch \
+           file://0001-Do-not-treat-warnings-as-errors.patch \
            "
-SRCREV = "5ea320f0f01c8de8f9dd4e4e38a245608f0287dd"
+SRCREV = "00cdfa66e923ab2f6683bb52cab0d0d1a9083b16"
 
 S = "${WORKDIR}/git"
 
-- 
2.48.1


