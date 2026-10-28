Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37396.1793171037963472767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fhxkjkgq;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJkSY+1DCQOdspzUAwPXblJaaxKrytbZ1Ct52Be09+/ZE4AUc708Y/9cr6Y4nODXv98Yu6E2OqlvM2hgg4Um5mAopgazx5EfrhRZliP5KrhvGa51oW13SbFxt7oXo710aqd55ssxQCqIwLHZA+84mCo633G3ou/eMdbp1Jny+rxpty2j7il4Er+eTyJm/nU6S737VeDKksxpJUVNxNxsIgcorvPnU5o0NZoJVqU2ArgeHhZ0BFuP+qmTw6EsiCU9XUCoIfyxp2gEoISBBV2mvS0bOL9jlXN5coPa7Wpp4txHeQWwU42E8usCDQ8PHToAKH+hatpDmnSA8ZX3ztMevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPpFFZ9/8lNMgV0xPPf8bVyvwUDqz9SIOTtLKDdZ3Rs=;
 b=Q1adrLrxe48vET7NSdmKiEsmFx4GGt2XZEo/BTyVAZgFaaUdhzq3MUiAm6cm/Mic4NVVIT2BRp2zPb+NK3qMjIeGGfiynrM+ipv1auacMXyJsBzSCV17KvmTvjngnr6Y7JiLh9qgwKpc1t+4BhE31UXAMmeoBCji1I0mSdr+W1ittHYWyLdCy4xQKyyYN0dmVOyLj0Jmie4VHFpHQxNIPjjuwPRHt8fUfYUYkoNbI9y98mePLU+ihzj9vmofwOXVAor95+lGQDcyXWf3N1SkJ29DEvoFxHrg5pEq9tZpaPxJjzKq9FBZewwX/yaAby516iaNYvLCyhudMXIWsXfm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPpFFZ9/8lNMgV0xPPf8bVyvwUDqz9SIOTtLKDdZ3Rs=;
 b=fhxkjkgqdBNfhvAQu1ss8H2JQ2f0Pxw7ev/dv62OmV1oL13auAGDcsE+D3YDzmik/d0GRZsz+3VbuSLBnyCFJQyfgeophfpS4JHimEddAiI1Riu0GzkhoEgP0j52y1DktjBA8RZWCtNMPOaGfJuGg3M7fNfOupTco38vwpNxNzOM3UpqfNYbrnMkledkb7WmTNvT4qGmnCnoAvwEA4jm0HOXk04KUW1WnX5j6e7BjX21drgA8OqBlSn3cSagRGer/O9yVC5tV5GRiWnGztnNIxtB1pM+Jr5wsy/IXr6dvrBXPnh1+aSj8DeaVxtV16M4rKeDoYZzwolVOsUb4YJwnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:03:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:03:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] Upgrades on 28th October
