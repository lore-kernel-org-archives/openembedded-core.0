Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25270.1794827826394116264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cz6pEkqM;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpSbEwHOYKQ+ACFnlwZ/VGay37r8BRgic/jo2bUisC9PN7yhAq2j2qyNEYyqBijnL1iD1qwqvkoyIk8X96uBB32rjTeVtJ+OnfAPtR9H6uwqfc3Vq7MZ5wLHiKjChpA364Omfq7JAlNebajC9h6L74XqqDcUVms4hrPnt5gEHwzqQIEIfIkRKLa1FM8HV3HOf7BrvFNo01/JrAAoHcfSXWgcPCbi61xv75QFRNH1K5vN9bvo1tW1iuJA0tYUMTjiT+jcmWqSbyQF6uRKPaPzP2/KrfAN7ZQt57viJ+bTECVxHlODmhfbe04LBR+0u6aG6pJNyXigj/ot0TpEk66yPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOaZDQ+eSVY/ak3i0Dv/tSN5wloUtUqWmEMrNOaoXko=;
 b=PtWo3L8C1tHI2d87ILIzRBJo6mAng+Q/9XvXbxMYFluNwz89mJ44otEAjWvS751j37ehsf6kuLX9xlxZcOX9Rp6Iv/70QhKDRRx8www9Ia0n5y9F1tD0Ar/bOTfWZs7KGEfPcxBD8G7YAda8D7lWqMQLqtoCTKcysG9coHmj59/LYEtuL8j6ziuVXMBYTJEHDMyejkvP3vXxMPMzliwXUCpWNVSUYaJ5oHY1jYselYj29vO1pJPxOmnHATVr0isD7bSUBlLi5fQGcqW+OWX9XHFBs7cQcFNRqN2GvyPujR5RuiGz6vBxi7dB7eryBEID1ObxT9s+GxqLSZD9cYRQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOaZDQ+eSVY/ak3i0Dv/tSN5wloUtUqWmEMrNOaoXko=;
 b=cz6pEkqMtgJED/IWpheZC8gH2N8HNrqOdvKG3krr/pNzU62q93yUnqD+F6G+POD18N4FPxFjq0ZbOzG+uUjZ4xH/XA5U1vAy2XR3fR6Kg0OfFlffYLz2gncuiA7pX0v1diy6/pbEzHlp/AdT3GhTVVDdHZVXU1w9Ygh1SSDTbb968kDae+oKo1kGGGw5FUczaOH2HqrkjeJCki7WzvJWx8YFmoos57tIxX4cOkXkA6i8eMfkXFaB4t6htWfZg9vMOHgqBAQaQJFw9JD3p7yqM9ccb0sgh7Gvq9asHWnfRtdCcE/S09pWTG/DDbNJHon5iH2rADxNeD5q5tnv+lCw7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1980.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:17:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] dpkg: upgrade 1.23.11 -> 1.23.12
