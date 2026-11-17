Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2084.1794939638331999038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Sy3J/9H+;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so39244f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939636; x=1795544436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZNWNJQtCVUaE4ynXCg8ic2tlq37qQOq85ru5ReKxJ8=;
        b=Sy3J/9H+djp7SWQy/RHRqJapoqcqoeP465+P5QXSKIepl9T8j+YD7nkKzHioCMaNR0
         im2+iv80b0d+E2LFjNfKXG0UIZ1irGG43RHUYgkVdtTDSBg6kDv8U8rSh6zREi6NpNO1
         lCj0g/igM1GouEoYbULsPqFnetceIUmuNIlvn+SxYRwnNcXrr0ORJF31Ro4np9EY6M/i
         lizvNERRaVDoXihivTh3Sftdr9XKeuzINOmuJJVFY0pd/dZWkkKmU5XUIqRnowysizA+
         QeF5eC8ZvKkY0TlznpKQgifRVSFHNwUM49+iFbz0M4u0LrH139IPLf0AEK9H6qeXk+zT
         KBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939636; x=1795544436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZNWNJQtCVUaE4ynXCg8ic2tlq37qQOq85ru5ReKxJ8=;
        b=UEfHha3hIeNIJ9MsS+jOwjYDBKHkzQK4XvfaF0BeJdh/AndrGki8AWp7BarL+DS7xs
         pKyv8V/+gLpGddlOtrrDBltfRy1ukL7s9v1PiFbY3QbRt7MOJhd2VNx+1JXor9r3HPFD
         +VrQxWYhIgX70mHZEN9SHxr+sO6eCoaLECgJxr+P6NyVTWYryCd2j8vD1TOOLzIEAQ9p
         RoJZGLCYNQVBou38P9MxJKpyghnV7hMo150287wSg7GexCQ9GYzsqLdHtRA3tBwjvaGv
         L2pE3HAkti56vmERSyH4fnZoz27cB0HRI59Ff8BEArl6UMQPZwVjG7tzzpE2kcPNXNRd
         i58w==
X-Gm-Message-State: APuU4Z/Bx7PSZbmFbUEPdTZx8E8RZjGNFiZCln/tL1LLtkwc9PRpFGIZ
	PJNC/oYjCsk5RwK2HGAp3kjPmWBKMCJZmWQ7F8/fxjIBWAZ0uwseqmy7Tx753jU5syFaBrQfAXB
	C7Mbo3YE=
X-Gm-Gg: AZFdTZfzbs3yoXYZa8p0UsXTF5FsnVAcn1YH8rPNEwSMA+rbzUSGtMtk3Ak8tobPDkK
	4FNSc3WGVT7v9qoAelLWxk02eznL1hkLr8w0HG/V2WBvjA5eoXuKz+Bh7aB853ZLB6i4d9mFEi6
	tHDWw6WTe/53cBJqCCZK4nZkFj7AfJSGsZIOTHY/cYyyRogbifxpmtxXc6YLW6s75T15pGmC4ri
	B7S4k9L1guF9lLzzjtgkqhGFCiVB1Km6f4FBP8fYHLulJPCWirua8eTZlQgLi15nHthdEF4XTBr
	kcVjM8JWsun8pZfdJNYa/URjVK6s5tPJAbnC7hUFqJfiaV1JVyhveVsi92Ubpm8/6zp1NtIX4E7
	4Kvhl0myrPu4mfHq1mSvtG0Bm7CqKqmTpuaBF+uQxh1jYrd3qgUaeGRcJzv0/AYg7QdHTtz0s1d
	2y9RshG3hVoVM6yjJJjh8tBxAe++4TjD8gz/7oqn8OSstXrDMbVZOCA5eh/UUC9+01zJv+32cRy
	Gvld8bi5mAoOvXjAEke3mR0QQP5SIwkLtwbbms2saZqG+3bgKmLNaS/lutEU9m2oJpp3+ebGMlw
	m6pds33wixTu4B1DJrBGXOz9iyMopOLX4jDOj8hPjuJ9m25My0qzWJT8b9R41mBwUy5V/ZCMHO8
	I90zZHb4XLz5Wfk8aPqaLwEE45QjG
X-Received: by 2002:a05:6000:4812:b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-4a63b6fc5d9mr591809f8f.38.1794939636507;
        Tue, 17 Nov 2026 10:20:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/17] curl: fix CVE-2026-82208
Date: Tue, 17 Nov 2026 19:20:06 +0100
Message-ID: <cfba6f9521b1533054cbcba4f7f84e5a79979f30.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250473
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a
[2] https://curl.se/docs/CVE-2026-82208.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-82208.patch            | 54 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-82208.patch b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
new file mode 100644
index 00000000000..1ff3794c176
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
@@ -0,0 +1,54 @@
+From ed0338befd1d865a8ea1fbaa90013a096dedd07a Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 26 Aug 2026 13:46:13 +0200
+Subject: [PATCH] wolfssl: do not run Curl_wssl_setup_x509_store() twice
+
+The flag preventing a rerun was not set when a cached_store
+was used.
+
+CURL_UNCONST an ech string for my old wolfssl version
+
+Closes #22689
+
+CVE: CVE-2026-82208
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a]
+
+Backport Changes:
+- Omitted CURL_UNCONST(b64val) in wolfSSL_SetEchConfigsBase64(). In
+  curl 8.19.0, b64val is already char * from
+  data->set.str[STRING_ECH_CONFIG]; upstream uses const char * from
+  CURL_EASY_STR. The old pointer already matches the wolfSSL argument
+  type, so the ECH call and error handling need no change.
+
+(cherry picked from commit ed0338befd1d865a8ea1fbaa90013a096dedd07a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vtls/wolfssl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index 74bd247..fdf33a8 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -597,9 +597,6 @@ static CURLcode wssl_populate_x509_store(struct Curl_cfilter *cf,
+   bool imported_native_ca = FALSE;
+   bool imported_ca_info_blob = FALSE;
+ 
+-  /* We do not want to do this again, no matter the outcome */
+-  wssl->x509_store_setup = TRUE;
+-
+ #ifndef NO_FILESYSTEM
+   /* load native CA certificates */
+   if(ssl_config->native_ca_store) {
+@@ -802,6 +799,9 @@ CURLcode Curl_wssl_setup_x509_store(struct Curl_cfilter *cf,
+   WOLFSSL_X509_STORE *cached_store;
+   bool cache_criteria_met;
+ 
++  /* We do not want to do this again, no matter the outcome */
++  wssl->x509_store_setup = TRUE;
++
+   /* Consider the X509 store cacheable if it comes exclusively from a CAfile,
+      or no source is provided and we are falling back to wolfSSL's built-in
+      default. */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index c2697d6dd8c..4c0ce6beb35 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80229.patch \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
+           file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            "
 
