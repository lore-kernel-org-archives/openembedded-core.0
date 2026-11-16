Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FQgLo7aS;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcVC/+HBYKff0tIEpW9VzaUPU1arF1Bi2RjydshxIv+oDYp6LiZm9j6+WCWGpH+cK/Slb3RLTxuJGUHGjaSDldBNYkddtbHlLqdVEHbySoLU90DVEB4usfeEnykdxwyIPBsrvXd/s/yhLN7XPzIyjyRDr7KVXulfEx18M+mp7ZgGmHZYk7GxFMIfGcPnSDmLnd81j4dVhRWVxgEmn7MtSsYed+AWQy7ALkkg4hZgtcd7wxP+abNFt80hUDm6eCl2v+jolUC0jwDJ1H6fuRsT5Lc8V71ben1wwK3vlR5aan3LHdLsVHv3GNXHbQda1tp8sbyv3npI+/1DTlDvSi17SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTdOfGyUrCN4QErD4pIMvJV/efruYh68OBYT/PhpMgo=;
 b=fJ4nmA0+T/NrIBhoHGpC0ov7UjIEbwFDk1yWLsEVwJh5rur29GkpJJwmc5uhKR7Luvgp1f6pCHUBxceWfIpvr3YR8MhNfxaNY2r0gPhj/W33NuCf7PrzyiTP0HSr3bgFTSxZBRgnqhNqjAVtaUbUPYqD/oh0Z1n4MiNhcSUwioAuccoZCG1eKPQ9i/25rGKse4ZI6wKWM8a9kAGNdaY/vS4zm6oAiqXOXykF+D15kgExynKOTvtDZhDS+4eCyEOP8twZ1tFUr5YonrFqhNlTyZuNtqTwL/1+tb7qucmQJhpSHA+VIZ1bZuoNgvlB1KluhZy8J8UmJODzSKhMfHgXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTdOfGyUrCN4QErD4pIMvJV/efruYh68OBYT/PhpMgo=;
 b=FQgLo7aSJjHzHKS4z3Iq+/RmJkKI7E+tK4+ziHBLF28IwQLW/QHkGR4YistMwsGZ1QqCbQeU0PoZ6BWSuUnGdu3ezf79TfySGsY+oe2OQ4zrogJtqoZhcSijFaewu7AbDXw6SdawuH0SrvmSmAcp2W5toqEIVrlb7S376YD3NVAxOUvFf4o2gXTUV3EkBU2e6KcZSH9kbkWVQLa9bx1wQpZ0xxfsWtbI3Bu8xB6dP0CGLcRqozw1FcnJBVBZqk+Bzy/9Oj9AT/Ia+9to8E13SvdTYfG/eIxSbjwOxyd4qKPvMZ4o69JNP+1W9oFUPrJ7fV9XJTbQTo2jl/jB8OeJQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:13 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] gn: upgrade to latest revision