Date: Mon, 16 Nov 2026 12:16:51 +0100
Message-ID: <20261116111658.7745-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1c868e-dec0-4e7b-549b-08df43d32589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: LmUgUOYiMnhxAMIm7hVcsEu6kjVwmczPQC561K30x0udzeaOiOq1bBEDgfCuQ2Wm0shp8VROTn2mR98q+EcaSve1Xj+JKsjW6YmCowW3lw4bt/7PdSYifaa+69HLBsWjiDFEmhkRZr289wWznCkINXryVY4ixSoSexaNbL2Rnatc3566gosA6/hgfjHZbdQUM04C9Ru5//IWLhsOpEL/9E1okjV/n5vwc2UkYDlpBEup6pa/SDd9xTE+zs4TBLSsz3qcmlKSJpyX01ieHCj7n0ZEza6HcImQlbT5atgy433BY9WJxnKoXRyIgUztJ/1Mu+8voIBC1YJgsJe4rBNleGPZLc+RRHW+rZz9rIKFf/0R/Ngo7l5IfFLDLaF+ZylAYs3uAa1ENbStOduoindVCjatZ1avkkhR6voZ9Sws1NSHaqMA5d4cJs+8ZDf2QVsDkZS2fcahjwtHhr/bd/9tmw6Cyogrci4zTVkB1GwjQK8/LP0QwzP1O9BoiYw61lXIF0PsKfTdSNGle+N7LclMDvndEu4gHX/HciY94a94eaXFF/2/7d+DRrckuv8bM1b6BUzuzD4zxJmZAaVRBLqzA4bOnNe75+bhQa16OOZ1Ba0FkjA9ND6MOxzzzKqJh96p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rnbkjOk5XNZDc021L+x0tyqG8ODJLqtMBbCvP66QR6NWunnzL1lceunjC0UX?=
 =?us-ascii?Q?xqb8CqyVJaT+lW/F5iBMbwSeFrB0lnT0HLoKRd+87WXwn1PNEng2PHx7MsGP?=
 =?us-ascii?Q?hsoRAupCQ180uRYinQOeGmGyR7lKzddSfGze3YkZD7crw/nHaZF9ehBkQCBQ?=
 =?us-ascii?Q?YlpXz1qi1N1m0Xp6G5B7/zeBEJifMSyeqDVupxtVp7SegNSBGdeFICo1Lb2A?=
 =?us-ascii?Q?5WI4uKjGSdql2XmVIaLq/EXdk+oM+3eYf0x5XyF6DP8F7kVjkWhUj1agXzxw?=
 =?us-ascii?Q?8KUfgbTfwYiHErO3PzfUL8Iq3IQU3MqOS8Lw+ncNoctDpc6sBkezcJcVSPEL?=
 =?us-ascii?Q?NdEHFlYQ798vSAwRr9xGOULraA7ByTquGggxjkfygO0j7HNXWjJNHJT5JRpN?=
 =?us-ascii?Q?6Y6Dk0QHonJ+kljjahr14Z3mxM1pXpwmmvP+pj9tKvrboiLU8vc+b1Fcpj7b?=
 =?us-ascii?Q?4FJcIaPu2I5W8W/eZVdNmNNJUhsYp6+XptpQkvCpFXzJS3hpeUxP3/EQodmQ?=
 =?us-ascii?Q?GRl+klYrAnn/L/uEZ3zCWDpx1JNnS6WdzcwX0QZMFUUT24GAiUPLVzpyMJm/?=
 =?us-ascii?Q?GWefD2v0tRM/MS96+8JPm8Tsgfimh2FFyFhEtc6gCiILVmQmSfZvxkoPj5af?=
 =?us-ascii?Q?Gagwb5R+H+2ZWJA3ru18+jpv0T4DvkixVLwjmLD7Vm+OXk7k6GrKI+lhBnUE?=
 =?us-ascii?Q?GEZLBLUK9wzryi8+xAlKENkow5Fi0YG8sBVkX5qc/khmopmMxyIqQfL4seEc?=
 =?us-ascii?Q?l3XkTTQsnPdddIQ9WAdE4Y8x9cNBVgTwnC3JhkVLeFDJfl5V1B0xtLyclz0h?=
 =?us-ascii?Q?0ctjIt2Py1G+QB7NnRoh3DVC78NphP3gRMSwN8z2lwdXw70jOghKA3zZjoax?=
 =?us-ascii?Q?LcMrV8YtGakw9PR+o0Nebl75afyo6OQqWbV+LlAVu0Bi2GYxshlQk8k+tVbr?=
 =?us-ascii?Q?+pkaMrFC5rzea9Y3U7jp27y76lC+C8rN1LhjzlJWv9FtrwwjGXgDS69xOjPv?=
 =?us-ascii?Q?cWlUMdpHC0qMTMfuvZwmAYsUMEwgGD4USPz1g89qFJY1w5uPJQ266VHnvHsn?=
 =?us-ascii?Q?ldoyu5m2HDdH+ni9HmrJC6R3dgNT9L6P2SRkkYLl7EXLh2WVMBNxnwh69blQ?=
 =?us-ascii?Q?vnAmyVCS1LuMEHhMjaDd51GNYgQot8hqhwtvF5nQMOQkU4sNQQ1K+C5xM1/p?=
 =?us-ascii?Q?x5TMUFLfotc/ULP3ZAvr2pOOTzmHktzMTmRlrHXj1Et3gnQT5H7G0CPYS0u8?=
 =?us-ascii?Q?Sj7ntk4BVv6zAARR/VkJjadLBnVYa5iajHeqxkGf6ibJLacEDy0lf9GbldrC?=
 =?us-ascii?Q?KCB8PaN/PTx76wPeDVWMwUM/4KArjBU5EvkT52XQveuR3R0WhmW4P/OjFLN9?=
 =?us-ascii?Q?9AauXNSAZNsFv4pcfo38I5QIrteI7yBLzEWwykiqshZm/sMosFUHsHin5zm8?=
 =?us-ascii?Q?S1f+smK4/VuHPc2QttLLLaNfRCQzuTGD8KHFadtgqvmfR+JwZLekuW3F34VR?=
 =?us-ascii?Q?GMkH0luFmBLTuVCmNOpK35YGzQaWpvYWm8mOpW4e6iTeyCB7afkO6PcnfW4q?=
 =?us-ascii?Q?kzWXGP5NTW4+jBFAdB4dF193NkP2PIyfkNpw+IfMihowNnulUmIMmuryTry4?=
 =?us-ascii?Q?SB/irzwXhbuyvk/bvVmtVpNdz+4pkcQLC1aK1m/jbCC3ARFi2tTn+X53NW9X?=
 =?us-ascii?Q?m0i0UB9kCOCMy97dctUV2lzT1FXKjCng5T6O0oj+oXhQZRhJXAzQRBa0aVPF?=
 =?us-ascii?Q?lT9OKcA6kw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1c868e-dec0-4e7b-549b-08df43d32589
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:05.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwOzLyosLgRGqPOkC+ngbe5y3D06C9Ek7GBYSuJ57f3IZXNbS5rWH/jmjX5u+kLwe+emNiGiE3uZUe0naeZepHG+0sNzJU8joS6Bmk3ptms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250331

