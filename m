Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8676EC3ABAA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 03:03:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3661.1746068613999611025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 20:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7216bab501=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5412b6p1019495
	for <openembedded-core@lists.openembedded.org>; Thu, 1 May 2025 03:03:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj1htp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 03:03:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7AsZGW3IWOaaYr1B2LmG8IaJHGbdhyOX3QPgAjnhAfB1KCZz+Xlaz1DjIx61ku2FE+tLHtwzkBWYtNuIOvAPcTOz+U7pKOhsVHwq9rcntaQPHyFQs7Zx/8HIROnPmjW7dJO/Z2GeO0t7OaHDG+sXERk5IelFA7KdBHqPUDXGZkiEGfUZfpU5Sad5RnZAfWYCEovaxOkgf/ytgflBbxooXDO8TwxI/ZNHXwqHJy/H7zcWR8Ep87Y/CwCvGu257o9s5q6TC8pSxk+deyiR/oJuAAW29SyrNVCe0Pb2Qcz+jWEKuUUpIZKJztEa8qhJ0OuGrNij8fa8U2uzdon0AB3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5HBp1J07or2RpKcSUMK2LrQVDUH+1o+GrHHPgu62fs=;
 b=odg/bpOsOVyyGj4uJYjThPCIkVC4R5s9ITy1OqF+60vDI5Ws+C2cCTZvMqYSN1BEBYYlvPyDAIBUVh6PSuyH1ce8lKB9NSb1+IRICBRyBmrJfXNQqPWX5rAItDUT+xxhPYjN8vKdUmpR2YHjfKL1oDmCOsin6XjJvmmQ09MPnPrhAI25X/pwoYBiQciDbTe0hBDCI+UyNDXvN+Z5KQ3dwsUpc0WebwyvUdqQaq5rf6Q4k8mD684SgxlUtCUd0X+zBANzu8PdxeI2Q/r0Gs1b6yLSNqz9An7Ed70MIq9E3HAndyYyneuH9Km1tbkDo3umSovbeSjXVJo7j3LciTiTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 03:03:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 03:03:28 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Wed, 30 Apr 2025 20:03:13 -0700
