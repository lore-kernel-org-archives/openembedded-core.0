Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0565EC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 05:57:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12105.1721627860290608184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 22:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79333d92b3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M5sKXS003296
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:57:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g2exs97t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:57:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adZE2JhtjHRWH1H448rtwANL3xhgBW4gJJdvfdzU1Aw4kWrBjX5JXhruSmE9QWqTPPFbgvFglga27kpIJnrq1uL1C9Enkh5+a7xXuT2tCVanDiMsDa3BDMNnGyahFRhbeCtXp6xg5xOf8nqoLp25A5K/txUKcGbAyg3gjooY49JJiyVkNZ9743rU78Srfu0CQTIbmIC2n09vZiMENgAJM7vtxOmI+r9JcO/BgxovUH1v9Bw1/KrYkZf3Ovn5jlRDFv9yk7eJOSfnILkh5N8iDWYPdCGGPqlhkB08T74Yz552AMvRlCtPj19pf20g96BLlBjQZLwOkE1eswAODfajGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWcQtXtYIJHgcF+Ee6tHrH5w41w36h8o7FmCZqAyy4Q=;
 b=ovR87A33glF0oHeRg/VKMvwjMhxoSNCmB7cSsqywDMs0ZdRDBLQrQwBrfkLB1dfQnLHiw8YOBvhIyJpibu83I29cR+vD3IiTgeHx6mlz/R/+w2igL+tPOzVS4WBIiWlbEXfaL4U7c6NV3TgTjiNzFkGs8RFnzEyj3gb9eBm/UZdXgDq1VjGGCGiX/bfA2TJ1fFxvsS3BQ+Wne05gh9BjNLdJDsK+IsePKQJoJ3D7QjrdcwNK1CZI2Rluoh3pDBItXgOBAgXU8Kq7WjgbAvWaIkbzaTGABzK3fmBL5RagGa028vjsw4jHUq/Ym5mfrX263HlDHpqS9hT8hO+s3MOzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 05:57:37 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 05:57:36 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: stable 2.42 branch updates