ChangeLog: https://git.dpkg.org/cgit/dpkg/dpkg.git/tree/debian/changelog?h=
=3D1.23.12

- Drop 0001-pkg-log.c-Add-missing-header.patch which is part of release
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Add-support-for-riscv32-CPU.patch    |  6 ++--
 ...ild.c-ignore-return-of-1-from-tar-cf.patch |  8 ++---
 .../0001-dpkg-Support-muslx32-build.patch     |  6 ++--
 ...-dirs.c-set_rootfs-was-not-checking-.patch |  4 +--
 .../0001-pkg-log.c-Add-missing-header.patch   | 29 -------------------
 .../0001-script.c-avoid-use-of-chroot.patch   |  7 ++---
 ...rs-kernel-version-which-has-characte.patch |  6 ++--
 ...tion-doesn-t-work-properly-for-all-s.patch |  7 ++---
 ...add-musleabi-to-known-target-tripets.patch |  6 ++--
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch |  6 ++--
 .../dpkg/dpkg/add_armeb_triplet_entry.patch   |  4 +--
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch |  4 +--
 meta/recipes-devtools/dpkg/dpkg/noman.patch   |  4 +--
 .../dpkg/dpkg/remove-tar-no-timestamp.patch   |  6 ++--
 .../dpkg/{dpkg_1.23.11.bb =3D> dpkg_1.23.12.bb} |  3 +-
 15 files changed, 35 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-miss=
