Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7179.1794234834937457726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NweXXLbM;
 spf=pass (domain: est.tech, ip: 40.107.159.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfg3n6CuDYOoZpwSIKcDF5+cH2hm2aitTM3zyHpZF0o2JU8lbAg5n8UIyD7LK2MXIs1OS12rg/YewIxx31fmCDJSU51GhZYEcMBe9aMxEn7Ied+E8mhF9Dic3rSrP5y7DUZxGn1jPGqadNYXBmXo/tSkTmU7GD3f9DisybqzNpqzQhAQI+QldUrf2LT0NcLti4f3ksKOZC6LKQeG7qH7M2py4C7ozOldrMJHgzPpUqrYu3HHsW/thZmXIaESIeKKNxG1tlsvD06VWUTV1TEE040RG+fPsnV1yk++WWpgEINvLATbHip/F9d3UVmz2c07tlsQma++CoNQBSWlrx6ySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWPdnilaiQvsHxwUvarSrVtHrk7CcxYXeyo3sdpsXns=;
 b=iAw4X5lDGCnyUWVPF8c2iT+DkgRGZ7rpYheIEZjeS4BezNijlSJTzZlPQRadKsIPnOBomRAC72x4FpdD5r1d5e9i/9ZOS4Z+jgtEuse/9xnWwTOdoeRe+PmHaMGLcTL8yRiJaXqNvZNw4iEDDeUce2PHbRtTkihftHpy5FKqHzKei34PdiBFBWLsSN/JLIjbTkSwQo8IunCzOair16EeyeOFqtumUHFR5J+78+COxATRPllRTzc/mmK70cMM6c7za2N51RmEGaan8U6GJCLiRvTFeKd+ci6BdoqlEcD+7f/wXv6PPZOnZVz7APaY3GpbXp9wx9hPyH1wjU7EOKcGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWPdnilaiQvsHxwUvarSrVtHrk7CcxYXeyo3sdpsXns=;
 b=NweXXLbMrQZRdjPxbymVgofxWadnBm3jCMjp6zdKAXeRRt+965rZKmiT6FCEEMefJvwLvYNO6Taup0HoUfMdN/OsoGanR3Rk8ilX3TTz8z/WbwjZM22i/DnMfcsKtys7ISs/rgSyJ0NfqnmwpbK6PVb8m6R/oU1m94bTp0ksPBc5Lp2O3epxCYj5gvcdy51swPVRUx6YnY4iRhTZCmOVOa7wioMWDCyPD1cmrhiVLMdH3jtz5ktb5puCbvhC+WzcVueFKIJ5x0Fz130Pd5QSQx2Gapr+yn0QI6C6Rs8n+rFogitYiEr8/4iJ6sGrmJTi1XzoEtvllVR4IJAeAAgOJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2508.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:643::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 14:33:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 14:33:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libarchive: upgrade 3.8.10 -> 3.8.11
Date: Mon,  9 Nov 2026 15:33:47 +0100
Message-ID: <20261109143347.75003-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102102742.31991-4-jaipaul.cheernam@est.tech>
References: <20261102102742.31991-4-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2508:EE_
X-MS-Office365-Filtering-Correlation-Id: d2db3221-2696-405e-4ea9-08df3e6e7839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|260925022911599003|260925021311599003|260925021911599003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|12006099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 1au6vYdrFpfHZyiWXsjRm+41t26o+7cCR7hcELZrbTbBfDhUERsIFhzxXwiDWBB8vUEKD0TGZUaXgPElj2xLZJfQ25ogBUvx6LQaElD0HsYnq19oe+xYUPZIiZK6FXaSfPPhY6gFIWBBXdlo7LC+PzWwiC+dlUJMNpgRBejs/gEH45CeDaO5Tmassw1LY/11xjsgGkRUWWe/tFGub2Lh0bBOLItS0NdOo4ycW8mF79FZCNd/IuuF2g8IFRdKdl8mFI++IOlQ/46p+FmuhE7KofIQQXiKBB0c+71hwOPrkW1nes+4RKyzqrKF+Y4YmLwSb+wb0vxhSYcPnSuff8Bl1FvGiG8JLoLOH8z+YsmENCGgCWYQ/mBr7LwfwQWHEYsqSdb18uxTetItYPeOVCwNugTvuRzL8YKc9bcJ7TIU9FhSUTV2Fl5sF6TqLwRypZDUrNcHprjnr69D8dd4KyG8e71Me0tG+3y/5qhuFPVqVIHs5e3OCyruX5/sd56bVfKgtN05Bh3txo10HT2k+1pYFse1JCbQ+BD6ev2PhDM+AGjCvhQ/LO9dBE1WG/kylWdaEQGlVIF1OsJxJCIu+0OqSbKvmMd6v0Xhxxs9IBi1FTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(12006099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJ39eGJKtmHLcNqD5W6npuoZSU7YQweCLFC83EbNNS7qd8LvwHKyXvUvEOiF?=
 =?us-ascii?Q?QJfBD+9DKlxgZFPsE7qmC0Pe3Qn+klC9eK9P0nu6H5NhEUORuEm46RYZEOI+?=
 =?us-ascii?Q?lqT4T+/Xa3KpzUNt77QKiBaDmfcEgJbh1ERrBqzeaB8Eq2iEPzWtwNzcLRud?=
 =?us-ascii?Q?UFSj09+tkztNl30eUDZwXNKnTlb/Z8Nm0EIOlUsSRsn6sgivoAd5lPilW5TZ?=
 =?us-ascii?Q?ee4DS4iCcgXBdIbLRkjK8jmLhvXEqPMTdH6OJlPSDsu8DSExrO+cOi4wTFnu?=
 =?us-ascii?Q?jtvhOAPn5hF8wz/m9iV4PIeM4fxxuQabUcaieyzgjO+ZgZJf3bc31DCDupsG?=
 =?us-ascii?Q?5+w6DKkuUF9S3NoPHg268BerE+RGRjDqWgEVwVTbjY9FNgXw0m8tMPFS3Qkq?=
 =?us-ascii?Q?+I0zM+vzMpPhwIdiPjA70XzCzWYkLb3NigwGxBBN3dOY2hckIDp00U30lcKq?=
 =?us-ascii?Q?K37GnrLT1yzHCmVUVfQbW3kib29bTAYpV6X//POwvfenOEycqN4MuizCjccm?=
 =?us-ascii?Q?UNDDcfwD1A35bFxjIasFryzDT4aSNr+qH3lt1RI5JGN0EnzbRsSJ2Hq997ZD?=
 =?us-ascii?Q?dQ0Pk3LEIMmwrQx2Lza30g1cQIGuWbL5D1EJVwqpHMWli/VCCfrCmqZt7d4h?=
 =?us-ascii?Q?7MhpiLoxNeIVd9g4pYmDvPLb8/4hbeGsQlQKtFy59kKz2NtcZAwrGJ+X4P6G?=
 =?us-ascii?Q?RhUeFCTpgBlP2NrVQsNbPSCLTXqVQrJ76mrdguBQPDhwqK4m9TtshOJcTyyF?=
 =?us-ascii?Q?80o92F03E+SulzPduINxS2nNaHE40WDXU3U3LTyXeab5l5BbW8q4KQMK0rKD?=
 =?us-ascii?Q?WFVLJyAQuqH2EX8c5UrexflMWmdr6vzqeQDEnrnjjhPECm/OiVdbapGM7Zyi?=
 =?us-ascii?Q?B4f+0ulkNOPra5a0c0qEg0pRFnAkhjnHWBqFw4UbpGsYkRxaO5LYDL9BFXly?=
 =?us-ascii?Q?JcGtXLTaPhLeOl6loyByUVFHHU0dbMWSUdbl0zfBGhYCtw32i9h5h2+NYH53?=
 =?us-ascii?Q?7lQxjvZdH7n9LvA2smt3lsmNinQVh0inbbXzvvHQYJnYwkhd1gzVjeI/Sf1o?=
 =?us-ascii?Q?MARbMD/+FmfMZmO9gcMYCL38HaUraLOZeHiOnAV1k6lItGXAVf6pgvAv2L2a?=
 =?us-ascii?Q?o+RciDlVKgSs0x/xfus//64WbY7KZlO+4azw6BXhD++dL5ot/JjlZaBDbJV5?=
 =?us-ascii?Q?L6Wk9zxhIQS23P077r5R+I0XDj/8PzLcizhz9AUhcZdH/sQsGgZ3z0+LmIAn?=
 =?us-ascii?Q?RCwwzxzNat9ecM7SRbfAMJzba1NFRy1sUE5mySRXyXpndnNY9RD3TreRYK4R?=
 =?us-ascii?Q?sh7Vr8FbLa4HLkvO+mEoMvwG4N1AXvKP9Dj+bTysxuZ5AL4GVYbaPRlqZso7?=
 =?us-ascii?Q?gpAn3jh4Jk/OYSSj0nEiMPoO+PR9lOBBGM8lb8BWa/di2AwMdV6ob4wjcr9D?=
 =?us-ascii?Q?uKTA6H1MzbPLYblWVkaKsdK9soMA+cDZOtPtpONkbFuoQF51Y1Ynx8wZTrja?=
 =?us-ascii?Q?KkROU1B7218ts0pLYcnSIkJSOh2nTDawycCNAVyL0OYygHIdw5F9sSodJ/f/?=
 =?us-ascii?Q?ES4b/4HrpuGqLVxEXQyFNfY7YNzxujZN0myxpMf8KYZZMrAkXKl9bfYxqTxM?=
 =?us-ascii?Q?ZUI8prsjxIIS6GA4rJRwGZaKO/Tv8xUW3nkuKMNIz1Ae9x4cd1urh3arQdDz?=
 =?us-ascii?Q?1eBi1yQ2YwutIKxPOxKHbqANoDoxMg1MYpb4QAB5uZxCc/1ntGm0S7Ff8uUU?=
 =?us-ascii?Q?LvxCLnR9uA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d2db3221-2696-405e-4ea9-08df3e6e7839
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:33:49.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2eqWEN6vF59TSmVpd1rEJZ5+XjMGbkXL+kJj/MhZ306SrgTAVRGlD+c6dyRQ2QGQirHLwpcNGJImUo1kqOEKV1AU6QpvdQ32l7Vb67pyl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2508
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249852
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/libarchive/libarchive/releases/tag/v3.8.11
ChangeLog: https://github.com/libarchive/libarchive/compare/v3.8.10...v3.8.=
11

- Refresh the carried RPM patches (0003, 0004, 0005);

- Update PR #2846 patch as 3.8.11 (PR #3694) updated same area and now loca=
l
  patch needs update

ptest (qemux86-64, core-image-ptest-libarchive): all pass, 0 failures.
  libarchive_test:  957 tests, 0 failed
  bsdtar_test:       80 tests, 0 failed
  bsdcpio_test:      50 tests, 0 failed
  bsdcat_test:       18 tests, 0 failed
  bsdunzip_test:     32 tests, 0 failed

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
 - Fix RPM ptest failures

 ...er_bidder-Allow-ARCHIVE_STATE_HEADER.patch |  9 ++-
 ...vert-RPM-reader-into-a-proper-format.patch | 70 ++++++++++++++-----
 ...0005-Disable-RPM-filter-auto-bidding.patch |  2 +-
 ...archive_3.8.10.bb =3D> libarchive_3.8.11.bb} |  2 +-
 4 files changed, 58 insertions(+), 25 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.10.bb =3D> libarch=
ive_3.8.11.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0003-archive_read-=
register_bidder-Allow-ARCHIVE_STATE_HEADER.patch b/meta/recipes-extended/li=
barchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_H=
EADER.patch
index cc8f2896a26..c9ecb0edbbf 100644
--- a/meta/recipes-extended/libarchive/libarchive/0003-archive_read-registe=
r_bidder-Allow-ARCHIVE_STATE_HEADER.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0003-archive_read-registe=
r_bidder-Allow-ARCHIVE_STATE_HEADER.patch
@@ -1,6 +1,6 @@
-From 84b6ba6f4ac5f00e70d66bb7c765dd487147d83b Mon Sep 17 00:00:00 2001
+From de3e8eb0219dbe21c805cc03f1aa25b4f19dcb8a Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
-Date: Mon, 25 Aug 2026 22:39:08 +0000
+Date: Tue, 25 Aug 2026 22:39:08 +0000
 Subject: [PATCH] __archive_read_register_bidder(): Allow ARCHIVE_STATE_HEA=
DER
=20
 This allows formats to apply filters when they know what they need.
@@ -9,16 +9,15 @@ In the case of RPM, that's after parsing the (uncompresse=
d) header.
=20
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
2846 commit 84b6ba6f4ac5]
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-
 ---
  libarchive/archive_read.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index 2f006fb..5c51df5 100644
