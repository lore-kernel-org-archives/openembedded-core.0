Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8554AC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:37:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2497.1752565031550234337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 00:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=929159a285=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F5pwOj3244402
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 00:37:11 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdr8fk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 00:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCDMwxiVwoVGw0dhLBefdd4GHl+0Z41DDedX2dQs6Ql2HcC8ixp/UQdxKkyoPIIN4BHhXdvC5+AMLjFTlVRYbNZCTG9sgcKpjZCMOX1NPdqXTCxHJcH+Szl8G+KMkboaHpOZIxsj5DthgZMCKUa5rIuW3uMU3LTJTxJLeyMGhETfQWiGNtiSZ3J8D0L9jpSFroWNNswN/B9xvFgb0nVmfqm9OWJvQeCRkXTAbP1s7laWQ1WdY1z0UgTKZRK0+HcTKos+nQaFDWwAebqCgErbycopi8ILJsuvADZQhhl45IRlXlU9HTknofYuUxHdNzpQpu8xM5Ew8gpSPyPcJShX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc3ttp2j0seeF9QCrELT6pZNjGGk1HpHVcNtiydySBA=;
 b=oQUfOxs1DWCwPdbJYkekddrqNGFwj06y6CGpflUcEpaoCMnLiVwClU3EMT2KxZOBt1nNtoOdHEwpgaHvUh5SxhnVEOoDh7Ls1exFcw7Klu4puPrtfV5OZQvILBc5IE6CzLhle7eaTx0EO1Gj+NhO24sn32EmQDEiRQK0zLInQ4jjNjOOZSWRwpts54OdPUI/7jXSlKUL+cXfBiu2cQDX3IgMD1VxT4fsjYPS3SryF0yoYfd2jMxEy2yCG6PT53nr3jtbtvHtAoSXpCG+0PIEMu7NCarIpHrjllBnb6iJ66T1nLUCPSM4XXxkWHhSuIwFMbkGX2Q5C2lr5lAhIzZPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7691.namprd11.prod.outlook.com (2603:10b6:8:e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 07:37:06 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:37:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates
Date: Tue, 15 Jul 2025 00:36:50 -0700
Message-ID: <20250715073650.417665-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0175.namprd05.prod.outlook.com
 (2603:10b6:a03:339::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 241dd50f-7c73-4f71-c580-08ddc37265a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mLZMhkE2CqueBXL5CNNXTORbU34g/PKEyvU1DYjSyzi9FsRNYsAKUPPXcf38?=
 =?us-ascii?Q?p5Ei/t5SPDz0Gh0dVgLM4UhfH5DLymUaavP6oH7noLtVw3v/sVN9t0dvTOb6?=
 =?us-ascii?Q?rM9Ri1EwmjRbGXWokjUQpimt720alvN1zn1yqM1d2E449ruIoEVZFKNwq6ky?=
 =?us-ascii?Q?JEutc1gG0fsYYkYoguWodTS7js2vmbTXQJPX2lynp4MtHKlU1YJoSmYwfQ3B?=
 =?us-ascii?Q?fLP+8Aq5ALrr2YCbHc8EQ/SBKmCL9I5s//keaPSawRQH25pC+xg+99+M5f8o?=
 =?us-ascii?Q?11D0+ZlKQ/dwdfhqxqGoYLwJBX4zk8wG0hhEKw0mhGz8znci8mTnVCW3WLAe?=
 =?us-ascii?Q?5FBXI663A3MQhiqOVcIxIBkhBFlK19DTgMl+wOhSodOLwHBz96UOAbVZcUJG?=
 =?us-ascii?Q?sI0+NrEml8zlaUNardSulEp0Ci+vwPhEYYhYj/SfZXxWlXjkBngpGGjGxkV7?=
 =?us-ascii?Q?nPitjQ/ENZZS5J+BYnCncQfjDftW7BfMzYyWZCygmmY+hOjn64LSYERSlSOf?=
 =?us-ascii?Q?tfXZ+nUjpn/OL6nlUnYW4np1Jl8FzqHFo++f8Z9bpEZI69FW5HRKvf4oSFja?=
 =?us-ascii?Q?agC1Y2tzOE8iOuQAJGEaWz7UUsQxoBjez3Smdl5vbPlPW96igSNxUq2hGNnz?=
 =?us-ascii?Q?Lo1DvFh7uUnA8EA+QEFExNjiTdlaGe55zDXul/adYzLD7WA0X4TM5Va2Y3YA?=
 =?us-ascii?Q?NFdVXTr4fogMDJMsxn5GGKlXDJZ4bWyt6pHpW3WkcVv2WM6sLZN+8QSBa5/l?=
 =?us-ascii?Q?uU0hlMR9p94ySTtde0shytnTGrF1RYr1sMaM6zIJRmyT78MdNw1hHUtSIDUp?=
 =?us-ascii?Q?J6RBBOW7YRWJnickheTHkTg1bmA5eTUIuc1llgjAaBW2fR8kx5w0oa6a7RTC?=
 =?us-ascii?Q?Zg+AEs01/LOvJ823K7YmZaruR8hWqcvupcPioybFG1yfhpRjsVGCZLxerA5Q?=
 =?us-ascii?Q?HYZ6iyRyHb+IDAAJ3zJOwvNCskh/ltnM1QwQCJeLdfatSGecJyFmbzUNFovW?=
 =?us-ascii?Q?eKGlWLNbnJCdSuGcC1cWB6cUUzbu05UHsEu64VuuwfkwaXbuR2XLEiX2G1hj?=
 =?us-ascii?Q?pt3pWp/0eoYQpKTuXgjZkrlVvtB3GCKM7iTffH33aPodt5USW7iVyncnzZx0?=
 =?us-ascii?Q?T8K8XyRX6NINspYezOxxVhx263hnECXx6PlT6vtEEnbqov4bOvnNGvSQ3ukc?=
 =?us-ascii?Q?ikLCn6c83IPN4kAxgXxscHHLXrX3eaofUERW2djJpIO1UnhaOjXvTWg7yTJr?=
 =?us-ascii?Q?Jab92wGGmzjxmt6PRVZ04Sb4XP6mfI3jwWQ3GMgTnPyM43CGkMcQE5gEl2Qg?=
 =?us-ascii?Q?tRVn0OES3NL4LVjHRVIFhXBmw8NghNL8otvgaSJyEDp8RTOWLICaRPThBrHB?=
 =?us-ascii?Q?U6aUOKnLh3FwnbkhEvWDUTgLQbgCJQZuT3IlWHKCicH6Ud++vjUMllkY4Yr4?=
 =?us-ascii?Q?leNHssu9XW0MIFngrHOVRva/yWezCwQRQ1WZkoKrJRSHRAP1nVltTw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XcnM9Od2lx3hHCBL/gUvPluIO4hurAgXXcT7I5vBeo19XIzQnRi24bhl3gD4?=
 =?us-ascii?Q?PgEPImt4URfywMuWEOnxQXu4pnhUhafuJDc3qyYS6ExAKyBCMopkuixzklJ8?=
 =?us-ascii?Q?gqTRnh1yOz3/0BGJ/kXnXkPBqkXvNRQwFK8x2vjbu48um9SOftWmgLsQdUU4?=
 =?us-ascii?Q?n0Eak1iE6z+tcxt7T+v+OknJ8iybkR5v/IVK8Ao+AdTGNxJSPudN+39PnjHZ?=
 =?us-ascii?Q?6XFyhKg6FDBXbn0K5O0VKOD8JAyO+x1VUoCmZpLvHL12tuOpyHSssu9ZYahh?=
 =?us-ascii?Q?KrOVayE4HAjlchfpxxP3vIE9H6CZR1+i7RH1gl46HM51gjHZU/sSKWybqANw?=
 =?us-ascii?Q?pD7dmVbuS4Sn9NlZnxU5cK6CZdWTRaCpqcEkDrSrybEjHTblBqxJL/fMjRl0?=
 =?us-ascii?Q?tKGphLbTbuvK9X2nXcM1onAEjmeg3PtqnHt6BMzyoZqGZ3L7QbJgDiwLtZ7K?=
 =?us-ascii?Q?h6ITyts8/BPnDlU0SgAWy9tdHRXE+OSaKM9e/cxjv9cYpMsOo9bH3nBdjNUQ?=
 =?us-ascii?Q?1sQX54zrctp1qyqP5GU+UiE0GCRk6WHesXABB6vmmZTMwcwukGSQnOz+nWwM?=
 =?us-ascii?Q?5ZOOk1JFa85uo+MNixtk/9oA2R0vLgVH/Peu779NplimUkrTWlMtrtX9TufM?=
 =?us-ascii?Q?NsR2S9xdKmzvilLthDlhF2K1VQ2nXSk6A9B+RvCvCjl625jgoK5JPyvwEB5e?=
 =?us-ascii?Q?geh6iA4er4x6Z39+6EtBSOV64vAfZAzIEzFmiGUHzKqZQlt/+0j+dcW2guRf?=
 =?us-ascii?Q?cy6SsWdw3Hl90oM1lpr5/0a7Hf/vQE6HQ53Qisn27TX9qbzoDt9tmXIrfhvm?=
 =?us-ascii?Q?HcYuYNW5jl14Ujk3vRzQBqotaqvztuRBbRM/mrbDUFW0XFO+mMGOTEhfZO8S?=
 =?us-ascii?Q?unzyMzLvsWC9vgQGshqARYgVsB7EKC1dCi0zsrEeF6JnqObpuViCYa5RhRJc?=
 =?us-ascii?Q?+Un33PWIFJIm6wwJ/MAoXKyNbAcHO8inHfwo4ZSrvQQpKh4Y/IG93fpvCEic?=
 =?us-ascii?Q?YVVbEK3b2T8UsesZe+sjhV3cKgfbwPGGMeF242fUOD+LiOry2wPVd0ExJ2k4?=
 =?us-ascii?Q?hyOSCvBqHFpJDb/ocEc0kIbM68dWq0+mEp3vCU3M1gH2lGz1ec0FMN8kNiWG?=
 =?us-ascii?Q?Oc64chOgEHHT7/QZFdanUVgQiapEpr6fFBi7Mai1wbmQoGyePMHwM1O1anWi?=
 =?us-ascii?Q?ulN114cW8RrRlv7RpjBopaceKr/aLzH4uxw1HKPLs1z/6ARKu5AsyOX2hjbw?=
 =?us-ascii?Q?DeOOwt3EZYRLjqjM/R1MiD/eG16qaPQZHIvEtiFEhIyUcp4BYFsE+ik9OGlZ?=
 =?us-ascii?Q?76duiWiZnraqoNk/otePOU1KuHqbtp/MF9Fx5GMOEreyZPtZ7kIU9YEl90Pc?=
 =?us-ascii?Q?a+Z6j8+8Ta1XZgu+vsyuRVGD9Rpv9StRwbG37ktXH3LneJdhrpjb+iQx6lxF?=
 =?us-ascii?Q?EX62ykD5Tu5cdwWEe9TAd5WLpn+C0jI1B0+QXPbwrUcsE64UaDJH0emPtdG/?=
 =?us-ascii?Q?ZGqNXsyxwSey2xsWaqVhd284Q5D8jw3JWJqpWH2ECNI971K2r6djzvWl6p7P?=
 =?us-ascii?Q?kKt4UzLJkPTsvtlwJ1WTlE1FkagtOzq00Og+8wHtQlGi1HdlT8Dq2FgAnn0S?=
 =?us-ascii?Q?jKQbs5sbYSC4qPxQvS+PRAM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241dd50f-7c73-4f71-c580-08ddc37265a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:37:05.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ycqw0v3zmvZODMDsU3O7k4IQpYIQ/vznb7UvqNtTACmmnKYrFcxDuAyK8RUCoMKKhacRUiaHcXwvyvM9kIWvF1w6evWoczhj7FwRxHfskr5vZYgevvOh30LdNT2HFqal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7691
X-Proofpoint-ORIG-GUID: rFdBkItMXVo50a6Q8stJNPGIuWUAOOgy
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=68760527 cx=c_pps
 a=iNMpamO4ZYO2Dvx13ve0hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=WyqX61epEs_fYRVEAk8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: rFdBkItMXVo50a6Q8stJNPGIuWUAOOgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXzB8j6aK7pVtb
 PGwFkOxUOsbMUINTHAJUlbGiA9zbXmMvdj1N1epglXWCOj1ByqHE8QPxBMwDwptwe/ayMpDfjPX
 uVIgnE287e9TDTHzl0z7jRMcPXU1EEipq2l97y55KDBe02uDipvq479iv/cmghbJ6RVcOiR9YXr
 RKBc6Xk1W/YG91U5bSvKAVX7nvKJe3qgGTsnOpQcMFuh2vpqjUImVZh+ZolJY9SuF480d2lQKfW
 m2t7YPny2bnxP6a1br+zkfnjFJY0aWEv8iT5zEtkol+FJ7bsPbrnk05hKMVt9CMpU7ETU032zDy
 csrqhX+p93OHcTiS5PwAsf2yUk5GOkrwJicexMmTVpGmb1unn69pRcuTa+YlSkNLA46nOG5pZZ/
 a96NTAjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220268

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.42 stable branch are updated.

x86: Check MODRM for call and jmp in binutils older than 2.45

Test Results:
                                 Before  After  Diff
No. of expected passes            302     302    0
No. of unexpected failures        2       2      0
No. of untested testcases         1       1      0
No. of unsupported tests          7       7      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index ea018a48a3..9471e6accd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
 
-SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
+SRCREV ?= "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


