Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4745.1792538586536163984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=hgfttr+U;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1480185e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538584; x=1793143384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIemcf4C6ZyXj9F5aG4w1s+yZFVtnpAUrFaUYQU+sjc=;
        b=hgfttr+U233juantgiJ9uHUHDzGsH0Xj46wAMXBFpP2QPkqYLK0qn9uDn7kAJ3+OXa
         owk/eR9sbnyE8Mc/dHYFjat1iHN7AGl2SodGVVKsJHvCtmkq6jn17Xim7ZQ58/ziaiai
         lo9JEycWOlBBez9fKx0CK+bdsHD5HemG6rNPI2rvuxjhfSK4Koy9aUhDJ5yDArHMOOE6
         2+aIOb7u/+O3TMKC3nHgo3wnyW9HVdrF5FIwXS/3ZlkUb2osQwAM+c6q9dNbHvzrCfXW
         BA3tBh73wKXutNTXSEBcbyXKC3i9woj9SKc3INByM6WgPwacAx/rtwRznbtMi8vnVFcy
         6yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538584; x=1793143384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eIemcf4C6ZyXj9F5aG4w1s+yZFVtnpAUrFaUYQU+sjc=;
        b=vBsaY6zqd1FlKtZJ04g0T1u9Rd+b8+7Wrl8GkgXQdjgxhYwk6WA12656jcp5Z3fguQ
         j1EKnzjt0nGYdBzcBVRQ0MeuapmkOeR226XLR1lU6DA2yBsHGk76WLuB3xVJ5vyR+Iqd
         WzhkXb4LNsBqPHWZXp7MBiPC2789mhplPD4BkoPvObAI6Q2eCIlS/3R3GUEG4DHb7Jnd
         8amchbLgEeQc2A6EITokCH6HrngxfjQURpm2F6BHniaUAKMxE32OFIyEMA9wgLfSE/uq
         cSLd/SVBIZLAQ7juoFwrEeLtfLSB/QaKVeImD33LEapKIve8dmOevLAv1yoedIigBYe/
         pF3A==
X-Gm-Message-State: AFq9FYLYLccgenaXR+QFvHo+iYepRx/HJniRVPAeXsd1oQ13Sj6V5OI/
	oqasesfl1QoiSkuUFB1MhdmYixEchJQH3VAJqKjwepoVjmqsC1ZRjPSigGvkKt/hO0X4R/EGMaR
	rV3WOUCs=
X-Gm-Gg: AYBFou1BFeFFb6zF4CZITYYZlbxwZJmpJ88J6GTKAprpcLnTpg+YcSf/1ZKvFZuppP6
	8QHEVMteHHRW703wpOSWMfMgHz7BjzRXVldddfF93pNWCbIEChNq5+KgtJXB5SUlUGFYK4ogCqQ
	6eYc1Ufqs7nuWdjlAhDPNpe32upaGg5yRIxfX0GCokbp2Czxjg9umxHBvWF+RwSd70nx/h4WSvW
	EFZ2NRCcG+GshXN6/U4EKnhQtopGLS8e0QvEHmuU9veXkPJcAbNjuJtcYMPwKOygnBhgm1Uxtau
	71iUOcT2nQLDhsM6I7AHGqmIHd1cLSBq3D2FeeW41p1/i77qmNXwyuW2ECbjznjdXR68qQ1RIcE
	6iQv6BDLdffx3vjhWs/XkTYM5MG5i2w8N6L7WzQYFD1Xmm39wdTThm+/5CN/mH1goLpW1V3+e/5
	ogzBbkLYuYuR+dCPqkiqzWp9PyYA8ejJNHpTtFkwTA6vpNl3h0zOETIOlfU469kuM5avcwNyVVE
	dK/BY3Jm+8Mzyo1Ztr4PgBo71/SQv8FxHJbZ3PieaGmivjBr8AWCa8/PImeyBLn53uVbAIBO860
	QsCSPNMIPzV9uvRNj9YoPBXNOt33Ny3lZ+hAMoDG44gOwQxaqeqbL/wE5781a17lWqRTG0LoxRm
	l
X-Received: by 2002:a05:600c:255:b0:4a1:e478:7878 with SMTP id 5b1f17b1804b1-4a1fa092b29mr37832375e9.18.1792538584599;
        Tue, 20 Oct 2026 16:23:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/25] libgcrypt: upgrade 1.12.1 -> 1.12.4
