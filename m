Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE77DC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 08:31:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14635.1721377894739511380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 01:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7930018dd3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J89jEr008596
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 01:31:34 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erea1dg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 01:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxhkkV6bMBQCeHoXLU8jrZVF8mfnGO8djlT3yzcOulw3FKmJ3ReB19377devIsGiRfxTr3lptaEPTCt2uBV8mjNIwjjCJY0g/5rZfzICiHWVMm6JDVgIgU6Bh+XyKrQnfI96doAuXlWJdF+jdzQacQDQBfilvbNYv1FMMDNqe4wpAPsAQy5MEdIjaRi02qOeynw1oM/655Lc5ojPvHwpf3cgK6gBOVhGPnf+CFyjSGEFYz8NmrM/UBxJehKQKW0yDDgH9b3J5NPnPpaxZ/q8g5We8RmueOPL/bSUDCDmIavCvLM961xPi5vuMshwRLKpOCyqrh8Ah9hKa4iJITq/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaWnGbbiBN8sbI9PC/HJDXaXkKQ8gITAe58Ctac3Vz8=;
 b=kjgp+OmoXDA/3JOWymXbNvm/Af0mazLo3EYg27QQlj9/qqUsr/PVhQpmpn+y2Z2eLLJ61FUpNScgl/bK6nLZwOMVFwcuJx+obGkYZPObebGfrgLeVzu1PIAqvakVWQwRVwoyaxuVaQ/OFq8cHNlMha29f4kRyRmGd3jal9WA296UYnnWfyVaRCeOlgnOaMvxj6grrGZI4mC7XSszDTs/sqmtxG+FB+C0KTyqSo6Wdy1qy2bnNDVT2llWR6n+c+CfqC/p/rs1pfTnA25fXauUm+9uzGeLDlSL4tRZJN6+dKX+2a8DK4c3mhYtTBpHNJNolon96hzIvoqPiMcQwHotRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 08:31:31 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 08:31:31 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH] glibc: stable 2.39 branch updates.
