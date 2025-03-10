Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AF0C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:12:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31861.1741590740161692358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164982c3b=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6ILjT013728
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b411swu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQuwgNDHckzPH64v2McUnbplvu/71076LChxgng2pX4mdBDi0Eos1XisUEa68b3H4hGy7LAxM2PR2l5eMF3USmC0A2adxcLMbirM+pVIclkg0m1dS9PFoTnyMuYY0RSjcKTogcZ7nmVlOG7jdjrtwOJJoZfbKn6vu6VqYu+Lipj7PGNdEhtoxrm/ROgv/W9cb1eSj6PX1Bw0cIBHoEeyY9wg2T/sDT5Cp85X462Eup/vHveQTcfuWG45A18zcALGeUbChzJ385Qfe3l1bjXWZbsvj6GqBezq0KIABstaj/wthsM7NmUec9abgbO4S92FcUoftFI1wPD4Y4omNMiQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiSHY/jlwH4AJ2Gri/+TSV/IRNDLG8ghqQCdRdXzyvA=;
 b=wDOl4tEJRMDSCVqFEjg8Gv7kqWrtKXJZGnHgtDqIfxY0/OWMDBFedgjwb7GuJGCaRWDlVnyHjMomTC+vlGRWseF6OVlu5MEHEfA3/ivwKzX5C3snMbr3HxFkXI9nq9nQg7ksQVs67hbcpeOf+WM5SYqBkkEnBHo7KJETP5WY4vdeec7RZ/FHBm69f5GxquiB+53RZ+WbvRAsKEwjWImeGfG4hCRv1gwETibH4id6py/Oy1IhrcJMKcNQsMZABIb0cDARaS27YgWzmClLuwfPtXn6Y+c0cAGFIIwlmKprjUnr3bAhRPlgqZs7u1sQECaPaW6j98NEUrnoJnSdinOqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:12:17 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:12:17 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v4 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Mon, 10 Mar 2025 15:11:33 +0800
