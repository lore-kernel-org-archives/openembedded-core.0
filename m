Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4096.1795856885815534050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 01:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a0Gn+o1I;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15099; q=dns/txt;
  s=iport01; t=1795856886; x=1797066486;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SYZAHly4sn/FreUg+2s11DB9twXDCNNH9zQUvfIH1hQ=;
  b=a0Gn+o1IjCelHx5P0goM/HErc2TB4Ij7rE1pgNGcI0QDBVaJzc8ZCdCb
   1kThEOTzEqzEK1NzSBcstOYqh7fkSgcei71KlFbVX7dV94wKsWeeQ9NJk
   vDk4AvAfggWGaC2h3vMlW9tiZYX02xmH6ZFMtahcVAvTt6YIiMArCNS49
   9Cj4yAxAJdvKbpP3ZolHY5ggWBtCccwObjeyY5WCP2qRH2sjUuMLEDDxW
   aeVhIr9jbOUSJPCkK1kaTfrJ65K67fhj94hPV6rZxjswtBGH1a804nSHA
   cj0BSmJs2mwo5LEHia1g00XYA4LrN/8Jo7zR9KcsvYxFqiMyvPqK/TIsx
   w==;
X-CSE-ConnectionGUID: 55yTM/fsRC6ttXg64a36nQ==
X-CSE-MsgGUID: HEuPoBB8ToeygVHcGtJM0g==
X-IPAS-Result: =?us-ascii?q?A0BFAgDTmApr/81K/pBaglmCV3VgQ0mWS5FTjFmBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY4lAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBKgsBGAEtLAMBAlojIYMCAYJ0AxEGuR8bN4F5M4EBgykBP?=
 =?us-ascii?q?wICQAFQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAgGIJQSCIoEMg?=
 =?us-ascii?q?VQeZIwPAoFIiFdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA1uBKyZdASGBBoF2AoJRggACAUZBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHI5EDAcJC8FFyY8GweBDCcdGxcOAigGFSELQ?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QSgk0bMgEBATwkCRETASkCBE+BKgE8AyEIkn2SPqERC?=
 =?us-ascii?q?iiDeYwklToaM4QElBqSVQuYfYIBWIsxlTYCLAYLXYRqgWg8gVlwFTuCZwkWN?=
 =?us-ascii?q?BkPji4LC4NghkDIGyYyAgkyAQEHAgcOAwuBaJAAKoFUAQE?=
IronPort-Data: A9a23:Dp4nSap/m+C1eblZ0Cg2+cKuAGNeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnTa/jbZ2Hye952boSy8R5U7JXSyoM1SQNu+H00RXgVpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rsqEF1rs
 vIDEhtTcgyziLzqyenlTNA506zPLOGzVG8eknht13TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9KYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoLSFZQMwRnBz
 o7A10TUHykdHvbP9T2I432SpuTggQHeAI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:hIMj06nmKUkvkTPB03CkTBNCEl3pDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:pKkP8W7pJwnsVYrVzNssqRMFJuVifGbn5ynMP3+3VzpgE+OTcArF
X-Talos-MUID: 9a23:nYLCgwRJ8z40fD4MRXTMqSxaM+1Cs5ipBVECr7UNlNWmEHR/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="60891771"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 09:08:03 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id BDFDD180004D1;
	Sat, 28 Nov 2026 09:08:02 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 700C2CC1611; Sat, 28 Nov 2026 01:08:01 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v3] curl: fix CVE-2026-80231
Date: Sat, 28 Nov 2026 01:07:56 -0800
Message-Id: <20261128090756.2595052-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251484
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the native CA connection-reuse fix [1] against the current
Wrynose curl 8.19.0 recipe.

Move the effective native CA setting into the primary SSL configuration
and include it in connection matching and cloning. Update each affected
TLS backend to read the connection setting using the curl 8.19.0 layout.
The upstream advisory is referenced in [2].

Adapt the option setter and default CA setup to the existing code and
extend unit3303 with independent origin and proxy native-CA cloning
and connection-matching checks.

[1] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42
[2] https://curl.se/docs/CVE-2026-80231.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v3:
- Refresh directly against current Wrynose without held patches 1-3/5.
- Adapt native-CA assignments in the existing option setter and TLS
  configuration setup, removing the CVE-2026-11564 dependency.
