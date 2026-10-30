Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1793357086430159205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TXEoubUB;
 spf=pass (domain: est.tech, ip: 40.107.159.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6dk6jh1o8dpy1/nNNsJ739hObbiuqmGw9WyhxDFzxTOiAhwWR9OWNep4IRckzicthOpW4jiVR3yLfkjL9WQtiKgSgE/G3wHPT5Abi0qM82di57nNZpJF9UIaQqGC6PCID3QSdnDedhEGWdKHwXOJyeBXBoZXra+slxIh71gfXQ9x/6a+4macqt4DmNWqImjjDnTXmB9NpEcBqj3Lpb0LePm/Ug7C9W+Nmmmsu+gtyHOkb5fEUX9SW5+RsVQEI1uXJJzLKo7he7JhsBgoQLVvBRoY3fGa0Ik8eFpaWarRTAwv44HuN//DsOCAbrDux+xH+HtnMBlZef4pJazGMWCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwiMxdN59t9ZWcOH7lBm4bN5e293D4PGU+LLkmjK/2I=;
 b=YgrogE44wiZFy2wEvmUsn5ap09U5VP9WCeAhG0RJtPUC55TzTMamMkUk1WJrWEywfRrBsXKOuVB0sVQ4TaZJ7ya99xH0SGrL9vQKN2fSl4lYVsoZQebogUW4iHBBQNqbtZU4NTfIZgiYXaqqlZh+ARTmCM2SZuJRRBsWfkBejLN2MDHWPeFM0AV+ommFvDvbeLnrCJBPDg6z5of8JIoztlGfoRCbdV8zbCAAua3kMC46ki/kDXvmEF3KkATclNvaVjJsiD05WKCoothzwemPijtLJ//7yQA4HAa6EQG9j4ioV+bhLnrCaQ6D3avRyZMxAE5+26rILmgdW56CP6D8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwiMxdN59t9ZWcOH7lBm4bN5e293D4PGU+LLkmjK/2I=;
 b=TXEoubUBd1x4A5sGWMeGa4ALHdEdUn+M4D9FnT03BD76CdbcKmCO5rsEg48F1NwlgsuAtiaAkIkWuZPiG5hjt5gqp37NwVeFLStsYWkHgLKdVqA7PzsjOeHU2fDSP7XwtVstzWSVS+Szo+mu/N3NhQsW15QcLb/ZvnAbSR3HGL2KppNVCR9mOK3W1UfZMKbCqoQkEmwV57P6jsAy+LBwucgQDnLdaVffcMGdp10Tti9PpMyFnKB0gzXsEryA1FsXZb2gLePqM/NPHDd1HNZmfj8Px5+RyEDhvCMcm1GMn+TccOb5d71ZBKxqL/xRNOAJ3deNKAuJt17zI5F3ccbD6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] libslirp: upgrade 4.9.6 -> 4.9.7
