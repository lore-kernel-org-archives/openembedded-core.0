Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0693C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:57:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.74405.1746532630948178223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 04:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72212b6e92=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5466P2Z4029656
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 04:57:10 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3ax3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 04:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ1abPRKHiq+G9VuWTuHd7L9t2eulPmlz6yb06Bt7B2POZUQeP6KxjCRx8MzzGfQFEc8XS4tsYGg+VRpkb/vIP+BGunqt17URsr4VosTWXR+WD/6WqhMXCmGBNMWjps+gfUYsouI7EyiWz9TmGS+p5OmiZ/KpnZQJZw01xvm9O/oD+AxHNTXGsibqDpzxoG7fkI2NItdaJNuRa9np8zEYXZAucX1jPb64DRdCmx2Zjqy2GTMP3ajULObBUc6dYh+XMnzlflJ0RR+XCpxbPsxWEh++Tr9IfNqiP6EKBx69KSwZDb+9VjR1+mOzvm+07fysQS0eGsac6fIDJyyhFcYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK7tLwyBW7g7+T70mlcKfiXMHiHWtMpsxDKqT0R8ey0=;
 b=BWylIn4a2EbaWlWWUFzhBfgtKz8WEbGbsiERmyIzkr9jF+wfpCz9YB3MdLnmTP8CVTykjzI2oDFi5JRWKBgg9/odAD1fgC52k1sa4B3N9wOLdT2+/cF3WYg9Rpj0OdmKoOdMOFa9VKLqCNsIGUj2lIdJyGtuJKSKrwhe5Y34l+/2mJMuj4IlhDcpQnV0X2KVfV9d4U6JN3s38DZgtyQ35ULu3hSz1Qs6DIDALEUWcLR/gECYE4VxthWZOjwKzcDfpUnPKGpiYF5ciESk3JZblHpw90WLE90HodhwrNfLmp9MaA2/jGu/TRwqj0EUpIfI4fZxyT9GGBNktPGFB3guvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:57:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 11:57:03 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] glibc: stable 2.41 branch update