- Add independent unit3303 checks for native-CA cloning and connection
  matching for origin and proxy, with raw SSL options unchanged.
- Remove the optional local cherry-pick footer.
---
 .../curl/curl/CVE-2026-80231.patch            | 286 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80231.patch b/meta/recipes-support/curl/curl/CVE-2026-80231.patch
new file mode 100644
index 0000000000..79fa20cef0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80231.patch
@@ -0,0 +1,286 @@
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
+- Move native_ca_store between the structs in lib/urldata.h; curl
+  8.19.0 has no lib/vtls/vtls_config.h.
+- Update matching, cloning and origin/proxy defaults in
+  lib/vtls/vtls.c rather than upstream's lib/vtls/vtls_config.c.
+- Update set_ssl_options() in lib/setopt.c for explicit origin and
+  proxy SSL options. Curl 8.19.0 sets this flag there rather than in
+  the later ssl_easy_config_compl_options() helper.
+- Update Curl_gtls_verifyserver() rather than upstream's
+  gtls_verify_cert(). The older call site uses glts_apple_verify()
+  rather than Curl_vtls_apple_verify().
+- Omit the ossl_apply_session() hunk, which changes a flag access in
+  the SecTrust session-reuse exception added by [1]. Curl 8.19.0 lacks
+  that exception and scs->sectrust_verified. Its
+  ossl_init_session_and_alpns() still checks cached-session verification
+  with SSL_get_verify_result(); keep that existing check.
+- Add unit3303 origin and proxy reuse checks with identical raw SSL
+  options: seed native CA selection TRUE before cloning, check clone
+  preservation, reject FALSE and match again after restoring TRUE.
+
+[1] https://github.com/curl/curl/commit/75c2c881af3201bc35d582eb4304e9b8ce3436ea
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/setopt.c          |  2 +-
+ lib/urldata.h         |  2 +-
+ lib/vtls/gtls.c       |  6 +++---
+ lib/vtls/openssl.c    |  7 +++----
+ lib/vtls/rustls.c     |  2 +-
+ lib/vtls/vtls.c       |  6 ++++--
+ lib/vtls/wolfssl.c    |  5 ++---
+ tests/unit/unit3303.c | 34 ++++++++++++++++++++++++++++++++++
+ 8 files changed, 49 insertions(+), 15 deletions(-)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index f9b12f4e6236f54e556c083e2ceca55672cbed2c..6242788a9729780a79522981b34938b41228197d 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -417,7 +417,7 @@ static void set_ssl_options(struct ssl_config_data *ssl,
+   ssl->no_revoke = !!(arg & CURLSSLOPT_NO_REVOKE);
+   ssl->no_partialchain = !!(arg & CURLSSLOPT_NO_PARTIALCHAIN);
+   ssl->revoke_best_effort = !!(arg & CURLSSLOPT_REVOKE_BEST_EFFORT);
+-  ssl->native_ca_store = !!(arg & CURLSSLOPT_NATIVE_CA);
++  config->native_ca_store = !!(arg & CURLSSLOPT_NATIVE_CA);
+   ssl->auto_client_cert = !!(arg & CURLSSLOPT_AUTO_CLIENT_CERT);
+   ssl->earlydata = !!(arg & CURLSSLOPT_EARLYDATA);
+ }
+diff --git a/lib/urldata.h b/lib/urldata.h
+index dce181d99d0d079466f38d8547863cf1768dd16d..0bc9ade696d4009c23e3028a8204c40d503f0fb9 100644
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
+index bfeb9485428773b8c6e4f5b5e68d200d4057d9db..f19940a27a38f93ef05d2e7debdcb8b75f363832 100644
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
+index cb6fcc4dba430362b4df5e7c6c3f47f72e359b87..cc6895b0b3282e53d4c5558a960b5f84491d1102 100644
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
+@@ -4838,7 +4837,7 @@ CURLcode Curl_ossl_check_peer_cert(struct Curl_cfilter *cf,
+     infof(data, "SSL certificate verified via OpenSSL.");
+ 
+ #ifdef USE_APPLE_SECTRUST
+-  if(!verified && conn_config->verifypeer && ssl_config->native_ca_store) {
++  if(!verified && conn_config->verifypeer && conn_config->native_ca_store) {
+     /* we verify using Apple SecTrust *unless* OpenSSL already verified.
+      * This may happen if the application intercepted the OpenSSL callback
+      * and installed its own. */
+diff --git a/lib/vtls/rustls.c b/lib/vtls/rustls.c
+index 564b10aa47c16e73577a1c94cfa72044ef8dffbd..89619432b84fcb92d14bcec61e32875f956c1283 100644
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
+index 6dcc67dccd4e1087d0c6722ab83b04f8d7ed64f9..5371d320a71a9eaf25fcaa9babd2edc646d41087 100644
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
+@@ -317,7 +319,7 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+-      sslc->native_ca_store = TRUE;
++      sslc->primary.native_ca_store = TRUE;
+ #endif
+ #ifdef CURL_CA_PATH
+     if(!sslc->custom_capath && !set->str[STRING_SSL_CAPATH]) {
+@@ -363,7 +365,7 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+-      sslc->native_ca_store = TRUE;
++      sslc->primary.native_ca_store = TRUE;
+ #endif
+ #ifdef CURL_CA_PATH
+     if(!sslc->custom_capath && !set->str[STRING_SSL_CAPATH_PROXY]) {
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index fdf33a809a8317254b34adb25ae0bc0df410cd4a..c901ebfe1e8007e8adeeebb98d78e7af091d4e50 100644
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
+diff --git a/tests/unit/unit3303.c b/tests/unit/unit3303.c
+index 41bced542d629be7fad308ad5ba94731ae01fc02..3e55c793efd28aebab3f25b1e37d55fde511159e 100644
+--- a/tests/unit/unit3303.c
++++ b/tests/unit/unit3303.c
+@@ -62,6 +62,12 @@ static CURLcode test_unit3303(const char *arg)
+       goto unit_test_abort;
+     }
+ 
++    primary = &((struct Curl_easy *)curl)->set.ssl.primary;
++    primary->native_ca_store = TRUE;
++#ifndef CURL_DISABLE_PROXY
++    ((struct Curl_easy *)curl)->set.proxy_ssl.primary.native_ca_store = TRUE;
++#endif
++
+     conn = curlx_calloc(1, sizeof(*conn));
+     if(!conn || Curl_ssl_conn_config_init((struct Curl_easy *)curl, conn)) {
+       if(conn)
+@@ -77,7 +83,35 @@ static CURLcode test_unit3303(const char *arg)
+                                            FALSE),
+                 "identical mTLS config should match");
+ 
++    /* Effective native CA selection is distinct from raw SSL options. */
++    fail_unless(conn->ssl_config.native_ca_store,
++                "connection clone retains native CA selection");
++    primary->native_ca_store = FALSE;
++    fail_unless(primary->ssl_options == conn->ssl_config.ssl_options,
++                "native CA change leaves raw SSL options unchanged");
++    fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                            FALSE),
++                "different native CA selection must not reuse conn");
++    primary->native_ca_store = TRUE;
++    fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                           FALSE),
++                "restored native CA selection should match");
++#ifndef CURL_DISABLE_PROXY
++    primary = &((struct Curl_easy *)curl)->set.proxy_ssl.primary;
++    fail_unless(conn->proxy_ssl_config.native_ca_store,
++                "proxy connection clone retains native CA selection");
++    primary->native_ca_store = FALSE;
++    fail_unless(primary->ssl_options == conn->proxy_ssl_config.ssl_options,
++                "proxy native CA change leaves raw SSL options unchanged");
++    fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                            TRUE),
++                "different proxy native CA selection must not reuse conn");
++    primary->native_ca_store = TRUE;
++    fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                           TRUE),
++                "restored proxy native CA selection should match");
+     primary = &((struct Curl_easy *)curl)->set.ssl.primary;
++#endif
+ 
+     /* Different key_passwd must not match. */
+     saved = primary->key_passwd;
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 734f9c37b6..c4a6b3af43 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-92389.patch \
            file://CVE-2026-86409.patch \
+           file://CVE-2026-80231.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
