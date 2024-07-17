Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270B0C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:31:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13055.1721215896791011144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79284c4b77=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H51BW7013372
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:31:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrpaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:31:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uypgWgIl64HfMrmKYMsP7FRC1AWbk/8hDwqnueEihgB4ISAdGvmEiV1MbJufq1mNfUh4saCZMeESKj8uU0i/l2P9sENRTwWlxIr6lTMiLnI73nnccPg9ILtRGKW5SU2TgbUxCbseosg7VIRQSfNJ9dvstlBoPpHR0rgcIkO5/j7UTCjEdCfdxmFRyek8QA9paftr1Cjewy9JOvKpWLQ/VOg/XjwblBb6GC4FNzzUG1Ce6ISumVFX8VA3dOkIQ/qTcuXgVWK/Age9gV2bTKTzXIpsx5/VBdIB0rZ2bC4f0XfRK9NlT+PAn1dsq3M7FtYyOL2ueiQNimPGF3RH6LCduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0cZFc6IeP9iuW9NaN3t+6qp6XULr4xFMGnxwFFtYzo=;
 b=TmkGZiDFR7B4RvyQ/Lofz3daqATwsecQx/7+BwIpSSTqzV7Lq+b1Fc2pKsLbk5ZQv+7W1UUiVog4JesTa41EXjLnRGokKxCAtKiZgHoPerPZM7RRT4bhTY0iGEtyfa2sfIUw9aqg3/KL9uYOY5aH1dlHbeAkKSsbDKVbTgXlWX9qwk6DZODDmymseBtc4vgRlg+MNRKOK2HaLwdng4pG61Tw0NgygLLDcQLF1AAb/UlKPuIJMCtsuJLPBZCGpU4KQ7YoU0auoblrw/aBz3/2y3MFfOUfrdEK9pNqTV94IrRbP6eDIz+Z/EqGMGm0GQ8EHTRC84hwrLWpcV0ogyzHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 11:31:32 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 11:31:32 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates
