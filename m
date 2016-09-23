Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 61FB56022E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 13:26:40 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m186so117756443ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oTylK+rCEbVREtWs+6Na8EZ89guG+Emy4yyYZ5CORLg=;
	b=bU/2fOX5oZZLkmdBT2VyvQ4TX4iHSC4wJFLuigOvrWmQTeK6crIoX1PO9wjwyzcdK6
	mmTGAzSTA0iseNDFH++rbz2WnL94R3rzfh5t+TL3Gg+z+YhIJucWlZeKs+S1ZjJIEQFj
	FKodLmPCJs/eugb+oUK0/qZGiGxFSi/KyXWwAEKtxID4jQiIwVZxkKgoHqKLDiuOM3zO
	DfihsS8Odvfkf6QTKoQX6XSUBuWk+oWbegrEVtQOY6V3+UckvfY4m8i5jsfF8w8RPNLa
	93aVwwUkWJaZmBMWAQnBOT+rr2ffUsXGiKl9HhU4XZn+I5Ybk+dt9rti3SYpOmImi0JQ
	LrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oTylK+rCEbVREtWs+6Na8EZ89guG+Emy4yyYZ5CORLg=;
	b=QkTkRIvW38dcJBaJ0rL18FyT4VZvvCW+Q2QD9HoI40AENyNsKFKICKgyf2vu5ax2CW
	tWF6QPfssQNk2nOkjQNBODjVFUTizZZzMtk9LPJHLyVuMx/4KhLQ5X6lkkj5/wRoCOY5
	a509RGTJcTNb/6O4VvGj7oPY+N39b8pksMwVtoijeLpkSjN9fgsZSaXcX5v8qBDj35I3
	SS2wDs9TR+mUsf97rCO8VxRlXU7w264r9NZLsnPBrzvD3kGNqt5ARs5v2H5aBpHucmvo
	LSav6grt9das6k1ywrHCV4bYki2YFwhbFVwAFvQZWF7+3Zr3gC8E6pkZe/R9hBS95q5k
	kvhw==
X-Gm-Message-State: AE9vXwNuPdQyh5KMJWpXJEaJJ4nxPMsfG1QV3hQq5lPIDTT+1XKmaTr9hJ172GuueRRCWB6C
X-Received: by 10.107.39.6 with SMTP id n6mr8922708ion.10.1474637201874;
	Fri, 23 Sep 2016 06:26:41 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56298.dip0.t-ipconnect.de.
	[87.165.98.152])
	by smtp.gmail.com with ESMTPSA id y76sm2832026ioi.5.2016.09.23.06.26.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 06:26:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:26:05 +0200
Message-Id: <1474637165-22899-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1474626443.7161.5.camel@intel.com>
References: <1474626443.7161.5.camel@intel.com>
Subject: [PATCHv2] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 13:26:41 -0000

This update fixes several CVEs:
* OCSP Status Request extension unbounded memory growth (CVE-2016-6304)
* SWEET32 Mitigation (CVE-2016-2183)
* OOB write in MDC2_Update() (CVE-2016-6303)
* Malformed SHA512 ticket DoS (CVE-2016-6302)
* OOB write in BN_bn2dec() (CVE-2016-2182)
* OOB read in TS_OBJ_print_bio() (CVE-2016-2180)
* DTLS buffered message DoS (CVE-2016-2179)
* DTLS replay protection DoS (CVE-2016-2181)
* Certificate message OOB reads (CVE-2016-6306)

Of these, only CVE-2016-6304 is considered of high
severity. Everything else is low. CVE-2016-2177 and CVE-2016-2178 were
already fixed via local patches, which can be removed now.

See https://www.openssl.org/news/secadv/20160922.txt for details.

Some patches had to be refreshed and one compile error fix from
upstream's OpenSSL_1_0_2-stable was required. The server.pem
file is needed for test_dtls.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---

