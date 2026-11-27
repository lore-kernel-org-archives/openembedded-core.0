Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14400.1795779124673554534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BoYxavaO;
 spf=pass (domain: est.tech, ip: 40.107.130.17, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymOEoCmEhiLjapVEFh92NmaFJYus36be4oOn/LTIpqAHdfNhK3XDh/2ugspNS/6lkvfT4K8S1pE0uw7yUMsdO2CIBXwDcLJcum74Kgr+6wrE43ABtKazyJyWMg9Q1nCo/TjWVhzUvqBRW4eebsSSMKf6iQ15sieTdKC9zCvaH/ERQy16HJN4R2F9IhnuNwCj0pSUT3AFUd5fzIc94iDP5zYGpcqxvzlKj1cB0WPpqkorzWj6WBd9g1K0iMQAiyF4i9tFuxkMlzRZjVf+Sq48YnnsedNIDJpJkkCbDl5rzi+5mT6JOdm2siwpFIB0XdSND2lTlibk77o1GJ447T1jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aBeBSQRsj3JeJNwn9h7U+h+uhlDF4ET5lH3U3LiiT8=;
 b=d3v9PD2PPNh+5WF1SAC7USK6dJ8G5BCTV2ugOCehgo3iDuYdh6jh6o093cm2jItIICJpeGnrEeelZ4t9nGvzd5V6C3dE4sYN17d/0+lbfLvtsXB5aSclKxOCPPogyEUKcMvxOvVI/KyUDPjBb+JtYcH9BUsNCX51mrFXEafi8rLOpaDQmvNGh6k+73RVMuKqnQgYRplNROZm5e6xUxKyb6Y4Pr//IPHJyFBAC3Xn1GtG9FPQQdGVUd18oqNm0xnYTCF0gXkdxPM819Jjpn+LUGcpxpbXSMMbY25ZDKvVIX2KOt1cfPRFv4nllfweTHo0ELF6/d7EuPLpveRMeGZXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aBeBSQRsj3JeJNwn9h7U+h+uhlDF4ET5lH3U3LiiT8=;
 b=BoYxavaO/OaJ7nnldfdNVbB9IwPqp3umanfRAlERXN2XuOxdyedrwkqP4Nbs6zewP0suNu6Q+Vybx3SOJ493QFy7l8ksMnfFKq9kr67JCW9gNAotba0IUU85oQrlS3HEg4IgaV7oWtc+wWYFuk0rW8XStW18i4xsiXne6covTcn3LA8kyOKlpoH8SHpacUKbNPVdjc0+Jg8yYS6k1JVHmz4RDIFC9opdca2pnmWi2u9Y5DeXKowWWZ7qIchdY9lW5ssXCEJbhF26yfAjcBFp+e0+6JJAFpOa5JXUJmNlcnnUCJ+AgpsLWg0yxJ27L+T7BJZRm3AUK7bmE6Vqiq3Wbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB3345.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:31:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:31:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: drop not-win32.patch
Date: Fri, 27 Nov 2026 12:31:57 +0100
Message-ID: <20261127113157.1863-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB3345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b695953-5bc8-4f9d-4943-08df4c7a0c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|6133799003|261009223027099003|18002099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: RaXIZ+7/F7f6O8uqV0XzAMgITTw7YOK32RK6XD102cu49G8I1Q9+CJbtO7D/k41MDt7M/JzL6VNwdBmRNZGVIrtXQQHDBsIxyCCVROlZULqyRguULOegjOB4apbgv2cM+15i6SH75mwyKeCW2z75hQtTip38S9HW26CMIu6N+fRcOtawNtyPN4eiNk44NllSxEdNP4/N57SShfpTXzgLDS9cI9WfFiqP2Ug4PiSJE9QuO3ykRSp5L2tic7zerP3c/Hm1Pm7WqMG+wEGmZSp98X6A2f7mURU5CxvIVn+o2GHtd199kwZ0lyL/6jRlszNsUUfCYCYm3bqtNsLjFAJfg/ktv1XgKYL29LHZkRZFKiqS0DYlcZw60EJydYgkqOP5PtTqNoSwsVw5FgI8E6Q1Z7+ymQGQ5lhWurQ09PHTna7vizhnqzCJeqyZijg52dvgbZ6/LX9izzTiuVgzd0obMvK0XYneAPwwCKOtlB5APpZpi4ZrBVsncFKCU9Uc1GkEfz4nUa8VY8gWzSeoB5XKw4DGeg7U0915upV0qz2SDKld4ZYtro0QXNNt3FVMzOOqn0i8FPd7cDr9BV871+KprNZ31EMKdk7jXyl031NI/uuNMsqz5qfRnG8RKQxbqaGb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(6133799003)(261009223027099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HNut9p7261tDJIvisEz5n1S0TCromKA9oV3qXqzztbGbtcVKl0odYxGtx3C?=
 =?us-ascii?Q?1iPV/qJV/bPWRNVtGolQTAi6BTLWAFEj13DcPRY8sSrn6lk0FokCxHMnBYf7?=
 =?us-ascii?Q?p54tAjhBv5EvNsu2p5Sv0UWGQbCcGqU1wrFfWDrWK14OocItMLZcfdHBZG9C?=
 =?us-ascii?Q?gXFXRa9yRZSgTxbK0hW3qks9Tae1pkB6IQuPhqt9VAeVhfbOsdG9wN503EcM?=
 =?us-ascii?Q?cT0CJ4g2NhUBlDnW0b1zxNdLBvgyjqpipoh883gJhNR/5Q/5pck4Od8xBr8F?=
 =?us-ascii?Q?PoiIzUqcNapZfokjZd2ffC0Sb482/spbL3T67zDWrkYfoWQlO8xctFLL5L/b?=
 =?us-ascii?Q?DhHPwQH1FgZRp+lx5ZgXK3GFljMKK/d7P91nnDuq5tPYcGfOWVEmhxlPD8xb?=
 =?us-ascii?Q?AKUawbfYvRkVZTDO0ATSoMuY19udSeGzG7cdPhrEqDnq7+x1q4UG+X5IWesu?=
 =?us-ascii?Q?BAF5Ata5AYmbcqGQkNy9r+tPcVZKy9WU0eYrpzB1StwAEy4sbNN+cx0iKOnf?=
 =?us-ascii?Q?knqE70yx4r9nmT5C66nAdAA2qyAvACUr/28Lg43hxXncRGFASDeWx3X40HsQ?=
 =?us-ascii?Q?/p4hA+gZbf8YDvodIc13QM6l5P2H/qjZyYDpo32bpRcQXAzr3zBVRcijfexd?=
 =?us-ascii?Q?PwkSCmFXbd0giUgFymQg4XEfvL9oJLmBsbwC8zUSjNu55OARJnBIMuZJahnH?=
 =?us-ascii?Q?bct2dr0TROKa5b6FFqywnFlG8DHSCBKAeOUSTlzgWlWoo/y0u1NerJ1w6Z0g?=
 =?us-ascii?Q?xd4jzMOp79/KOGQFVhRt32NJN7Ywx6g1BnRPyJMjn11NWz/JN8oxhlrgm0Rc?=
 =?us-ascii?Q?7xEOAdflH+vo2pGgA20uWemU3CjD/afjomyRmkjuKBa4lsPDsd3zeIVFak64?=
 =?us-ascii?Q?EwhmT3IX6d9eKgVPeoaVkt4fYhexU6IQbhqoMNI7ndkL+9n8yS/1iLA2av4a?=
 =?us-ascii?Q?qQm6NXB1fqx3d/IYlFAmHGeKYAONFdKCOcLfC7b+ZAAHrTwv33PWDMEaimnF?=
 =?us-ascii?Q?BZCO6hVXezLKmf5tCT+KTxygJ+btcDgM56lWY9m8v4mU1BiG6p/BTUzBjSEv?=
 =?us-ascii?Q?zBOm+fe4B7088zQscfdks6vlB7u+WJbXf/TfZyPCMLeOfId8jxBFDFRQKDhw?=
 =?us-ascii?Q?VgdaAvckfkFqUelIPMheq20V9SfzxQVGhaoOO6K7qO1vdSPyfqjMyXQhsPhM?=
 =?us-ascii?Q?NnUAUzaTn0OvXpPtfe7WHaJGuxF/6m7qAtG1NlY7LY1aA1XQGA6UDsvUv/0j?=
 =?us-ascii?Q?tw4J0m4be3GLw5aF+A9DwZ6W+TKvYf/m2AFSZytskNHVzG49VWGn6XaePiwo?=
 =?us-ascii?Q?HP1nfP2Hl1webpQ/PRdGkrRXvNRQ+tvKr+w/tfnOBrN6/I4QbETXr494xpKF?=
 =?us-ascii?Q?+MYN+1AdQm8ZX7wQtp8o194qDW9BYPSzII6DD7d6Mm8GP6xUXgnSscqV/47k?=
 =?us-ascii?Q?SiyQ2SkvV8mchq4TI6jYuUF7JDLVjehUBN6Z2rswu9dk/0V1xnxk/b7SGvCC?=
 =?us-ascii?Q?t/dracLtoClAfClOinXZnpiG4b8TzdlAXu6b+XK35G5F4VNFCSf0STNWyNll?=
 =?us-ascii?Q?EyPbYBiUYGejD1q1Y5gGQKY7OOb7UTfb0OXSMdDFcEJGZ5xCKPDMyN6bdX3t?=
 =?us-ascii?Q?j9pZIsVHwtWmmTRGzWeywnQwJ3FjIyg8QUYc65M1ji06hpWK5e3h8LoDErjv?=
 =?us-ascii?Q?thxzLCJ1Oyt4Db6Z9vAaXjBXp2vaxtj8UnncDzNo75kNp3zRU+Z53YuJc1l+?=
 =?us-ascii?Q?oI/MnPw7/A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b695953-5bc8-4f9d-4943-08df4c7a0c9a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:31:59.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ixFhz/cnnHr2h1XZPwQzHSY9dy3zAB4mI+uJgkvqYeQYsDYlMzw8LHUUV/4kVCMKFrcMIxlevF+QtshcUMaAboAI5vwhI0ylBO52m1qfQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251377
Content-Type: text/plain; charset="utf-8"

The patch has been redundant since the libffi 3.8.1 upgrade
as upstream now skips this adjustment when `--libdir`
is explicitly passed, which `autotools.bbclass` always does. [1]

Built target, native, nativesdk, musl and lib32 multilib variants for
qemux86-64/x86/arm/arm64/riscv64; libffi.pc is identical with and
without the patch.

[1] https://github.com/libffi/libffi/commit/d8127bda2811496d5606c56c5ea73b3=
c2e695fc1
    https://github.com/libffi/libffi/pull/1044

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Note:
Change can be applicable on 3.8.1 as well but as I sent upgrade using that =
as base

 .../libffi/libffi/not-win32.patch             | 34 -------------------
 meta/recipes-support/libffi/libffi_3.8.2.bb   |  4 +--
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-support/libffi/libffi/not-win32.patch

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/reci=
pes-support/libffi/libffi/not-win32.patch
deleted file mode 100644
index 880a65d2fe0..00000000000
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc67387ff4383bbf0f77ea6a45779983ca525baf Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 4 Feb 2016 16:22:50 +0000
-Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
-
-libffi's configure assumes that cross-compiled builds are complicated and
-introduces convoluted path manipulation involving gcc search paths to the
-install paths, resulting in paths like -L/usr/lib/../lib/ appearing in
-libffi.pc.  When pkg-config is then used to obtain the linker flags for li=
bffi
-it can't tell that this path is on the default search path and returns
-$SYSROOT/usr/lib/../lib which then gets written all over the target sysroo=
t.
-This then means the sstate can't be shared and triggers QA errors.
-
-As this block is generally pointless, disable it.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2237b05..658b4ae 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -449,7 +449,7 @@ done
-=20
- # These variables are only ever used when we cross-build to X86_WIN32.
- # And we only support this with GCC, so...
--if test "x$GCC" =3D "xyes"; then
-+if false; then
-   if test -n "$with_cross_host" &&
-      test x"$with_cross_host" !=3D x"no"; then
-     toolexecdir=3D'${exec_prefix}'/'$(target_alias)'
diff --git a/meta/recipes-support/libffi/libffi_3.8.2.bb b/meta/recipes-sup=
port/libffi/libffi_3.8.2.bb
index 317bf8d938c..38856266cce 100644
--- a/meta/recipes-support/libffi/libffi_3.8.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.2.bb
@@ -10,9 +10,7 @@ A layer must exist above `libffi' that handles type conve=
rsions for values passe
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5e9a8df556846bb3d1edec0d968a231=
1"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
-           file://not-win32.patch \
-           "
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "a699fda2b090c4b46cb79cf60c4dacfce480eb05742c0de66a=
cf3af174a47f92"
=20
 EXTRA_OECONF =3D "--disable-builddir"
