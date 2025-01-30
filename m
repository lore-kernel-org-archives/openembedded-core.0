Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B617DC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 08:54:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11574.1738227293321775378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 00:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4125509c47=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U6jR5d027814
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:54:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72g8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:54:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyU1ksxt32lpQrZWRz++xbwIDspIlZTJ8NWFH/ViY1U5Yr1TzNWtPSzUVgaJzpaKJ30A/ZN4fVuddbKpQK6YiVJzuJdO9M/qoqywlHJSgO36G5RfZXS11AlHN5KB/H0mRSPBbbPmi9g4bhu4qWiwIuCEpWJnqx6pxzSOqyx2s2+OrxhjMKcN9SYmuFC2JRdIH5mO3eN0q0NectFCMLRQA8mjKLLrqk6TdT6mhwaRz8zGmKfjq93hI84qk6O399ly6p42BfJxSTkWTdG73H7mz0z7HxCQ94qyW1VuVaqpEc9MSKAViA00kE/D7NJf9HOn7aRxNK8dzZ4M06eD9GPzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVvJ6gN8k8rbStKlw/Qv8DVFKrjIZokINmSUxaqRaIM=;
 b=VxpqG26uQGrjcjahFrQkFQSl/4I0ydsWR+5NCfsvrequ3/tRGjZbNeeazjNFy0b/uVO1hb41XIBLfsNcYqJtzYhSggniJoV7iq7WwmbNnx3a+mXrB+QKJNoi5LXV38JwDBsc186qzKz0VJs8VxBQd7CpzhEMQ6HZiEuD7ALe86S2b5lmimRB1vMl/ED6eUJD9T8Y3MYn5xkoBYK3+PH9Sg2/P4Os7zrgGyJQfQXsigmzH8h5wwwvkwkwJ6FWizUmCGa7kHYBobN9T0wHhzvhAI1s697HXHw5WBNCq6dGahd04t9CWTELrXrIA/RRrR3kEWhT7Lw91nfAYIFprROjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 08:54:50 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 08:54:50 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Thu, 30 Jan 2025 00:54:34 -0800
