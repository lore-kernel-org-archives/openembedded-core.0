Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1755.1793039733437749156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 11:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vD/LITQq;
 spf=pass (domain: est.tech, ip: 52.101.83.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JetW2kSiBsmb3s11PaBayjVNGiWhQajrrl/wSaPwcN7R1QzdI7Wb1mN5F5B72YpjTnbwBNfpjgoH20/3kYB+SSqVnaj9XKt1OGhQL7Y+525bErdsV02wq4+jh7/Gi2Z6F86IS0jjMBw9l6+XXE+IJz41F+fTykrqgAExKbU/Vkysp6wIIHQ/RvF3DkfIKuAE21MvQbmT13G/c1haN62Sl7cRLNpIaeQ38JD/3WTPtgP5i3lvCu7ZXb4nxMWiu2eBlQdMzt9rM3Qwe64Xp/GhtLbGzLFrTmQQksfZJghjc4Fbl8JWRndU6DwQwlI/k9ro6pTpMuVFNdFg19yzyDx9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTAigJ103eqN8CpD2F991An78lnDQC/On8ZMEZVzz8k=;
 b=puhla7N+xr4GCpc7dy6GsPRh8MmPZjkEvf8Ylxs7x6K9S6IhpwBF77rsm6q9dewvm2/xo7oEe5Ieyt9CPxrTM0qB74Hh18n3h8zLH85Yt0McPPcMz+eikO5yZqwUS7ogBLb1Ae4ItODwa5Yj27iAtnHM5e83c0EDHuPqk8SmaKFVx3X8cI0tg5+THeZGnZ/mvy6X1h7osVESSUgeKVHsxIo7faNLgeJNvz5J14dl+G2XdgBpzatz0zMKUSjPY19v2ip/10kmsUUqHqAl8VxBQb+9k7HLi9deZvi5L9FdJXCVdRdcyLgOPFwzj+8jw7m6GI2w7aXlti4ZbkpMUDoA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTAigJ103eqN8CpD2F991An78lnDQC/On8ZMEZVzz8k=;
 b=vD/LITQqr/9iNpOdZq0oI9KSb9wci55kpjGI3ZeTs+Vwt8Zsi7mdBAONzdkO197ofFD5do+rsFtonW+viRiJXJ4iYbEu4oCM7Bus7vUtWTL09SesyUjOA1mLVWoDO2y4F3SKwbgdancatsPwOueasxtZ8IcJT6sRi4dxae76LgPhpRnDVMg5pc+mwHkWsD4zAUlIgebcH+yuRYpM41t72rHZlmKjw2gRcvwhswtptKlHMeLq/J3rp07ZQDDarTfNyTE2PCWFp086ExsyRfR4RYCHWYIgXio5U8f5kw810BYqols3EcODASjbQ9phjEbhX5dvvzri2UOq9ttIFA1G/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVQP189MB062586.EURP189.PROD.OUTLOOK.COM (2603:10a6:710:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 18:35:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 18:35:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Upgrade 4.0.3 -> 4.1.0
Date: Mon, 26 Oct 2026 19:35:24 +0100
Message-ID: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DD99.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6d7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVQP189MB062586:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0e3e5d-2f6c-4cf5-d26a-08df338fe743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|261026121527099003|261026135527099003|11063799006|56012099006|10067099003|261021135927099003|261022115727099003|261022075727099003|261021133027099003|261022105027099003|261009223027099003|261021121427099003|261021130227099003|261022113327099003|261021123027099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: j7/pm6h0qkiyL2PbFAh6nWvOg+tXygPr9vgxYAVH5mve/1Q8QcWRky5jzOB4oDPwf3GUU8Pwp/y/ImG6p18wdtXYb8HFfzLgw5PTmVEAe/Hm/cA+qe2OonR7bVfH8UIWzNzupzvnPI+bL5t/d/qqoMQpe/X+4M5amTWDxlnE9ZNFkrw/f7TGQ1VhxOjIFAvUjECxRtws3SRMUjsjV6sk9OmJgQFADw8GpeRapVg28LkE86a/9AA6qwVFp+sSnOALPACl7pdwLATSPdJv9q/cEBZQh17B/h481bt2WTZ3xrDzHPK8h+8XDbOmcKzq8mycKQcuDvsDet5WFDPxjofaLNmCV2TQshPhsSfKFaAfj/VNQD+qka40gQnSJ5ZV1hkK2WjcKTr1+fyoaQtekJysc5lm6il7MtTbHvvOuARza7a6RvnJt3i+jtX8gjASWDKXI+MiBJ5B/L6D97AOHMn4xBHfkfal0qA6Vk8y1IT2euyT8M6D1SFSFt+J/jlIx/DgYfWAY5/uNGoVS3h0nn7vjG8V1lqxOGqvy53nuKJpgqcV30YbYQpqIVO8rb7SyhG9zKys0w3aekZJ4PTtPZnAr0Z7LtOFHjXJmDOgJik07TXa9zmSGs7v6C+ewLBOCTZ1ZQHq8foElAYTHy7Cinw+3U2J+xnCiczaFx03+vRNYqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(261026121527099003)(261026135527099003)(11063799006)(56012099006)(10067099003)(261021135927099003)(261022115727099003)(261022075727099003)(261021133027099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021130227099003)(261022113327099003)(261021123027099003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4vGsWh1Sh89RElqysVMYzol61gtV9R3NR3/8/K/taS3SHkgcrqXAd9IMqYYi?=
 =?us-ascii?Q?/c0B6kofUHWqq8kbNLQQKINsdJtTHFDTpZ7o+dYf6DwqSVuyQe/MBH+2TQRD?=
 =?us-ascii?Q?aWvpTOQ+bk3Ta21l1MDikQL9HsD23wAQ38neEvBAlwEFFUM3ctounTicNbwm?=
 =?us-ascii?Q?1xHwtVvUd9Xtl/IUdvqyOT6fR+txQ6/kmc8NWckEfeKYwLyiiAIUigd6vvqE?=
 =?us-ascii?Q?khAZK3I8Hfs3GwGPLtcvaaYmYdzNRTHfhPRDPLYHNVH+Mb+/r1dMltSsthOo?=
 =?us-ascii?Q?txn2TUydGXWlyDe/Tx9oX49yFYT8ePjkjdpeQmezucMHjDnrjDgDPvBBoyjY?=
 =?us-ascii?Q?H5DvJg4DFy65Otpzg5IsDhatPrgbJ/kYaBV/3216jVUlIX2gtFielBpmpiUS?=
 =?us-ascii?Q?GKicRX6li73qJJuJY/I9+eityOpLfofTby7VL5KRBLbJJpAoxDOWEMywD4vh?=
 =?us-ascii?Q?2kbKLrYuZ5RQawZY7r92VLKMXAsg/LoPaNgZI1gaq78TmNlEO1QkI4li5jIu?=
 =?us-ascii?Q?8vMUKG5BDVHJRFTk7UmNOOCsxmyUOCmRDAZfMBriUwQLYvhbSDKOMrApUEWF?=
 =?us-ascii?Q?aZon4rS9Lzd7QQSfhhxflzrI63HG7zJP/a2ScnFaVDmOxxh+taQ2spZPib64?=
 =?us-ascii?Q?XWwYdLcfyt60Aibro1u8T5nQfAQF/8IBeRXiQaPGEX/madUrx5FMUpUYedQi?=
 =?us-ascii?Q?xLGovhCqC69Wybn+jlEVY6zhakYnz3gzN4BbK3386627g3O0PiAxtDP6jCc2?=
 =?us-ascii?Q?7pj2rCv0B4E4uO/OvxDifMd01R2HKLZBexTLk4LD4j1aTTdWsuMw9IEizNe6?=
 =?us-ascii?Q?2DCURI/+B0UYOGfNiKeoK7ACaoqQbFGpbB7in+eF4sLRDwMqzc0K4+LnYhbN?=
 =?us-ascii?Q?B9E1Yr29oNHrIRGrMrA3QCyqIpNPKDMr17efxHir9balydkawsKY0PGOHsN7?=
 =?us-ascii?Q?H0Soalme/oqvNwPB7pwcErxgNXQ0yCoHgNnViLkyHtKtrd9MmVgGOOYl0Jra?=
 =?us-ascii?Q?XUOwhqmOgVWGvttiFkS4i2B0aLFfD7MDFEfROOrmK+U0Kdze7g8xCNxcur2n?=
 =?us-ascii?Q?wh+D3Yfl7vO7gAo+wCZIEoB2Ru0F1DWAZV/Ev8yZKGtuL5j6/zAOS/8SKnN2?=
 =?us-ascii?Q?3G8ot5XukylK9xL4oENqxP17Rqdu/DB+oqmyVD4GJmMHYhwSkhos4X1/hhWe?=
 =?us-ascii?Q?IjZdmEMk/4inqNdudMQtnNdKg6cOEK39srFyF2q9IOQM+9tRS9WgOjMmEE3u?=
 =?us-ascii?Q?nqOB23uEpxV95I1cYVpnYAit2yWOaZjXk5CVOcmuf94OvLGIAN4hsOt75cE4?=
 =?us-ascii?Q?kcjASJ1sggo6h1/n/tXH5uqaJ3uF8b9tfBKPcFW668xO1dOxJFxn0i83rL+n?=
 =?us-ascii?Q?Sf+9mX7uACzeHDyWyklKBuUwFXF6OurBJzrjV9t9BbgYcM9JRl/WeNlWWk7U?=
 =?us-ascii?Q?C2ybnHqPUQKwrBSlBMkYB514N4ZhUZAJ6fZVji0XW95oeGx7q+7lc6Ex4WND?=
 =?us-ascii?Q?Fn5ip09B3DoZmrB2tIkR2fN/uHZmH92dh3FrSZr3dFkq14iy6cNE+PE0kVCy?=
 =?us-ascii?Q?4O3Ene2U5tggX5wa3ER/eIJkGsMZyDv0ZgIHqbSrRSMLBx41OR3uaxqXUGT9?=
 =?us-ascii?Q?lfuEychJgOFBkt3dX2QAfGYwvMAabuZZLcuQo9xhCCI3Xm+/ZItfPFGQuNlf?=
 =?us-ascii?Q?b7LV2T6u6myotrLH7gK5IVsUqY9iPNShLVIWQUWKNSTpWfEYwCKiYz420jqx?=
 =?us-ascii?Q?z3prxB4DAn10b1YKNjMwXH3zn/DmRjU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0e3e5d-2f6c-4cf5-d26a-08df338fe743
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 18:35:26.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ES0f1/YSq+1WJNVNWhHFpGPRsLUNp9cN4vTOHEio1sU81O+MUJnBQjqqbd0eQeEl3jdZrTkec75vlww8vbQjhWXJ77+r1MlWpJzyzAinj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVQP189MB062586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 18:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248692
Content-Type: text/plain; charset="utf-8"

  Release information [1]:

  OpenSSL 4.1.0 is a feature release adding significant new functionality t=
o OpenSSL.

  This release incorporates the following potentially significant or incomp=
atible changes:

  - Added VC-WIN32-MSVC2013 and VC-WIN64A-MSVC2013 build targets to provide=
 internal functions for bridging the gaps in C99 standard support that are =
present in MSVC 2013.
  - Added optimized ML-DSA and ML-KEM NTT operations on ppc64le; optimized =
ML-DSA operations on x86_64; AVX-512-optimized SHAKE x4 operations for ML-D=
SA on x86_64; AVX-512 and VAES optimizations for AES-CBC
  decryption on x86_64.
  - Changed tsget utility to use Net::Curl::Easy (from the Net-Curl CPAN di=
stribution) instead of the abandoned WWW::Curl::Easy. Users who rely on tsg=
et should install Net::Curl::Easy before upgrading.
  - Dropped Windows-on-Itanium (VC-WIN64I) and Windows CE (VC-CE) targets f=
rom Configurations.
  - Dropped no-ecdsa and no-ecdh options from Configure, as these options d=
id not really disable the implementations. Use no-ec to disable the ellipti=
c curve support.

  This release adds the following new features:

  - Support for DTLS 1.3 (RFC 9147). Refer to the ossl-guide-dtlsv13(7) man=
ual page for details.
  - Support for RFC 8701 GREASE (Generate Random Extensions And Sustain Ext=
ensibility).
  - DTLS support in the SSL listener API.
  - Support for IKEV2 KDF.
  - Initial support for the Elbrus2000 (e2k) architecture.

  [1] https://github.com/openssl/openssl/blob/openssl-4.1/NEWS.md#major-cha=
nges-between-openssl-40-and-openssl-410-23-oct-2026

- Refresh existing patches
- Verified with world

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Configure-do-not-tweak-mips-cflags.patch  |  6 +++---
 ...trip-sysroot-and-debug-prefix-map-from-co.patch | 14 +++++++-------
 .../0001-extend-check_cwm-test-timeout.patch       |  2 +-
 .../openssl/{openssl_4.0.3.bb =3D> openssl_4.1.0.bb} |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_4.0.3.bb =3D> openssl_4.=
1.0.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-no=
t-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-=
Configure-do-not-tweak-mips-cflags.patch
index 77bfe4e4e52..2991082a5f5 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
@@ -1,4 +1,4 @@
-From b5cee0cb0f14a78056ef7722a34b361491f1fdda Mon Sep 17 00:00:00 2001
+From 89d2702e00b0826fded82b06a9866e0fe7380540 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
=20
 diff --git a/Configure b/Configure
-index c05a30b..db8adee 100755
+index e66424a..62141fe 100755
 --- a/Configure
 +++ b/Configure
-@@ -1575,16 +1575,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
+@@ -1617,16 +1617,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
 =20
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip=
-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/ope=
nssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patc=
h
index 1d9e7539f67..04f46a3d3e2 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 6df53bfebcf8ca65910a18220a6576fb110918a5 Mon Sep 17 00:00:00 2001
+From 4df92463252f8f0695db0143d3a26566a1736b2c Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compil=
er
@@ -34,12 +34,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 16 insertions(+), 2 deletions(-)
=20
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makef=
ile.tmpl
-index eff66e5..bc48f51 100644
+index f8a5b16..807439f 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -503,13 +503,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || ()=
,
-                          '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
- BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
+@@ -532,13 +532,27 @@ BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
+ CMOCKA_LIBS=3D{- $config{cmocka_libs} // '' -}
+ DETOURS_LIBS=3D{- $config{detours_libs} // '' -}
 =20
 -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
 +# *_Q variables are used for one thing only: to build up buildinf.h
@@ -67,10 +67,10 @@ index eff66e5..bc48f51 100644
 =20
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
 diff --git a/crypto/build.info b/crypto/build.info
-index 8e4a885..95b0902 100644
+index 422f4aa..3573af9 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -114,7 +114,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
+@@ -113,7 +113,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
 =20
  DEPEND[info.o]=3Dbuildinf.h
  DEPEND[cversion.o]=3Dbuildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cw=
m-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-check_cwm-test-timeout.patch
index 26622fd1b18..29b9728479f 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
@@ -1,4 +1,4 @@
-From 07bbd037ca61264bcc311856a119b664ce13f586 Mon Sep 17 00:00:00 2001
+From ff0de34474c0dfec4f13dfb4079689c8731bf6ce Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.3.bb b/meta/reci=
pes-connectivity/openssl/openssl_4.1.0.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_4.0.3.bb
rename to meta/recipes-connectivity/openssl/openssl_4.1.0.bb
index 122bf61f595..1e47c3cf348 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.1.0.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1=
e28d2d2fd216d9"
+SRC_URI[sha256sum] =3D "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4=
b241c7e90cc2fd"
=20
 inherit lib_package multilib_header ptest perlnative manpages
=20
