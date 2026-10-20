Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4769.1792538581742692207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=EzhTSK7l;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so59723f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538580; x=1793143380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YTNMfOvAFZf+EyCru/OsgvG726OeP1ZVXtatr+BAV/4=;
        b=EzhTSK7lidORq5sByKFt7DPfgd1LeHfYr3+w2MEBixAMx3wYUmFD6NOMZClZDsbgzB
         yLQbRAOapmt3dsjcI/3e1pccSdOgiRHX3G1F9c1olFPG38QKd3yPr4CdBfLkeFkRbayv
         p69ufADhT1H5QOF9KVc0t9WMvWq6ZgiPT24ftGpjC93Mecn/I6ly0shxhSQEPCAKt4SH
         rH/8PHMMP+yEUZJMpbhV27r5GvCbqr27klh3MnpaEYgwrHFvwyrGk7BXZckzje3iFOjy
         VUtWK9n4DdEGKKt+olAWeG7GwQFHh3zlWEYZovnEeTx6gFT0JD/+yLZYdzPFnWLwrDsm
         FzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538580; x=1793143380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YTNMfOvAFZf+EyCru/OsgvG726OeP1ZVXtatr+BAV/4=;
        b=m6aRXcbqdWzodXBPTW7j9i937ipwv02G+MTkvErewP2XjhsyTmAC+2g1GW7fps7SUr
         pB59T0h8fLZS6Kd/UXECH5j9ZGRFsyo/g6RXGIRwmvUfZ7uKkRbwUpYOkCHZ6+hsZhtY
         Dal5ZCC6l8iFd27w1nAsDUhdMqPE+tEI2xyHbhdGkna02o6JV8Wr0M/uo/tUWI33EI1c
         jGK21yxJStaXXBkyP5yIBl6DtabGy9c4pQuxLXrRhBj9AMCGXgnG2WgvPmDJ1gj/L0fN
         uVOesbZJt1ZQjWzgNsZiQDAavib/eo33ekgkk1VMzDxKxwwvm5nR/aI2m9UvRoPhiDrY
         TvEA==
X-Gm-Message-State: AFq9FYIhiJuRkphErl+oxQtYFPbPQ/VKAS1ymUtpTptzpdKDvTp4O4OY
	TihNjTYPUQWCSKnA5BsiOeQ9oe19Dgpi13RzwLBA5pnkZbfBBosIyiKLClwwTt+Gz4vITJZ8VRk
	9/5V/kC8=
X-Gm-Gg: AYBFou20zF/vYua4O8/6YzBbsea1s6PaNuYfRuLPEE7A4v0/qfnfbCw+aOI4RwdiGin
	RcIYLoHO4GuQAisLb+yqwY4+cLRJFhwfX7HB4rKhMsGzqbEIwJZCMZwrKRt0CvZzKvCXu/QmdHP
	iYShSgcszQ2SXMOLmg3vQlThavA2irwmo/y1vb6aNd89OLZbDWFxZVgqwQJfWNM8xf/GZe2CvS4
	pkir54pxhzS9rQQ+ENcAs+992YQf7PGM1hVSfy+K27jz6B5a5G6+99HfHOcCgsbCWocNEA/6k3L
	wREWBd6wDqAluAgmVKhrPo7Zjj4V2KC7FSYfJ2hifZA5XIbn2ELHgycBMTnlhWdyeHjXa5Vdxaf
	I7+x4D0ZQCSiGcZ5qvSCKRctBchh2cv1UQpJXo2I1MrVaopqFRIiwmLLK5dNuAI2Dk/rlbtwnjT
	zFf0Z65MiLzfIMz8KauHE/p3tV6WFgEU3HJEWFXQDjkFAgxBBllK3hQtmMaswU7vlHPtgGxhxIJ
	t9mr6+qoZiJ8w093/kr1Z5npFQsanl09YomOjzSZjZ3Y4S086FPAY8zVj5XdfFVP1Gv5MAofA==
X-Received: by 2002:a5d:4573:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e264ab28amr288024f8f.17.1792538579825;
        Tue, 20 Oct 2026 16:22:59 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/25] curl: fix CVE-2026-80230
Date: Wed, 21 Oct 2026 01:22:24 +0200
Message-ID: <ae119e5dfcfe29b4e014f63b01b3ebc37d299392.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248333
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
[2] https://curl.se/docs/CVE-2026-80230.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-80230.patch            | 68 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      | 62 ++++++++---------
 2 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
