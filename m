Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3157.1792748016125528739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Eg2zhSo2;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11799; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fpa8YRCxD3LIiMuHT9kEix/YUSOcfwB0eMjQwXJ94xE=;
  b=Eg2zhSo2WFGjRAybkGxkaF2nDFHrpdOpHv1MxI6hywoNuO80t4B/zX3o
   cd+GyACcQ7bjaIWJxF8JXzYBPp4VdaYZxGbcmkop8+pMmtSi4iJMPYx1U
   frWl/lwooSMMVuFWgtZrTYpwYxGwQ0VSEc4JZavv1CgJHP+1ehQAVqe7x
   vY0+YEoyuBwcWzNIPNV11NVM40cDVWh7HMD5Y7FVkqY/H2TGFKH6fJEk0
   X7xsKbxuNLfUaMlRbr1W4RHckdkmxOcnn0USQF3uvocdQTHE/yTShwpIe
   CqMPL2scKHOP6Exzz0WE5a4YWY4rV6s3FHOwa3uAqCEObVNDLXhlHm35Q
   g==;
X-CSE-ConnectionGUID: kEQs4S3OQ3yrtW+q+pmG0g==
X-CSE-MsgGUID: PfGfI+kVRnKU5r7juDW7ew==
X-IPAS-Result: =?us-ascii?q?A0BIAgBDKdtq/5D/Ja1aglmCV3VgQ0mWSwORSoxSgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGtXkbN4F5M?=
 =?us-ascii?q?4EBgykBPwICQAFQ2zIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAgGIJ?=
 =?us-ascii?q?ASCDRWBDIFaHmWNCQKGc0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgR6BFiMZNmuBCV2BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExouC4EaODwJJkEVDGYLGgViCAINDH85EB8YDUgRLDcVGQQ+bgeRb?=
 =?us-ascii?q?4I8GzIBAQFgAgcREwEpAgRPgWcDIQiSfZI/oQ8KKIN2jCKVOhozhASUF5JUC?=
 =?us-ascii?q?5h9ggFYizGVNAI9XYRpgWg8gVlwFTuCZwkWNBkPji4LC4NghkDHeSEnMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiQACqBVAEB?=
IronPort-Data: A9a23:PSn2sa8Eten7wa6XnWJZDrUD7n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mMZCGqBOvaIY2ugeNgnOY20/U0B6sfVn4dkHgRt/H9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajhPs/7rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k1ELQDpt0sJlgV5
 OYEF3MULQiGqLq5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYGEIYzQHpwM9qqej
 lrI0GrYQRIkDtq89GefrXCxqtCQkDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXY0St1ZFet84waLxaPQyx2cB2wJCDBbAOHKr+csTjAsk
 1vMlNTzCHk37/ueSGmW8fGfqjba1TUpEFLurBQsFWMti+QPaqlp5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:vjfM3qCnveTYkEXlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AuRlCSWj6EFLTvLIh6qCgESfKLDJucVDk1yvreGi?=
 =?us-ascii?q?BUndzVILWUByI/Yw8nJ87?=
X-Talos-MUID: 9a23:nTOS3gmmAvcX8eYhZ8VGdnpaOuhmwuetNnoLsqhboZaGKABPZDqC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="539382311"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 64B78180003E4;
	Fri, 23 Oct 2026 09:33:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B487ECBF21E; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 5/5] curl: fix CVE-2026-80231
Date: Fri, 23 Oct 2026 02:33:31 -0700
Message-Id: <20261023093331.1886272-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261023093331.1886272-1-dkelaiya@cisco.com>
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248495
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Apply the native CA connection-reuse fix [1] after CVE-2026-11564.
Store the effective native CA setting in the primary SSL configuration
and include it in connection matching and cloning. Update each affected
TLS backend to read the connection setting using the curl 8.19.0
layout. The upstream advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42
[2] https://curl.se/docs/CVE-2026-80231.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Explain the older struct/function locations and GnuTLS helpers.
- Document that the omitted hunk only updates a flag access in a
  later SecTrust session-reuse exception absent from curl 8.19.0.
