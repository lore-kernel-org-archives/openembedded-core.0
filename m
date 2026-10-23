Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3156.1792748016059443437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NjFxiP9/;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7357; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qA5bHaPuIsn8WH+3nWhxw/kHyD9wdJubQ/UcdcrWo0=;
  b=NjFxiP9/uA9+7R+E/5lSDh+UrVYZhkEt/zbp7yYjBmSX9PC58rB/XNG+
   qUfw03j+WchGYIZVlpSKnvBI9Lzk9BiWLbvBDPvb3+NE9oXnmIF1Z/EV5
   RmwDy+L8MJr6+zi9eAVPPZTMiOC5pq9vhqwq0tJPldu9kbIlQTxplEZrh
   Rp7IgHlTWoShIkxDfVVsKlH1wvNVyqA2WZHoUNC9wYRKo68oydGxTNn+5
   1ZoXVeEih1R1qAckIjsOsxJVIg0TTnzOCHTtBvaPQC+9bhrtozBYCGzta
   6aMXrJjZWlTlz5S4rMRAZKVKSWbrI+Y+3K75qr2L8JMHW/5Z+vm/T0Ckm
   Q==;
X-CSE-ConnectionGUID: QUhTqkL1SVWpiUGdEWPq7Q==
X-CSE-MsgGUID: 0fgEcte1Tcu3WP6CfX0eqQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDGKNtq/4v/Ja1aglmCV3VgQ0mWSwOeHBSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgQCYMCAYJ0AxEGtXUbN4F5M?=
 =?us-ascii?q?4EBgykBPwICQAFQ2zIBCxQBgTiFQIgjXRgBhHwnGxuBcoR+gQWBXAIBgUaGX?=
 =?us-ascii?q?gSCDRV6EoFaHo1uAoZzSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoEWIxk2a4EJXYErKWABIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGi4LgRo4PAkmQRUMZgsaBWIIAg0MfzkQHxgNSBEsNxUZBD5uB5Fvg?=
 =?us-ascii?q?wQFAloHAisBKQKCDi+TJweSN6EPCiiDdowilToaM6pvC5h9jgqVaBtNhGmBa?=
 =?us-ascii?q?DyBWXAVgyIJFjQZD44uCwuDYIZAyBonMgIJMgEBBwIHDgMLgWiQACqBVAEB?=
IronPort-Data: A9a23:egSm4KjnkegOlNLtK3sqUORHX161DhEKZh0ujC45NGQN5FlHY01je
 htvC2yOPK2PMGGncowgb4XloEsE7MWAm4BmQQVopShhES1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/jY8E8HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUhx+ZLGGJqr
 McmFygMUz+Pqt2O2e2CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4faGJwPxRjGz
 o7A1zz3DTwRKNHG9TGYqU2U2MTBrXv2QbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJ4Auoz7gfLwa3S7A+dLnMBTzpMLtI83PLaXhQw3
 VOP2tesDjt1vfjNEzSW96yfqnW5Pi19wXI+WBLohDAtu7HLyLzfRDqVJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:cQgIb6E2qpSfLO8YpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:c8wR+GNIg1222O5DYRRnyFcXPpkeTELFzUr/L2KHMX82cejA
X-Talos-MUID: 9a23:Uxh66QYHPAVyTuBT7zHjqTp+OZ5U6Ln1N3hTups248SdDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="538512366"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 02F41180007FC;
	Fri, 23 Oct 2026 09:33:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9E252CBF202; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 2/5] curl: fix CVE-2026-11564
Date: Fri, 23 Oct 2026 02:33:28 -0700
Message-Id: <20261023093331.1886272-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261023093331.1886272-1-dkelaiya@cisco.com>
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248491
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Retain the curl 8.19.0 option-completion API and existing opt-in
automatic client certificate behavior. Reset native CA options per
transfer without adding the newer initial-origin restriction.

[1] https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f6870667607828d5891
[2] https://curl.se/docs/CVE-2026-11564.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Clarify that Schannel selection remains opt-in and disabled by
  default, preserving the existing CURLSSLOPT_AUTO_CLIENT_CERT flag.
- Document the per-transfer native-CA reset and omitted newer
  initial-origin restriction. Schannel redirect behavior has not been
  runtime tested.
---
 .../curl/curl/CVE-2026-11564.patch            | 139 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11564.patch b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
