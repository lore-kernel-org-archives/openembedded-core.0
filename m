Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.8937.1632492974117612541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vP/CyT5i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so7764737pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4qxAPj2GplI+2zt9I0PxxvE96qv1/JYJo+lrjfw+U8s=;
        b=vP/CyT5ikSzdok+rdyfJEFdjqI5hn9TfWvRFQulBItBVXn8UJ4swyeECA4HtIaE7ge
         yr4g9CcjLjXs0F9/nk5Xa99lqAR0cPXeEpqFigic2ZBpxmt+NEbJUfuuBb/ekEYE/0Hy
         pL7A9TbVeM8L4vtlzGh9noaINOF9tpFzWcgwqkNWKxa4tlggJIk0+Vbr0oIVCwUXdGQ1
         JkWdXtkbs5Fnbs23GNh9ny1jpnGytZhoBCYrav9BY2NjvKim/E6QNpLiLRJRxo9mY9kU
         sjjjEKiWVXjf1A1IK3Q3LQfPQ8dAlslJ8tE0+PYV/YtVFCERrlyR655F8LZ5AEfWAtp6
         puOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4qxAPj2GplI+2zt9I0PxxvE96qv1/JYJo+lrjfw+U8s=;
        b=OeSjcGFhCENlJiTRSgaNibZFb2iUha+jm25nd7qoo2c04Am3WTHJQ9qltoH4SjQvTZ
         YKx2ZR1rhpzeM4nP3ec5OLqwymgwCx9j+Vjt+ADlVf84S+6s87+Y/hS6suGuKNA1gyXk
         sh4mo7u0HpEulz9F+J2TEX80+LY1HkhhKUd7vtJAxTp63ovqW5JSlPdpZwDCtXJvuNvk
         mAgaDK89sXUBMjLOAsawsC286utyXBCw1TPsaA9QSVWQst7nckcwSMZFQYnoFTeTTmXQ
         yJIGuaJR3M3P59E9vxjsUQrkkzK/HvqHAjq/WL6kvLp3N9cdWdydgU/tVy7lcIAUuKHx
         FqjQ==
X-Gm-Message-State: AOAM533cbAfDs1hn2PXK5wi7hiFmj3mWORh2UrtRq2WNn6uA3mMhH+eF
	/JmE4HP/FaZ8QCXdSnbWm2gga5j255i0uZQux4I=
X-Google-Smtp-Source: ABdhPJzUuGI2KRzePoa7qEuxEM4B+DjzbWgFOUqrIur3lseMA26vMtHNRbKLSBRaLD6j9F/8+0g6Aw==
X-Received: by 2002:a17:902:6546:b0:13a:339a:6616 with SMTP id d6-20020a170902654600b0013a339a6616mr9221317pln.34.1632492972623;
        Fri, 24 Sep 2021 07:16:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/25] nettle: Security fix for CVE-2021-3580
Date: Fri, 24 Sep 2021 04:15:12 -1000
Message-Id: <6aaf9d99ec4489643501f24897cd2cc668ba668a.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://git.lysator.liu.se/nettle/nettle
MR: 112331
Type: Security Fix
Disposition: Backport from https://git.lysator.liu.se/nettle/nettle/-/commit/0ad0b5df315665250dfdaa4a1e087f4799edaefe
ChangeID: ffbbadbfa862e715ec7da4695d7db67484f8517a
Description:

Affects nettle < 3.7.3

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nettle/nettle-3.5.1/CVE-2021-3580_1.patch | 277 ++++++++++++++++++
 .../nettle/nettle-3.5.1/CVE-2021-3580_2.patch | 163 +++++++++++
 meta/recipes-support/nettle/nettle_3.5.1.bb   |   2 +
 3 files changed, 442 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch

diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch
new file mode 100644
index 0000000000..ac3a638e72
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch
@@ -0,0 +1,277 @@
+From cd6059aebdd3059fbcf674dddb850b821c13b6c2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Tue, 8 Jun 2021 21:31:39 +0200
+Subject: [PATCH 1/2] Change _rsa_sec_compute_root_tr to take a fix input size.
+
+Improves consistency with _rsa_sec_compute_root, and fixes zero-input bug.
+
+(cherry picked from commit 485b5e2820a057e873b1ba812fdb39cae4adf98c)
+
+Upstream-Status: Backport
+CVE: CVE-2021-3580 dep#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog                    | 17 +++++++++-
+ rsa-decrypt-tr.c             |  7 ++---
+ rsa-internal.h               |  4 +--
+ rsa-sec-decrypt.c            |  9 ++++--
+ rsa-sign-tr.c                | 61 +++++++++++++++++-------------------
+ testsuite/rsa-encrypt-test.c | 14 ++++++++-
+ 6 files changed, 69 insertions(+), 43 deletions(-)
+
+Index: nettle-3.5.1/rsa-decrypt-tr.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-decrypt-tr.c
++++ nettle-3.5.1/rsa-decrypt-tr.c
+@@ -52,14 +52,13 @@ rsa_decrypt_tr(const struct rsa_public_k
+   mp_size_t key_limb_size;
+   int res;
+ 
+-  key_limb_size = NETTLE_OCTET_SIZE_TO_LIMB_SIZE(key->size);
++  key_limb_size = mpz_size(pub->n);
+ 
+   TMP_GMP_ALLOC (m, key_limb_size);
+   TMP_GMP_ALLOC (em, key->size);
++  mpz_limbs_copy(m, gibberish, key_limb_size);
+ 
+-  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, m,
+-				  mpz_limbs_read(gibberish),
+-				  mpz_size(gibberish));
++  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, m, m);
+ 
+   mpn_get_base256 (em, key->size, m, key_limb_size);
+ 
+Index: nettle-3.5.1/rsa-internal.h
+===================================================================
+--- nettle-3.5.1.orig/rsa-internal.h
++++ nettle-3.5.1/rsa-internal.h
+@@ -78,11 +78,11 @@ _rsa_sec_compute_root(const struct rsa_p
+                       mp_limb_t *scratch);
+ 
+ /* Safe side-channel silent variant, using RSA blinding, and checking the
+- * result after CRT. */
++ * result after CRT. In-place calls, with x == m, is allowed. */
+ int
+ _rsa_sec_compute_root_tr(const struct rsa_public_key *pub,
+ 			 const struct rsa_private_key *key,
+ 			 void *random_ctx, nettle_random_func *random,
+-			 mp_limb_t *x, const mp_limb_t *m, size_t mn);
++			 mp_limb_t *x, const mp_limb_t *m);
+ 
+ #endif /* NETTLE_RSA_INTERNAL_H_INCLUDED */
+Index: nettle-3.5.1/rsa-sec-decrypt.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-sec-decrypt.c
++++ nettle-3.5.1/rsa-sec-decrypt.c
+@@ -58,9 +58,12 @@ rsa_sec_decrypt(const struct rsa_public_
+   TMP_GMP_ALLOC (m, mpz_size(pub->n));
+   TMP_GMP_ALLOC (em, key->size);
+ 
+-  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, m,
+-				  mpz_limbs_read(gibberish),
+-				  mpz_size(gibberish));
++  /* We need a copy because m can be shorter than key_size,
++   * but _rsa_sec_compute_root_tr expect all inputs to be
++   * normalized to a key_size long buffer length */
++  mpz_limbs_copy(m, gibberish, mpz_size(pub->n));
++
++  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, m, m);
+ 
+   mpn_get_base256 (em, key->size, m, mpz_size(pub->n));
+ 
+Index: nettle-3.5.1/rsa-sign-tr.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-sign-tr.c
++++ nettle-3.5.1/rsa-sign-tr.c
+@@ -131,35 +131,34 @@ int
+ _rsa_sec_compute_root_tr(const struct rsa_public_key *pub,
+ 			 const struct rsa_private_key *key,
+ 			 void *random_ctx, nettle_random_func *random,
+-			 mp_limb_t *x, const mp_limb_t *m, size_t mn)
++			 mp_limb_t *x, const mp_limb_t *m)
+ {
++  mp_size_t nn;
+   mpz_t mz;
+   mpz_t xz;
+   int res;
+ 
+-  mpz_init(mz);
+   mpz_init(xz);
+ 
+-  mpn_copyi(mpz_limbs_write(mz, mn), m, mn);
+-  mpz_limbs_finish(mz, mn);
++  nn = mpz_size (pub->n);
+ 
+-  res = rsa_compute_root_tr(pub, key, random_ctx, random, xz, mz);
++  res = rsa_compute_root_tr(pub, key, random_ctx, random, xz,
++			    mpz_roinit_n(mz, m, nn));
+ 
+   if (res)
+-    mpz_limbs_copy(x, xz, mpz_size(pub->n));
++    mpz_limbs_copy(x, xz, nn);
+ 
+-  mpz_clear(mz);
+   mpz_clear(xz);
+   return res;
+ }
+ #else
+ /* Blinds m, by computing c = m r^e (mod n), for a random r. Also
+-   returns the inverse (ri), for use by rsa_unblind. */
++   returns the inverse (ri), for use by rsa_unblind. Must have c != m,
++   no in-place operation.*/
+ static void
+ rsa_sec_blind (const struct rsa_public_key *pub,
+                void *random_ctx, nettle_random_func *random,
+-               mp_limb_t *c, mp_limb_t *ri, const mp_limb_t *m,
+-               mp_size_t mn)
++               mp_limb_t *c, mp_limb_t *ri, const mp_limb_t *m)
+ {
+   const mp_limb_t *ep = mpz_limbs_read (pub->e);
+   const mp_limb_t *np = mpz_limbs_read (pub->n);
+@@ -177,15 +176,15 @@ rsa_sec_blind (const struct rsa_public_k
+ 
+   /* c = m*(r^e) mod n */
+   itch = mpn_sec_powm_itch(nn, ebn, nn);
+-  i2 = mpn_sec_mul_itch(nn, mn);
++  i2 = mpn_sec_mul_itch(nn, nn);
+   itch = MAX(itch, i2);
+-  i2 = mpn_sec_div_r_itch(nn + mn, nn);
++  i2 = mpn_sec_div_r_itch(2*nn, nn);
+   itch = MAX(itch, i2);
+   i2 = mpn_sec_invert_itch(nn);
+   itch = MAX(itch, i2);
+ 
+-  TMP_GMP_ALLOC (tp, nn + mn + itch);
+-  scratch = tp + nn + mn;
++  TMP_GMP_ALLOC (tp, 2*nn  + itch);
++  scratch = tp + 2*nn;
+ 
+   /* ri = r^(-1) */
+   do
+@@ -198,9 +197,8 @@ rsa_sec_blind (const struct rsa_public_k
+   while (!mpn_sec_invert (ri, tp, np, nn, 2 * nn * GMP_NUMB_BITS, scratch));
+ 
+   mpn_sec_powm (c, rp, nn, ep, ebn, np, nn, scratch);
+-  /* normally mn == nn, but m can be smaller in some cases */
+-  mpn_sec_mul (tp, c, nn, m, mn, scratch);
+-  mpn_sec_div_r (tp, nn + mn, np, nn, scratch);
++  mpn_sec_mul (tp, c, nn, m, nn, scratch);
++  mpn_sec_div_r (tp, 2*nn, np, nn, scratch);
+   mpn_copyi(c, tp, nn);
+ 
+   TMP_GMP_FREE (r);
+@@ -208,7 +206,7 @@ rsa_sec_blind (const struct rsa_public_k
+   TMP_GMP_FREE (tp);
+ }
+ 
+-/* m = c ri mod n */
++/* m = c ri mod n. Allows x == c. */
+ static void
+ rsa_sec_unblind (const struct rsa_public_key *pub,
+                  mp_limb_t *x, mp_limb_t *ri, const mp_limb_t *c)
+@@ -299,7 +297,7 @@ int
+ _rsa_sec_compute_root_tr(const struct rsa_public_key *pub,
+ 			 const struct rsa_private_key *key,
+ 			 void *random_ctx, nettle_random_func *random,
+-			 mp_limb_t *x, const mp_limb_t *m, size_t mn)
++			 mp_limb_t *x, const mp_limb_t *m)
+ {
+   TMP_GMP_DECL (c, mp_limb_t);
+   TMP_GMP_DECL (ri, mp_limb_t);
+@@ -307,7 +305,7 @@ _rsa_sec_compute_root_tr(const struct rs
+   size_t key_limb_size;
+   int ret;
+ 
+-  key_limb_size = NETTLE_OCTET_SIZE_TO_LIMB_SIZE(key->size);
++  key_limb_size = mpz_size(pub->n);
+ 
+   /* mpz_powm_sec handles only odd moduli. If p, q or n is even, the
+      key is invalid and rejected by rsa_private_key_prepare. However,
+@@ -321,19 +319,18 @@ _rsa_sec_compute_root_tr(const struct rs
+     }
+ 
+   assert(mpz_size(pub->n) == key_limb_size);
+-  assert(mn <= key_limb_size);
+ 
+   TMP_GMP_ALLOC (c, key_limb_size);
+   TMP_GMP_ALLOC (ri, key_limb_size);
+   TMP_GMP_ALLOC (scratch, _rsa_sec_compute_root_itch(key));
+ 
+-  rsa_sec_blind (pub, random_ctx, random, x, ri, m, mn);
++  rsa_sec_blind (pub, random_ctx, random, c, ri, m);
+ 
+-  _rsa_sec_compute_root(key, c, x, scratch);
++  _rsa_sec_compute_root(key, x, c, scratch);
+ 
+-  ret = rsa_sec_check_root(pub, c, x);
++  ret = rsa_sec_check_root(pub, x, c);
+ 
+-  rsa_sec_unblind(pub, x, ri, c);
++  rsa_sec_unblind(pub, x, ri, x);
+ 
+   cnd_mpn_zero(1 - ret, x, key_limb_size);
+ 
+@@ -357,17 +354,17 @@ rsa_compute_root_tr(const struct rsa_pub
+ 		    mpz_t x, const mpz_t m)
+ {
+   TMP_GMP_DECL (l, mp_limb_t);
++  mp_size_t nn = mpz_size(pub->n);
+   int res;
+ 
+-  mp_size_t l_size = NETTLE_OCTET_SIZE_TO_LIMB_SIZE(key->size);
+-  TMP_GMP_ALLOC (l, l_size);
++  TMP_GMP_ALLOC (l, nn);
++  mpz_limbs_copy(l, m, nn);
+ 
+-  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, l,
+-				  mpz_limbs_read(m), mpz_size(m));
++  res = _rsa_sec_compute_root_tr (pub, key, random_ctx, random, l, l);
+   if (res) {
+-    mp_limb_t *xp = mpz_limbs_write (x, l_size);
+-    mpn_copyi (xp, l, l_size);
+-    mpz_limbs_finish (x, l_size);
++    mp_limb_t *xp = mpz_limbs_write (x, nn);
++    mpn_copyi (xp, l, nn);
++    mpz_limbs_finish (x, nn);
+   }
+ 
+   TMP_GMP_FREE (l);
+Index: nettle-3.5.1/testsuite/rsa-encrypt-test.c
+===================================================================
+--- nettle-3.5.1.orig/testsuite/rsa-encrypt-test.c
++++ nettle-3.5.1/testsuite/rsa-encrypt-test.c
+@@ -19,6 +19,7 @@ test_main(void)
+   uint8_t after;
+ 
+   mpz_t gibberish;
++  mpz_t zero;
+ 
+   rsa_private_key_init(&key);
+   rsa_public_key_init(&pub);
+@@ -101,6 +102,17 @@ test_main(void)
+   ASSERT(decrypted[decrypted_length] == after);
+   ASSERT(decrypted[0] == 'A');
+ 
++  /* Test zero input. */
++  mpz_init_set_ui (zero, 0);
++  decrypted_length = msg_length;
++  ASSERT(!rsa_decrypt(&key, &decrypted_length, decrypted, zero));
++  ASSERT(!rsa_decrypt_tr(&pub, &key,
++			 &lfib, (nettle_random_func *) knuth_lfib_random,
++			 &decrypted_length, decrypted, zero));
++  ASSERT(!rsa_sec_decrypt(&pub, &key,
++			  &lfib, (nettle_random_func *) knuth_lfib_random,
++			  decrypted_length, decrypted, zero));
++  ASSERT(decrypted_length == msg_length);
+ 
+   /* Test invalid key. */
+   mpz_add_ui (key.q, key.q, 2);
+@@ -112,6 +124,6 @@ test_main(void)
+   rsa_private_key_clear(&key);
+   rsa_public_key_clear(&pub);
+   mpz_clear(gibberish);
++  mpz_clear(zero);
+   free(decrypted);
+ }
+-  
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch
new file mode 100644
index 0000000000..18e952ddf7
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch
@@ -0,0 +1,163 @@
+From c80961c646b0962ab152619ac0a7c6a21850a380 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Niels=20M=C3=B6ller?= <nisse@lysator.liu.se>
+Date: Tue, 8 Jun 2021 21:32:38 +0200
+Subject: [PATCH 2/2] Add input check to rsa_decrypt family of functions.
+
+(cherry picked from commit 0ad0b5df315665250dfdaa4a1e087f4799edaefe)
+
+Upstream-Status: Backport
+CVE: CVE-2021-3580
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog                    | 10 +++++++++-
+ rsa-decrypt-tr.c             |  4 ++++
+ rsa-decrypt.c                | 10 ++++++++++
+ rsa-sec-decrypt.c            |  4 ++++
+ rsa.h                        |  5 +++--
+ testsuite/rsa-encrypt-test.c | 38 ++++++++++++++++++++++++++++++------
+ 6 files changed, 62 insertions(+), 9 deletions(-)
+
+Index: nettle-3.5.1/rsa-decrypt-tr.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-decrypt-tr.c
++++ nettle-3.5.1/rsa-decrypt-tr.c
+@@ -52,6 +52,10 @@ rsa_decrypt_tr(const struct rsa_public_k
+   mp_size_t key_limb_size;
+   int res;
+ 
++  /* First check that input is in range. */
++  if (mpz_sgn (gibberish) < 0 || mpz_cmp (gibberish, pub->n) >= 0)
++    return 0;
++
+   key_limb_size = mpz_size(pub->n);
+ 
+   TMP_GMP_ALLOC (m, key_limb_size);
+Index: nettle-3.5.1/rsa-decrypt.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-decrypt.c
++++ nettle-3.5.1/rsa-decrypt.c
+@@ -48,6 +48,16 @@ rsa_decrypt(const struct rsa_private_key
+   int res;
+ 
+   mpz_init(m);
++
++  /* First check that input is in range. Since we don't have the
++     public key available here, we need to reconstruct n. */
++  mpz_mul (m, key->p, key->q);
++  if (mpz_sgn (gibberish) < 0 || mpz_cmp (gibberish, m) >= 0)
++    {
++      mpz_clear (m);
++      return 0;
++    }
++
+   rsa_compute_root(key, m, gibberish);
+ 
+   res = pkcs1_decrypt (key->size, m, length, message);
+Index: nettle-3.5.1/rsa-sec-decrypt.c
+===================================================================
+--- nettle-3.5.1.orig/rsa-sec-decrypt.c
++++ nettle-3.5.1/rsa-sec-decrypt.c
+@@ -55,6 +55,10 @@ rsa_sec_decrypt(const struct rsa_public_
+   TMP_GMP_DECL (em, uint8_t);
+   int res;
+ 
++  /* First check that input is in range. */
++  if (mpz_sgn (gibberish) < 0 || mpz_cmp (gibberish, pub->n) >= 0)
++    return 0;
++
+   TMP_GMP_ALLOC (m, mpz_size(pub->n));
+   TMP_GMP_ALLOC (em, key->size);
+ 
+Index: nettle-3.5.1/rsa.h
+===================================================================
+--- nettle-3.5.1.orig/rsa.h
++++ nettle-3.5.1/rsa.h
+@@ -428,13 +428,14 @@ rsa_sec_decrypt(const struct rsa_public_
+ 	        size_t length, uint8_t *message,
+ 	        const mpz_t gibberish);
+ 
+-/* Compute x, the e:th root of m. Calling it with x == m is allowed. */
++/* Compute x, the e:th root of m. Calling it with x == m is allowed.
++   It is required that 0 <= m < n. */
+ void
+ rsa_compute_root(const struct rsa_private_key *key,
+ 		 mpz_t x, const mpz_t m);
+ 
+ /* Safer variant, using RSA blinding, and checking the result after
+-   CRT. */
++   CRT. It is required that 0 <= m < n. */
+ int
+ rsa_compute_root_tr(const struct rsa_public_key *pub,
+ 		    const struct rsa_private_key *key,
+Index: nettle-3.5.1/testsuite/rsa-encrypt-test.c
+===================================================================
+--- nettle-3.5.1.orig/testsuite/rsa-encrypt-test.c
++++ nettle-3.5.1/testsuite/rsa-encrypt-test.c
+@@ -19,11 +19,12 @@ test_main(void)
+   uint8_t after;
+ 
+   mpz_t gibberish;
+-  mpz_t zero;
++  mpz_t bad_input;
+ 
+   rsa_private_key_init(&key);
+   rsa_public_key_init(&pub);
+   mpz_init(gibberish);
++  mpz_init(bad_input);
+ 
+   knuth_lfib_init(&lfib, 17);
+   
+@@ -103,15 +104,40 @@ test_main(void)
+   ASSERT(decrypted[0] == 'A');
+ 
+   /* Test zero input. */
+-  mpz_init_set_ui (zero, 0);
++  mpz_set_ui (bad_input, 0);
+   decrypted_length = msg_length;
+-  ASSERT(!rsa_decrypt(&key, &decrypted_length, decrypted, zero));
++  ASSERT(!rsa_decrypt(&key, &decrypted_length, decrypted, bad_input));
+   ASSERT(!rsa_decrypt_tr(&pub, &key,
+ 			 &lfib, (nettle_random_func *) knuth_lfib_random,
+-			 &decrypted_length, decrypted, zero));
++			 &decrypted_length, decrypted, bad_input));
+   ASSERT(!rsa_sec_decrypt(&pub, &key,
+ 			  &lfib, (nettle_random_func *) knuth_lfib_random,
+-			  decrypted_length, decrypted, zero));
++			  decrypted_length, decrypted, bad_input));
++  ASSERT(decrypted_length == msg_length);
++
++  /* Test input that is slightly larger than n */
++  mpz_add(bad_input, gibberish, pub.n);
++  decrypted_length = msg_length;
++  ASSERT(!rsa_decrypt(&key, &decrypted_length, decrypted, bad_input));
++  ASSERT(!rsa_decrypt_tr(&pub, &key,
++			 &lfib, (nettle_random_func *) knuth_lfib_random,
++			 &decrypted_length, decrypted, bad_input));
++  ASSERT(!rsa_sec_decrypt(&pub, &key,
++			  &lfib, (nettle_random_func *) knuth_lfib_random,
++			  decrypted_length, decrypted, bad_input));
++  ASSERT(decrypted_length == msg_length);
++
++  /* Test input that is considerably larger than n */
++  mpz_mul_2exp (bad_input, pub.n, 100);
++  mpz_add (bad_input, bad_input, gibberish);
++  decrypted_length = msg_length;
++  ASSERT(!rsa_decrypt(&key, &decrypted_length, decrypted, bad_input));
++  ASSERT(!rsa_decrypt_tr(&pub, &key,
++			 &lfib, (nettle_random_func *) knuth_lfib_random,
++			 &decrypted_length, decrypted, bad_input));
++  ASSERT(!rsa_sec_decrypt(&pub, &key,
++			  &lfib, (nettle_random_func *) knuth_lfib_random,
++			  decrypted_length, decrypted, bad_input));
+   ASSERT(decrypted_length == msg_length);
+ 
+   /* Test invalid key. */
+@@ -124,6 +150,6 @@ test_main(void)
+   rsa_private_key_clear(&key);
+   rsa_public_key_clear(&pub);
+   mpz_clear(gibberish);
+-  mpz_clear(zero);
++  mpz_clear(bad_input);
+   free(decrypted);
+ }
diff --git a/meta/recipes-support/nettle/nettle_3.5.1.bb b/meta/recipes-support/nettle/nettle_3.5.1.bb
index b2ec24b36c..9212d9deb5 100644
--- a/meta/recipes-support/nettle/nettle_3.5.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.5.1.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://CVE-2021-3580_1.patch \
+           file://CVE-2021-3580_2.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.25.1