Date: Fri, 30 Oct 2026 11:44:32 +0100
Message-ID: <20261030104439.18901-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9692e4d8-0c56-4742-e7d9-08df3672cfa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: g5TieutXDI6Qgm1fCCMkOUaXuSt3L5WinZMwRgJ47AmbZBzxlKtUI/C2xRgzNrEdKQHtrEzZ+c5QiHC68AlFvyl3kZPXGvC9uDeMlb2nkcRPZ7U/e3E5owH7ii5iGDbQn0gqcaROySDTmcG1rtRkB8+jaKvKHSe4jpvSy01oBwBQ+b/VzbfgFU1CaTsO5AdH+xvkVcWEL1gOZ0hTQx3fxyV1t9JKdKUIEPGku2FPluKv80WtvDy6gwMql4k3/Ia6Rr68kqcr27KeCNb0Lwje0UcnsRPlEYIdOZxQ2H2/V0HO8wVBaUyTcMAmb3HVyyi2lxz9QnLE0iQs7uhjhdssZYj0D3TMDFGOqENGHELaFdTi+kE0aA1p+SJHxJBuWaJ5NujUi8MMVyNRXO5H/2xKMErzUlXR9hmUwrA7QZVAZas1/wbByhdZTYRQU02E6HNPPycPH91RZ/SEpSNZKT9uaiapAOt51cvDZ7tspo8XB3JEk1zPhFjyfUDMeHINuSAwCeb1Nh7U/cgtEZ+HASksqTWlCGsBd0zmg9F3UymRsLLMeBCnS4GS1v880J34nnIynPJX+5a74gR2WGEyKfVRkT/GVsyaGtGZylx/61mOGN0KmQ1PV9VhTTI4yT4pZwn5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p398at8tnEl7UBEwi3Vn5NtINzMshGz6Y4PNvlIObC/Rdv3xZB6l55+mMBGb?=
 =?us-ascii?Q?09J+YDS0xoMSpH2etlnCa0alhuxbOlWkEkicvtbm90+Zh0t+j/prMZNrL7UM?=
 =?us-ascii?Q?mOQDOiQGC8ts6Yzqmz3QjnnymnCrSLdIadZsspVDKLFCrxaFycvY8fTq17vP?=
 =?us-ascii?Q?61d2aHn3ax9/HEFe0hHYQBLF19M8tHZKY6K2yKytVUVR4OmGlBzKWIR5DEqR?=
 =?us-ascii?Q?U/6jb324gTuYYprAT12tskK1HE5vMdBHg3mb+F29Gl4VhTRIbdkV4SKMLehy?=
 =?us-ascii?Q?OPQ8HNQUswiVGBKo1dchTllFTbd3ZCbDHURBnSwI3Kvi1vPBroFxb0jdYiXj?=
 =?us-ascii?Q?baZ1sgtdYUjSS47Je1FYzXLCvbAvAsNcStKYP9cJJJMyvRasocZCSunGEWOM?=
 =?us-ascii?Q?wQBJEr3TR7vrbpAQOgBcyKp0FXnbFgs93s5vsgjnbQt8WmKtptECGfSikE7F?=
 =?us-ascii?Q?kQAFMY57lNsvJogPgv+uIH6ldQSW0nR/DFvl8Z2Fc7jL/l2iA6lrfIMRU0f0?=
 =?us-ascii?Q?zapUDuDYSej1eoPAcr9GkvfRf0I5BcQ1vph7TH0ZjT3DRZUXUABy98D5MwN7?=
 =?us-ascii?Q?0oBQClBxwFH8KjVEX9SqaoThUJ60Hp32gwAMTTYTtK7KYRNBX2Acg3HGNoB3?=
 =?us-ascii?Q?0hlPZwVen51jxmd9G6atZ3o6KqDrrxNW20XnfHeQ0ZJUSTi4tglZasEx3s3s?=
 =?us-ascii?Q?ntOz3/QiYgbj3eIhOi5XfcVjexl5OhCN+Lc/Adbcyz22ZzpZfImWpLzCZlBG?=
 =?us-ascii?Q?awoknXUnbDUPD4IUHub4BDzGtK3uJp+UWQ0DOFZ68UIVsiIuFsOjKKtRcbnR?=
 =?us-ascii?Q?4Ob+/obABFE/iLMNItrIhp8gB7Z8Ial7dctjoM2WT4r0mx2XwCarrLpIvho7?=
 =?us-ascii?Q?7+NdUlf7JIuxJmWIW7H4N6ZXz2nT0hYwZZfnd7gu9OF+jcAqaaATdqgexqqY?=
 =?us-ascii?Q?eEBtsgbWU3y2JWSC9pyCgY+QbUgo/4wdud1In+i4Dh6kmiagwQeKIWxikCFs?=
 =?us-ascii?Q?n6W07C4ZmphsK+HnQwH4e3KsZ4SgjvAMTX4yQ216hYYIfIkd8Djmss8xMH6Q?=
 =?us-ascii?Q?j6OPyUOSywUsu0QHj0fspMopuGlEwIYRrE7W1KbJy3opGdHT2UnP2ZVhwYhK?=
 =?us-ascii?Q?kktzITkLP407E2Ia57TDDKbsiykaAGzwqMF2DI4F+iOYNQ69rpZWKw5DpCjx?=
 =?us-ascii?Q?zSfPHPp5FqlaIV3g4Fszw7957vJKXr8KyiLCimftQt0WYPQj21u6Heq2qmMR?=
 =?us-ascii?Q?06L/eGSpE7/KEvCAQC/5PnOa9Crl+o5A1Oub3dkJRZD8V7+pKZX/imRb0YiB?=
 =?us-ascii?Q?Vlwyn6sZGGer4DKw25yr0JfxHQ92GYKoA5HTogZeEXRNVWwEOjwxHWKUo3Kb?=
 =?us-ascii?Q?gqNSpIzjp3vo6LY5J/4isPxlQFlpTISG0mEtU7Ql8Hu10BfOyDfyfsWIwtyZ?=
 =?us-ascii?Q?OsOV8L0/ckeUaE60crHlVcpSrB9DqQYS4UsPSiFeuWkUOQlVUKkSrS1lwF4J?=
 =?us-ascii?Q?PDu9JT3ZMIS4TLRs/T6I8/oGhV3adSKB9uV4DKBDgGoc+LkfYBmBAuVIRyzE?=
 =?us-ascii?Q?Qd8DtC3QKdQkKghviLNxYp55AiUG3EGc81cE7C6GKZJGsnjahq9p9PfM5ulV?=
 =?us-ascii?Q?90/sivk/8w5mqDttK1pRb0m6KlxwrCCVGRmAIf7mgG61e92R7LcM7tqu2QJ/?=
 =?us-ascii?Q?Pp91K3H6o35AhugnXhIRIVHhnXZ/VyDElsxlITj1mAvWwsQWonwiD4vyNrMF?=
 =?us-ascii?Q?RTSN6Ido8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9692e4d8-0c56-4742-e7d9-08df3672cfa7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:44.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pygb4fdK+eEf6x7agkecKo8cVXr1mC3RXahQmJa/xWFdcpaJ671ex5KICaJ5YiO64hnqTNYu8yj5Z0swvcB99IM2G2zDLafl5heT7tpBznQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249019
