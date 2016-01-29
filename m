Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC0EB771E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:57:16 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n128so4353702pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Mgat/ICDXwSAkkx0BKZcPDAGaQVmq8hhH5LqLtohQFo=;
	b=ypOYA1Wg2TZ1K3gLVNiUot5UOM/AaUT+NYIeDJ3cdcJ9wiHNiUhjrFQ6lPe13wwPNw
	1/k4bdwP49dCe9chYMYvoQsYTtkB+fQR2+83RZlTxNgzXhrgi4YNoomRMrxQvM1I9mGW
	K/59iOIAno/Rz3k52U6SOFvIhxNGQt226R7Ay2bkQhOSBT11/2idEuRjPuPQzIJ6+iLL
	zEb2bGtbfcakhro19+wXyjP8Ox8NDL875TYof6be8+OFytLsr2ihFIBR4UGpTGeFOrcS
	8BxTDpw9mO1lM6ZB7qlCxV+r4YQF1jFduvZPHrKIrKooKh3xoE7Vt9imUyVHRfsAgGNi
	P3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Mgat/ICDXwSAkkx0BKZcPDAGaQVmq8hhH5LqLtohQFo=;
	b=EzvVO+4yKkbt6lBznaIj8XtiABZsX0Q6TViNjg/pIEwm1Y8PYo57ECGUqgeCfSHPiK
	pORhECWkBaNSAtLGHgQXLVJ/VBKidB/TCwd7yEpf6OF1y0UJYsKr2VlPSr65QLFZ9qQ1
	+37RFOjipyqWdY5RW5Yr8GB7BDWz0HjDefp0pyEfIg1wY/No/gd2YaR9uElfGJIjb0wm
	G4t2zgoaX7EJWioapX39OKuZ6qh06XNUxgwlfUfF8FB3YN811OObohVE7qoQI5Dg9vwc
	1NBXh23EEVMA7P/9TupyYaYyP5YRo+DHq7S1xZMrKxzEYAsKRovQjITvIUy2Lfqro/UY
	SG7Q==
X-Gm-Message-State: AG10YOSIqfFLyFMgGqTV7oZIR+Fvw9JmS8FLlYmXX2xRgn6wzKxRR9Kji3ePguFv+3wPDQ==
X-Received: by 10.98.86.8 with SMTP id k8mr17044011pfb.28.1454108237844;
	Fri, 29 Jan 2016 14:57:17 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l21sm22557869pfi.63.2016.01.29.14.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:57:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 14:57:08 -0800
Message-Id: <0dc553ca2e14940af3093a496aa991d87a13c896.1454108117.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454108117.git.akuster808@gmail.com>
References: <cover.1454108117.git.akuster808@gmail.com>
In-Reply-To: <cover.1454108117.git.akuster808@gmail.com>
References: <cover.1454108117.git.akuster808@gmail.com>
Subject: [PATCH 2/2] openssl: Security fix CVE-2016-0701
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
X-List-Received-Date: Fri, 29 Jan 2016 22:57:17 -0000

CVE-2016-0701 OpenSSL: DH small subgroups

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ++++++++++++++
 .../openssl/openssl/CVE-2016-0701_2.patch          | 156 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   2 +
 3 files changed, 260 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