ing-header.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.23.11.bb =3D> dpkg_1.23.12.bb} (=
90%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-C=
PU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU=
.patch
index 834c5116e0..58c6f9acc5 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patc=
h
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patc=
h
@@ -1,4 +1,4 @@
-From ced05d08a83a55ae557228b613619e465be491dd Mon Sep 17 00:00:00 2001
+From f14a986d8991b49f5c7655cc0331928640bfd001 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/cputable b/data/cputable
-index 0da0281c3c27..14cb42f2ef8a 100644
+index 0da0281c3..14cb42f2e 100644
 --- a/data/cputable
 +++ b/data/cputable
 @@ -43,6 +43,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
@@ -23,7 +23,7 @@ index 0da0281c3c27..14cb42f2ef8a 100644
  s390		s390		s390			32	big
  s390x		s390x		s390x			64	big
 diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.pm
-index 15f0840f82cc..5d462caada32 100644
+index 028ed272a..98f1913ad 100644
 --- a/scripts/Dpkg/Vendor/Debian.pm
 +++ b/scripts/Dpkg/Vendor/Debian.pm
 @@ -216,6 +216,7 @@ sub set_build_features {
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-=
1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-r=
eturn-of-1-from-tar-cf.patch
index fc96dbfff3..232b52f0e2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-=
tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-=
tar-cf.patch
@@ -1,4 +1,4 @@
-From e13096fb5b55c9c4d7f05da5963eff4c2cde8d15 Mon Sep 17 00:00:00 2001
+From faf72f65f33732e407c54a973b14b3fc47f90333 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@microsoft.com>
 Date: Sun, 8 Feb 2026 21:34:54 -0800
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -31,10 +31,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/src/deb/build.c b/src/deb/build.c
-index f7a0156f1275..67e758185b6b 100644
+index b080ea3b0..c7a109862 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -526,6 +526,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
+@@ -529,6 +529,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
  {
  	int pipe_filenames[2], pipe_tarball[2];
  	pid_t pid_tar, pid_comp;
@@ -42,7 +42,7 @@ index f7a0156f1275..67e758185b6b 100644
 =20
  	/* Fork off a tar. We will feed it a list of filenames on stdin
  	 * later. */
-@@ -591,7 +592,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
+@@ -594,7 +595,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
  	 * job. */
  	close(pipe_filenames[1]);
  	subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-buil=
d.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.p=
atch
index 12f56147aa..6d0665b151 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From 14b3bbbcfd8505c3833bbb40d2472a23d1bcf5ef Mon Sep 17 00:00:00 2001
+From 7a3ecc7f502728d978836754de555acbf63582af Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
@@ -13,7 +13,7 @@ Signed-off-by: sweeaun <swee.aun.khor@intel.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/ostable b/data/ostable
-index edfa2e0b27a6..a40f7c7fa578 100644
+index edfa2e0b2..a40f7c7fa 100644
 --- a/data/ostable
 +++ b/data/ostable
 @@ -21,6 +21,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
@@ -25,7 +25,7 @@ index edfa2e0b27a6..a40f7c7fa578 100644
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
  abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
 diff --git a/data/tupletable b/data/tupletable
-index 6168027dc761..42162bc93f7e 100644
+index 6168027dc..42162bc93 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -26,6 +26,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-s=
et_rootfs-was-not-checking-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-li=
b-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
index 36401e112a..7d00979f27 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_root=
fs-was-not-checking-.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_root=
fs-was-not-checking-.patch
@@ -1,4 +1,4 @@
-From 4958631014017b179406396bd600a4eb40792be2 Mon Sep 17 00:00:00 2001
+From 5102d7ecbe673346c7239889e9b3743bf90a1979 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@kernel.crashing.org>
 Date: Sat, 17 Jan 2026 20:20:23 +0000
 Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
@@ -18,7 +18,7 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org=
>
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/dpkg/options-dirs.c b/lib/dpkg/options-dirs.c
-index 9b7a122fe92a..34869d792fc5 100644
+index 9b7a122fe..34869d792 100644
 --- a/lib/dpkg/options-dirs.c
 +++ b/lib/dpkg/options-dirs.c
 @@ -49,13 +49,18 @@ set_admindir(const struct cmdinfo *cip, const char *va=
lue)
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-hea=
der.patch b/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-head=
er.patch
deleted file mode 100644
index 8ff56bce96..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-header.pat=
ch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0fd1a56b750c42efe392d58fd97a57841ca27491 Mon Sep 17 00:00:00 2001
-From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
-Date: Thu, 10 Sep 2026 10:58:19 +0200
-Subject: [PATCH] pkg/log.c: Add missing header
-
-Build is failing with some compilers, as free() is not declared. Add the
-missing stdlib.h include.
-
-Upstream-Status: Submitted [https://lists.debian.org/debian-dpkg/2026/09/m=
sg00012.html]
-Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
----
- lib/dpkg/log.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/dpkg/log.c b/lib/dpkg/log.c
-index ae65ed4092a3..ef9b209d42a6 100644
---- a/lib/dpkg/log.c
-+++ b/lib/dpkg/log.c
-@@ -29,6 +29,7 @@
- #include <fcntl.h>
- #include <unistd.h>
- #include <stdarg.h>
-+#include <stdlib.h>
-=20
- #include <dpkg/i18n.h>
- #include <dpkg/dpkg.h>
---=20
-2.47.3
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chr=
oot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chro=
ot.patch
index 6152ac8e1c..eee3129f70 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.pat=
ch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.pat=
ch
@@ -1,4 +1,4 @@
-From 4e720386c346db10c0fcd8b20078c05d38c85951 Mon Sep 17 00:00:00 2001
+From 272886f41c30c1405395fbc8d49d19075a3d5289 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:17:43 -0800
 Subject: [PATCH] script.c: avoid use of chroot
@@ -25,7 +25,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 53 deletions(-)
=20
 diff --git a/src/main/script.c b/src/main/script.c
-index 951cdfe7b4e9..102740798617 100644
+index 218d481c8..b479d1993 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
 @@ -99,60 +99,10 @@ static const char *
@@ -92,6 +92,3 @@ index 951cdfe7b4e9..102740798617 100644
  }
 =20
  /**
---=20
-2.47.3
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel=
-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Ad=
apt-to-linux-wrs-kernel-version-which-has-characte.patch
index a74937dd10..bf7f8456b2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-versio=
n-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-versio=
n-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 804e3cc382fc28f2c67dd34fc42997b70d61b337 Mon Sep 17 00:00:00 2001
+From 0e1094db6031ba913355bb61ade6221af326ba5f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:11:56 -0800
 Subject: [PATCH] Adapt to linux-wrs kernel version, which has character '_=
'
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
=20
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 307b7705a522..82713c0088c7 100644
+index 59861fba0..fc569343b 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -303,18 +303,16 @@ parseversion(struct dpkg_version *rversion, const ch=
ar *string,
+@@ -305,18 +305,16 @@ parseversion(struct dpkg_version *rversion, const ch=
ar *string,
  	ptr =3D rversion->version;
  	if (!*ptr)
  		return dpkg_put_error(err, _("version number is empty"));
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-does=
n-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-Th=
e-lutimes-function-doesn-t-work-properly-for-all-s.patch
index 4c28d1aa51..acb9394b63 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-wor=
k-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-wor=
k-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 49df215996fb32133e0e4e3ecdedda301c5259bd Mon Sep 17 00:00:00 2001
+From 9626dc25597efbddb01549f5b5775ff345e47fd3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:21:43 -0800
 Subject: [PATCH] The lutimes function doesn't work properly for all system=
s.
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/src/main/archives.c b/src/main/archives.c
-index ff778bc9cf22..a58b27c2eb3a 100644
+index ff778bc9c..a58b27c2e 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
 @@ -557,9 +557,11 @@ tarobject_set_mtime(struct tar_entry *te, const char =
*path)
@@ -29,6 +29,3 @@ index ff778bc9cf22..a58b27c2eb3a 100644
  #endif
  	} else {
  		if (utimes(path, tv))
---=20
-2.47.3
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-tar=
get-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-kn=
own-target-tripets.patch
index ace4339956..1707f7cba2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tri=
pets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tri=
pets.patch
@@ -1,4 +1,4 @@
-From 98da13e96cd24feb19f7f2f1e4cf2b54208b8897 Mon Sep 17 00:00:00 2001
+From 397a2ee1a3469c86cb5cbeff8cb4a413d075dac2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
@@ -17,7 +17,7 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
.intel.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/ostable b/data/ostable
-index 5e7490fb49bf..edfa2e0b27a6 100644
+index 5e7490fb4..edfa2e0b2 100644
 --- a/data/ostable
 +++ b/data/ostable
 @@ -19,6 +19,7 @@
@@ -29,7 +29,7 @@ index 5e7490fb49bf..edfa2e0b27a6 100644
  eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
 diff --git a/data/tupletable b/data/tupletable
-index bc1fcc5ab808..6168027dc761 100644
+index bc1fcc5ab..6168027dc 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -24,6 +24,7 @@
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-u=
sage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpk=
g-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 83ec737e41..1597b9f71a 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of=
-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of=
-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From d75a9ae0653ad5f5153af6f6ff7a9b39aa9d50ef Mon Sep 17 00:00:00 2001
+From 52f2e1d3322a85a3eb6092bae7d3dc2ae4670677 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 8 Feb 2026 21:25:06 -0800
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
@@ -32,10 +32,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 259c6251ccf2..f7a0156f1275 100644
+index 3189eeb39..b080ea3b0 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -553,7 +553,6 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
+@@ -556,7 +556,6 @@ tarball_pack(const char *dir, filenames_feed_func *tar=
_filenames_feeder,
  		                 "-cf", "-",
  		                 "--format=3Dgnu",
  		                 "--mtime", mtime,
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch =
b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index 5793e82092..5ebf438f20 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,4 +1,4 @@
-From 0535ba354ed82144695178d3831f2db7e7945be4 Mon Sep 17 00:00:00 2001
+From 9f8ac9a0f868a17185d59a6fa034df7c5241e76b Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
@@ -34,7 +34,7 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
.intel.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/data/tupletable b/data/tupletable
-index 7c306d497962..bc1fcc5ab808 100644
+index 7c306d497..bc1fcc5ab 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -27,6 +27,7 @@ eabihf-musl-linux-arm		musl-linux-armhf
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-d=
evtools/dpkg/dpkg/arch_pm.patch
index 45d204bb63..b3b5dcdbdb 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From a9eab9d87b6c5e0eb5142d4004727b78749ca5d0 Mon Sep 17 00:00:00 2001
+From d77e3091b7fd69e3a279c91110a0ff8328c42882 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Sun, 8 Feb 2026 21:06:44 -0800
 Subject: [PATCH] dpkg: fix configuration issue for mips64
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
-index 3d9e3e97503b..05c6debc3cc7 100644
+index bdc5dc518..ea3bdb7e6 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
 @@ -326,9 +326,6 @@ sub _load_tupletable
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-dev=
tools/dpkg/dpkg/noman.patch
index 59edcd52da..57a23abfc4 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From 043745d8dbe5e11007491253a54246238b1ea67f Mon Sep 17 00:00:00 2001
+From d7a8690975dde80638707e5c1010f528b49154a0 Mon Sep 17 00:00:00 2001
 From: Chris Larson <kergoth@openedhand.com>
 Date: Tue, 5 Sep 2006 07:24:58 +0000
 Subject: [PATCH] Add dpkg, modified from upstream oe.
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index db480795ff72..737d8fe981fe 100644
+index c04557e5b..74063d90a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS =3D \
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch =
b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index 95de076943..a4d506d6be 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From 60d32f2a547c28d7cf7ccb3842664ee8135f2eca Mon Sep 17 00:00:00 2001
+From c3ffa337de08eb6b7c7c0e93f988ee53876dddf4 Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
 Date: Sun, 8 Feb 2026 21:03:30 -0800
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/deb/extract.c b/src/deb/extract.c
-index 16d559f8303a..0cc390ce9767 100644
+index ad9cb4e83..826c11c00 100644
 --- a/src/deb/extract.c
 +++ b/src/deb/extract.c
-@@ -371,7 +371,6 @@ extracthalf(const char *debar, const char *dir,
+@@ -372,7 +372,6 @@ extracthalf(const char *debar, const char *dir,
 =20
  			command_add_arg(&cmd, "-f");
  			command_add_arg(&cmd, "-");
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.23.11.bb b/meta/recipes-devt=
ools/dpkg/dpkg_1.23.12.bb
similarity index 90%
rename from meta/recipes-devtools/dpkg/dpkg_1.23.11.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.23.12.bb
index 94e881096c..31eb30dfb0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.23.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.23.12.bb
@@ -15,9 +15,8 @@ SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;pr=
otocol=3Dhttps;branch=3Dmain;
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking=
-.patch \
-           file://0001-pkg-log.c-Add-missing-header.patch \
            "
=20
 SRC_URI:append:class-native =3D " file://0001-build.c-ignore-return-of-1-f=
rom-tar-cf.patch"
=20
-SRCREV =3D "c32c7e899b28627a2b2e9aa260ff09ca585141c3"
+SRCREV =3D "f78cedcdcbbf25b27f3104b99ac3d2832e19d0cc"