Message-ID: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 75deeba3-a7e5-4521-25ab-08dd885cbf0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CQ8+S82uwQncWdPFPe45upyEbVKnQOFT8QtHljGfE7CpMFzgwUb68vraE547?=
 =?us-ascii?Q?JfRwJHgqv2wWd4lu+Yjtydb7CrlgwChSF+OoT4TbDDBaPvGb5ykBccVD1CHc?=
 =?us-ascii?Q?qJEQqf+zw7heruD7n6xB7bgZbRAEeAHh2V52Lb0xBdbmuzcACnzOg+8njBl2?=
 =?us-ascii?Q?Iz5cz4M2W7d2frAg1xXtJYjyaQohOwl2x2HizKSe2B9gOTvrda3AEF4Y/P0v?=
 =?us-ascii?Q?6/nyC6lft7INAUekwuzr03ZNX948SV8WzfTvEnZBevwQrBVoAzaqD2Jocmns?=
 =?us-ascii?Q?QzCm+fHboU0O8632X+gqh2igvm/2ke/qHHUtQSz3Is8ZROCVW2CTKASuodsC?=
 =?us-ascii?Q?4SiAR8bF0cFSU6XXO/ooJidg0t4cM4miNXVNs9yGIzpuyhDqwPCRmeayErep?=
 =?us-ascii?Q?KWYb2AXChHO205S7gnANi3Op6CaRMMDQ/AHpP9ljRylKBzYeA2wojSklGMT9?=
 =?us-ascii?Q?lV53vfNZeVKeAgsMGgjr1K7oCLI4hyNODT7Utz5B2DVyriVOKpYxyx0KsZTs?=
 =?us-ascii?Q?sz7JRtH4WZUTIeuqmvBhI12ZmhKe76GYjzbEYXjwDspXOw7KncOYYNYidi4C?=
 =?us-ascii?Q?TzXkS6rTi8f700b8CK7zP0NwyHbw4XM/dB5vPUI7HbhkLgyGcAhRkj8RmXRb?=
 =?us-ascii?Q?fsrFHScgYLi07rsPWZ8SM8+owKdGBfSFUdW+9X785TLyAQ2hpQF0IHSgFHKb?=
 =?us-ascii?Q?4EgbY7kBLjavFGIprs5ESUwdNKSAD0WN4u3dnc3jUQjvxCXyid/KHweIP+3q?=
 =?us-ascii?Q?fA38DNXGEsIZBx2DaNznduZx/SfaE6MeajXPVB0N2zDDIeqAlifVNNCQ2QdN?=
 =?us-ascii?Q?w2eKWVOLAwilyO+pTsk99ARtQvEiHaChropO3+WBFSEkklRV4M9pYKL1NFDG?=
 =?us-ascii?Q?yHmSVLobpZno3+FojEFk0StfsAnH5tEfqWM5II864SGX+31v/AqLRJvP0f0l?=
 =?us-ascii?Q?XtHfazQQUanEZQ+Nb7tbu9e5z6HdHHbJvPM5nn2OUa7kOQO3NErq/czwHPAi?=
 =?us-ascii?Q?oEgBJ/B9G+mln3KRiMcnwBbnmH/D8A98v4o8uy1LhhmG2WcuvBEYDPxrMLg1?=
 =?us-ascii?Q?OmPZGK3UhxaOGAk1Orb+zhZKrFv2tuSScQxfeGCQBM/wZPbTLYmolbRapd6J?=
 =?us-ascii?Q?ZHxFuJ9tGLLRImyMtgKsZP/+XnFxmt4fOsmDMMDA9xtxA9eJYTr5EmM3jgGM?=
 =?us-ascii?Q?obNLqVXjFVC3Cn+BV0zUlybko6gcaIwqE0Dafj8dFbVwLLmS6HBlw6wyT0KK?=
 =?us-ascii?Q?0IgOoZBA/F+AvpJSGTPGBvUPpKmjB3fhbl1kR1LQxAI3mSSdXrD9I6dTE5iI?=
 =?us-ascii?Q?Gq1d7YQiI3eHQJs2eHioEgYXzZzez9rYrkllB3hKLatpZfjjmz6rB1+rw0oQ?=
 =?us-ascii?Q?2wEVGOmn5zVqvYzpy/b8b5ofN/q3r5PGOj6odRvTsQ2cAdaDGEMh0uNdU/hI?=
 =?us-ascii?Q?zN+XaPNB084kwxvq3/v2MQp8AJ4hHa93xo+YnLnT8Iwdb1ezKJhjwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d291cXi+LUolb6r+EMBaR8nE3QHx0rTeus7u9fdCheHJccXjYhrsF86StrJY?=
 =?us-ascii?Q?aWyIqLI4rn72IwdYL67QdawY59y5HxLioSlv1UNRSPgu//m5+LlfJ6SFlXXX?=
 =?us-ascii?Q?mHYVtHt0BG++J2saNsGHhOmxSjorTFQ1f33FeHeu/zPAEr0ReQh2FYPoUnt9?=
 =?us-ascii?Q?xZ2hZmf459+ltBcalZbxIyvtXTl2xjAfO9ZMXfXbh1kCPDt3skDOaHnwW0qF?=
 =?us-ascii?Q?nz4BygriQvPjIGt1p8745MEf0f/wND3TylG0z/5Q02rLLxN3YjSBI5S2b/F8?=
 =?us-ascii?Q?c3aawa2gLPN5fPsISmrYSEf5Qyu23hZKXAt4X2CD8rLjm/LL6EG3EIqa9qOO?=
 =?us-ascii?Q?PnGK8L0IpEKj3NJnZw5wtIJxuMhActlN6M4MdS36US46mlvng6M0a3HC4DC8?=
 =?us-ascii?Q?H4Dv1TjXM+1xkRz3pKZG8NO8zuCQ1oU9/nkKQAUDTqkWxFaCgAEy7MHFVJ7H?=
 =?us-ascii?Q?0ssxxxtWYUNrsxX1mEs/1c/ZHoefP9btzAps7C9tMjmS5jeHxtHV0NZQzsrP?=
 =?us-ascii?Q?W9DyG5PRe4R42fMI+DGuSjSLcO82hKsW78oDamb+//nIjK306G75F7nE1UL4?=
 =?us-ascii?Q?EcquShJXLdDKc0iOnaDBue/YBClCQJ0zqVvKWD5ZsVHgRy/S9ZVg9oOMMoBS?=
 =?us-ascii?Q?+V8v9kcNqkEQxhBvDgU25K1s12u+hlnQ87LicfgoTB5yWBr6Wz4gxOFy+Xh4?=
 =?us-ascii?Q?VjzwA2F3Kys8PtvsgQr61UCwuJaUMdXscK1QDEUry40Cbi0DvgbP2EX1cKGj?=
 =?us-ascii?Q?Ig39RH+O4ahYwK7ho2oloPZrk3hB18Bl/6BG2UYVs/Gg0NxRSNQjh94ao3AB?=
 =?us-ascii?Q?WEavM0B84a1AGywCGkccL62CXIBOFUfESThzrPApf7PwNXgfphCVgVAtRs5Y?=
 =?us-ascii?Q?zD2fFtaO4biG4Zj3p4l+4ZiOxRWSEBggHmYNLImmR9uPD67jcKjAiVtRrmdn?=
 =?us-ascii?Q?PNuwD9HkS7H3U5oB/KCYIAKb/XMJw3jyDIWCIIw9CE45605nzCQLaIYWaWHE?=
 =?us-ascii?Q?4VCx1YTUm90+4OcXgWfD/2hav1jNd9UjQKti62lWc//iUqmIDTyPsRF/yBK7?=
 =?us-ascii?Q?gFOhsm+UdtOyGB9UJUvQhMxv43v2ndm0OwQv9L7/v1ba1N6Za60XgsAqn9NJ?=
 =?us-ascii?Q?v4pNSR6dI4kwmlED67c67juWQQ+xL2G0714YjxmEp4rjDNr3msTNHFNXfwfE?=
 =?us-ascii?Q?iGjj1l8U7tBHHxIYTG/KBlLOWyRJXl3siYWu5PY7xt305IJ8W9gRywTc2FtF?=
 =?us-ascii?Q?3slTfb91qwlcKgdTAaBw5g2v+TsfKEj+bo6vsa5kZx6X6tMc7ebFJcq0ozuI?=
 =?us-ascii?Q?zu7TdViSeSk0SQgbN7lWDfglwyhEvf4/AFzTmNBCuQ8uX/k9OMglXeg8zt3c?=
 =?us-ascii?Q?BWzc7rlNRzzomllHQ+i1DsyU20213GQMNaWO7/DLluGxhMyuGK8sShdiVjyM?=
 =?us-ascii?Q?5C5AUWLWbZdBLVvA0gzWbqpSSRVVZD+bsN5YBp2MW32r6l7Uc8rVBTQIq7IN?=
 =?us-ascii?Q?sbqc5OE8H0PLC8C9x1IxCsKeFsM+U51CcLSh2/NkuaAwIFVRSw/vagC+9FES?=
 =?us-ascii?Q?wevmW0uHRBlb+5FUGF/kPomNcXEd1k6dQCr3tFkKQIhQHzv/tQ7/DAuoYplX?=
 =?us-ascii?Q?Xtrzr8QHXG7HkjaQsRqxqpc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75deeba3-a7e5-4521-25ab-08dd885cbf0e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 03:03:28.1742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmVOtVuZmtxGGImiJawsOgA41kcj8njEpLUDJJ1llFYHLfbRQO5owUKVMV5WRGJeKe1VuwX0e7SlfVKELj9foGvICpWxNT9CUjuyz0RGW6NYOi8Wj46koolNxeUXY2q4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=6812e484 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=xSs9iO1qsYZR3K1SDMMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: S2qUJEulnlIWEL-u8_-V6KTHx8FIt9jE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAyMyBTYWx0ZWRfXxnHAEgJFNPio qJqbmccAIPjh7pjlcY14q1RiVK0RotU6q+qx5WXcqC8gwkLtKpYUU3zZ0dPxcBGwXad2xJYCsSd VM8x1CUJVzx8Af752x7q3x4BHe6RcUIoHnzqYHjvd+bwuTWAIfR7eEyevqoysACQY+/zyD9pGdD
 9t3iBs/yzBHSUrd5954pO2YdgaiGsm7/0geGS3Uk4tJ6qSEGpzqbqBrwMYb3ExMhOr/M3SJWAz1 5u3aI9AebmordsP5GhCDu2gH0bidCNhozKEK1BeN27fPnnQ6huHnp2Cl9pYZGAw9x84+LNljEZ1 8tYlWSoYuiQ9PSkTViTKtMpnpSpufyS0cNMr+mCP06WV6Q6Q+MC8iG7pB8xHnNkt+xAMDB9p98L
 zlOG0f4pWGY7M5PM9dT6hw0yyRySAdVtDi2OUddVhxwsQAmDofLruNHKvMnv2HyBmETGyXZw
