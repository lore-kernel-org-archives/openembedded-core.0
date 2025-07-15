Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB020C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:54:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4623.1752573252696930756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=929159a285=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F8hfpo3496391
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:54:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva0c35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:54:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEEvtIxSOgRBZ/PsyODG3HYZqw3dXK38/kp1bJAG/bBYQzgONTzTRBmhgGNi7DdKZ2QjMwJtOtLhDOCa38GRqXEXiItau4JTrohfKwqhhbTlLhc2ZfMKefuPCNvyJ7fqk8JzoFN3WwSrMhkK4/AdBG8NsZBoKwKAuAYWcSIMfbokjaE8e/5dAdjFlv2wbsFe1XGJa8difgiZKz9vh3qsxlvOn/E8jzrkjML7XoAqpj4WBL2ICqwptEbXO+wiUQGkgeLmWnbJNVwJIPX6MA6qPlckabIV8J42yoUIQ/2gejs4ZuGWuMrtfzJAYAPUANRqFreCnMPH5r5y91bBwvfGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtqKdNUTIfN/Ym/PWE0OGYHMq0Q3DYj8TgQOuCfjQzo=;
 b=gXJjLYAfUR144TJwKvl0uszeIqdPnF3Kcqbo9dL+Z3TuECYxDhP00MMpXzT2g97V5YSyWCycWFW4EX77wDcToPGMzHJz4ENl36UQgi+WlgTMgwDJl88erGVZQKpIQxZUu3lF9NPebyN0GC/xo80EfJ37vm0d8dXzc7Aub5vdGGNYzGWLF890rKe1kevabbJGKpuOTZtmJ0fWDwdV1os6ukmZuiL1Ns5gi4vtjZHywKEyn6v3SMdnKI322WIzVPtjoytpaMZJseb+Kz8bUcQT0Pyyit87ECuAaqFfLFjUicHyi6jjhFVPoyAdtvEe13/r1VnL5qSbh7yqpEbDWXg54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 09:54:08 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 09:54:08 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] binutils: stable 2.44 branch updates