Notes:
    Changes since v1:
         * Install server.pem to get all ptests to pass.

 meta/recipes-connectivity/openssl/openssl.inc      |   1 +
 .../openssl/openssl/CVE-2016-2177.patch            | 286 ---------------------
 .../openssl/openssl/CVE-2016-2178.patch            |  51 ----
 .../openssl/Fix-typo-introduced-by-a03f81f4.patch  |  29 +++
 .../openssl/openssl/debian/ca.patch                |   2 +-
 .../openssl/openssl/parallel.patch                 |  17 +-
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  60 -----
 .../recipes-connectivity/openssl/openssl_1.0.2i.bb |  59 +++++
 8 files changed, 104 insertions(+), 401 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2i.bb

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index a632d8a..f3a2c5a 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -211,6 +211,7 @@ do_install_ptest () {
 	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
 	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
 	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
+	cp apps/server.pem              ${D}${PTEST_PATH}/apps
 	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
 	mkdir -p ${D}${PTEST_PATH}/util
 	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
deleted file mode 100644
index df36d5f..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
+++ /dev/null
@@ -1,286 +0,0 @@
-From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Thu, 5 May 2016 11:10:26 +0100
-Subject: [PATCH] Avoid some undefined pointer arithmetic
-
-A common idiom in the codebase is:
-
-if (p + len > limit)
-{
-    return; /* Too long */
-}
-
-Where "p" points to some malloc'd data of SIZE bytes and
-limit == p + SIZE
-
-"len" here could be from some externally supplied data (e.g. from a TLS
-message).
-
-The rules of C pointer arithmetic are such that "p + len" is only well
-defined where len <= SIZE. Therefore the above idiom is actually
-undefined behaviour.
-
-For example this could cause problems if some malloc implementation
-provides an address for "p" such that "p + len" actually overflows for
-values of len that are too big and therefore p + len < limit!
-
-Issue reported by Guido Vranken.
-
-CVE-2016-2177
-
-Reviewed-by: Rich Salz <rsalz@openssl.org>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2177
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-
----
- ssl/s3_srvr.c  | 14 +++++++-------
- ssl/ssl_sess.c |  2 +-
- ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++--------------------------
- 3 files changed, 38 insertions(+), 34 deletions(-)
-
-diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
-index ab28702..ab7f690 100644
---- a/ssl/s3_srvr.c
-+++ b/ssl/s3_srvr.c
-@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
- 
-         session_length = *(p + SSL3_RANDOM_SIZE);
- 
--        if (p + SSL3_RANDOM_SIZE + session_length + 1 >= d + n) {
-+        if (SSL3_RANDOM_SIZE + session_length + 1 >= (d + n) - p) {
-             al = SSL_AD_DECODE_ERROR;
-             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
-             goto f_err;
-@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
-     /* get the session-id */
-     j = *(p++);
- 
--    if (p + j > d + n) {
-+    if ((d + n) - p < j) {
-         al = SSL_AD_DECODE_ERROR;
-         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
-         goto f_err;
-@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
- 
-     if (SSL_IS_DTLS(s)) {
-         /* cookie stuff */
--        if (p + 1 > d + n) {
-+        if ((d + n) - p < 1) {
-             al = SSL_AD_DECODE_ERROR;
-             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
-             goto f_err;
-         }
-         cookie_len = *(p++);
- 
--        if (p + cookie_len > d + n) {
-+        if ((d + n ) - p < cookie_len) {
-             al = SSL_AD_DECODE_ERROR;
-             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
-             goto f_err;
-@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
-         }
-     }
- 
--    if (p + 2 > d + n) {
-+    if ((d + n ) - p < 2) {
-         al = SSL_AD_DECODE_ERROR;
-         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
-         goto f_err;
-@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
-     }
- 
-     /* i bytes of cipher data + 1 byte for compression length later */
--    if ((p + i + 1) > (d + n)) {
-+    if ((d + n) - p < i + 1) {
-         /* not enough data */
-         al = SSL_AD_DECODE_ERROR;
-         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
-@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
- 
-     /* compression */
-     i = *(p++);
--    if ((p + i) > (d + n)) {
-+    if ((d + n) - p < i) {
-         /* not enough data */
-         al = SSL_AD_DECODE_ERROR;
-         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
-diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
-index b182998..54ee783 100644
---- a/ssl/ssl_sess.c
-+++ b/ssl/ssl_sess.c
-@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *session_id, int len,
-     int r;
- #endif
- 
--    if (session_id + len > limit) {
-+    if (limit - session_id < len) {
-         fatal = 1;
-         goto err;
-     }
-diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
-index fb64607..cdac011 100644
---- a/ssl/t1_lib.c
-+++ b/ssl/t1_lib.c
-@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
-         0x02, 0x03,             /* SHA-1/ECDSA */
-     };
- 
--    if (data >= (limit - 2))
-+    if (limit - data <= 2)
-         return;
-     data += 2;
- 
--    if (data > (limit - 4))
-+    if (limit - data < 4)
-         return;
-     n2s(data, type);
-     n2s(data, size);
-@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
-     if (type != TLSEXT_TYPE_server_name)
-         return;
- 
--    if (data + size > limit)
-+    if (limit - data < size)
-         return;
-     data += size;
- 
-@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
-         const size_t len1 = sizeof(kSafariExtensionsBlock);
-         const size_t len2 = sizeof(kSafariTLS12ExtensionsBlock);
- 
--        if (data + len1 + len2 != limit)
-+        if (limit - data != (int)(len1 + len2))
-             return;
-         if (memcmp(data, kSafariExtensionsBlock, len1) != 0)
-             return;
-@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
-     } else {
-         const size_t len = sizeof(kSafariExtensionsBlock);
- 
--        if (data + len != limit)
-+        if (limit - data != (int)(len))
-             return;
-         if (memcmp(data, kSafariExtensionsBlock, len) != 0)
-             return;
-@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
-     if (data == limit)
-         goto ri_check;
- 
--    if (data > (limit - 2))
-+    if (limit - data < 2)
-         goto err;
- 
-     n2s(data, len);
- 
--    if (data + len != limit)
-+    if (limit - data != len)
-         goto err;
- 
--    while (data <= (limit - 4)) {
-+    while (limit - data >= 4) {
-         n2s(data, type);
-         n2s(data, size);
- 
--        if (data + size > (limit))
-+        if (limit - data < size)
-             goto err;
- # if 0
-         fprintf(stderr, "Received extension type %d size %d\n", type, size);
-@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SSL *s,
-     if (s->hit || s->cert->srv_ext.meths_count == 0)
-         return 1;
- 
--    if (data >= limit - 2)
-+    if (limit - data <= 2)
-         return 1;
-     n2s(data, len);
- 
--    if (data > limit - len)
-+    if (limit - data < len)
-         return 1;
- 
--    while (data <= limit - 4) {
-+    while (limit - data >= 4) {
-         n2s(data, type);
-         n2s(data, size);
- 
--        if (data + size > limit)
-+        if (limit - data < size)
-             return 1;
-         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) <= 0)
-             return 0;
-@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, unsigned char **p,
-                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
- # endif
- 
--    if (data >= (d + n - 2))
-+    if ((d + n) - data <= 2)
-         goto ri_check;
- 
-     n2s(data, length);
--    if (data + length != d + n) {
-+    if ((d + n) - data != length) {
-         *al = SSL_AD_DECODE_ERROR;
-         return 0;
-     }
- 
--    while (data <= (d + n - 4)) {
-+    while ((d + n) - data >= 4) {
-         n2s(data, type);
-         n2s(data, size);
- 
--        if (data + size > (d + n))
-+        if ((d + n) - data < size)
-             goto ri_check;
- 
-         if (s->tlsext_debug_cb)
-@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *session_id, int len,
-     /* Skip past DTLS cookie */
-     if (SSL_IS_DTLS(s)) {
-         i = *(p++);
--        p += i;
--        if (p >= limit)
-+
-+        if (limit - p <= i)
-             return -1;
-+
-+        p += i;
-     }
-     /* Skip past cipher list */
-     n2s(p, i);
--    p += i;
--    if (p >= limit)
-+    if (limit - p <= i)
-         return -1;
-+    p += i;
-+
-     /* Skip past compression algorithm list */
-     i = *(p++);
--    p += i;
--    if (p > limit)
-+    if (limit - p < i)
-         return -1;
-+    p += i;
-+
-     /* Now at start of extensions */
--    if ((p + 2) >= limit)
-+    if (limit - p <= 2)
-         return 0;
-     n2s(p, i);
--    while ((p + 4) <= limit) {
-+    while (limit - p >= 4) {
-         unsigned short type, size;
-         n2s(p, type);
-         n2s(p, size);
--        if (p + size > limit)
-+        if (limit - p < size)
-             return 0;
-         if (type == TLSEXT_TYPE_session_ticket) {
-             int r;
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
deleted file mode 100644
index 27ade4e..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 399944622df7bd81af62e67ea967c470534090e2 Mon Sep 17 00:00:00 2001
-From: Cesar Pereida <cesar.pereida@aalto.fi>
-Date: Mon, 23 May 2016 12:45:25 +0300
-Subject: [PATCH] Fix DSA, preserve BN_FLG_CONSTTIME
-
-Operations in the DSA signing algorithm should run in constant time in
-order to avoid side channel attacks. A flaw in the OpenSSL DSA
-implementation means that a non-constant time codepath is followed for
-certain operations. This has been demonstrated through a cache-timing
-attack to be sufficient for an attacker to recover the private DSA key.
-
-CVE-2016-2178
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-
-Upstream-Status: Backport
-CVE: CVE-2016-2178
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- crypto/dsa/dsa_ossl.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-Index: openssl-1.0.2h/crypto/dsa/dsa_ossl.c
-===================================================================
---- openssl-1.0.2h.orig/crypto/dsa/dsa_ossl.c
-+++ openssl-1.0.2h/crypto/dsa/dsa_ossl.c
-@@ -248,9 +248,6 @@ static int dsa_sign_setup(DSA *dsa, BN_C
-         if (!BN_rand_range(&k, dsa->q))
-             goto err;
-     while (BN_is_zero(&k)) ;
--    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
--        BN_set_flags(&k, BN_FLG_CONSTTIME);
--    }
- 
-     if (dsa->flags & DSA_FLAG_CACHE_MONT_P) {
-         if (!BN_MONT_CTX_set_locked(&dsa->method_mont_p,
-@@ -282,6 +279,11 @@ static int dsa_sign_setup(DSA *dsa, BN_C
-     } else {
-         K = &k;
-     }
-+
-+    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
-+        BN_set_flags(K, BN_FLG_CONSTTIME);
-+    }
-+
-     DSA_BN_MOD_EXP(goto err, dsa, r, dsa->g, K, dsa->p, ctx,
-                    dsa->method_mont_p);
-     if (!BN_mod(r, r, dsa->q, ctx))
diff --git a/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch b/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
new file mode 100644
index 0000000..0411296
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/Fix-typo-introduced-by-a03f81f4.patch
@@ -0,0 +1,29 @@
+From 581215a519c66db7255ea360ed25bb00033ccd52 Mon Sep 17 00:00:00 2001
+From: Rich Salz <rsalz@openssl.org>
+Date: Thu, 22 Sep 2016 08:47:45 -0400
+Subject: [PATCH] Fix typo introduced by a03f81f4
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/581215a519c66db7255ea360ed25bb00033ccd52]
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ crypto/engine/eng_cryptodev.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
+index 65a74df..2a2b95c 100644
+--- a/crypto/engine/eng_cryptodev.c
++++ b/crypto/engine/eng_cryptodev.c
+@@ -939,7 +939,7 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
+     if (fstate->mac_len != 0) {
+         if (fstate->mac_data != NULL) {
+             dstate->mac_data = OPENSSL_malloc(fstate->mac_len);
+-            if (dstate->ac_data == NULL) {
++            if (dstate->mac_data == NULL) {
+                 printf("cryptodev_digest_init: malloc failed\n");
+                 return 0;
+             }
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
index aba4d42..fb745e4 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
@@ -7,7 +7,7 @@ Index: openssl-0.9.8m/apps/CA.pl.in
 @@ -65,6 +65,7 @@
  foreach (@ARGV) {
  	if ( /^(-\?|-h|-help)$/ ) {
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
+ 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
 +	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
  	    exit 0;
  	} elsif (/^-newcert$/) {
diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl/parallel.patch
index b6c2c14..f3f4c99 100644
--- a/meta/recipes-connectivity/openssl/openssl/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
@@ -6,6 +6,9 @@ https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Refreshed for 1.0.2i
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
 --- openssl-1.0.2g/crypto/Makefile
 +++ openssl-1.0.2g/crypto/Makefile
 @@ -85,11 +85,11 @@
@@ -133,7 +136,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  		fi; \
 --- openssl-1.0.2g/test/Makefile
 +++ openssl-1.0.2g/test/Makefile
-@@ -139,7 +139,7 @@
+@@ -144,7 +144,7 @@
  tags:
  	ctags $(SRC)
  
@@ -142,7 +145,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  
  apps:
  	@(cd ..; $(MAKE) DIRS=apps all)
-@@ -421,130 +421,130 @@
+@@ -438,136 +438,136 @@
  		link_app.$${shlib_target}
  
  $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
@@ -309,13 +312,21 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 -	@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
 +	+@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
  
+ $(BADDTLSTEST)$(EXE_EXT): $(BADDTLSTEST).o
+-	@target=$(BADDTLSTEST) $(BUILD_CMD)
++	+@target=$(BADDTLSTEST) $(BUILD_CMD)
+ 
  $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
 -	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
 +	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
  
+ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
+-	@target=$(DTLSTEST); exobj=ssltestlib.o; $(BUILD_CMD)
++	+@target=$(DTLSTEST); exobj=ssltestlib.o; $(BUILD_CMD)
+ 
  #$(AESTEST).o: $(AESTEST).c
  #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
-@@ -557,7 +557,7 @@
+@@ -580,6 +580,6 @@
  #	fi
  
  dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
deleted file mode 100644
index c8444d3..0000000
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-require openssl.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-DEPENDS += "cryptodev-linux"
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://find.pl;subdir=${BP}/util/ \
-            file://run-ptest \
-            file://openssl-c_rehash.sh \
-            file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://debian1.0.2/block_diginotar.patch \
-            file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian/ca.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/debian-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian1.0.2/version-script.patch \
-            file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://openssl-1.0.2a-x32-asm.patch \
-            file://ptest_makefile_deps.patch  \
-            file://configure-musl-target.patch \
-            file://parallel.patch \
-            file://CVE-2016-2177.patch \
-            file://CVE-2016-2178.patch \
-            file://openssl-util-perlpath.pl-cwd.patch \
-           "
-SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
-SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
-
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
-	if ! perl -Mbigint -e true; then
-		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
-	fi
-}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb
new file mode 100644
index 0000000..c32f472
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2i.bb
@@ -0,0 +1,59 @@
+require openssl.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+DEPENDS += "cryptodev-linux"
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://find.pl;subdir=${BP}/util/ \
+            file://run-ptest \
+            file://openssl-c_rehash.sh \
+            file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://oe-ldflags.patch \
+            file://engines-install-in-libdir-ssl.patch \
+            file://debian1.0.2/block_diginotar.patch \
+            file://debian1.0.2/block_digicert_malaysia.patch \
+            file://debian/ca.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/debian-targets.patch \
+            file://debian/man-dir.patch \
+            file://debian/man-section.patch \
+            file://debian/no-rpath.patch \
+            file://debian/no-symbolic.patch \
+            file://debian/pic.patch \
+            file://debian1.0.2/version-script.patch \
+            file://openssl_fix_for_x32.patch \
+            file://fix-cipher-des-ede3-cfb1.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+            file://openssl-fix-des.pod-error.patch \
+            file://Makefiles-ptest.patch \
+            file://ptest-deps.patch \
+            file://openssl-1.0.2a-x32-asm.patch \
+            file://ptest_makefile_deps.patch  \
+            file://configure-musl-target.patch \
+            file://parallel.patch \
+            file://openssl-util-perlpath.pl-cwd.patch \
+            file://Fix-typo-introduced-by-a03f81f4.patch \
+           "
+SRC_URI[md5sum] = "678374e63f8df456a697d3e5e5a931fb"
+SRC_URI[sha256sum] = "9287487d11c9545b6efb287cdb70535d4e9b284dd10d51441d9b9963d000de6f"
+
+PACKAGES =+ "${PN}-engines"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
-- 
2.1.4


