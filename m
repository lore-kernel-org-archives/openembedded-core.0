Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3051.1794862303739853918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 12:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=upaiePlZ;
 spf=pass (domain: est.tech, ip: 40.107.130.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYdQcZNYPDCpBZPccL/hEs2WtzF+Mf/WqHuq8g5DUNRSM6d9mQ7yC3zykHiRfukQbYkVjShj83Dr49NWLF47yFcGbGLuh+Rht0qK+9zLbKXWKm4+6XIyIL9e8ydxH9LPlGVtXAE//EERzlhgBPSXDwOC85tLM1E/vcwg21vVMJwbi98+lR/GERXtJ5CMmxoJF7UjZ3R5UowdA+Qia8px6Pz2Z0wK/lJqWDcl1HL5Sr+UIrdvf8SwtKksQ0RPw1B4rBuXSXHPuxoj9o7ypFXKa0/yRwRrr2/OF5A56U3KsiKg3cF9yj3w/UXIvzJKshEsZ+bV8YcIu8KVcFxOX8199A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Znepb+YFodh207y8yp3Gv6a1/Rzp9MoxQsitRPy8DLU=;
 b=Qwo9ydHe16nl1b5xwI/uYNf2i4rfGa3pUCdSeuIhnsC14flz1Isp9KAfyJwQfR8ahqbw5X8ZN6SFYcPsZASqv8WGWDV/LqTMRQ6FeUxhroTLmxuEXpPrima8exhuP9I7sbzWu3m8dODHf20xm1Yu4GeWyORb+6ecLABswkG/LSKfSF1ZrB5O08Kq5WFN4u7bZmylm+rXPIJMayEWUv4dvBc8SPebKgrZpn42cel3JOV6KYc+til4QAYpzNoGhXg8EgB2c/QAfXuB/+G8fNwKUQBemO7M4A/uuOeCsMyJZb8UFSW3uqS6NjOXdhF6lGvspCKywFHEmkq0YsvZYLUD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znepb+YFodh207y8yp3Gv6a1/Rzp9MoxQsitRPy8DLU=;
 b=upaiePlZhhwcej1JwUnHEiTB7xk6V4g6TJ1cB2F/daVJt66Uy9NQwJIEEe8lvbyEp0JSNvSwj50guN8Kk9Ptn4r+CjN+sdU9dnzywSmZC6RrEnvr/skW5q7gf8QgRCYu5QmjBYrV3nctOnUT9i9+014tGnU5eGY0taELQtl4TVmOHzXJ/3uKW+fVHrXbuAg2yMGyFPcjp0IlnBdLTF6TjzSwXhgcbmaIYlgzz45e7ak/XoBvbb1CXGPITJ+2vYPFYuteo/NwhTvcMvV/iWIcaouZWvn08YpHsR03y1EzzCbwNcpoaeAXWYtq6IEiIFegre4fEY+dmXB+s+m1SRu+Ug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1871.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:51:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:51:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] glibc: stable 2.44 branch updates to f715e9491c
