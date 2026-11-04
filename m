Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7204.1793792308801507545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U/bYz8jr;
 spf=pass (domain: est.tech, ip: 40.107.130.37, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HELIBSWEsNsRowAiLtX6aTWVgxNdZ0+gbi+NLWZVwZ8Frl5QExDam5roxfR9UTSRPUgj2tV5Aon02ziCSx1TzOmSyDSyx6ZNy+8xyl5FEQnprhCIPnKKV20lfGJ1Nwm6wzmZX6Pz6+kc67/gM6Lfmjm2Wyf4/AYa9tX+q+FGtVrpf/ejDLaPX5AbFvCizQDLuFFcvK0tUL5tuQBnC3JxfYtVAiIY2nJPgR7EeuODJzJbzs173+l+c9E6utqzz9UWRr4Or2Vw2PaneL1SHy5BYUNQWjTgSWnzx3VJxqkz5vXTJVfuoqEKE91INrWdA1vgSCptd0Ylop2L067WUE9VDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPWT7uphGygta02mpI0G5EL9fOWWDD5VkfySgqHx3Xs=;
 b=tQDnlEshfCA1wmt+zqL6bmPGTsuoOgb2NG+KZDFqkV+xbdAGi17zWrR2C1N/2h48Zck4q7Z97nH4uiWH9VSgcLCz5esTKrG6q0rQV53XIfaO/EwPMzKGayxzhr9XyGyS485DKRz2p7gmoarL8vsazDpqPy81Hg4scK9vkQq50qw7/vkXyWgE3JRbBs6II78wqsCx9y7Cpns1ATNciW4ZIDASYRDmvR2sXeBU0R9imQqQy2y+9e4drIf+BgviybzSm9gnzPLtbUzZBYF8blFG/qEq1qVtlPZl5mz4vQ52VPCsP+gyrlFHrZbK7KtVJ8j5mC3FBwzvV+nuMv/PMn38QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPWT7uphGygta02mpI0G5EL9fOWWDD5VkfySgqHx3Xs=;
 b=U/bYz8jruwd1mKiPvkrNCCCH8QQ766HA46XbHC5T9MOL3wgudDvWJqH+fQL3UD8+VfEnTYYUNXRvsF4vn52mhaGdoKGFHdqXN82eyXp8QTalYICmajOh1V637s1oQ4vZ1WSaZcWwJTD3ZQyrGtI8CfIuFZfQRM3thSKD5Mc22UDzmD9XyiCNUCA4tM6+9Du4h7G+Ms+8FTbaH3B06cuC4nWmKocd5k0H5JfD1QxH6m/5DbQ3HvQjiBfqj9C3jdcuxDeL6+pJ7yfLjY00tdlHcSHFJvLZbXfbl5b2EyXmU50ff4aSQXwnaYbMGM+lbwq1QN4NR7YGDyrNewJdFT/kGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0698.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:38:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:38:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] rsync: upgrade 3.5.1 -> 3.5.2
