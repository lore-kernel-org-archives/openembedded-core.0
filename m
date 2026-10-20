Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1792488579382617804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gVCi7AO3;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdVrreYEapCyET75QHXMMkpwvHbtHChU78nYAGY49VD+T1YUNjD9kFtInSWpS12Ysl/0C2LchADX423vy2p+7xtcw+HV0LPLodXeDCq8XH9uY+o2FYRfnz9f2d5F8OeiKnePdMTfE402vOG8p6724w5OteVrOoVriJX5bMh06LDOwIZXk66MPXhraI4oTJD0h2awv9nuIeWbn3iautpIMSAL/1h8qWLn+heVMB7Q/3ssvs3e/xrvyAhhzZDaLtt6vGaEVa3F/EMUIoDL1wUQ1ocEVDxtd/iFD1g2zsv7Ck1w1UaE0b79hZ35i2XSOTz7xo17rat+trpEyPIt8lFCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUBP9wq9ZGtZKj82DZJ7J5bTRc64OvtcYBTYe6fKaAk=;
 b=OabGTlGOig8DKTvWIqCAoelI4Kx8rqwE8gszUOlgH2lOD73+t6QJ+7xwDAEHmytQ4IChpyTtxBIiyvB6BcZOzszXZtwzw9dgoI8vrPj72YR2BMT2O6WYw7RmVnBEMMp+IsQ97xj0Fv8JTITyAU6cJh1Zc/MQXHjkF2D8/q8Jqvst5hVJ8B176EjN9BVHpPfkOoPOYY0fcPnhZdID6CEkNSnwDh75SrJUZ6MT7iKBVQZnr2dRBy9hVjYLYgo5/aved6DMtuFwDNTo/sboqFPFOjkRXiEnFxaQC9Di5PrDvB+pyaugX3XznvTmn9heb1AQbg1CbK4CyvDRE67dENtJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUBP9wq9ZGtZKj82DZJ7J5bTRc64OvtcYBTYe6fKaAk=;
 b=gVCi7AO3r93OH5JPPgUU6CaB+Z7nTKEvUdVtpi4LLNCK7h1xclYrjMnaUAKUSpcNSSWobj87y/GOK6hjKHYICLsJi9yljg8+bnLg20y1iDa6X3tUKCbfwLc2txUxEAzXhJatz9qGzjqfG3pDbjU8rdZJ/j2CtbfN1jZeJdt5RddELSf6a8icuKTJ3q0bD0SWNWESDd2XJQXcyoSNqgeWbFuX/I9niMwATcO5mqP+aFv8QM8LQpNF8q4k09qKsDdZ/+0CtxubL2t/S/fxL1JwiBP8Chkve++Iq8W+kjcs65mVw2WbdSMQ86d4Iud84jA58OOr2c5scG5401l+ODbfPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] repo: upgrade 2.68.1 -> 2.69
