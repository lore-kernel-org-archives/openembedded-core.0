Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3758.1793405773594903771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=k85M54CN;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8900585e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405772; x=1794010572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j7r+AFzZOl0Y5D2cFtRYK6GvQbu22tGxZI0mm+H8kZM=;
        b=k85M54CN5oyVqDkILXHGssbb9PKBeuy7VXORw5SLrOwDwq9db2v9nXPX1HqiiccQ4n
         L+EauO5A92RFKDhTQ5nHUU6FbI1TVP2ZA5ic6uQBmAgzHy0G/sYRFEOP9JMuaosSIftO
         lus4Q+h5OlqqmRI13cKnOW7Bt0/QWxQrO5RGdxDbQDd4dX92j3GCHGlbBV39oxvrq4+f
         mojGN6OziV+EPO8ljUGK9zj4grGx6ACM9nytTyhG4e4oibWC926fNyu0QM7P52xKmmve
         pJfLOwyahg9wksw1dQuheWRbKpPmZfuGDj9MMXCeVTvQimr6wswLGBaJgkX41phpujb3
         1NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405772; x=1794010572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j7r+AFzZOl0Y5D2cFtRYK6GvQbu22tGxZI0mm+H8kZM=;
        b=GKJkHsFBnSPLEepAQkVALHbK7wqZ9cF5pkWR6mPuqZj1wq9qDFEDEXeTLl+tyZUepg
         dOnBqqwTv+LZR01LRVj0sXjRo9voOghXqzKu7gfbhZWNhj6xLxH+zZ9JmbqfyD01Bjo/
         PpRH+n6Qo+07bE5lpMkNPIIhfAIQuOoMp8W3C3vdMorn3V/4KDFVbt9ykanmuERGOukN
         9uLx0bLVj9/1s8t3j+p1Sx7uak4kTq5SwEaa5290KQUyvu/wXdQhDDk/8LtrWNK3iiy1
         x2brB4eifiX3AC5KF9PDQoaXacULoCrEsV5z4b2o1DQA0SMC6vCIY3PAKNbSyz1YoP//
         STxw==
X-Gm-Message-State: AFq9FYJVbAx0Q+0uKLbTEJGqT3SK+Gs+0eG/CojIGZu6h2PI2HARfTBl
	PFRd8O60FPiYDI+9nzbDATh52QEnQstDZXX4j0NHkcixndQPYBenlIXXwpBvnt1Hbnez2FVSGjA
	X/U2E8Fo=
X-Gm-Gg: AYBFou2kXSJqCfe5B3SmvZOLv02tI8XWegOk4b7kLBUNyzBaUyXXk03xowVInc8/1BV
	6i3Nq+M5bh2wFzGfaLCyyr5nTloIb9yyYPwYXh0P7CjiZy+1jt2+H5Vm90vClA4e9IA3sEAzQYI
	wpkicEj2uY/NZ46ruyS7dAj0MJiBMFCcEpWaq5Vb8lIiDnhoQPSYqzv4B4Ap4WgQeOFd5cpAvNz
	L3sNJu+XOhAMuI2mOsMbC9ylcKn7+odcXmNoksrd69s0RBYVExhQ3EPpupzAao68x+G2EBmf0zM
	/xpk2xiTq8DodCa6R0otsgMTHEQqx1sbOGyuTVyLkabiPODtlkilQSnn3o7IMG2Rjj1kFQKcAfO
	TEVF+8jy75WGFCUf5Fmmp1G+qdgOw0IiSFr9l2Bp6GddA0PwV9qX36LxM6n4IlrKylYYJNeFPKZ
	vYTL4u5HSCIrQ0wYV5EuHitJ06hZJ0/vzVcbLCSsj8yLnf6RvTdv+4EMnlfi6XCM/aMTf4G99Ya
	YP+Khtf7tl9/ktVxWGHjcPN7yE4/ck0/4MNEVWK8VzAgy/QvhhHZgtOPUm7fN94WNF0gGQ8bbF0
	HvBl/dtlgJqpiNkXkz12tsyj6BaBrb6awbaOu8jcFvP7IFNOrlntcaD4HfquOJ+eQtRaWlL1ucw
	Yhp1WCf9zkIxE9yahBzfqdxXjiF/8J+llKc1cm/bkfs82/eTJew==
X-Received: by 2002:a05:600c:1d1c:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4ac1709a1f5mr90207975e9.12.1793405771824;
        Fri, 30 Oct 2026 17:16:11 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 47/55] curl: fix CVE-2026-80230
Date: Sat, 31 Oct 2026 01:15:08 +0100
Message-ID: <40da5f7e3f6ce9fb75cb040e8a9e10be3ee623cd.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249121
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
[2] https://curl.se/docs/CVE-2026-80230.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: This commit reformatted SRC_URI to match devtool code generation
and avoid a manual step ]
---
 .../curl/curl/CVE-2026-80230.patch            | 63 +++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       | 70 +++++++++----------
 2 files changed, 98 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
