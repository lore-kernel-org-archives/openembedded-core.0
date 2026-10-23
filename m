Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11354.1792773798016109361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 09:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=S9KZ2Xw0;
 spf=pass (domain: est.tech, ip: 52.101.72.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkbf1aRIwkaC90vQwrDfNATCcIrr96LJJo6YqJnIpTMVtT+Ps2SUILiU+O1O4r5Xncr5E2w5QET7e75Fw1boUuLkIuBXfZCJQD4iOyOJ77QqfmZ9r6eOMHzAXc+w8UWdhL65WToC2AuaaaRYpl9M85SZMBkx8HESkI5W57r7M5vFcJpOEimo+JccnqHq4NbBzqVVdLqW35NQiK1pyvCu+MlHBBEX2IUUgq9C+jAC4ueFj3lelbBRPmQIJ6/1WSafOIZSyACrw2lZKJGIbHCTRGbxv9OZopACgvZau3ubJGUaBCpR11Ux4FU9lvr5Uqu9ywYi0co0xFJh6cc0o0feBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Est0DbLPGyap5YBIbuhOun0cCq+bOCSLIBqXalfP+yY=;
 b=E/8cKWEN75c039u0aohFNgSLcgq+R+2fLeS4sUawQWQB3OZ6F8x/esKB+RvY8wtjdNSWdHPSSqjpo0EKtWWCb5pZUnkqDR8Hb82/u5pS/++6Y+TF7Fr87wGsJHHovTFMkmtMStpReB6pA7BVdUk1VKDXkXRlirx/kxZI40D9R0RkLe59nZ4xqv5lGo0x5CPzy8Dkm+vcWTkBL34uO4yXrTz8bWh7UjwJPexwbdYvyAnRiaq2VZBp8K2Fmk4cK6Gl5wSzA1ZvXuwv5o62QVPJWh8X+ld5bFXGZYnV1wIuwkSdWV6XQMd8RuAmyoMDX2LEulAxLnC6bsufF+W08c50iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Est0DbLPGyap5YBIbuhOun0cCq+bOCSLIBqXalfP+yY=;
 b=S9KZ2Xw0hfBJgaAPSuZU3sZL0NZQrvKnmdv/30p+L++IwZEBwzg7DDqee6oG4LNr1y22JMR0kN/JWeo8Tknv81RTJvGc9NE3TwJm0yM6dMsG5KysC/MjwkpzSq3nOqpDOtlRp2S93ggVW3xgJqW2aTkqik9/vmgl67YQJcb7FLqVIpZZZuccDyydGSULvi+yQTzsLaOJW51jzkjhQhY3gM4Ir/2b+MAWGQruLc4pejHxVpCAFz4O0HpIOKeCtLe0CFCOITxE2UmzNtcIkdNjst84WUXnowEiPi0CvwoBXUgfJ/gQIY0qDpGaaLXHcIQV9yjW2S6gx/W1AZZaV77oFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB3053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 16:43:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 16:43:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] strace: upgrade 7.2 -> 7.3
