Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2946D43FE6
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:00:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35716.1731916803662263638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 00:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105223d229=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI6K5Jh029364
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:00:03 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq167e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbEnUt1O3ZQBjX0+joBRwTCHaDDmkijzSXOYcvVQGMT2tV/M95xJutZ7aYSKkKGUu+tv83C5lehjdW9D2jnKIHTA2Tba90zt+skQ4rOqGcjXYoJyQU3TPsks1QNAhjpjJn3fuxFi4fJegcft7RVR7iyyk0m2rtreO6R2cKNCa0EevjY+iKRtOpKuKZxn1bmYlROSK/OLdRQci66/7t38KwuPHsUg6qRyyI1s25Zv0ISSrltfHqmXlAYxY6SwVOcB2v6SlExzfqNLLWxQmKT2c0nkpfRlJZDD1nof9m474G+pDek2lhDH0/QHs75kdCDER6cDPygZ2f8T5kJTD7zywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFbl9XvjYNOcJ0oV732Q56uD7EC2Xa9wK5bCSKYdNrc=;
 b=fHAuu+l3mM6zbeBauMiv8S1EU9wcfLoByJpCGY9tpO3GTGc5FGkNQkWMRBMXCP7Hs0svaEwIcgB+Yk1ZEHkUbdgNrWYd1e3Nm+WMgMJCG0wl24fi8zSdjax5EgK+BNKghHBs3OaULv69f0x4nipZKEfF8Yv1NDahEfclrgaqVNFie0gsp6ICsOjlVthlHWYiNNQOHv9vI+mIeowMykZjdYbU7t8PhRRvxbr6ZYrmNN+H8U2QfYE34ZJoPQ+TIw+WUxn84ImpvvSu0tIyD805cWnu2ewl//buE1XCQUZtde8SH8gk6cVpPgtlIVVHBB6JWNCi6Vj8EU7aLkC/VE25Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Mon, 18 Nov 2024 08:00:00 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 07:59:59 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch update
