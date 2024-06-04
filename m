Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85257C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:12:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3307.1717524772273003169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 11:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XAJB0SBa;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f4a5344ec7so715605ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717524771; x=1718129571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+U5AChznuput29mxlfEpXX9K89g6+m/4akE76FDk2HE=;
        b=XAJB0SBaUA00aRnfITQg41VOVrJJvip1GKqbpG5kgJzQwmW/iaL6qxaD0whStb/8cs
         XkuiSgGyqKr1mS51qe0/DvWWf55OEFLGEpcTxfJRfpuPDMEZgUUtMxJA0NrYoZL8ZAgT
         TGoq06JrOIW4mqzfpwhp9Dbi2tE/2qld8vwXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717524771; x=1718129571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+U5AChznuput29mxlfEpXX9K89g6+m/4akE76FDk2HE=;
        b=tAD2jgs5+twufARJ0mwx2BAIce/4QM/ALyPq7haDezCwfUOb4HR8uEEwqaHRiY0LV2
         AzCKzOVicdAfHaz5v2MiBZrT1TXJ7v/3QJ48N2j0YbiRXK4wN/fvs9AVEzUKvUQEJYCn
         2Zw6018L/bI2eFGls0gsqS6Qt/NWUdPcCdR1pn9yzRPnsBj8RiwdnG7+ftsVLALnh4Y1
         cM34gz34JDn5BtIy9g2xTnD0MwMVEoWgUD50MJTEAx2l/UgKaB/2CknTsKoK+nVU95yd
         efzZGgb+l8D3+tCSv6rPUfcsoxvmLORIb7VUJx3Vhf3Gt7M+MUHc+Vihe0w1Nqx7yfEN
         dk0w==
X-Gm-Message-State: AOJu0Yza90tl8bnwG8x7CJxXo8FHkQuvDPv1HQbOhnbxI64Qfa+xyhIm
	Mpaiml9q/3mcX0aqd9THHiGbSY9EpiFsUj1TdBcOuYTLRuW91dNwOx0lNDwpcvWo4uSlXgfZ0Np
	d
X-Google-Smtp-Source: AGHT+IHegbkOh5x+pSpjmeI2n598hnYOKP/+ASRgPB27W3juv5AIEFbU5kPRGO3VrrU1ff9cpMVUlA==
X-Received: by 2002:a17:902:ce90:b0:1f6:3a73:1eac with SMTP id d9443c01a7336-1f6a569e528mr5510525ad.17.1717524770833;
        Tue, 04 Jun 2024 11:12:50 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.253.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd39sm86487945ad.21.2024.06.04.11.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 11:12:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] openssl: Upgrade 3.2.1 -> 3.2.2
Date: Tue,  4 Jun 2024 23:42:36 +0530
Message-Id: <20240604181236.272963-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 18:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200343

CVE's Fixed by upgrade:
CVE-2024-4741: Fixed potential use after free after SSL_free_buffers() is called
CVE-2024-4603: Fixed an issue where checking excessively long DSA keys or parameters may be very slow
CVE-2024-2511: Fixed unbounded memory growth with session handling in TLSv1.3

Bugs Fixed by upgrade:
#23560: Fixed bug where SSL_export_keying_material() could not be used with QUIC connections

Removed backports of CVE-2024-2511, CVE-2024-4603 and bti.patch as they
are already fixed.

Detailed Information:
https://github.com/openssl/openssl/blob/openssl-3.2/CHANGES.md#changes-between-321-and-322-4-jun-2024

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2024-2511.patch       | 120 ------------
 .../openssl/openssl/CVE-2024-4603.patch       | 179 ------------------
 .../openssl/openssl/bti.patch                 |  58 ------
 .../{openssl_3.2.1.bb => openssl_3.2.2.bb}    |   5 +-
 4 files changed, 1 insertion(+), 361 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/bti.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.1.bb => openssl_3.2.2.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