Date: Tue, 20 Oct 2026 11:29:27 +0200
Message-ID: <20261020092931.4330-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR2P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7933b29e-4401-4a4f-eddb-08df2e8ca9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: F/hytxv6yu7JJkYOknPIqOhbVVSEiwnVOUl9uHv7KuyIvRL4jpG6MDQcYmHvXBCpIaG6y6PixGR9ahJyvG3otU+yW8IgRCZAAStEVptrMVsbTMckq73fhSOplIuG7WQJvSx9r1Yly93vewHX5eKDP8UFD+IbmFVogAJfNiKYdKkKhNNAXMXj6uP/a1rMHksCQ+oahOFzXGO8IC1iHKW2ELHGwHCBt1iaVVf4YsDB9of9T6CbFJb5RlaZmQFO1EVhYQxu09/IOM8755QSTOpS/pvrCQlNYts3jzgYY9GdrMLjyTQeM/GWboji2HFTGZD2b3HQm8TCjdxqrmNBX/Z5si8RLHMRjDPCaxAQp+1M1V3xwYHLWV152AE7xN2Ee2WDT7JURAQDDkoV532b8/EyDtrU/fZWR2yuqAhNURPkR3qltXB/ZCnESzniyb192OkVsgEjGoRtIpVGCaEIGNP+amzfYb3gGYWdYwwMoKViJ3R3Px8D1R27/PCwOSHo2bdYOLqJuj0B2gzl3thhNpS1O/tokLVYAcK1zz9gVP+zibvDESrgmPAnZQSsZzIGlb1tFY1sEVabewgVVeTkTtu6oUbBKiVhXsUYycpHJ1UAnVY3J1NgYlqCKv6BYXnnVGbCJSIU7LdWNS6HutvtZWTm5XHIMOx18XfsjnMj8ew3A2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dFaD8IDK5MGzZ/wHbKjA7TMcLEsd0pOfXEox093KZ3VzAU1RO/Z8kym+61w?=
 =?us-ascii?Q?U8W25AnmBmR8IxxWhIt2+Z0BHg0+s0xhWVgpSiqgrZIEWiMTKi0+o5gQ4RTS?=
 =?us-ascii?Q?6B0Kk4hxBR5kp/ogRd7RpcXS4Y4S9V/tpXwof/3wPk1xpLiWEnG+SgCoEP4p?=
 =?us-ascii?Q?1ddXz3T8v7jfjqlEzL891r9aCmPBTL1uKRsSsMyotUmoOp6u7E3ypu1I2peD?=
 =?us-ascii?Q?Y4Btc/ZdLF0zXtMQkv3+Ds1FtqRsskK6bB6CSCpYYhmvwr4of4fSsnt/ffrU?=
 =?us-ascii?Q?a4RsvR4JvNJuEaBt0Xr3wPvC0zboZ6211z9GsB+h4p3kJww7Zh9k0EFX0BlR?=
 =?us-ascii?Q?0T6VXq04OmdYMmelT1ALiw4nX0f0PFjzNUl2O2VfAlXOiT/ngqaGyuSc3NUD?=
 =?us-ascii?Q?/HcWPkLkpPgIRUVGU/hnp/Oa4BzOUQd3b10iszyMeqqlYvwrKjNQ0XPFWjLs?=
 =?us-ascii?Q?FPdqKCugFG6pLvIJuAkVwbRtKHURbp0hAC1XmwD21h1dTZxngvlfgnKY2vAS?=
 =?us-ascii?Q?PaX1koekYMMnh3XVrTAv3nWa/YQQ36wXAUsI9EcX9H892INli4CZxEjGjb0k?=
 =?us-ascii?Q?iAz0RjUxDUod9kai6CVoDiuA5gG+KEqnR874mSR60PvK+FSKwSdWAsMpHPWL?=
 =?us-ascii?Q?NZN9HGzm6Qhc1KXCnDRLe6pP9rIg0SzsCMHDZbnRFuoxfKpD7ohGb2mZBZhf?=
 =?us-ascii?Q?IDzIKrSxuna+vRIQ4Jetzep+3eOk4MUiGUG1krjola1B0OGlNqMh9YgRHAMe?=
 =?us-ascii?Q?YS9yPMnVMN79RN94Rxchgkpf0CqKqVIGsUER9Rhkb70a5URo0ZQlXlX3eCAc?=
 =?us-ascii?Q?xtHfT7yze3qj1oIx6BabBsVgwaL7vbCWk/NlHBgvVoQu4e9kozH1xcsd6CMZ?=
 =?us-ascii?Q?aOkGT4GizWRLphk6NBtn7Z9L8lFutpQvTB3lX7Ux+MULfDYaS1it9H3ZtjZC?=
 =?us-ascii?Q?bkYoBy72qRbIrLi5b4UcxxZgTsTSSTGVlka6HrY2IUlsEtOi9iSI/mU7IRim?=
 =?us-ascii?Q?lc99hwsS+i9zkQz7WZEsQZgPW/+xVF6PgEtA3g/cWIisbzeAqSUSMYu7xmOe?=
 =?us-ascii?Q?Zj2eAhhM7M1Ys2UcYrXelf7Wsg1qvmS9uOYQaSoVu08JPKsWcgJMTDEK3zE+?=
 =?us-ascii?Q?gtztmJePiAWRJrPAlRYPksaFa+Uccq3/f5jKlrjFI4HbPp/egeWOWGY0BbPU?=
 =?us-ascii?Q?Ax2TuWBSbabY2hxehvwVYkZZrXCEjp+G7vHcxf8GDGEqO2GyTaAr232dCnit?=
 =?us-ascii?Q?+cwBeaWwrGB4YyZz3t1YoRuV/vDbvQnjSChWbh7Odu318OfoYj0HNp2CsyCn?=
 =?us-ascii?Q?G4LeiXbEDDeOb9ezbfRqYVhEsGdiaMjBxJ3a6nYZVJcx9kYBLiaLu7SJNUgt?=
 =?us-ascii?Q?QamkDAvE2ZjzMfKXcY4WUa07kgdh8Tu/rcd+UQEUjviNQmBbsSyiK3DG/kHV?=
 =?us-ascii?Q?T4bJl3nsTAstZJwilNmHIJ9vFTGxL7UtjQjIz61LcQDumumYMHE6d5Tg5HWf?=
 =?us-ascii?Q?LpB73KI0F82v+aDfIoiEUhR0e4Rd6Y56tl1dDcLmiTeA7ZNgUgBT/s+e75qV?=
 =?us-ascii?Q?puGyRCjGCFskpKPIc8rT2x6zInyTOiAc1JlPdngfhAtqCaUEmfRCHQLLoQEp?=
 =?us-ascii?Q?9TZURVojxhNk1yCIzYiHaMMgXkgWBhdONjpx54jL3ZneyAiVag40r4KqDJ/Y?=
 =?us-ascii?Q?g6MQr3zjovgD5UxbzsoXijMFEwJcqyoroxllOhALTr8UR6s2kTJi0qFAZTk1?=
 =?us-ascii?Q?G+wQgukm2w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7933b29e-4401-4a4f-eddb-08df2e8ca9a6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:38.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxrLWLFHASMWWT2tMBqXpzKF9+eUtMTbGiMAKqIDOIyl5fpSpAv/HbcG/lNV/6Is7gI5X1lAfQuI0E5o527uq7wTV0mrx20X+4mi9GqC3Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248260
