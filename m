Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2211.1794859910850761476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 12:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ytz/UYn2;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFCINpXcJUkggAGKtsZNQAWuinV9ZzrbxgwocFLxmzpsfcnJ8/0qgu3z5qLS2c92VRMKcKkHo4HMepNxq9/WoehK0D/t66Qf1YsAvL6seGT/6NQzdp6n0nIubxtVolPDk93q3XJWrwAHWD1cHI6gAKzpKMAiABoyD9OBAH8qQxtLAE1Qf45orHXiUlk9RfXLhNC0HB80izADnAy7GhDNMO7NtXwKTPRX3wdlhXKXz4j4vVUXrRp9vQRvC8Co7mCT3GQw/ZDOpAJPeTUmrvA0Q5DHs7tXEZ8bG6LwVXF/pQNswt/nHoxTzTn8ocQ4i8EvLKUoq53b8CzIiKYw4knRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn9kF+ns74YUIPi4fN4P5PUgVbz2XrnpwXEtD92rLfA=;
 b=vubpmofMyGVqhiIWsWucKRiz1M+Ld2qX+R6m9+RQc4TUAOj9S4l4cPNCdYb7AMLSnEN7oCh5NsVFPzZGR2E0hX1GGMg37IIC5zNFK3grGZFzVQX7oo0JHuzUffJHrxXNjpTl0LYvTu9cYkv/JcVyKTqMk1UBhb1Qr56+o7rxBE4BqXtqRdVE8G5gcVRjtmUP4XNapG0KlLIWGH9kAzuSM+XACN/8fGx0HXyGSt4Jogrgrh6wzxZFn5v7ZYtMy4dmaL/uYp7fCDHBknlW8Ewoqo7twOI7hyR7AWcFTVNtCjEMtV6OUYNgNsEBs9XRtXkmfJC6LigKTsR2Fn7pZs1DuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn9kF+ns74YUIPi4fN4P5PUgVbz2XrnpwXEtD92rLfA=;
 b=ytz/UYn26NWm6DLjuN1VBInLCGmzc48woo3Bs9a/kNBJihZ/SFhh8UhqjjB3mYOlNC0JckqcNXak0GY8zEmCmLy9N0SvhlktvnDG/NzRVtvxTNgF3RXRhqX+4DhWa72p0VFvxur1Yzc/qM9U6rRRX6I3EvOGm1MuHpM+CqjKzIuxqbdqwCaOncGVJETr2ywJEGJzC+nGtsT9S5YU1nL4Z13S2W5tbUzN+J3fvG5er+lR3KZEylrB/zsNV9GR6lSQlerG5Hcbd1qBjXICofMvuxyHmCFmbTBOEq5z4T8HtcU6Pqwfqwn4eRUDl/UWDeYL6uHSlzSlLKbOBszbAoRYmw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1069.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 20:11:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:11:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: stable 2.44 branch updates to 063fdd4c7e
