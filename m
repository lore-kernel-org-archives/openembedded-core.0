Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9755.1793615272387184078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WqPGRlsi;
 spf=pass (domain: est.tech, ip: 52.101.69.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtXVDv2+2FWnT17deuU13ugBaaLjuq+pITJvRisSdu9HQxQGDg6CHL62KsVT6yqXD75ItX06aL2g5Gwi8ZJhBpDkeGM325uzc9sMtXZRCysPL2mILQEPN4xR84Pe1wfb0Xs2ws9Z3kvTn2eGro9SaWI0GcCfYx/VrfpYtalw4eisvHM/PWUhswU84mMn9HthmcI5kR4RFn0anlOLJCdm8QTfo6q7GbiGZGBsgpL5skKKgZnUEMAS9XrEsib+L23S5b/QqRjiHspX6/7+6eWwMGj7Aq1FfhG6N7P0BumydC2+dnsD9HE51lGdIhiCq2IlbHFAWupCzG+IFANxwgat1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7hduFZRHzONol49HMIbiiyotFxC7x2QxUluoMK09B8=;
 b=JiK/1+TWZRHvs/bI3x2Wbli4wyzlZdfZt5GJ7tjonA6MODXNzW3Htt+WLjMZaMLMvwTZofo8AjS76LNcHzEaMMtDYkhrkJQiHaXxhFBHMXgPTlnvaOwx4mQjEC76sWcRWXKcTuII07ArG4Yqk0pHnG/oG/hXAkv8Vw1NZU/wM5cPwYGRM0jn8bOBO+ugc2CEYW8DCZlRtujDTjdwkXHp8JmRkDJBPiT5DBADoBVAU2UCwRGgnhdHO31huMQ+H5MMf3b+5KVfdTPr9lFvlyimDzM7Zt3wd3/mhO0qWTI+e2be7AingS6cRDf5l/6Fn1hVj5wFfEnqHpqg80eSbzgZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7hduFZRHzONol49HMIbiiyotFxC7x2QxUluoMK09B8=;
 b=WqPGRlsijgYInytV7Wkss9zUzyGLFBZCPoBVN2JHuA4grmQRsf29QUMoQOhcW92/NnkaHhspr7BJ/V+fHmnQAnmUdQ1i62ZaGisa0Vvti8uIFq8JlTEhsdKbX4fQH1qceJf73OdeY010O9JCZCwyxVBqS+JJGVTVFUp/5c73Hb1999Ps+moWyPtmcY33cNfnagKERkYlD9xaDEjr4V8CnuZKFer03HKs3lxNnQGgnhQZz7XUD1iJwqUEJWPER2w/h20Ag9XZktX4IByZVC29h4uRclU1Fr6W1s1VN1C1tV7J6CXoYE2Ev7ao9+1N+ma3zYaUZgx4k5nlUp0maeE++g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1991.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:506::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:27:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:27:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libarchive: upgrade 3.8.10 -> 3.8.11
Date: Mon,  2 Nov 2026 11:27:42 +0100
Message-ID: <20261102102742.31991-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
References: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1991:EE_
X-MS-Office365-Filtering-Correlation-Id: da88e2d4-09a4-43b8-92aa-08df38cbf18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|260925021911599003|260925021311599003|260925022911599003|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022115727099003|261022105027099003|10067099003|12006099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: HHUOuLArMYyk2Lp9zS9yqm6KAEkBAU5ljqk9r2XknZlaxKVQHUEJUYwttpZRgY6xyGsOvHcfIFlWUfIlgWvC6pF919u5PelMQDEUdYcCKX3sP/vdYpja+5uSIVxEQnPhCsysESg+Y3MMFJjdESrT0IQNtlhUB/b87AuyXGUqkq4cKDv4wSQvWW+5ZIlGiY+p3KIJjJxYiNxq6pBBhYLCRDh4TvSe16AKHMShfXd0bivEUixTXQy4YW0P0/9jY2wiSXe5XD20s/jEk1B2z9mJqi8agAGid95tE/9n1e/Kg5WbQ9h83yiVaqBORxIYGJKRhFYvO5ttuDr9R/wKSjni88QnHPzrSiZH+Vcl8YvUai1ghlsGkGAYgpbfUpcI7YerPgBLC3/yPCCY1+tMz6TXiVZEDCeAzX43h/RG73QBjCQnh8OUSP01aQZxveMgbX5RlYBwgC1N1ndRvWind87aDiH0t00ifRFsKFeKxofRy/I9kZ2AIm9F9GRgKo3klExELGvCBvmf+rV1TUaV4mG6zhr/qVuupYhkwJAHaethS0PBwF9qMznOFSOARhR83dVWpLISNpCuLhAEpDBqahkj6J/FOm92FVeWF47gGQfsQZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022105027099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PR721NuX7JqoStLT8xV1/xVTyA5C+uDRHgQHfcBu6Fve30MaHc9te3di7vh/?=
 =?us-ascii?Q?6aVUOWAf1u5nIbpgwSrMidswmd5IDDxQrXq7JVmdkhwGMepkNaKtfntD8QxP?=
 =?us-ascii?Q?WFE8N0FSjV0h9mlJDUCwQhogTIdCQJXfl4mFfiNRHZb+lzy5BNu6OPZWovu1?=
 =?us-ascii?Q?7nC7F9cHyGxJvl2PEJ8ATvN2/FEsDj0Md60Lk1ONSRCVzvXV+qEKfysQ4Yrh?=
 =?us-ascii?Q?4nPMC1rOCyirrpm6rv8raNekNq2WpSMOGdBUcn8m65rr2JRpVl35sC6/oLZa?=
 =?us-ascii?Q?eiP3I5SkAVOEERsSYrITAk7tTub+wmJvtUpCGADskWwElTUk3l+FZ2/CJbG+?=
 =?us-ascii?Q?n3hhjwYXmOMI0FpDsRiF7G+2H90Yyt0Gvi5E1nq+22rliEl1NL4rQhujThLQ?=
 =?us-ascii?Q?l1E5f6xiRqiuNThl7ysvWy9Jyt/OMflPR5RGWBS8/JsvfoS7nY0dOOSEbB4W?=
 =?us-ascii?Q?iOdiSw6ONIj+regXCrqvWD1526SReCrSVnJdbHTEopUtgjCqTjhlOEoxAkU1?=
 =?us-ascii?Q?ZEwHLP6FFbKsiOlW+6s1R0ls+eMEjW/qoVyHYrq9CKf6+uBY8rB2gjmCvnqZ?=
 =?us-ascii?Q?w7wd6xdB0zLyhScIZRLVNlVBAv2BH5dMOVByVMHX3qse2hkTk3sREA1flX8s?=
 =?us-ascii?Q?35XakIhVks86u1ZUthkDBgfw82QVt5UbjBXQhmwQpY2rfYHOvbLeWOY/WFLG?=
 =?us-ascii?Q?peRF7YWDZZ316sTeL+b9FmWcJBdhEYeNIICPrenfWoj4UFXYcYoU1rcq87KD?=
 =?us-ascii?Q?CaD04J3kWfBa+Z8uKLZ33Yt1sVKsyJkMo3vQN8RW5dbD7HZgFN/bzBRpYDbh?=
 =?us-ascii?Q?dGYe9eE9qhyCeFZXzwZ+pBHdSkWatLpXISJt9Bssx1ddlpoCJhFDrpgj7Jkl?=
 =?us-ascii?Q?02dF3sH3AewqAdi4PJvS7AJsicszDZQMhEWF7hE4zCFesNNkwohfWlzeen4M?=
 =?us-ascii?Q?opnKK45+Bf+k1duw/fCpnViwj4NNJpOrkR9RCC0OWVZ2DgS3RC3SLTDqHfzT?=
 =?us-ascii?Q?dj0PnIyo+czT3gxUytnR7lb7Rda+Fjt4HUibZgNq88WoIsaZofEj+zZlb1og?=
 =?us-ascii?Q?jj1etoe+GTwJzaFe83hQCM3fUAJ4XIeoHySKkIIy0hvmA7l/Be0MVTgXbWFU?=
 =?us-ascii?Q?2hJ40NxU/NybaL6+PHsy7M4V3W6QETAvfC+xxPk4Ebh5EFatyyO+h+6dPHxz?=
 =?us-ascii?Q?FdyQD8o9z87eKVxAVcLfumYqGKDZkL6WUaclWnvGf6R6R1N9TrGNjCidQcIn?=
 =?us-ascii?Q?QxreTnLY4GqIKnuoQm665xxj7rV1DWHoIXOv0/9w3+SCarDRVynQKCJZ1Ysf?=
 =?us-ascii?Q?iwNvJP8OitqokGKASlOa03REihPAGp6NT1FAZxgCOwfnp62yB0CtLgS0rsUu?=
 =?us-ascii?Q?nQzFmvUuAXFPXPpJJ7vP5DPc7vdnSYen52GvofalyCZl5w6+MHZ/Teh9CfW1?=
 =?us-ascii?Q?luHCNW+xH9b55hL2Q4IgIxhAfEzI7PXo3O82D+Wawls2hC9g4BMSPWsEmf76?=
 =?us-ascii?Q?Wow+rTeup1GSjb6tqY8DjLenDDaruOkChmxzxUsmAOVURZZ9Nsawq6/d4b3j?=
 =?us-ascii?Q?g6XlY9cSnkYqyP7e6SDL1gRZrMws/220ecKHqrmk+P1eLAvrVZ+t9cVbxQiY?=
 =?us-ascii?Q?B/rJNRhvbqxFQAKNuZZ4HtA7CX3nED29ARVyVI3Tw0rtvEUXsXZpmRnq+9Ku?=
 =?us-ascii?Q?YgUR/UpHsp6kAgfK/uWSuguojnzIV3AYneNY1+96tUmBADdbpYxhhK29+DKe?=
 =?us-ascii?Q?SnP2Pr8QTg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: da88e2d4-09a4-43b8-92aa-08df38cbf18b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:27:49.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V45VHvZ/5rCiqXJy19e7eyaaS+x/yEr47A2khz9SdUfd2AJ4trgiS5wbuuxunYu2hAM/rsuPt0MtYRkv6GtzLMy9vNRdSt1MdsSFpQBPQLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 10:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249199
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/libarchive/libarchive/releases/tag/v3.8.11

Libarchive 3.8.11 is a security and bugfix release.
Security and Bug Fixes

    see ChangeLog [https://github.com/libarchive/libarchive/compare/v3.8.10=
...v3.8.11]

Thanks to all contributors and bug reporters!

Full Changelog: v3.8.10...v3.8.11 [https://github.com/libarchive/libarchive=
/compare/v3.8.10...v3.8.11]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...er_bidder-Allow-ARCHIVE_STATE_HEADER.patch |  9 ++++----
 ...vert-RPM-reader-into-a-proper-format.patch | 22 +++++++++----------
 ...0005-Disable-RPM-filter-auto-bidding.patch |  2 +-
 ...archive_3.8.10.bb =3D> libarchive_3.8.11.bb} |  2 +-
 4 files changed, 17 insertions(+), 18 deletions(-)
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
index 34c0cf415e7..0344919b632 100644
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
@@ -27,11 +27,11 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 14 files changed, 1154 insertions(+), 14 deletions(-)
+ 14 files changed, 1155 insertions(+), 13 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
=20
 diff --git a/Makefile.am b/Makefile.am
-index 8bc70c5..487bef3 100644
+index c171c24..0c150c0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -212,6 +212,7 @@ libarchive_la_SOURCES=3D \
@@ -67,7 +67,7 @@ index ac039c1..34ba173 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index 19b316a..f04a747 100644
+index 2c13908..64dbdaa 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
 @@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct=
 archive *,
@@ -80,7 +80,7 @@ index 19b316a..f04a747 100644
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
@@ -88,7 +88,7 @@ index 19b316a..f04a747 100644
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
@@ -98,7 +98,7 @@ index 19b316a..f04a747 100644
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
@@ -149,11 +149,11 @@ index f086773..cc5c2b2 100644
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
