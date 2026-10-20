Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1341.1792476639174107572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 23:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=J/BO8k2w;
 spf=pass (domain: est.tech, ip: 52.101.66.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SV4RNmwpvB7838WQWIQJTtQVlGtKjUqjyTnOaa1r2DqGOGJmhtzcGWFH7hNva5Rvj7FS9tL0q/7s6fN2MbLnbI5D6Hrzu5zpUgVoZC9k+qQakLxAjdC5gN2uEKsl0wWopAESYB3OYBDQA7ylrlce1gTirgsekrUNCo3UwkklUTXBXR4mhlPMYjG//w5sf/S5MI51ofxwgpXMaR/PlGfqMSJxP509r+JcYeHaEhjspcUheziCSqG1IXZeUlBwrTbtMjaZdWYlcZVou0w95F8JsxvHokt9RwUk1fYiMP6FGLnOxSG5qO1Fq3fodZP/GLLAtVbn7dRVMaYoScVeKJeZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrwiKjJcoCMsAh4undNG75po9htjCiB+0dV7iueel/Y=;
 b=QDbxqyjjfNMeD2HYrVpDbRwjop1tTz7TYZTfmX/tPuyOr8+uVO/QRLVnRUsz9w+NUN8YdHByxoy7fIjOd81SwV4vFBOzw5DCJ/eMP/eYN+ZYynkCvygMtJRzao2C/TGO5Kbl/LX2+mBaQV6kRMz11YVl1uO9xUOBOA6tQtrV6k7yMiPxZrCBHV7DNrB63Z1RlxgV4GXJ8tnj4UMfDSUhLoFC/mtCjPF32sg+XYIVBO3IspGIhuMN+1lqsaDNI28pKaFDnGlBRH/L2bTHeuhnX1iP95woiDiEaRZgptOERE0uUKZ11XgsrSKaxvgxm0kW0QQKRNKFB394uZfczX23UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrwiKjJcoCMsAh4undNG75po9htjCiB+0dV7iueel/Y=;
 b=J/BO8k2wFzn/tTQg/8CtuSRTS+92V5+kXaeDYbsljmEaxxTl2TsIMATAVOnRqsg+wOtfFzRMRsok46u9ttJwQqTwUXKfFIzX+XPyWovq5wQR4qo2G5Ehy826wGeXw2vX/IB+k4jc80xZI7Gsm3WPl+/KRxv7qNSR2pHSL/flSXGm+LcNpzDrwsOBhlVm2AF6f7Cye+9zvaulJF8dHSauzpEScxF9Jc23kegrO+vYH0Se+3d7EWk0cWfsJR0dZqERJqJ5fdSuyXXt1oruJboTj+y4dKI1IpVcJzwG1j5/ZCYSz5ydOuNv0aUYevhg7o1JC0+8AmhJEo9EH5nuYa5cKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3628.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 06:10:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 06:10:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] libarchive: upgrade 3.8.9 -> 3.8.10
Date: Tue, 20 Oct 2026 08:10:31 +0200
Message-ID: <20261020061031.82332-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020061031.82332-1-jaipaul.cheernam@est.tech>
References: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
 <20261020061031.82332-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0345.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::28) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3628:EE_