Date: Wed,  4 Nov 2026 12:38:20 +0100
Message-ID: <20261104113822.45520-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
References: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0698:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e07117-0051-468d-747b-08df3a682386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|5023799004|56012099006|261021121427099003|261021123027099003|261009223027099003|261021135927099003|261022075727099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|12006099003|25016099003|22082099003|18002099003|29003799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: /V0qmC4ZXcHY+hP5J3vnH4X9yklN7RIXrjP3VGf3URb+G03Ocv/0v0BcLttIG8K1EXhj02vtjBuB5Gn3nmvEepwmy09lhOnKC77MyEOzS38Hw2TrkwuoERv1cQDbO2htHoUyyNVZk9y+o9rbZ6VtYsIg0FOLZk/bnxvSz9aztuOxJBO2EI4aYSUn9wy6Wj9+z5CIM6P9qKGoZMeFxZefdD5kl4YB947pkS7BidF9yxVoXDxs3ozvqHCBaHs3d13VDCCRu7tjVUOUiFqI86hQ/OnYmrYNkKQ9FMXeqeY9slJ5ItETsha7Xa7aEsZrPZye7i/w8qFlb9ZbPeUfAbJneMq7boYSWzbt0Ilqh7DXwfT40lUJw9aY3CMZnmxdJFMkcxD2aSdUHz7AFZUqy7Vv2tzKDLKqVep+swcq2zRaSW2K5mepotxE/Gg1JSa6V1zvWY+LPZjzhs/CAVLEiBlXjXPgcP6MvyF0j+ZdbA7OIrshe4B7jabT7eWSScV/OBZBMtP0murxMc12xsLXeNXOvJU44qcYq6SJlNRfHYUzghnLI0OyGR/FrBiwGGdZCzy0OMrb6KnT+WOoQVSr+kICl0yKbkpPFkMVKfiwF10MM4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261021135927099003)(261022075727099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(12006099003)(25016099003)(22082099003)(18002099003)(29003799003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTL6G9rBokElXuDp4uueJyrqukWOR4vtGQ3GxdvC9KtdqhF3n3gDr++AGoJq?=
 =?us-ascii?Q?u6e9ix+k8AO4ne2KlAGgstmtA1Ttx+QDHXnn7svi2n8ZPYLkfvRvW1judmV9?=
 =?us-ascii?Q?XBy/9Hl94yIqDHztvgmLbvJbXb65dE3/5PKUl1kGfFH+jObX0ONRGkmfUdKm?=
 =?us-ascii?Q?m2zDxAERnSRljiBDjFlUT/rpToQWxvcRys0/973y6LVwQnFY7sIot4l+bzqN?=
 =?us-ascii?Q?/rMnQpUklJkzJQHeffEctwMozUiB50g+lm2m7388fx24ltpqwqLzNl821y0r?=
 =?us-ascii?Q?eD+3nBMz3wWV9vRLexZMN+9XZ2mHanqDJBWfgZap2FdyZRXBS1PqWBrfEKEf?=
 =?us-ascii?Q?/QG3HlGddVgTC3B2ijdmkcvux7RnOfvmSfb4I25028R1sSegTRflsbuGFaB/?=
 =?us-ascii?Q?WLJ85fUxeL62JohXTzz6sVj5OoNMyuX0tyPsYexMWzSWUon2oowEXYdeNWCc?=
 =?us-ascii?Q?7VgiLGdJsVEOWpFcui/DcaJjccheDpe+ZdgLWXxWnfNHhX1aO9yr0UfOn+PF?=
 =?us-ascii?Q?72jtoDVVJ3d9eM7jLqECsxelk8kUIXXx1FkSseANsp5zpkD6V9cN1eRAezzl?=
 =?us-ascii?Q?NOU38XbctCSAzPimihffYLfHjrjG6Ngtdg0eF43r3dKoPCmftpRRJdeDD1nP?=
 =?us-ascii?Q?hyfJV+ZYaHG1sW043wGUi+T07LqQwN1ygQAOX9AKRoHu5SDgXUGWzC50FCjJ?=
 =?us-ascii?Q?eROlHGQw9URB8kJEmanGmJGYNFjjvn0tE2bSp7XZXGF+gXmiOWiPHrgZKo20?=
 =?us-ascii?Q?l+VBLd8arALq3rQP3CVgvazLZqVDkuCEb7fURKXYjiGJCfHvpO4iro6jN4fA?=
 =?us-ascii?Q?3IbL0Mbw5NuqU1k2KkZi975Eoh4TO30MdftVxb5swGAxHPGEj9LjTYCdOuWs?=
 =?us-ascii?Q?VmwLxlN0fLm+07rvtLLNCIDcmAffXWOS0vFA8bD+2Grb3FnuveOcNyWfl8jY?=
 =?us-ascii?Q?QLIZDGJg0q84fQffgu1b3sfyQAK7ywAeCNMCybDqcbgn0Wj7JG2rfzc47nQv?=
 =?us-ascii?Q?xlxjh5co4Mt/draOj3aHbo4RF2h4vJYMt83QN4vqF3VLf1OMpy+fDG/WnE+5?=
 =?us-ascii?Q?aIQ3tOpuPinS+tXuQH1oVvXA9+grLGaCGJQ4Uc0JV7Brav9xVbuQ+YfWq/R7?=
 =?us-ascii?Q?uiLU0dqlHplBATqNiwWqCi+0SP8SwEz1mYJxKr8DiSaSkSds6O4YwEcWM0O9?=
 =?us-ascii?Q?QhbtDC8pmRinidpzuJpAP+m3UiYErbfSKW+0lh0Z4lhx7aB0arTS7Bb9+Kgd?=
 =?us-ascii?Q?Gp4UQV4+hir86TcU7XvLkffDI/rtWKJF6XX+Xn48RfUGYQVSrDLlkeKnpAlu?=
 =?us-ascii?Q?/+LA9yw5g1pQB0hi3sbED3mJck2/5ctq9QDeqfJwbSlme2wae4kMNfOBOBcV?=
 =?us-ascii?Q?68l5DPDDNuDFtjlUeEWzo3zuVdL3UK4g43GWnL2MOcaw9jn8+DlcJuY8vY4d?=
 =?us-ascii?Q?VUQqewbwZQNYhjaghtqaTd+f2hISGH4fjHxKBjirjbfRhF8FOGjzPlydEKqP?=
 =?us-ascii?Q?0iEdy4XhQLwzWa6ID3ccvA3I5ko98sbF4KIXJwoJkcJVZ9F4tkqWeEeatru8?=
 =?us-ascii?Q?VqTFnXrqWKUN/IKuyIUOJJg0H+Uf0XKl9sDyHKIqRxEhP8hPeZI6lKZNfO2K?=
 =?us-ascii?Q?6P2HxYkHRjSw1QITYES8vt+k+iJ8WVSXpTMFU4XUSM2TskTmH5HV+HWpgZd8?=
 =?us-ascii?Q?6ml7wtWrvWEi91QzV1DfH2pF7luJD+qje/sD+Xv2zC85FRZw8FJFOLh05TLU?=
 =?us-ascii?Q?7cGGU2sXAA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e07117-0051-468d-747b-08df3a682386
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:38:25.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3spYjXpjE8QK8IQ1bfc71Z9b1x561JIbBSHXhDrC0YD9CC4gq7HWS602N36Cp+rgZoLBgyeg1FuiDY6S56Qlah0IYgeiBXCi2Y/lN9X1tb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249368
Content-Type: text/plain; charset="utf-8"

NEWS: https://download.samba.org/pub/rsync/NEWS#3.5.2

- Fixed interrupted `--append` and `--inplace` transfers writing the final
  256 KiB buffer twice. An interrupted destination now remains a clean pref=
ix
  which the next transfer can resume or repair.
- Fixed uploads through `rrsync` when the destination file already exists.
  Existing files are now reached beneath a pinned parent directory instead =
of
  being passed as an unwritable `/proc/self/fd/N` destination.
- Fixed poor matching performance on large sparse and repeated-block files
  when duplicate checksum chains exhausted the search limit. Valid basis
  blocks are no longer hidden behind duplicate entries.
- Bounded strong-checksum work when a malicious receiver supplies weak
  checksums that collide with consecutive rolling windows
  (CVE-2026-119741).
- Prevented the `--inplace` matcher from advancing its aligned basis index
  beyond the available checksum entries. This avoids signed overflow on lar=
ge
  source files when the peer supplies a small block count.
- Recovered from failed hard-link creation without aborting or hanging the
  generator. Remaining members fall back to a fresh hard-link group when th=
e
  original destination inode cannot accept another link.
- Prevented an out-of-bounds write while invalidating a sender checksum aft=
er
  a file read error when the negotiated checksum length is zero.
- Fixed a daemon receiver stack overflow when queued deletion output reache=
d
  `--max-alloc`. Quiet daemon transfers no longer queue deletion messages
  unless the client requested them.
- Fixed a `--files-from` pull from a subdirectory of a daemon module, which
  read each listed file from the module root instead.  It could send, and w=
ith
  `--remove-source-files` delete, a same-named file the module's filter
  excludes.
- Fixed password files whose first line is empty. The parser no longer skip=
s
  the empty line and uses a later password.
- Escaped terminal control characters in filenames and diagnostics written =
to
  standard output, standard error and log files while preserving printable
  text in the active locale.
- Preserved Cygwin and MSYS2 UNC roots during ownership-checked path walks.
- Restored daemon startup from accepted named Unix sockets on standard inpu=
t,
  including filesystem and Linux abstract sockets used for socket activatio=
n.
  Unnamed local socket pairs remain non-daemon channels.
- Fixed forward-DNS hostname entries in daemon `hosts allow` and `hosts den=
y`
  lists for IPv6 peers. Address comparison is now binary and family-aware.
- Preserved Unix symlink permissions on systems which require `fchmodat()` =
to
  change the mode of a symlink rather than its target.
- Restored builds on systems without `O_CLOEXEC` or `O_DIRECTORY`, includin=
g
  Solaris 10.

- Added `--nice` to adjust CPU and I/O scheduling priorities for local and
  remote rsync processes. Daemon clients and rrsync cannot raise server-sid=
e
  priorities.
- Human-readable output now uses dynamic precision to show three significan=
t
  digits and appends `i` to binary unit suffixes. `--progress` uses the sam=
e
  formatter for transfer rates and labels byte counts and rates with `B` an=
d
  `B/s`. Example output includes `46.7M`, `48.8Mi`, `782,448B` and
  `113,295B/s`. File-list, created-directory and skipped-deletion counts al=
so
  use thousands separators.
- Added `--delay-symlinks` to defer creating new and changed symlinks until
  other transferred files are in place. It implies `--no-inc-recursive` and
  requires protocol 29 or newer with support on the receiving side. It cann=
ot
  be combined with `--remove-source-files`, `--hard-links`, `--compare-dest=
`,
  `--copy-dest` or `--link-dest`.

---------------------------------------------------------------------------=
---
| 04 Nov 2026  | 3.5.2  |                  | 33          |

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.5.1.bb =3D> rsync_3.5.2.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.5.1.bb =3D> rsync_3.5.2.bb} (9=
7%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-=
to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add=
-missing-prototypes-to-function-declarations.patch
index 1f1fc3f3b3..9f271fa6e2 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-func=
tion-declarations.patch
@@ -1,4 +1,4 @@
-From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
+From 5db6185e95929b7edc665b5f029ffd6a6f900eb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,10 +50,10 @@ index 7476f6a..b939a0c 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index 889b57b..19e5e98 100644
+index bf30df9..7da831b 100644
 --- a/log.c
 +++ b/log.c
-@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
+@@ -147,7 +147,7 @@ static void logit(int priority, const char *buf)
  	}
  }
 =20
