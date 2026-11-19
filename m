Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100.1795101868904027052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=U2VVeaox;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso24267405e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101867; x=1795706667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/bb6krPYmLingPUl09JNXUGAhBNj6D+YFIPi7dCoEuY=;
        b=U2VVeaoxc3LKSgfzk8gzDCitQHnr37e2bXe0jEicQxiIuOob+Ja8QWCz1rQGP4wA+V
         TAnBQbMVSiT8L4XvdEHNh5t9TKp+G+90TboQC9AMypbz6R5dOhoqpsasBeonYcBNqmFW
         CHXzYZ5PPrT3J2xhdgfqA6otmkVgG2Nr0uwOO2mRRIeSJXspieBAznmnpoMejLyDHUL2
         6PQ7DRMnkVmTiiaedGHUGON8wzLK0jV7f7/32/kHerIssKbmPf0dtWYBPDkR9x7UqI5T
         WF5be/5ul/5ZBIMn0emC25y7P4Y5hQC70Q1kt0bPdw+CyGXtJUVViddYGk/0DVRWbYu/
         lIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101867; x=1795706667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/bb6krPYmLingPUl09JNXUGAhBNj6D+YFIPi7dCoEuY=;
        b=zAYO0xbX1XKzB6PhKvBIZTEJuynHCamFN0JzoIPxvXNN5iJGSysVPybs4nQ/cwtgDE
         yU/Ni42T852jS7ir25/y9hri1Bg53meQPtauKvlLWvqnnK55sc1O9CihUkMoBWZnH0vJ
         6iSLI8F+i68BX1/atwEvnHnLHTY48N/2BT9Vou+Mb00r4VbgR/Co0Yuynd88mz3Gm366
         NvbjJ00vtVh9Wl2MQeiQ8PlGXQhHLOLLpaNQoCaA5AD24jWfpYkGMGAWM3ONNEUMEnVK
         ZnP1czmec8VNNuBvwYhJcdwr2WhnFQpWnOMZHjVlSOONJc6Ju8/AleD9ZMV9+H/fqVVS
         L9PQ==
X-Gm-Message-State: APuU4Z/dxJ39AVpO4CBkIfYgf9rxu3iXm7Xw1VuzqqeaSjMn67m0D/7s
	0MVeRCI1sprW7+7xXwRAeprI7J6pUWLYlOK/kuN8dbbDK3xXnX7CwsE3MVhdu3RXJSsNh6i6Egx
	9I17NY2A=
X-Gm-Gg: AYBFou0sy9VFi8t6xqu0LmHSCyg46ZsRGJME9EiUo+FjNPEjZjjQ2Rj1pwObq3qRPAN
	hDKgZElxn/s7LodjYPAI7Pz/YTz8A7zKRt/3FkRoLJ1WSYm86yj/E88XNtcb3FlRPdUJt4Ig0dQ
	lVr6+3XVX/sD71dMqQekuiPYdqiu1dLNrpLOCIW1x2FMcwIuY1Vpd+DpzC70H3O8avB/wwTzJmr
	idreP9XB/jhfFaT0IngjqcsAAKQXvek6Wu00KaU2WXAFfMT5ctaBDRYBG5GG96vJUU41xQr9kk+
	M7XQYUl9zA41veqBsNpJt8Pqf8tBU8J8lmHkKDhkWsI2ZYCSz0VR/cLWtAnIXZSkUaMQNvEANsu
	NrHqSCyj+FIzZolPMK35HtG/QcOaD2KIXCbIcMB31SzqsC/abo/GaSQJCKLMs+pWBPBp+yVZm9/
	r5ATKOuGMfyclo+upN3/tM9ulRW/P9Mctejoupio0l4qKte0Dd2XOB4/gGr5CMeulra8ZvCzjnd
	bALdX3VvAOXR9CU4REUdGvQIYpuYhSc4fZm68hgpKFRP4I18/5Lqk1BvZOTH16vLJq3wJXSWVn1
	W5O2YsclxgmpGrkHFnFZEBDtb0AH4rbi79+DETCqgLE2pZJ8pSZ7KgezaoMIqWYlbYu/N8TivaD
	r3uU49C+mxm7sRLZsLSwBmRHtlcJF6m6otjd6kdiOb5L4BZzZ8mAf7z1yJKVbZdFrEyTffnVWfD
	3Y7A==
X-Received: by 2002:a05:600c:4e0d:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb7da48c41mr127479735e9.32.1795101867072;
        Thu, 19 Nov 2026 07:24:27 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:26 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/19] curl: fix CVE-2026-18924
Date: Thu, 19 Nov 2026 16:22:38 +0100
Message-ID: <1713ce755fd5ce54bd2fa02275b08c34c65dcd69.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250695
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Make accepted HTTP/2 push handles inherit their parent's share object.
Use the curl 8.7.1 share setter to retain its locking, reference
counting and shared-cache handling during cleanup.

Retain curl_easy_duphandle() instead of the later creation change in
[3]. In 8.7.1, duplication leaves the share and connection-cache
pointers NULL. The share setter increments its use count before the
push callback and multi addition; cleanup releases it. Share cleanup
is blocked while this reference remains. Keep the documented
inheritance of parent options.

[1] https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43
[2] https://curl.se/docs/CVE-2026-18924.html
[3] https://github.com/curl/curl/commit/fad90b666df98c93ee165341b0c8101c7b10ad7b

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 .../curl/curl/CVE-2026-18924.patch            | 56 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 0000000000..cf8a3a6290
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,56 @@
+From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 5 Aug 2026 10:02:53 +0200
+Subject: [PATCH] http2: make server push transfers inherit share from
+ parent
+
+Reported-by: Stephan Zeisberg
+Closes #22488
+
+CVE: CVE-2026-18924
+Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43]
+
+Backport Changes:
+- Use share.h because curl 8.7.1 does not have curl_share.h.
+- Use curl_easy_setopt(second, CURLOPT_SHARE, data->share)
+  instead of Curl_share_easy_link(), which is absent from curl 8.7.1.
+  The setter locks the share, updates its dirty counter and links
+  shared caches.
+- Retain curl_easy_duphandle() instead of the later curl_easy_init()
+  change in [1], preserving curl 8.7.1's documented push-option
+  inheritance. In 8.7.1, duplication leaves share and state.conn_cache
+  NULL. The share setter increments share->dirty before the push
+  callback and Curl_multi_add_perform(). Curl_close() drops the use
+  count on rejection or cleanup; curl_share_cleanup() refuses to free
+  a share still in use. The share lifetime fix therefore does not
+  require the later handle-creation change.
+
+[1] https://github.com/curl/curl/commit/fad90b666df98c93ee165341b0c8101c7b10ad7b
+
+(cherry picked from commit 90325ff0444cbdff368bda5d26d6405a0bb6ee43)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/http2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/http2.c b/lib/http2.c
+index 99d7f3b0e2..694900fd8c 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -47,6 +47,7 @@
+ #include "transfer.h"
+ #include "dynbuf.h"
+ #include "headers.h"
++#include "share.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+ #include "curl_memory.h"
+@@ -776,6 +777,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+       second->req.p.http = http;
+       http2_data_setup(cf, second, &second_stream);
+       second->state.priority.weight = data->state.priority.weight;
++      if(data->share)
++        (void)curl_easy_setopt(second, CURLOPT_SHARE, data->share);
+     }
+   }
+   return second;
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 4be96a6f7f..ab784b4d73 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8286.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-92389.patch \
+           file://CVE-2026-18924.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