new file mode 100644
index 00000000000..5a6bb359861
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
@@ -0,0 +1,68 @@
+From 7d34e6397166b10600c2ced93f95641d5e7c1575 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Aug 2026 23:37:49 +0200
+Subject: [PATCH] openssl: no server cert is only okay if also not pinned
+
+Reported-by: Stanislav Fort
+Closes #22660
+
+CVE: CVE-2026-80230
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5267ed859d545534d0c21675a2b70af5a3b6e3ef]
+
+Note: CURL_EASY_STR() macro does not exist in 8.19.0, so the pinned()
+accesses data->set.str[] directly instead.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/vtls/openssl.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 1cf357c..cb6fcc4 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4607,21 +4607,24 @@ out:
+   return result;
+ }
+ 
+-static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
+-                                      struct Curl_easy *data,
+-                                      X509 *server_cert)
++static const char *pinned(struct Curl_cfilter *cf,
++                          struct Curl_easy *data)
+ {
+-  const char *ptr;
+-  CURLcode result = CURLE_OK;
+-
+   (void)cf;
++  return
+ #ifndef CURL_DISABLE_PROXY
+-  ptr = Curl_ssl_cf_is_proxy(cf) ?
++    Curl_ssl_cf_is_proxy(cf) ?
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
+-#else
+-  ptr = data->set.str[STRING_SSL_PINNEDPUBLICKEY];
+ #endif
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++}
++
++static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
++                                      struct Curl_easy *data,
++                                      X509 *server_cert)
++{
++  CURLcode result = CURLE_OK;
++  const char *ptr = pinned(cf, data);
+   if(ptr) {
+     result = ossl_pkp_pin_peer_pubkey(data, server_cert, ptr);
+     if(result)
+@@ -4803,7 +4806,8 @@ CURLcode Curl_ossl_check_peer_cert(struct Curl_cfilter *cf,
+   server_cert = SSL_get1_peer_certificate(octx->ssl);
+   if(!server_cert) {
+     /* no verification at all, this maybe acceptable */
+-    if(!(conn_config->verifypeer || conn_config->verifyhost))
++    if(!(conn_config->verifypeer || conn_config->verifyhost) &&
++       !pinned(cf, data))
+       goto out;
+ 
+     failf(data, "SSL: could not get peer certificate");
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 0573e08ea4a..c2697d6dd8c 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -9,37 +9,37 @@ SECTION = "console/network"
 LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0515352b285b9c3f66464b135c9c0fdc"
 
-SRC_URI = " \
-    https://curl.se/download/${BP}.tar.xz \
-    file://run-ptest \
-    file://disable-tests \
-    file://no-test-timeout.patch \
-    file://CVE-2026-6276.patch \
-    file://CVE-2026-5773.patch \
-    file://mbedtls.patch \
-    file://CVE-2026-5545.patch \
-    file://CVE-2026-6253.patch \
-    file://CVE-2026-6429-dependent.patch \
-    file://CVE-2026-6429.patch \
-    file://CVE-2026-7168.patch \
-    file://CVE-2026-4873.patch \
-    file://CVE-2026-8286.patch \
-    file://CVE-2026-8927.patch \
-    file://CVE-2026-8932-dependent.patch \
-    file://CVE-2026-8932.patch \
-    file://CVE-2026-11352.patch \
-    file://CVE-2026-11586.patch \
-    file://CVE-2026-7009.patch \
-    file://CVE-2026-8925.patch \
-    file://CVE-2026-9080.patch \
-    file://CVE-2026-9545-01.patch \
-    file://CVE-2026-9545-02.patch \
-    file://CVE-2026-9079.patch \
-    file://CVE-2026-13608.patch \
-    file://CVE-2026-80229.patch \
-    file://CVE-2026-9546-01.patch \
-    file://CVE-2026-9546-02.patch \
-"
+SRC_URI = "https://curl.se/download/${BP}.tar.xz \
+           file://run-ptest \
+           file://disable-tests \
+           file://no-test-timeout.patch \
+           file://CVE-2026-6276.patch \
+           file://CVE-2026-5773.patch \
+           file://mbedtls.patch \
+           file://CVE-2026-5545.patch \
+           file://CVE-2026-6253.patch \
+           file://CVE-2026-6429-dependent.patch \
+           file://CVE-2026-6429.patch \
+           file://CVE-2026-7168.patch \
+           file://CVE-2026-4873.patch \
+           file://CVE-2026-8286.patch \
+           file://CVE-2026-8927.patch \
+           file://CVE-2026-8932-dependent.patch \
+           file://CVE-2026-8932.patch \
+           file://CVE-2026-11352.patch \
+           file://CVE-2026-11586.patch \
+           file://CVE-2026-7009.patch \
+           file://CVE-2026-8925.patch \
+           file://CVE-2026-9080.patch \
+           file://CVE-2026-9545-01.patch \
+           file://CVE-2026-9545-02.patch \
+           file://CVE-2026-9079.patch \
+           file://CVE-2026-13608.patch \
+           file://CVE-2026-80229.patch \
+           file://CVE-2026-9546-01.patch \
+           file://CVE-2026-9546-02.patch \
+           file://CVE-2026-80230.patch \
+           "
 
 SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