Message-Id: <20250310071133.2713991-2-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071133.2713991-1-bin.lan.cn@windriver.com>
References: <20250310071133.2713991-1-bin.lan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0203.jpnprd01.prod.outlook.com (2603:1096:403::33)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df92e13-fbff-4cd2-9ba6-08dd5fa2e3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VfigDCKY+DPwqQH8fkbZ8LYKjigJKlcVIld6UNM0D17JSIxEcHf7pWK6rTKx?=
 =?us-ascii?Q?PEH5BzDf6Cme6xwAMblos/qdJacfYDwG5paGF+tQ70UojfJXYB8VSZLlj9Y7?=
 =?us-ascii?Q?0KW4k0d0Q+lkONeFWzFXOV8hBQyxXfWxMIiTDjLTS6/XSfea5WLP6fORI7+Z?=
 =?us-ascii?Q?b9G4N5C4OE6xTz9TVAjI/ep6/ukcMVhGugizI9TcBgMA0AqE+qiW+cXukuMp?=
 =?us-ascii?Q?ETwVyEql97A0cciD9x9QF8DLjZSokqgkYGVkcJqsoMi36fIFxkFJoltVnUyF?=
 =?us-ascii?Q?YR8sTwjR7HmIoUci+Fzj7Vx5OzeoBdNmVVFnLd4MrLqrbmgX7zzv90CW6XI3?=
 =?us-ascii?Q?0iTXR3z5teD/aIaiYcFBGFXp1YEeyKHkfr7PI50FMjQX5KPTe/PyV2Lj7tbd?=
 =?us-ascii?Q?c0FeqZZrSLCMNAKuZORsR4hI7HRluzWOcR+GLgMiR6qiwLzlm0KxKwPnl57s?=
 =?us-ascii?Q?zgJBwCkIoSmjppcKY9sRzRu4TybVZEjjiMI4gy8MW6BvhdqSirw4/od7qfL4?=
 =?us-ascii?Q?owtnq+FQnXVlcBayD3RD73WbLMN8uZGqPOAm9H2126d6MRzpkY31Zq5jo7ZT?=
 =?us-ascii?Q?cbzSWtXvo1tQi3kME2aVDW33zQ2jt7+OAzkJKRNWU4QKT8mZXPTJt3ddOhC3?=
 =?us-ascii?Q?j/WL2BSuV7fsZl5N6GflSAf4S3g66B5dPNeKBEyO+5w1VfMILKzozHRK0FrP?=
 =?us-ascii?Q?asfNx/6BuzgrmG6Egot6wT9U6Gak44K6Eg5YhtZfLqhZ+gg1qshr8CRmirUO?=
 =?us-ascii?Q?jHTlOuIAM/yw8wx6LGH7buvfyXCYsRCEliODEljp2/ZEHEhJy7uMTZYJ1oHX?=
 =?us-ascii?Q?hmjhvPXVdDHsPY1tu1kxp2WwF7Igbf/9tyShSvof54hKwoAlCjT1FXoLojEK?=
 =?us-ascii?Q?yWZg95Hot4BOFz+gHhOlZCb4RDHdpKGsK9vT/TzJLjPksLeT1P9lkKMrBMtV?=
 =?us-ascii?Q?RQIAdjKOceKxo1SdxzLDrqzkBey4EtZY12ruSSZ2bin+eEAPLzZCOYpbvBZm?=
 =?us-ascii?Q?rG8lPTf3tHApjpWwDZqK/E7gLfAskSdx81WNgZBoTLiKp6L4ml84iwPSmqBd?=
 =?us-ascii?Q?jMWrI827BixoVvbuQYb9Ija8lD8YDXRFQ51/tsy2GztLwZUJDygRGcqR3f56?=
 =?us-ascii?Q?tIRDM05WDhXkzt+LzbnoIelQGurD/hKYcq8Eo4IzzSOheDLCxxi6a1LiLwKt?=
 =?us-ascii?Q?YIDom2xCH7foX3WC9gupkSbHqtiVWH7ruT8DT/zS9tNW02/m7Tft4OpXJvpo?=
 =?us-ascii?Q?mVBcvINJEjg6F8atzNZbOCKPHhBTzX+dsN3yAdeOoY15uacJ0fSoM46O0o7Z?=
 =?us-ascii?Q?HT/ZYfO4gQpj2gK0Nn2EyyA6/BOIr/PtRoY166CMqcFYPx3bkr+nyNs2hez9?=
 =?us-ascii?Q?PIxAVxAyD4freazztQmwwxHHaIFi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tf6uw872Sqe7arqmq5I8csjR1K3tQikk4Yst0v33dME3HQEqJIbHHNvzkxGF?=
 =?us-ascii?Q?BFhzlmf/AGN7kF5tg1xyvWySUslh3CQ835KEqI8tnTTvrH/eqOAStK1T61Bc?=
 =?us-ascii?Q?veA2IZBbtBW90joz+8+JhdBG7+GXZH49XMuYge4/QWsfNOBwMVGmLFFrzuW0?=
 =?us-ascii?Q?vFKj9rl2suVqjvaOKCzXC/c1gLo12aLcFR80oqd+fdXalbLmrJznrOzW2hpw?=
 =?us-ascii?Q?Zt2E5PQj2qHYjDtquRTNVwrGcFQONtUWIyEtl5znvf9L3WyHPNZQiHX5r09+?=
 =?us-ascii?Q?Rs6f6FjGIMxZbGYEBhIZj+/+HpyDvNjemFxlUJme2nfczRokRrt4INJZkLeB?=
 =?us-ascii?Q?t/fPU7CdYBjxaFYzxPNfBzF/bQdqGAEtQZX4JiJoGOXUHqszxUMdJRbDS5cX?=
 =?us-ascii?Q?/SrtK4p5jNrcDxbRweInj/s6woDNrh5mmWT3YfrDSMCAkejnm86qnluwwShl?=
 =?us-ascii?Q?wxRsLKhUZ7f0yp8TyQhMUQu2RP3cT5clD+dWtoIFuluBTC98O++01rcTr7r0?=
 =?us-ascii?Q?U0Wmizg2KheicWaHuIDlNOTYXGXTW7SByr2cOWyNKnKFDMxHb5KvXhsNBpsy?=
 =?us-ascii?Q?Tvs5PWyNYXkXDuhrzkUYRM7LKJnoeQUycBUHSwzzLVKLUsmbJX/1lHFYkUug?=
 =?us-ascii?Q?z75z5P1e89mfeCo1b4byFWlRzLyJ5c0e9loFwvo5nU5JEL2o9lweSt8fOELQ?=
 =?us-ascii?Q?rVxoi2p0tLiSFAN/1WZh2+7vKme0h5QA4hC6d6RKYlkRM1b49AsNxIdM/xyw?=
 =?us-ascii?Q?5WDtFdT7NOy4K0/ko/bOCU/Ia+x6cpvlTKo3Fg8eGYSvs06DutSW4o0UTc1h?=
 =?us-ascii?Q?BJbzMj3pV2+cnajCwUaMirq3LzYVFQUp84SHcuxbl7wniwAhLIqCIiwbhVax?=
 =?us-ascii?Q?j8LmGLKg5vLTIZfZfyNrB5+yQG+CbaoFYENYByoG4neGgiveFsp2cr/1X7Gq?=
 =?us-ascii?Q?NL8TlFMG62UK8eM48y0nuWBe9KNLc3y6o5Z3YyRLZ1iguVJY00tRptw4XoNQ?=
 =?us-ascii?Q?09CTqsXH7s5ooSfawWo70DOx5wwC0//qen/UgF71THGOXx2KCqagHZj+iz76?=
 =?us-ascii?Q?NyYC9rqddx25U1q1G4r7HO64NP2+dB1aNWaycHrOrwNH986kz9RbJA638zip?=
 =?us-ascii?Q?52DcKHHesMOp9jO6T1JWoAlsFp69Zy1l65ONXMEhr0jHFXK9ilj0tAGXuvKe?=
 =?us-ascii?Q?UxyxyKzOK9ASRof/2tXika1ZCLitqF+UNMzv8n+T5+CTrKlWbDlSoZniTr+l?=
 =?us-ascii?Q?QbY3LwTBCaLI7u6NOhmT3njnIOawbzUjDMH8m/VmsrqcevOXlZhxc/IJSbYF?=
 =?us-ascii?Q?6OX0L8carUXQHEF8DzmO0dgRZhvYM/+TniIEh8LZg2mM3vrxtdD+KlDVbjo3?=
 =?us-ascii?Q?BHmScyog9Cz0X//qDQybUwvgjDB4w5GbMPmA5PWC8tHEWV0WzfM7u/CF8Hc5?=
 =?us-ascii?Q?J7N5QnD9+Cqf1LFySujPupWOfsuiE6hkFIbrQPHQaeDbLe+HVfeIuarlyQ4X?=
 =?us-ascii?Q?2fLfbN0UWdayaN88ud2jghDb6v1zZfYnwaLVDT5pCTMWQaqF2BMjWl6zfWmb?=
 =?us-ascii?Q?ntuQ/pQ4l7599Ls6PKBVPq1BPyrW135rZaoD5khAPVDd+SHTxgWPHhR/zYuk?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df92e13-fbff-4cd2-9ba6-08dd5fa2e3bf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:12:16.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8Pg3YwaQaouOCNyqU98QQwg8aFS7eHMfTiCx/8jnbLizhatMLtXRJXJ+TrQUejHt8aiiHvrgHMef7jFTdoq5mrHW3Hgci/x5bfom/VZ29U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67ce90d3 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=ynrq0BAzsntb6Ef4gTIA:9 a=_PE9Q_0Z8bzuyU0-:21 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-ORIG-GUID: beFtBsA_0i97dAc4yuvifXZMXQzC9hf0