Date: Tue,  6 May 2025 04:56:31 -0700
Message-ID: <20250506115631.3753052-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 555021bf-3cb4-4a78-168f-08dd8c951de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6rRgZDMIC5NHO5XHComb0mC9uFiEN5S5aCGFnlgwqOfYSRpUgINqqaeMPLKv?=
 =?us-ascii?Q?D3FHs6KpaGfw2Um/UzhuOIE/H87xGnp7U7wgwEr3qEV6jI1gcCWslhTmMcoV?=
 =?us-ascii?Q?BKEC/V+MkWPEv2dfDKw15naTiv75gLRazPKz8PA/PznoTtCUTUrrEObQWS2K?=
 =?us-ascii?Q?WydcT42gmZt5SP1B/dWcRW4BrwMtOmdMXpUJfOrUWhTPyWtcF8IK6QcNqyLd?=
 =?us-ascii?Q?7nFwwhF9xbGlfWsUh58Sfucnda82/0TnccpoIFTQgPD5cAcJJFEKH4ca9xAR?=
 =?us-ascii?Q?OE57v+KKBUZDd1K/oKZ3eusUuhDZxMZBiv+NRIxsJUMQy4BB/tnh4ogrPYpd?=
 =?us-ascii?Q?K5q0HAPEgzxbfm/4oj03yEpaUv4LDqKPqfzNIYYj/8a7LNj3EQe0aYWHcLoD?=
 =?us-ascii?Q?wAKLr4KxmiNczj00rdZ6bNRgwIokCPpm3WRhhiiJ3HU8jgx5LYqzBdR7OQgg?=
 =?us-ascii?Q?wM32h5HjnxOlWl3RTCub70MUtLDjL1DYv0QAVmvFjhEc5yjHTa8J3KTspU4L?=
 =?us-ascii?Q?ep34O+y5DiG1nv87c0ODNevwUfmggK6aZ/6sev16y6RsK5dDMUrhFx/2v2cH?=
 =?us-ascii?Q?A5EzSGPhy8Bq/N/dMxYuKr4Pj0l1jvd/kpcP2F4+nGoGCNGRtwjzA3c4El+7?=
 =?us-ascii?Q?Y4acK2akC9FvJDu10Bpo0cQ8T9R0LPI+O4e/HxN5/nL+itpd87KXAn1EqYoM?=
 =?us-ascii?Q?340oIsAG5zVeBYMmTX9kXedS2H8D4tmEaPAfLrmcPLJXqlX8d1hoaN2a6Y3f?=
 =?us-ascii?Q?aeeSmxUnYHG9sXdluXO6azySsULFG7qqhbQvef19BGSPjH8dXalshc5HQF4e?=
 =?us-ascii?Q?n8I0gwq/FRMIVvu/4CrpBgC7VsTP+AbKeb+r+H5sDjZQ4/jIOexKWxQtV2/O?=
 =?us-ascii?Q?+AKWgNIW5W6NQVBwt7SrRaL1c0tlXzOEK8PuddEShsuF4YRECpYjvRJ1SW0E?=
 =?us-ascii?Q?5lXNugWw0D30KUowpfUHFRwMNxrLkS+g+s2P5HsgIRDjCv1VNYqtb0xR2gDx?=
 =?us-ascii?Q?MiZHpoI81HN/81m64J5qdrNcO7OeEArPcdKfvaYQ+4eh3ucEQ1CMnPSPr560?=
 =?us-ascii?Q?+CnCI9V7Vuxk0+i3rhSVvTdA1hL3GUcU9qupc4j6FAhp6IyrqprtTDNhtSZk?=
 =?us-ascii?Q?SNJo8b60nX1wPOQMTn+DMHhGDl1A3zGA5E5fa+zPJtF8cOCHb/MGsW4KQwiU?=
 =?us-ascii?Q?eA5czaSc5DE02tADaqwE2NYjfs/uVWN4RtHlDQ1HJBjR+cjIdC4scq4z5DEe?=
 =?us-ascii?Q?VwZGAs5cjCwF6IIzWkMtkgGtaLV7/oVzeqo8ka6VILeLJJ7YdHKgpPm1t31u?=
 =?us-ascii?Q?SST90m+A8CzmNHKliHEGy4HkTxi/W6phVwp5irBKwucg6Ssn6WdWmpDdIHBR?=
 =?us-ascii?Q?hrtg2FckJA/PIETYO56wkzOUrYwbSGxRf2u4XNqwlT5cyQTz4oBV1yyfM+OO?=
 =?us-ascii?Q?DBm785wAHlgWWf43PkBPKjCMglyMsGVIYyev58F79gxtD9Nk9SOsG2CF5fZR?=
 =?us-ascii?Q?sUMnxKYt3+Os4O0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Y4OzFysTDN1jkia6dxl/oX8z6yC07bX6VrihZItchX+ae3eenEXotQbsDm8?=
 =?us-ascii?Q?JzzROsDt65n7ScV4Fbup24Yvr/iQPI1sC4pIJ8K+UoDOG9nreWig5nvl0yVF?=
 =?us-ascii?Q?KIBoy6GlZkoDtZJ1kczvuy/4MibZJmVCDXhzvNrOMmlwyYuUtwm+6yKkVF2g?=
 =?us-ascii?Q?x2zErVUkcaU4YcrKWYeq32c1sfyGNi+np5MVLaUpM2EMv40wS2DHgxvlEO0Y?=
 =?us-ascii?Q?hLfbLLcR5jYVFrg5lg4IBPneQjCbEocHCAhoVSybUv7gNBGBJrFDRogKDcCd?=
 =?us-ascii?Q?fcHsDBNP3V60eoXmhqYfkJz9UZOgo6vum+HA1dZTSdDY/Fe/9vn8PAl5Zl1p?=
 =?us-ascii?Q?4Nn5F+THNM+qbF+4uOVF2hS0OjAb/XgXKOeyHKLlmGkcAS/x2NhxU2iFdd/R?=
 =?us-ascii?Q?a9pTpe0tsTuoOLFp5v7X3NmauxlxcxXH0c909Qt2A+nyMtsczcwiG6DG9Y+8?=
 =?us-ascii?Q?qWRiauoCxdEVTRFSeH8taysb9eHzTJB8cX8IpGsJcLv90D9jHpzXjga7x5aO?=
 =?us-ascii?Q?nd2fxcB5m7WZC3y8t/7oxthMzcCIzsGQxFeeK9sklvIe84402roTeJE5mlvp?=
 =?us-ascii?Q?8Ao3FdtqPTgSef1cANO87HKDXaiQwrl1aqpTpN8ltAFxao6YTRSVdbEg4U+n?=
 =?us-ascii?Q?/k5iTpjTNWHe3iMuFPOZ3JkXC/S9WG7ECVSJNaUKSrKH3XNY1bYRhDN1Fso/?=
 =?us-ascii?Q?DhP9ooN41f3/OasHEx85NZfqhMBLR7wmZyC5YH1ts0+sfl1n9sjMmeKHzIIb?=
 =?us-ascii?Q?e8NGvU9v1+h8jH5JQMP7RcZA4IXEPUXShp5aPg3Mq+GXMdOdEKzW2j3wo9m4?=
 =?us-ascii?Q?Nhq+WStwWJnr+WDF8ucZLDKuga+O8z3nPQ+UmSx6LEWN+4hoOxOKIj5PDGD1?=
 =?us-ascii?Q?V8bdF/gWkARcoNCUC7u1Ijf+6W99f3jffZ2MSdGSXoy83/ByFVfGKVGwhZyD?=
 =?us-ascii?Q?TkFqwySY7LrGEVM8L2KRtuFtlwTaLgGSFGJF5qM5BPi0sWR3PoZGnH+X2WPr?=
 =?us-ascii?Q?GKe307/qzYsKy6AgP4hZmkjIlofpd3SnNCyo8mlCcYjkQhOFNcK6gX4/Yefv?=
 =?us-ascii?Q?56UBNu8qTHN1rUmfdWNB8UoMAiPfxxeI9G/uiu0NgAqVPqZmi1T3Uf1qMO4I?=
 =?us-ascii?Q?kJKD66qa60zFsIAGE2MYuoGNrSa3oGd9a3T+NDLI1oXKf7P0h9TajYYW9k74?=
 =?us-ascii?Q?RMdVSpRLjGuSWKrBKE5Igz1UHhtKdj3/RAPgwcBfKi69TkrZO9XHE2frX4SF?=
 =?us-ascii?Q?koIcWhszUBj781NZ3WFbp9PYCeyBIRo4pqlDnEOfxVXPrwX6q8v67mP4RXHW?=
 =?us-ascii?Q?kdwA/YvIE1QD5pplLnLX7teDVK1JQTRlJllJ8Qp/IRnKKTeoPy1x9j37k1IZ?=
 =?us-ascii?Q?5UK0RU5RBluFbBx8nTUmuvmGE+E6QdkZ3F0cDALBa+fYy/TEmOjWbTxSmLTy?=
 =?us-ascii?Q?TXd/y+DZb2oUyBThsvqQPyQwzwh4orizDOT25owXKS3bOVu6qUAeyHFEq7RB?=
 =?us-ascii?Q?s8SQqgeVfTZiwGtIGKZmXVEsB4C7wmTeNjLLwwQUT+za0udERdLWP5g0uR9M?=
 =?us-ascii?Q?jsemhQqUd4aferk9mzWHPgfLC6BvymTShJTkEHSxQSRitOmNDo6+6r1fdKuZ?=
 =?us-ascii?Q?FD8DU4Q+aJhKpRNI88TUdfA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555021bf-3cb4-4a78-168f-08dd8c951de2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:57:03.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEcvBWjhWmw4YSW9HlpaXpeew9VRTFn3TI1/4zD7pmdUbD0wIp5WRw3YMlHsv7btwdCB+RpWsLtIZ10quhw1ABTZ4E01sLqWfOuLKDG0zmin9CKUtM8E+s55zhxm9kv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