Date: Sun, 21 Jul 2024 22:57:15 -0700
Message-ID: <20240722055715.2600693-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 90965668-9c30-41cc-7b53-08dcaa132fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TBfnBjb6PWGSoFMzx2kNXGfOApN2T+7ovjitu3H2yM914DrkzLv+S6FVvXnM?=
 =?us-ascii?Q?C/KqpjOPPurGI7dTvdsadU77yafl9M+/y9IEJLWNaeB0Fq2Nf/foxXnhhmqM?=
 =?us-ascii?Q?0G33hCwxS+ssimc1p0F/UM2BxpWfLkg6psBLFbhMU/4nxBvepB6Ydymy119K?=
 =?us-ascii?Q?hJmb9U1gtBsBKr4S6mTBMGs7/uvuNCO2XvHUt6Ho8FqXXyC2o8/Xai4K0FBE?=
 =?us-ascii?Q?2hNYHZz0IjFI4WMb4QUFpo3PR8buIrG95LaW3c6hmlIhC12mma613RKeSuv/?=
 =?us-ascii?Q?q8khZSE/+vBNPnBNrHqSe/gzCreJ68oayaptt8fKwJCN75TmEiz+TRZSDn/r?=
 =?us-ascii?Q?hoRQzSHDqq81XaT6s3GOctCS4O7e74ytjCaTEmYtANrcr0mOV5ZMHMp6Zy2h?=
 =?us-ascii?Q?56k481LVimZ1bSWLX4GKcOoNbB9O0FReeVlcm/jkJ7ADQfdqMLehX+zN0pDC?=
 =?us-ascii?Q?d9jRDdPAA3eiqvW0abd+Nz7LxXeSknhe22gW8d81lzjtD3mlVeA/ere6Q+K+?=
 =?us-ascii?Q?Mu3O8xbgO5gi2cqQVcub//YEwd3dVu/+fgJwi7e+lEuewiS4JuHCJrnk8Kbw?=
 =?us-ascii?Q?ptXpRj788Ic6LBExqzfWm+7DQo+Icb8YqHEMBs3499EfKlnP6zuXqziC4nz9?=
 =?us-ascii?Q?cLomhFobtu31w/pho5DGO0fM+si9n6gOpAVtn1JqyU88t7qdkykoRr+m4mru?=
 =?us-ascii?Q?j4UawkIkGVr2fBNFq3KP9VGFIk84ySaTVn2HpByyTOE1NAZjWiObQDMbanjr?=
 =?us-ascii?Q?djw2GS9hc19LMttuVLYjeAtg9HP9kn0Ric5WA2xkcYlp7YsngQBaY6tMyWJZ?=
 =?us-ascii?Q?Se2CBsjVFMTqHABYWSrzqVk4NJLRT7SsXEAz2DoUT+9rZ7C2uAEnHzRs3EKS?=
 =?us-ascii?Q?UCoSFZQUddc6hFwQfydX9XZEYCIBxXPetlR3g7/6iLyQmbKU/H+dMb+O0ODu?=
 =?us-ascii?Q?3hB9tYB1DfqgJnxlVnByrp9HWaCRGmzhsRhRpbnrLTBfqxv5i35y5sElouyx?=
 =?us-ascii?Q?rOxgC/kZVBTUC8cxDGdAstdUD+IcXFFJy5nGiNqgN7u13FFxCKEDZXMydqzE?=
 =?us-ascii?Q?B5bdTp5Gy1zLxWgtKYnXppm0SZJDTWXfKycCePWnI8/fe7Nrcn0w43aIRzsf?=
 =?us-ascii?Q?r7zHLvmGAZbQuan9C4tnN6iHKkHudDQWs4e7ZwsYYObwYEaxaKjOCJljSFhl?=
 =?us-ascii?Q?ciQV07ywzy01d+T+YS03dG6V9gDkspbN2KtEj+02yGksYHD/lC7q+Hj+V5LT?=
 =?us-ascii?Q?H0ovNgcP3L78E07sRvHrIXVV3CQG+wsCob5s4Xn8kQFuZiJL3eEzbXUbSsvu?=
 =?us-ascii?Q?wiN4hv8jP1F1RYDU5TpDhVk84AwDfThraD1mKfI1x6PL4hBNCsNt6TBAvn9z?=
 =?us-ascii?Q?MqT37yt1vanUQ7KnvAiYVV72aSb4ECk9C4fIftYWN111X1MA2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0xjAQsKLVdspafGZ1oPkTRCGqoJEZ0bgpXodITsgpFn4wI87RkFFMCt0ep8j?=
 =?us-ascii?Q?98BfaH9uXV6Q0cxFHRgqbovN9lDciQ1MPPN0Rb0agYpTuGRTPOrpmQpcbrWN?=
 =?us-ascii?Q?jRvz0HAv63hHtIzBIHeKCXkqhto6/Y0yV32Fs8PA0ffZ64amBhnaa5iGhDWp?=
 =?us-ascii?Q?A3kj+AJeAqqW2CsjT6GuqaDs9VWGffbh205h19lHfvk7b45Ilnlp6xNyWvoK?=
 =?us-ascii?Q?nlW17Zc94ZUwzw5PTTfTG50NA7sOygI7rjEVlbM14XXVKvbFhab387q4XKL6?=
 =?us-ascii?Q?rZQWO7zRRA7yxQw5Q11LDhUI5SUx1G1Aio8NbFwmdqwDz4sR4a8WN0DVNZ4O?=
 =?us-ascii?Q?exc6eCNTZM47Os/M7F0cLQ6qsNkMYNG78KJX+MxL8aGJbSBquQ55WeyD39JV?=
 =?us-ascii?Q?A0V2Bl6+H59ORA8U/beWW5UXt42PgaYSIX0KyKRCRYGKawFRfuBm1XqrfIT+?=
 =?us-ascii?Q?3dwVCoP0+E2goAmgFuHYTDHT9asUdyO0obXVftrmQmrU2dqzkQjLsthV8i8r?=
 =?us-ascii?Q?f3tdVoOwJ2qnv01O44lZxF0OwaphdKMB3WTZtKkVxeD+fmNvuQTmXLK0pgiV?=
 =?us-ascii?Q?bpuAhJSWRRhYM885li6I16PmuVnaYbEMZTOuPm9cMBGRuBfq+BQY3XaTB1Ht?=
 =?us-ascii?Q?4NlQf4E8w1uwKTgNfz2+jCtWKGyxlRk8H8Dt8CvstC6sEmu+iG5Mo1Q27KIZ?=
 =?us-ascii?Q?7CFE2QPquD8gWaOwQp0wLNZZr7bRb+FCxfed35RtYyRT2jVK0ai1/FxCaX4Z?=
 =?us-ascii?Q?yytkIQgP2lGGdITry6tJQbAYggmVcOhfiANP6dB5IVADmUf5UtHt1nKxCfI3?=
 =?us-ascii?Q?s98Son6CFVSq4ww9PwuABfDQTVDVAX9lTqjIQlGcp2BJl6q9z4zG65/wB6Rq?=
 =?us-ascii?Q?2izB+G2/PccQBLAHJ49ajjRJ+xImnxXRk2PoIxv+UUGEwT5gm45aNqe+iK4h?=
 =?us-ascii?Q?hVpz6LDjLAMXYarjL9yPl8nM9PrbgZJP4cLajxUSFzXVVNpBTgXuCgrxy05S?=
 =?us-ascii?Q?ombb7qE1wBV3bixKXMevvu5O49uW6Q8ycwUyISEFCZ3/Sy3y+xQUPD9C0fKO?=
 =?us-ascii?Q?jyvDhvl9xqhwmAjiAQNuxIvSSgBONzAlwwKEOy9wfoNd/AydR+MqDfLtOnB6?=
 =?us-ascii?Q?+/JMEQm9UZNAacrx3HcSy2cV/333RuA4mud9JLhMcHnpefN/UTh+YRBA4/ae?=
 =?us-ascii?Q?7UgtcbyQqFNc7ndCkkkxKm60qTxerdJy8yk7JAGJZA7LdJ6QAZRHl8HcW1Uy?=
 =?us-ascii?Q?NeVzShpsJaacm7cqHVOzIqQhpQy7HByDNLg2RuZhB412NKM9PNBAfxv7dMOB?=
 =?us-ascii?Q?v3iKrYhDl92Kg9s8q+Id8ce/n+GQX69CpmjrBj62tcH2MgrqBalGFK7rShRx?=
 =?us-ascii?Q?JXBOl4v6VAghAOb4Nb5UyiR5k8UrzfpLUR2NeYuk9hN3wROgqWfkhjSbu2a3?=
 =?us-ascii?Q?I4lJ62nzpP+26TlsDvfBN79xymLJp8yW1b/Ypr4QKuyXC6QKRRPHZNy1njJ6?=
 =?us-ascii?Q?/Lfzp96CkLzdpPmOuQ2BHLVjz6qGUt6otiX2j/+GA3u2KQmRfXvvzD3VnnPx?=
 =?us-ascii?Q?EmtjNf8ab+8hWSpJ7V7RZYn0u4q9POB+DQXd6680k88NgjPYU66tNkHjw5CV?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90965668-9c30-41cc-7b53-08dcaa132fbe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 05:57:36.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXkGQxBseWAp9Pnxos2Kdhh1vl2cnOc6+76Z0m6Iq4Y+Y0RYZWfVcKjxtNLhpOYvPYaZMSis944hRuRdTpC1A9ZBKMv1Sh13/tpYIVR+MIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-GUID: a6PCf8vm6znAuXUCDejJSaADUP04VDHE
X-Proofpoint-ORIG-GUID: a6PCf8vm6znAuXUCDejJSaADUP04VDHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_02,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=872 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407220045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202303

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
29ae8b8ea71 x86-64: Skip -z mark-plt tests on MUSL
92cc764e58f hppa: Fix handling of relocations that apply to data
c439c1e1f56 elf: Add glibc version dependency only if needed
68ae8e2a849 ld: pass -g for ld-elf tests
a1e3cb45c67 aarch64: Enable +cssc for armv8.9-a

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index c8f526b5c7..bcc333506f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
+SRCREV ?= "e343b51459ca120ead1d1a0eda14dd7bd8849f4f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


