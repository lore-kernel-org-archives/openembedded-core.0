Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1473.1795801795230039405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jMVtZzh6;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so76986185e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801793; x=1796406593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5FvWGf/mzupmGYNNj5eZgQIDLSFEBW5ry6io0rIA1mw=;
        b=jMVtZzh6SerVbjjHCJx0mXJL48HV5XmndToU3G1kKWekBzOgRukcYT0FLFh00wIZzx
         m7mUhYcG/mBwbezytQ0RM8vkfKFTzq5LjC472V77lYIVeqaq1uo5ew7vND6yM9bwWCJj
         Vtv7OsUN22/Q3kSGBMiFroVTxUQdovMtEhxVUKzoOU/LZtyWdEy9rEmjyO9iKDN6rIHB
         YFdgtZGkeIj0wrcJYqDiiJ4Rr/MOeqhNWSYimQ5VpCvCvsMtVXdDQ+a9F/ChYzUWo3nH
         9rI9LWLlqOGAMpwVxNL6r+CuWgeGXVkI4I9BmPujaJulLXvK1DSnxFyxJKbiT2P318hU
         CpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801793; x=1796406593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5FvWGf/mzupmGYNNj5eZgQIDLSFEBW5ry6io0rIA1mw=;
        b=N/6HHu3t0ZF8SbM0JBw0SL9BP63qfRLj3t2FGNoDzg6LUSXY2rzkAkQnAr9s4uwZBO
         c9AN7lbeC1Ora06g9P8PpopkWqjF9ZAdDVCot2iWvWQtI3rKB+6F7CF32kNrxHun6eaQ
         Sot1R7+rnUzWNxWpGgvX7BAImcQpJbcAYQAMFMmUEw4N+DEO4b0JLSgOsuzMMMO4QIPb
         A1Bl1xvMeqoLdYL5Kk5YuoCBh8KAUupIfnJPtaEVlQmTjJhdC+SjKGNR68zqVSHaM3qe
         3cS+HTvpe1A2Lpd50Yd1TxJMWvf3wa277eTEpV7/tNlU36Q8JpthxqOl86FCJGZtzh2O
         Puog==
X-Gm-Message-State: APuU4Z+kVipiWhapEL0cqCxcnUt0LNGF2qL5rMh8YZ/cMd0qxGjkYJNC
	IVKFD3SG/UKW66GdIhSu0++td2Zu6xrPtUqtRqb+bbQdeN2SmL9TQoAKHJ3CFeDafghEwKyizNR
	0vdHizTw=
X-Gm-Gg: AZFdTZdtTndrh1WqcoNxDvuyS+ty+xZ02OX0j9eLj14U/oXvRMR3GrWU9MtGIg8G3N7
	tvMQml+2A3uLJRADQ7LcASdZ8lGohbRNsEbMH1pcJDd7j2CRbH9EyMDICzfikq5vHmupVm2SDGk
	8lfOe0oIPxzCPRSScxcdw/CFxEFwhsyC0Twi3xNHRC1u5uF/PH4m9pps0y13/5iNef4pvuh3tC4
	BOvoGP0zNX7jbsJGPo+PA9Uv8ijn3iwbhsmFatcXVuXGoxVsqkjy1kw+xbC1J58wWOOUvJaxxxg
	mp5SMpiQPPiD6TxEe1yJVu7R/fWc0Fy0FjS/QRfctegCpzW2MZ4WRKZ57Yda87aKzqNj/zoBXGb
	OyStDTrSO/xRU3j0s6SRGt8+cEu/4UL0pzHUUhQ7L/wUmPzelfoI8CzOthdT5GHvzW4AOdlk/Um
	eOiB2/2lWj4zmlxpnkzmjVnFzatJlhuBEHHvLczQlzV2flvS1sU7gLQKvCsgjCYNY2kRQ3d5lV6
	utudQXM6JdSM6TrCsK1RFc4LKl86wVKfDAhrMbcy471NoDzDYRhdwcON28Jc8RVHzMQHIJGXctd
	UGOX1dNzRqo/ZIYXjBukmCkZl1ArTfceB2EJVIx2rcIuAdkyRP55F9GzNTVoak+nXfkRbriSBo5
	gic+ovjZ336ztfZLgjGZA6ylJawQq
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr504924265e9.2.1795801793475;
        Fri, 27 Nov 2026 09:49:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/37] curl: Fix CVE-2026-7168
Date: Fri, 27 Nov 2026 18:49:17 +0100
Message-ID: <41003ee97ed715e6609c0c4b124e6c4e51cfe6f8.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251440
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix commit as referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html
[3] https://www.cve.org/CVERecord?id=CVE-2026-7168

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-7168.patch             | 83 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 00000000000..cc12db030f3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,83 @@
+From 2b1d18e42252aa09236666f0469b48a0e1f95080 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Apr 2026 09:14:51 +0200
+Subject: [PATCH] setopt: clear proxy auth properties when switching
+
+Verify with test 1588
+
+Closes #21453
+
+CVE: CVE-2026-7168
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507]
+
+Backport Changes:
+- Place setproxy() beside Curl_setstropt() and call it from the old
+  Curl_vsetopt CURLOPT_PROXY case; 8.7.1 has no setopt_cptr_proxy().
+  Add CURL_DISABLE_PROXY protection because this helper is outside
+  the upstream proxy-only section in the older monolithic file.
+  Keep the upstream Digest-disabled cleanup macro in vauth/vauth.h.
+- Omit tests/data/{Makefile.am,test1588} and
+  tests/libtest/{Makefile.inc,lib1588.c}.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/setopt.c      | 18 ++++++++++++++++--
+ lib/vauth/vauth.h |  2 ++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 8a5a5d7..7eaf309 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -51,6 +51,7 @@
+ #include "altsvc.h"
+ #include "hsts.h"
+ #include "tftp.h"
++#include "vauth/vauth.h"
+ #include "strdup.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
+   return CURLE_OK;
+ }
+ 
++#ifndef CURL_DISABLE_PROXY
++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
++{
++  if((data->set.str[STRING_PROXY] && proxy) &&
++     /* there was one set, is this a new one? */
++     !strcmp(data->set.str[STRING_PROXY], proxy))
++    return CURLE_OK; /* same one as before */
++
++  Curl_auth_digest_cleanup(&data->state.proxydigest);
++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
++}
++#endif
++
+ CURLcode Curl_setblobopt(struct curl_blob **blobp,
+                          const struct curl_blob *blob)
+ {
+@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      * Setting it to NULL, means no proxy but allows the environment variables
+      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
+      */
+-    result = Curl_setstropt(&data->set.str[STRING_PROXY],
+-                            va_arg(param, char *));
++    result = setproxy(data, va_arg(param, char *));
+     break;
+ 
+   case CURLOPT_PRE_PROXY:
+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
+index 9da0540..bf5c7a3 100644
+--- a/lib/vauth/vauth.h
++++ b/lib/vauth/vauth.h
+@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+ 
+ /* This is used to clean up the digest specific data */
+ void Curl_auth_digest_cleanup(struct digestdata *digest);
++#else
++#define Curl_auth_digest_cleanup(x)
+ #endif /* !CURL_DISABLE_DIGEST_AUTH */
+ 
+ #ifdef USE_GSASL
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 076c8756f5e..4f6ffbbed50 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-7168.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