Message-ID: <20250130085434.3088865-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: dc97fbb0-6369-4ba7-716e-08dd410bc14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i1Fe3QMU6jB+p8nFYDivPuVi+KIk6P4NvHYqlMDDH31sysNYLZpHkjO2wu/N?=
 =?us-ascii?Q?XcffKnh/aogz8BxzyJ4FYjRyF4WHBek08DdEWOSmHlXgxK8o/FpiIRRuBxeX?=
 =?us-ascii?Q?Zxd+yapO31B+odcVBRh75Tj1GXM0I7Dkes1uqkWYwHDChEDBwKjaCf47wKH+?=
 =?us-ascii?Q?8fgnT/bqKyJvtxNgl/UwSEeZSXnZVR4807Ehaz+nDXFl8RmOs0jiuynOyjz3?=
 =?us-ascii?Q?SecBXyICp7SClIEi8hcQEs45OoQ4g9hosa2dpiGBPjxrx2FWNPBUjjUhGGZ7?=
 =?us-ascii?Q?DOJwwMSYNA8QaQUFZi1xGfR4FFNpCY/RB39Ups/KEXdWRg1aXKDyAE5hiMbD?=
 =?us-ascii?Q?T8V9nlYROKLF0TbchhnJstz09ue05EUMTbdaDcSYoT4yHqa2q7n8RQv0DK2d?=
 =?us-ascii?Q?4qF+vQ0hqwEQFmeEktN58RYWTF82/hCOaJCKL2iWp8clo+Eq3/MtWj0eVLnf?=
 =?us-ascii?Q?7XruqnfCSeG6qnbCMt6lRGjeMrak4iQ8HrJx0aCE+NjTOnO3fiS7/d7hvev9?=
 =?us-ascii?Q?SZ7ouO681XS8VgulB3h6uM/KgBLIJ+jJ7bEujJV5ynt9AeEePN/BtZSMAHFF?=
 =?us-ascii?Q?3HQDKgzJi1ayMgF+xHIjQQE7PL0TPsaBA2Vwy+wjL8p4EVeXp9Qcv3I9C4Fr?=
 =?us-ascii?Q?xoI5h7H3oKr0WkpnMZVAAUM7+Hdwr0AhfvBuE7/xSjGhsXEf7s/RnLqNPVky?=
 =?us-ascii?Q?oCPOvhx0ICPuElsa7XMXOiTccOrhrOxD4H9SzQlm1PlRJ1e6uixAmMBzi3e6?=
 =?us-ascii?Q?vCv4gSSxf4TRJUzpMK23y+cjXPov1fyJf4fulfblPI2zjakRTlttSQf3c5xf?=
 =?us-ascii?Q?Flke2Eqk3Y4nNZfMsCCKHn0cGA+Y5Cvp6oxO+R6P37dJBQrPuynSinktEvZN?=
 =?us-ascii?Q?h1Q6DXhv11b/nWAjXxf6144ormtINetyehGqp4o309T9FKbZnLHX/Vh7s21y?=
 =?us-ascii?Q?lOGWbR5eLxgBWGBi8FT343o8lrt8y8dB42xCxRF15a11PZFOqOBso1Tt9tkQ?=
 =?us-ascii?Q?AVYXcHVywJXZoZ0fkKyRSihpZqttq4hcrywY7u4MLVKfMLYxUarBaVA5kgWc?=
 =?us-ascii?Q?y/F5JgkJfpsU8XehVrt94sQ5VZRGti47t8iGpm5CGnE7Fhy4YAivKrm+xcGR?=
 =?us-ascii?Q?Q8Yb048WJHrSTs5O8lMInc6Q9Pp9jTU/v3mxTw90ruLwGtvxuKny2DNj8abg?=
 =?us-ascii?Q?FQqq+8wWmGfHsXze9W+jYD5VJZq+fVGldXYAKEB60m5Tubtw15zRCC4ryDXi?=
 =?us-ascii?Q?BCoS31g9Xj708j3jaRuIJSPQMMwpQ7Ymc5DUDVCvqC7QEM9WVmARcKRbc7A9?=
 =?us-ascii?Q?1pQaaX6Btbh+a7sVggH01qGXhYDAunorcrHvkYkFJVRIiDH/r2MrpPmtROFz?=
 =?us-ascii?Q?BiobhH+Sele0mM1aJLwc4WQ9FtSsCfSneMCWAK9wxLtdi3GqbsujkHfMhHON?=
 =?us-ascii?Q?GXKNZVwArZ6mD0IybMTFSEz9Vmdjl32G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4vMH9OjzIbWsTuJh3AkdiRssXNyoiPTNe0MnG6p27qFzn80NHtbAffjqT0c+?=
 =?us-ascii?Q?TWSoXum4j7I4XUhPLi51UJ2n4zoMzc+aI2fPPF/mWz3pTfcez5pMEAubvKOp?=
 =?us-ascii?Q?TR4PtCbQ8rAPIvZ6vWUPWwhbkSSBmSfv9sX2JcDhRWVd45Bag/rTkvLnKj1K?=
 =?us-ascii?Q?K7OmJwoNDVMCrBT16Sev6X92V2wlSU8W92Us048Tflx2M76Vn+rhrJolgvLi?=
 =?us-ascii?Q?le3YyZNIBHNGX/Xj6ChqZp2ME75drUJGiH4Tsjleo9Y3tJIHpmHLTq0uwdba?=
 =?us-ascii?Q?AV9ADAJPJMsaguveoaDy9V9S9Eu1IkPe3N2TNCnA3nP0R9MtqK/YcnyI5YCS?=
 =?us-ascii?Q?/s/Y+ulA1OL6AX6Dk5dgS2n1tOrcvwl+ObJ4YUkakgUtkW8xS9Y6dRETK3Xi?=
 =?us-ascii?Q?E9kZKOr/qz6HoN8lyfeCf4h2ZmpKZep8Jt/P1ZxfDMHcv/NrLSJsJWg89u2M?=
 =?us-ascii?Q?6Th1tLht1cmj6JCxqRn6MB2Ss8rPHvMW7U9FIWbORXTVGvGHvTbnshUW57w2?=
 =?us-ascii?Q?DktsaLkd5ZE+Yurj7FkryUoi2XoX0APZ2T8/Vj+gJSXOozJzhxpebW6Q6Vj+?=
 =?us-ascii?Q?DIMityCHYh+lzNIAAeUbrN1/quQBgEH8uvtWTQZab7P19DCWBmCEjL0dGSuG?=
 =?us-ascii?Q?42VcjJ2jtifY5yHorDvJ9myNuR4u2QUULLOWbEqUJCLzvYr4p1UVflLDb6qn?=
 =?us-ascii?Q?JOb82hgqh2fo8evqukBegYdWIPpuncEe0fAgZEYBwX2XRF2uE+ru9+a6YAxG?=
 =?us-ascii?Q?/pOwibUx7KZsSumIwT7PR3wwexZgd/FKlvfxnL3N81szCNm96anJCaEonmxD?=
 =?us-ascii?Q?0naibC4KudvYf45zVCA735BGxLeM8EsG5IroByEHeQJ4fQOzYibSbDrooP2M?=
 =?us-ascii?Q?4Uq2KC7ZDEnl2zSKKDZ5o1WRdYGyLBjnKOv3ow3t8Ng/O24dqsc668FDktpN?=
 =?us-ascii?Q?bu1uAVGa4nfxfgUg4+LHUzbRjpiJ3iQTO3E5XgVvTMYW7/GYsafJ1ztFfwWO?=
 =?us-ascii?Q?u28DaTORbPTVEjqh5pIwuYeJh/3UYLrysNNfmSJGtM7cOvl1//fbnMAzLwP+?=
 =?us-ascii?Q?CQ9jP2faIyOB+2B50eU31cwPtiSWMXLVvu5HFhY+u69zw29yaCR5gdAbZPH5?=
 =?us-ascii?Q?i5tSYpjpLx2icgilT9WiyX2789fjfcm2WNFaAPVh8jnN0aUnm2tw5jj9XeHm?=
 =?us-ascii?Q?gnUurKf3uAJWH/U88DjHbqHA+TeZqe4u/KjvAQHSJiSqB/HLjsv3BamxU7Ed?=
 =?us-ascii?Q?dIt2ikP+8Mq8tBdKhlKV0OtN8FwfEts4ynLQ1KuXtV4hpNq4x4+JlV6XT5Ly?=
 =?us-ascii?Q?suc1Ipe9RBAvO8x8FMUyXIMz7fSzpfvrnFyuBOb2q+DuB2wdgnDWOAiCi9Mj?=
 =?us-ascii?Q?ohQZivnZLIjvlI5ykpxftyCvT4QnAzg3M5B6TJv9w+W+toIFC2D8qR7XzzV2?=
 =?us-ascii?Q?KlDyfZ31GgY73MQn4NY0srdon4XxIDxAgM0dutcqXgmM17yijkGpOS1nvJGH?=
 =?us-ascii?Q?YROfTzAH8kSuDH4JiSwqTu7+4V+p3dDJ8beYAlLfhhd7aZgONBYp2YbOz4pO?=
 =?us-ascii?Q?GRNeRVXBNPSmy36Ve4NB3ejC4AfdNyeiQepvfOURSP/sS3faRRq5XL/FyzY2?=
 =?us-ascii?Q?0orDaE5Lq0UNjLLSL3qIATg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc97fbb0-6369-4ba7-716e-08dd410bc14b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 08:54:50.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbKSUX9Lrz7zmD9p8qoevOf9xfULPBpGWN41MXbVtGtSlxt0F1sg0YEyYiS8Kj6Eex4sj9B5So06KyDCF18BAyFUnEEBdIcKHyH1glptKTBdRdTLIT0K1ZRLJubKq0Ag
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8587
X-Proofpoint-GUID: yZBRcMkreuxLM_Mkxd3ua5I4y7F1vzCZ
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679b3e5c cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=4w5tbgXVXv3pGr7GghMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: yZBRcMkreuxLM_Mkxd3ua5I4y7F1vzCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501300068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210436

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

