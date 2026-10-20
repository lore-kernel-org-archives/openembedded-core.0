Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2677.1792484806639338816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=hQ1BWSRP;
 spf=pass (domain: ericsson.com, ip: 52.101.83.49, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8rWpPszoSS7T9bXqPerH/caXmQ/M6FQbPG0OKuAqDLbJ+3Kq0lBzkYtJCOe4/KUKqwWxiG8Qp5Aj08DpEMbbr8Z7DUXLYg+R5f++MiQzCkGnJHZWBiCdRJvzYdbQGMGIpuSu/rqYbbZ5ch0JvsXuDNSEFqkNRD71Ptrhl1bgClZgNfCi/DA1TGPYTYltBAwajFzLGu+6n5fMoqXCW7JQRgCYLltmSs3xLOGWFm1up4IiHKXuUmlBZT6tSAYuN0Xs5og7kvebx/7CEx1/9lLcmrsqFiXdgnRaAnqTmNLrdQAVnjSiNN3D60sDn41M0hiSIBtpLp3qJYgOsJykbgdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o96EkTaFYHkiqep9gjgov/nSqZmCiadR1fKY4iOzh90=;
 b=uBQTqcET3YtVEs4TVpWdtJNCXGHHXXAEH3IwxlpIWy/EwSr6pfUhHCtUpUfBhIeAqS812moperJbIurVqzVadTg3wvawNaYLRp6Q/MfVCcVmAFIow8Sn9+80nWUtjVa1XHiwq8+3dz11NOEhbdeBpD72DrxWzEFx/pxjThIZEb0E386+nS+fANYu39fPBQFCvTJha2pS6yZtoJxAz2fVP/P1t/lC92qX6ebpie5HogOw49SEvhzWt/+/EB0z7X9oCoMPo89Ol1m02gl3GPSGarEzhaGLu+LL5YttBoRm8o7pTt4lYF12ZYt7+QudDo9z4Sw5DOnaHtCNEle6GeSyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o96EkTaFYHkiqep9gjgov/nSqZmCiadR1fKY4iOzh90=;
 b=hQ1BWSRPSnQ7/6DjZwpRfgJh5Wka/g8HYjN+HGRV+Hhcq/b3EXs4G4XSu0ViE3domitSBu6V1dPZB5eXgmBoKFt1/QG2EkBDEQu8fBnMD+ZO23voqW7R78F11qWlLv5bQtPAHjJ44R6OBELQxtgvgrrubl6GF1tLnwFoDdbY/e6Gx+MrqesmDi5yDecNnrBV7fS5lCTM+lgzPPAeu8bURL5KmeOppc8QAUDI4JHnTJlNJeGsy2X2CJNPIqIpPJejeeQUeW55gCMgceUdjpYM+V4nOIeVLh3abevw42BobkU5eKhMwaXeIOWYjLMN+XqsEj/hOckgwmn4Wswke7nWNg==
Received: from WA2P291CA0002.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1e::22)
 by AS8PR07MB7573.eurprd07.prod.outlook.com (2603:10a6:20b:289::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 08:26:37 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:1d0:1e:cafe::66) by WA2P291CA0002.outlook.office365.com
 (2603:10a6:1d0:1e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:26:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 08:26:36 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id E05FF95805;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 817FD700384A; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 7/7] libgcrypt: upgrade 1.12.1 -> 1.12.4
