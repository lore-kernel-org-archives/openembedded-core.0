Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F12F6C57E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so9708548wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r96lwdtK8eHumUWADJ45KVVIs8iebEUZYwKNZeIXTTE=;
	b=fJg8kaG6b4q3kMW4cwfw0LbLjv9lVso4FoQZy2ejI3UVw2giS/YmQcKJRW211BA5cM
	PTFkr6/iJqRlN0P3ASZq1smpvkstkLAi6LZJ9RHcCXlwG51ZqbOtvbp40NkNfruAknAB
	yz0XSwHE/Pl1FOqtagsXDmGPkYrxXClBE+nYq9uPo/X0EjoyqF5GRtj7aQtoYaj9pBet
	ZHf3lraVSM4qwsLDU1huVITZPmMlrrZQ8W7pkJhmDAKktCJyPq46JmpOFZmH5r8E+7ux
	eUWetWcK4XuyyKGRuqcrtgyp4wwfyI0y3A7QnT55WyGWo3h+YY8ANavkQ6x7v8YQ36Fv
	j2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r96lwdtK8eHumUWADJ45KVVIs8iebEUZYwKNZeIXTTE=;
	b=e+QECQPG/5/acxEzpvROg4tmGodbOsLjl7AtKPnvaT7/JWG6lLFtzBFkbUnq46bkJJ
	mfJH0Vpg2vCLP0Bl04wWE5Kl6k1oRoN1M+LyxKeZI9AJQ9gKAeT/1/+qJJTpMj+Enjlj
	JhE4dKfSpvbTjLWNztj+et6w4yMNSDPZH9RLXLlzxHbyDGgyhsCzJScE7L4l21LGvvVC
	oB9JDrwp68A0/uTRkesM3wZVH9UCE8U6gxCi5wrinIIvtSSe+DKnTMfs0ciTvlSZSZro
	9cUW/39MlZvmxojvER+uvejAG06+qURgkh6Lq3W63Iw5+LFYm9+k4OzV+l0lCnSvtEkJ
	kFNQ==
X-Gm-Message-State: AA+aEWb0v/LyzOkOkaouHWhghcdZNDTzButXlksIk4PLMTRVvlZ5gvAj
	rpg8Y0/cuWjzml8n8EZV31mNDlPm
X-Google-Smtp-Source: AFSGD/VllvMkbMvXW2PNmTRbJychwDRC2cG5R0qb6j7RT3JTzS7w9Z/pg74newBOPBtQvge699yGSw==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr9972249wrt.63.1542901312307;
	Thu, 22 Nov 2018 07:41:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:23 +0100
Message-Id: <20181122154136.121480-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/16] openssl: update to 1.1.1a
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 15:41:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssl/0002-fix-CVE-2018-0734.patch      | 108 ------------------
 .../openssl/0003-fix-CVE-2018-0735.patch      |  50 --------
 .../{openssl_1.1.1.bb => openssl_1.1.1a.bb}   |   6 +-
 3 files changed, 2 insertions(+), 162 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1.bb => openssl_1.1.1a.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch b/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