549d831579 stdlib: Test using setenv with updated environ [BZ #32588]
8b5d4be762 Fix underallocation of abort_msg_s struct (CVE-2025-0395)
525e5f13de stdlib: Simplify buffer management in canonicalize
5eae275400 realpath: Bring back GNU extension on ENOENT and EACCES [BZ #28996]
8a82a76a42 realpath: Do not copy result on failure (BZ #28815)
e369114462 misc: Add support for Linux uio.h RWF_NOAPPEND flag
3f1ab0ed66 nptl: Convert tst-setuid2 to test-driver
76adee6e0f support: Add xpthread_cond_signal wrapper
c3beedeb70 elf: Support recursive use of dynamic TLS in interposed malloc
f48d763ab8 elf: Avoid some free (NULL) calls in _dl_update_slotinfo
710057676d sysdeps/x86/Makefile: Split and sort tests
a4207d4e83 x86: Only align destination to 1x VEC_SIZE in memset 4x loop
889f99c149 elf: Fix slow tls access after dlopen [BZ #19924]
543efedcb3 x86: Check the lower byte of EAX of CPUID leaf 2 [BZ #30643]
41a3e51233 x86_64: Add log1p with FMA
0d1c70aa4c x86_64: Add expm1 with FMA
516180d399 x86_64: Add log2 with FMA
30384b91ad x86_64: Sort fpu/multiarch/Makefile
d626c31ce5 x86: Avoid integer truncation with large cache sizes (bug 32470)
7ea35e28b4 nptl: initialize cpu_id_start prior to rseq registration
47d70ca8d9 nptl: initialize rseq area prior to registration

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dc18d20dd8..d98b6a4911 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "37214df5f103f4075cf0a79a227e70f3e064701c"
+SRCREV_glibc ?= "549d8315791aa8176ff1537db3e09c185c6e602f"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


