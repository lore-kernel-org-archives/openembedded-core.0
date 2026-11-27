Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17719.1795793317259165793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=z5hCNjPQ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 52.101.46.31, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYRy3sqP5xKj3GDn5CLQXYt6LBDK9+eY74TJQkT5jHkHfz6BUmb1lHxSJhXewYQfcQ4TxJvFD9MDS/2E1ZGYuaTAQ2HbJhHUCG03VRLyHjkRxJjEh6eC8NP/u/Gm3e9Vx/htxY+UWujVc0LKuIQa/HsUp61CfE7YouDBrUBmWdgUSqYa7Ti0usgiyBvrcecRRsZI4OTGiKlaWIiEgbs7Mpn1s5AnoZqYC7DLkkLeM411H3RJN0qZvH4Gpuy9djmCR2wZIhqv5+Q0l79tldCigizohfRVPvT42ehkua1/BsSHERH2/Oh+rGyJdZcQttzAmHs3abHT5rgva02G3FNdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U8Wa9qdS7C0RhS+9E1aBgeVkMyvPRayS6qEN/QeVy8=;
 b=goTBJMAyx+4Bj7zSKLOnOfRVh44uNY3x86K8Jvn4F+Ot4qBfmETLETAp+jEUfGHJGMaikLEz0DIKGqAdzd+XIxG3ZN6//ffgL7p6vH5BOP2IeNfx0tHRXcS+067pFhQtbZ2fAhzXZO5eH1rCxUXM0w9OBbzX3zUw3WW5izcfik2LbF7TbfRTj642JBR0Cj2uUxNAK8ojmPrIB9LILCs5lndt86/6qAUScVg0RLxpetMIWLltxWAUxxVaKblu+BleBTYSAAMP8lfrdeeEdvVmIPfa/Sxx7YQJ8477CGL1sJYL77Mt3y3/k/gtLWjLFLxUWD2ciE9DVkqjA0189M4jLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U8Wa9qdS7C0RhS+9E1aBgeVkMyvPRayS6qEN/QeVy8=;
 b=z5hCNjPQpntVOGc9AyDjx+++V6wyuutBMYAqOxITAGmktDxzxeYLVOPnftevF0eiylRBFcsw7pxwHwCCJlDlweg029sTipyvE2K4fYwVdHE8i6J/+3i4DDU3KUn2uZiqCBc8JSwxgzrgPsosZuk7UpAiBWQi7vBoPCRQvtpx1Ps=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by CH3PR12MB504406.namprd12.prod.outlook.com (2603:10b6:610:34b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 15:28:32 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11%2]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:28:32 +0000
Message-ID: <b88fee85-9692-4641-ba5a-db63b5bf5fa0@amd.com>
Date: Fri, 27 Nov 2026 09:28:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] pseudo: Update to 1.99.2 version
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>,
 mathieu.dubois-briand@bootlin.com
CC: openembedded-core@lists.openembedded.org
References: <20261126021504.2712290-1-mark.hatle@amd.com>
 <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
 <8e691720-8af7-37ce-efb7-bfd1fbbbdba2@est.tech>
