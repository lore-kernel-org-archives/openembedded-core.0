Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D88B7720F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:21 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so6919949pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1g22lUZEhgKZX34RYawyUc/dPlaRWlxyKGMjwxPK8YM=;
	b=ZYM2MPC6F1X2OKt8ixsHhIVp+QHTidcXL8yjNlFpI89NiGdc/Jail6Ka9+gg7d/p3x
	pcpeLWMRFLr5tgED1O3UoxCDCG3C2YOp3FrjBd9T9hhvZ+YETyudPkxU+lAyxIcnOLbF
	djEESui6wsGOPu6T/KZiq5P/IZX9gKB8hSgNbylc5UPiVEpAQSz/rcgGsaozu2hdJENy
	oasUKAuiBhR7et4j0jXG2/Y8j23syzS2YvEK8/KCsUka+Dyize/aOf6C95OeS0wY7mqI
	B8mmNpbLM5duDPo9KB7rOomP0ONnLrwFUynArK8Eu5vUz//8EGuPAvMhnpXkoQGlF2uk
	uVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1g22lUZEhgKZX34RYawyUc/dPlaRWlxyKGMjwxPK8YM=;
	b=QLwZEugI4YaV6XYi5NTrfIRthn3uyJnaFJQ1whcEifE56njNMcTb0MX9UCuK6XcJ/4
	FsfHVAASjlL9OdHpXJ5uyU8kONIxx5dDQ1eAZ9PEjTyugeXufsB1HaobUeBhqyw5Nr0M
	v6hNzOl5FOKFGXGKuJo/X19YumReGBCL9Nk8d1KX2F9V4xQrhc4L3/8mPfOSU6icpyOi
	q6vntOomgcb5aeCqFK5vT8m1JJWN4hry1nt24ScW3t2bdeEa4VnTkpr4z50PbZU7cCq1
	5crzX1MAqMXittS46+wsxuUCACdmx6bJBjN8dSaFh5sZZ7vQj7NzyCnW1ccIe6QHAqBK
	TdIg==
X-Gm-Message-State: AG10YORaVU9MmqNHZyLw6aLnz/qQBttrGkbYPeVakWkHsMaliGU4Hu6fJdTvwz6LNlm+2g==
X-Received: by 10.98.43.73 with SMTP id r70mr30929394pfr.4.1454800522718;
	Sat, 06 Feb 2016 15:15:22 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:47 -0800
Message-Id: <2c78d5780c0d1529af127d779550dc193ecfbb98.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 06/21] openssl: Security fix CVE-2016-0701
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:22 -0000

CVE-2016-0701 OpenSSL: DH small subgroups

(From OE-Core rev: c5868a7cd0a28c5800dfa4be1c9d98d3de08cd12)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
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
index 4a96a44..726896b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -40,6 +40,8 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Add-test-for-CVE-2015-3194.patch \
             file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
             file://CVE-2015-3197.patch \
+            file://CVE-2016-0701_1.patch \
+            file://CVE-2016-0701_2.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