new file mode 100644
index 0000000..cf2d9a7
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
@@ -0,0 +1,102 @@
+From 878e2c5b13010329c203f309ed0c8f2113f85648 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Mon, 18 Jan 2016 11:31:58 +0000
+Subject: [PATCH] Prevent small subgroup attacks on DH/DHE
+
+Historically OpenSSL only ever generated DH parameters based on "safe"
+primes. More recently (in version 1.0.2) support was provided for
+generating X9.42 style parameter files such as those required for RFC
+5114 support. The primes used in such files may not be "safe". Where an
+application is using DH configured with parameters based on primes that
+are not "safe" then an attacker could use this fact to find a peer's
+private DH exponent. This attack requires that the attacker complete
+multiple handshakes in which the peer uses the same DH exponent.
+
+A simple mitigation is to ensure that y^q (mod p) == 1
+
+CVE-2016-0701 (fix part 1 of 2)
+
+Issue reported by Antonio Sanso.
+
+Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
+
+Upstream-Status: Backport
+
+https://github.com/openssl/openssl/commit/878e2c5b13010329c203f309ed0c8f2113f85648
+
+CVE: CVE-2016-0701
+Signed-of-by: Armin Kuster <akuster@mvisa.com>
+
+---
+ crypto/dh/dh.h       |  1 +
+ crypto/dh/dh_check.c | 35 +++++++++++++++++++++++++----------
+ 2 files changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/crypto/dh/dh.h b/crypto/dh/dh.h
+index b177673..5498a9d 100644
+--- a/crypto/dh/dh.h
++++ b/crypto/dh/dh.h
+@@ -174,6 +174,7 @@ struct dh_st {
+ /* DH_check_pub_key error codes */
+ # define DH_CHECK_PUBKEY_TOO_SMALL       0x01
+ # define DH_CHECK_PUBKEY_TOO_LARGE       0x02
++# define DH_CHECK_PUBKEY_INVALID         0x03
+ 
+ /*
+  * primes p where (p-1)/2 is prime too are called "safe"; we define this for
+diff --git a/crypto/dh/dh_check.c b/crypto/dh/dh_check.c
+index 347467c..5adedc0 100644
+--- a/crypto/dh/dh_check.c
++++ b/crypto/dh/dh_check.c
+@@ -151,23 +151,38 @@ int DH_check(const DH *dh, int *ret)
+ int DH_check_pub_key(const DH *dh, const BIGNUM *pub_key, int *ret)
+ {
+     int ok = 0;
+-    BIGNUM *q = NULL;
++    BIGNUM *tmp = NULL;
++    BN_CTX *ctx = NULL;
+ 
+     *ret = 0;
+-    q = BN_new();
+-    if (q == NULL)
++    ctx = BN_CTX_new();
++    if (ctx == NULL)
+         goto err;
+-    BN_set_word(q, 1);
+-    if (BN_cmp(pub_key, q) <= 0)
++    BN_CTX_start(ctx);
++    tmp = BN_CTX_get(ctx);
++    if (tmp == NULL)
++        goto err;
++    BN_set_word(tmp, 1);
++    if (BN_cmp(pub_key, tmp) <= 0)
+         *ret |= DH_CHECK_PUBKEY_TOO_SMALL;
+-    BN_copy(q, dh->p);
+-    BN_sub_word(q, 1);
+-    if (BN_cmp(pub_key, q) >= 0)
++    BN_copy(tmp, dh->p);
++    BN_sub_word(tmp, 1);
++    if (BN_cmp(pub_key, tmp) >= 0)
+         *ret |= DH_CHECK_PUBKEY_TOO_LARGE;
+ 
++    if (dh->q != NULL) {
++        /* Check pub_key^q == 1 mod p */
++        if (!BN_mod_exp(tmp, pub_key, dh->q, dh->p, ctx))
++            goto err;
++        if (!BN_is_one(tmp))
++            *ret |= DH_CHECK_PUBKEY_INVALID;
++    }
++
+     ok = 1;
+  err:
+-    if (q != NULL)
+-        BN_free(q);
++    if (ctx != NULL) {
++        BN_CTX_end(ctx);
++        BN_CTX_free(ctx);
++    }
+     return (ok);
+ }
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
new file mode 100644
index 0000000..05caf0a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
@@ -0,0 +1,156 @@
+From c5b831f21d0d29d1e517d139d9d101763f60c9a2 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Thu, 17 Dec 2015 02:57:20 +0000
+Subject: [PATCH] Always generate DH keys for ephemeral DH cipher suites
+
+Modified version of the commit ffaef3f15 in the master branch by Stephen
+Henson. This makes the SSL_OP_SINGLE_DH_USE option a no-op and always
+generates a new DH key for every handshake regardless.
+
+CVE-2016-0701 (fix part 2 or 2)
+
+Issue reported by Antonio Sanso
+
+Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
+
+Upstream-Status: Backport
+
+https://github.com/openssl/openssl/commit/c5b831f21d0d29d1e517d139d9d101763f60c9a2
+
+CVE: CVE-2016-0701 #2
+Signed-of-by: Armin Kuster <akuster@mvisa.com>
+
+---
+ doc/ssl/SSL_CTX_set_tmp_dh_callback.pod | 29 +++++------------------------
+ ssl/s3_lib.c                            | 14 --------------
+ ssl/s3_srvr.c                           | 17 +++--------------
+ ssl/ssl.h                               |  2 +-
+ 4 files changed, 9 insertions(+), 53 deletions(-)
+
+Index: openssl-1.0.2d/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
+===================================================================
+--- openssl-1.0.2d.orig/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
++++ openssl-1.0.2d/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
+@@ -48,25 +48,8 @@ even if he gets hold of the normal (cert
+ only used for signing.
+ 
+ In order to perform a DH key exchange the server must use a DH group
+-(DH parameters) and generate a DH key.
+-The server will always generate a new DH key during the negotiation
+-if either the DH parameters are supplied via callback or the
+-SSL_OP_SINGLE_DH_USE option of SSL_CTX_set_options(3) is set (or both).
+-It will  immediately create a DH key if DH parameters are supplied via
+-SSL_CTX_set_tmp_dh() and SSL_OP_SINGLE_DH_USE is not set.
+-In this case,
+-it may happen that a key is generated on initialization without later
+-being needed, while on the other hand the computer time during the
+-negotiation is being saved.
+-
+-If "strong" primes were used to generate the DH parameters, it is not strictly
+-necessary to generate a new key for each handshake but it does improve forward
+-secrecy. If it is not assured that "strong" primes were used,
+-SSL_OP_SINGLE_DH_USE must be used in order to prevent small subgroup
+-attacks. Always using SSL_OP_SINGLE_DH_USE has an impact on the
+-computer time needed during negotiation, but it is not very large, so
+-application authors/users should consider always enabling this option.
+-The option is required to implement perfect forward secrecy (PFS).
++(DH parameters) and generate a DH key. The server will always generate
++a new DH key during the negotiation.
+ 
+ As generating DH parameters is extremely time consuming, an application
+ should not generate the parameters on the fly but supply the parameters.
+@@ -93,10 +76,9 @@ can supply the DH parameters via a callb
+ Previous versions of the callback used B<is_export> and B<keylength>
+ parameters to control parameter generation for export and non-export
+ cipher suites. Modern servers that do not support export ciphersuites
+-are advised to either use SSL_CTX_set_tmp_dh() in combination with
+-SSL_OP_SINGLE_DH_USE, or alternatively, use the callback but ignore
+-B<keylength> and B<is_export> and simply supply at least 2048-bit
+-parameters in the callback.
++are advised to either use SSL_CTX_set_tmp_dh() or alternatively, use
++the callback but ignore B<keylength> and B<is_export> and simply
++supply at least 2048-bit parameters in the callback.
+ 
+ =head1 EXAMPLES
+ 
+@@ -128,7 +110,6 @@ partly left out.)
+  if (SSL_CTX_set_tmp_dh(ctx, dh_2048) != 1) {
+    /* Error. */
+  }
+- SSL_CTX_set_options(ctx, SSL_OP_SINGLE_DH_USE);
+  ...
+ 
+ =head1 RETURN VALUES
+Index: openssl-1.0.2d/ssl/s3_lib.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s3_lib.c
++++ openssl-1.0.2d/ssl/s3_lib.c
+@@ -3206,13 +3206,6 @@ long ssl3_ctrl(SSL *s, int cmd, long lar
+                 SSLerr(SSL_F_SSL3_CTRL, ERR_R_DH_LIB);
+                 return (ret);
+             }
+-            if (!(s->options & SSL_OP_SINGLE_DH_USE)) {
+-                if (!DH_generate_key(dh)) {
+-                    DH_free(dh);
+-                    SSLerr(SSL_F_SSL3_CTRL, ERR_R_DH_LIB);
+-                    return (ret);
+-                }
+-            }
+             if (s->cert->dh_tmp != NULL)
+                 DH_free(s->cert->dh_tmp);
+             s->cert->dh_tmp = dh;
+@@ -3710,13 +3703,6 @@ long ssl3_ctx_ctrl(SSL_CTX *ctx, int cmd
+                 SSLerr(SSL_F_SSL3_CTX_CTRL, ERR_R_DH_LIB);
+                 return 0;
+             }
+-            if (!(ctx->options & SSL_OP_SINGLE_DH_USE)) {
+-                if (!DH_generate_key(new)) {
+-                    SSLerr(SSL_F_SSL3_CTX_CTRL, ERR_R_DH_LIB);
+-                    DH_free(new);
+-                    return 0;
+-                }
+-            }
+             if (cert->dh_tmp != NULL)
+                 DH_free(cert->dh_tmp);
+             cert->dh_tmp = new;
+Index: openssl-1.0.2d/ssl/s3_srvr.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s3_srvr.c
++++ openssl-1.0.2d/ssl/s3_srvr.c
+@@ -1684,20 +1684,9 @@ int ssl3_send_server_key_exchange(SSL *s
+             }
+ 
+             s->s3->tmp.dh = dh;
+-            if ((dhp->pub_key == NULL ||
+-                 dhp->priv_key == NULL ||
+-                 (s->options & SSL_OP_SINGLE_DH_USE))) {
+-                if (!DH_generate_key(dh)) {
+-                    SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
+-                    goto err;
+-                }
+-            } else {
+-                dh->pub_key = BN_dup(dhp->pub_key);
+-                dh->priv_key = BN_dup(dhp->priv_key);
+-                if ((dh->pub_key == NULL) || (dh->priv_key == NULL)) {
+-                    SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
+-                    goto err;
+-                }
++            if (!DH_generate_key(dh)) {
++                SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
++                goto err;
+             }
+             r[0] = dh->p;
+             r[1] = dh->g;
+Index: openssl-1.0.2d/ssl/ssl.h
+===================================================================
+--- openssl-1.0.2d.orig/ssl/ssl.h
++++ openssl-1.0.2d/ssl/ssl.h
+@@ -625,7 +625,7 @@ struct ssl_session_st {
+ # define SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION        0x00040000L
+ /* If set, always create a new key when using tmp_ecdh parameters */
+ # define SSL_OP_SINGLE_ECDH_USE                          0x00080000L
+-/* If set, always create a new key when using tmp_dh parameters */
++/* Does nothing: retained for compatibility */
+ # define SSL_OP_SINGLE_DH_USE                            0x00100000L
+ /* Does nothing: retained for compatibiity */
+ # define SSL_OP_EPHEMERAL_RSA                            0x0
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 07bdf4b..8defa5b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -42,6 +42,8 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Add-test-for-CVE-2015-3194.patch \
             file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
             file://CVE-2015-3197.patch \
+            file://CVE-2016-0701_1.patch \
+            file://CVE-2016-0701_2.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