Content-Language: en-US
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <8e691720-8af7-37ce-efb7-bfd1fbbbdba2@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:610:b1::11) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
Return-Path: mark.hatle@amd.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|CH3PR12MB504406:EE_
X-MS-Office365-Filtering-Correlation-Id: ed73eb7d-b6a4-4583-6159-08df4c9b1832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|6133799003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: FP3wxo/G4JXPcv3Vf4woE16JLTSzKaQniHMJS0pmj5Anaro2c1kAvPUhzYvIP/ZGHZ6CRrTcI/X9c4WI3DzUB2UT39yL8KhpNBRV5bqvcfWaQ2VVsplmXxmj7FktRQOm48DBDYUdYUk0mQMOw3YBz9YqyWp4B5oXN2i5QtdLBMNi+RfuiaSFsYNOXYTy3Ows2IXvHdGD17tfUitrx+uhbwXtLi6Dpxq+o8GmMl/RL0eAMQOH+9Jx1P6OwGlMGjNkGWMqedkIHRP27xGwx2BYxhMBJb+ffurB7Q1zQM93lF4CgMeBYs92QMbQdYfwpWx7vTsXXFDwthJpPrxIwdzj4WivD3+QN8v1hpwobFZVRYG6ehAizgaLhhl3rg+Q4+HA/hrURkKPGLCzQ7oXwBrdbtXGkfu7u98HgJ/LEz8JwnllDkUUbLxBYE60sY3lWOaMNxK6q4HtLKsSskq8P4xkdstWtn7Ky1iFdpFqo70mT5za1nKBKjYw1hmt+YKkaD5QNCfCD2Z+QlfNGBmqmIt5K/8BuMDzWRRdUf1ISOezbyhCS9fkUQKOD2Hm4PZScJq/vhnLxaf8wdSbbC5LC6CtM4O7S3VwTfBSAl2byJ5Xah0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQncrKPbektX9vonwWUV6TqhpLGzelkirg4hykIaFiwtMumuMc5lTSdxEGFp?=
 =?us-ascii?Q?XJnLpQqCIeIQHpz1Pof1QSkxy6cEjxr9+AL4/92Z3dbQTUybQW7YN4JE+KP2?=
 =?us-ascii?Q?xzZ4JgbRtjADH769PZ6sGSlMJTN2qI7Mww3EPJ7cVugwb6tD+7NWXOatxa+V?=
 =?us-ascii?Q?WCfsHOPsRY0v20qZ5qoPX8acYnAaUVenxN9pDpJmIWYqA1WN030adpFHFOUc?=
 =?us-ascii?Q?Re80TxR7RMQHBTr0UluzZvG/ctyW7zCDEENVqOVA5wDEti+WvDJ/GmH8qPTN?=
 =?us-ascii?Q?8iyRNCZx0yhJgPEpdaBmV13DQgAx7ULsgy9NkjSnxaCHu4aI4lpsoeV6GNmV?=
 =?us-ascii?Q?GxxmRxcFRYLqIQbPxddofrA5IRZnMVN52PYZiTR3fhv2XqX5hAvleugAwCi5?=
 =?us-ascii?Q?9eDjp3Kj8FSgk76XPGZNUrCOq8JnOl4NPdrHjqYyRVcWVekLikeq3/dJqbhK?=
 =?us-ascii?Q?A/UpPC7mzXu700LtQ4pTq1ohCZIS/6ZkFnGUo5vSB3ahAp7MmxBdcr4iGvtV?=
 =?us-ascii?Q?X69LowX6AbdFslZ6UoRhb1pia1UGVv/urhomCmyzuRSXOVSlQLkG/3lUM4qx?=
 =?us-ascii?Q?jvZtdFhR8u6zE720M/yJKDx2B+yuBzhanWv7aD8sir+eLh5AfZPnkiXtc6wf?=
 =?us-ascii?Q?/oaG8CtRE4jyKOvpYzalQbXtnYPztitUW+XCeSU0ZG7N1phKNM5B/Q+RChg6?=
 =?us-ascii?Q?bIypxxouojsYA7VoA8oyQnyAt5fPpZDSOcyutKp0T8ZWI3Z2t03R6mylbi+5?=
 =?us-ascii?Q?aSYkjBfr3XJvAmPc9IAgo0E2UAC1wHOHJuzRiJne0Pl1sFJZxaAMgLSbE/G8?=
 =?us-ascii?Q?hCn7ieoUwG+VMH/TXS65PKPL7VNhExfhEAace3SpGBvZnWQGiQlTpHMeObU2?=
 =?us-ascii?Q?1FwxLWv6vtqO23R66VRfSASl/4JmLRmL66Z4dY7FHni/ZpnRY8Um0s9Ql3Qu?=
 =?us-ascii?Q?MkJtxgIjO8UMOZdCIpu/Mu6ppljCw6dBvIrQlm4sMFyW+Y44eUGSIsoJ17Lw?=
 =?us-ascii?Q?iIql4/K3KA9jSwsCJrTnMypHVOWY1mwXrYz9Ruc8ac++5LLXFCUYI2wG1s8+?=
 =?us-ascii?Q?4fJ1AUFHqfEoutSwBuaAiFt2VqMxZS01SRVWNuVjDUzm2cuDgo4Ke68PRRBd?=
 =?us-ascii?Q?MbcuYa0+9gwZcZCmV61MzFG9CVvUY9h2GyOonw3OWDqBDSRxYV3oXv/CmIbM?=
 =?us-ascii?Q?7f5FLsUVkwd8Dfa8tnYtyHtPIgeYZj8OkZ5aJnn8qf8FmOe5wIS6utx/2V9j?=
 =?us-ascii?Q?6AaApPnmqb8d6XICFzTpiIHTRwIEehEGZjDztRA08jH3X9Huf9SSpE6w6HQv?=
 =?us-ascii?Q?xYj1yVrKqnTH9a5Jr6iv6oBb3PeubUIEGlOkdLwC0CIiUQCjb3ZxEWXMoOHu?=
 =?us-ascii?Q?gFsrIbwavfWPOU6BNYrj9ZdGD16o7q6mqelb5DX+fQ3yUJ6yEbv8WjkPRn6n?=
 =?us-ascii?Q?KVQswH5Y3YnqWaQpEwaV2aRNuJevfn5tMEqIMJiydherUBYsTVrBu7XZKRHG?=
 =?us-ascii?Q?2+YiOoTCDuQ3xFhN0JsA6LkMIG9scvZZF8Ig3WA/SS78iOEeFcVxudz42xuG?=
 =?us-ascii?Q?PehRMF4DBzwRMK0Exs2nvx6NMhcrigiR/litLdwT1+O1nbOoaSEk0DuQRTN4?=
 =?us-ascii?Q?JJfZJu9UomnjcTlyfdCXZaNl0AXrhKIwYrHgegtKojIYHBoddTVoQiZHdhE3?=
 =?us-ascii?Q?m0D1isNoZpKZv5/M0qMGjZq3qYB/1mcFMpuXUTpAfpnc15bC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed73eb7d-b6a4-4583-6159-08df4c9b1832
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:28:32.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th3Pf1IetbRPAo+/saY8GzYDIvuZa8QL3NMYreO98f6sfHPRPL7pjauUoE0400sN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB504406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251401