new file mode 100644
index 0000000000..86f0181630
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
@@ -0,0 +1,139 @@
+From d69bfad3fa3daf5e72331f6870667607828d5891 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 8 Jun 2026 10:11:30 +0200
+Subject: [PATCH] ssl native_ca_store: always reinit
+
+Add bit `native_ca_store_opt` to keep the setting of
+CURLOPT_(PROXY_)SSL_OPTIONS and use that to calculate every easy
+transfer if a native CA store shall be used or not.
+
+This avoids `native_ca_store` getting stuck on TRUE after being set
+once.
+
+Closes #21902
+
+CVE: CVE-2026-11564
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f6870667607828d5891]
+
+Backport Changes:
+- Applied the option-completion helper to lib/vtls/vtls.c because curl
+  8.19.0 does not have lib/vtls/vtls_config.c.
+- Kept auto_client_cert derived from CURLSSLOPT_AUTO_CLIENT_CERT, as
+  in the old set_ssl_options(). This preserves the existing Schannel
+  opt-in behavior; automatic selection remains disabled by default.
+- Omitted the initial-origin restriction from the newer origin-aware
+  configuration, introduced by [1].
+  Curl 8.19.0 has no equivalent origin state. This backport resets
+  native CA options per transfer without adding that restriction.
+
+[1] https://github.com/curl/curl/commit/d3391229b0a0eb04f1ffe85f1483a890c5e00009
+
+(cherry picked from commit d69bfad3fa3daf5e72331f6870667607828d5891)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/doh.c       |  3 ++-
+ lib/setopt.c    | 20 ++------------------
+ lib/vtls/vtls.c | 21 +++++++++++++++++++++
+ 3 files changed, 25 insertions(+), 19 deletions(-)
+
+diff --git a/lib/doh.c b/lib/doh.c
+index 4488d42..80da94b 100644
+--- a/lib/doh.c
++++ b/lib/doh.c
+@@ -397,7 +397,8 @@ static CURLcode doh_probe_run(struct Curl_easy *data,
+   }
+ 
+   (void)curl_easy_setopt(doh, CURLOPT_SSL_OPTIONS,
+-                         (long)data->set.ssl.primary.ssl_options);
++                         ((long)data->set.ssl.primary.ssl_options &
++                           ~CURLSSLOPT_AUTO_CLIENT_CERT));
+ 
+   doh->state.internal = TRUE;
+   doh->master_mid = data->mid; /* master transfer of this one */
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 7e6960c..3603912 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -407,22 +407,6 @@ static CURLcode setopt_RTSP_REQUEST(struct Curl_easy *data, long arg)
+ }
+ #endif /* !CURL_DISABLE_RTSP */
+ 
+-#ifdef USE_SSL
+-static void set_ssl_options(struct ssl_config_data *ssl,
+-                            struct ssl_primary_config *config,
+-                            long arg)
+-{
+-  config->ssl_options = (unsigned char)(arg & 0xff);
+-  ssl->enable_beast = !!(arg & CURLSSLOPT_ALLOW_BEAST);
+-  ssl->no_revoke = !!(arg & CURLSSLOPT_NO_REVOKE);
+-  ssl->no_partialchain = !!(arg & CURLSSLOPT_NO_PARTIALCHAIN);
+-  ssl->revoke_best_effort = !!(arg & CURLSSLOPT_REVOKE_BEST_EFFORT);
+-  ssl->native_ca_store = !!(arg & CURLSSLOPT_NATIVE_CA);
+-  ssl->auto_client_cert = !!(arg & CURLSSLOPT_AUTO_CLIENT_CERT);
+-  ssl->earlydata = !!(arg & CURLSSLOPT_EARLYDATA);
+-}
+-#endif
+-
+ static CURLcode setopt_long_bool(struct Curl_easy *data, CURLoption option,
+                                  long arg)
+ {
+@@ -1002,11 +986,11 @@ static CURLcode setopt_long_ssl(struct Curl_easy *data, CURLoption option,
+       s->use_ssl = (unsigned char)arg;
+     break;
+   case CURLOPT_SSL_OPTIONS:
+-    set_ssl_options(&s->ssl, &s->ssl.primary, arg);
++    s->ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     break;
+ #ifndef CURL_DISABLE_PROXY
+   case CURLOPT_PROXY_SSL_OPTIONS:
+-    set_ssl_options(&s->proxy_ssl, &s->proxy_ssl.primary, arg);
++    s->proxy_ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     break;
+ #endif
+   case CURLOPT_SSL_ENABLE_NPN:
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 6dcc67d..35cb4f0 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -306,6 +306,22 @@ static void free_primary_ssl_config(struct ssl_primary_config *sslc)
+ #endif
+ }
+ 
++static void ssl_easy_config_compl_options(struct ssl_config_data *sslc)
++{
++  uint8_t options = sslc->primary.ssl_options;
++  /* If set via CURLOPT_(PROXY_)SSL_OPTIONS, we definitely use it.
++   * If not, we switch it on for supported backends if no custom
++   * ca settings exist. */
++  sslc->native_ca_store = !!(options & CURLSSLOPT_NATIVE_CA);
++  sslc->enable_beast = !!(options & CURLSSLOPT_ALLOW_BEAST);
++  sslc->no_partialchain = !!(options & CURLSSLOPT_NO_PARTIALCHAIN);
++  sslc->no_revoke = !!(options & CURLSSLOPT_NO_REVOKE);
++  sslc->revoke_best_effort = !!(options & CURLSSLOPT_REVOKE_BEST_EFFORT);
++  sslc->earlydata = !!(options & CURLSSLOPT_EARLYDATA);
++
++  sslc->auto_client_cert = !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);
++}
++
+ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+ {
+   struct ssl_config_data *sslc = &data->set.ssl;
+@@ -314,6 +330,8 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   CURLcode result;
+ #endif
+ 
++  ssl_easy_config_compl_options(sslc);
++
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+@@ -360,6 +378,9 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+ 
+ #ifndef CURL_DISABLE_PROXY
+   sslc = &data->set.proxy_ssl;
++  /* no initial origin for proxy, it is not changed for redirects */
++  ssl_easy_config_compl_options(sslc);
++
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index af76f5d53b..322304f47d 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8926-dependent.patch \
            file://CVE-2026-8926_p1.patch \
            file://CVE-2026-8926_p2.patch \
+           file://CVE-2026-11564.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6

