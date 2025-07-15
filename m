Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719FDC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:25:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2300.1752564297096358787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=929159a285=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F4Lcrp3099393
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:24:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxg7pd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:24:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwQ/Ht5whbtqb07URV/JGR/ixeSFMJHwbyPKNTuUtakE1HSi2+s/Uknk6GySn0BWyR2GG8rsPOJg8M3b/fll81meP8PwCKF+RAKtC197d3kS0N+sFjnpg/+r8+s2Dlrh2QABjOUKeacCagSD8RadS+2D251AB0asdtZX6njVVGQCKJAtPFeplofkyo/PpncvcCjN6exCbGdcI+O7bahm+K2zjo1IVagTzUxvC2EjkRH0ICcYcezEZ26LcM0seJVu8WlwneflO1awEvqkmYYzAE1gD7Lrwoa1Y0Xf+jQOvTgPccsSsC+FPAWey2VNod1KZaUchqCkQP7ymJm5jqomcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5DTOkcegTWi+/tupbfMtClvy7L9lZhHOmK9elvkl9c=;
 b=FVeAfFB1pFXR2BxzIn1JsyRyJ1jFSHNsGSGm5jNWRaH3wSisCDobMLp/csZbMxCfp/xTH5QfZIde16sotPe36rfQmVwU48SVpf6KzmqJKYk7gkmInFLh6cTQQ5knPz8VeTyS0NF+KExDn5FHunMGRodqec+3zTFjlSX3oJ6aGok8q9LoDA+5m4mB+WvVnYd06xZfcO6REDw3M2vpXpjcuw2X3oPOhpr/VmDPxBeHSYxgl0JHpbTE5vazV0fbpZlkz0YU53tdCTfWdVLyQr4cvLmGuFiVqn2Fdoa5wbuJhwASto78NoXfrOI+KTjly5uS7UtbaiuPa4RBrXS6A+ofwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 07:24:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:24:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: stable 2.44 branch updates