Date: Fri, 19 Jul 2024 01:31:04 -0700
Message-ID: <20240719083104.3918805-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb2305d-3229-4327-6ef1-08dca7cd3165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L6lcl5jaKJJnHLGPGlxMYtmCc2mcORNjHwPReYk8PjzetI9iHAm9w51MPsI+?=
 =?us-ascii?Q?jqnKAJs1f1b84ilzurmAR6LhN1BMW+7QuhfzG9tWg9oRs0NfdmJfyVMPz+nx?=
 =?us-ascii?Q?7W3xyQ2L8xwCoW/qR2PoVvmxD9v2CkDJNNEIcNvlGx7JYP3oMu98mlEyWXhD?=
 =?us-ascii?Q?xex4kVptlxUdvTZb/itbz5YLF7FuRzoq8CtXIGJONX2sVphSQ9aAvoTudzfY?=
 =?us-ascii?Q?NXoGrqybAr973na+PCN/O3/3b5MgKDtYBIqJBntyD2YLt/Jrdd+h3jN7P6Fh?=
 =?us-ascii?Q?N2GCTbgKtvbTuAM6Vt18JIbrx0W3IR6Vz+PhjnWeuxD2GRIjqSPXuEBCwLXm?=
 =?us-ascii?Q?DYhlWO/pG8qdCxBFFh56klDZpHNr8oI8fOBi34a5qANBVImoDKIGajP2vrIb?=
 =?us-ascii?Q?maooCRcnhliePKeZoC2/MJnuCkmxcJ/azX16cEHSMkVFep6yu/gg/0pNmb5m?=
 =?us-ascii?Q?EASIJ+q7KMExUKuAZ4q+0FlI9T5k+RpGQ+I6Jhbmka/FJsxMnUmdg5Tn9mZh?=
 =?us-ascii?Q?YCYB5pZhhQ6urThhRzgJIWBOmlKs/RSqn6FNbHye/GNEx6zb6z2oV9HQxKj0?=
 =?us-ascii?Q?dpNMgbxyBW6PdGNPUsfZz/H2y/UCMjOcalJ2jrGartX8NQOy50grFl/RTUTH?=
 =?us-ascii?Q?FV0E5NfHqCn13Cp3bTzzZ6k9HyWkKOvuz5wewpcM5wzHDRkJuprESaFnLC6T?=
 =?us-ascii?Q?7uubkgJjduNB1exC7ND/B20IY8J2QM9rIfpncKh9qgbE5kSKY9tgPazzaCPs?=
 =?us-ascii?Q?4uM6KGUlgaFC5tKxy8hstyC3pBTbsffCqcwP8XVSAiHvwkCn0LYc4zCoNXOE?=
 =?us-ascii?Q?jrOZzZhWar12ZYNfbqWNlrGh+M5wv6w2DhRj3Wt9pomJc6cjTXOu0eymRjsk?=
 =?us-ascii?Q?cbckit3s4QkrYaq5B/Fn07s7Wnje3rCtz0eXYlPJkpvKmWBHSZFk/4e4g7fm?=
 =?us-ascii?Q?d9QQcF3uZPqrC9X4rLmr/nlGY0ADnEYQ8+TbQ2z86xuXmcB+r8Us8QMSmFFb?=
 =?us-ascii?Q?TMAPJk0XNVtFYUOyW4n80ESWEpzRsBtBRiEAUCsyJe8YHVMtZ5X/zYYIR/x+?=
 =?us-ascii?Q?bwtgTUczq72E9cruovq+xx4QOiYstb985WO6eU8Vr6AkQ/y/E/Zq7kI6B0re?=
 =?us-ascii?Q?z+t49Ep2VXlztu7ylZ1l46pPDtLQUJApQlYSCLpAfCPkEWOC6NRR++8jXz0e?=
 =?us-ascii?Q?H0683qFy4UiH2rFtajhup+jd28tRM/gCOOI4GhLO/plaSOGglZiFqHXy6WQs?=
 =?us-ascii?Q?VkYE61ACEPpz+w3No4fhJeEfIgoigXq4JmgUK8iKDuE/oJaxkFuwqPAG5Ofj?=
 =?us-ascii?Q?zO5EtHQHZstaSVIv62QPnodtaRbSI6YZt6XzhQubWrcv5xtO2zmwYLVrSfhP?=
 =?us-ascii?Q?IqfIUu9fBOKi8c8Q8kFiNFAKKWR0FtVH5MxwWVdm+GN6vjUtUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?npCgUyesNcqkIfaEV/Pwz9MLr903LmwSYxhCgyx019L3iQZHkcEqH9ae29IG?=
 =?us-ascii?Q?vvtI9iAvgg3s5Gt6w0BoByQHaPdd3HF3xs4ieSb5jlexm62WpfW3Quw2xf82?=
 =?us-ascii?Q?ttvbKc7M8xbdHgZEz5zBIspP023SbAj40/qWibeyE2ygyUZmdAlCaKDTAixF?=
 =?us-ascii?Q?8wVNag68FQsh+1kqA+SkCu97flBpQLEOvj9IJO6MYjoAjC6Rz+kSnY+A+svh?=
 =?us-ascii?Q?HK2VMJkwUivzFkuZMPb3RU6P9CDQcigKh/oqliQJNN0mmsPp7wHZ0ZRSblWr?=
 =?us-ascii?Q?EpCOKuleibpj+PUGu1SJHA/2C6rVpvk/LAFRF31sNQjEwwQPJ2Wy+cZx/HGD?=
 =?us-ascii?Q?iSur58ETIOgXoX+wPOLMaqqULNcSAt2fX6ZMNh/E+06GJ/rhUDkJBV/CuKDk?=
 =?us-ascii?Q?KXDxyqQxTLF9ycySprddem3XZcearI+9+xZ6swHB77yLvcvgAbCME9DbCWoX?=
 =?us-ascii?Q?qb7FUPxRI6eMIImo49iS+UQSL5OEPxbX57ongYzTn05Lcbb7eZjTKTYoDD4o?=
 =?us-ascii?Q?w8+Mo6B06svjAcm01p8WfxOuQXNCDFT4syoz4DkqVWUfTgyi77jr/v7PvxJJ?=
 =?us-ascii?Q?+lz7HZwE5KC5DnNfc9J4N1qoPevWxcV7xT0XPK04pkJvPIbOWoO1EZifLEtK?=
 =?us-ascii?Q?MJivIvSSsSxbFMOeFysB5G53yokSCpb0GwZX/EVX6q1+cyA8E75nCro1Uaqg?=
 =?us-ascii?Q?NzUfFL5/i9Ho71UmkbOilfbeOiaRqm1AOT5fFMtPampbb69rYNo54Atg8Ppa?=
 =?us-ascii?Q?RXpjnAOuK/tl7+z04AAnZQEnnXh5TMcBD98l0BH8aNoJMPWzsL5p9Q+xC+qM?=
 =?us-ascii?Q?d8KkCfJdvHPiLAxTCpr6lUkL2j4ysWVaArKYa+wvq/nM0xua4C6bjF1IHyVP?=
 =?us-ascii?Q?hRF7ngpEZxkNGNra8nQ0Iio7qWkZsXz+Cs+iqE592r4W/KL3UY2rjsa8zXFF?=
 =?us-ascii?Q?YqS2M8p0eifpXxU5wIgWQ3Sth7Kgt0noExnpWwQox0B/aNzLPnS9Mxs+j0zL?=
 =?us-ascii?Q?+do+ahHf7fZPqzU/azWC1EMmSPq482ppCf3jMWlPrFLfL75r81nD+HIWV90V?=
 =?us-ascii?Q?LfWFGiuc8k9PTeUA5orL/gmgR848PADv6aKvZ/wTdwBWQaODan1Z5gLRCVWC?=
 =?us-ascii?Q?Qkwc8Tenw2cbPE1F8G9CeewNxLU4cVjsnKsFADvGR22ljbtfU0Dp574pBSQa?=
 =?us-ascii?Q?otpO4VvrocnXf1XPQb3FnRKgg7PW4Ia03JN1pDeI/qvPd2VA9rRK5L52+TEf?=
 =?us-ascii?Q?AJD45BiBv6QiigIxvsJ27dfc8Hi3iYgfqLNphbEcUos3oIBN4jg10+Kj/GyL?=
 =?us-ascii?Q?ubvTBWECoruNdbeZPBYcmBgK0tiRCJZ9uQUCwGKgFbbVxbzkED8F78pqiGQE?=
 =?us-ascii?Q?UurOY4d8tS+UIntkB1z7Cr+bp/t/sokUUr/tFzxunITo2t8luurocrDXutyd?=
 =?us-ascii?Q?MGtePJmj0VbmqSYvk4Vk435QcGLVdgo+3zNPSWtcJ+3LFCmCyrvzWPpiV6+i?=
 =?us-ascii?Q?MEortcIxAkYLpEGi9PalVy0mu1PnyiZq5BM5i7JB+EmEFpCaJNDORxRuztfR?=
 =?us-ascii?Q?Uh0N5x5JS0Vxdm9YFEmiJ5PEpHEcJlrg2WhaF9BSlYCye+/JNg8kKL26eVcp?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb2305d-3229-4327-6ef1-08dca7cd3165
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:31:31.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkqpT2zSi8d2D30ewoRMlkQ52Pm2kTYXm8sFeNJVagn3SspV7ZwODEvTkYnczRIqwTcUdYcLagfCiOtXNvl3RZyAYNYy2uqZ9MPxwCsE4yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
X-Proofpoint-ORIG-GUID: 99de2Zsn4QpOX8iBCRscrLI4ixNP8nzv
X-Proofpoint-GUID: 99de2Zsn4QpOX8iBCRscrLI4ixNP8nzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2407190065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202257

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
e8f5217097 Linux: Make __rseq_size useful for feature detection (bug 31965)
143a7a0623 elf: Make dl-rseq-symbols Linux only
1062ebbd19 nptl: fix potential merge of __rseq_* relro symbols
5c46e6b666 s390x: Fix segfault in wcsncmp [BZ #31934]
a036311246 stdlib: fix arc4random fallback to /dev/urandom (BZ 31612)
d2cbfcf1d9 math: Provide missing math symbols on libc.a (BZ 31781)
d473c9bb3b math: Fix isnanf128 static build (BZ 31774)
3950cbd7a1 math: Fix i386 and m68k exp10 on static build (BZ 31775)
6cb25aff85 math: Fix i386 and m68k fmod/fmodf on static build (BZ 31488)
74630b1bb7 posix: Fix pidfd_spawn/pidfd_spawnp leak if execve fails (BZ 31695)
7f9f25f255 Linux: Include <dl-symbol-redir-ifunc.h> in dl-sysdep.c
198632a05f NEWS: update list of fixed CVEs in 2.39
77bb3c7154 NEWS: update list of fixed bugs in 2.39
f05638731e x86: Properly set x86 minimum ISA level [BZ #31883]
b7f5b0a711 x86: Properly set MINIMUM_X86_ISA_LEVEL for i386 [BZ #31867]
e1d0040a6d localedata: ssy_ER: Fix syntax error
9de9cd17e7 malloc: New test to check malloc alternate path using memory obstruction
a2da98aa2a malloc: Improve aligned_alloc and calloc test coverage.
305ee48826 malloc/Makefile: Split and sort tests
00899eba26 x86/cet: fix shadow stack test scripts
6ade91c211 elf: Avoid some free (NULL) calls in _dl_update_slotinfo
70f560fc22 misc: Add support for Linux uio.h RWF_NOAPPEND flag
c9d8534406 i386: Disable Intel Xeon Phi tests for GCC 15 and above (BZ 31782)
aee37de299 Reinstate generic features-time64.h
dd535f4f19 Always define __USE_TIME_BITS64 when 64 bit time_t is used
26e7005728 socket: Use may_alias on sockaddr structs (bug 19622)
9f2b100d67 parse_fdinfo: Don't advance pointer twice [BZ #31798]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 20125e4339..ad58bebcf1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "c7c3f5bf80ae86b34501f473f1a9fc545c911b7f"
+SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


