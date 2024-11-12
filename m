Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB70BD32D9F
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 12:28:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.85408.1731414516970458133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 04:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1046c44adc=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6c6i5006849
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 12:28:36 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtu8fkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 12:28:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0lQ3y6vLlgaJfnMJMrCSCHn2Ep5d53QyNnYaak1S3JUizjrDAuF0uMfGkaTeUeDe5IPJLCVZBLHIBUOkG8K9HD5H3Iaa+cCNMNhCO7Y+AC3827/8JxSuhlC3ydTUWb3hOPJXGiFVEC9kAUQYGDcxPXY1SpteXp/Vh63srTN35VC/zX691EObuW46aDPKFqQNHqLInvk3SJYeCU0wALN5NTXoltPQF0+rMRlx8hAtTOxFjWmkBH6osV9Ig1MXmy4RNabj9sz5d80DMOzRKdfjRahxA54B04vDKoDc90KxG7VYZgoOhMy3LTSAJ0W5m/g2shJQy5eDhYDTjne94EhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4rDAoR4iSN94hvc63KncNkBozrGSXA6zRU6haZZZz8=;
 b=Z5Oyh56DOhHVl8OYyzJnM1YLY1j1hyOHRCVayx1VuodKOVDn7ztNZe4et8b80xUzeGrsaxuer6WmaemkBVa84C/XM9vpV30hFvLMRzk41xHtgmIct7GwmNZS15ylLIdCt65Gtiw0GngSAt8NAZfcMGGVTOX4Z6VXJmXACl94sur98RmeuH6FT7nfOTvtjHnDzGSd/W+zzDPYSyThmKdE5NRNJ5Lis9eqPi6DkE9L4pKT0PotuDh3mPft/6JzqAB1KYWUQ1nsC5R/R9X5LIiXDwmo+6EHVjuuGBhRDFGqa1hh1bMosmYBaotORE0GESPHCO4UZ75O0gnwzp71LSOEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 12:28:31 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 12:28:31 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: stable 2.43.1 branch update
