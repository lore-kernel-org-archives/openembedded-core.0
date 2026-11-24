Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24294.1795540699948741764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=u+1ZVp99;
 spf=pass (domain: est.tech, ip: 40.107.162.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8Y5LdhJ5QIjLSjRuK4Cc/NxkALQRtRvmlVS4odoeq53rovK2q46pSL8azUugB7cB3cgxPMfZJcPnF/m/n+JCb6Hdeasfp5Qq2jCtbOx9uisYCzFo4n7C95AVryBmXyw819WQAXWZQ7L99obQiHAK918ZUgmB6VDTD1pHR0IrHIhXhnxQu6tyVHiPLyUcU3cXUaVdSv5f6LQYbeUzNRaEvDgvB7tSJb/tYMyoxz3gI8sSBi0PkbbUNyPtJiZDUOxAodKqARgWHS/rRMs2eyvIBUY8pjdLFS45L17Ge2maAmBZPuYFEYnox2N03e3WkqTenrJW4Xvf8P3aNlTk6MZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLYLRKzaFn8hNK6aSTIjRqOh7AnEDbwhOArRQN3seoM=;
 b=WiAIyxhhrBSfDuifeGiSbV4kCAAROoCL+/0j5wPov4era/LCUietCDX4TSaEivaHjCUl9wryM1kExnHvz9ZdmwgCvQXWiJprsOi6vxs/f9mJVaJX3We044Prp79tdGNcSj3+dDhH086FGPb0RN8x3VBcDArMhUallhAL3HGV5uiJTUVhzEMZAonINLLnYWpp6jBaKi6KeC0fL4jFPPTH81uk5+X6feZg9/IFVUamJVcd/3Sr58yZPL34Tn0iA+ZCF/SBp23+oyhYc1fWFz6UUkdCMhNfFuMSx4szUa9TDs95vY1w60i8/zq84d54BzWQFw3r+Z97ErmUHWTESEzftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLYLRKzaFn8hNK6aSTIjRqOh7AnEDbwhOArRQN3seoM=;
 b=u+1ZVp99WMjNWbDOlGdfMSV1KkSkSd3Z0/K1Qqp0wpbsjYnEDZWjDcR/Z+HWprsT/bsNutnFtBK+JNy6xRLSMo7NTP1rPTjuKtiBPJtCr5uvquu8oyj9hTAUy/3EqYvOM2IRpAsmC+fH4848h1nxveRxpLgZkDA662JXVrHkC3JV8Is22WAsqKUcdL6peSLddXzcw9y3kjEyG9xZmjGis/aJeN8ke5JNp4ZapkLTXOaBmKD+fOvyVLUr2gVyXF7+TdESFvM5ZQ/UtX9GqGaR20n5U5/hHEvJ2Rq7rMLzeqYS9LTU4lrgQyjfePmzlIPutgkfBTbFcL/RNyouGCeMzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:18 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] zstd: upgrade 1.5.7 -> 1.6.0