Date: Tue, 15 Jul 2025 02:53:47 -0700
Message-ID: <20250715095347.521559-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: ced53645-6cfa-42da-b317-08ddc3858a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m8BPku7NBL/lHAH477Twjrz/cAS0Q9/Tl4urgds/79Cn0TxaCa2zzgzfricQ?=
 =?us-ascii?Q?BOYzyL9nROvRPQjM1UxVjoDclnTq6Vwgk9pC5Xn6+1ruivousVC67neh0UkH?=
 =?us-ascii?Q?DIm82PpHeoULzNoGBSBv0Tk9EbNjNplo9vvQrZN3aYUPIVWD0fA4OK07rbK6?=
 =?us-ascii?Q?Djijqh4tNf14cLk8cBVutNGZ041dghSBzjbMyv89Bf6Mvhlw4tszx4rXIhG0?=
 =?us-ascii?Q?q1PGO0Un0FDIx2ef9oSoQG8ZlcxWGlpnTcfDe5wNJBkH/rmu6Tai2eWRarmI?=
 =?us-ascii?Q?GMF+/pqN3iv3Be+uUmBdRxw428U8LQUe3yZF6L1PCZpH8i3Gn0gBqCvDr1l8?=
 =?us-ascii?Q?tCLoCnChF9QFIFHAbsXAuj8iuZsdMlMVGQQX45RUpjXX5a5wHbluqyLzLfVt?=
 =?us-ascii?Q?se50ShFq338WG86uCz5oKlam8w2j4tKcKVVqzY/2THi8KjPNnASsUuty7b4k?=
 =?us-ascii?Q?X6WwLPPpg9QZJ8R2i1FuGIqTv3qcgv/utH+pdpB9O6yZ+uWx+HIRgSgQ0Ri4?=
 =?us-ascii?Q?jWhVyiVMd+tisy7KAK2ULteC8jbq9Vw2ZVUBXTvj8vW6x9hVBDnEBrrF51/f?=
 =?us-ascii?Q?QXPaYzJhXA4Jswpk0nuQEeElrgFvID/FdjEkNs1AHX0lZYtxqfT8TRxfR3KQ?=
 =?us-ascii?Q?yIb4nkyjtzRCkyLyoVTzaeUFKrhwseK9l0hobzmAyFKFr84QbROuEkftO8rT?=
 =?us-ascii?Q?2RjQ79Ux6frDhITdPcN/TukYasoQMWd93AjdumTG9t92TEU9d2mdIfipEF1P?=
 =?us-ascii?Q?Xi8iZR4GoLIpqF1vJg8+zZzYggSwF2Urqv1AgB/L9z4xIYDsIa9vBQ7BrI+o?=
 =?us-ascii?Q?RR33k16d3wZLyfICikYilNYXMxMNHzY/dQj3WXNYajgqlCavxw1Wyo49MRrz?=
 =?us-ascii?Q?om+kmFCrKVqMBrehgFUED/CAc1B3V/FNlt9MJnygu6wnCZHdPWOTDOj/uOCI?=
 =?us-ascii?Q?2K1bvAtR8wUOmpWTt/XBTW1fDmS+811ZHQuMtzonvCiaT4PlcpcZsLBqlP6K?=
 =?us-ascii?Q?D3VrjWEP6zjpG/bTYYRqnosz7lrP1bSvkcLmeG5bOYUr9onM/DWJ3BMN+A8y?=
 =?us-ascii?Q?uBaLTNDV7EyM0xq7PZVtU2M5dS7uLvJavU/h5K5dcVM/uHReGZbVn5IGPX/d?=
 =?us-ascii?Q?eiehDV+Iy5LXk1x+jXMXDPo3/dNpHyHZoC9YK/r+2f7/xfawwWpaqBDL6PQX?=
 =?us-ascii?Q?7SyltOB+cu6L4I5n0P7EeRnPIKKJra6rWZYEVcWGUdxLXyi4QM1DpFBrxMck?=
 =?us-ascii?Q?rQs+IuOojSxLgmNdtTpubqvbHg9ZaTeRKb7wbY9E3YDaVypOm1XXKD97bwT1?=
 =?us-ascii?Q?tcjIHjZFARBo5jpOQ3oH24rfOeVdOyjMKwMP6VVVMtDJHQEjEm7td5I5THtM?=
 =?us-ascii?Q?96Y0gZwUiXMktokQH/VaYMFyVMf25CBmiZkJ7wtaBfUirLVWvBRw4R99kOwf?=
 =?us-ascii?Q?nNOcfBuQjtXPmTWS1EXXPy77gLDYXXELGUhPnNgCYoZXma/A9yAGFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QiZ7zmLUcSh+O95Fo7MEUsonkiUNEFIUfjPyHwaxY955gT0MnARddKOtq7/k?=
 =?us-ascii?Q?zLduLhwg4bFX9JCjDnj1i68IZQQN6KXKwe7v2MVSHX8K/1SSST3tLyRnjbyJ?=
 =?us-ascii?Q?S6hlkvrgtdbh2jwO09YY0aYiUkjwhMOqASP0PsUOk9eBNDyv01T0RXvlgS8W?=
 =?us-ascii?Q?1SG+y3onRISDt91tChmG0Kn1FxsPY1Eol+Jcjgz+c2NhD5dYR5esNrFHuMMj?=
 =?us-ascii?Q?ElMKGuBPAmsJDkUm/j+/hXcKcsWfLVcxAcF7PMkoAEktsRkIu/2PwyZ/HrLr?=
 =?us-ascii?Q?pUpmmd03U57YRJ/pMbosCtGnoTdICUCropcRx17yCtMUMXFogiTeKs9eLz64?=
 =?us-ascii?Q?B6F6EDHiTRFHR5iOqu3ILnQ6RHYMZL7WJ+VbHCJA9nmxHH4v17LXlf/DnLbg?=
 =?us-ascii?Q?9EmCcpBvHhliK7kX0GwaaakpL55JzaDqeMVNAne5lVjJLdDPTZCOinEfapKU?=
 =?us-ascii?Q?gnXlm4z/7D49XGmlP+ZhSsZdMuyMnWnClPCT/16FmZ+TlrgTt2KOwIUKVpS1?=
 =?us-ascii?Q?G8R/LjMrctiB9l6tuMjrh0moEDj21Ab2RORjMtKHJLIkZlwDhi3Dk7ooJEYy?=
 =?us-ascii?Q?lEQf1jnVkNuHiyDc57qWkmsBhVN7gvWiP+KpN8mKXYd7R6QXbhOTJEP0HCEi?=
 =?us-ascii?Q?usfzUglonUn8yTAC5mVAFiOhpD/kPYrXdBq2tVlRkGC85JPNx6bKelL2K6w5?=
 =?us-ascii?Q?eY0SiLOkHBgJT3VyQPtxytZou24iYTg39NOEWBDD8Gk/ZYowoyvabcogyO8/?=
 =?us-ascii?Q?SCDnVA1lku2B42Qhy78bTCumkbvcqiCoxfn/9slQjgJJVndw6SIfwhj1hGAO?=
 =?us-ascii?Q?usODOnXcRvJ3LAuJQo42JpH3+u7gU3syf8BQkYRMa+yN4AVkg4qm/y1oeDqe?=
 =?us-ascii?Q?cjDM1saAl0m31+psQZ+b21S3Ie2zW/Zvd6DopzQu9nF4mRHF4kJHV1Ko7K1F?=
 =?us-ascii?Q?kyfIOE3nJI6sybBE6gcmhosPrGWE0p8T16/x6ebINdcAb+xBcedTHG2UtZIQ?=
 =?us-ascii?Q?TpUB1IR3ISF29HoY+pRmuMlWyJVgZHWscA7FRioefq+IoTT2eLL3z0j9qcs+?=
 =?us-ascii?Q?Gp7Pax8AlLEV9roqmO9mfWC15E+W961G26j91wXyply0UzhviibFG2F4Cj/Q?=
 =?us-ascii?Q?udZwaHMupmQ0wrg2fYBwcq5qP/4FtJXuZI7kteVm2yXQBpvrf/doGAG+lDCN?=
 =?us-ascii?Q?jZz+5NTK0pB+llTeVyvOF4oXW2qnW8nW9GGvrZy4WdDfQAFNbm3eR52gw3QY?=
 =?us-ascii?Q?MXrguUBwYZ/Ymm+vN3V+W2928xN4OH0hb6BO9vFtyeflzwMNf4gQ9GhoMPMG?=
 =?us-ascii?Q?ZU0wBLmIK/Mw6afsj8+ejSatvDMSTq8tPzuTpEVSJjnhEXefnNRbTUVWJK/h?=
 =?us-ascii?Q?0BAWEr4ggTIDJWLz43P7xHGcr1J+nI4VfhFhCqtaGcKFUG2hJPVvbHcHiN5K?=
 =?us-ascii?Q?P6I0i+JNg8T0Nj1ZKDSGw/xFH5OnZtVB+7i/N8qSKNNol8hpcXZJuv9tcID0?=
 =?us-ascii?Q?YlmXtl+DYP+cDty5pNcJohNsQo3Awjlc928kF3uKvifkNuJon3+BKrAh0OZN?=
 =?us-ascii?Q?Kk/Ngmdpl+zkLGwphC03kwT5GRll91yPJsRuBF5WuCEtPxKCfLDTbtmRwdvD?=
 =?us-ascii?Q?zJqkmhiula2GQReJFXO9jo0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced53645-6cfa-42da-b317-08ddc3858a9b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 09:54:08.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 793KqKoPalfpOsxgFeLcoBTOeaHXDVLQxMNDLZxqTN+JfEoDlmMWMCCKps8Ji372XJaedYAskqvkOQy3fQIh4fl/iW12TeQgFWopUrl8xZoi370Y2AhbxNr9pRKRVl2q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=68762543 cx=c_pps
 a=MVVasGN5sdISSE8Qs3so7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=BPCkSgjTfvdP3bmmVpkA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: M6H8tgK6vxmcBNyft1EL-AkHaaftnqvA