Date: Tue, 12 Nov 2024 04:28:09 -0800
Message-ID: <20241112122809.2422529-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a8da1d-b264-4650-926f-08dd031584df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jAT7N/LoQF5xhKD9Z5g6YElVjfZop1QTWXcnRlz0malakO8vJf7kPUGWnM15?=
 =?us-ascii?Q?vcpMHSMUnsED+iSl23g8xqpte31RKWdzTePtpH0lcqQ6QMXMhnEFCznzvr05?=
 =?us-ascii?Q?kWL0nVh5mJKmsB+4HpeBj+j0phKOwVBj1tqbgk9GSaAayy8i1Dt/lhhjErI1?=
 =?us-ascii?Q?NiEeTgZU3sz7ynzmYOEqNgLx6KFVbbaISqVZ8pPxI6X4CK5BhkoVobYZIeKa?=
 =?us-ascii?Q?ugZDDD7QSLZOxVYycAzw/pyaMHHmW6FF8jxJV8ZYBKlo3ldUMpiMbp4XEazU?=
 =?us-ascii?Q?QfKVJCiI8LAL5L2AfgSDtV+pRsyLleAan1FcFi3DjtpP3iVjqglcv8ZMBiYu?=
 =?us-ascii?Q?gGgKXYsAiTgkVqrSQZ861+bBkoMKu875cZNzhfiVcGwMVt8c1nCxbwF9F9UQ?=
 =?us-ascii?Q?x7ygBcHGnmcZeUeiV8ARk1Ky2Fq0Dm+vXW6zPtZAsq+uNgFVX9tHk8cXZAFZ?=
 =?us-ascii?Q?R0WJmSGS+gN9GY/gU6+tEfpF+6qtqrL7blGrCxxdOZa7YwFiGuJy4wMG521T?=
 =?us-ascii?Q?jSurj0ns+B1cA7jHPy3Ecj5qz9oEPFHtBe1XqsYDjTJb6txNcOLiujrcpRoo?=
 =?us-ascii?Q?bouyxllxWXQBnsf9SKqVLtxm3oExwaBZFBdUoIcf8Mv1tiWNTJCbSKHMBU2v?=
 =?us-ascii?Q?ksTxpSu30lV2J7bXosVQxEZ7mmJkRcddoaBx4XZQ9YwxF0otHMmv/QtJvMEg?=
 =?us-ascii?Q?Ut+g6W+aRRtjHQZeK0UUHKnkI3LIDKIcdaTLLYO4A2+IwuwfjxMse55gZztQ?=
 =?us-ascii?Q?4PZIh9SkTOTv6qcM3Z9aHBP0U+JIxrzjSw0vMeapll2Cje6wkEajui3dqi4V?=
 =?us-ascii?Q?9OscoGz9PSInMZVsF3B9MOQcdOU+Bf6YSq02KJDotZERf+sizlM3wP4KhEeF?=
 =?us-ascii?Q?ujX6Cmyqh4qx1dlVRSsIk3MVeuF8pIhhM1L1danLbnL2PZNO6DCq0M4+N1ZJ?=
 =?us-ascii?Q?ih42TiLUoWn3EeVnZ05G/iGIkynkJxmvL957zbdYAuSM5UDFhuuXpdCYLkmR?=
 =?us-ascii?Q?VYlo9RVUwK9BzKwVtEPTakcIRQyI1xM6h8t2IPEkxSZe/jR2FfbCsuUxazKg?=
 =?us-ascii?Q?HDRO7a3eVXsuIqgFmfo/mDi4xB9U8H+D428O5IBHPRjnGGeASADVkB904TBv?=
 =?us-ascii?Q?2C3ePJ7bhBw/W916Zp3B7Lmv27AeA5SANrYeAinrNxPtORb1YEgXsF2eD7av?=
 =?us-ascii?Q?SM3dvrtXg9anXfRAbOmloB2d3QOnoxmG57Avtfut881lmRzaOObsHNGUHCST?=
 =?us-ascii?Q?m06Y4LVIkg2Y0mPbEj73hoevSsVnyqITOhTkAT+IY7PnjNMm0nIcYF/wahfk?=
 =?us-ascii?Q?Tma76cjjarg7IqOFRN1VndsAu9veX/uQVx/tpftTWm1u9daQ9a/gyFOns9sC?=
 =?us-ascii?Q?a5sEL2U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KiV3U4dHprHhUe4UCEpXVJ1uUkFxOUvY1YT8JjEYTeak3fvRYlixa93q2gQZ?=
 =?us-ascii?Q?r1DkMfoib0mo/mRQVLoSa5kDc+EMD70QM0uMk2buzoMoZKjhnMuzA2W7BoDy?=
 =?us-ascii?Q?xFqE26mng668euc4RsRC4MaY1NF1co0g5ynaaeiG781roqkVdQm9JSpOcGI5?=
 =?us-ascii?Q?FHvZtmznihJqb0BV28+AcY61u22xnZNmjau26jL5pXvFQt+XxJIECYECKiIl?=
 =?us-ascii?Q?d8Iw3GIWFO1Ies5Jo24heeD5YTmfsgUIXkKsOZtZ44AeJY05By/tbUMsacKA?=
 =?us-ascii?Q?kRsHqKjSwC1YKzG8uBOjr+oqhFAOma9FNWthfwmuXG6Qn2gPsLVhYWHDHylN?=
 =?us-ascii?Q?LVGUXpH3w5hL8mzZK1+I8xrGXiODaaVNiFvPDU7QN/jGZXdw//Mg0qMfm+OE?=
 =?us-ascii?Q?UlFV1ykS+meoSAl22GqL60xdR380hWlCN7ALXM0qz2h8C8NdyTEsfOzsm4I8?=
 =?us-ascii?Q?E7btFIjT+A7d2ck/dcSizWPQhaXYHYW5eXME78allJ75I+l71EZzywfhAOQr?=
 =?us-ascii?Q?FNEKKmh3ZLIDSLq6BuYnNFzV9/x2QM23RaHc294ww2lhuqYENVPqopCzTUKb?=
 =?us-ascii?Q?0pTmy5C0n5ZrOsFfmOXuZ9P2n6MCIeQhYU3Ws+C6mHlFcKVuqVObIH/GVi2x?=
 =?us-ascii?Q?IzBwnd8rjGx+CMGkfq/mMcvx6jR5HNputLycD15tmHXKfAxAobfQ/KQlHuWs?=
 =?us-ascii?Q?ZeycNv7QXa2komFDrjzmIEDu38vy2WrdxlVulxCIDQmbU/aAiNRfINAz/rZX?=
 =?us-ascii?Q?QSNRVPt9et6OI4z8MVpLqSNaWVh7Fvbn7ZcDkkc7wvV9ZIwY/2p0dSYaTLYr?=
 =?us-ascii?Q?MzRt57VC5MVhubMFsnF7NGH2Z7YSmfqnZiVly1oieMNi1A8hkhEVgIGm1uXL?=
 =?us-ascii?Q?FxNr6Rgj8DYUv8uVwtpKzaSWHxBL2EAmVi7QRiaK7wQQn48Wqd63s1Q/UdZ/?=
 =?us-ascii?Q?ZZW37L71R24Wvuu0OKjNgy8CXSniYQWOLtd0mKPiM6fMNGkIh3EYD+yJAT3w?=
 =?us-ascii?Q?Tjh/zndn34SQp+dOH0oLQkP+Qeg0ClGEfIPxc0MuuCAOWywrx26s6XwKqk2a?=
 =?us-ascii?Q?VI2jR/H+npIUI0ru4vGlnsX00s6/fa6y05EcUM3l+hOqhLEezK+YAbNlGrlc?=
 =?us-ascii?Q?l1b21SWGPMuXYBEAh8p1iDFwjU3Rxy26FtbvSv/CocwpCdZBLbAzva9GSg42?=
 =?us-ascii?Q?/4cAYDTH5fuaq9vmncSaM/0X5ZEvN5MTy/44Vo8qfWlU9jgaXGLwnM1D/mgS?=
 =?us-ascii?Q?kp/Ym4rP3mqk399T1FHSdUKUTgvj6fMTvKuCGl4Jkf7dLMdJ7gG8hGT3rKcU?=
 =?us-ascii?Q?SqDHuu0Gr9HDUQ//qTR3XU4yVFjoCCQZE40YJBYOTd/agroPGfDNW5Lp6w0Q?=
 =?us-ascii?Q?q+1v3PTK/+gDDMbhrE5e6ySHr9PQ95i4Cy7ac3VwXUqLkOa64ctu85WBt/D1?=
 =?us-ascii?Q?wJ9ebEvYH94+QQji3OcMjSBYZyABEPtOV1Bw+b2KnhbMpR5zYlVgmjYqqkXp?=
 =?us-ascii?Q?O87XbDx3Qanf2z2HFLm4B+hcf1nPl6m59p6D2i3IITOTiW6EGKq2SJv/O7NJ?=
 =?us-ascii?Q?xo0BE7QU+ad5YdVAd+StAFCXhMC1lj6xmtxisIse0HmIZejEdxuzP0KfBUCL?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a8da1d-b264-4650-926f-08dd031584df
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 12:28:31.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0sUFNN2agQ/3iAJUdNVrMqm8vIhN1A0LTysL+pUM85UMzA5wLlP6egl7smXHkAVy8QhAiQMxmjFLkvKCXEbEOysld1ILtHUkXlCCNVp1xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
X-Proofpoint-GUID: auPdQ5DN29ktBB-bVgY3vL_fokYo9OR2
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673349f3 cx=c_pps a=kSx+wkOqrR7DBdLtetN7AQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=VzxQZi0QJwpYnl2bu4UA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: auPdQ5DN29ktBB-bVgY3vL_fokYo9OR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_05,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411120100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 12:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207047

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on binutils-2.43.1 stable branch are updated.
b82e2250574 Automatic date update in version.in
280374309b1 PR32300, --dependency-file: link dependencies are not all collected
263e116833e s390: Add arch15 instructions
645da6d426e s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand constraints
7f7047a9c6c s390: Simplify (dis)assembly of insn operands with const bits
e7592364504 s390: Align opcodes to lower-case
d6ab1d2efdc s390: Document syntax to omit base register operand
c40337b1784 LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch tdata
95ed7cf1be2 segv in bfd_elf_get_str_section
0a71d78f6a6 ld: Don't explicitly add .note.gnu.build-id in elf.sc
ad2ce1e6457 x86: Turn PLT32 to PC32 only for PC-relative relocations
238493e7f09 x86-64: Disable PIE on PR gas/32189 test
68d5dbd315d x86-64: Never make R_X86_64_GOT64 section relative
d77d08180d1 x86/APX: Don't promote AVX/AVX2 instructions out of APX spec
f307db3d8b7 bfd: Pass true to ld_plugin_object_p
cd3e2b58f2c PR32109, aborting at bfd/bfd.c:1236 in int _bfd_doprnt
2d37b890e56 lto: Add a test for PR ld/32083
d16a1893c44 ld: Add an LTO test for common symbol override
e4cfe6dab3e Re-enable development changes on the 2_43 branch