Date: Tue, 24 Nov 2026 18:18:01 +0100
Message-ID: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4c6a6e-18c9-49ff-0e40-08df4a4eeeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261009221227099003|261028144727099003|261009221727099003|261021121427099003|261009220027099003|261009223327099003|10067099003;
X-Microsoft-Antispam-Message-Info: zCPAdzzOEohyetma05Wf8Ik4OE/vazkU7IESCGQeqRkLJReWRmCE6MsVwZlBelZuHkCLDbxeX1hxIKMsrJikHrgjOTFpiQqVX9XjXsfcOfHRN/0BGbHc+rs61VUBz7mvX5kKGV1tHZSz94mYbBGSQLgOW5aFBctvnc5c/xo4BD8welzVxRijaG5x7C/TXr9wdeqepb3NS8tlj/kQrBBTD/ueKMGFHP+TKd9KbFF40i3rYznpjxng6wPS6IB7ugbaej2qZUyxkuOF/m8rIyLiBiRK0L8svwdO+0MKOQ00wu1akudFBP1k8RNPJYNn+ydx0fk56gu0hPvnkC5X6dAfvLAtocXehUmSYxm0UvZipCo4Lxt90Jhq7FpHHdY2eYMHbsBJvBRBDTeDZxWSiAsTaDFQtFq9+kJT/BfiWs9TkSgNl4LX4lw2gfxffXM6CSt7VbRyKnKQPHJJ/CYzYIFXZuMYfzLTVLUEcVmkpc0Nvp05J1g66pHrM0yfQ2YVht2PlSQalTiwRiukWx81Z4np/qFLiXAUspy2fozLUIMXAFSewu5dBUO8OYeifx66w7F2tleCTK4fPKczfyRlL7Txox/oSC/pwFZe88UqKDAUl4OygAE1nTEQYkaoTruUxLSTvwjYAZoV04OSAJIaVGAf/tKKj+pmKiRPb7Jf3LsqiVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261009221227099003)(261028144727099003)(261009221727099003)(261021121427099003)(261009220027099003)(261009223327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t83+BiHNd+RWcjzHB4b4WzFc60USvC5WQyv5s0sQNxg/Nl3tpkwF3AWLOOO8?=
 =?us-ascii?Q?RGTWpMfrQN5OAwUtvnB/IR9K8erMaCdv1WuagUKkj5798S8rHWt3zRlO9iLO?=
 =?us-ascii?Q?zN/nLt5TgPx9aMRa+oC6TNvClVun0LMXJlmulUkvxaF+noXWyAAq24BhAy6P?=
 =?us-ascii?Q?Sv/BvevSZnHxf+9X8Gz4bwmrK3WwuY6mVPQws/92ThlI+S0Rwo4H+blWxCLU?=
 =?us-ascii?Q?Gy9sNMG3JO98qOG5LBH43H4Cd/XYMvLKGfv/GAMn26FQUnDx8IBGBPF+Ai9J?=
 =?us-ascii?Q?Nntb0aVgYWYu4NNN2dg94+0JwIW5aaajsZmLiw5V/SL+syKFnuFuvt9YoSiM?=
 =?us-ascii?Q?9/Nfl0uY9oPpqtyOhngGMf5+IZ/fLtbChaEbEjCDC8ABgtQjTJ1ebTtIVJ9z?=
 =?us-ascii?Q?1wudsgeRKxLK5V1shjJIOuOqoMcLbRnYXpfcWSgWIakY95xmMLjIsXCgIBBk?=
 =?us-ascii?Q?Bd9b2mB/txoJH3WKxUPCTOr1yJ2A/u+xA/jNx2sVeejN3Lih58Ak/IAwtBwb?=
 =?us-ascii?Q?W94W+OvG59Ews0gVBEWUDSMLJlfkBvomvSQJlyuFRvLeM+Z/0l+KE8ZmD1F+?=
 =?us-ascii?Q?25pB+4TMJWSex8jDXSvVjuMn7MCtkB1kXH5xmRDJ6UVWW8zoFi4kqEsN1q9n?=
 =?us-ascii?Q?34iAoxXxQ4OS0Q6HFa+F5DEJSAPH8qphFZeDGhjRzR5wLi7paIB+yswUQRVZ?=
 =?us-ascii?Q?30CQmenqa1AnYIoBhUVQJ6TEBeNpVeFQLALRTBokRr8/9Va62ClXgqUfcY7w?=
 =?us-ascii?Q?fYNV81YHMu4wOzZifchXMBbZk0To7aGM7xj6Mfcu08epNBpE34ZC/XqoG2By?=
 =?us-ascii?Q?ypznatr8HhyeeUsQESVe9uh1tcGt0h6E7YzRiBMhbmeo80DkcXosQL+43zXd?=
 =?us-ascii?Q?FjEPKMhvGPQtxe9zPHOXnYsiFH3EGi7BOGUwkQX39IoV9Ev15wV/nFandnPa?=
 =?us-ascii?Q?SOpx3e973DnM+pvYAucNLwhF/j8cxLui315bM+X9hnXKtbgZSpLBZ1L/I1mN?=
 =?us-ascii?Q?x6Wf+Hvf/MsJ4UKoUiptKMjaaKVsPv05QBXZBPyiR2AdDHelojVDPZBugtEE?=
 =?us-ascii?Q?Mv4/PZ5/485bbjPo/ZlunAWymnQES4VrIDxVb36b2s6EV94NCz6MeytatCA0?=
 =?us-ascii?Q?GmRBFvqXRAo3yhqr7RRnWpIrTRzaCbThEgjnZUrLdBbj57EB+AAhs0N8uQ8t?=
 =?us-ascii?Q?qq0t2d3x199i0zIF7m4HfZOL6jVjfkbAWtnAooRpZ+2NMpV1cPkEbppdAhZ1?=
 =?us-ascii?Q?t44jkFDouadLJeHD5kthRtAHsStxA/OfeWyRzVfGogvmppZUXkE1dTtM5fLp?=
 =?us-ascii?Q?8zxJY3BiQbA+r4KAHUG72Kn9RW4IjQ6ltYiyHisyFoKWhjf8uUVIAo3jj0Lu?=
 =?us-ascii?Q?eeEZ2bDTe5quBfVCOxJ8f2MXzY4l2FXRKySEMtBpjoY+gFBccd5MLTXTI0w7?=
 =?us-ascii?Q?dpLIbe7L5HYX+lz0n+UvjatCIX/1BogPQEzbsAres35oKFi+H5fRvnX7WnJg?=
 =?us-ascii?Q?T9FjD+fzQP6XmdAxO88LjPdKw3na8Ck7pKnOAQfhXL9f7d/ydb2rWT6TRn86?=
 =?us-ascii?Q?3WyDXh37Lb1p8RQyGgwFOqTEarSWjZQwPguIafrroPsCt5A2024vY7XA1H+4?=
 =?us-ascii?Q?ZKnn0PpXN+ifdsII02UC8n6U7UgGlKLimAXk85WKEKUCzRxGZGMakrXzkVlN?=
 =?us-ascii?Q?GLrgVtSS07r51CI6+utduEBxJ3ZGzGCyG+8V6U5ExL1M/SPHy8vvEbqoDeD6?=
 =?us-ascii?Q?BDcRt0WBaQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4c6a6e-18c9-49ff-0e40-08df4a4eeeb5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:18.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDz7WHXjK0Wq1P7DoT8K1iFNwp61viRmDbVGA2IYUnUoC7aG8D2LFDt/63MTQz96vhJpchPcV3qR58Ork72CH3UJvXXyZDAIs+k5d/jISqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251057
Content-Type: text/plain; charset="utf-8"

v1.6.0 (Nov 2026)
fix: streaming decompression of malformed data could expose uninitialized m=
emory
fix: multithreaded compression with `ZSTD_CCtx_refPrefix()` could rarely em=
it a
valid frame encoding wrong data, depending on thread timing
fix: out-of-bounds read and write in the DDict hash table when using
`ZSTD_d_refMultipleDDicts`
fix: use-after-free of a `ZSTD_DCtx_refPrefix()` prefix after
`ZSTD_DCtx_reset()` following a malformed frame header
fix: out-of-bounds read with `ZSTD_c_stableInBuffer` after an abandoned fra=
me or
a changed input buffer, reported by @IlyaGrebnov
fix: multithreaded compression use-after-free when freeing or resetting a
context during an abandoned frame
fix: multithreaded streaming compression accepted a wrong pledged source si=
ze,
producing corrupted frames
fix: prepared dictionary decompression now rejects matches into formatted
dictionary headers
fix: on a static DCtx, `ZSTD_DCtx_loadDictionary()` and `ZSTD_DCtx_refPrefi=
x()`
return `ZSTD_error_memory_allocation` for nonempty dictionaries
fix: wild reads when compressing with large dictionaries whose repcodes poi=
nt
into discarded content
fix: memory corruption in `ZSTD_compressSequences()` and
`ZSTD_compressSequencesAndLiterals()` with small `dst`, overflowing lengths=
, or
some invalid sequences (#4918, #4989, #5004)
fix: out-of-bounds write with `ZSTD_c_targetCBlockSize` and `ZSTD_compress2=
()`
into a `dst` smaller than `ZSTD_compressBound()`
fix: high compression levels read uninitialized statistics with some
dictionaries
fix: 32-bit multithreaded compression with large windows (#4946, #4948)
fix: 32-bit builds rejected valid dictionary IDs above 4294967176
fix: excessive memory usage with long distance matching and small windows
fix: CDict and DDict creation and size estimation reject dictionary sizes t=
hat
overflow
fix: crash when a custom allocator fails (#4613), data race when resizing a
thread pool
fix: legacy decoders: out-of-bounds reads, wrong streaming output, and offs=
et
validation (#4555, #4815, #4816, #4817, #4913, #4955, #4957)
api: legacy format support is now disabled by default
api: experimental `ZSTD_d_refMultipleDDicts` requires an exact dictionary I=
D
match: a missing nonzero ID returns `ZSTD_error_dictionary_wrong` instead o=
f
falling back to the current dictionary
api: disabling experimental `ZSTD_d_refMultipleDDicts` releases every dicti=
onary
reference of its set
api: removed the deprecated experimental functions `ZSTD_copyCCtx()` and
`ZSTD_copyDCtx()`
api: promoted `ZSTD_getFrameHeader()` and `ZSTD_FrameHeader` to the stable =
API
api: promoted `ZSTD_createDDict_byReference()`,
`ZSTD_DCtx_loadDictionary_advanced()`, and `ZSTD_CCtx_loadDictionary_advanc=
ed()`
to the stable API, along with `ZSTD_dictContentType_e` and
`ZSTD_dictLoadMethod_e` (#4283, #3723)
api: `ZSTD_decompressDCtx()`, `ZSTD_decompress_usingDict()` and
`ZSTD_decompress_usingDDict()` reset an unfinished streaming session, as
documented
api: `ZSTD_DCtx_loadDictionary()` returns `ZSTD_error_dictionary_corrupted`=
 for
a corrupted dictionary, instead of `ZSTD_error_memory_allocation`
api: `ZSTD_compressSequencesAndLiterals()` enforces its documented limits o=
n
block size and `litBufCapacity` (#4741, #4782)
api: `ZSTD_decompressContinue()` returns `ZSTD_error_stage_wrong` when not
preceded by `ZSTD_decompressBegin()`
api: new experimental `ZSTD_isDeterministicBuild()`
perf: faster decompression on AArch64 (#4413, #4414, #4418, #4509), by
@arpadpanyik-arm
perf: faster compression on AArch64 with SVE2 (#4411), by @arpadpanyik-arm
perf: faster `ZSTD_compressSequencesAndLiterals()` on AArch64 with Neon and=
 SVE2
(#4429, #4440), by @arpadpanyik-arm, and on RISC-V with RVV (#4399), by
@zijianli1234
perf: faster row match finder on RISC-V with RVV (#4481), by @w1m024
cli: new `--patch-apply` command, equivalent to `-d --patch-from`
cli: `-B#` renamed `--jobsize=3D#`, and benchmark `--blocksize=3D#` renamed
`--split=3D#`; old names remain supported
cli: `--filelist=3D` supports process substitution
cli: size arguments accept `G`, `GB` and `GiB` suffixes (#4609), by @Integr=
al-
Tech
cli: `--memory=3D` also limits `.xz` and `.lzma` decompression
cli: benchmark mode uses 1 thread by default
cli: warn when multiple threads are requested for decompression
cli: safer file handling: no output through symbolic links (#4906), `-r` no
longer follows links and junctions on Windows (#4905), better same-file
detection on Windows (#4884), robust to concurrent renames (#4962, #4999, #=
5003,
cli: `--output-dir-flat` fails on output filename collisions before process=
ing
(#4974), by @daniellerozenblit
cli: fix `zstd -l` infinite loop on a large skippable frame
cli: fix `--memlimit-decompress=3D` parsing (#4916), `--adapt` bounds (#498=
2),
`--patch-from` with an empty file (#4896), `--check` with `--format=3Dlz4`
cli: fix `ZSTD_NBTHREADS=3D0` (#4334),
cli: fix decode-only benchmark of multiple files (#4714, #4945)
cli: `zstdgrep` exits 0 when any of several files matches
zdict: fix out-of-bounds

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch | 4 ++--
 meta/recipes-extended/zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb} (98%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-l=
evel-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cl=
i-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
index d7559f7269..6163201bf2 100644
--- a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-wh=
en-memory-is-insuffi.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-wh=
en-memory-is-insuffi.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 5182d7671cb65346b55d3ff8eda6388f876a7431 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Thu, 27 Aug 2026 12:00:00 +0000
 Subject: [PATCH] cli-tests: skip zstd --max level when memory is insuffici=
ent
@@ -15,7 +15,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/tests/cli-tests/compression/levels.sh b/tests/cli-tests/compr=
ession/levels.sh
-index b8230f2..7846d3e 100755
+index b8230f2a3..7846d3ec0 100755
 --- a/tests/cli-tests/compression/levels.sh
 +++ b/tests/cli-tests/compression/levels.sh
 @@ -16,8 +16,8 @@ zstd --fast=3D10 file -o file-f10.zst -q
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.6.0.bb
similarity index 98%
rename from meta/recipes-extended/zstd/zstd_1.5.7.bb
rename to meta/recipes-extended/zstd/zstd_1.6.0.bb
index 4c3b377c14..a4a6acc435 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3D=
release;protocol=3Dhttps;tag=3D
            file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuff=
i.patch \
            "
=20
-SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
+SRCREV =3D "916e8e70b33317d469a41ee837e47317807815c8"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 CVE_PRODUCT =3D "zstandard"