deleted file mode 100644
index 2a3e03fe2af..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Backport patch to fix CVE-2018-0734. Remove a section which only remove a
-space. It can't be applied because the context is different.
-
-CVE: CVE-2018-0734
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 8abfe72e8c1de1b95f50aa0d9134803b4d00070f Mon Sep 17 00:00:00 2001
-From: Pauli <paul.dale@oracle.com>
-Date: Wed, 24 Oct 2018 07:42:46 +1000
-Subject: [PATCH] Timing vulnerability in DSA signature generation
- (CVE-2018-0734).
-
-Avoid a timing attack that leaks information via a side channel that
-triggers when a BN is resized.  Increasing the size of the BNs
-prior to doing anything with them suppresses the attack.
-
-Thanks due to Samuel Weiser for finding and locating this.
-
-Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
-(Merged from https://github.com/openssl/openssl/pull/7486)
-
-(cherry picked from commit a9cfb8c2aa7254a4aa6a1716909e3f8cb78049b6)
----
- crypto/dsa/dsa_ossl.c | 28 +++++++++++++++-------------
- 1 file changed, 15 insertions(+), 13 deletions(-)
-
-diff --git a/crypto/dsa/dsa_ossl.c b/crypto/dsa/dsa_ossl.c
-index ca20811200..2dd2d7489a 100644
---- a/crypto/dsa/dsa_ossl.c
-+++ b/crypto/dsa/dsa_ossl.c
-@@ -9,6 +9,7 @@
- 
- #include <stdio.h>
- #include "internal/cryptlib.h"
-+#include "internal/bn_int.h"
- #include <openssl/bn.h>
- #include <openssl/sha.h>
- #include "dsa_locl.h"
-@@ -180,9 +181,9 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
- {
-     BN_CTX *ctx = NULL;
-     BIGNUM *k, *kinv = NULL, *r = *rp;
--    BIGNUM *l, *m;
-+    BIGNUM *l;
-     int ret = 0;
--    int q_bits;
-+    int q_bits, q_words;
- 
-     if (!dsa->p || !dsa->q || !dsa->g) {
-         DSAerr(DSA_F_DSA_SIGN_SETUP, DSA_R_MISSING_PARAMETERS);
-@@ -191,8 +192,7 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
- 
-     k = BN_new();
-     l = BN_new();
--    m = BN_new();
--    if (k == NULL || l == NULL || m == NULL)
-+    if (k == NULL || l == NULL)
-         goto err;
- 
-     if (ctx_in == NULL) {
-@@ -203,9 +203,9 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
- 
-     /* Preallocate space */
-     q_bits = BN_num_bits(dsa->q);
--    if (!BN_set_bit(k, q_bits)
--        || !BN_set_bit(l, q_bits)
--        || !BN_set_bit(m, q_bits))
-+    q_words = bn_get_top(dsa->q);
-+    if (!bn_wexpand(k, q_words + 2)
-+        || !bn_wexpand(l, q_words + 2))
-         goto err;
- 
-     /* Get random k */
-@@ -240,14 +240,17 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
-      * small timing information leakage.  We then choose the sum that is
-      * one bit longer than the modulus.
-      *
--     * TODO: revisit the BN_copy aiming for a memory access agnostic
--     * conditional copy.
-+     * There are some concerns about the efficacy of doing this.  More
-+     * specificly refer to the discussion starting with:
-+     *     https://github.com/openssl/openssl/pull/7486#discussion_r228323705
-+     * The fix is to rework BN so these gymnastics aren't required.
-      */
-     if (!BN_add(l, k, dsa->q)
--        || !BN_add(m, l, dsa->q)
--        || !BN_copy(k, BN_num_bits(l) > q_bits ? l : m))
-+        || !BN_add(k, l, dsa->q))
-         goto err;
- 
-+    BN_consttime_swap(BN_is_bit_set(l, q_bits), k, l, q_words + 2);
-+
-     if ((dsa)->meth->bn_mod_exp != NULL) {
-             if (!dsa->meth->bn_mod_exp(dsa, r, dsa->g, k, dsa->p, ctx,
-                                        dsa->method_mont_p))
-@@ -275,7 +278,6 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
-         BN_CTX_free(ctx);
-     BN_clear_free(k);
-     BN_clear_free(l);
--    BN_clear_free(m);
-     return ret;
- }
- 
--- 
-2.17.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch b/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
deleted file mode 100644
index 736323f0ce6..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-CVE: CVE-2018-0735
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From b1d6d55ece1c26fa2829e2b819b038d7b6d692b4 Mon Sep 17 00:00:00 2001
-From: Pauli <paul.dale@oracle.com>
-Date: Fri, 26 Oct 2018 10:54:58 +1000
-Subject: [PATCH] Timing vulnerability in ECDSA signature generation
- (CVE-2018-0735)
-
-Preallocate an extra limb for some of the big numbers to avoid a reallocation
-that can potentially provide a side channel.
-
-Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
-(Merged from https://github.com/openssl/openssl/pull/7486)
-
-(cherry picked from commit 99540ec79491f59ed8b46b4edf130e17dc907f52)
----
- crypto/ec/ec_mult.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/crypto/ec/ec_mult.c b/crypto/ec/ec_mult.c
-index 7e1b3650e7..0e0a5e1394 100644
---- a/crypto/ec/ec_mult.c
-+++ b/crypto/ec/ec_mult.c
-@@ -206,8 +206,8 @@ int ec_scalar_mul_ladder(const EC_GROUP *group, EC_POINT *r,
-      */
-     cardinality_bits = BN_num_bits(cardinality);
-     group_top = bn_get_top(cardinality);
--    if ((bn_wexpand(k, group_top + 1) == NULL)
--        || (bn_wexpand(lambda, group_top + 1) == NULL)) {
-+    if ((bn_wexpand(k, group_top + 2) == NULL)
-+        || (bn_wexpand(lambda, group_top + 2) == NULL)) {
-         ECerr(EC_F_EC_SCALAR_MUL_LADDER, ERR_R_BN_LIB);
-         goto err;
-     }
-@@ -244,7 +244,7 @@ int ec_scalar_mul_ladder(const EC_GROUP *group, EC_POINT *r,
-      * k := scalar + 2*cardinality
-      */
-     kbit = BN_is_bit_set(lambda, cardinality_bits);
--    BN_consttime_swap(kbit, k, lambda, group_top + 1);
-+    BN_consttime_swap(kbit, k, lambda, group_top + 2);
- 
-     group_top = bn_get_top(group->field);
-     if ((bn_wexpand(s->X, group_top) == NULL)
--- 
-2.17.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 1234b64b864..be31e9f76ac 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -15,8 +15,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
-           file://0002-fix-CVE-2018-0734.patch \
-           file://0003-fix-CVE-2018-0735.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            "
 
@@ -24,8 +22,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "7079eb017429e0ffb9efb42bf80ccb21"
-SRC_URI[sha256sum] = "2836875a0f89c03d0fdf483941512613a50cfb421d6fd94b9f41d7279d586a3d"
+SRC_URI[md5sum] = "963deb2272d6be7d4c2458afd2517b73"
+SRC_URI[sha256sum] = "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1