X-MS-Office365-Filtering-Correlation-Id: f673f49e-080f-4ea0-c5ba-08df2e70dae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|261009221727099003|56012099006|10067099003|6133799003|29003799003|25016099003|12006099003|22082099003|18002099003|13003099007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: AnTxnxhs8FsPTSONQSU2yDY5IDgTXccRfVrqGlWdu947GbFw9DjixppiWxOgTuG+SNmOLvzMyghLz9sXMa/eFxdNfSd3oVDmVZ/BzRL2pOKPvXUpUUNqPw9pJcx9ZdrxULJdOdwjGfERL4lUj89UwzgA3YhA+RXu+zgkMCcmDexzcD9EkTDGiVHIsX4qJ5QivUSF+m1qGlEtopDteXisNQ6LWGdwy147ECZprAQ9ZyV3s2I48kY7EcNkJzn75pXvvhxJBq9J7eVLhqz/SSph61TLBrOnZneOi50vIVheOTCyE503GKDBU1Vrqxm7xsAD4g8/TPt3m/o4qR+vUsVVEi35XvHNzvEXCOIbRiaX71p70d4KU5BGaQuF/ILCj4eRSjfWGeg8YPG1eaG1b81tifz05KwFQr+GkjpKc09TMDfcIgLb+BcgJuwWCFSTZf9c3G84KdqO2IC/F7JIC+RWAAn9nmORWDx9vEoebKFwcSRbgbwi6WJFYHbVaUhg7Ktv0HaMtVPq4GnRZ8srh7CD+JpkzsFyN767+dg2OwfNo6YywkomdPaOZ6VvejguLXmoNtclKKuEthhMlMuvGFk2FbmoktPQn9PIVBbMoJYkbHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221727099003)(56012099006)(10067099003)(6133799003)(29003799003)(25016099003)(12006099003)(22082099003)(18002099003)(13003099007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/t6ND19epG4p22eMCx5P7ZyZNLLgMwSonPdM1/rJDYaDqyECgh7jJ3lNzCeZ?=
 =?us-ascii?Q?g0p4SsXqfarCi9c79z8kDZ6P/17Ti3q7M8sy9s83rjDbV5ZWwOo1Aa5peinl?=
 =?us-ascii?Q?F8WFWlby6YXvaT57OCF8gVEHbKHSS1ufszvs5BbQD5UPCEFyj7mAHeSpIesi?=
 =?us-ascii?Q?daUNV1VjHq8cAhyoqpcyhTE8XlnmIxwFoYu+6kP/jHmCmovntjQCg3s1FMmm?=
 =?us-ascii?Q?vkPkolLidBtEhf5IpmdaS5oQfT+q/c2VZr7OoWMrreXtvCzvoeea8ZRj9Qic?=
 =?us-ascii?Q?aVggPTIkjxvEz+7zdg0qp/kTtsRf4qdI6GSvXB/u5Fhxbl259aJ/bRXrgcIx?=
 =?us-ascii?Q?YfF112fr5/rF+JAErkaWo2ST6j9O0Fm/HPQItx1D91eJIPqdeYMW1tsIerA+?=
 =?us-ascii?Q?QrtZhttsuc5pYyn1xc14qPm18HXtjUgzESdyP37I3ZipPb7afQnk3WwoVt6c?=
 =?us-ascii?Q?JWj8ngSseV3c49S3jcoSvZaT4YjN+azz6j6W6Ar0iS6r9JWZlwI9xFefsZ2O?=
 =?us-ascii?Q?PPhJ9L9rQWnAh3Mul0CvGN+0YHxL2V996ctVkKVDbCz5G0o8VIWO/W3r7Wwr?=
 =?us-ascii?Q?ZFrch8Rj4uYISE6naw3BgW6Qtygr6SMBjtXKTyvI3XZWFP9SWFWrilIC93/0?=
 =?us-ascii?Q?+OMOfuWPPRaQUlH8YT7nBliLu0/2iEzO24PF/mjT63WKKljO930qmaaET/em?=
 =?us-ascii?Q?RSgLrc0rVoRU23EH7PuyJXwElcBIC1i/8YBmUNmWllB8tKMA5+G1YbbUDjnt?=
 =?us-ascii?Q?zy2C20i/sND3H5xGgGFLEthoyEoaEPM7m1ZQkvyH0Zn6emtOLcNb4m1c9Hno?=
 =?us-ascii?Q?aECmXSQwTjydq1YOj4JWq+0nTTuWRmr/hCE0EWCMWk0V8NsZolum0ZRV6C4N?=
 =?us-ascii?Q?Y3c8jtLj0oF+YhfOh3hOMvP6t6ZkmAsYWIkYNH73m+O1biwLVPuZc9+MGo4M?=
 =?us-ascii?Q?GO6RBHRY5bBxKOuSJKUs99yhTgRQtwyZoh7rAh0YjJ6FcRMOJ6OIVOxyVngK?=
 =?us-ascii?Q?ZyqiYxkDTEbVcR4HlCrwKhEIlx+wKJXzfZfjGlykBSdNpt0dyRpl+6AeFqOZ?=
 =?us-ascii?Q?QOskN7qLNnifiZbaMKw6wt+AIV91ZxHWRAJ6rfGclWqz3Xpikjc9xyPU5JR9?=
 =?us-ascii?Q?u/GvK7YZCH/KslMDIPeKfJnKButIU+IVKDs4lDz/oYjlvwQaGlBpF/Hgep3b?=
 =?us-ascii?Q?XA1aOKOX3cE5YxSPOwNhHT4orr/c1IIpUFFeKlonVyDqJEDgFLllx/T1pGtG?=
 =?us-ascii?Q?unr6SRYu1oaj2RsJUZq/QA1it4AhXbb4tm/Pz5ANwBfY2hJ/BwcOopOp8nho?=
 =?us-ascii?Q?Z+z3YlQL96VaADJ+j0iqnd2FGsDjQASzRnrOyfsIsYm0TIxFij39nHBUTK5h?=
 =?us-ascii?Q?EYYWq1aB6Vb4cxRhnDiurl4JxowbZ/0yDKPlruZI/u1+kDFjvKV1uvVZCd+4?=
 =?us-ascii?Q?8mp2DfRMdQ9vUTZjilhYRjRHskwGYhqokonJccBPgZTbEXPHhf79jDNafQrE?=
 =?us-ascii?Q?9AasiAMdY1XXcwnnaHa5YLkgCe9WRqNR4/9frxo5x9y05TNIPjQ4B6S+5xe3?=
 =?us-ascii?Q?gPUwzdVj1GNkyb2/Bl1nqPM+cjLo5ksHh7qybV22Ml/7ubd05PqnI41lyGve?=
 =?us-ascii?Q?P1Bb7H1iW/lgsjqzRcDcgs8O7drOyyTHabI0DhzBkSPDenwd3ZzDmUUU1Wm2?=
 =?us-ascii?Q?bWmOSehgE1m2s4UsFXUNrGSA1sVBD5Yep2hwjKHi/NhZ/tSiNHgSuspX/qBF?=
 =?us-ascii?Q?apQR1Zzblg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f673f49e-080f-4ea0-c5ba-08df2e70dae3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:10:35.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTmkCIp2XU5widvARe5d6W5L+IldqhUNBnIhFHK/MYCEw1c20zjsejhrMYX+umPrgH2edZy8kqgVszGoPOxrOlD+f3WuXW9Rp6P3UViNwuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248218
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/libarchive/libarchive/releases/tag/v3.8.10
ChangeLog: https://github.com/libarchive/libarchive/compare/v3.8.9...v3.8.1=
0

- Drop patches which are part of release now
  - 0001-append_filter-Use-last-bidder-for-filter.patch
  - 0001-append_filter-Verify-that-bidder-and-filter-match.patch
  - 0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
  - 0003-Remove-bidder-name.patch
- Refresh existing patches
- Resync the RPM-format-reader patches with the current libarchive
  PR #2846 [1], which was force-pushed since it was first imported.
  Split the single 0004 patch to mirror the two current PR commits:
  - 0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch
    (commit 84b6ba6f4ac5)
  - 0004-Convert-RPM-reader-into-a-proper-format.patch (commit
    dcda938b907d)

libarchive test:
  Totals:
    Tests run:              936
    Tests failed:             0
    Assertions checked:28918815
    Assertions failed:        0
    Skips reported:         253
  936 tests passed, no failures
  PASS: libarchive_test

python3-libarchive test results with version 3.8.10:
Testsuite summary
 TOTAL: 36
 PASS: 36
 SKIP: 0
 XFAIL: 0
 FAIL: 0
 XPASS: 0
 ERROR: 0

[1] https://github.com/libarchive/libarchive/pull/2846

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
  - Fix ptest failure reported in AUH

 ...nd_filter-Use-last-bidder-for-filter.patch | 188 -------------
 ...-Verify-that-bidder-and-filter-match.patch | 103 -------
 ...aes256-streaming-test-when-no-crypto.patch |  46 ----
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ------------------
 ...er_bidder-Allow-ARCHIVE_STATE_HEADER.patch |  30 ++
 ...vert-RPM-reader-into-a-proper-format.patch |  78 ++----
 ...0005-Disable-RPM-filter-auto-bidding.patch |   6 +-
 ...barchive_3.8.9.bb =3D> libarchive_3.8.10.bb} |   9 +-
 8 files changed, 56 insertions(+), 662 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Use-last-bidder-for-filter.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Verify-that-bidder-and-filter-match.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-s=