X-Proofpoint-GUID: beFtBsA_0i97dAc4yuvifXZMXQzC9hf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212489

From: Bin Lan <bin.lan.cn@windriver.com>

Update 0001-Make-manpages-multilib-identical.patch with correct line number.
0001-tests-do-not-run-some-tests.patch is used to disable some new test
cases.
0001-tests-do-not-run-test-applications-from-.libs.patch is deleted for the
commit log is not very accurate and the line number is changed, is replaced
by 001-tests-set-the-correct-plugin-directory.patch.
0001-tests-set-the-correct-plugin-directory.patch is used to set
the correct directory of plugin shared library.

Copy the trace files (*.ref) and the metadata files (*.mctf) which are required
by test cases from source directory in babeltrace2_2.1.0.bb.
Set the correct test environment variables in tests/utils/env.sh when running in an
embedded environment. Remove "GREP=grep SED=sed PYTHON=python3" from the file run-ptest
for these test environment variables are set in tests/utils/env.sh.

License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0
Babeltrace 2.1 is a major change. Babeltrace 2.1 is released after five years
of development after the release of Babeltrace 2.0. The licenses did change
significantly.

Changelog:
Babeltrace 2.1, MIP 1 is available and adds many functions
to support CTF 2 features.
The Python bindings wrap all the library changes in the same
systematic way as in Babeltrace 2.0. Add type hints to the
public API to assist with static analysis of your applications.