Content-Type: text/plain; charset="utf-8"

git_config: Fix bugs in processing RepoConfig.
sync: Add GetApprovedManifestV2 with named request options
repo: tolerate a transiently missing stable branch
sync: keep smart sync override with -l
sync: skip clone.bundle when repo.fetchcmd is configured
project: peel annotated tags in GetRevisionId with cached refs
sync: don't run git ls-remote before fetchcmd on unpinned refs
agents: enable generic multi-perspective code review agent
sync: keep --superproject-revision across manifest reloads
sync: roll back repo when stable is rewound
sync: Support SYNC_BRANCH to override the smart sync branch
sync: don't let --nmu affect smart sync
vpython: update to uv spec format
sync: Support manifest-driven default smart sync
gc: add --keep-manifest-projects
sync: record superproject sync analysis state again
isort: print diff on failures
sync: keep local sync state paths relative to repo root
init: don't suggest --no-use-superproject on failure
Revert "sync: Recommend using --no-use-superproject if sync fails."

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.68.1.bb =3D> repo_2.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.68.1.bb =3D> repo_2.69.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.68.1.bb b/meta/recipes-devto=
ols/repo/repo_2.69.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.68.1.bb
rename to meta/recipes-devtools/repo/repo_2.69.bb
index 053f1cabcfa..c98534ca440 100644
--- a/meta/recipes-devtools/repo/repo_2.68.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.69.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "e1e215a14ea5373419acb8753b6865de19d1f122"
+SRCREV =3D "a0bc2b14a30bef631b91a2ca37c5254d9af44718"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20