@@ -63,7 +63,7 @@ index 889b57b..19e5e98 100644
  	int options =3D LOG_PID;
 =20
 diff --git a/main.c b/main.c
-index ed6e554..b5f9448 100644
+index 63c35a1..2d0c165 100644
 --- a/main.c
 +++ b/main.c
 @@ -250,7 +250,7 @@ void read_del_stats(int f)
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recip=
es-devtools/rsync/files/determism.patch
index 890275f6d7..8883f9ffab 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
+From 637d3e6dd6414c89b3a0e96eccbb8b37d179acec Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf83=
3a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
=20
 diff --git a/Makefile.in b/Makefile.in
-index de24949..bb9bb27 100644
+index 9de687e..44a8ee6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -28,6 +28,11 @@ MKDIR_P=3D@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/=
meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 59255d15e7..4734f2c7c4 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
+From 79b3194efff7e55ae9d0fadc40d45bec4bd37ea7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 716171d..de24949 100644
+index 3a5d509..9de687e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
+@@ -306,60 +306,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
 =20
diff --git a/meta/recipes-devtools/rsync/rsync_3.5.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.5.2.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.5.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.2.bb
index 6b121ab1a8..299b444898 100644
--- a/meta/recipes-devtools/rsync/rsync_3.5.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.pat=
ch \
            "
-SRC_URI[sha256sum] =3D "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d=
63724d25c37bef"
+SRC_URI[sha256sum] =3D "a10d591825251e070f74c98df3daad195def4ed81b4a2de161=
69026aea33f6c8"
=20
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