Date: Tue, 20 Oct 2026 10:26:11 +0200
Message-ID: <20261020082611.3115623-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|AS8PR07MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c3ffb9-a3b9-406f-70df-08df2e83db8f
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|260925022911599003|56012099006|260925021911599003|11063799006|260925021311599003|261009223027099003|10067099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: GlcuGtjum6KJKtvrbDYKCJB3htqSozgsy9ogRK1i6zaGFQ9wxJoCsgogjDrg0AhbVgH1K/SbYSpKRYPD12zrOujm6u3JGBQzaJo6Y422xeQp5ec2um5VTiYz0Tj1cxBqqt6/Kt7Hc1BXhZezNa5gfcjci2ClYGoVzmdDVwa/xSK+sdWYKsG0W0VbLKAIWoG12aVTsHV5E+9QRBw7pV9xyaCxgp7IL04TxjQUja2ciNiDrpfkASIMz0yBkmNRXNs5dPtVQmJnHCQuZ4HSyRnBVG6EwUEoiqYu8oj1trKvcLec4EaxYZY961qidxkszSBzHPJo0mclvl4UzsVG0yVzyE9Lj5hgYkgFvPKCqjIBnbgAU8k1sBaD/IdVMTRTVJpsHxrURD7vTivzsj3yqQetGzqWDUYxf/eJ3Xpf+tisg9Dw6FR2dQnRDDSBANd6FhJWJr98cD3Vb1nWNPyxUaPt5AN1mBHSdgo6O2RfccZ31MIMfezZeFDDut9Rb8FYApj7BC+y6HpkJVWXq9ZeCwE/qAAnvRSeBgzkYsLIeHJcHS0ZdtecJk7w+qCoSyIzR3rDPTrTbhlpTWJwJfn/y3ZE47hqXjodleSgo7pRe6tRichz80A2p4soRIpiXGUZ9Q+BmwIk6cIoXbCdFpHgeiBzPKuBn9wvGsPXrH1ra79MLnRQhmLGZ6KVjvvw3YgOU8jDxxYrfqEF9+P2mJHhfOCHOw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(260925022911599003)(56012099006)(260925021911599003)(11063799006)(260925021311599003)(261009223027099003)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A2ZMMwIxIyuu82vMPatzvP5Shm+YQtcGuePKeM1WxASkAF1uWPjje1hHapPTFM9nkt+weKo1T5MQB19VKooF8Vo0dVU47dr8uAXhIXj7afg/9Yu1FkBNudipYfD5DUxFxVMxug0JvBvgauIA4NOY7vWjKV9uVDg6P87CR0waq5Po54tR7ioSd98g/rBccVySB3XHcVNhz8BJpdoWP+grnVK25CIKm0i41qtrmdnmHIqJmcQisL+9hMA+BDSvtFaOKUHPDioTmmSjVrhrITcN329cqnuLD8/zRbAdgylsOlfNM3KjfOi09iA/GT9IqUZqVnMwnjblXwbUdRhNWRK2JDsFP7kLjuCp8g9bmA7N+a+e8uBldarMlbSOVQP9OzGpiPD/Ii3ibKVNytKhzZG88MN4+Y3jBipO72pj/uXGC1ZmCErnlin9jep7EzfiLvir
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:36.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c3ffb9-a3b9-406f-70df-08df2e83db8f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248253
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Bug fixes in 1.12.2-1.12.4 (per NEWS):
- T8208: missing bounds check in Dilithium context handling
  (CVE-2026-41990)
- T8211: possible ECDH buffer overwrite with zeroes (CVE-2026-41989)
- T8212: missing point validation in the new KEM interface
- RSA PSS/OAEP salt-length and padding validation; s-expression
  parsing and KDF parameter hardening; various AEAD/MAC overflow and
  OOB-read fixes

Both carried CVE patches backported the Dilithium and ECC fixes above,
now redundant and dropped. The pubkey-dilithium.c conflict was caused
by two unrelated upstream commits (dilithium glue fix, stronger
signature nonce random) touching the same file.

Verified do_compile succeeds on qemux86-64 and qemuarm_musl.

License-Update: LICENSES gained a BSD-3-Clause notice for the new
Intel SM3 AVX2 assembly file (cipher/sm3-intel-avx2-amd64.S).

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...s-Fix-link-errors-for-t-thread-local.patch |  13 +-
 .../libgcrypt/files/CVE-2026-41989.patch      |  42 ---
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ------------------
 ...ibgcrypt_1.12.1.bb =3D> libgcrypt_1.12.4.bb} |   6 +-
 4 files changed, 7 insertions(+), 370 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.pat=