Date: Wed, 28 Oct 2026 08:03:42 +0100
Message-ID: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: c100c134-b7a0-4f44-0ef3-08df34c19fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|261026140227099003|6133799003|18002099003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info: hnhHIHYxhFgXrVJiAC65fcWFFxBpUBnubyIGQWY7St1IGioIO/ysMDxD4+oM/L8/8gKq+QoBFTqf8nIUuCpRD2JlQndTHyBKYhvl5wkSvYf/YhMC3A+OboxQyEG5eRu/ubULvgigrytzMzj4iIt2jEp8YdVFFJXzNZ3FT3lA1QMp0Jy8Kf/Yqbe4wgwg4l41Lut78K2L16v9jGPVIJ77id6Otc1IIGOrb3PP0tNbYHxM+620GMJHvZQhpK/Cfq/VluHSeLJ6UFxw8g65daiVuvf6qXeFY9AtUjTYX+lZ2qWXgZUutLvcdW4+3vsuMhV+ALdLwKuxZRyZgfGRfo8A+1yJX2+mA1JeLRSvLh3e4ddmoYtEaPouPYHGVV+WxWMfVo5zDbZM5DN089SwmBvk3wSDvE21RVW//gK6lQNIyu9sujniERczci3TkkrQtuFVzaC0l4GxmUJCarC/YqjflU/yLTjavG8V1MJgTO6PA4S/hdsqfpds+ucEQvuiMCtSWfmBG8UbogQOrwe0TQiQ5l4AKTlUSWQ7Jx06HijsmUV+Hh67IZFVezN78ll4wZoqCJY/2T31urodAPuk34bnVDE3QgBm0KNPrqzJ5Mt9Tttwgj/Ix1ayOr8jCP/Tv30acgLRa71nAESI2OTyDdwtxR9dPkkYdaJJZt9zZ7qBYjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(18002099003)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0smBT6jsbq41Wbdu1XW6Zz/JELhCXIVyEjvERyKqTbzR9zPd7LNwaiBA4vK?=
 =?us-ascii?Q?orEpFpkhYzZnAykb2noi/ey4M/ocWCqEMCjw6F7Rkb2ASNVH0mwZkIDdvSDh?=
 =?us-ascii?Q?ciiAhhJe1pPl9FaasSaWS9g6SYuVEtHZqZ2GcZ7MUPCYqDdkGdkyF3DzUb/H?=
 =?us-ascii?Q?zH78A52bOWNTVaZhzRsQGyCqSZfDqEnRuZK96F79whFuIn/cRwh1e12ZH4PN?=
 =?us-ascii?Q?R91mMRPB22JXqNx8zIfqm1wu2QM60bvttz2YX1V7BXE4mzWmE6KzDz+QiFbX?=
 =?us-ascii?Q?tnVSY+/TKpZYDVRdxy8UNFeEP/A49uZF9pVgZJTal3ZJZzUuYiWKXgX+pmfx?=
 =?us-ascii?Q?fFbu2jJtVNgbQxx4X/CyjM3bWV3r1YseFGliTTTiyEpWZ4cT0qHS3LdFdi4D?=
 =?us-ascii?Q?Wzx2HqB8g2eofJSus9+6kWeDTfSp2adl/L6fdJM59z3lteDiGLfyc55K/ryG?=
 =?us-ascii?Q?SLqvXGLaND/yu9QK1h3yO6tLjgmK4QXBcPfKI2ma7mB7WyMfQ7WALD3+dg0t?=
 =?us-ascii?Q?vf4n9DIpRxCZmForLDNCYm6tyLsAwgx597euyDqniXSODsDBJyKghUk+DRMn?=
 =?us-ascii?Q?CE0lq02BM+AHc1jS0kQvWHQ20EcAQPmZApJW9j8+443sLvSE7P4O4QjjhEGZ?=
 =?us-ascii?Q?cmDDOjXQPptFBbl3sjkviGTTFQl2kJ38bx2ZXwqSuhe1fbF+VHJFGT/Mno3N?=
 =?us-ascii?Q?H7s38cLlrrD9KUE1upwnfXk9OqUUA/R5qHAXE674B/2YpXcNUbWvy02fngD2?=
 =?us-ascii?Q?gM+SbaPVjG2Ae5QM9pw4E/avBB78LxlgeIqzrq1/jF5m6ONifdOx5auMArZZ?=
 =?us-ascii?Q?fTH2BqlHnWeLYZ68oinYhfkkGOwKWxnz5L6PXPOJuIF+6bDc8QymFE6zJ/4h?=
 =?us-ascii?Q?Tgv6V6CZQ8wUl/sF7bUVKy/q30aj64FE3PZ3VoTc+KrkuBKyAN0cC2Ppbw1X?=
 =?us-ascii?Q?2SXfZKMwsmVhwzXNUgEBPo5i0eV2pzyigqI+MoqySxFt1qHdnYtxMkLI3Cg5?=
 =?us-ascii?Q?UqXz5SU2kSo0Xi2pbK+SbSXmby/hsNiGsFyGf5gmRKvDBmaV+8B+gYUc+JEl?=
 =?us-ascii?Q?6fxlvUNPosXj+nLkfzJoFVOuXpQ7ZcJ3w5PmXKwEq9vDPmN3zK7K+AM2XiOB?=
 =?us-ascii?Q?zGIJWEduCF61Pl5LbS+W4xlwQ4+mwUxDWEwRUOY104ioRK6F6Kc2LQSILcSV?=
 =?us-ascii?Q?Sp1PcJ4VF89F9NqxYHSL5t3zlMDICMT/EQy8MpupNGphXJy/pS+Zs2r6FQYB?=
 =?us-ascii?Q?4aS2ZNnqn7Mq6ubbbDbGKokOl5r4euoQNrOOgsvGeDLY/RE2uY/NIZLEqpS/?=
 =?us-ascii?Q?Fz2ff31O8WruxSFjVpluSc6Kzvqcnuqf1OOoA31HbDDJWLYaHrr4bi+ws7DZ?=
 =?us-ascii?Q?7BATgOtPFf0vwMVSULXZ8rVkpxhssXqWtpgQz3QU3PCfImIdpz03w7I7/RC+?=
 =?us-ascii?Q?Zwm5FdiHOaNr4+8YzJQNlwwe9hUMt1DB7BMjmuq96B5mVuSVC02Gu8cvgzzG?=
 =?us-ascii?Q?rkNV4MnFe6iTDsWWQEo3R3BGbfAyLaKS1x0CZpXK2GAClyr8w7jAxCrYb0do?=
 =?us-ascii?Q?pGpaqAemsZDe87Jh9AEyMyOwUmgn8bRDf4/BCmn1kzgm98jOGmZIo4M5nIRm?=
 =?us-ascii?Q?vgnkJ8/kFD0L3znS2Eui4eHJEr4oL6UetWEZTumRpUj5/ypYTcmG3DYvRWbV?=
 =?us-ascii?Q?DchbqQoVYGB9fGY2dhvHu6mgXBwxyH9om2xrhkgJC24shBBEDffi+JeC3czn?=
 =?us-ascii?Q?8NcPBgGaxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c100c134-b7a0-4f44-0ef3-08df34c19fb3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:03:52.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nYozJRT3ATfbwwbFfH1/O/qfry1wB70yAtaKmcwCpDblGLKArl5Ph0ARPkg3gPBgllkS1uBMIugDjO0PJrvz3aHi+AA+GnAbhnb5wxTDtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248784
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (8):
  cmake,cmake-native: upgrade 4.4.4 -> 4.4.5
  createrepo-c: upgrade 1.2.5 -> 1.2.6
  python3-pyasn1: upgrade 0.6.4 -> 0.6.5
  python3-pytest: upgrade 9.1.1 -> 9.2.0
  python3-flit-core: upgrade 3.12.0 -> 4.2.0
  repo: upgrade 2.69 -> 2.71
  python3-hypothesis: upgrade 6.170.8 -> 6.170.12
  python3-pdm: upgrade 2.29.2 -> 2.29.4

 .../cmake/{cmake-native_4.4.4.bb =3D> cmake-native_4.4.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 .../recipes-devtools/cmake/{cmake_4.4.4.bb =3D> cmake_4.4.5.bb} | 0
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../{createrepo-c_1.2.5.bb =3D> createrepo-c_1.2.6.bb}          | 2 +-
 ...python3-flit-core_3.12.0.bb =3D> python3-flit-core_4.2.0.bb} | 2 +-
 ...3-hypothesis_6.170.8.bb =3D> python3-hypothesis_6.170.12.bb} | 2 +-
 .../python/{python3-pdm_2.29.2.bb =3D> python3-pdm_2.29.4.bb}   | 2 +-
 .../{python3-pyasn1_0.6.4.bb =3D> python3-pyasn1_0.6.5.bb}      | 2 +-
 .../{python3-pytest_9.1.1.bb =3D> python3-pytest_9.2.0.bb}      | 2 +-
 meta/recipes-devtools/repo/{repo_2.69.bb =3D> repo_2.71.bb}     | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.4.bb =3D> cmake-nativ=
e_4.4.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.4.bb =3D> cmake_4.4.5.bb} (1=
00%)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.5.bb =3D> crea=
terepo-c_1.2.6.bb} (96%)
 rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb =3D> pyth=
on3-flit-core_4.2.0.bb} (90%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.170.8.bb =3D> py=
thon3-hypothesis_6.170.12.bb} (91%)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.2.bb =3D> python3-pd=
m_2.29.4.bb} (80%)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.4.bb =3D> python3-=
pyasn1_0.6.5.bb} (83%)
 rename meta/recipes-devtools/python/{python3-pytest_9.1.1.bb =3D> python3-=
pytest_9.2.0.bb} (91%)
 rename meta/recipes-devtools/repo/{repo_2.69.bb =3D> repo_2.71.bb} (94%)