deleted file mode 100644
index 8772f716d5..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From e9d7083e241670332e0443da0f0d4ffb52829f08 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Tue, 5 Mar 2024 15:43:53 +0000
-Subject: [PATCH] Fix unconstrained session cache growth in TLSv1.3
-
-In TLSv1.3 we create a new session object for each ticket that we send.
-We do this by duplicating the original session. If SSL_OP_NO_TICKET is in
-use then the new session will be added to the session cache. However, if
-early data is not in use (and therefore anti-replay protection is being
-used), then multiple threads could be resuming from the same session
-simultaneously. If this happens and a problem occurs on one of the threads,
-then the original session object could be marked as not_resumable. When we
-duplicate the session object this not_resumable status gets copied into the
-new session object. The new session object is then added to the session
-cache even though it is not_resumable.
-
-Subsequently, another bug means that the session_id_length is set to 0 for
-sessions that are marked as not_resumable - even though that session is
-still in the cache. Once this happens the session can never be removed from
-the cache. When that object gets to be the session cache tail object the
-cache never shrinks again and grows indefinitely.
-
-CVE-2024-2511
-
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/24043)
-
-CVE: CVE-2024-2511
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e9d7083e241670332e0443da0f0d4ffb52829f08]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- ssl/ssl_lib.c            |  5 +++--
- ssl/ssl_sess.c           | 28 ++++++++++++++++++++++------
- ssl/statem/statem_srvr.c |  5 ++---
- 3 files changed, 27 insertions(+), 11 deletions(-)
-
-diff --git a/ssl/ssl_lib.c b/ssl/ssl_lib.c
-index 4afb43bc86e54..c51529ddab5bb 100644
---- a/ssl/ssl_lib.c
-+++ b/ssl/ssl_lib.c
-@@ -4457,9 +4457,10 @@ void ssl_update_cache(SSL_CONNECTION *s, int mode)
- 
-     /*
-      * If the session_id_length is 0, we are not supposed to cache it, and it
--     * would be rather hard to do anyway :-)
-+     * would be rather hard to do anyway :-). Also if the session has already
-+     * been marked as not_resumable we should not cache it for later reuse.
-      */
--    if (s->session->session_id_length == 0)
-+    if (s->session->session_id_length == 0 || s->session->not_resumable)
-         return;
- 
-     /*
-diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
-index 3dcc4d81e5bc6..1fa6d17c46863 100644
---- a/ssl/ssl_sess.c
-+++ b/ssl/ssl_sess.c
-@@ -127,16 +127,11 @@ SSL_SESSION *SSL_SESSION_new(void)
-     return ss;
- }
- 
--SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
--{
--    return ssl_session_dup(src, 1);
--}
--
- /*
-  * Create a new SSL_SESSION and duplicate the contents of |src| into it. If
-  * ticket == 0 then no ticket information is duplicated, otherwise it is.
-  */
--SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+static SSL_SESSION *ssl_session_dup_intern(const SSL_SESSION *src, int ticket)
- {
-     SSL_SESSION *dest;
- 
-@@ -265,6 +260,27 @@ SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-     return NULL;
- }
- 
-+SSL_SESSION *SSL_SESSION_dup(const SSL_SESSION *src)
-+{
-+    return ssl_session_dup_intern(src, 1);
-+}
-+
-+/*
-+ * Used internally when duplicating a session which might be already shared.
-+ * We will have resumed the original session. Subsequently we might have marked
-+ * it as non-resumable (e.g. in another thread) - but this copy should be ok to
-+ * resume from.
-+ */
-+SSL_SESSION *ssl_session_dup(const SSL_SESSION *src, int ticket)
-+{
-+    SSL_SESSION *sess = ssl_session_dup_intern(src, ticket);
-+
-+    if (sess != NULL)
-+        sess->not_resumable = 0;
-+
-+    return sess;
-+}
-+
- const unsigned char *SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
- {
-     if (len)
-diff --git a/ssl/statem/statem_srvr.c b/ssl/statem/statem_srvr.c
-index 853af8c0aa9f9..d5f0ab091dacc 100644
---- a/ssl/statem/statem_srvr.c
-+++ b/ssl/statem/statem_srvr.c
-@@ -2445,9 +2445,8 @@ CON_FUNC_RETURN tls_construct_server_hello(SSL_CONNECTION *s, WPACKET *pkt)
-      * so the following won't overwrite an ID that we're supposed
-      * to send back.
-      */
--    if (s->session->not_resumable ||
--        (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
--         && !s->hit))
-+    if (!(SSL_CONNECTION_GET_CTX(s)->session_cache_mode & SSL_SESS_CACHE_SERVER)
-+            && !s->hit)
-         s->session->session_id_length = 0;
- 
-     if (usetls13) {
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
deleted file mode 100644
index 50fb969c03..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From da343d0605c826ef197aceedc67e8e04f065f740 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 8 May 2024 15:23:45 +0200
-Subject: [PATCH] Check DSA parameters for excessive sizes before validating
-
-This avoids overly long computation of various validation
-checks.
-
-Fixes CVE-2024-4603
-
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
-(Merged from https://github.com/openssl/openssl/pull/24346)
-
-(cherry picked from commit 85ccbab216da245cf9a6503dd327072f21950d9b)
-
-<dropped CHANGES.md modifications as it would need backport of all previous changes>
-
-CVE: CVE-2024-4603
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/da343d0605c826ef197aceedc67e8e04f065f740]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- crypto/dsa/dsa_check.c                        | 44 ++++++++++++--
- .../invalid/p10240_q256_too_big.pem           | 57 +++++++++++++++++++
- 2 files changed, 97 insertions(+), 4 deletions(-)
-
-diff --git a/crypto/dsa/dsa_check.c b/crypto/dsa/dsa_check.c
-index fb0e9129a2..122449a7bf 100644
---- a/crypto/dsa/dsa_check.c
-+++ b/crypto/dsa/dsa_check.c
-@@ -19,8 +19,34 @@
- #include "dsa_local.h"
- #include "crypto/dsa.h"
- 
-+static int dsa_precheck_params(const DSA *dsa, int *ret)
-+{
-+    if (dsa->params.p == NULL || dsa->params.q == NULL) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_FFC_PARAMETERS);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    if (BN_num_bits(dsa->params.p) > OPENSSL_DSA_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_MODULUS_TOO_LARGE);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    if (BN_num_bits(dsa->params.q) >= BN_num_bits(dsa->params.p)) {
-+        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_Q_VALUE);
-+        *ret = FFC_CHECK_INVALID_PQ;
-+        return 0;
-+    }
-+
-+    return 1;
-+}
-+
- int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK)
-         return ossl_ffc_params_simple_validate(dsa->libctx, &dsa->params,
-                                                FFC_PARAM_TYPE_DSA, ret);
-@@ -39,6 +65,9 @@ int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
-  */
- int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     return ossl_ffc_validate_public_key(&dsa->params, pub_key, ret)
-            && *ret == 0;
- }
-@@ -50,6 +79,9 @@ int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
-  */
- int ossl_dsa_check_pub_key_partial(const DSA *dsa, const BIGNUM *pub_key, int *ret)
- {
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-     return ossl_ffc_validate_public_key_partial(&dsa->params, pub_key, ret)
-            && *ret == 0;
- }
-@@ -58,8 +90,10 @@ int ossl_dsa_check_priv_key(const DSA *dsa, const BIGNUM *priv_key, int *ret)
- {
-     *ret = 0;
- 
--    return (dsa->params.q != NULL
--            && ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret));
-+    if (!dsa_precheck_params(dsa, ret))
-+        return 0;
-+
-+    return ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret);
- }
- 
- /*
-@@ -72,8 +106,10 @@ int ossl_dsa_check_pairwise(const DSA *dsa)
-     BN_CTX *ctx = NULL;
-     BIGNUM *pub_key = NULL;
- 
--    if (dsa->params.p == NULL
--        || dsa->params.g == NULL
-+    if (!dsa_precheck_params(dsa, &ret))
-+        return 0;
-+
-+    if (dsa->params.g == NULL
-         || dsa->priv_key == NULL
-         || dsa->pub_key == NULL)
-         return 0;
-diff --git a/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
-new file mode 100644
-index 0000000000..e85e2953b7
---- /dev/null
-+++ b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
-@@ -0,0 +1,57 @@
-+-----BEGIN DSA PARAMETERS-----
-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
-+vKuje86bePD6kD/LH3wmkA==
-+-----END DSA PARAMETERS-----
--- 
-2.30.2
-
diff --git a/meta/recipes-connectivity/openssl/openssl/bti.patch b/meta/recipes-connectivity/openssl/openssl/bti.patch
deleted file mode 100644
index 748576c30c..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/bti.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From ba8a599395f8b770c76316b5f5b0f3838567014f Mon Sep 17 00:00:00 2001
-From: Tom Cosgrove <tom.cosgrove@arm.com>
-Date: Tue, 26 Mar 2024 13:18:00 +0000
-Subject: [PATCH] aarch64: fix BTI in bsaes assembly code
-
-In Arm systems where BTI is enabled but the Crypto extensions are not (more
-likely in FVPs than in real hardware), the bit-sliced assembler code will
-be used. However, this wasn't annotated with BTI instructions when BTI was
-enabled, so the moment libssl jumps into this code it (correctly) aborts.
-
-Solve this by adding the missing BTI landing pads.
-
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/23982]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/aes/asm/bsaes-armv8.pl | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/crypto/aes/asm/bsaes-armv8.pl b/crypto/aes/asm/bsaes-armv8.pl
-index b3c97e439f..c3c5ff3e05 100644
---- a/crypto/aes/asm/bsaes-armv8.pl
-+++ b/crypto/aes/asm/bsaes-armv8.pl
-@@ -1018,6 +1018,7 @@ _bsaes_key_convert:
- //   Initialisation vector overwritten with last quadword of ciphertext
- //   No output registers, usual AAPCS64 register preservation
- ossl_bsaes_cbc_encrypt:
-+        AARCH64_VALID_CALL_TARGET
-         cmp     x2, #128
-         bhs     .Lcbc_do_bsaes
-         b       AES_cbc_encrypt
-@@ -1270,7 +1271,7 @@ ossl_bsaes_cbc_encrypt:
- //   Output text filled in
- //   No output registers, usual AAPCS64 register preservation
- ossl_bsaes_ctr32_encrypt_blocks:
--
-+        AARCH64_VALID_CALL_TARGET
-         cmp     x2, #8                      // use plain AES for
-         blo     .Lctr_enc_short             // small sizes
- 
-@@ -1476,6 +1477,7 @@ ossl_bsaes_ctr32_encrypt_blocks:
- //   Output ciphertext filled in
- //   No output registers, usual AAPCS64 register preservation
- ossl_bsaes_xts_encrypt:
-+        AARCH64_VALID_CALL_TARGET
-         // Stack layout:
-         // sp ->
-         //        nrounds*128-96 bytes: key schedule
-@@ -1921,6 +1923,7 @@ ossl_bsaes_xts_encrypt:
- //   Output plaintext filled in
- //   No output registers, usual AAPCS64 register preservation
- ossl_bsaes_xts_decrypt:
-+        AARCH64_VALID_CALL_TARGET
-         // Stack layout:
-         // sp ->
-         //        nrounds*128-96 bytes: key schedule
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb b/meta/recipes-connectivity/openssl/openssl_3.2.2.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_3.2.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.2.bb
index 9bdf7e1ec6..1c92707144 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.2.bb
@@ -12,16 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://bti.patch \
-           file://CVE-2024-2511.patch \
-           file://CVE-2024-4603.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39"
+SRC_URI[sha256sum] = "197149c18d9e9f292c43f0400acaba12e5f52cacfe050f3d199277ea738ec2e7"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