Date: Mon, 16 Nov 2026 12:16:56 +0100
Message-ID: <20261116111658.7745-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: ece907f6-bd80-4969-b5f5-08df43d32a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021135927099003|261021123027099003|261009223027099003|261102130727099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: d4WC6B6M0uoKpgQaobIOjMcBL0qzS3P/8lE33CeiAM+syb8hkrBgYMq2Vy9VTYL4LF41FTPm9ETy1LyR8lm16UB3ExjrY3w0NNFlvVJWas/pPSRtD5u9MsjTE/rNV3XNTkO/42CvAKJAGVryKeKsFIx8JCYC5QavXq42FG/FLqHBv13GTvQZ+CQQ0E36QzCQbUSH95xhO2OI89cdS1se8HOejkC6GKdfrQ0K6nsFpF1ZZeoYiBrfq2lUjryZ5q3xmfXZTR6wfTfkYHc05jOEt4EZtK6dy7ZGR0uI7M8dL9wOgLNYCRhpgUaSWHwbqR1rRK0udOfP79MRXfaAOJTccT/dwR5R6c3f5OYpZdsD/dz+R0BPB6JtgjZq6dT9bK3EEh4rC4smJCmkiXbvOWbwe6YpaCwVCog2RpAFj5mqIrVX4/oPIVvw1VuUKnfloYwiT8/HFtM2egHKA6X2db6WBklPZrQt5fvT42nlwHPT7Mjs0tCviWLwJ7akXdfOvJg3Q26DW2NV8bwkSrK5UfDcdMiEIk/DANzOLniwGDQ572KU87NI9q2M5aJeTAUnsQTGoGEbF52S2t4gfyxhYJ7oSQIIvPrGPav8ed4ah/SOWDv91/63378xOq2Dqj+bFk5j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261021123027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3QwHBBioMbLIHy4QneznTeY/F6omK7m+lgUDRig1s4Q7FC/U/a9g1Lehw1I+?=
 =?us-ascii?Q?jVk8h0nXz1K57ieyhAkTAIi1EudVJhhmu9ALUXmZY5zj12837fr2VMDcTXPj?=
 =?us-ascii?Q?G1CdIq9Spadgf9hzmyLf3nDhq3tlrKbK3tQ0pchUCXX5OpaqTxLqp5QAN0M+?=
 =?us-ascii?Q?rzCLyYPD9ZoViohN4bJcQjjly6HSdfHljwA50DSUz1uGml3SZuTVcP0V3J92?=
 =?us-ascii?Q?wSxixLh7NaJTCku8ygcRGPgbFxbPneUxijAiHC0pQx1swfEMBDGqKpDYIsC1?=
 =?us-ascii?Q?05CTMyqNu3halYmeEmuWE9vqnmTTBAQe/idzhCWrPpI8wuAGRCFSpBgEEUtK?=
 =?us-ascii?Q?LEgsTQ9xeDQxraZ+zWwd/UzXgal9X9uxc51TmH9jAlE2bLeftARsDcBNiloD?=
 =?us-ascii?Q?vrFS86Sdzix5c7PJUb22DNTV7CPAgyVDaD7WM5b5qnyMlQBdh0W1a+eP3s2n?=
 =?us-ascii?Q?yE+rE/46E8vqciXIIjt9iSeFrcehlQnDz3AJfYSjJT/YpiAmwWjN4kKq9I5D?=
 =?us-ascii?Q?izmduoGP8/tSBMWu2XGhUMKEX9Tx1Lf/WokHZcRHziER4KF98o8koTmr7mQX?=
 =?us-ascii?Q?entEoW8B3fbC1EB5d1CCx//STpEn8NQvbMRVt/FQUc83mbKaNsKi4cfz4kSc?=
 =?us-ascii?Q?XLqhlf5UTwcIDNYbZxtKE9IpHKR+PH8Sci2prpzzykkk3E6TJ8fN4Zb1Gg2x?=
 =?us-ascii?Q?ziJ6a+kwMcB9XJXycD572vwtQupVy8Yq8VYgLmoP0U/pybr+TsbPSbRUcmBX?=
 =?us-ascii?Q?ByX9to+7oEYkmkkeXMG+2LsQ8noNSy34EP0ee5wi7YPEL/Zc3FudY1RMQ5r3?=
 =?us-ascii?Q?AKe6BWXig9cwACWt60wTOK5SKOemUaUuAkm0ScFRTcX9dtyBmiTPOEl41SF3?=
 =?us-ascii?Q?bvCk5vxoaFGhTnCc0Yr9C0YZIMppxv5dO0zq2heqWFEsfxiWnZaue4vCSCvq?=
 =?us-ascii?Q?/qecIoDwWLPA6p+8gX6HLlMRCSI3sDeq7w45cR1r1Yi37vJMO9wBofJ1Mtv+?=
 =?us-ascii?Q?PjDPRyeHIF6z3zOYH3BqM7QSZC/ONZOafgBz7cLSZHT/PWYDgOGKQJNbalJR?=
 =?us-ascii?Q?aF9/Lwbicquqflelv65sucESU6Jv6AJo0O/0930UnxrTBBZu5KBLYqfwxZ5n?=
 =?us-ascii?Q?LT1gbE3BQoYmfurEON6DRtyyT05gjgKs8irbFog5FAfG/eMQT+GxDsuH3A3N?=
 =?us-ascii?Q?p/DHIGJcwNYlGD5C4YzYOzDtD5rNRO6BQNWfcx6GjGOtgfbm8pfZVce3eGPl?=
 =?us-ascii?Q?vG4wdR2OXFi9ITXyP5kyVE7UCQahf0vpLZoPN1rd+4/6VHymb/LzUzMb20z2?=
 =?us-ascii?Q?BqAXrSL2kGZyWqi+5Sq4hOMN4o+JYgxgh0Krvp0+udrkUqGt2hajKif+IPM4?=
 =?us-ascii?Q?B7Mv0YpnEpJKS135NOi9TdSo1uhSgkVc6EY//3vxkgsYSGhcOKJOHvMptTdC?=
 =?us-ascii?Q?V6UJw+lXxq2XJaKJbkv+aXDY9ahAWPMLbvE1ZC+oEYFi+ZrlQprYuDzkwqNt?=
 =?us-ascii?Q?kNV/+AtxMUdAQ8pSzqXlRwTl4B1/DVlCjJuxYzEVhC0HfBa0Yb+AHvEotrUK?=
 =?us-ascii?Q?/zX3y/6m2E8K9VxMqwpO10tdlZ56FCp38uA1i3lFVayxwgK3r/h5FTqiChGI?=
 =?us-ascii?Q?lELxl+znZTKLcPLC8Ziymge00XefTMYEg+pfDwPN9OO4KSQbSngz1SnMPmKj?=
 =?us-ascii?Q?8Y/OovkAqt32a1rKFtQpV+9JLXUNiyhoDimzejU9FXav5c8lXuYd6gNYNwum?=
 =?us-ascii?Q?FAOjjwh84Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ece907f6-bd80-4969-b5f5-08df43d32a11
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:13.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adxz9kn1IiiierVxacrBniYb4Dh0qg1hKbq+TjIzM/jfHxQIVI53A+A76ZaxZqxHnR9O+64To/29ZIArLfF51HWF7Vr7HgfqqLQwx9q1MMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250336
Content-Type: text/plain; charset="utf-8"