ch
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.pat=
ch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb =3D> libgcrypt_=
1.12.4.bb} (89%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-error=
s-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-test=
s-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c..c4c59dcf87 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t=
-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t=
-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From bf307ed66f9c33502f27c04c60f9e6c99d7dda7a Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,18 +21,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index 3baaf48..cc2fd6b 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ testapi_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS_KLU=
DGE@
+@@ -103,7 +103,7 @@ testapi_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS_K=
LUDGE@
  t_lock_LDADD =3D $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_=
KLUDGE@
  t_lock_CFLAGS =3D $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD =3D $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FO=
R_TESTS_KLUDGE@
 -t_thread_local_CFLAGS =3D $(GPG_ERROR_MT_CFLAGS)
 +t_thread_local_CFLAGS =3D $(GPG_ERROR_MT_CFLAGS) -lpthread
  testdrv_LDADD =3D $(LDADD_FOR_TESTS_KLUDGE)
-=20
- # Build a version of the test driver for the build platform.
---=20
-2.34.1
-
+ t_cipher_internal_CPPFLAGS =3D $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
+ t_sntrup761_CPPFLAGS =3D $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/me=
ta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
deleted file mode 100644
index aba3ca318b..0000000000
--- a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d8874dd38f78454dd3a760617ebe8d9aa9270649 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 10 Apr 2026 16:58:57 +0900
-Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
-
-* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
-mistake and add updating RAWMPILEN.
-
---
-
-Reported by Calif.io in collaboration with Claude and Anthropic
-Research.
-
-GnuPG-bug-id: 8211
-Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
-Suggested-by: Bronson Yen <bronson@calif.io>
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-CVE: CVE-2026-41989
-Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/2d3d732=
c9bf87cc10729f69678dd9e6862f99fa3]
-
-Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
----
- cipher/ecc-misc.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
-index 615b0df2..ab3799dc 100644
---- a/cipher/ecc-misc.c
-+++ b/cipher/ecc-misc.c
-@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t e=
c, mpi_point_t result)
-         *--p =3D *buf++;
-=20
-       if (rawmpilen < nbytes)
--        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
-+        {
-+          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
-+          rawmpilen =3D nbytes;
-+        }
-     }
-   else
-     {
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch b/me=
ta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
deleted file mode 100644
index a4f1809227..0000000000
--- a/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
+++ /dev/null
@@ -1,316 +0,0 @@
-From 024391fc505ebf9c47e51953d7d85995ba179576 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 13 Apr 2026 11:51:46 +0900
-Subject: [PATCH] cipher:dilithium: Check the label length by caller.
-
-* cipher/dilithium.h (dilithium_keypair, dilithium_sign)
-(dilithium_verify): Return gpg_err_code_t.
-* cipher/dilithium.c (dilithium_keypair): Return gpg_err_code_t.
-(dilithium_sign, dilithium_verify): Ditto.  Check CTXLEN.
-* cipher/pubkey-dilithium.c (mldsa_generate): Follow the change.
-(mldsa_sign, mldsa_verify): Likewise.
-
---
-
-Reported by Calif.io in collaboration with Claude and Anthropic
-Research.
-
-GnuPG-bug-id: 8208
-Co-authored-by: Thai Duong <thai@calif.io>
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-CVE: CVE-2026-41990
-Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/905e00f=
046a71e5670517779afaf85a354952832]
-
-Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
----
- cipher/dilithium.c        | 101 ++++++++++++++++++++++++++++----------
- cipher/dilithium.h        |  20 ++++----
- cipher/pubkey-dilithium.c |  34 +++++--------
- 3 files changed, 99 insertions(+), 56 deletions(-)
-
-diff --git a/cipher/dilithium.c b/cipher/dilithium.c
-index 955feb2a..212c4afe 100644
---- a/cipher/dilithium.c
-+++ b/cipher/dilithium.c
-@@ -82,6 +82,7 @@
- #include "gcrypt-int.h"
- #include "const-time.h"
-=20
-+/* With glue code, we only use the "_internal" API of Dilithium.  */
- #define DILITHIUM_INTERNAL_API_ONLY 1
-=20
- #include "dilithium.h"
-@@ -120,23 +121,33 @@ static int crypto_sign_verify_internal_5 (const uint=
8_t *sig, size_t siglen,
-                                           const uint8_t *pre, size_t prel=
en,
-                                           const uint8_t *pk);
-=20
--int
-+gpg_err_code_t
- dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
-                    const uint8_t seed[SEEDBYTES])
- {
-+  int r;
-+
-   switch (algo)
-     {
-     case GCRY_MLDSA44:
--      return crypto_sign_keypair_internal_2 (pk, sk, seed);
-+      r =3D crypto_sign_keypair_internal_2 (pk, sk, seed);
-+      break;
-     case GCRY_MLDSA65:
-     default:
--      return crypto_sign_keypair_internal_3 (pk, sk, seed);
-+      r =3D crypto_sign_keypair_internal_3 (pk, sk, seed);
-+      break;
-     case GCRY_MLDSA87:
--      return crypto_sign_keypair_internal_5 (pk, sk, seed);
-+      r =3D crypto_sign_keypair_internal_5 (pk, sk, seed);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_INTERNAL;
-+
-+  return 0;
- }
-=20
--int
-+gpg_err_code_t
- dilithium_sign (int algo, uint8_t *sig, size_t siglen,
-                 const uint8_t *m, size_t mlen,
-                 const uint8_t *ctx, size_t ctxlen,
-@@ -145,9 +156,17 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen=
,
-   size_t i;
-   uint8_t pre[257];
-   size_t prelen;
-+  int r;
-=20
--  if (ctx =3D=3D NULL && ctxlen =3D=3D -1)
--    prelen =3D 0;
-+  if (ctx =3D=3D NULL)
-+    {
-+      if (ctxlen =3D=3D -1)
-+        prelen =3D 0;
-+      else
-+        return GPG_ERR_INV_DATA;
-+    }
-+  else if (ctxlen > 255)
-+    return GPG_ERR_INV_DATA;
-   else
-     {
-       /* Prepare pre =3D (0, ctxlen, ctx) */
-@@ -158,28 +177,44 @@ dilithium_sign (int algo, uint8_t *sig, size_t sigle=
n,
-       prelen =3D 2 + ctxlen;
-     }
-=20
-+  /*
-+   * Note that the second argument of the upstream routine is the
-+   * pointer to output length of signature.  It assumes the first
-+   * argument (pointer to output signature) should have correct (or
-+   * more) length, beforehand.
-+   *
-+   * Before calling the routine, we should check the length.
-+   */
-   switch (algo)
-     {
-     case GCRY_MLDSA44:
-       if (siglen !=3D CRYPTO_BYTES_2)
--        return -1;
--      return crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r =3D crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     case GCRY_MLDSA65:
-     default:
-       if (siglen !=3D CRYPTO_BYTES_3)
--        return -1;
--      return crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r =3D crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     case GCRY_MLDSA87:
-       if (siglen !=3D CRYPTO_BYTES_5)
--        return -1;
--      return crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r =3D crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_INTERNAL;
-+
-+  return 0;
- }
-=20
--int
-+gpg_err_code_t
- dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
-                   const uint8_t *m, size_t mlen,
-                   const uint8_t *ctx, size_t ctxlen,
-@@ -188,9 +223,17 @@ dilithium_verify (int algo, const uint8_t *sig, size_=
t siglen,
-   size_t i;
-   uint8_t pre[257];
-   size_t prelen;
-+  int r;
-=20
--  if (ctx =3D=3D NULL && ctxlen =3D=3D -1)
--    prelen =3D 0;
-+  if (ctx =3D=3D NULL)
-+    {
-+      if (ctxlen =3D=3D -1)
-+        prelen =3D 0;
-+      else
-+        return GPG_ERR_INV_DATA;
-+    }
-+  else if (ctxlen > 255)
-+    return GPG_ERR_INV_DATA;
-   else
-     {
-       /* Prepare pre =3D (0, ctxlen, ctx) */
-@@ -204,16 +247,24 @@ dilithium_verify (int algo, const uint8_t *sig, size=
_t siglen,
-   switch (algo)
-     {
-     case GCRY_MLDSA44:
--      return crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r =3D crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     case GCRY_MLDSA65:
-     default:
--      return crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r =3D crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     case GCRY_MLDSA87:
--      return crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r =3D crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_BAD_SIGNATURE;
-+
-+  return 0;
- }
-=20
- typedef struct {
-diff --git a/cipher/dilithium.h b/cipher/dilithium.h
-index 88a48094..dc18f158 100644
---- a/cipher/dilithium.h
-+++ b/cipher/dilithium.h
-@@ -64,16 +64,16 @@
- #define DILITHIUM_SIGN_STACK_BURN (161 * 1024)
- #define DILITHIUM_VERIFY_STACK_BURN (122 * 1024)
-=20
--int dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
--                       const uint8_t seed[SEEDBYTES]);
--int dilithium_sign (int algo, uint8_t *sig, size_t siglen,
--                    const uint8_t *m, size_t mlen,
--                    const uint8_t *ctx, size_t ctxlen,
--                    const uint8_t *sk, const uint8_t rnd[RNDBYTES]);
--int dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
--                      const uint8_t *m, size_t mlen,
--                      const uint8_t *ctx, size_t ctxlen,
--                      const uint8_t *pk);
-+gpg_err_code_t dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
-+                                  const uint8_t seed[SEEDBYTES]);
-+gpg_err_code_t dilithium_sign (int algo, uint8_t *sig, size_t siglen,
-+                               const uint8_t *m, size_t mlen,
-+                               const uint8_t *ctx, size_t ctxlen,
-+                               const uint8_t *sk, const uint8_t rnd[RNDBY=
TES]);
-+gpg_err_code_t dilithium_verify (int algo, const uint8_t *sig, size_t sig=
len,
-+                                 const uint8_t *m, size_t mlen,
-+                                 const uint8_t *ctx, size_t ctxlen,
-+                                 const uint8_t *pk);
- #endif
-=20
- #if defined(DILITHIUM_MODE)
-diff --git a/cipher/pubkey-dilithium.c b/cipher/pubkey-dilithium.c
-index 03958bb0..8c3f650e 100644
---- a/cipher/pubkey-dilithium.c
-+++ b/cipher/pubkey-dilithium.c
-@@ -170,7 +170,7 @@ mldsa_generate (const gcry_sexp_t genparms, gcry_sexp_=
t *r_skey)
-       memcpy (seed, seed_supplied, SEEDBYTES);
-     }
-=20
--  dilithium_keypair (info->algo, pk, sk, seed);
-+  rc =3D dilithium_keypair (info->algo, pk, sk, seed);
-   _gcry_burn_stack (DILITHIUM_KEYPAIR_STACK_BURN);
-=20
-   if (!rc)
-@@ -206,7 +206,6 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gc=
ry_sexp_t keyparms)
-   size_t data_len;
-   const unsigned char *sk;
-   const struct mldsa_info *info =3D mldsa_get_info (keyparms);
--  int r;
-=20
-   if (!info)
-     return GPG_ERR_PUBKEY_ALGO;
-@@ -258,17 +257,14 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, =
gcry_sexp_t keyparms)
-   else
-     randombytes (rnd, RNDBYTES);
-   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
--    r =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
--                        NULL, -1, sk, rnd);
-+    rc =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len=
,
-+                         NULL, -1, sk, rnd);
-   else
--    r =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
--                        ctx.label, ctx.labellen, sk, rnd);
-+    rc =3D dilithium_sign (info->algo, sig, info->sig_len, data, data_len=
,
-+                         ctx.label, ctx.labellen, sk, rnd);
-   _gcry_burn_stack (DILITHIUM_SIGN_STACK_BURN);
--  if (r < 0)
--    {
--      rc =3D GPG_ERR_INTERNAL;
--      goto leave;
--    }
-+  if (rc)
-+    goto leave;
-=20
-   rc =3D sexp_build (r_sig, NULL, "(sig-val(%s(s%b)))", info->name,
-                    info->sig_len, sig);
-@@ -300,7 +296,6 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, g=
cry_sexp_t keyparms)
-   size_t data_len;
-   const unsigned char *pk;
-   const struct mldsa_info *info =3D mldsa_get_info (keyparms);
--  int r;
-=20
-   if (!info)
-     return GPG_ERR_PUBKEY_ALGO;
-@@ -350,17 +345,14 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data,=
 gcry_sexp_t keyparms)