new file mode 100644
index 00000000000..0473c0922de
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
@@ -0,0 +1,63 @@
+From c14852aaf58042b71f98cf5aebea8d7821f6e5e1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Aug 2026 23:37:49 +0200
+Subject: [PATCH] openssl: no server cert is only okay if also not pinned
+
+Reported-by: Stanislav Fort
+Closes #22660
+
+CVE: CVE-2026-80230
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5267ed859d545534d0c21]
+
+Note: logic lives in servercert() in 8.7.1, not in ossl_check_pinned_key
+Macro CURL_EASY_STR is not available in 8.7.1 used direct data struct
+strict is set based on verifypeer and verifyhost by calling function
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/vtls/openssl.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 3e130c5..481528b 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4202,6 +4202,18 @@ static void infof_certstack(struct Curl_easy *data, const SSL *ssl)
+ #define infof_certstack(data, ssl)
+ #endif
+ 
++static const char *pinned(struct Curl_cfilter *cf,
++                          struct Curl_easy *data)
++{
++  (void)cf;
++  return
++#ifndef CURL_DISABLE_PROXY
++    Curl_ssl_cf_is_proxy(cf) ?
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
++#endif
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++}
++
+ /*
+  * Get the server cert, verify it and show it, etc., only call failf() if the
+  * 'strict' argument is TRUE as otherwise all this is for informational
+@@ -4248,7 +4260,7 @@ static CURLcode servercert(struct Curl_cfilter *cf,
+   backend->server_cert = SSL_get1_peer_certificate(backend->handle);
+   if(!backend->server_cert) {
+     BIO_free(mem);
+-    if(!strict)
++    if(!strict && !pinned(cf, data))
+       return CURLE_OK;
+ 
+     failf(data, "SSL: couldn't get peer certificate");
+@@ -4424,9 +4436,7 @@ static CURLcode servercert(struct Curl_cfilter *cf,
+     /* when not strict, we don't bother about the verify cert problems */
+     result = CURLE_OK;
+ 
+-  ptr = Curl_ssl_cf_is_proxy(cf)?
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++  ptr = pinned(cf, data);
+   if(!result && ptr) {
+     result = ossl_pkp_pin_peer_pubkey(data, backend->server_cert, ptr);
+     if(result)
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e361e6d6b13..ab33d4aa778 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -9,41 +9,41 @@ SECTION = "console/network"
 LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eed2e5088e1ac619c9a1c747da291d75"
 
-SRC_URI = " \
-    https://curl.se/download/${BP}.tar.xz \
-    file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
-    file://run-ptest \
-    file://disable-tests \
-    file://no-test-timeout.patch \
-    file://CVE-2024-6197.patch \
-    file://CVE-2024-7264-1.patch \
-    file://CVE-2024-7264-2.patch \
-    file://CVE-2024-8096.patch \
-    file://CVE-2024-9681.patch \
-    file://CVE-2024-11053-0001.patch \
-    file://CVE-2024-11053-0002.patch \
-    file://CVE-2024-11053-0003.patch \
-    file://CVE-2025-0167.patch \
-    file://CVE-2025-9086.patch \
-    file://CVE-2025-10148.patch \
-    file://CVE-2025-14017.patch \
-    file://CVE-2025-14524.patch \
-    file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
-    file://CVE-2025-14819.patch \
-    file://CVE-2025-15079.patch \
-    file://CVE-2025-15224.patch \
-    file://CVE-2026-1965-1.patch \
-    file://CVE-2026-1965-2.patch \
-    file://CVE-2026-3783.patch \
-    file://CVE-2026-3784.patch \
-    file://CVE-2026-5773.patch \
-    file://CVE-2026-6276.patch \
-    file://CVE-2026-5545.patch \
-    file://CVE-2026-6253.patch \
-    file://CVE-2026-4873.patch \
-    file://CVE-2026-13608.patch \
-    file://CVE-2026-8286.patch \
-"
+SRC_URI = "https://curl.se/download/${BP}.tar.xz \
+           file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
+           file://run-ptest \
+           file://disable-tests \
+           file://no-test-timeout.patch \
+           file://CVE-2024-6197.patch \
+           file://CVE-2024-7264-1.patch \
+           file://CVE-2024-7264-2.patch \
+           file://CVE-2024-8096.patch \
+           file://CVE-2024-9681.patch \
+           file://CVE-2024-11053-0001.patch \
+           file://CVE-2024-11053-0002.patch \
+           file://CVE-2024-11053-0003.patch \
+           file://CVE-2025-0167.patch \
+           file://CVE-2025-9086.patch \
+           file://CVE-2025-10148.patch \
+           file://CVE-2025-14017.patch \
+           file://CVE-2025-14524.patch \
+           file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
+           file://CVE-2025-14819.patch \
+           file://CVE-2025-15079.patch \
+           file://CVE-2025-15224.patch \
+           file://CVE-2026-1965-1.patch \
+           file://CVE-2026-1965-2.patch \
+           file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
+           file://CVE-2026-5773.patch \
+           file://CVE-2026-6276.patch \
+           file://CVE-2026-5545.patch \
+           file://CVE-2026-6253.patch \
+           file://CVE-2026-4873.patch \
+           file://CVE-2026-13608.patch \
+           file://CVE-2026-8286.patch \
+           file://CVE-2026-80230.patch \
+           "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