X-Proofpoint-ORIG-GUID: M6H8tgK6vxmcBNyft1EL-AkHaaftnqvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX4+gTp6IoKtNz
 9oqt1+2UxTpJx0XbDj/z/+QFyeqgEi+nYnZbtGG0Yfa/5pmU65AJvEbmOlyWFE3HhuMekCk9VUv
 XPx3L3LldNG+kY6F/ce47JlGyw2ZskdMyJ9lz7MG7dgSLrajsKF7wTR0sJaNFp1wMGrNoU6FuWv
 496aaFpAU5aeKQp0zvp5u7zPSnIGHi1oo4+PETaROyXc3z2Y2KE2o9DfJFKfLboW9/VfJc+htAp
 4e/PhkyvlyIKnFAsYlWuuCJXDN2Cm1bSjeuPIJjuuMj+pcrv8Nc197f01lEMIFCiO+PoFwTOIjn
 8cbH7wHDbfP0/PAwfflWB+Mq6E/b5Xjt5WwROdwkimighlsx18KxGQHrge0HN2HpW1zLQ4pyNlI
 m1Wl6tMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220291

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.44 stable branch are updated.

b09cf42d51e ld/PE: special-case relocation types only for COFF inputs
f0019390d12 s390: Prevent GOT access rewrite for misaligned symbols
452f5511154 x86: Check MODRM for call and jmp in binutils older than 2.45
4058d5a38a1 ld: fix C23 issue in vers7 test

Test Results:
                                 Before  After  Diff
No. of expected passes            310     310    0
No. of unexpected failures        1       1      0
No. of untested testcases         1       1      0
No. of unsupported tests          9       9      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index e5df62b14e..8855fa709a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
+SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


