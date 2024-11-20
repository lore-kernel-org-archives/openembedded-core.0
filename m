Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998A2D6E2DC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 08:36:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9214.1732091786408462756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 00:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10540dc7d2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK7EETl001473
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 08:36:25 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8c10f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 08:36:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF2nTuboemVdGB/zvU3H4hNQR9Q78i2QjZ0jFhlZQk1gDCh0fDEpkSfOqjKNIFQlVZzR4PS4mdq7z4aMa9CtmPbXGkuzuMN+ZPu+wHLzM6puwFfhxzSnIyTLz5J4QP/EUX7mfFUuMOOkMZi1WdGb6cXH+74VjkN7mMiIfGCH7x0ePlvCOsJumg+dTQKyGi/3fZlSwCg9W6NVjjB3Pza6uMGs6Q8b9acwDZxg2wpmtYE4eAV4ZxPThSj8b/irUSFirLr2KRiU9djSiD6lxyYGo3XGJTdLyX+J5DnHzGyIjBcEsgS+NhybnCzSO62mZik4+1Vw2MPIZYz2xMom9IFdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8GwYk3Iy5YwqPXlO8ScX3omUinObhrStqNYdf35qi8=;
 b=URcLAVVbka3eVgOfS4p3bznnbyfokiyW1J3GjiKj3Xhv/u4p/5KyIIcMvD6AEpPPmPfvMVk6rJLYGhptoXxUqja5+uy2cfke/9NHh2+XzyWGiZzp4HQlW/mSEuggFr3n1AUx3BqrChO7WQknaUmsGKmMATjCBLQ7HirGcvKrV55hbmsOEFuS2IqT1WS1m1S6eo5capWpFNa+yg2lliGFvuLPEPIJJsOD/RMxN781l0wwP5VgwM53wwShmv7x0Rqallp4sB+OZWUoLEyV2YhvHkWJDSh7rv2kpW3GhKw5AI5+pVitbumN39jgKzg2edp2iT4BNmMvjQ3bWMNy1TXwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 08:36:23 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 08:36:22 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust: Upgrade 1.80.0->1.80.1