Date: Sun, 17 Nov 2024 23:59:44 -0800
Message-ID: <20241118075944.1914998-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee5f444-c9ea-4e0b-9782-08dd07a70003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?khE85eKWgss6YE/o0om+8PJE3S02CWk6jVa2Lj1eheJ2YkK8EZkzJ8hFg+b9?=
 =?us-ascii?Q?nw9vQA7GFI+pB29RnB5jGBW131XnEdP2NoGHesAP9217i0rptxh78e2HmG0i?=
 =?us-ascii?Q?63YJdq+1gAbCTe2GxE+S8wnElr0WIiOKsQUxoYpuZ+BdpPXxpr6k5upHMt2e?=
 =?us-ascii?Q?RjPbVIibhVOXm7DKEQX40TFam4K5FZP2Xqp8VkJQvzFSnJSmdRtdKLlj7WiW?=
 =?us-ascii?Q?ow9SSftqyzZVoolHF7ZGsYx576S3ZDt9DXuXXPsFvQ/229y8Q1B1b+qlerLr?=
 =?us-ascii?Q?/4DT0fTDbb980r1U7gxjv9zN/hI6HZeh5TmOa/bYhPZphuwB3iALS4miFDVS?=
 =?us-ascii?Q?FD6QR05nbIfOFzypU3udlAw9iCjUfMqS4YNp8wzlBrwvHVQPQXWMqjn5mM26?=
 =?us-ascii?Q?bUUn7hz8a/nuQB27plLNdkdyOZj6xWSAM4bdj9+FgqHXa2KnpdN8d/j/ID6X?=
 =?us-ascii?Q?wZL85FwzICZU8kNR1RQSMINgOatZRKUm9kaB3u1fCsmv0asNmOqoAt267BOT?=
 =?us-ascii?Q?XP8XwgG8O0YEkJ8ZzCI94y8krugPvyRCOVCgHEGctKaA5H8ZpJQV/pnpoPQR?=
 =?us-ascii?Q?WX20pUsbT3PtdVlLwiwyQUS78Kh1+dQq0Sdi674TuZ+hcNeHAeT5XbUimgDc?=
 =?us-ascii?Q?KFP3sMh+3dHCyw2sMG8ayBVxjknqIw/OmN/g0XRhD8VdvXcXPrxf4zsAcznN?=
 =?us-ascii?Q?dPSbGI1Ru7/efOqMKg1tNrB/IMQpyeP0d55Ogkl9/T29gZbNORaRsTVqfN9+?=
 =?us-ascii?Q?lONoFySn2vVEX+m3iqlcxmgSSsu0sbuHLPQfB397zC6EjhIzGhYbvE1TgNJ1?=
 =?us-ascii?Q?6rx4gcPG+XNN8sCZ9e5kX11ZPRuPEIbckZ8nZPck/ByGMG5FiLg3VAR6zrtC?=
 =?us-ascii?Q?w7hK0sUwadqVlXrk87huqaADsnh47Pg+2dUAJTIC//L41QN6TOn5tAzovd7Z?=
 =?us-ascii?Q?UAvtFJ/xZuiSiw+q36wJbMKtoM086rAuDJem8m2ULuoIwoce0cUkrlFCQlPS?=
 =?us-ascii?Q?SX20J6zLEtU5knus8oClIOsYUv7qo05QoamXwB3rlIkJwGCrbvyoCsLEhvdV?=
 =?us-ascii?Q?7FS5NdSysdg0G3rePtgObjlY5dpM1peCB15oS6KJwOvIXftDzmKyMBKkdwMZ?=
 =?us-ascii?Q?yTDSoQ0RPohXMtuIf5v3taIuw2o0Pts0STaA4DtWRQbsblsm/xxH4RsBLwI6?=
 =?us-ascii?Q?tcZiXc5kvCrX/5yHVldlz6fwBLR6dt86DpAizcv8tMPepIui2SoTDRSRElfi?=
 =?us-ascii?Q?GvGcae/xYkSGahGzk9CoTbNT1o/hDnF1KGZ3CSzQf4GQ2/tffJGH6uRc0URF?=
 =?us-ascii?Q?sswliRKgzYl60vQ0b0t/ieqy81V8B92UW99CfSirc00HoS6eEMDvESQ9BktH?=
 =?us-ascii?Q?V5I417Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GSy6gSt6raCu5AVxVPlG9WRe4eBc21zIXCKXRf1cP+UBLzULcblmX2hhPk3i?=
 =?us-ascii?Q?jj09ddILYiuigOiMQa42VHgwLmQrsWxGdiPtjfOP2ZeFyxId7YkQ5itqhUC1?=
 =?us-ascii?Q?sMMOvJdvJ9iUzvB4fqSifI76GeZKtqOG3gFtvs18/oprQGMpiPF43qhYrbg9?=
 =?us-ascii?Q?6bwCulkEF0x592otLVAutASmPK1CgRfFduMvUHw8qbK/ktgRhaZJNsUk+gd8?=
 =?us-ascii?Q?u1d64LSuBr+s7IBf5L7bAlL7+k1OnBjhg9Q+1fPYqzZKMYk+IXVJ2wwI+TSa?=
 =?us-ascii?Q?hERSky2woIIDUYRIroH7L5IqLjziIaqtyiEK8t6tCmT1RgNel3uUy3WTAj4e?=
 =?us-ascii?Q?YfbE9Z27wdSdnt4Uo80J5OBHy4UiMHIPSQF5U67+wEHO/EPV7PBqGYj5N3Nq?=
 =?us-ascii?Q?Zlc3Dd9+SHcIEm3+hwFbLxPL0c+T/od6/0yFBG29o5JF75lDWgATsPqd6I4W?=
 =?us-ascii?Q?aULKJzqa00cxRWrO2EuVKm+FgazTrpWHQ0zPK3qK0+o/KzFYIDSXb+hb9ybW?=
 =?us-ascii?Q?b+8l6Y/KKQyVI8Z0pQmdqiNPtwcA/I4vHjwKOTlILDiiEjhTWm/qbhp5eTjm?=
 =?us-ascii?Q?Y/XcSYGaICRkvN+cVcsx/7OkGnhJshZAfudh3oNP6pVYO7Pz/0Bx/RaRoPzy?=
 =?us-ascii?Q?po39dVAnuCYfb4WWzy1x4HlrbqhEtSFfmec7M9+iyzrk6SCZ+CtR8ithxvfL?=
 =?us-ascii?Q?iO6bt19rA6VM1eLAyEbmMSbg7LPwVeBS3EE+5o5svio+REsqr6HqDU0L5mb3?=
 =?us-ascii?Q?iNCnb0MBMPEG82UoXwGl+MuwSqeedMEe0PljVnig/6XLRgknvDP1C+osgU0W?=
 =?us-ascii?Q?cjCjBPsJkQ55oERHmhAC0ZYp5m1CHtJjCIhA77Bbwr+iVT9VU9afWGoDxdo5?=
 =?us-ascii?Q?FjrAIOga0gqDzJMJkVdO5m4Y1YsWhK3JAQvHu/uP9NzYax1xKsNzlSF/cy0T?=
 =?us-ascii?Q?WzfVw+KoMWcPMyX09Ve2t2DJ+8HTqPj7jlGC8nV7Fj/XEfoHT1F0jyxAmboj?=
 =?us-ascii?Q?hMqtO5T8lJmHP8ZxP4zSjYU+hgvYg+RgTLwE6o8wqt2DrINr7HnEaZq8GwoX?=
 =?us-ascii?Q?UsdnkMvmA1p3/uOr1cWvIx8aAPmJWk0DM7A0aIU61K01MzYXep4XB62NTP9s?=
 =?us-ascii?Q?y5EQ/DVIk/iNK9iytsgmDTAxL9EJJ6d1RYv/kNKS0mb3+21NUlLRzBGmbiN4?=
 =?us-ascii?Q?ar/edbMjMlzQxbPpYrOs+vE50DRqYD2IOXHcvfHP8rE1dPg4wXjs/a6Qz6Ms?=
 =?us-ascii?Q?ZZs3kwfyCsX4l08rUj6OlTHoGwjOGTdg8J5hvCVqHKBqPRv2AewJMVLpPv/k?=
 =?us-ascii?Q?E4APfImXj6c1I2X5bbMG+h9pRLgwAXHgeeMtWJiYjsmiE+sk98PXBRfsc540?=
 =?us-ascii?Q?T1H0V1ljcno5PRR01Kckm+ySH5mw0mZjPbi3ubIK5o+W2v/zx5d79LYvF8fd?=
 =?us-ascii?Q?aMGxJZfNyo7e6LgVYFC8D63yztBzRrKC+XWBvos1NMz/1SSRdiGNQh4ka/8r?=
 =?us-ascii?Q?C2Y/rfkWSpXYniRWAMqxx7ZBAVIuJ1mAoCXlgEYbxMJm8JoX/fU0jTmqOY3H?=
 =?us-ascii?Q?NF1t1m9WHbSCsKFZWs+6VMpyqpTcdv5++fh6XQJwrhZOyW7nh99DkXiU9XWG?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee5f444-c9ea-4e0b-9782-08dd07a70003
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:59:59.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UshTA0KjDHYePhr9RlX4fB5os06Ws5JYWBCJxrxNX+NmOIXOrjHix2+P9mQ6KVP8ijGN+CJmjDhsCBvxAYVkFS+rL7nKEbGyLDHEa7gktpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
X-Proofpoint-GUID: 8SV1zn0l0o5CCBCLp1ZNeqRyu1xUuJIY
X-Proofpoint-ORIG-GUID: 8SV1zn0l0o5CCBCLp1ZNeqRyu1xUuJIY
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673af403 cx=c_pps a=r2a4NctkKoQReJT0uaIV7w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=rs4Mc9ggFB7CX9DX5jEA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_04,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=918 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207208

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
09ba78f0513 LoongArch: ld:Report an error when seeing an unrecognized relocation
00abcf39930 s390: Add arch15 instructions
caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand constraints
543a22c7ee3 s390: Simplify (dis)assembly of insn operands with const bits
7c94c87d463 s390: Align opcodes to lower-case
fffb4fae823 s390: Flag conditional branch relative insns as condjump
2d238ecbe50 s390: Use proper string lengths when parsing opcode table flags
10d0dd2ba2b s390: Whitespace fixes in conditional branch flavor descriptions
10a143e273c LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch tdata
9055fbe5ffb LoongArch: The symbol got type can only be obtained after initialization

Tested on qemux86_64.
There were no additional PASS or FAIL after the update

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5d5ba3d6dc..bff97b50c3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
+SRCREV ?= "09ba78f051319e8f8861b26fb9340e21ca973c70"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