Date: Mon, 16 Nov 2026 21:51:37 +0100
Message-ID: <20261116205137.11150-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116201143.10766-1-jaipaul.cheernam@est.tech>
References: <20261116201143.10766-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1871:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9bf2d5-858d-4a41-7364-08df44236931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022115727099003|10067099003;
X-Microsoft-Antispam-Message-Info: o5S3dsCZMV2mWhG736H4NlULgo/kuqLXVhC4ZjdHVrASu/kJFRaB+VaarR/gWTQPi7xzctAVZ0IFVLE5MaumYdLmEw+IbaScLHVy2Md1BCBlL2OixwrbCH/Uq5xA6TVaaTsYXDyhOTQWLSujUkY//OFfsWS3BuI0VdKboZvOToMCnXwmyuSMKOnv8oOhmTT/vbiR+B8rqRcbHrAEy4P2Z4g+HIlkEs/TYoxG7ihq8V+TcaMqliAlm6+3/8YgsJNbMIG6I2rXUCBbgjxF/dr5w3Yx3ip67Xxqzm8g527Cx4vitkDdRb+a3Jo+h3ewFI7HiBmpUL4zt3aX+V392Wqy+pgncUA49SlMMBOp71yF9VtnhbBkGS3pg9UbKSysFiMcHE+DIdJJaydCh/JtZUqvm/8ckqNf5uPTdQIZuAXA5Ex6HTNGY1lY4KLENgYrGOOVQUMOefafvVFm9KQQFDuheZtECUCUw8eY9mXGGeiWDQYWK1IkbOdzbObRGjQv+M1I3Moy8LiZgqpK8PgnE41PPwOd66kgsOQH2uSSqSUF5i+OG0ZfuFFDLvnCWlttHhBO3z0Q/0cQI/m4IlYQwuVtHY8EJParU0VtC3TB7qFtcHtPND9vc63unEkhpJ9uGYp8YPeZLGvLAVsruTVk0bNjMzaJPnxO/Aph9dMned/fmow=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022115727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eokjQ1aQtz6jvadIMIoRwOItz2DSVYhH6tOQWI5XGuKEFNvl9+TIjKgLcnQk?=
 =?us-ascii?Q?teSxUSFCiLWrC6FMKEpITSRTiLFyQEd7PPKXYSsObAgPj/uNnr4IYsIWJ7qL?=
 =?us-ascii?Q?LrsPc2waT6AREyjjGbiIloBUy0hqWMvCn6EvSaJcwdTpa+dYzCdqSRFtwy5k?=
 =?us-ascii?Q?lI5egw1Wqc01uGUranpL5bS1JKd9Hx1JifcYAzMMLe6QKvmYj4ZaJ2H9AJhc?=
 =?us-ascii?Q?7r/SI4PiGAP3j0qRwySCRPFkvESLZWxZ/32+CMmZpHRW738Y9zdqtXbkcrj9?=
 =?us-ascii?Q?HbGKL/US8Mjg+a3CVpf2c8yAfio9xwkvtB6uA6xSA77Agg4IWAJZxmGe2gTw?=
 =?us-ascii?Q?KghOsbptrZerBdIkluoLSAjLWoOmGzMYlhqDCTlQT4nDXlZOWic0XzKvZJoK?=
 =?us-ascii?Q?vi8R62pN6pCoBpta2NNaQjC2LsTHF6/THsZ/a3Li5BqR5wecoHoDV21BmNry?=
 =?us-ascii?Q?FXV+7YNKt9RTG/3kWUBHQJdXFYXYODEEP0PAo81DfNn55Nhs5+BMjesf6mPA?=
 =?us-ascii?Q?DuqyhPXUE2qg8M3o7bKX2LvRwLtbtL4HOt/3Ml4mg2MQbbCUTrd0Pn4s62q3?=
 =?us-ascii?Q?9NAQbG0akrn6THoae6qDfgLEIYpfxcnmk8c8WduhuPlxStbbFliJhQCY2e9f?=
 =?us-ascii?Q?4/2asxJgShYUeMjFfI8YTFm7Z5hF51wIICRmAJALShhuLh3QkM9pdd0o5EON?=
 =?us-ascii?Q?1G/+KweXNrHqxeEd3tG6Y0J4G1lTZ4sxxrWMMKtDmTec3TpzZPU/TWSkHw2w?=
 =?us-ascii?Q?POnGLv7BT/vEbQFxnGznKL3sNqcGWSmYoQuvVxNi5ucpB8S0oC3DZ4yp7l92?=
 =?us-ascii?Q?m+72Vwr4OQKbdNar1yOHlHscwBTXvtmVR9uhe2/1quEUlrd/buTY8TtNvOu8?=
 =?us-ascii?Q?F1xMP6JZE1APhAYb9BjpDZ3NHCSiRVvBUTEi2olsdJMQp2WtGFZCz1mDBwAU?=
 =?us-ascii?Q?66MFHYQAJwTQUQ30jAbmHZ5wrCTsKshkGCYKANSQr+ABzkDg2GSC/WGXgp2K?=
 =?us-ascii?Q?F6JmuGCXEYuPENXRcH1EnFLb9kTlTtdE1r3B4zmWdjfYGnNJ6VnJ2Q2yEZqg?=
 =?us-ascii?Q?RHdFHPlx/jXMXRN8JA15hZsJuYiSVRBRqx4mCqTLSeXMB3WUdsBb84xBqHIG?=
 =?us-ascii?Q?HrYZUM/ILwzkIObdIoK2FaPtXotqXeJw8cWKUDX631JVfQ4kRoWTZsAsJcKf?=
 =?us-ascii?Q?Rr0H69mvH+8t1NZBEujzXl5XCp6Gt3Rul4oFDawbguqsxL3Ay7/2FNf8sfEl?=
 =?us-ascii?Q?O8X9T0yU5MQpoWIZnkGAzEDcOHTDTLiwuzCRHmyJOJbJNUHu8epLaqRuOmWh?=
 =?us-ascii?Q?9Vuw/hOZlgoh6qns/saUyq0VUkmsO9j0u2Jg/eFD2liaQb4EwTTv4DERtTWS?=
 =?us-ascii?Q?xO2B3N2wT4W5uCMVxrE65ii+4Gws/3YBKzmiKEczJIraMQFhDCp/qzBj4Asd?=
 =?us-ascii?Q?9oRZjK6nT41mKrzr5dvi+GoJ28kRZT94YQfAiIWTSxKqTE/R3esuMX8pR0PO?=
 =?us-ascii?Q?9GC4p1QWssClySJPfdVp4ubn6GZgTC5bZj3JcNKfdH4Dw5tvgNcL6XJO9nNT?=
 =?us-ascii?Q?TPoOMuTa7pzrcY7Cpf56yuKNbjkQz8vlTm/JmCypJ2g2xJrF3E2rfwrUmyUd?=
 =?us-ascii?Q?StIK+tGWy1/zUE/kff5JDyClk05yK+1qoFidegVVsv/BKaYPER1PrZ4kPXy9?=
 =?us-ascii?Q?T5iShcOJqZFSLkSFUlEsYkxVxrBXOh/rERUMnRSmAR3gRgjrGN1KBuI9a4Tl?=
 =?us-ascii?Q?5CnjOrfLMw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9bf2d5-858d-4a41-7364-08df44236931
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:51:39.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJHUtp+bSfplip8lWDVZxb9ST3nRSjRXrrINOHk+8XnG6tX1OZINw0rFArqwql6lYstQ+uWdJzYOLz3jwdyucZVuQLTZ5NvPqBdGHAnmYEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 20:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250375
Content-Type: text/plain; charset="utf-8"