kip-ppmd8-aes256-streaming-test-when-no-crypto.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove=
-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-archiv=
e_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.9.bb =3D> libarchi=
ve_3.8.10.bb} (90%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch
deleted file mode 100644
index 8e1eb0e9388..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:27:17 +0200
-Subject: [PATCH] append_filter: Use last bidder for filter
-
-Appending a filter implies appending a bidder. Always use the last added
-bidder, since it was just added. This avoids desync situations where
-previously added bidders could erroneously match.
-
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/50b585bb]
----
- libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
- 1 file changed, 22 insertions(+), 50 deletions(-)
-
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
-index 8de1b2ea..9dd9f536 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -33,14 +33,25 @@
- #include "archive_private.h"
- #include "archive_read_private.h"
-=20
-+static struct archive_read_filter_bidder *
-+get_last_bidder(struct archive_read *a)
-+{
-+  size_t i;
-+
-+  for (i =3D 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
-+  {
-+    if (a->bidders[i].vtable =3D=3D NULL)
-+      break;
-+  }
-+
-+  return a->bidders + (i - 1);
-+}
-+
- int
- archive_read_append_filter(struct archive *_a, int code)
- {
--  int r1, r2, number_bidders, i;
--  const char *str;
--  struct archive_read_filter_bidder *b;
--  struct archive_read_filter *f;
-   struct archive_read *a =3D (struct archive_read *)_a;
-+  int r1, r2;
-=20
-   r2 =3D (ARCHIVE_OK);
-   switch (code)
-@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-       r1 =3D (ARCHIVE_OK);
-       break;
-     case ARCHIVE_FILTER_GZIP:
--      str =3D "gzip";
-       r1 =3D archive_read_support_filter_gzip(_a);
-       break;
-     case ARCHIVE_FILTER_BZIP2:
--      str =3D "bzip2";
-       r1 =3D archive_read_support_filter_bzip2(_a);
-       break;
-     case ARCHIVE_FILTER_COMPRESS:
--      str =3D "compress (.Z)";
-       r1 =3D archive_read_support_filter_compress(_a);
-       break;
-     case ARCHIVE_FILTER_PROGRAM:
-@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-           "Cannot append program filter using archive_read_append_filter"=
);
-       return (ARCHIVE_FATAL);
-     case ARCHIVE_FILTER_LZMA:
--      str =3D "lzma";
-       r1 =3D archive_read_support_filter_lzma(_a);
-       break;
-     case ARCHIVE_FILTER_XZ:
--      str =3D "xz";
-       r1 =3D archive_read_support_filter_xz(_a);
-       break;
-     case ARCHIVE_FILTER_UU:
--      str =3D "uu";
-       r1 =3D archive_read_support_filter_uu(_a);
-       break;
-     case ARCHIVE_FILTER_RPM:
--      str =3D "rpm";
-       r1 =3D archive_read_support_filter_rpm(_a);
-       break;
-     case ARCHIVE_FILTER_LZ4:
--      str =3D "lz4";
-       r1 =3D archive_read_support_filter_lz4(_a);
-       break;
-     case ARCHIVE_FILTER_ZSTD:
--      str =3D "zstd";
-       r1 =3D archive_read_support_filter_zstd(_a);
-       break;
-     case ARCHIVE_FILTER_LZIP:
--      str =3D "lzip";
-       r1 =3D archive_read_support_filter_lzip(_a);
-       break;
-     case ARCHIVE_FILTER_LZOP:
--      str =3D "lzop";
-       r1 =3D archive_read_support_filter_lzop(_a);
-       break;
-     case ARCHIVE_FILTER_LRZIP:
--      str =3D "lrzip";
-       r1 =3D archive_read_support_filter_lrzip(_a);
-       break;
-     case ARCHIVE_FILTER_GRZIP:
--      str =3D "grzip";
-       r1 =3D archive_read_support_filter_grzip(_a);
-       break;
-     default:
-@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)
-       return (ARCHIVE_FATAL);
-   }
-=20
--  if (code !=3D ARCHIVE_FILTER_NONE)
-+  if (r1 > ARCHIVE_FATAL && code !=3D ARCHIVE_FILTER_NONE)
-   {
--    number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--    b =3D a->bidders;
--    for (i =3D 1; i < number_bidders; i++, b++)
--    {
--      if (!b->name || !strcmp(b->name, str))
--        break;
--    }
--    if (!b->name || strcmp(b->name, str))
--    {
--      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--          "Internal error: Unable to append filter");
--      return (ARCHIVE_FATAL);
--    }
-+    struct archive_read_filter_bidder *b;
-+    struct archive_read_filter *f;
-=20
-     f =3D calloc(1, sizeof(*f));
-     if (f =3D=3D NULL)
-@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
-       archive_set_error(&a->archive, ENOMEM, "Out of memory");
-       return (ARCHIVE_FATAL);
-     }
-+    b =3D get_last_bidder(a);
-     f->bidder =3D b;
-     f->archive =3D a;
-     f->upstream =3D a->filter;
-@@ -162,37 +149,22 @@ int
- archive_read_append_filter_program_signature(struct archive *_a,
-   const char *cmd, const void *signature, size_t signature_len)
- {
--  int r, number_bidders, i;
-+  struct archive_read *a =3D (struct archive_read *)_a;
-   struct archive_read_filter_bidder *b;
-   struct archive_read_filter *f;
--  struct archive_read *a =3D (struct archive_read *)_a;
-+  int r;
-=20
-   if (archive_read_support_filter_program_signature(_a, cmd, signature,
-     signature_len) !=3D (ARCHIVE_OK))
-     return (ARCHIVE_FATAL);
-=20
--  number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--  b =3D a->bidders;
--  for (i =3D 0; i < number_bidders; i++, b++)
--  {
--    /* Program bidder name set to filter name after initialization */
--    if (b->data && !b->name)
--      break;
--  }
--  if (!b->data)
--  {
--    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--        "Internal error: Unable to append program filter");
--    return (ARCHIVE_FATAL);
--  }
--
-   f =3D calloc(1, sizeof(*f));
-   if (f =3D=3D NULL)
-   {
-     archive_set_error(&a->archive, ENOMEM, "Out of memory");
-     return (ARCHIVE_FATAL);
-   }
-+  b =3D get_last_bidder(a);
-   f->bidder =3D b;
-   f->archive =3D a;
-   f->upstream =3D a->filter;
---=20
-2.54.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchi=
ve/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
deleted file mode 100644
index a91f5182071..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify=
-that-bidder-and-filter-match.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:26:22 +0200
-Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
-
-Make sure that appending a filter always matches its supposed bidder.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- Makefile.am                                   |  1 +
- libarchive/test/CMakeLists.txt                |  1 +
- .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
- 3 files changed, 56 insertions(+)
- create mode 100644 libarchive/test/test_archive_read_append_filter.c
-
-diff --git a/Makefile.am b/Makefile.am
-index 2fb4fdf4..c96b3bc6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -404,6 +404,7 @@ libarchive_test_SOURCES=3D \
- 	libarchive/test/test_archive_pathmatch_oob.c \
- 	libarchive/test/test_archive_read.c \
- 	libarchive/test/test_archive_read_add_passphrase.c \
-+	libarchive/test/test_archive_read_append_filter.c \
- 	libarchive/test/test_archive_read_close_twice.c \
- 	libarchive/test/test_archive_read_multiple_data_objects.c \
- 	libarchive/test/test_archive_read_next_header_empty.c \
-diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.t=
xt
-index 44f839f8..c4102c3d 100644
---- a/libarchive/test/CMakeLists.txt
-+++ b/libarchive/test/CMakeLists.txt
-@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
-     test_archive_pathmatch_oob.c
-     test_archive_read.c
-     test_archive_read_add_passphrase.c
-+    test_archive_read_append_filter.c
-     test_archive_read_close_twice.c
-     test_archive_read_multiple_data_objects.c
-     test_archive_read_next_header_empty.c
-diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchiv=
e/test/test_archive_read_append_filter.c
-new file mode 100644
-index 00000000..5c301d52
---- /dev/null
-+++ b/libarchive/test/test_archive_read_append_filter.c
-@@ -0,0 +1,54 @@
-+/*-
-+ * Copyright (c) 2026 Tobias Stoeckmann
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution=
.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS O=
R
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANT=
IES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED=
.
-+ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, B=
UT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF U=
SE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE =
OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "archive.h"
-+#include "test.h"
-+
-+DEFINE_TEST(test_archive_read_append_filter)
-+{
-+	struct archive *a;
-+	int r;
-+
-+	a =3D archive_read_new();
-+	assert(a !=3D NULL);
-+
-+	/* Append a program bidder (without filter). */
-+	assertEqualIntA(a, ARCHIVE_OK,
-+	    archive_read_support_filter_program(a, "prog1"));
-+
-+	/* Append a filter program which comes with its own bidder. */
-+	r =3D archive_read_append_filter_program(a, "prog2");
-+
-+	/* Verify that filter uses its own bidder. */
-+	if (r =3D=3D ARCHIVE_FATAL) {
-+		assertEqualStringA(a, "Can't initialize filter; unable to run program \=
"prog2\"",
-+			archive_error_string(a));
-+	} else {
-+		assertEqualIntA(a, ARCHIVE_OK, r);
-+		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
-+	}
-+
-+	archive_read_free(a);
-+}
---=20
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppm=
d8-aes256-streaming-test-when-no-crypto.patch b/meta/recipes-extended/libar=
chive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.=
patch
deleted file mode 100644
index fc962251415..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes2=
56-streaming-test-when-no-crypto.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c2b00a5fff659bbe8d70b5e00cb6abb831170aeb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 29 Jul 2026 13:33:10 +0000
-Subject: [PATCH] test: skip ppmd8 aes256 streaming test when no crypto lib=
rary
- is present
-
-test_read_format_zip_ppmd8_aes256_streaming fails with 6 assertion
-failures on systems without a crypto library (openssl/nettle/mbedtls)
-because it tries to decrypt a pre-built encrypted zipx file without
-checking crypto availability first.
-
-Add the same guard used by the other encrypted zip tests in this file.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3335]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../test/test_read_format_zip_zipx_encrypted.c     | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/libarchive/test/test_read_format_zip_zipx_encrypted.c b/libar=
chive/test/test_read_format_zip_zipx_encrypted.c
-index f07e1e5c..a0a431fb 100644
---- a/libarchive/test/test_read_format_zip_zipx_encrypted.c
-+++ b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-@@ -257,8 +257,22 @@ DEFINE_TEST(test_read_format_zip_zipx_zstd_encrypted_=
streaming)
- DEFINE_TEST(test_read_format_zip_ppmd8_aes256_streaming)
- {
- 	const char *refname =3D "test_read_format_zip_ppmd8_aes256_streaming.zip=
x";
-+	struct archive *a;
- 	size_t used;
- 	char buff[600];
-+
-+	/* Check if running system has cryptographic functionality. */
-+	assert((a =3D archive_write_new()) !=3D NULL);
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_zip(a));
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
-+	if (ARCHIVE_OK !=3D archive_write_set_options(a,
-+			"zip:encryption=3Daes256")) {
-+		skipping("This system does not have cryptographic library");
-+		archive_write_free(a);
-+		return;
-+	}
-+	archive_write_free(a);
-+
- 	extract_reference_file(refname);
- 	FILE *f =3D fopen(refname, "rb");
- 	used =3D fread(buff, 1, sizeof(buff), f);
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder=
-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidde=
r-name.patch
deleted file mode 100644
index bbd24785775..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.p=
atch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:31:33 +0200
-Subject: [PATCH 3/3] Remove bidder name
-
-The name was only needed to find the appropriate bidder for a filter.
-Since this has been resolved by accessing the last bidder, since in these
-situations the bidder is added first, then the filter, the name is not
-needed anymore.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- libarchive/archive_read.c                         | 2 --
- libarchive/archive_read_append_filter.c           | 1 -
- libarchive/archive_read_private.h                 | 3 ---
- libarchive/archive_read_support_filter_bzip2.c    | 2 +-
- libarchive/archive_read_support_filter_compress.c | 2 +-
- libarchive/archive_read_support_filter_grzip.c    | 2 +-
- libarchive/archive_read_support_filter_gzip.c     | 2 +-
- libarchive/archive_read_support_filter_lrzip.c    | 2 +-
- libarchive/archive_read_support_filter_lz4.c      | 2 +-
- libarchive/archive_read_support_filter_lzop.c     | 2 +-
- libarchive/archive_read_support_filter_program.c  | 2 +-
- libarchive/archive_read_support_filter_rpm.c      | 2 +-
- libarchive/archive_read_support_filter_uu.c       | 2 +-
- libarchive/archive_read_support_filter_xz.c       | 6 +++---
- libarchive/archive_read_support_filter_zstd.c     | 2 +-
- 15 files changed, 14 insertions(+), 20 deletions(-)
-
-diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index e844e42d..406d84de 100644
---- a/libarchive/archive_read.c
-+++ b/libarchive/archive_read.c
-@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *=
a,
- int
- __archive_read_register_bidder(struct archive_read *a,
- 	void *bidder_data,
--	const char *name,
- 	const struct archive_read_filter_bidder_vtable *vtable)
- {
- 	struct archive_read_filter_bidder *bidder;
-@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *=
a,
- 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
- 		bidder =3D (a->bidders + i);
- 		bidder->data =3D bidder_data;
--		bidder->name =3D name;
- 		bidder->vtable =3D vtable;
- 		if (bidder->vtable->bid =3D=3D NULL || bidder->vtable->init =3D=3D NULL=
) {
- 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
-index 9dd9f536..5cc8ff55 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct ar=
chive *_a,
-     __archive_read_free_filters(a);
-     return (ARCHIVE_FATAL);
-   }
--  b->name =3D a->filter->name;
-=20
-   a->bypass_filter_bidding =3D 1;
-   return r;
-diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_p=
rivate.h
-index 3bd8de2d..e30b6c2b 100644
---- a/libarchive/archive_read_private.h
-+++ b/libarchive/archive_read_private.h
-@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
- struct archive_read_filter_bidder {
- 	/* Configuration data for the bidder. */
- 	void *data;
--	/* Name of the filter */
--	const char *name;
- 	const struct archive_read_filter_bidder_vtable *vtable;
- };
-=20
-@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read=
 *a,
-=20
- int __archive_read_register_bidder(struct archive_read *a,
- 		void *bidder_data,
--		const char *name,
- 		const struct archive_read_filter_bidder_vtable *vtable);
-=20
- const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *=
);
-diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/a=
rchive_read_support_filter_bzip2.c
-index 588953f2..1cfc55dc 100644
---- a/libarchive/archive_read_support_filter_bzip2.c
-+++ b/libarchive/archive_read_support_filter_bzip2.c
-@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "bzip2",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&bzip2_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchiv=
e/archive_read_support_filter_compress.c
-index 4e1f1dc5..4763995e 100644
---- a/libarchive/archive_read_support_filter_compress.c
-+++ b/libarchive/archive_read_support_filter_compress.c
-@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_=
a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
-+	return __archive_read_register_bidder(a, NULL,
- 			&compress_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/a=
rchive_read_support_filter_grzip.c
-index 9d9ad46e..8457ec7c 100644
---- a/libarchive/archive_read_support_filter_grzip.c
-+++ b/libarchive/archive_read_support_filter_grzip.c
-@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "grzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&grzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/ar=
chive_read_support_filter_gzip.c
-index 89ae0f37..34b174b7 100644
---- a/libarchive/archive_read_support_filter_gzip.c
-+++ b/libarchive/archive_read_support_filter_gzip.c
-@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "gzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&gzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/a=
rchive_read_support_filter_lrzip.c
-index 33910fe1..a1d45d77 100644
---- a/libarchive/archive_read_support_filter_lrzip.c
-+++ b/libarchive/archive_read_support_filter_lrzip.c
-@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lrzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lrzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/arc=
hive_read_support_filter_lz4.c
-index 19086a1f..28189a07 100644
---- a/libarchive/archive_read_support_filter_lz4.c
-+++ b/libarchive/archive_read_support_filter_lz4.c
-@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lz4",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lz4_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/ar=
chive_read_support_filter_lzop.c
-index ebfaf01e..5a552fce 100644
---- a/libarchive/archive_read_support_filter_lzop.c
-+++ b/libarchive/archive_read_support_filter_lzop.c
-@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzop",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzop_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive=
/archive_read_support_filter_program.c
-index cf7c3613..a9e02a32 100644
---- a/libarchive/archive_read_support_filter_program.c
-+++ b/libarchive/archive_read_support_filter_program.c
-@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct a=
rchive *_a,
- 		memcpy(state->signature, signature, signature_len);
- 	}
-=20
--	if (__archive_read_register_bidder(a, state, NULL,
-+	if (__archive_read_register_bidder(a, state,
- 				&program_bidder_vtable) !=3D ARCHIVE_OK) {
- 		free_state(state);
- 		return (ARCHIVE_FATAL);
-diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/arc=
hive_read_support_filter_rpm.c
-index 01bd1bf7..1cfddf75 100644
---- a/libarchive/archive_read_support_filter_rpm.c
-+++ b/libarchive/archive_read_support_filter_rpm.c
-@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "rpm",
-+	return __archive_read_register_bidder(a, NULL,
- 			&rpm_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/arch=
ive_read_support_filter_uu.c
-index c0f6f48e..10d49648 100644
---- a/libarchive/archive_read_support_filter_uu.c
-+++ b/libarchive/archive_read_support_filter_uu.c
-@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	return __archive_read_register_bidder(a, NULL, "uu",
-+	return __archive_read_register_bidder(a, NULL,
- 			&uudecode_bidder_vtable);
- }
-=20
-diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/arch=
ive_read_support_filter_xz.c
-index 7c8e0cb5..b00ba543 100644
---- a/libarchive/archive_read_support_filter_xz.c
-+++ b/libarchive/archive_read_support_filter_xz.c
-@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "xz",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&xz_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzma",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzma_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "lzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzip_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
-diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/ar=
chive_read_support_filter_zstd.c
-index 12eac04c..163f54b5 100644
---- a/libarchive/archive_read_support_filter_zstd.c
-+++ b/libarchive/archive_read_support_filter_zstd.c
-@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
- {
- 	struct archive_read *a =3D (struct archive_read *)_a;
-=20
--	if (__archive_read_register_bidder(a, NULL, "zstd",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&zstd_bidder_vtable) !=3D ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
-=20
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-archive_read-=
register_bidder-Allow-ARCHIVE_STATE_HEADER.patch b/meta/recipes-extended/li=
barchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_H=
EADER.patch
new file mode 100644
index 00000000000..cc8f2896a26
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-archive_read-registe=
r_bidder-Allow-ARCHIVE_STATE_HEADER.patch
@@ -0,0 +1,30 @@
+From 84b6ba6f4ac5f00e70d66bb7c765dd487147d83b Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <git@davidebeatrici.dev>
+Date: Mon, 25 Aug 2026 22:39:08 +0000
+Subject: [PATCH] __archive_read_register_bidder(): Allow ARCHIVE_STATE_HEA=
DER
+
+This allows formats to apply filters when they know what they need.
+
+In the case of RPM, that's after parsing the (uncompressed) header.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
2846 commit 84b6ba6f4ac5]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+---
+ libarchive/archive_read.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index 2f006fb..5c51df5 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1297,7 +1297,8 @@ __archive_read_register_bidder(struct archive_read *=
a,
+ 	int i, number_slots;
+=20
+ 	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
+-	    ARCHIVE_STATE_NEW, "__archive_read_register_bidder");
++	    ARCHIVE_STATE_NEW | ARCHIVE_STATE_HEADER,
++		"__archive_read_register_bidder");
+=20
+ 	number_slots =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
+=20
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-r=
eader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarch=
ive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 03a207f33f1..34c0cf415e7 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
@@ -1,33 +1,22 @@
-From 2606336bce3a7f66cc6c8af28687a82536c9086c Mon Sep 17 00:00:00 2001
+From dcda938b907d3b99e012b52ea1250d01fb0c8546 Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
-Date: Sun, 9 Aug 2026 14:14:59 -0700
-Subject: [PATCH] libarchive: Convert RPM reader into a proper format
+Date: Mon, 25 Aug 2026 23:47:31 +0000
+Subject: [PATCH] Convert RPM reader into a proper format, supporting both
+ stripped CPIO and SVR4
=20
-This adds a new RPM format reader that can handle RPM 6 packages
-with their new internal structure. The existing RPM filter is kept
-unchanged for API compatibility.
+The filter is kept but is not appended by archive_read_support_filter_all(=
) anymore.
=20
-Without this patch, debuginfod cannot scan RPM 6 packages:
-  libarchive error: cannot open archive from pipe: Unrecognized
-  archive format
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
2846 commit dcda938b907d]
=20
-The test_read_format_huge_rpm test is updated from upstream PR #2846
-to match the format reader behavior: the format reader opens the
-truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
-next_header (no valid entries in the crafted file), and correctly
-identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
-companion 0005 patch (which disables the filter's auto-bidding) so
-that the format reader handles the file instead of the filter.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
2846]
+Note: Resynced patch with upstream commit
=20
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  Makefile.am                                   |    1 +
  contrib/android/Android.mk                    |    1 +
  libarchive/CMakeLists.txt                     |    1 +
  libarchive/archive.h                          |    6 +
- libarchive/archive_read.c                     |    9 +-
  libarchive/archive_read_private.h             |    2 +-
  libarchive/archive_read_set_format.c          |    3 +
  libarchive/archive_read_support_filter_all.c  |    2 +
@@ -38,14 +27,14 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver=
.com>
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 15 files changed, 1169 insertions(+), 20 deletions(-)
+ 14 files changed, 1154 insertions(+), 14 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
=20
 diff --git a/Makefile.am b/Makefile.am
-index c96b3bc..725e20c 100644
+index 8bc70c5..487bef3 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -210,6 +210,7 @@ libarchive_la_SOURCES=3D \
+@@ -212,6 +212,7 @@ libarchive_la_SOURCES=3D \
  	libarchive/archive_read_support_format_rar.c \
  	libarchive/archive_read_support_format_rar5.c \
  	libarchive/archive_read_support_format_raw.c \
@@ -54,7 +43,7 @@ index c96b3bc..725e20c 100644
  	libarchive/archive_read_support_format_warc.c \
  	libarchive/archive_read_support_format_xar.c \
 diff --git a/contrib/android/Android.mk b/contrib/android/Android.mk
-index 9e1c72f..3d1f087 100644
+index f81dcb0..24af25e 100644
 --- a/contrib/android/Android.mk
 +++ b/contrib/android/Android.mk
 @@ -91,6 +91,7 @@ libarchive_src_files :=3D libarchive/archive_acl.c \
@@ -66,7 +55,7 @@ index 9e1c72f..3d1f087 100644
  						libarchive/archive_read_support_format_warc.c \
  						libarchive/archive_read_support_format_xar.c \
 diff --git a/libarchive/CMakeLists.txt b/libarchive/CMakeLists.txt
-index b296637..d132123 100644
+index ac039c1..34ba173 100644
 --- a/libarchive/CMakeLists.txt
 +++ b/libarchive/CMakeLists.txt
 @@ -110,6 +110,7 @@ SET(libarchive_SOURCES
@@ -78,10 +67,10 @@ index b296637..d132123 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index a7de6f6..89c60b3 100644
+index 19b316a..f04a747 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
-@@ -314,7 +314,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
+@@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
  #define	ARCHIVE_FILTER_LZMA	5
  #define	ARCHIVE_FILTER_XZ	6
  #define	ARCHIVE_FILTER_UU	7
@@ -91,7 +80,7 @@ index a7de6f6..89c60b3 100644
  #define	ARCHIVE_FILTER_LZIP	9
  #define	ARCHIVE_FILTER_LRZIP	10
  #define	ARCHIVE_FILTER_LZOP	11
-@@ -385,6 +387,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
+@@ -387,6 +389,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
  #define	ARCHIVE_FORMAT_7ZIP			0xE0000
  #define	ARCHIVE_FORMAT_WARC			0xF0000
  #define	ARCHIVE_FORMAT_RAR_V5			0x100000
@@ -99,7 +88,7 @@ index a7de6f6..89c60b3 100644
 =20
  /*
   * Codes returned by archive_read_format_capabilities().
-@@ -478,7 +481,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
+@@ -480,7 +483,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
  __LA_DECL int archive_read_support_filter_program_signature
  		(struct archive *, const char * /* cmd */,
  				    const void * /* match */, size_t);
@@ -109,7 +98,7 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_filter_uu(struct archive *);
  __LA_DECL int archive_read_support_filter_xz(struct archive *);
  __LA_DECL int archive_read_support_filter_zstd(struct archive *);
-@@ -499,6 +504,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
+@@ -501,6 +506,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
  __LA_DECL int archive_read_support_format_rar(struct archive *);
  __LA_DECL int archive_read_support_format_rar5(struct archive *);
  __LA_DECL int archive_read_support_format_raw(struct archive *);
@@ -117,36 +106,11 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_format_tar(struct archive *);
  __LA_DECL int archive_read_support_format_warc(struct archive *);
  __LA_DECL int archive_read_support_format_xar(struct archive *);
-diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index 406d84d..150bd31 100644
---- a/libarchive/archive_read.c
-+++ b/libarchive/archive_read.c
-@@ -1296,13 +1296,18 @@ __archive_read_register_bidder(struct archive_read=
 *a,
- 	int i, number_slots;
-=20
- 	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
--	    ARCHIVE_STATE_NEW, "__archive_read_register_bidder");
-+	    ARCHIVE_STATE_NEW | ARCHIVE_STATE_HEADER,
-+		"__archive_read_register_bidder");
-=20
- 	number_slots =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
-=20
- 	for (i =3D 0; i < number_slots; i++) {
--		if (a->bidders[i].vtable !=3D NULL)
-+		if (a->bidders[i].vtable !=3D NULL) {
-+			if (a->bidders[i].vtable =3D=3D vtable)
-+				/* Already registered. */
-+				return (ARCHIVE_OK);
- 			continue;
-+		}
- 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
- 		bidder =3D (a->bidders + i);
- 		bidder->data =3D bidder_data;
 diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_p=
rivate.h
-index e30b6c2..9ff3602 100644
+index 43b7f85..9b27655 100644
 --- a/libarchive/archive_read_private.h
 +++ b/libarchive/archive_read_private.h
-@@ -212,7 +212,7 @@ struct archive_read {
+@@ -208,7 +208,7 @@ struct archive_read {
  		int	(*cleanup)(struct archive_read *);
  		int	(*format_capabilties)(struct archive_read *);
  		int	(*has_encrypted_entries)(struct archive_read *);
@@ -1344,7 +1308,7 @@ index 0000000..fe0e500
 +	free(hash);
 +}
 diff --git a/libarchive/test/test_archive_read_support.c b/libarchive/test=
/test_archive_read_support.c
-index b0c9280..bc256a1 100644
+index ff03c0f..1bef2f7 100644
 --- a/libarchive/test/test_archive_read_support.c
 +++ b/libarchive/test/test_archive_read_support.c
 @@ -91,6 +91,7 @@ DEFINE_TEST(test_archive_read_support)
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-f=
ilter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005=
-Disable-RPM-filter-auto-bidding.patch
index 26a01599083..86eb48a8045 100644
--- a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
@@ -1,4 +1,4 @@
-From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From b367b31b5b764e15c8d484a75c790b6ffa1e20d8 Mon Sep 17 00:00:00 2001
 From: Sumanth Gavini <sumanth.gavini@windriver.com>
 Date: Tue, 11 Aug 2026 12:02:31 -0700
 Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
@@ -20,7 +20,7 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.c=
om>
  1 file changed, 6 insertions(+), 31 deletions(-)
=20
 diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/arc=
hive_read_support_filter_rpm.c
-index 01bd1bf..8e90da3 100644
+index 1cfddf7..a9b6ef8 100644
 --- a/libarchive/archive_read_support_filter_rpm.c
 +++ b/libarchive/archive_read_support_filter_rpm.c
 @@ -79,39 +79,14 @@ static int
@@ -69,5 +69,3 @@ index 01bd1bf..8e90da3 100644
  }
 =20
  static const struct archive_read_filter_vtable
---=20
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.10.bb
similarity index 90%
rename from meta/recipes-extended/libarchive/libarchive_3.8.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.10.bb
index 2eefa285326..747a6b99693 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
@@ -31,16 +31,13 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-append_filter-Use-last-bidder-for-filter.patch \
-           file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypt=
o.patch \
-           file://0001-append_filter-Verify-that-bidder-and-filter-match.p=
atch \
-           file://0003-Remove-bidder-name.patch \
+           file://0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HE=
ADER.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
            file://0005-Disable-RPM-filter-auto-bidding.patch \
-          "
+           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
-SRC_URI[sha256sum] =3D "f5a6539059cf5e597dbeda37bfa4874b1e8dea063c8d93bf85=
a2b44af90a5bd4"
+SRC_URI[sha256sum] =3D "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee750=
62efbe164cc57c"
=20
 inherit autotools update-alternatives pkgconfig ptest
=20