-     }
-=20
-   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
--    r =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_le=
n,
--                          NULL, -1, pk);
-+    rc =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_l=
en,
-+                           NULL, -1, pk);
-   else
--    r =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_le=
n,
--                          ctx.label, ctx.labellen, pk);
-+    rc =3D dilithium_verify (info->algo, sig, info->sig_len, data, data_l=
en,
-+                           ctx.label, ctx.labellen, pk);
-   _gcry_burn_stack (DILITHIUM_VERIFY_STACK_BURN);
--  if (r < 0)
--    {
--      rc =3D GPG_ERR_BAD_SIGNATURE;
--      goto leave;
--    }
-+  if (rc)
-+    goto leave;
-=20
- leave:
-   _gcry_pk_util_free_encoding_ctx (&ctx);
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.4.bb
similarity index 89%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
index d7b3e182cd..4dedcc49ce 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
@@ -12,7 +12,7 @@ LICENSE:${PN}-dev =3D "GPL-2.0-or-later & LGPL-2.1-or-lat=
er"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e \
                     file://COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
-                    file://LICENSES;md5=3D034b4e369944ad4b52a68368f1cf98b8=
 \
+                    file://LICENSES;md5=3D47e346a71a2593d19f741408407fe91f=
 \
                     "
=20
 DEPENDS =3D "libgpg-error"
@@ -25,10 +25,8 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.t=
ar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://CVE-2026-41989.patch \
-           file://CVE-2026-41990.patch \
            "
-SRC_URI[sha256sum] =3D "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d0=
3a91a79832aa3c"
+SRC_URI[sha256sum] =3D "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffa=
c2a193ea3d660e"
=20
 BINCONFIG =3D "${bindir}/libgcrypt-config"
=20