Including fixes for the following CVEs:

CVE-2026-84243 CVE-2026-100290 CVE-2026-115819

git log --oneline 34106fee6...f715e9491c
f715e9491c (HEAD, origin/release/2.44/master) Add a few BZ entries to NEWS
063fdd4c7e stdio-common: Fix double null terminator in wide scanf %s and %[=
 (BZ 34989, CVE-2026-115819)
fcfb867c58 posix: Fix double free after allocation failure in regcomp and r=
egexec (BZ 34991, CVE-2026-100290)
438677ef49 intl: Restrict path traversal when using LANGUAGE env var [BZ #1=
7142, CVE-2026-84243]
48fa38b921 AArch64: Fix libmvec archive member collisions [BZ #34946]
47e2b57041 io: Fix silent readdir failures in ftw/nftw (BZ 33085)
c5c6fc6f44 elf: Set the library path for tst-ptrguard-static-dlopen (BZ 349=
66)
a0b0ef791e aarch64: Fix SVE tanf mixed-lane results [BZ #34922]
71eeab669c aarch64: Fix SVE log1pf special case results [BZ #34940]
f1bbb002b4 aarch64: Fix SVE log1p helper mixed-lane shortcut [BZ #34923]
21442dba0d linux: Add C++ and multiple inclusion guards to sys/pidfd.h (BZ =
34752)
b9b1e925b6 AArch64: Preserve SVE pow/powf base magnitude across lanes [BZ #=
34921]
27fd010255 AArch64: Fix SVE pow and powf negative-base predication [BZ #349=
20]
a527fd2510 tests: elf: Fix flaky thp tests
534e36bbf7 io: Reject fts_open root arguments longer than USHRT_MAX (BZ 347=
82)
d1e132966e io: Fix fts_pathlen overflow for paths longer than USHRT_MAX (BZ=
 34782)
42c8bd03fb io: Fix fts_set FTS_FOLLOW in a physical walk (BZ 34775)
eb288d8cef io: Fix fts FTS_CWDFD return from a followed directory (BZ 34781=
)
5a068df1b6 configure: Fix have-no-error-execstack substitution
00f6968bbd aarch64: Return with ret from the la_pltexit path of _dl_runtime=
_profile
6b0445bd0b Makefile.in: Run the build directory goals serially (BZ 34699)
fb9f408983 x86: Bound Hygon non-temporal threshold [BZ #34875]
045c51476c linux: Do not return stack garbage in sparc tcgetattr c_cc [BZ #=
34734]

Testing Results:
             Before    After    Diff
PASS         6634      6634       0
FAIL         141       147       +6
XFAIL        16        16         0
UNSUPPORTED  606       607       +1

Changes in testcases:

testcase-name                             before  after
io/tst-fts-bz34782(new)                     -     PASS
io/tst-fts-bz34782-root(new)                -     PASS
io/tst-fts-cwdfd-follow(new)                -     PASS
io/tst-fts-follow(new)                      -     PASS
io/tst-ftw-bz33085(new)                     -     UNSUPPORTED
stdio-common/tst-wscanf-nul(new)            -     PASS
termios/tst-tcgetattr-stack(new)            -     PASS
stdio-common/tst-vfscanf-bz34008            FAIL  PASS
stdlib/tst-getenv-signal                    FAIL  PASS

malloc/*-malloc-check tests are flaky under QEMU user-mode and flip
in both directions between runs (14 PASS->FAIL, 6 FAIL->PASS this run,
net -8 reflected in the FAIL delta above). No malloc code paths relevant
to these were changed in this uplift;

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
- Upstream added new commit to 2.44 relase (Add a few BZ entries to NEWS)
  No change in source code, so didn't re-run tests

 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.44.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 2fb355a29b..0971422e4a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.44/master"
 PV =3D "2.44+git"
-SRCREV_glibc ?=3D "34106fee698c83eb0af71d4d0381e66b399be746"
+SRCREV_glibc ?=3D "f715e9491c062bbb50d32ccb05a8debc488dda39"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glib=
c/glibc_2.44.bb
index 886a15f157..c3400d9845 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -24,6 +24,7 @@ CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "\
     CVE-2026-5435 CVE-2026-19542 CVE-2026-18374 CVE-2026-19499 CVE-2026-77=
117 CVE-2026-80489 \
     CVE-2026-8674 CVE-2026-86805 CVE-2026-89092 CVE-2026-95818 CVE-2026-97=
399 \
+    CVE-2026-84243 CVE-2026-100290 CVE-2026-115819 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20
