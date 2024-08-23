Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D5AC5321E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7471.1724377707909479151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N1hWTH006814
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xp1fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8MRawarlwI36MtwU6FCKK0Zt7iIm0y0dDIQYm6xrfDylq1WIpFLoa1c3lrTQUUSWfjSLH7DdnphDQ1BtNah37lfjACzM7FAz+EL6zYrt+uK1dB/R4Gv5ySYXoC1kqo1YYr8zhJTPtHTnwGV5uZAn6svv06HebBvM2KhStRpWSVKLqHFYktFjygTYMYL5AR7gLFr0Au7U8i8QO7rWR0detZGnX965CKHgMK5gsaXqhURt0HlOxnOEy8exciaxp9M59eQ7BRUb23tnDQFToDI2FZ1T/jtPVy4AW0R9C77wBmXmzYO93zeFWI/I/rKoocd80cAoLKQh0mW22W6xxkdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I0+sPS8OtwPlt3fTmKlR9PmUQC26wXLUTEWDkB3Yp8=;
 b=QXonEEefcCAM2Tyh+AIbMUrgs7R+f2PsX0ptdfkOUNc6JHa3WGf5dy66tzK81Ch4iEDyMNpCKTeuafNd8ogBkzAjGrlc5goiL/3+erz9sv7f3SKggQRVuRIq7zzr9o7OEPS51HlotThau91LPq2o1WHHsNWCGm8beezVyZX6CHhqTXyqO1PDTNI/sojZrsEwsa9aof2bv8+e7VqCj2xdR1UcrCahQkizDqOpNE59xPwc+XulSw9pktoetHZLyWnSsYh/vXXWIB+Q3iGn8/MlBp7cdV34ZOc8kSxqHQXFT8QMrJv2n1lXNRqTZTfcWOF0nADE2hpWxXiuN8LU6jwdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:25 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:25 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 8/9] xmlto: 0.0.28 -> 0.0.29