Ya, I had no idea about strtol.  I've updated master-next with this version=
, but I don't have a way to run it across the build system.

@Mathieu Dubois-Briand is this something you can run as a test?

The branch is 'master-next', commit is '3a6fc1521198fd2cbbb63e607e379a65387=
2ca6b'

Changes from the v3 version:

commit 3a6fc1521198fd2cbbb63e607e379a653872ca6b
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Fri Nov 27 09:05:06 2026 -0600

     ports/linux: pseudo_io_uring_seccomp: Fix strtol usage
    =20
     Suggested by David Nystr=C3=B6m on the openembedded-core mailing list.
    =20
     Thread:
     https://lists.openembedded.org/g/openembedded-core/topic/122456464
    =20
     Signed-off-by: Mark Hatle <mark.hatle@amd.com>

commit f260db8ad5f5ad1b25f2d9fde7e6fe907f42a345
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Fri Nov 27 09:02:02 2026 -0600

     AGENTS.md: Add rules around __isoc23_* funcs
    =20
     Make sure that an LLM does not directly generate any functions that ma=
y
     be switched to the __isoc23_* versions when _GNU_SOURCE is enabled.
     This will cause problem with glibc 2.38 and later, especially if we're
     re-using a pseudo binary on newer and older systems.
    =20
     AI-Generated: Use GitHub Copilot
     Signed-off-by: Mark Hatle <mark.hatle@amd.com>


On 11/27/26 8:49 AM, David Nystr=C3=B6m wrote:
>=20
>=20
> On Fri, 27 Nov 2026, Mathieu Dubois-Briand via openembedded-core wrote:
>=20
>> On Thu Nov 26, 2026 at 3:15 AM CET, Mark Hatle via openembedded-core wro=
te:
>>> Changelog from last version:
>>
>> ...
>>
>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>>> ---
>>> V3:
>>> Remove obsolete 0001-makewrappers-Allow-the-wrapper-architecture-to-be-=
se.patch
>>> missed in the V2 patch and detected by patchtest.
>>>
>>> V2:
>>> Corrects the V1 by removing the makewrappers patch
>>>
>>
>> Hi Mark,
>>
>> Thanks for the new version. Now I can see build errors with other
>> components. I can't remember if we need to do anything specific on
>> pseudo upgrade, do you have any clue about this one?
>>
>> ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-worke=
r/qemuarm64-alt/build/layers/openembedded-core/meta/recipes-kernel/linux-li=
bc-headers/linux-libc-headers_7.2.bb:do_install: [Errno 32] Broken pipe
>>
>> I can see that one in most builds, with a few variations.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/5039
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/5059
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/5033
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/5085
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/5071
>> ...
>=20
> Hi,
>=20
> I wonder if this is a cross machine sstate pseudo-native reuse issue.
> Tried to reprod locally, without success.
> But I did find an inconsistency in glibc version dependencies.
> the io_uring commit is using an unwrapped strtol, which is frowned upon.
>=20
> pseudo_io_uring_wanted_mode()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D strtol(env, &end, 10);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* _GNU_SOURCE turns this into __is=
oc23_strtol() on
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * glibc 2.38 and later
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D pseudo_strtol_wrapper(env=
, &end, 10);
>=20
>=20
>> Thanks,
>> Mathieu
>>
>> --=20
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>

