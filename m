Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D4FD2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5028.1768910964158872047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QhdgZoJE;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so22678155e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910962; x=1769515762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dEivvJdmmb4GPJmrS9ji49n+J5tTO6Vr2WNn9p3IA4=;
        b=QhdgZoJED1nEyJXNGo/sE1fPdtmSS6TCxpIoHL96MvGXEweRlyC+QElYOwsF1U14L6
         rSEdBXCXn/okn3ikVcwCCckgjr4o4vkInWpfsf+NRSZBqcMOA9xX5dqnSOOlApTQT1bF
         c1Y566JGx14C0Bj9/iIu7Pj0qCKYEvuB96pYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910962; x=1769515762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dEivvJdmmb4GPJmrS9ji49n+J5tTO6Vr2WNn9p3IA4=;
        b=gnmWzCI9Z/Kp/SSep6ZzMmGYLY4srMLfJ/GmUZzKQ5So5CY+udpPUIQuIw4EdhFxWx
         TUiMuz2qpqepCxfCvZJBLu5t9tLaJFo2g0A8iuSfb0BcE7Rz1M9+DgyWyewzfB5Ju/Fx
         Z1PxQnMM/D3HjSP4S9nSMRxwHB+IKBKBJShRAfNkXvf2n18rS3SgPa8b5jeaXPIQs8Oh
         LJWmhQKVTg36BDepCUjhvOpLvQC7aeWdqRaisViLSKFI2oU0LFz+PTQMu4b46Rf05Osn
         SA81aeNkve2w6oJEB8CWty5jcebe0hEkRM82GeaWbNISEvyuRCWqFFS1eyswuYepXTk8
         /XuA==
X-Gm-Message-State: AOJu0YxsBb7u7d1zuK0p96DddsVxPvsSoGI8s/TUEL3gZLHTaDqh4d7K
	OgjF6Hk6CED9fZWrcUd/BvHrjvNrP14sGELIaHlbzE9EuLxLtkQvJLwAUChOMeKX2J9rY3tJTU3
	nWO5G
X-Gm-Gg: AY/fxX7jrYnvaNP1UbFj6yQdFGUY44Y9INqTLGHam9BJMXmLzFBPpYuSwESaGLCnPHg
	JMcIzXpfpp4lPaxqSn7BP33rYq/pWXDxd9pS0UHvVFwiZJzNJN8StoomALS/sQKCxE9d49UU5UN
	6V/OiAxMJpJKoIdpVHOSbJVK5XPamSXq9DrQerBU9XVZtO1Z4NA2ocdLwZGwrbH9sNx2D26BZZU
	pC7OjqMur5POrOVHIpTOjt9jUviRVrC7Jbfl47+qxuP5KnKyb9PW8ytZlmombPrEQNUfyO6+yD2
	8BU/FXiXvYyA92qEEZh+5apLNL1fMFH3+ePK/mt1Q8eCD4oVWt7FiVczouXkHmoFI1gdORMObu3
	PZ3pBXjcFmoYRkZ2J31ggaPNGNKyfQ+V5pyB5tGg5BBiRWanhsGuSyKP+SktIDXUPOPUhWzuZke
	XsBZBwlgCKAbZecaNRGbk8ZYrYOu32z8nQrZC01FybhLyPWXmov3xpf6Px4VDMO6tI80ao79JAr
	cxjXfsi5nXP6ip0jvLEOg==
X-Received: by 2002:a05:600c:37c8:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-4801eb09213mr183765475e9.21.1768910962241;
        Tue, 20 Jan 2026 04:09:22 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/22] curl: patch CVE-2025-14819
Date: Tue, 20 Jan 2026 13:08:28 +0100
Message-ID: <253501667b88fbd48a52e9f4616c246e9e030ade.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229692

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

Additionally pick commit with definition of CURL_UNCONST to make the
cherry-pick possible without build errors.
It will be probably needed also by further CVE patches.

[1] https://curl.se/docs/CVE-2025-14819.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...st-qual-fix-or-silence-compiler-warn.patch | 85 +++++++++++++++++++
 .../curl/curl/CVE-2025-14819.patch            | 73 ++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  2 +
 3 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch

diff --git a/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch b/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
new file mode 100644
index 0000000000..f652456990
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
@@ -0,0 +1,85 @@
+From 9989d5392e9e61c81fdd3e464511ddd8d73c2f87 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 31 Jan 2025 23:20:46 +0100
+Subject: [PATCH] build: enable `-Wcast-qual`, fix or silence compiler warnings
+
+The issues found fell into these categories, with the applied fixes:
+
+- const was accidentally stripped.
+  Adjust code to not cast or cast with const.
+
+- const/volatile missing from arguments, local variables.
+  Constify arguments or variables, adjust/delete casts. Small code
+  changes in a few places.
+
+- const must be stripped because an API dependency requires it.
+  Strip `const` with `CURL_UNCONST()` macro to silence the warning out
+  of our control. These happen at API boundaries. Sometimes they depend
+  on dependency version, which this patch handles as necessary. Also
+  enable const support for the zlib API, using `ZLIB_CONST`. Supported
+  by zlib 1.2.5.2 and newer.
+
+- const must be stripped because a curl API requires it.
+  Strip `const` with `CURL_UNCONST()` macro to silence the warning out
+  of our immediate control. For example we promise to send a non-const
+  argument to a callback, though the data is const internally.
+
+- other cases where we may avoid const stripping by code changes.
+  Also silenced with `CURL_UNCONST()`.
+
+- there are 3 places where `CURL_UNCONST()` is cast again to const.
+  To silence this type of warning:
+  ```
+  lib/vquic/curl_osslq.c:1015:29: error: to be safe all intermediate
+    pointers in cast from 'unsigned char **' to 'const unsigned char **'
+    must be 'const' qualified [-Werror=cast-qual]
+  lib/cf-socket.c:734:32: error: to be safe all intermediate pointers in
+    cast from 'char **' to 'const char **' must be 'const' qualified
+    [-Werror=cast-qual]
+  ```
+  There may be a better solution, but I couldn't find it.
+
+These cases are handled in separate subcommits, but without further
+markup.
+
+If you see a `-Wcast-qual` warning in curl, we appreciate your report
+about it.
+
+Closes #16142
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9989d5392e9e61c81fdd3e464511ddd8d73c2f87]
+
+Picked only header file definition, not complete code refactoring.
+CURL_UNCONST will be probably needed also by further CVE patches due to this rework.
+
+Also later modified by removing VS2008 code per 2e1a045d8985e5daa4d9a4f908ed870a16d8e41e.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/curl_setup_once.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/lib/curl_setup_once.h b/lib/curl_setup_once.h
+index bf0ee663d3..df5b44c478 100644
+--- a/lib/curl_setup_once.h
++++ b/lib/curl_setup_once.h
+@@ -69,10 +69,18 @@
+ #include <unistd.h>
+ #endif
+ 
+-#ifdef USE_WOLFSSL
++#if defined(HAVE_STDINT_H) || defined(USE_WOLFSSL)
+ #include <stdint.h>
+ #endif
+ 
++/* Macro to strip 'const' without triggering a compiler warning.
++ Use* it for APIs that do not or cannot support the const qualifier. */
++#ifdef HAVE_STDINT_H
++#  define CURL_UNCONST(p) ((void *)(uintptr_t)(const void *)(p))
++#else
++#  define CURL_UNCONST(p) ((void *)(p))  /* Fall back to simple cast */
++#endif
++
+ #ifdef USE_SCHANNEL
+ /* Must set this before <schannel.h> is included directly or indirectly by
+    another Windows header. */
diff --git a/meta/recipes-support/curl/curl/CVE-2025-14819.patch b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
new file mode 100644
index 0000000000..7bed47e7b4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
@@ -0,0 +1,73 @@
+From cd046f6c93b39d673a58c18648d8906e954c4f5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 17 Dec 2025 10:54:16 +0100
+Subject: [PATCH] openssl: toggling CURLSSLOPT_NO_PARTIALCHAIN makes a
+ different CA cache
+
+Reported-by: Stanislav Fort
+
+Closes #20009
+
+CVE: CVE-2025-14819
+Upstream-Status: Backport [https://github.com/curl/curl/commit/cd046f6c93b39d673a58c18648d8906e954c4f5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/openssl.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index a7f169d641..7563d9a090 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -317,6 +317,7 @@ struct multi_ssl_backend_data {
+   char *CAfile;         /* CAfile path used to generate X509 store */
+   X509_STORE *store;    /* cached X509 store or NULL if none */
+   struct curltime time; /* when the cached store was created */
++  BIT(no_partialchain); /* keep partial chain state */
+ };
+ #endif /* HAVE_SSL_X509_STORE_SHARE */
+ 
+@@ -3378,12 +3379,16 @@ static bool cached_x509_store_expired(const struct Curl_easy *data,
+ 
+ static bool cached_x509_store_different(
+   struct Curl_cfilter *cf,
++                                             const struct Curl_easy *data,
+   const struct multi_ssl_backend_data *mb)
+ {
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
++  struct ssl_config_data *ssl_config =
++    Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
++  if(mb->no_partialchain != ssl_config->no_partialchain)
++    return TRUE;
+   if(!mb->CAfile || !conn_config->CAfile)
+     return mb->CAfile != conn_config->CAfile;
+-
+   return strcmp(mb->CAfile, conn_config->CAfile);
+ }
+ 
+@@ -3398,7 +3403,7 @@ static X509_STORE *get_cached_x509_store(struct Curl_cfilter *cf,
+      multi->ssl_backend_data &&
+      multi->ssl_backend_data->store &&
+      !cached_x509_store_expired(data, multi->ssl_backend_data) &&
+-     !cached_x509_store_different(cf, multi->ssl_backend_data)) {
++     !cached_x509_store_different(cf, data, multi->ssl_backend_data)) {
+     store = multi->ssl_backend_data->store;
+   }
+ 
+@@ -3427,6 +3432,8 @@ static void set_cached_x509_store(struct Curl_cfilter *cf,
+ 
+   if(X509_STORE_up_ref(store)) {
+     char *CAfile = NULL;
++    struct ssl_config_data *ssl_config =
++      Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
+ 
+     if(conn_config->CAfile) {
+       CAfile = strdup(conn_config->CAfile);
+@@ -3444,6 +3451,7 @@ static void set_cached_x509_store(struct Curl_cfilter *cf,
+     mbackend->time = Curl_now();
+     mbackend->store = store;
+     mbackend->CAfile = CAfile;
++    mbackend->no_partialchain = ssl_config->no_partialchain;
+   }
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index aa978f0346..3134846e57 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -26,6 +26,8 @@ SRC_URI = " \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
     file://CVE-2025-14017.patch \
+    file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
+    file://CVE-2025-14819.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