Content-Type: text/plain; charset="utf-8"

  - ip6_icmp: Fix memory leak on ipv6 ping
  - icmp_forward_error: Fix Out-of-Bounds Heap Read & Information Disclosur=
e
  - if_output: Fix Queue Pointer Corruption and Crash
  - ARP/NDP: avoid adding records for multicast addresses and our addresses

  - Fix build with llvm
  - bootp: Fix endianness of addition

[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.7...master
[4.9.7]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...v4.=
9.7
[4.9.6]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.=
9.6

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../slirp/{libslirp_4.9.6.bb =3D> libslirp_4.9.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.6.bb =3D> libslirp_4.=
9.7.bb} (86%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb b/meta/recip=
es-connectivity/slirp/libslirp_4.9.7.bb
similarity index 86%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.7.bb
index 9d231f111d4..11e6679dea8 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.7.bb
@@ -5,8 +5,8 @@ LICENSE =3D "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df95a9bf4a7e411164fe843697ccda=
59e \
                     file://LICENSE;md5=3Dcfea6044642fd63b90ce9d79f5db64d9"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv${PV}"
-SRCREV =3D "392af90207fc51dd9f9044ee9b1f963f3c851c2c"
+SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dht=
tps;branch=3Dstable-4.9;tag=3Dv${PV}"
+SRCREV =3D "ce12dcddf710a71dc0de6450ec95edbadf8e9f66"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 DEPENDS =3D "glib-2.0"