+index 6235d66..66bd4e8 100644
 --- a/libarchive/archive_read.c
 +++ b/libarchive/archive_read.c
-@@ -1297,7 +1297,8 @@ __archive_read_register_bidder(struct archive_read *=
a,
+@@ -1325,7 +1325,8 @@ __archive_read_register_bidder(struct archive_read *=
a,
  	int i, number_slots;
 =20
  	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-r=
eader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarch=
ive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 34c0cf415e7..c9313f8ef81 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-i=
nto-a-proper-format.patch
@@ -1,6 +1,6 @@
-From dcda938b907d3b99e012b52ea1250d01fb0c8546 Mon Sep 17 00:00:00 2001
+From 970b16c3468dbdf6d4caec9363dbb19279944852 Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
-Date: Mon, 25 Aug 2026 23:47:31 +0000
+Date: Tue, 25 Aug 2026 23:47:31 +0000
 Subject: [PATCH] Convert RPM reader into a proper format, supporting both
  stripped CPIO and SVR4
=20
@@ -8,7 +8,10 @@ The filter is kept but is not appended by archive_read_sup=
port_filter_all() anym
=20
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/=
2846 commit dcda938b907d]
=20
-Note: Resynced patch with upstream commit
+Note: Resynced patch with upstream commit.
+
+Note: OE-local addition on top of PR #2846: bid+init the appended payload
+filter, needed since 3.8.11 (PR #3694) defers filter init to open time.
=20
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
@@ -22,16 +25,16 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>
  libarchive/archive_read_support_filter_all.c  |    2 +
  .../archive_read_support_filter_by_code.c     |    2 +
  libarchive/archive_read_support_format_all.c  |    1 +
- libarchive/archive_read_support_format_rpm.c  | 1126 +++++++++++++++++
+ libarchive/archive_read_support_format_rpm.c  | 1157 +++++++++++++++++
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 14 files changed, 1154 insertions(+), 14 deletions(-)
+ 14 files changed, 1186 insertions(+), 13 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
=20
 diff --git a/Makefile.am b/Makefile.am
-index 8bc70c5..487bef3 100644
+index c171c24..0c150c0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -212,6 +212,7 @@ libarchive_la_SOURCES=3D \
@@ -67,7 +70,7 @@ index ac039c1..34ba173 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index 19b316a..f04a747 100644
+index 2c13908..64dbdaa 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
 @@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
@@ -80,7 +83,7 @@ index 19b316a..f04a747 100644
  #define	ARCHIVE_FILTER_LZIP	9
  #define	ARCHIVE_FILTER_LRZIP	10
  #define	ARCHIVE_FILTER_LZOP	11
-@@ -387,6 +389,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
+@@ -389,6 +391,7 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
  #define	ARCHIVE_FORMAT_7ZIP			0xE0000
  #define	ARCHIVE_FORMAT_WARC			0xF0000
  #define	ARCHIVE_FORMAT_RAR_V5			0x100000
@@ -88,7 +91,7 @@ index 19b316a..f04a747 100644
 =20
  /*
   * Codes returned by archive_read_format_capabilities().
-@@ -480,7 +483,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
+@@ -482,7 +485,9 @@ __LA_DECL int archive_read_support_filter_program(stru=
ct archive *,
  __LA_DECL int archive_read_support_filter_program_signature
  		(struct archive *, const char * /* cmd */,
  				    const void * /* match */, size_t);
@@ -98,7 +101,7 @@ index 19b316a..f04a747 100644
  __LA_DECL int archive_read_support_filter_uu(struct archive *);
  __LA_DECL int archive_read_support_filter_xz(struct archive *);
  __LA_DECL int archive_read_support_filter_zstd(struct archive *);
-@@ -501,6 +506,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
+@@ -503,6 +508,7 @@ __LA_DECL int archive_read_support_format_mtree(struct=
 archive *);
  __LA_DECL int archive_read_support_format_rar(struct archive *);
  __LA_DECL int archive_read_support_format_rar5(struct archive *);
  __LA_DECL int archive_read_support_format_raw(struct archive *);
@@ -149,11 +152,11 @@ index f086773..cc5c2b2 100644
  	archive_read_support_filter_lrzip(a);
  	/* Lzop decompress falls back to "lzop -d" command-line. */
 diff --git a/libarchive/archive_read_support_filter_by_code.c b/libarchive=
/archive_read_support_filter_by_code.c
-index 4c8b6cb..d3c7d21 100644
+index 6c18421..7a30c49 100644
 --- a/libarchive/archive_read_support_filter_by_code.c
 +++ b/libarchive/archive_read_support_filter_by_code.c
-@@ -49,8 +49,10 @@ archive_read_support_filter_by_code(struct archive *a, =
int filter_code)
- 		return archive_read_support_filter_xz(a);
+@@ -50,8 +50,10 @@ archive_read_support_filter_by_code(struct archive *a, =
int filter_code)
+ 	case ARCHIVE_FILTER_B64:
  	case ARCHIVE_FILTER_UU:
  		return archive_read_support_filter_uu(a);
 +#if ARCHIVE_VERSION_NUMBER < 4000000
@@ -180,7 +183,7 @@ new file mode 100644
 index 0000000..fe0e500
 --- /dev/null
 +++ b/libarchive/archive_read_support_format_rpm.c
-@@ -0,0 +1,1126 @@
+@@ -0,0 +1,1157 @@
 +/*-
 + * Copyright (c) 2026 Davide Beatrici
 + * All rights reserved.
@@ -520,19 +523,25 @@ index 0000000..fe0e500
 +				rpm->state =3D ST_HEADER;
 +			} else {
 +				enum rpm_cpio_format cpio_format;
++				int filter_appended =3D 0;
 +
 +				if (!rpm->compressor) {
 +					/* No compression. */
 +				} else if (strcmp(rpm->compressor, "zstd") =3D=3D 0) {
 +					r =3D archive_read_append_filter(&a->archive, ARCHIVE_FILTER_ZSTD);
++					filter_appended =3D 1;
 +				} else if (strcmp(rpm->compressor, "xz") =3D=3D 0) {
-+					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_XZ);
++					r =3D archive_read_append_filter(&a->archive, ARCHIVE_FILTER_XZ);
++					filter_appended =3D 1;
 +				} else if (strcmp(rpm->compressor, "gzip") =3D=3D 0) {
-+					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_GZIP);
++					r =3D archive_read_append_filter(&a->archive, ARCHIVE_FILTER_GZIP);
++					filter_appended =3D 1;
 +				} else if (strcmp(rpm->compressor, "bzip2") =3D=3D 0) {
-+					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_BZIP2);
++					r =3D archive_read_append_filter(&a->archive, ARCHIVE_FILTER_BZIP2);
++					filter_appended =3D 1;
 +				} else if (strcmp(rpm->compressor, "lzma") =3D=3D 0) {
-+					archive_read_append_filter(&a->archive, ARCHIVE_FILTER_LZMA);
++					r =3D archive_read_append_filter(&a->archive, ARCHIVE_FILTER_LZMA);
++					filter_appended =3D 1;
 +				} else {
 +					archive_set_error(&a->archive,
 +						ARCHIVE_ERRNO_FILE_FORMAT,
@@ -546,6 +555,31 @@ index 0000000..fe0e500
 +					return r;
 +				}
 +
++				/*
++				 * Since libarchive 3.8.11 (upstream PR #3694),
++				 * archive_read_append_filter() no longer bids and
++				 * initializes the appended filter itself; that is
++				 * deferred to archive_read_open1(). As the RPM format
++				 * reader appends its decompression filter after the
++				 * archive is already open, bid and initialize the newly
++				 * added filter here, mirroring archive_read_open1().
++				 */
++				if (filter_appended) {
++					struct archive_read_filter_bidder *bidder =3D
++						a->filter->bidder;
++
++					r =3D (bidder->vtable->bid)(bidder, a->filter->upstream);
++					if (r < 0) {
++						archive_set_error(&a->archive,
++							ARCHIVE_ERRNO_FILE_FORMAT,
++							"Cannot bid %s filter", rpm->compressor);
++						return ARCHIVE_FATAL;
++					}
++					r =3D (bidder->vtable->init)(a->filter);
++					if (r !=3D ARCHIVE_OK)
++						return ARCHIVE_FATAL;
++				}
++
 +				cpio_format =3D rpm_get_cpio_format(a);
 +				switch (cpio_format) {
 +				case CPIO_STR:
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-f=
ilter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005=
-Disable-RPM-filter-auto-bidding.patch
index 86eb48a8045..3a4f7368df9 100644
--- a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-a=
uto-bidding.patch
@@ -1,4 +1,4 @@
-From b367b31b5b764e15c8d484a75c790b6ffa1e20d8 Mon Sep 17 00:00:00 2001
+From 82ccfb45b0aacb275b0228ec3b3dd2522e5393e9 Mon Sep 17 00:00:00 2001
 From: Sumanth Gavini <sumanth.gavini@windriver.com>
 Date: Tue, 11 Aug 2026 12:02:31 -0700
 Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb b/meta/r=
ecipes-extended/libarchive/libarchive_3.8.11.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.10.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.11.bb
index 747a6b99693..034aeab7ebd 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.11.bb
@@ -37,7 +37,7 @@ SRC_URI =3D "https://libarchive.org/downloads/libarchive-=
${PV}.tar.gz \
            "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
-SRC_URI[sha256sum] =3D "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee750=
62efbe164cc57c"
+SRC_URI[sha256sum] =3D "900fe9fc7237c2b04f090f3c3648de8fe597525771f5035016=
537ce2d667d12b"
=20
 inherit autotools update-alternatives pkgconfig ptest
=20