Group missing generated input errors by target and improve error messages.
Fix infinite recursion in "gn refs --tree --all"
Factor out helpers for generated_file() variables
Delay the whole Ninja writer of delayed generated_file() targets
Add TODO to check transitive deps by default in gn check
Create a function to calculate relative labels.
Header check: wait for chunked work with std::latch
Add --with-transitive-deps to gn check
Report .gn errors instead of crashing
Accept multiple label patterns in gn check
Fix how the regeneration command writes gn's own paths
Do not backslash-escape non-ASCII UTF-8 bytes on POSIX
Improve performance of escape functions.
Improve performance of StringOutputBuffer.
Reimplement EscapeStringToStream with zero-copy.
Propagate should_generate to sub-configs
[infra] Roll mac_toolchain to latest version
Stop integration tests from running every ninja invocation.
Replace instances of o(string)stream with StringOutputBuffer.
Only disable check_includes_strict optimization for exempted includers
Make build/gen.py use hermetic clang.
Cherry-pick script that runs your changes to recipes in CI
Improve StringOutputBuffer to act more like an o(string)stream
Disable check_includes_strict optimizations when there are exceptions.
Refactor CheckIncludesStrictExceptions API
Replace std::endl with '\n'.
Refactor string_output_buffer to support "Reserve".
Add check_includes_strict_exceptions configuration to .gn
Stop forwarding private hard_deps on Rust targets
Make StringAtom use pointer equality and hashing
Fix "Ouput" typos
Add no_check_generated_targets .gn variable
Improve the suggestion heuristic for depending on targets.
Do not generate last_commit_position.h in debug builds.
Enable check_includes_strict by default.
Disable rust formatter on main branch.
Add include sorting configuration to .clang-format and reformat
Delayed generated_file() writes if they collect validations metadata
Stop forwarding private hard_deps on check_includes_strict targets
Add `collect_validations_metadata` boolean flag to generated_file() targets=
.
Add new experimental_collect_validations_metadata .gn variable
Move generated_file() writes to dedicated function.
Avoid canonicalization + string comparisons during metadata collection.
Use internal state struct for Target::GetMetadata().
Fix minor Scheduler data races.
rust: Don't make rlibs depend on non-Rust link inputs
gn edit: keep build files alive for warnings
Add instructions for agent to build GN and run code / tests
Write phony rules for harddeps
Support conditional sources for gn check.
Don't write order-only deps reachable through direct deps
When suggestions have a known includer target, don't complain that they don=
't
resolve to a single target.
rust_project_writer: Support aliased_deps in rust-project.json
Header check: validate includes before building diagnostics
Header check: defer unrestricted dependency walks
Header check: batch reachability and file checking tasks
Header check: select files from the existing file map
Add an allowlist for allow_circular_includes_from.
[gn] Use std::unordered_map for waiting_map_
[gn] Shard StringAtomSet to avoid lock contention
[gn] Use DCHECK in Target::info()
[gn] Make ResolvedTargetData stateless
[recipe] Enable THP for jemalloc build in GN recipe

- Since commit 00748cec0 [1], gen.py uses $LD for the final link.
  Set LD=3D$CXX in do_configure because OE's ld cannot handle the -Wl  flag=
s in LDFLAGS.

[1] https://gn.googlesource.com/gn/+/00748cec029890841e9e550281955324eb84a2=
66

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/gn/gn_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/=
gn_git.bb
index 6e8626dc32..6011ff6f12 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain \
 "
-SRCREV =3D "cfcd774b98f3433e18b722f9a7ff06119825b8eb"
+SRCREV =3D "311003f8ea3500f8ce87c43ff61aec6f4066dac2"
 PV =3D "0+git"
=20
 BB_GIT_SHALLOW =3D ""
@@ -27,6 +27,7 @@ def gn_platform(variable, d):
=20
 do_configure[cleandirs] +=3D "${B}"
 do_configure() {
+    export LD=3D"${CXX}"
     python3 ${S}/build/gen.py \
         --platform=3D${@gn_platform("TARGET_OS", d)} \
         --out-path=3D${B} \