Date: Mon, 16 Nov 2026 21:11:43 +0100
Message-ID: <20261116201143.10766-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1069:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6c05ae-ba0c-4b12-5d19-08df441dd67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|261026140227099003|10067099003|11063799006|261021121427099003|56012099006|261009221227099003|261022105027099003|261022115727099003|261009221727099003|261009223327099003|261009220027099003|261102123227099003|261028144727099003|261021123027099003|261026121527099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ATk7gi3/8fnR1mEX6ylaVLLPEQUQs/nU4/mx9K0TAq+r1iXQUpxiWrgEwMt5ZVlHxrcI9Ap07+FABIa16B3QzmLTk63UNDYxfq30dSLMGw7/FEORFosB2dd0d4VfyrRw60SvwP7Q8c97LRO/a63B1d1s0Uv28Ae7i4r/T9IXW9dhQApnkwy8glRrpBvxslZh21lQEm+fqSBQZ016tV87LsJYjirl4u3Hl9/hkREKyI0gFOxTj/mZ/m+NjDFi15yc612G588PpGIsmwWEEpD/V9wTL0lSkCIXItcM67slJQeIRPVEoSh35BJSocz/tXEsT73Dp310XAprqPjWtwmYLNYqwV/u8UNTBcY5y3hceZg2Mf//UI3mf1Hj+OAkfSDjwrI82bPfZd1EJyS0AEZC6dwFEE2fT6Jr86WRPviglCSw63BGeq7CNFZNEWsi50pLElPkoUHO07lEU8x96EjiJ66oC4Y8B69Yg1nafvLlijCfl9XIo7Zf/agzslW9mkuQ+QunxM8QTG45u1TJCKkZyrl9gm/jBBBiwbN4HS4SR1UqbEHqMI9FCbBSaS5R70ezdpmGcGXY6ETSWo0DMYi9+FwL4R0jB70ujnIMfoxKfyHsTdrgqxwusMFWv/+/4BAWd6KTFEfxYiehC2T7F/fMeq+4x/NTJ6dMMOFs08VlMyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(261026140227099003)(10067099003)(11063799006)(261021121427099003)(56012099006)(261009221227099003)(261022105027099003)(261022115727099003)(261009221727099003)(261009223327099003)(261009220027099003)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1eCZTCKjEfr4rY/B3jUS6nL/LzdlNh6W/ANRrYGBRrdza3xWQx+8+UK9GQzM?=
 =?us-ascii?Q?yLYmkiCqnmSpyafRQceogvq0fdfILshm6EnEpNjUEnkzlUElk/7h0eCLO4LL?=
 =?us-ascii?Q?po9e+7UqXeJeJjawBsAk+3SEyPq/Ew8OFBibfBYujSBoeInABd+1qyvwhMsR?=
 =?us-ascii?Q?/6xNqoAqguQKtvoJ7+6nmAL1wMuiuK9bSgPn3jfX2roowzTQB+83tNLIMQAW?=
 =?us-ascii?Q?Y0IHh6fWEa6rMFGi6u3Fc5J4HxdvBLeMKE3omIE6D0T/rhf9kLvnxMvJyKOx?=
 =?us-ascii?Q?dJcheCBUZ9IT3LHpsH92hqGgSOPOopKmeoX0mVauSDdIEfSgSoD3YSJZIG6w?=
 =?us-ascii?Q?R+fXJkWaa7V+Th5BpfzUp9rlvo3mYiwokHkVo268OtCsuY2WBzsOB6sucQ6d?=
 =?us-ascii?Q?Q+sFNlvECrMEQLtvs6P6a8N2wriv13gNso0OtnqbIZrHimbGpr/zhU07lYBK?=
 =?us-ascii?Q?aaQsDIH5thulsj33HwoQ/SK5HOQZRlidVds64uVnyQ8CDctNrt0CFfdcAPXX?=
 =?us-ascii?Q?9lPs5P7pAaIDyuVaH397pjCCiL3I2sPbvyQeacWhtY5NNh+UZhW5p45RE3WF?=
 =?us-ascii?Q?j0wWTxhlm7b/jRdvzyKQcHLg+Wbyd7pJsjQ3j9u7X14+kgabTNkhy2fL6s2q?=
 =?us-ascii?Q?TZYP26jxB5ul4C5WajLGXtRmCHJBOnyP3nQrhkYDpCj8G9KHEUCIVop+WY6g?=
 =?us-ascii?Q?AncqkzLo0jP4o8cBm18Qk1xqo3JLcq/zQnEMh+OOLj8jYYCU5PaRP3QNLG0L?=
 =?us-ascii?Q?7w5pMVwS+r0U5Qm3YVzlcZH/yvkEtouI58jieQKaJmwBBcdr/fqbU1tUSZfK?=
 =?us-ascii?Q?c7E5vw7qRal9/IEabiMWtdiughDK5UA/wSvUMI1hA9OOo/ohEAunZDtCaJ9G?=
 =?us-ascii?Q?IO0t42e3cttr+ExZfIcjLABAfxczLox5gWNXhOs03Y0mSyWsEGztc+5G8G+y?=
 =?us-ascii?Q?XiW9eJJONKzZMtwhAozcx/x9rxsITToKHLvzc5hpCZhngzfyNMFFDYqZgve+?=
 =?us-ascii?Q?zkw1+aAG2zIfsTcrlIyp/cWTn32j7KaCANx20HeJTsTjw/2r8Pr50KfQALlg?=
 =?us-ascii?Q?jgS89aGwrHql4NKKVQXR119J2r5U7HEcM22A62HrHw+Yhimy78xiJ0RqK7u+?=
 =?us-ascii?Q?Ndz5G+lmeD8HOtvRV4kraChAL5i6mQ+L4c+UpLUrbxOTDPlQamWMGYXK2OkV?=
 =?us-ascii?Q?+UTFfXjXvdhqqg+4fq+mN7eElsLpW3vMbiinA/hLuwKSHc2BMeT5hjnNtA8T?=
 =?us-ascii?Q?7pACxn7ODIO19PvScOxvFL2OUkKAxP6z0qre6x7RHNxz9dNPwullEfUhxPcl?=
 =?us-ascii?Q?hH6I/rn8VwHTLZ5Js0aziQcrUj/TrSpwYrmFqe0qod+Rc87BU31GnuT5yXaA?=
 =?us-ascii?Q?yFHHXguocxb54JPAuh4eYhgmJXB/2i0kWluAZlANZcZ914O4LB56hbmQwgB/?=
 =?us-ascii?Q?zHizkbinTM5ByTg6gI1j0sb3ZiD8dFNsXP2M/g9FDTAx99DRBOE0Z/P0Jk9i?=
 =?us-ascii?Q?3MsH8VC26Ow0UhHLSz1hHWlYbiLIVlcAjl7BcmGuuolv3ibc0zrOFcTy3VeD?=
 =?us-ascii?Q?67oeUBKcpBU8OWYqiTi4v86Y+z88SrIiSnMxKljKM1qYu+SQkBPzYWibN7Qd?=
 =?us-ascii?Q?rGDfiGNoSZ7E+rzvsQ1r8AL6Ypth4nd6z55rx8nv8B54kB8uVbT5IYpYBIbC?=
 =?us-ascii?Q?b3wJ2UGbl6cAfGQVNIPNqd/27HPy940ipeHgvSMWAFsOnJtTYGNxapDqUqHG?=
 =?us-ascii?Q?wJclY/8enBOz2sj/yeP9qdnLq8wGxt8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6c05ae-ba0c-4b12-5d19-08df441dd67b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:11:45.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZalOutzoemlXutkj46wHnRjfK+DO43dTNTELyDsY+qs4EB8E951+6vU4vqLuOOqj7qkoJTOSHFj4HTNtPLDNHes4gk4PZpW2muGUCkIX18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 20:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250373
Content-Type: text/plain; charset="utf-8"

Including fixes for the following CVEs:

CVE-2026-84243 CVE-2026-100290 CVE-2026-115819

git log --oneline 34106fee698c83eb0af71d4d0381e66b399be746..063fdd4c7e034df=
c1a0f14dbf3a9718a502033cf
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
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.44.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 2fb355a29b..2205ca0829 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.44/master"
 PV =3D "2.44+git"
-SRCREV_glibc ?=3D "34106fee698c83eb0af71d4d0381e66b399be746"
+SRCREV_glibc ?=3D "063fdd4c7e034dfc1a0f14dbf3a9718a502033cf"
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