X-Proofpoint-GUID: S2qUJEulnlIWEL-u8_-V6KTHx8FIt9jE
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=825 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505010023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 03:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215761

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

3463100f2d x86: Detect Intel Diamond Rapids
e09436c2cb x86: Handle unknown Intel processor with default tuning
7620d98186 x86: Add ARL/PTL/CWF model detection support
765ff3d0d4 x86: Optimize xstate size calculation
65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-temporal path
2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (bug 32047)
bde201e92c x86: Disable non-temporal memset on Skylake Server
38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when it is undesirable
cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
0da58e8be0 x86: Add seperate non-temporal tunable for memset
837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAVE
4cf3f9df54 x86_64: Add atanh with FMA
01ed435e2e x86_64: Add sinh with FMA
0edcc77fe7 x86_64: Add tanh with FMA
7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
e1fe22368e nptl: clear the whole rseq area before registration
dd8c0c3bbd math: Improve layout of exp/exp10 data
a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
d0e2133470 AArch64: Add SVE memset
0cc12d9c47 math: Improve layout of expf data
0cd10047bf AArch64: Remove zva_128 from memset
dd1e63ab58 AArch64: Optimize memset
65a96a6f2b AArch64: Improve generic strlen
4073e4ee2c AArch64: Improve codegen for SVE logs
78abd3ef6e AArch64: Improve codegen in SVE tans
a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
72156cb90b AArch64: Improve codegen in AdvSIMD logs
5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvSIMD routines
80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
f6d48470ae assert: Add test for CVE-2025-0395

Testresults:
After update	|Before update	 |Difference
PASS: 5068	|PASS: 5072	 |PASS: +4
FAIL: 120	|FAIL: 120	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index da9227ccca..040fc793b1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
+SRCREV_glibc ?= "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