Date: Wed, 17 Jul 2024 04:31:16 -0700
Message-ID: <20240717113116.803109-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: d61fec06-9a27-4e9c-9db0-08dca6540216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cQIzegPD5ieWrqWlTQVmSmBzbS7eim7DZkZ/NEQad19X7RHLiqIdssNXhHXc?=
 =?us-ascii?Q?GbZhsxOB9MGJOkQD8XiXFDE4ftp1E3IToe+J9HIaV1H1GOqgtR3GM9CMEPpw?=
 =?us-ascii?Q?vqRTULfgNXLuExvl/Wx5EqSVaI2ST9snrjZwgKmr8CRIrXSUfGxD8eSHLs/U?=
 =?us-ascii?Q?JEvWiH8e6L8L884sQtqmMXNBkU7+du9wEE9kE29hWt8gATFP+M25fty6ahcW?=
 =?us-ascii?Q?4W+La/NGe+EgmKZOOxb74Y/KZVfMlSCK0Jop16COU7UdBrwQK08DiDNJDnh3?=
 =?us-ascii?Q?levGk7PQ7Rw8URQ6j702PzlBBkgD2lejLB+UUtjLZsqe38gWxubck5zy0KAi?=
 =?us-ascii?Q?9CvUvpTeAAvHCY6i3GfGlqx4UzAstY8njBWQXeqkx6qBDGK3d9LKmmCVs4hW?=
 =?us-ascii?Q?5IthhgcNBftegdt23OtoOvXyit+FuU1Sbt9ph+uUhHIjNj6rfLM34kFRerxl?=
 =?us-ascii?Q?AYrKkodI05x2UQYhGVEHnXrElbbJFp6RvL/U1r4T310pnKIwpmN1R80NG8rK?=
 =?us-ascii?Q?kyzF+4FOGjqdp+vJuPJsNM/kDqLHxak+au26tdlzM6io0D52gU43eTHWhU8E?=
 =?us-ascii?Q?Z4GquWu9shI7y5+KMiYOGrk3VOGfPrQNyDfws4a/02zOPrSGV9EzIBiGr/Rd?=
 =?us-ascii?Q?l4uh7YtLkl4ZlnPX9MPWLljz6Dqtp2xySsGrerI91hMHh4aXi5AIrTDhfrgm?=
 =?us-ascii?Q?WQsX3PoZPruMGIVp2RxrpbB2TpPd6OGwWm1fvxBB62dPihT5QgKvBGIbHlrr?=
 =?us-ascii?Q?Tz01H8IQpCx9Rw3wwCZ0jV98fSVeCPZCCDrlVwKPHay2x+T28fAGbjCTpjlp?=
 =?us-ascii?Q?hXpg24aAd2aTARta5aCk9uwebNCUw1ntkKR0RaUuEr3hUnIuC5UcONKU0UbE?=
 =?us-ascii?Q?MFRAXTcwnxLA8qJJ7RgLzbPkXZdLa9QqyXyHoFpm8gMIAgtuB1JMp7Pt4VVn?=
 =?us-ascii?Q?x/AhElECZsPGTS90c9NvkysoEQmX/gPDtZoVif/ogjCMBwcQbnEPLucnIPAj?=
 =?us-ascii?Q?N2Nme8eW4MShX2cSZgKqxMU6lVPJMUDhsKCTIqJrsjcnkzgPvVGLBxiwLXZj?=
 =?us-ascii?Q?kqbSe0o2b7IkncpcblnzIMgSTMV7IK/6OKuzzT4H12Ru1EE2kPKPG2/AWUBI?=
 =?us-ascii?Q?41ZZKMBO2EH8EuKIFgkGI5mQniy827hsRkasThhFNPdc1ORhP+ZEzGPJKU8/?=
 =?us-ascii?Q?lM2DEy9ZE05eIxvXOzGv7Wxjf2iCpn6KBv+osb6SrP68oAP7hIv5VTN3u1SP?=
 =?us-ascii?Q?QqNzw0nM7dkoAnD+f9qQWszKAfHtamU9SpVKvkD+rznD1SoFmsWdOg83GFn9?=
 =?us-ascii?Q?CyohIJtXrnskTpE+Vh72YTW99CEkAulPdoFqB4nP5IfYGWh28cEiTHVS3fFj?=
 =?us-ascii?Q?PCQbxwN/xJePu0l593RfxMWFqiPBSBdMg8xeF9cHxVQqVTTprw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w4WDsmqIO8aUNOQDaAwHomyBGkMVtAN26EuhoOZ5PQf+mVa4kzeoiYww8TS3?=
 =?us-ascii?Q?nNeRpSsrUBH616OvnYKFFJC1UB2IMAT+qj4esjEJEtzZDsXVyxkI5sZ0hNe6?=
 =?us-ascii?Q?GGe7bRdzIuhz880jVApmczKt7qd00lcsN1MA5FfErMjL0yAoBr/4+sccW+sN?=
 =?us-ascii?Q?qwlLxbw3EgiFJ+6oxNhCBySaN5JiNG4rIs9XfMvgTwedUHA+qs1jimoweoKx?=
 =?us-ascii?Q?6Ujjaol14oRZEj5HDxXMg+gA4q8hk7arTbzePPlAFzojyb8CFymrYpK7aZkE?=
 =?us-ascii?Q?M4BwsH62qVcf9At5bz8T9veXwRXIrT/kAHjJzNqSBqNAQF4h81gWi6Qfj2ke?=
 =?us-ascii?Q?mE0kO5ULbPwgOjCBJGMPpYD457pDz/dfOigcbJTlIU7/7rwjiaT4SAbDdqvB?=
 =?us-ascii?Q?JupMWlzwZWkwYKkDJkiS1pyFa+lGamB4GYtmANs+ww4vtp5zxjh+VQRgWQlm?=
 =?us-ascii?Q?C+cB2QkHQtoPgxpslXypk/D5Cx04P5md7Mf71YphRPPXxLOTSSF73SRmOsqK?=
 =?us-ascii?Q?KNvoFvDt0dXhJV8ii8cmo3SQ+5QVyBsjMqCvoS9+zSRpskq6oTRGu1fRm0AC?=
 =?us-ascii?Q?UZAIpkgvZnm/f7MEgUXvFW0DHhNVAGdJDPdl+1uEn30h7kVXAeCKO3j3tUVA?=
 =?us-ascii?Q?dKUIEA+RbU2BN+2R+M63CzaZx6C1lmI9yQMiHaammrZeghuM//pfzxRHtVw8?=
 =?us-ascii?Q?+Btk3cZIem8p69qr5+xmXo4Yj5M9NOaEGlfSF33hkeZDWrH7kNxr7Q7CY+Pr?=
 =?us-ascii?Q?DW0QRhewpNJdC5rizgv75wcyReptQ71DMTzTnE+iN7wQaKrxdkiYudD4kZhf?=
 =?us-ascii?Q?CW5f2wujMJUt5yCvP11BGoHOYf2ZYOnjZMsVc08kvxGjqC4lZA9cr6pLtM4h?=
 =?us-ascii?Q?x61wmjGOI2ezie1oxofoeK4GktKcW93J+CgPEkD+dOPkWmSjVo8uw98CyXB6?=
 =?us-ascii?Q?DSdSSVSCymiRRWwtFvMRk3/0RGOYh22k5yie4Y/NuklsLLQ6Mq5gUUhiNMGw?=
 =?us-ascii?Q?jDqEkA1vljwGWhXKQzk+vkIBz7ZaKgPSae1xil0oB2xji8vTb3cOuFX0IxQO?=
 =?us-ascii?Q?VBiJhCanJdqQb8dV3KBvi0Yb9VkTT7sad97Y1IwqSDy4WhnkXXUZ3kUaaZiF?=
 =?us-ascii?Q?P5hGMttPMrm/yqT1QppX++JW8MZYoVIvhTRAIYnng6A6nJeMxdIUd2mB0CQX?=
 =?us-ascii?Q?lixIRdnmuN4vk1KU13kGBRd9NzIrLwP6tjltQLXmoovWjsGJ1EnUdvL4nTrk?=
 =?us-ascii?Q?cN7UDOmJxn3kfGQgh/Mu9JmqgfrzB+1LvQCXBinF3t9fjzOwk0kSvf1JN9/J?=
 =?us-ascii?Q?rCjVjq58EISRyQVCrLmLOkgThGBC4gdB3100eRW6fSIPI/EaxlQ9hNQm9bkd?=
 =?us-ascii?Q?K0SUKvgoK45aC6oxwZ2EtQ2oP0ZwujR0ISRfki7mhpUm+Nq/vJRQxWJLR8gR?=
 =?us-ascii?Q?qmQCgKElJrxZJp+s5SZaOtDLsLvw8H1Cv0fIwFQZ1DRMCs96bN+Hq2rMEEtT?=
 =?us-ascii?Q?dlfEGtRX+3koiIpfATM37ytUqGB1r1Orztlz6MNTMlK6BrRv05lTWgGsX8HX?=
 =?us-ascii?Q?JFF1DpAUUZsf3cjzGe2xjHSMlWeL8qEVm4fgULg4jqDcmpPm7GI0T6241Ra4?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61fec06-9a27-4e9c-9db0-08dca6540216
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 11:31:32.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOBCL9Gov2xLBnoiwC0DA6oeZF/F1NqlT02g+dgsfEOq6rVurdop00ELZ02bhpIymHW2WCozvKnXr5TOUbuY2fSv5lsMGkGNMFd5qef3z7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
X-Proofpoint-GUID: uz2nLvm_Eb662qYj7LprNkFmQqMkv-Bo
X-Proofpoint-ORIG-GUID: uz2nLvm_Eb662qYj7LprNkFmQqMkv-Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=872
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407170088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202158

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
index c8f526b5c7..24efe495ec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
+SRCREV ?= "71ef12cbf140a637e4ea4e2239ee5daedc8640de"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