- Clarify that the existing cached-session verification check remains.
---
 .../curl/curl/CVE-2026-80231.patch            | 225 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80231.patch b/meta/recipes-support/curl/curl/CVE-2026-80231.patch
new file mode 100644
index 0000000000..e0e3dd180f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80231.patch
@@ -0,0 +1,225 @@
+From 7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 25 Aug 2026 13:47:11 +0200
+Subject: [PATCH] vtls: move 'native_ca_store' ssl_config_data =>
+ ssl_primary_config
+
+And include it as key for connection reuse matching.
+
+Reported-by: Stanislav Fort
+
+Closes #22668
+
+CVE: CVE-2026-80231
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42]
+
+Backport Changes:
+- Moved native_ca_store from ssl_config_data to ssl_primary_config
+  in lib/urldata.h, where curl 8.19.0 defines both structs. Upstream
+  makes this change in lib/vtls/vtls_config.h.
+- Added the field to match_ssl_primary_config() and
+  clone_ssl_primary_config(), and updated option completion in
+  lib/vtls/vtls.c. Upstream keeps these functions in
+  lib/vtls/vtls_config.c.
+- Updated the native-CA read in Curl_gtls_verifyserver(), which is
+  the 8.19.0 location of upstream's gtls_verify_cert() check. The
+  older call site uses glts_apple_verify(); upstream calls
+  Curl_vtls_apple_verify().
+- Omitted the ossl_apply_session() hunk: it changes a flag access inside
+  a SecTrust session-reuse exception added by [1]. Curl 8.19.0 has
+  neither that exception nor the scs->sectrust_verified field.
+  Its ossl_init_session_and_alpns() rejects cached sessions when
+  verifypeer is set and SSL_get_verify_result() is not X509_V_OK.
+  Kept that existing check; there is no native-CA access to update.
+
+[1] https://github.com/curl/curl/commit/75c2c881af3201bc35d582eb4304e9b8ce3436ea
+
+(cherry picked from commit 7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/urldata.h      | 2 +-
+ lib/vtls/gtls.c    | 6 +++---
+ lib/vtls/openssl.c | 7 +++----
+ lib/vtls/rustls.c  | 2 +-
+ lib/vtls/vtls.c    | 8 +++++---
+ lib/vtls/wolfssl.c | 5 ++---
+ 6 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/lib/urldata.h b/lib/urldata.h
+index dce181d..0bc9ade 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -249,6 +249,7 @@ struct ssl_primary_config {
+   BIT(verifypeer);       /* set TRUE if this is desired */
+   BIT(verifyhost);       /* set TRUE if CN/SAN must match hostname */
+   BIT(verifystatus);     /* set TRUE if certificate status must be checked */
++  BIT(native_ca_store); /* use the native CA store of operating system */
+   BIT(cache_session);    /* cache session or not */
+ };
+ 
+@@ -264,7 +265,6 @@ struct ssl_config_data {
+   BIT(no_partialchain); /* do not accept partial certificate chains */
+   BIT(revoke_best_effort); /* ignore SSL revocation offline/missing revocation
+                               list errors */
+-  BIT(native_ca_store); /* use the native CA store of operating system */
+   BIT(auto_client_cert);   /* automatically locate and use a client
+                               certificate for authentication (Schannel) */
+   BIT(custom_cafile); /* application has set custom CA file */
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index bfeb948..f19940a 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -451,7 +451,7 @@ static CURLcode gtls_populate_creds(struct Curl_cfilter *cf,
+   }
+ 
+   infof(data, "SSL Trust Anchors:");
+-  if(ssl_config->native_ca_store) {
++  if(config->native_ca_store) {
+ #ifdef USE_APPLE_SECTRUST
+     infof(data, "  Native: Apple SecTrust");
+     creds_are_empty = FALSE;
+@@ -655,7 +655,7 @@ CURLcode Curl_gtls_client_trust_setup(struct Curl_cfilter *cf,
+     !conn_config->CApath &&
+     !conn_config->ca_info_blob &&
+     !ssl_config->primary.CRLfile &&
+-    !ssl_config->native_ca_store &&
++    !conn_config->native_ca_store &&
+     !conn_config->clientcert; /* GnuTLS adds client cert to its credentials! */
+ 
+   if(cache_criteria_met)
+@@ -1659,7 +1659,7 @@ CURLcode Curl_gtls_verifyserver(struct Curl_cfilter *cf,
+       infof(data, "  SSL certificate verified by GnuTLS");
+ 
+ #ifdef USE_APPLE_SECTRUST
+-    if(!verified && ssl_config->native_ca_store) {
++    if(!verified && config->native_ca_store) {
+       result = glts_apple_verify(cf, data, peer, &chain, &verified);
+       if(result && (result != CURLE_PEER_FAILED_VERIFICATION))
+         goto out; /* unexpected error */
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 1cf357c..e162114 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -3034,7 +3034,6 @@ static CURLcode ossl_load_trust_anchors(struct Curl_cfilter *cf,
+                                         X509_STORE *store)
+ {
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
+-  struct ssl_config_data *ssl_config = Curl_ssl_cf_get_config(cf, data);
+   CURLcode result = CURLE_OK;
+   const char * const ssl_cafile =
+     /* CURLOPT_CAINFO_BLOB overrides CURLOPT_CAINFO */
+@@ -3043,7 +3042,7 @@ static CURLcode ossl_load_trust_anchors(struct Curl_cfilter *cf,
+   bool have_native_check = FALSE;
+ 
+   octx->store_is_empty = TRUE;
+-  if(ssl_config->native_ca_store) {
++  if(conn_config->native_ca_store) {
+ #ifdef USE_WIN32_CRYPTO
+     bool added = FALSE;
+     result = ossl_windows_load_anchors(cf, data, store, &added);
+@@ -3352,7 +3351,7 @@ CURLcode Curl_ssl_setup_x509_store(struct Curl_cfilter *cf,
+     !conn_config->CApath &&
+     !conn_config->ca_info_blob &&
+     !ssl_config->primary.CRLfile &&
+-    !ssl_config->native_ca_store;
++    !conn_config->native_ca_store;
+ 
+   ERR_set_mark();
+ 
+@@ -4834,7 +4833,7 @@ CURLcode Curl_ossl_check_peer_cert(struct Curl_cfilter *cf,
+     infof(data, "SSL certificate verified via OpenSSL.");
+ 
+ #ifdef USE_APPLE_SECTRUST
+-  if(!verified && conn_config->verifypeer && ssl_config->native_ca_store) {
++  if(!verified && conn_config->verifypeer && conn_config->native_ca_store) {
+     /* we verify using Apple SecTrust *unless* OpenSSL already verified.
+      * This may happen if the application intercepted the OpenSSL callback
+      * and installed its own. */
+diff --git a/lib/vtls/rustls.c b/lib/vtls/rustls.c
+index 564b10a..8961943 100644
+--- a/lib/vtls/rustls.c
++++ b/lib/vtls/rustls.c
+@@ -1035,7 +1035,7 @@ static CURLcode cr_init_backend(struct Curl_cfilter *cf,
+     rustls_client_config_builder_dangerous_set_certificate_verifier(
+       config_builder, cr_verify_none);
+   }
+-  else if(ssl_config->native_ca_store) {
++  else if(conn_config->native_ca_store) {
+     result = init_config_builder_platform_verifier(data, config_builder);
+     if(result != CURLE_OK) {
+       rustls_client_config_builder_free(config_builder);
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 35cb4f0..a3ed81b 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -198,6 +198,7 @@ static bool match_ssl_primary_config(struct Curl_easy *data,
+   if((c1->version == c2->version) &&
+      (c1->version_max == c2->version_max) &&
+      (c1->ssl_options == c2->ssl_options) &&
++     (c1->native_ca_store == c2->native_ca_store) &&
+      (c1->verifypeer == c2->verifypeer) &&
+      (c1->verifyhost == c2->verifyhost) &&
+      (c1->verifystatus == c2->verifystatus) &&
+@@ -251,6 +252,7 @@ static bool clone_ssl_primary_config(struct ssl_primary_config *source,
+   dest->verifypeer = source->verifypeer;
+   dest->verifyhost = source->verifyhost;
+   dest->verifystatus = source->verifystatus;
++  dest->native_ca_store = source->native_ca_store;
+   dest->cache_session = source->cache_session;
+   dest->ssl_options = source->ssl_options;
+ 
+@@ -312,7 +314,7 @@ static void ssl_easy_config_compl_options(struct ssl_config_data *sslc)
+   /* If set via CURLOPT_(PROXY_)SSL_OPTIONS, we definitely use it.
+    * If not, we switch it on for supported backends if no custom
+    * ca settings exist. */
+-  sslc->native_ca_store = !!(options & CURLSSLOPT_NATIVE_CA);
++  sslc->primary.native_ca_store = !!(options & CURLSSLOPT_NATIVE_CA);
+   sslc->enable_beast = !!(options & CURLSSLOPT_ALLOW_BEAST);
+   sslc->no_partialchain = !!(options & CURLSSLOPT_NO_PARTIALCHAIN);
+   sslc->no_revoke = !!(options & CURLSSLOPT_NO_REVOKE);
+@@ -335,7 +337,7 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+-      sslc->native_ca_store = TRUE;
++      sslc->primary.native_ca_store = TRUE;
+ #endif
+ #ifdef CURL_CA_PATH
+     if(!sslc->custom_capath && !set->str[STRING_SSL_CAPATH]) {
+@@ -384,7 +386,7 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+-      sslc->native_ca_store = TRUE;
++      sslc->primary.native_ca_store = TRUE;
+ #endif
+ #ifdef CURL_CA_PATH
+     if(!sslc->custom_capath && !set->str[STRING_SSL_CAPATH_PROXY]) {
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index fdf33a8..c901ebf 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -593,13 +593,12 @@ static CURLcode wssl_populate_x509_store(struct Curl_cfilter *cf,
+     /* CURLOPT_CAINFO_BLOB overrides CURLOPT_CAINFO */
+     (ca_info_blob ? NULL : conn_config->CAfile);
+   const char * const ssl_capath = conn_config->CApath;
+-  struct ssl_config_data *ssl_config = Curl_ssl_cf_get_config(cf, data);
+   bool imported_native_ca = FALSE;
+   bool imported_ca_info_blob = FALSE;
+ 
+ #ifndef NO_FILESYSTEM
+   /* load native CA certificates */
+-  if(ssl_config->native_ca_store) {
++  if(conn_config->native_ca_store) {
+ #ifdef WOLFSSL_SYS_CA_CERTS
+     if(wolfSSL_CTX_load_system_CA_certs(wssl->ssl_ctx) != WOLFSSL_SUCCESS) {
+       infof(data, "error importing native CA store, continuing anyway");
+@@ -810,7 +809,7 @@ CURLcode Curl_wssl_setup_x509_store(struct Curl_cfilter *cf,
+     !conn_config->CApath &&
+     !conn_config->ca_info_blob &&
+     !ssl_config->primary.CRLfile &&
+-    !ssl_config->native_ca_store;
++    !conn_config->native_ca_store;
+ 
+   cached_store = cache_criteria_met ? wssl_get_cached_x509_store(cf, data)
+                                     : NULL;
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index e8e4a7e998..adee64a018 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80255.patch \
            file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-80231.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