Date: Tue, 15 Jul 2025 00:24:20 -0700
Message-ID: <20250715072420.120681-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f823ac5-f1ba-4be8-b53c-08ddc370b059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?66Ax0r6WReZEzXQzt1sXYjzvBa6eZp76ymtnhHaQDQWUhZpYVFfNvgSuLXy3?=
 =?us-ascii?Q?siiXTnEQLevRulymf/dadCHg1SMdGGhW61NP4UzIzzurfc5xuToQaxFCO8rV?=
 =?us-ascii?Q?vFtm7ZNOQ5fM1+ODAYI5DJV9wYB5B6yw2N/8Uir0cnYsdQBX1RTOCw/bL+tF?=
 =?us-ascii?Q?36g6FgMmZlZhSBiu1AfYIfzcRTz4ltr17X+MYPLNYlqQTxNPEgoKFBdGhOf6?=
 =?us-ascii?Q?hymvBVK3GSaTphWPJHGm7Q8F+fTVhXbvpK6GovpUuWIXIcn/YjGuG2nGaRKC?=
 =?us-ascii?Q?1XCNUUQTzcA4qjjiNkodyqaZayJE21SZGbpB5OMNYiX6VixGITa9m+iwbiCu?=
 =?us-ascii?Q?UopozjgAtyzG79Nhc9Ac0mF3CGy9ry8Ubjr3+dYVIGWu06z1MP2ku6w3muFK?=
 =?us-ascii?Q?DdsD0/LXEPPpCIrwDrJSGce/xdHYBwHXPszYcqFtzqNJF8lVw76TQiAH/PZ3?=
 =?us-ascii?Q?7uKcmaPxNV/yOzi+lZ0uuZQpj0U82ko8GpOR3OFP8O5hn8elS/xMocjSSNer?=
 =?us-ascii?Q?41GIV/k9+Os3AVG7D9sRpbC4cnmSikY6GnZLT1JR81nBWx8GBu64F++xw2GT?=
 =?us-ascii?Q?y0+07X0JJR3nrZZLsLg6y1yRDRTcgJyQ3v1JkLu0JPQ2g1+H1XOWvNxF2C1g?=
 =?us-ascii?Q?5KGNnrDKoBa2TljbaTdNRKV2Qx5f0yMmHE5Zt9KPLAx3fsFmsFFpwKusdYEg?=
 =?us-ascii?Q?4VKNJ3Gq7JzuvOLJHazSuAUTC9d7PFV1cg8BJ33hs/l7636rM0I1NKuTYISb?=
 =?us-ascii?Q?pFn+R71aHJpJ8atssBjoFzBsUozgey+g6Xq89o+rQkPzhZeOsxP8pldL8H82?=
 =?us-ascii?Q?bAAcDG3Zl5hBX5KfcEmDGSEMV4afQ2uleALoDNE3S9Sg8RoDyELzYCEv78zi?=
 =?us-ascii?Q?vb+fsD3P+Qjmn1x+c1smqw+bH80b/+A/6gDZUoT2hbdg3V2Gi7i2UosC/8m2?=
 =?us-ascii?Q?zeLWwrZp1ZIDLgJN9Wvu9YAKrhZyViVdSzYp4zI4hZ9YxOX3e1XOyy22vOKn?=
 =?us-ascii?Q?NQbAAOJao6btWNXvaclALYPlhoiJa2At5Do/ptsnfFzxdas6SbZt4RgfqncX?=
 =?us-ascii?Q?wey9x0AbrSKhE/3Sr06P+h7t8RujwCJx/0AiPtRLbC+LI54tIhH1roNmunOe?=
 =?us-ascii?Q?GvcljYhEZgoa3GkZgxIef3TGnabgL7qR5d70VqsPfkXfIr8M5t6IxLJoQVuP?=
 =?us-ascii?Q?Mz88xr7NMsDrshe0exAI6+1oR0KCdhN3eA5XpJl+5745RKJWZdXI6FOkDd9v?=
 =?us-ascii?Q?Mavymz3wgYLv7Bb5lL/rPkl4XnGgN0TWbmKqilhwxTzjXqoy22iTY7uR6gM+?=
 =?us-ascii?Q?VvMmhN+UtWCRr1uEWkdMZDRa8XzlVbgKGU+ovMb6CkVAPfVaeNsakcLlqbsR?=
 =?us-ascii?Q?9Sd7JHWRp50UgUiKQ8ukT7iCtALNkJqK1g7qVgnZ/FoXdRUhpsmxt3Hea2NN?=
 =?us-ascii?Q?qzgxmYLX0Pj3s9FJn7MqS3uRnqBUNj6b9aKx9YcWGgZLoDxknrdyTA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xpZpzypjw4rsRbqBwkmk/aR1AT65jWDvwgkzgXlq9Vy6sjyzqW1iaWRsG9kP?=
 =?us-ascii?Q?WBy3xIM8RNJ8vneGqFDpau3Lq4iXJpl85VGxeocwog22mS3VB+n4R0BWvjs9?=
 =?us-ascii?Q?AXzJLQogXO489qJng2fNuFt26Nlmr2p350xJpBf9kLqrWF9/1jQDuX/busk3?=
 =?us-ascii?Q?8Gcd5RAQZZ1NVfx5nqSI7tw5P1sEorzU6jRP/3js7FUQKKtrN4rouoNArF4L?=
 =?us-ascii?Q?zH9ihSFsaTnNakW13gk4TkVlOs6E5a0f5RINyaGq4BkLwzYJthpo4laOkXAk?=
 =?us-ascii?Q?X85UavnOb0AFzdE3jzpHpi5M1MksM8BS+KEVoQS4Dy4B+7k1WMGFzJOJVM1Q?=
 =?us-ascii?Q?AEF8+OuMXQl+yVWhXsFQM2fronUX+YFBYOF6Tstie96pwoqQmEV265aQ8bQp?=
 =?us-ascii?Q?Sb18Wl/qlHV2iy6PtqD+HLvw+VFVSozpntSOYNc4y7k7PviKBSA1ERXiXTI3?=
 =?us-ascii?Q?ih9wkAM0/fUa5XkG872X5K3/5h7H3WB76NqE88d5QFWXFx5mYpPECppoMqVd?=
 =?us-ascii?Q?4JymY7YLrlVf8SB+CAoOgYSpSD8xzMHq4brii2JRFeXs2KVI+4mhMhyOOgtx?=
 =?us-ascii?Q?Ir+Tw4mszA5B0arf2DY3XA/NOcyMDXaoV5ElPX3+kC1s+73ADPI3Qg51zlAk?=
 =?us-ascii?Q?uch796/eOZV+fH+mmOPD3CdSmD31o3zvYwbq9+MH81DsoukrUxA/gxeyoi6l?=
 =?us-ascii?Q?QTO1TOl0YgA0ZD/fxHsbjA6km+pwdZKmhczDszpVUlLjkam0MhIXTCSyV+Um?=
 =?us-ascii?Q?wjvy3mk7DS9gpp2DSmFGEVmfrbYnGodWOLJrbdfe63NjikpfZqXsBLysALZG?=
 =?us-ascii?Q?S30TOh+hKTpn06qOAwBULHFq8YKsazxbYcWd85ica1HNdPB/bYcJBMSW5qE3?=
 =?us-ascii?Q?HJDnvTDZCWfdxgPj+Q7DsgrryCQN4/VuFqdHo636nlUUaD+SM/qkZSND8H7b?=
 =?us-ascii?Q?x20NL1LDCTJPYWWXyJQkKXNRE/vTE5nyoa2hoZH+7QvaUHsuvxKFKsIXnds3?=
 =?us-ascii?Q?egfUPbsuZDtMRqug6s36POy4piuEEbVho2colLQQN4lVOcoNhcQve+PSR3nE?=
 =?us-ascii?Q?iHq1SH6tJycyhUGqb/0GbXTmaprx0TofBc07LZVLeGnpARO7G2gjnpstpHSD?=
 =?us-ascii?Q?Bd1Rqe4xFgkyY2FFucI1+Lw8TEFsQvqwhSKujnKLbEiUHQsaxv2O5V02JaZq?=
 =?us-ascii?Q?yrjgTw/cptcyvzduLKVtti5lFQgTAu9fhwxJIP23bt/H6e3JShF32mepWPZz?=
 =?us-ascii?Q?WF78VCciCTjLf82WnpXR2nt8r4ASooTJL2sbqwkQGbMRoQBxD9nZkuzxkE1s?=
 =?us-ascii?Q?fAFZJSNe8wsIK+TcuvYZq9rkJEplRZgguZoKob1CWpqTKVN2qikuJEQxd70M?=
 =?us-ascii?Q?I7KRpjni/VaSa+Cdcw9MhzzUlRQaEZa5GVFOZERZq5WTpmSDeGmjvAc0AERY?=
 =?us-ascii?Q?E8Hy/U6hZdSXhsDQFRe1tfe0FIeD7jgbztFzvsoHXKP/CtWdNsBGgO660j2K?=
 =?us-ascii?Q?Vs2Yf6CP2raGqI6DTgb4+b7aOqqP1RAoEsBdfftmZODZFz/mb/IQ/3PnPg+n?=
 =?us-ascii?Q?qDU5x7aVhoy8jQy5pVsOtsSSrDPSRDayIHtaw7CyJSFkK7dKbGDtULljn3Op?=
 =?us-ascii?Q?jBUUXtjvo07mx2BNyMbXdkM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f823ac5-f1ba-4be8-b53c-08ddc370b059
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:24:52.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye24NmH4PKa/zoX4qUpQk0ltVHuUWHQN6g5nFRn+Xexbqw0ZBXWbuecwa0GReBqMIqTj8DVLyAZmpJKEsx5clrbTNjWY4Jepk2HjnB+U8acFuvYKIyVkIS2mu5FEzOMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-Proofpoint-ORIG-GUID: jf3ofF9mnwUfr8BP-RgGFak_jEClhXe6
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=68760248 cx=c_pps
 a=gqt8WtrcWjxtKrE4ELBhYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=BPCkSgjTfvdP3bmmVpkA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: jf3ofF9mnwUfr8BP-RgGFak_jEClhXe6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX8oyUxzxmCyEN
 eUQNnEVN4DDAvGgxe4AH0Uqgf8eao7sI3zbwuwJLrrdnsvtf12yO6L5TyefdjeM81YFoOi/J7v2
 eQSOdjzuEtzKuVGS/TBFMXbP0IE9b0OyiRjtEh/Hpf05cVKvgc7vLxoly7plRKJwrTPpm9+zeIV
 ntPC8hzGTKARS4rwuGjkOpSM301+0UHJE0O8ymvcWwb2W2T0Sf0xNhirMMirZIJjI/pvPZV5G55
 bFozsA+TEj+pDbDtgAAZ7H6jAWAlDyU/rC6Tuh9PxH0voKnbh6zjA/+tirLjrdGDy5Rj1LJUeds
 JjeScb3PG4xFwC8QldGG2Byfpksj00h/xGkj+8yT3J332eFKrauVU2GergfreqL86yARUjzX/t3
 uFTsyXnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220267

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.44 stable branch are updated.

b09cf42d51e ld/PE: special-case relocation types only for COFF inputs
f0019390d12 s390: Prevent GOT access rewrite for misaligned symbols
452f5511154 x86: Check MODRM for call and jmp in binutils older than 2.45
4058d5a38a1 ld: fix C23 issue in vers7 test
33578177adc dwarf: Dump .debug_loclists only for DWARF-5

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
index 18bff2816a..2219ada4ac 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "96bc9e8081a5dbe8329c1d5b0c94191fd5bed840"
+SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