X-Proofpoint-ORIG-GUID: 4kI2Azq1LsSnl1rcT2TOXtgrfICHkx6j
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=6819f916 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=LC3zVhqhmS6NOWviN5wA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: 4kI2Azq1LsSnl1rcT2TOXtgrfICHkx6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNSBTYWx0ZWRfXyHjiYsfqDO/C A8ZPqOQ+qr+4E19hc5agMfPMph1zkckTE6LttvvuMwWGj1sruc3JhL+d58IoYBehmsSrZC4ySDM WwggKa4Y1BeEU77TImzKd6rkp5m6j4wzDprEydPwlYeFGrziT1xw/YhmkYuhcTiHEWhf3tS0kot
 Nkuy04eP5S1konOO1rD7I2pisWkgT7SQrmJBdNHjJefJPirp+h6IY0q/dk/kd2sTugxmUkeVmuo S3g6e1p26VqYcHGmFIjHQBbKFWNgydm7nP5v8Y1tF/lXdZu4i95ZTgGoUdCBveZnyMp1ceApJi2 oX8mhW/fPCXQg7ALa21gO3PrNFUoWVQLG55gAhCwRpu1oX2qZ8aULBLG9QCUiV88PUM0ZGYuyqT
 A7d5epMF4byTr9mNL7VFmFMVwiHk9zUQJ0I6H9XbxejoDEbv8djyIbSnhOlQ+Mjl7Ee/H+54
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505060115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 11:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216041

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.41 stable branch are updated.
5cb575ca9a elf: tst-audit10: split AVX512F code into dedicated functions [BZ #32882]
046b33800c x86: Detect Intel Diamond Rapids
a53e764657 x86: Handle unknown Intel processor with default tuning
aca31d2712 x86: Add ARL/PTL/CWF model detection support
f68b407d4b x86: Optimize xstate size calculation
d6d56af6e7 elf: Fix arm-linux-gnueabihf build break from b861755a84
b861755a84 elf: Extend glibc.rtld.execstack tunable to force executable stack (BZ 32653)
200d20123c x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
80cd656649 x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
a282e2c0ae x86: Skip XSAVE state size reset if ISA level requires XSAVE
bcd4cf9d5f x86_64: Add atanh with FMA
7e72fa7577 x86_64: Add sinh with FMA
6a3a4a5e58 x86_64: Add tanh with FMA
ce9b765522 nptl: Check if thread is already terminated in sigcancel_handler (BZ 32782)
98c712855d nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
e22c132484 nptl: clear the whole rseq area before registration
33bfd9020f Linux: Remove attribute access from sched_getattr (bug 32781)
66fc3bd758 math: Remove an extra semicolon in math function declarations
1a3083b999 posix: Move environ helper variables next to environ definition (bug 32541)
91f8cff2c4 configure: Fix spelling of -Wl,--no-error-execstack option
fd202462c5 elf: Check if __attribute__ ((aligned (65536))) is supported
746ef8e939 static-pie: Skip the empty PT_LOAD segment at offset 0 [BZ #32763]
56609f8df1 Pass -Wl,--no-error-execstack for tests where -Wl,-z,execstack is used [PR32717]
89be78704e AArch64: Use prefer_sve_ifuncs for SVE memset
c47c3890f1 AArch64: Add SVE memset
e0bc5f64ea math: Improve layout of exp/exp10 data
009c5a2dca aarch64: Add GCS test with signal handler
8d98ee8d70 aarch64: Add GCS tests for dlopen
61ba3cdfa9 aarch64: Add GCS tests for transitive dependencies
fda5730898 aarch64: Add tests for Guarded Control Stack
6d1f97bb06 aarch64: Add configure checks for GCS support
7774a9d07a AArch64: Improve codegen for SVE powf
2025e27a81 AArch64: Improve codegen for SVE pow
f3d9c116cb AArch64: Improve codegen for SVE erfcf
94859e8680 Aarch64: Improve codegen in SVE exp and users, and update expf_inline
7c9a086807 Aarch64: Improve codegen in SVE asinh
30992cb5e9 RISC-V: Fix IFUNC resolver cannot access gp pointer
07288c7445 math: Add optimization barrier to ensure a1 + u.d is not reused [BZ #30664]
2cb04444b9 math: Fix `unknown type name '__float128'` for clang 3.4 to 3.8.1 (bug 32694)
a900dbaf70 x86 (__HAVE_FLOAT128): Defined to 0 for Intel SYCL compiler [BZ #32723]
1e0e33e1b1 Fix tst-aarch64-pkey to handle ENOSPC as not supported
69fda28279 assert: Add test for CVE-2025-0395
cf88351b68 math: Fix tanf for some inputs (BZ 32630)
cb7f206537 nptl: Correct stack size attribute when stack grows up [BZ #32574]
d85a771953 math: Fix sinhf for some inputs (BZ 32627)
bdccbfbc52 math: Fix log10p1f internal table value (BZ 32626)

Testresults:
Before update	|After update	 |Difference
PASS:  5816	|PASS:  5826	 |PASS: +10
FAIL:  239	|FAIL:  239	 |FAIL:  0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 164|UNSUPPORTED: 164|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d28affed9..d84106fb95 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0a7c7a3e283a55d1bfaa48fdef063a32a4689a2b"
+SRCREV_glibc ?= "5b4c4617016d28569106549dff6f9fec73eed5ce"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