Date: Fri, 23 Oct 2026 18:43:09 +0200
Message-ID: <20261023164309.13426-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-5-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-5-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0674.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB3053:EE_
X-MS-Office365-Filtering-Correlation-Id: 464f48f6-5711-4d86-7501-08df3124b978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261022105027099003|56012099006|261022075727099003|260925021311599003|260925022911599003|260925021911599003|11063799006|261021121427099003|261021123027099003|261009223027099003|261009221227099003|261009221727099003|261009220027099003|261009223327099003|10067099003|18002099003|22082099003|6133799003|3023799007|261022115727099003|13003099007;
X-Microsoft-Antispam-Message-Info: zLlE/q5wHoasa7ufwETJ/A/u+pg3pneukAsrM+RwoqS6IvyhPNIcoGBi67DWwqMJuexakJhvNzxfuAYBt95wMS9w6hExDagc10CuykjskE18z70uGBrRf7J19GOoQecqSDd4FaH2QnO+0S7JqeuYv1glWx0m7R0JSyQgnzmUcjXl3hB2nn4otW0j74KnbM3F7ZbktunYwgx5U5vk5eNryEjSENm+JYIkbt5icR4yLnS/IC9Ur2Uh3g67XwiiDw9YI/i/qEmPVJTMn4rofvq6m39TIvWOGldtMocNDjtERhqcONA4EjMk6bjfLO+vNbSJ9fKLmkQsHu4lcY7jFIfv5P2aeAxZXUMPnDq/GDBVzOB5ZO5fBtJxhGXr2t1YaQBSR+qwjstDeShTQsn/AGsxqGxIUfRyR8wiGrPdYM+uUiI7rTfw32cKCN+cIv3JfYpbbc8czkBeO8OKe9nNYQEvYEsR/AzOnD4R+nrOXVXhzDZSbfTGXmFHf4DuCf2oUk7ocRdEtLes+tau4dy5kOMD/KR8VKD43Shb80fSL4YzDcG7oXjcdXb3tGB6VETQVjq9ClT/X6NoZlaMo3MzIIU2re7uQBNV3uVzdi77qDhHh4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261022105027099003)(56012099006)(261022075727099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223327099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(261022115727099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K9CGspIt10iOZphhMjC7Xb1jP/aEnDf9Zgj42PLXiKSBwgeTLQp6y9wUZT2D?=
 =?us-ascii?Q?9MHpATy6L6SOwAPdBYz1sE1FG8kigHGV/bMt2NHRFWtxlQPIZiSl1+12Pn6N?=
 =?us-ascii?Q?tGPCTY87HaJehzmMcH3HWe2BRjngZ8M/sjthvchLj8Fgvkbm5NAczrFYy3zg?=
 =?us-ascii?Q?hVAafaJ/0n5RGxTaFB4R35CYgUnrrZ0Cuh/xXYPq5/AcilWSxFqXw86QCGqu?=
 =?us-ascii?Q?rl1ZI1mDENW7Ocy9e8TELTVUt3zKbW+vciB2DqMaUofRY91YHHwMIFk6ekIv?=
 =?us-ascii?Q?GbBjdpsTf46ght/tUP2kGqgWBK8rD81fxdUffl3XsQlPVPxzbBMYjKxaeNMC?=
 =?us-ascii?Q?IOPM9o5W1rl8e/YcLEaO+ZcZ0DRGN5PN6n5zmjN8uLAMBRqwLBlZEYzUi8Wn?=
 =?us-ascii?Q?TFWONn4NIC3r+rB9JCiSaqLT590ODe5V7aPR7YBtOEltD7T6N+U7f+vhM/KS?=
 =?us-ascii?Q?ugRaskBvwsotyfUqhGsQcssmjeBXOvQGRLr7wSSBUvzohLGNem1AB5W/sgkH?=
 =?us-ascii?Q?edbDlFkVHUmwqXvMcXLJ7Au5ocLWjU2XEuuvnD9rvqYrcVFQ2psNoCY7QUOO?=
 =?us-ascii?Q?Q0fFBbn837LtXMnDNVBdYy3HzOPjTXOM2jUwCkfT+yL+1PzaTxbCdJzPD45r?=
 =?us-ascii?Q?eFoX+T0XpQHP9tSeIGNKRvEFP6yDRxtVGWQRO93pZNEywrvTwh60jKT29JIc?=
 =?us-ascii?Q?v/STuKsNA7dG72xhHrE9h7jWO/tMuJtdTD8HEF5+rRRiRUgdl5U58JhWb6h8?=
 =?us-ascii?Q?M7/vAynoMENpYdFi7TNl4fNDiKLfRTO1p3FQjPAWTbAphTJm0DujrQDRHhLi?=
 =?us-ascii?Q?MmM3Gn5zCQCsvCsT8Fxowj9h6yfxRqULcxGpccV+amaUfs18uM9vzCC/Asrc?=
 =?us-ascii?Q?ULXrbqchSdcPJqIyI0Li051/oxQB0BtoDBwVQBbMr4TpqyiZKNn3JLvuCMIg?=
 =?us-ascii?Q?Tou9PGMNigRKZeDFqUx82ojH07dH/t6gX98xOK1vsESv/3zEnRIIs6PsOc0R?=
 =?us-ascii?Q?rP/CvKxeTgm2W+SUfob2fYOP7+oi8v/evxzPxfAxeG7BbuJo24nBm6Vo0kcK?=
 =?us-ascii?Q?p5l0H6ivZwJb0T93nYjbE9lyMwxUSlkVrm7xno78QjD5kJjyIExuRqiLvShj?=
 =?us-ascii?Q?paqPFT6RGdmh6RD7GpNbBPnme167mEHPgDX/2ylVQBtW3lrz+zo+KKqb2Z/M?=
 =?us-ascii?Q?ORrGaz6FWIZ+Bnm8CHuunWW+9J7b5DvvJItGhmH7ObnrQEQY6mJBr7Si9hlg?=
 =?us-ascii?Q?xyFEcAkB0JFWXsfukAVp27HGwlFxNRxEtTIn90USh4pmhJSgJH/l4qyLSP6z?=
 =?us-ascii?Q?65BwU9CGkEKJ3552YHyXKsVzCx9YE5YCOsqEk7DoVPXaYKO08Wc0LljldNfR?=
 =?us-ascii?Q?0zLCwuiND93u+5prroPVJYGt0MbbRDQBZ5VWGqH42GdAg1t7rqj+uV16st7S?=
 =?us-ascii?Q?2pM+gT0U7UtTJIia/fgKsiwkSrEujvSfCjnU4Bb1PzVmf/AECATX9P7MPljj?=
 =?us-ascii?Q?Eqzmj4yXEUgU53Lh5N+i5TP4TetUtjWJYbTFF1hzCB495nc1+ZV9QdwXZQFg?=
 =?us-ascii?Q?AuURqWfkMdEOdLOfAAb7ebefrj9nkZbtsyxLpRT3Ne84Ryh1Ez4cCZSTmU0B?=
 =?us-ascii?Q?MB6xk3RuVHDeBUlUKCkBd5UpzIOV5vz0/XYrxpmWDvbmPEw96khOXHnVKpOc?=
 =?us-ascii?Q?H3ixWtv0it63I16Rtn70ehsbO1HasLejQa5hW6YmOqIYr1IlVVX7Rh9NRx5C?=
 =?us-ascii?Q?uSBt26HB0g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 464f48f6-5711-4d86-7501-08df3124b978
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:11.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYPy3OVcgY7wXf+gdMZUIDX9LXu8bz8PYFYqo9+l5YGpp6PZGqFUEUNZXBVqos7k/UTRBqYAPLv7IsezsvOHTMiZa7oNf45CzygjJe4yqc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 16:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248558
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/strace/strace/blob/v7.3/NEWS

- Fix indentation for SRC_URI
- Refresh existing patches
- Add 0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch for pte=
st fix
  PR is still open https://github.com/strace/strace/pull/429
- Drop Ignore-pwritev-pwrite64-tests-on-musl.patch as test are running with=
 musl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for strace 7.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 TOTAL: 1525
 PASS:  1172
 SKIP:  352
 XFAIL: 0
 FAIL:  1
 XPASS: 0
 ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

musl ptest results
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for strace 7.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 TOTAL: 1525
 PASS:  1172
 SKIP:  353
 XFAIL: 0
 FAIL:  0
 XPASS: 0
 ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
- Changes since v1:
  - Drop musl ptest ignore patch

 ...f-link-and-bpf_link-anon_inode-names.patch | 135 ++++++++++++++++++
 ...gnore-pwritev-pwrite64-tests-on-musl.patch |  62 --------
 ...toconf-macro-to-detect-largefile-sup.patch |   4 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  12 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |   2 +-
 .../strace/strace/Makefile-ptest.patch        |   6 +-
 .../strace/strace/ptest-spacesave.patch       |   6 +-
 .../strace/strace/skip-load.patch             |   2 +-
 .../strace/strace/update-gawk-paths.patch     |   2 +-
 .../strace/{strace_7.2.bb =3D> strace_7.3.bb}   |   8 +-
 11 files changed, 156 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Handle-both-bp=
f-link-and-bpf_link-anon_inode-names.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Ignore-pwritev=
-pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_7.2.bb =3D> strace_7.3.bb} (91=
%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-=
and-bpf_link-anon_inode-names.patch b/meta/recipes-devtools/strace/strace/0=
001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch
new file mode 100644
index 00000000000..4e5235b9683
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf=
_link-anon_inode-names.patch
@@ -0,0 +1,135 @@
+From fa20cc5e8c736ec606efaa18427f0fd49cc45d12 Mon Sep 17 00:00:00 2001
+From: Zkingom <15024777017@163.com>
+Date: Thu, 22 Oct 2026 19:20:15 +0800
+Subject: [PATCH] Handle both "bpf-link" and "bpf_link" anon_inode names fo=
r
+ BPF links
+
+The kernel uses two different anon_inode name strings for BPF link file
+descriptors due to an inconsistency introduced across two commits:
+
+- commit 70ed506c3bbc ("bpf: Introduce pinnable bpf_link abstraction")
+  introduced bpf_link_new_fd() with anon_inode_getfd("bpf-link", ...),
+  matching the naming convention used by other BPF objects ("bpf-map",
+  "bpf-prog", "bpf-stats").
+- commit babf3164095b ("bpf: Add bpf_link_new_file that doesn't install
+  FD") added bpf_link_new_file(), later renamed to bpf_link_prime(),
+  with anon_inode_getfile("bpf_link", ...), using an underscore instead
+  of a hyphen.
+
+As a result, BPF link file descriptors appear as anon_inode:bpf-link
+when obtained via BPF_LINK_GET_FD_BY_ID or BPF_OBJ_GET from bpffs, and
+as anon_inode:bpf_link when returned by BPF_LINK_CREATE.
+
+Recognize both names to correctly identify BPF link descriptors
+regardless of how they were obtained.
+
+* src/bpf.c (print_bpf_obj_info): Recognize anon_inode:bpf_link.
+* tests/bpf-obj_get_info_by_fd-link.c (main): Obtain the link fd
+path dynamically and skip when procfs is unavailable.
+* tests/gen_tests.in (bpf-obj_get_info_by_fd-link): Filter out
+setup calls preceding the information query.
+* NEWS: Mention the fix.
+
+Signed-off-by: Xu Zhou <15024777017@163.com>
+Signed-off-by: Zkingom <15024777017@163.com>
+Assisted-by: Codex:GPT-6.1-Sol
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/429]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS                                |  8 ++++++++
+ src/bpf.c                           |  3 ++-
+ tests/bpf-obj_get_info_by_fd-link.c | 11 ++++++++---
+ tests/gen_tests.in                  |  2 +-
+ 4 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index eb5465a66c..da93026b4f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,11 @@
++Noteworthy changes in release ?.? (????-??-??)
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++* Bug fixes
++
++  * Fixed decoding of BPF_OBJ_GET_INFO_BY_FD for BPF links created by
++    BPF_LINK_CREATE.
++
+ Noteworthy changes in release 7.3 (2026-10-22)
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+diff --git a/src/bpf.c b/src/bpf.c
+index 3b09f45955..1498d5c0f2 100644
+--- a/src/bpf.c
++++ b/src/bpf.c
+@@ -1662,7 +1662,8 @@ print_bpf_obj_info(struct tcb * const tcp, uint32_t =
bpf_fd, uint64_t info,
+ 	} obj_printers[] =3D {
+ 		{ "anon_inode:bpf-map", print_bpf_map_info },
+ 		{ "anon_inode:bpf-prog", print_bpf_prog_info },
+-		{ "anon_inode:bpf-link", print_bpf_link_info }
++		{ "anon_inode:bpf-link", print_bpf_link_info },
++		{ "anon_inode:bpf_link", print_bpf_link_info }
+ 	};
+=20
+ 	if (entering(tcp)) {
+diff --git a/tests/bpf-obj_get_info_by_fd-link.c b/tests/bpf-obj_get_info_=
by_fd-link.c
+index 9536f0222f..c5f60ffc95 100644
+--- a/tests/bpf-obj_get_info_by_fd-link.c
++++ b/tests/bpf-obj_get_info_by_fd-link.c
+@@ -14,6 +14,7 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdint.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+=20
+@@ -43,6 +44,8 @@ sys_bpf(kernel_ulong_t cmd, void *attr, kernel_ulong_t s=
ize)
+ int
+ main(void)
+ {
++	skip_if_unavailable("/proc/self/fd/");
++
+ 	static const struct bpf_insn cgroup_prog[] =3D {
+ 		{ /* r0 =3D 1 (allow) */
+ 			.code    =3D BPF_ALU64 | BPF_K | BPF_MOV,
+@@ -97,10 +100,11 @@ main(void)
+ 	if (ret < 0)
+ 		perror_msg_and_skip("BPF_OBJ_GET_INFO_BY_FD");
+=20
++	char *link_fd_path =3D get_fd_path(link_fd);
+ 	printf("bpf(BPF_OBJ_GET_INFO_BY_FD"
+-	       ", {info=3D{bpf_fd=3D%d<anon_inode:bpf-link>"
++	       ", {info=3D{bpf_fd=3D%d<%s>"
+ 	       ", info_len=3D%zu",
+-	       link_fd, LINK_INFO_SZ);
++	       link_fd, link_fd_path, LINK_INFO_SZ);
+ 	if (get_info_attr.info_len !=3D LINK_INFO_SZ)
+ 		printf(" =3D> %u", get_info_attr.info_len);
+ 	printf(", info=3D{type=3D");
+@@ -110,8 +114,9 @@ main(void)
+ 	printf(", cgroup=3D{cgroup_id=3D%" PRIu64, link_info->cgroup.cgroup_id);
+ 	printf(", attach_type=3D");
+ 	printxval(bpf_attach_type, link_info->cgroup.attach_type, "BPF_???");
+-	printf("}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
++	printf("}}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
+=20
++	free(link_fd_path);
+ 	puts("+++ exited with 0 +++");
+ 	return 0;
+ }
+diff --git a/tests/gen_tests.in b/tests/gen_tests.in
+index 71393c72a6..6bf0e91db9 100644
+--- a/tests/gen_tests.in
++++ b/tests/gen_tests.in
+@@ -31,7 +31,7 @@ arch_prctl-success-Xverbose	+prctl-success.sh ARCH_PRCTL=
_INJECT_RETVALS=3D"0 1 2 3
+ at_fdcwd-pathmax	-a36 --trace=3Dopenat -y -P sample
+ bpf	-a20
+ bpf-obj_get_info_by_fd	-a20 -y -e trace=3Dbpf
+-bpf-obj_get_info_by_fd-link	-a20 -y -v -e trace=3Dbpf
++bpf-obj_get_info_by_fd-link	-a20 -y -v -e trace=3Dbpf "QUIRK:START-OF-TES=
T-OUTPUT:bpf(BPF_OBJ_GET_INFO_BY_FD"
+ bpf-obj_get_info_by_fd-prog	-a20 -y -e trace=3Dbpf
+ bpf-obj_get_info_by_fd-prog-v	-a20 -y -v -e trace=3Dbpf
+ bpf-obj_get_info_by_fd-v	-a20 -y -v -e trace=3Dbpf
diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite=
64-tests-on-musl.patch b/meta/recipes-devtools/strace/strace/0001-Ignore-pw=
ritev-pwrite64-tests-on-musl.patch
deleted file mode 100644
index d19533854c6..00000000000
--- a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-test=
s-on-musl.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3c692ce22a70e9fa4cc21afa56d03a9adcd5d2a2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 Aug 2025 22:18:58 -0700
-Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
-
-musl uses wrappers for pwritev and pwrite64 using
-pwritev2 syscall [1], however the test exepcts that the
-program will call pwritev and pwrite64 ( glibc behavior )
-
-This can be fixed if the function calls are changed to
-use syscall() API directly, but that needs change upstream [2]
-
-Issue is reported upstream [3]
-
-[1] https://git.musl-libc.org/cgit/musl/commit/src?id=3D5370070fded61b5691=
96764673a4fc8440aac79e
-[2] https://github.com/strace/strace/pull/347
-[3] https://github.com/strace/strace/issues/349
-
-Upstream-Status: Inappropriate [Musl Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/pread64-pwrite64.gen.test | 3 +++
- tests/preadv-pwritev.gen.test   | 3 +++
- tests/pwritev.gen.test          | 3 +++
- 3 files changed, 9 insertions(+)
-
-diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.=
test
-index b53e069..0a1e6e6 100755
---- a/tests/pread64-pwrite64.gen.test
-+++ b/tests/pread64-pwrite64.gen.test
-@@ -1,4 +1,7 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pw=
rite64 -a21 -eread=3D0 -ewrite=3D1 -e trace=3Dpread64,pwrite64 -P pread64-p=
write64-tmpfile -P /dev/zero -P /dev/null); do not edit.
- . "${srcdir=3D.}/init.sh"
-+
-+skip_ "Test not ported to musl, musl generates pwritev2"
-+
- run_strace_match_diff -a21 -eread=3D0 -ewrite=3D1 -e trace=3Dpread64,pwri=
te64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
-diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
-index 5ed8297..b83f129 100755
---- a/tests/preadv-pwritev.gen.test
-+++ b/tests/preadv-pwritev.gen.test
-@@ -1,4 +1,7 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwr=
itev -a19 -eread=3D0 -ewrite=3D1 -e trace=3Dpreadv,pwritev); do not edit.
- . "${srcdir=3D.}/init.sh"
-+
-+skip_ "Test not ported to musl, musl generates pwritev2"
-+
- run_strace_match_diff -a19 -eread=3D0 -ewrite=3D1 -e trace=3Dpreadv,pwrit=
ev
-diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
-index e54fd15..4999816 100755
---- a/tests/pwritev.gen.test
-+++ b/tests/pwritev.gen.test
-@@ -1,4 +1,7 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a=
22 -s7); do not edit.
- . "${srcdir=3D.}/init.sh"
-+
-+skip_ "Test not ported to musl, musl generates pwritev2"
-+
- run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autocon=
f-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace=
/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 25f32d17348..ebcd316e9fb 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001
+From dff502ff4ae95a310ea10eeda0aaf5626de3890b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/configure.ac b/configure.ac
-index 956bb85..0812725 100644
+index 9bec14b..57406f5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,6 +43,8 @@ AC_PROG_INSTALL
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index 60e51411973..478bb7b9d9b 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001
+From de4d51c010e12a8c843dd3e241e392cd8cbcc6ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducib=
ilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-rep=
roducibilty-issues.patch
index 4907b16a1c7..8a8b18d698e 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
@@ -1,4 +1,4 @@
-From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001
+From a99f2283ed13b03185b67ddda507aed3aa0f595e Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
@@ -13,19 +13,19 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 3c6228a..43b94ea 100755
+index d71e1c1..c191673 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -46,7 +46,7 @@ while read -r name arg0 args; do {
+@@ -52,7 +52,7 @@ while read -r name arg0 args; do {
 =20
  	hdr=3D"\
  #!/bin/sh -efu
 -# Generated by $0 from $input ($name $arg0 $args); do not edit."
 +# Generated by $(basename $0) from $input ($name $arg0 $args); do not edi=
t."
 =20
- 	case "$arg0" in
- 		+*)
-@@ -102,7 +102,7 @@ while read -r name arg0 args; do {
+ 	# A generated test may be sourced while another build regenerates it.
+ 	# Replace the file atomically so the reader keeps its original contents.
+@@ -112,7 +112,7 @@ while read -r name arg0 args; do {
 =20
  if [ -n "$names" ]; then
  	{
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t=
-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-=
off64_t-with-off_t.patch
index e7842688550..88a81519bf9 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
@@ -1,4 +1,4 @@
-From bcca8619f749ba78a4ce78d39c603e2606175175 Mon Sep 17 00:00:00 2001
+From 85eb02371ea47e79f912fa03dbe03c849c093b36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/met=
a/recipes-devtools/strace/strace/Makefile-ptest.patch
index 1e3c8ee2aa8..0352a82234b 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001
+From f7ad423f864c5f882c7e220f564a21e9421ac73b Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 84a9638..23fd218 100644
+index 12b63b2..1ddf782 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 84a9638..23fd218 100644
  AM_CFLAGS =3D $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =3D
  if USE_BUNDLED_HEADERS
-@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
+@@ -982,3 +983,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
  CLEANFILES =3D ksysent.h
 =20
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/me=
ta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 00f404c0036..3f6289d3a1a 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001
+From 0bcea4d97bdbfba5920ceb56215a911c9d529dc6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [specific to OE image sp=
ace issues]
  1 file changed, 1 insertion(+)
=20
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index f22ad08..3c6228a 100755
+index 2a7fada..d71e1c1 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -84,6 +84,7 @@ while read -r name arg0 args; do {
+@@ -93,6 +93,7 @@ while read -r name arg0 args; do {
  		$hdr
  		. "\${srcdir=3D.}/init.sh"
  		run_strace_match_diff $arg0 $args
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/rec=
ipes-devtools/strace/strace/skip-load.patch
index 610dd94fe9d..cab890f1482 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001
+From 5c9048988e5000fb0f175afde05a23be2ef0fa15 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/=
meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 8895b0ff9e2..764f0af1163 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001
+From 3c4da31783f127d18cf1b64ca33ac46a512da2cb Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devt=
ools/strace/strace_7.3.bb
similarity index 91%
rename from meta/recipes-devtools/strace/strace_7.2.bb
rename to meta/recipes-devtools/strace/strace_7.3.bb
index 3f7aaab3e6c..6e801d265f4 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.3.bb
@@ -14,12 +14,10 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-=
${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-su=
p.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+           file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+           file://0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.=
patch \
            "
-SRC_URI:append:libc-musl =3D "\
-           file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
-           "
-SRC_URI[sha256sum] =3D "4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e=
3c0d6d4b709fe5"
+SRC_URI[sha256sum] =3D "529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc=
89efdf05e39b72"
=20
 inherit autotools github-releases ptest
=20