Date: Fri, 23 Aug 2024 09:48:05 +0800
Message-Id: <20240823014806.4154590-9-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: ded407a6-2474-4470-5aad-08dcc315ad79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bbAXhFjfv7D5CZK2zXkDisZWt+1/XM43egmMR+zFmzM8tfjiVcYrGRDfbAoU?=
 =?us-ascii?Q?PblcwXV3YAU9KaDwDbqiD7s4B+L150h3ClYRLJJ4vhsNorMm3yvQSqNrUMrJ?=
 =?us-ascii?Q?gUrNAqYI0aY/RTbv4PhbxsF8cvLl0wa+djdi4l0Y475QP9vaTbJcWr/6vqmg?=
 =?us-ascii?Q?+6ziPkROWjoP/e2uPCA1OZwM460MiCLTAtNOm4CipMujSJWZ7/c5D4LdAGRq?=
 =?us-ascii?Q?gOZeIpWV2u0n4c/IZBM3mCeDZsIU8kIWUF1PCFeWlRzh+B1IsnS8UBW4/gkY?=
 =?us-ascii?Q?Q6MK+wPcsmaq8/kZL9pECmH4luD0Hsp2X5fUL1aTA114U70kO9GP14CkI1Pe?=
 =?us-ascii?Q?xCuCLedohRhcFVCQuk+K5BBdjhylm7jX38LK60o+NyRDHWchKO8BJSOXX2M2?=
 =?us-ascii?Q?udjZvoZ9jt5LBF7z04wq9ZxROI48LK4QaIVxXVuyJ96ky0MtnrslbhMa2Hs8?=
 =?us-ascii?Q?2q7Ke8B2MYXnQ9y2ebifBZOG1m/arOW/y3tpoL0GT5q3cin8oC4cbBD4WA0Q?=
 =?us-ascii?Q?X4Oh5156rcd8Ekpg5V9/GcpJPGDI5yzKrQkTSUYIPhOsdKVN/RwhmvFg5mmP?=
 =?us-ascii?Q?0YV1FCh+zGAmM5krDd941fsymTD/VY7GMdaCrFXRU22oIy6p1x19mUiTmiw8?=
 =?us-ascii?Q?35fDrqg5Plf1OQg5Qsymo60j1UF7GItcPtBLTOkuJnl6+vfzwhEViWYxDumW?=
 =?us-ascii?Q?VqLsR5FJOYzTNGuW2UVIkW9obDdldKWcMoMPoXg5bm5nxSnZCDDR5fqBpoYI?=
 =?us-ascii?Q?LtDlsWb4JzOWRsyFnpS6RCELhB4Gx61UKxU3GkzJPzb/D8Be1Th/tQcPvboE?=
 =?us-ascii?Q?FnrazdqkzGA4q4duGOvfZJ95ghPjvj3dnRwbNT78lFREzCNShvgWVqQvIFXf?=
 =?us-ascii?Q?9VEyZOY0sUnT3EMKkU+Dv5S9NNIFDyp6q9m3IJqGNwwId+rBxt+ltMQSLnXa?=
 =?us-ascii?Q?nB46yMp4GYVCyh8zXdUZpdYISLAp+vhZi5DjT5G0WVq4xmbqQcTdjcLqrz5o?=
 =?us-ascii?Q?t3FmFpv6yxEJAkWaVysOeA5ugULi+dMaSgBHY5Oj1lspupccO0EIlw1ar2qT?=
 =?us-ascii?Q?Ia+Chvd6C7pHMG9dOveSOOhOArHC80WWXHRdFl7A+yDW9NcsOglRPDbE9QfP?=
 =?us-ascii?Q?IUMxFw9qQjcWUUTerAzFBOitTsPH32ifGH4B16akZ5/VGca2s+Y+5dmvjUcH?=
 =?us-ascii?Q?VlUXMi8lE+07t/ekPyGIDrh0W+okbzdF6jzYWGiC4nFSlUVdh6GkHnPvL7lG?=
 =?us-ascii?Q?4jB2izi4+5R9nOGC1x2N5gb4dlNKO+sGwGYs2ivpNkALCyoZrFvZgcATpEU4?=
 =?us-ascii?Q?P6+PlyC7WsUUHckuaXc4aMuFJnJSqO5yeV/jFm3PeHN+ynOuI3Ihn/r09xUb?=
 =?us-ascii?Q?X//fSOs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bPLBGGez6HGmDgStXDvyftqCUIZylSMWywyoplHlJoi3bP4raT2DhgdbUROh?=
 =?us-ascii?Q?ZFSohEfVGQB94FWCV1WVjFIFL6xjNDy5tc59myqbbR6GKQdDx8enzm9x7PXY?=
 =?us-ascii?Q?A67NJ+BWeQJKm4La/ZGqMtE6QpB6ABOBsUvCH1xFrep5qEbU4JDt1LBxMZdt?=
 =?us-ascii?Q?EDgTeogCZAXFgD4MsR1NmwPmEaSdOMfGpL5ui5L/BuC4+HxS2KuCwWtHTYys?=
 =?us-ascii?Q?AmZ79gwUDhuZPxBQ6zlM0k1LhKD/S7KzgZGl1Cts0LshP278eVy8h/FCw34u?=
 =?us-ascii?Q?1QgFSLJYD+uFlkpRmUrzDwqQIdwvgXLkSgFIl8f29IypW6dGfUsJB20ZsRky?=
 =?us-ascii?Q?fkDWRtF5wieFqX0gkiCG5po54nIkxQ15E+s4T5+boyEulv4xPCIxLUp52zZE?=
 =?us-ascii?Q?YL+7xkDerKM+Pn6jPRXgzudX8Aw6ecm3cFu+egawZ5aVp4232rGzTIhfhv+t?=
 =?us-ascii?Q?POlxrGVgfbXQ5GVOoVvm9mJD8m3Dk/4FGaI0TAfnhbsI61y9zZzyuf/+UUJ6?=
 =?us-ascii?Q?dBW6d1cKHZglfe39lA3ILpofsg9ahaPh0kkFlOZtD4CFCiZfeygwV+bP1QRd?=
 =?us-ascii?Q?7bHZsWXg2Mx6A8FEkIF+WCsoWULjRtoj3tlI5ySIGK4q//6lyqh1AFlr2RBk?=
 =?us-ascii?Q?k29DMW6rOqN/DUZ8diAJc9Ykm4SSRCKVEmO+fwLHuDEsYVc34IHyKYrVE9Uw?=
 =?us-ascii?Q?tIrrp/GZwUfxnYBrn0XKOZyjccdmU14xyJ6fvjwaCJxcqEwNwVXn2t05Gz9P?=
 =?us-ascii?Q?J8Ku5aDUZSXGrcIuDzinFnFLwYryN6o5TeOtPyi9JcSNNfqR0RQBxY5/QYqL?=
 =?us-ascii?Q?RCizhXmEBgQcrwOUHtZBmLa13MtsvwwdIB+NyanzautQ3dLXvWAaVOY9Z9rS?=
 =?us-ascii?Q?Z9lG/lHUgkLjRb4wUSoP3vQjiaRjtMa/8yTwiF0fktaDWXCuqPY2WR/3e1gI?=
 =?us-ascii?Q?fi6aoLToe4RxuK5OYx66gNb3E3KHfoL22pTm8e5E/LXp319kYkhuGyauWGSH?=
 =?us-ascii?Q?hKjri99M6fXjem55HXTQ6tRKAYGsJvpp6BCs3jSfD1UF5dXPcQ/qEixdOMoz?=
 =?us-ascii?Q?3rPEMsL70BgICoDbsykw/Lf0NiXVGlik22NxiZabbPEVJu6hd1FP5O98aTee?=
 =?us-ascii?Q?NdKX2rWnued0deFO1es0J5WeIiXdynUFfmQSq6BH1a2AadV3aJEjzqFSOx9k?=
 =?us-ascii?Q?2JLrPSkw2B6lYpCATDI7TqiELAGS3gybkvLSx5W+TjWonYBAnT8qW8m4sHqT?=
 =?us-ascii?Q?9gO0AS6Vvez/3Np+iRV3LDZzIMckuOvt4J09wNK0zj/rVL8bwWeioqk+ll5z?=
 =?us-ascii?Q?7ccpFStqybGGA5VBoRKKciDYiLnsPU52Douhd+/CNmBHLkw8ba+eI4QXEwY2?=
 =?us-ascii?Q?JOXm9k4BNBtUCIEUtI84hkc5O0Upfm2ykwJJOnXi/sbO7w09vqz+4ZNMWa3U?=
 =?us-ascii?Q?UinlbmJuwjTRYEilzGTT1qoNcTG+Rr4fakxM8ZaavyY7ZcBuyh58inuk4G79?=
 =?us-ascii?Q?JZ0IJddUrJb/iy6cVg9ruw0Lq0z7C0NQ1NtGGTwzf8SglPahrO9mc6L+uQ+k?=
 =?us-ascii?Q?lH610/X5Mh6A51Ak5cVST1NLddy/uKxHzg7hqvzLsGIn/d3Q+Ri8AQCE7rc0?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded407a6-2474-4470-5aad-08dcc315ad79
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:25.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fe9LxrvD+NuXNNiR9Ux/z/q3YKIECmcz8AIAXh9w0vR6yCM3OaVJfhPLEZACyEKlivLTxRDGNR55UnO2nPLerY7LMVZZ3NFTx+SlOlsh7C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c7ea6a cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=lViJMyulAAAA:8 a=t7CeM3EgAAAA:8 a=5gjNY3jQvTa0CiRi0GgA:9
 a=_bH2KxHPhUEA:10 a=gb9IC-u5QvZuJU0a8fSk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2BG_svt6w3wqWhTIAgSNpNns-XSStx69
X-Proofpoint-GUID: 2BG_svt6w3wqWhTIAgSNpNns-XSStx69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=923 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203675

* Do not tweak var-PV in recipe
* Rename variable BASH to XMLTO_BASH_PATH [1]

[1] https://pagure.io/xmlto/c/5030f081b0e2d94d791b62ee6da0831026cf57e0?branch=master

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xmlto/{xmlto_0.0.28.bb => xmlto_0.0.29.bb}              | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/xmlto/{xmlto_0.0.28.bb => xmlto_0.0.29.bb} (92%)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
similarity index 92%
rename from meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
rename to meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
index d5a0e69849..4e969fc12f 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -6,13 +6,11 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-PV .= "+0.0.29+git"
-
 inherit autotools
 
 CLEANBROKEN = "1"
@@ -35,7 +33,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail ac_cv_path_GREP=grep ac_cv_path_XM
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF:append = " BASH=/bin/bash GCP=/bin/cp"
+EXTRA_OECONF:append = " XMLTO_BASH_PATH=/bin/bash GCP=/bin/cp"
 
 do_configure:prepend() {
     (cd ${S} && flex -o xmlif/xmlif.c xmlif/xmlif.l)
-- 
2.27.0