Details about the 2.1.0 release:
https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 ...001-Make-manpages-multilib-identical.patch |  9 +--
 .../0001-tests-do-not-run-some-tests.patch    | 58 +++++++++++++++++++
 ...not-run-test-applications-from-.libs.patch | 28 ---------
 ...sts-set-the-correct-plugin-directory.patch | 29 ++++++++++
 .../lttng/babeltrace2/run-ptest               |  4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} | 33 +++++++++--
 6 files changed, 122 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (70%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..76bef9c3b8 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
 
 Upstream-Status: Pending
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
 ---
  doc/man/asciidoc-attrs.conf.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
-index ad1183f1..e11c7031 100644
+index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
-@@ -1,7 +1,7 @@
+@@ -4,8 +4,8 @@
+
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
 -- 
-2.24.1
-
+2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
new file mode 100644
index 0000000000..11d97a276b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
@@ -0,0 +1,58 @@
+From da489a5476249dbf087cef7f5da57e61aedd443b Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Thu, 6 Mar 2025 16:14:45 +0800
+Subject: [PATCH] tests: do not run cpp test applications and
+ src.ctf.lttng-live/test-live.sh
+
+These cpp common test applications are needed to re-build
+in the target. The test cases src.ctf.lttng-live/test-live.sh
+need a local or remote LTTng relay daemon.
+
+Upstream-Status: Pending
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/Makefile.am | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2a4022bc4..df990218d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD = \
+ 	$(top_builddir)/src/lib/libbabeltrace2.la \
+ 	$(COMMON_TEST_LDADD)
+ 
+-TESTS_CPP_COMMON = \
+-	cpp-common/test-c-string-view \
+-	cpp-common/test-uuid \
+-	cpp-common/test-unicode-conv
++TESTS_CPP_COMMON =
++#TESTS_CPP_COMMON = \
++#	cpp-common/test-c-string-view \
++#	cpp-common/test-uuid \
++#	cpp-common/test-unicode-conv
+ 
+ TESTS_LIB = \
+ 	lib/test-bt-uuid \
+@@ -225,7 +226,7 @@ endif
+ endif
+ 
+ if HAVE_PYTHON
+-TESTS_PLUGINS += plugins/src.ctf.lttng-live/test-live.sh
++#TESTS_PLUGINS += plugins/src.ctf.lttng-live/test-live.sh
+ 
+ if DEV_MODE
+ TESTS_LIB += lib/conds/test-conds.sh
+@@ -272,7 +273,7 @@ endef
+ $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
+ $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
+ $(eval $(call check_target,cli,$(TESTS_CLI)))
+-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
+ $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
+ $(eval $(call check_target,lib,$(TESTS_LIB)))
+ $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
deleted file mode 100644
index 805dde8064..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
-From: Anders Wallin <wallinux@gmail.com>
-Date: Thu, 5 Mar 2020 11:20:04 +0100
-Subject: [PATCH] tests: do not run test applications from .libs
-
-Cross compile specific change
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- tests/lib/test_plugin | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
-index 652c90cc..1f817c50 100755
---- a/tests/lib/test_plugin
-+++ b/tests/lib/test_plugin
-@@ -26,4 +26,4 @@ fi
- # shellcheck source=../utils/utils.sh
- source "$UTILSSH"
- 
--"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
-+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
new file mode 100644
index 0000000000..6a46c821bf
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -0,0 +1,29 @@
+From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:51:11 +0800
+Subject: [PATCH] tests: set the correct directory of plugin shared library
+
+test-plugins-plugins/.libs is not exist when cross build. The plugin shared
+libraries are moved from its original test-plugins-plugins/.libs directory
+to test-plugins-plugins directory when cross build.
+
+Upstream-Status: Pending
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/lib/test-plugins.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
+index f83e42baa..939236393 100755
+--- a/tests/lib/test-plugins.sh
++++ b/tests/lib/test-plugins.sh
+@@ -14,4 +14,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 71a9c81bfb..a0bf33b75d 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -4,7 +4,7 @@
 
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
 
 exec 2> error.log
 make -C tests -k -s $makeargs $target
@@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
     cat tests/test-suite.log
 fi
 
-exit $exitcode
\ No newline at end of file
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 70%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index 6a0052f779..090d9293e4 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            file://run-ptest \
-           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
+           file://0001-tests-do-not-run-some-tests.patch \
+           file://0001-tests-set-the-correct-plugin-directory.patch \
            "
-SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
+SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
@@ -33,6 +34,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
 
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}
+
 do_compile_ptest () {
     make -C tests all
 }