Date: Wed, 20 Nov 2024 00:36:03 -0800
Message-ID: <20241120083603.1278184-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: bccdf030-093c-437b-e935-08dd093e6a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rT3aiNdhIHhD83pDUobydGWLEkFNvsKtO0kJYo3B+Wo9EFohaLKFReLfjRil?=
 =?us-ascii?Q?ukyRUBJsAO7NrEqa1cbB7ADMK4SCRMilcAwBCqvU4NIYAWZBLFCP3LDhPcuD?=
 =?us-ascii?Q?ngzBN+9+8W0i25x6eEo4feHadCLazXZ03B/EZ1YNaM+D6Rrv2nlMzXeHwRbM?=
 =?us-ascii?Q?xHCc8Zvjlygn9hU1fVvt2J4omvFQvrdlMBMm/8aPDGHdxFH2R0+tMGOa4wYT?=
 =?us-ascii?Q?j0KHb9tEeJ80xG0qBUWE6aQ2oDNVz3r0F4zphd3GWqvW5mFphY+Ixqzgu0yE?=
 =?us-ascii?Q?Di1Ey4sme+enyn26zgi++VmlS7ZhDUZ3MIWeDj2iX+l1ufKUbbHcNHRGtPxK?=
 =?us-ascii?Q?JOhmaIh2To/jlHajmwlS2jtGYhRXgnq0eU9Zz3HsBh4VqG+0rz43yvog2PRS?=
 =?us-ascii?Q?l+RhS5MSbuyU323uXUyiDTO8angMZXkPXF15MGLFRKFgLMaE+VJnC+nL+e+p?=
 =?us-ascii?Q?CGyE8cDSRCHd7mW/xdtnzRIOrxhEJcE67cpQfGbTRxejNgs6WbsnQb9ydI6L?=
 =?us-ascii?Q?40E/hL3sK+Mqpuyz46LB8Fp1uQUywflwj01Jk52jRbH8bPs1nCjF5EehwUlB?=
 =?us-ascii?Q?Q9nMN/eIKPPDNdN8VAMr/dNyS/aPtit6wN0OH0QTaliYUxLJalMNrZly8spv?=
 =?us-ascii?Q?eOO6r+cbqMJ0ukja6bczDrV+PfISUHbre9rlgkI4oQka89152+/ICvD0KqdD?=
 =?us-ascii?Q?VsNiEJ7Lg9u01wjwvfZ99v5ytkNYhokIzQX2gStjQOMfFa+B+zfiREx1lolw?=
 =?us-ascii?Q?p/jvIazl9IPlYruTzd/m3ASSFTdUFtrgNHcJYbSeE0Fv1CtwZJW6AsWeq1re?=
 =?us-ascii?Q?7AeGjDCR+BLS3oP82BSW3hK27XbiHIHg61GCw9I9wLYyvL0RP6VBanUV7COu?=
 =?us-ascii?Q?gI2YJQwVXPwm11YI7RpPQzstS76vR7wsgw7HUqnyEfIrs1SjDEJLebPhZN+a?=
 =?us-ascii?Q?lnrDCVleFGeBU+t/48l1tjVK9n23kopo2FGPTEeAAwlNwFPTe5IyDuHg9QEk?=
 =?us-ascii?Q?MEdAJ9vkcBsQRSzO1IogLL6jYmx5GXkuSwlJC4CK2lwYXkyyU7ziGw7o0r5y?=
 =?us-ascii?Q?fRmJf+eNUaFUF4lP3BEE5dMyCaITntInXeGYIkeQEy+/Ac/8R6RjvxcNmiqJ?=
 =?us-ascii?Q?nv7EAij39NWbEhb+yZgx0PHGa8xEGwkG/TU4Fj0SqSkVBhNL+iHGQ8L125s3?=
 =?us-ascii?Q?rqQQoM2XlQM3DDZmAxGBEps9E52t1nvLePaJc2R0cYAmCGtXtuvgg21f9u8U?=
 =?us-ascii?Q?pytUYKzFvFe9/l6SyGp4KJ6zi50jizB2ENT7InyP0pXw2EnXZ6Y3wUSY54tS?=
 =?us-ascii?Q?0VUtYPriebLnWBPOXRYedIgt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oZrf+HcxlSqUbUEM6JIJ0sOwR4VpHPgGx3oq3UZnDWQp1aZK3aXuC5+4Zodz?=
 =?us-ascii?Q?8+OSpVJa9e+ijS097E0de2Pvog/jogoxKznKc8H9WSlRg1OABO4kNoKqcB+M?=
 =?us-ascii?Q?8tSofPFcxphp1aYIpUKQpewp/jadTOkP6vzEVR4fe5iwoUuBVuSb1xyvxZrz?=
 =?us-ascii?Q?9CZXlXhWxVA6eULuy2Ah0DBx2LJAyoSzRVqa/5TsoKHFr6UJmloNm35qZNgz?=
 =?us-ascii?Q?lqpC9QfeclQeyCHnwnsFjF9/UjlmAj7a98xeLh8a0MXMj1+0U11gJ2Wpcpeh?=
 =?us-ascii?Q?LPuu9FyLpQ6Weo1IWdwfLp5TANlt7mALXfxfn54kGzRYqHKE/KDUzEdYZ9o+?=
 =?us-ascii?Q?VNfH0XoJuZ87pH8cc9d8SjRSK/EbBFwXraXvgjweBBKTZLJ3mqkbT4EQRKYo?=
 =?us-ascii?Q?FyY9BlvqemOJQGlwOnYVfLmXiIUh95Pr02Q/IEYjhWXAbzb97fij8cpx7DV3?=
 =?us-ascii?Q?9oGejLCcS3C4wrPpYxrojeAOmBrVdJq3obw649D8AtiZn21AJ9Vkt83fGvoa?=
 =?us-ascii?Q?wmkhI+x85mfWXqBOpRTF2LtedADwgC8LKtv3cYneTCmcgdFPZFBmxR/jsN0p?=
 =?us-ascii?Q?Hd55hVfPRKX2fBlO5Y0NSM1MbPsr8cTkjZTy5As+welMttnQEpMhUwKVPJd3?=
 =?us-ascii?Q?c0KuNBh0Mnnhowtp/Q3nLyKILz3K35myFUJR8cZBw39qlCInOZWIqsS/fFOa?=
 =?us-ascii?Q?e6ZfS1dIFcRDAXid4/fFR66OqfzCqASzjBVVMJqw+vFBIGVnNs8MRy0SEX6Q?=
 =?us-ascii?Q?5IL6kM8lH6uGt0+m7u2aG8rZhOYKqlQngaLW94ehtt7Z8wJqgbKUU6IYOYvt?=
 =?us-ascii?Q?ykdcRnkx6M3uJTBiqH8524Tu6IpmiH3KkxS7A3zAtAGtTwcszolp+LCPvSka?=
 =?us-ascii?Q?Y7b8xlP+P9n1wF2sZu0B/tYILxe6zS0z/i96XcQTuPkxPt1GWKgaj04bGJxn?=
 =?us-ascii?Q?xwAEehQNehQdcMa87zG4k4lrNgvunoXp/tqbF1WqxPWYXhza9mjB5jWWZ8W+?=
 =?us-ascii?Q?2mTvek/tX2INsAFOQD/ol/grt+B2xva7O6lYKn9R1PmpXLqhUtBIjUF/AILf?=
 =?us-ascii?Q?qJViATt/KHB23kXiPma18BWR4CViVrZVV2t4xOBDhB//w6rZ+mORR8cL2ipt?=
 =?us-ascii?Q?di695xtJ1YcFbXwd1Aq46U3wxAcA3zHwW58oM2+d3euLhNxBYsd2yibDYiMC?=
 =?us-ascii?Q?fi6UU1p5xsLLfU2/duPo3aIK0KksCKXQVu8VNFZHBaJAD1OulTRW/lgVzWu2?=
 =?us-ascii?Q?a9yc4fo57T1kOMIZSU6cLBKhABTIfOK9DjQmgKftBYt0jzt0q2x1tQu8yumf?=
 =?us-ascii?Q?vpoCVlEPHsCUtTuy/ZGa7rxLRuAj+Wjj0Cf7MPky2vgPVFyUhatxrW7VCqlA?=
 =?us-ascii?Q?BcpD0WCmRyLvdt5wb/Z7fFlqWmD3lMJbfhldvdHYOOXmtweORA8tykGZSsHc?=
 =?us-ascii?Q?NxwH3GCKXEHfCZ6a+IDiiS5AJuXw2BqXBdxTm3686J8WkxdP1qaczCcCtLIp?=
 =?us-ascii?Q?LQI4dElyl9r315RCzowuEZYyWZrlS+UMmLgCfGqJ15CCNU4URxpMaJuzGUy/?=
 =?us-ascii?Q?qOgF3sa5+pQoe+I3kqFhdIadWrayTdZq6l3B8MEoOcPNx/xR4o2jY1A6iKhp?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccdf030-093c-437b-e935-08dd093e6a10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 08:36:22.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cDB315uldHY3LXV+CrBukpdQJfXLEOTg5whOijRqvyw4sXh+g7+t5OxbdPxCF2ShQ5DpDUcdoqGyekcTmEQCQAzV0P+2NcInvdHYWHuHXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-Proofpoint-GUID: gP6LVVdr5XTsPi1WbfwJv7gn_EY033W8
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673d9f89 cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=ei4SEBeUAAAA:8
 a=t7CeM3EgAAAA:8 a=QD9Qtey2zKJs_bIMlh0A:9 a=t0EB5k7lhMAKNYPM:21 a=Qixl1SizjlQA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gP6LVVdr5XTsPi1WbfwJv7gn_EY033W8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_05,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=935
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411200059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 08:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207417

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

https://blog.rust-lang.org/2024/08/08/Rust-1.80.1.html

Testing Summary for rust_1.80.1

Target       pass       skipped
x86_64       18254         434
x86          18084         604
ARM64        18111         577
ARM          18067         621
ppc          18035         653

Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} | 0
 .../rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb}           | 0
 ...t-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} | 0
 .../rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.0.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.80.0.bb
rename to meta/recipes-devtools/rust/cargo_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.80.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.80.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 0cd329fb49..c39c954c49 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb0ad883c5b71a72c02dc6e80"
+SRC_URI[rust.sha256sum] = "6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d122a15b3ea13be77947"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.80.0.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.80.0.bb
rename to meta/recipes-devtools/rust/rust_1.80.1.bb
-- 
2.43.0