Testing was done and there were no regressions found

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.43.1.inc                 |  2 +-
 ...-of-system-directories-when-cross-linki.patch | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
index 1ce19fbdc6..f472631932 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "beb2cdbcda911764b2bed5e57921fe90493260bd"
+SRCREV ?= "b82e2250574ef00faf7fcb1e95e14f22b1fa85af"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index b267e516b3..0c429d7f2c 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -184,11 +184,11 @@ diff --git a/ld/ldfile.c b/ld/ldfile.c
 index 87be885d31a..86c8a5b267d 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -344,6 +344,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
-       search_tail_ptr = &new_dirs->next;
-     }
- 
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
+@@ -319,6 +319,22 @@
+   *search_tail_ptr = new_dirs;
+   search_tail_ptr = &new_dirs->next;
+
++ #ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
 +  if (command_line.poison_system_directories
 +  && ((!strncmp (name, "/lib", 4))
 +      || (!strncmp (name, "/usr/lib", 8))
@@ -204,9 +204,9 @@ index 87be885d31a..86c8a5b267d 100644
 +   }
 +#endif
 +
-   return new_dirs;
- }
- 
+   /* If a directory is marked as honoring sysroot, prepend the sysroot path
+      now.  */
+   if (name[0] == '=')
 diff --git a/ld/ldlex.h b/ld/ldlex.h
 index defe3fcbbb9..aea75a25dc8 100644
 --- a/ld/ldlex.h
-- 
2.43.0