@@ -51,6 +60,10 @@ do_install_ptest () {
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
 	find "${S}/tests/$d" -maxdepth 1 -name *.expect \
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.ref \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
     done
     install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
     cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
@@ -92,6 +105,16 @@ do_install_ptest () {
 
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
+
+    # Set the correct environment variables when running embedded environment
+    envsh=${D}${PTEST_PATH}/tests/utils/env.sh
+    sed -i "/BT_TESTS_SRCDIR/c\_set_var_def BT_TESTS_SRCDIR '/usr/lib64/babeltrace2/ptest/tests'" $envsh
+    sed -i "/BT_TESTS_BUILDDIR/c\_set_var_def BT_TESTS_BUILDDIR '/usr/lib64/babeltrace2/ptest/tests'" $envsh
+    sed -i "/BT_TESTS_AWK_BIN/c\_set_var_def BT_TESTS_AWK_BIN 'gawk'" $envsh
+    sed -i "/BT_TESTS_GREP_BIN/c\_set_var_def BT_TESTS_GREP_BIN 'grep'" $envsh
+    sed -i "/BT_TESTS_PYTHON_BIN/c\_set_var_def BT_TESTS_PYTHON_BIN 'python3'" $envsh
+    sed -i "/BT_TESTS_SED_BIN/c\_set_var_def BT_TESTS_SED_BIN 'sed'" $envsh
+    sed -i "/BT_TESTS_CC_BIN/c\_set_var_def BT_TESTS_CC_BIN ''" $envsh
 }
 
 do_install:append:class-nativesdk() {
-- 
2.34.1