Date: Wed, 21 Oct 2026 01:22:33 +0200
Message-ID: <adc70690d770db7839ce113451ed0659c8d9ff93.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248342
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...s-Fix-link-errors-for-t-thread-local.patch |  13 +-
 .../libgcrypt/files/CVE-2026-41989.patch      |  42 ---
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ------------------
 ...ibgcrypt_1.12.1.bb => libgcrypt_1.12.4.bb} |   6 +-
 4 files changed, 7 insertions(+), 370 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.4.bb} (89%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c1..c4c59dcf870 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From bf307ed66f9c33502f27c04c60f9e6c99d7dda7a Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,18 +21,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index 3baaf48..cc2fd6b 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -103,7 +103,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
 -t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
- 
- # Build a version of the test driver for the build platform.
--- 
-2.34.1
-
+ t_cipher_internal_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
+ t_sntrup761_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
deleted file mode 100644
index aba3ca318b4..00000000000
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
-Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e6862f99fa3]
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
-@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t ec, mpi_point_t result)
-         *--p = *buf++;
- 
-       if (rawmpilen < nbytes)
--        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
-+        {
-+          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
-+          rawmpilen = nbytes;
-+        }
-     }
-   else
-     {
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch b/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
deleted file mode 100644
index a4f18092274..00000000000
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
-Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/905e00f046a71e5670517779afaf85a354952832]
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
- 
-+/* With glue code, we only use the "_internal" API of Dilithium.  */
- #define DILITHIUM_INTERNAL_API_ONLY 1
- 
- #include "dilithium.h"
-@@ -120,23 +121,33 @@ static int crypto_sign_verify_internal_5 (const uint8_t *sig, size_t siglen,
-                                           const uint8_t *pre, size_t prelen,
-                                           const uint8_t *pk);
- 
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
-+      r = crypto_sign_keypair_internal_2 (pk, sk, seed);
-+      break;
-     case GCRY_MLDSA65:
-     default:
--      return crypto_sign_keypair_internal_3 (pk, sk, seed);
-+      r = crypto_sign_keypair_internal_3 (pk, sk, seed);
-+      break;
-     case GCRY_MLDSA87:
--      return crypto_sign_keypair_internal_5 (pk, sk, seed);
-+      r = crypto_sign_keypair_internal_5 (pk, sk, seed);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_INTERNAL;
-+
-+  return 0;
- }
- 
--int
-+gpg_err_code_t
- dilithium_sign (int algo, uint8_t *sig, size_t siglen,
-                 const uint8_t *m, size_t mlen,
-                 const uint8_t *ctx, size_t ctxlen,
-@@ -145,9 +156,17 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
-   size_t i;
-   uint8_t pre[257];
-   size_t prelen;
-+  int r;
- 
--  if (ctx == NULL && ctxlen == -1)
--    prelen = 0;
-+  if (ctx == NULL)
-+    {
-+      if (ctxlen == -1)
-+        prelen = 0;
-+      else
-+        return GPG_ERR_INV_DATA;
-+    }
-+  else if (ctxlen > 255)
-+    return GPG_ERR_INV_DATA;
-   else
-     {
-       /* Prepare pre = (0, ctxlen, ctx) */
-@@ -158,28 +177,44 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
-       prelen = 2 + ctxlen;
-     }
- 
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
-       if (siglen != CRYPTO_BYTES_2)
--        return -1;
--      return crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r = crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     case GCRY_MLDSA65:
-     default:
-       if (siglen != CRYPTO_BYTES_3)
--        return -1;
--      return crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r = crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     case GCRY_MLDSA87:
-       if (siglen != CRYPTO_BYTES_5)
--        return -1;
--      return crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
--                                               pre, prelen, rnd, sk);
-+        return GPG_ERR_INV_DATA;
-+      r = crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
-+                                            pre, prelen, rnd, sk);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_INTERNAL;
-+
-+  return 0;
- }
- 
--int
-+gpg_err_code_t
- dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
-                   const uint8_t *m, size_t mlen,
-                   const uint8_t *ctx, size_t ctxlen,
-@@ -188,9 +223,17 @@ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
-   size_t i;
-   uint8_t pre[257];
-   size_t prelen;
-+  int r;
- 
--  if (ctx == NULL && ctxlen == -1)
--    prelen = 0;
-+  if (ctx == NULL)
-+    {
-+      if (ctxlen == -1)
-+        prelen = 0;
-+      else
-+        return GPG_ERR_INV_DATA;
-+    }
-+  else if (ctxlen > 255)
-+    return GPG_ERR_INV_DATA;
-   else
-     {
-       /* Prepare pre = (0, ctxlen, ctx) */
-@@ -204,16 +247,24 @@ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
-   switch (algo)
-     {
-     case GCRY_MLDSA44:
--      return crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r = crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     case GCRY_MLDSA65:
-     default:
--      return crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r = crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     case GCRY_MLDSA87:
--      return crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
--                                            pre, prelen, pk);
-+      r = crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
-+                                         pre, prelen, pk);
-+      break;
-     }
-+
-+  if (r < 0)
-+    return GPG_ERR_BAD_SIGNATURE;
-+
-+  return 0;
- }
- 
- typedef struct {
-diff --git a/cipher/dilithium.h b/cipher/dilithium.h
-index 88a48094..dc18f158 100644
---- a/cipher/dilithium.h
-+++ b/cipher/dilithium.h
-@@ -64,16 +64,16 @@
- #define DILITHIUM_SIGN_STACK_BURN (161 * 1024)
- #define DILITHIUM_VERIFY_STACK_BURN (122 * 1024)
- 
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
-+                               const uint8_t *sk, const uint8_t rnd[RNDBYTES]);
-+gpg_err_code_t dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
-+                                 const uint8_t *m, size_t mlen,
-+                                 const uint8_t *ctx, size_t ctxlen,
-+                                 const uint8_t *pk);
- #endif
- 
- #if defined(DILITHIUM_MODE)
-diff --git a/cipher/pubkey-dilithium.c b/cipher/pubkey-dilithium.c
-index 03958bb0..8c3f650e 100644
---- a/cipher/pubkey-dilithium.c
-+++ b/cipher/pubkey-dilithium.c
-@@ -170,7 +170,7 @@ mldsa_generate (const gcry_sexp_t genparms, gcry_sexp_t *r_skey)
-       memcpy (seed, seed_supplied, SEEDBYTES);
-     }
- 
--  dilithium_keypair (info->algo, pk, sk, seed);
-+  rc = dilithium_keypair (info->algo, pk, sk, seed);
-   _gcry_burn_stack (DILITHIUM_KEYPAIR_STACK_BURN);
- 
-   if (!rc)
-@@ -206,7 +206,6 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
-   size_t data_len;
-   const unsigned char *sk;
-   const struct mldsa_info *info = mldsa_get_info (keyparms);
--  int r;
- 
-   if (!info)
-     return GPG_ERR_PUBKEY_ALGO;
-@@ -258,17 +257,14 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
-   else
-     randombytes (rnd, RNDBYTES);
-   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
--    r = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
--                        NULL, -1, sk, rnd);
-+    rc = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
-+                         NULL, -1, sk, rnd);
-   else
--    r = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
--                        ctx.label, ctx.labellen, sk, rnd);
-+    rc = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
-+                         ctx.label, ctx.labellen, sk, rnd);
-   _gcry_burn_stack (DILITHIUM_SIGN_STACK_BURN);
--  if (r < 0)
--    {
--      rc = GPG_ERR_INTERNAL;
--      goto leave;
--    }
-+  if (rc)
-+    goto leave;
- 
-   rc = sexp_build (r_sig, NULL, "(sig-val(%s(s%b)))", info->name,
-                    info->sig_len, sig);
-@@ -300,7 +296,6 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
-   size_t data_len;
-   const unsigned char *pk;
-   const struct mldsa_info *info = mldsa_get_info (keyparms);
--  int r;
- 
-   if (!info)
-     return GPG_ERR_PUBKEY_ALGO;
-@@ -350,17 +345,14 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
-     }
- 
-   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
--    r = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
--                          NULL, -1, pk);
-+    rc = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
-+                           NULL, -1, pk);
-   else
--    r = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
--                          ctx.label, ctx.labellen, pk);
-+    rc = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
-+                           ctx.label, ctx.labellen, pk);
-   _gcry_burn_stack (DILITHIUM_VERIFY_STACK_BURN);
--  if (r < 0)
--    {
--      rc = GPG_ERR_BAD_SIGNATURE;
--      goto leave;
--    }
-+  if (rc)
-+    goto leave;
- 
- leave:
-   _gcry_pk_util_free_encoding_ctx (&ctx);
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
similarity index 89%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
index d7b3e182cd2..4dedcc49ce2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
@@ -12,7 +12,7 @@ LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
-                    file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
+                    file://LICENSES;md5=47e346a71a2593d19f741408407fe91f \
                     "
 
 DEPENDS = "libgpg-error"
@@ -25,10 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://CVE-2026-41989.patch \
-           file://CVE-2026-41990.patch \
            "
-SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
+SRC_URI[sha256sum] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
