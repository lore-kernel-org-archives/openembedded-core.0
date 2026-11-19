Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104.1795101872778492087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=O3zDZCB/;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20093775e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101871; x=1795706671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCRWo5A6tW+p6PwO8El6qk+1ow0BbbsGOQ3BWM06FZ0=;
        b=O3zDZCB/FSLyxUAwnRV+dLzoSAxWc77Rx+vqAnSRc38NEo7hz8Nnefe+IRS8pOTbtz
         TD9e57c7+Z74HE4M+ELncQF/BaFgv176kHseEi+1T0N7tmqpjE5rHF68f3XyXIgAU2Zr
         PJp20TiRK+E42nJyLO4DvRN3JeTU01kBlGSIzkd49ACnWmBUOYYUWFbpv+TII9q7G1UB
         HyEoQHm/l+fl6BT+SfAwb36jMddtS4YL+/hQp6UlpnXifloqCVhJHbH9Cih8hsI6AdNC
         hLOdu0qxdUnjaCoewAuI/0ebDER6nGMRsu6c7sbteh6XIkwSgCJ6N0WLkHXnqZ62sQOc
         Qs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101871; x=1795706671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DCRWo5A6tW+p6PwO8El6qk+1ow0BbbsGOQ3BWM06FZ0=;
        b=yIWqyF8lwGcWQWmIVT8s7p7vkn7m+EhKXQn+C+W7o5nK1MuRJGvMaj4EWSW/azLdlQ
         ICvuhz+I8xMawWZRbqUl/xmHY80ftDzgLfDWSlldW+6x4De6xB7C/fXlONRvFpIgDGUR
         vKu8oVlrJmwNIzRKU6uDsgbs6aNzGI54LcEdcXJH3RDx/7204+dYYYEidf4AsLs6LKAK
         cZv806UGx6EL6RNfIgwmaGMdl6qbGUzYewYlUfz7EuvwazRWmP2tfsaPY0sioQFzxj5W
         nHno2bCkrJ4ZzABDsA5cO9QXWk3mJFea0N+qRqAc0QQykmhx5waCrxKUx+qUDxGXXfcN
         8JdA==
X-Gm-Message-State: APuU4Z8TETbTNSXkb6PVO8EGrOdBtrL24EGUaZSEqZwAwvHsSwV5z1uq
	vYX1zaiGpXbBrZm7MjkHLuGtfvIQVsCKHfKj8AENAkBSCb1Ha0BxBIAljIgcQfxXUKckrcwGyWV
	HUUVLz9M=
X-Gm-Gg: AYBFou18hNyotOd/IYstigLIwIX/U3ylazgvr79rTJyMGi2Q9kRU0cAGP/5XznH3qJ8
	NAKEHnR3eavucr/9yzh11wLNVGY1q9Rif31Qy/yw0YLeQyDrNTmnYirpVDdX4X3HY599FziCC7r
	Upjk4YIyziKDfqJtfluWdj4Ouab/CU+g6XSZktiFpY/XCx57VGE/wewaHpokJCKtuBmv9M61Nm2
	ibSHhfOpw0Zopih5svBeulImYTh01k5eanb4NESjejwok4r0NSl7gJWJs6vZZaIazVTvsV6okqm
	AXCy67rDVplPvoVyT1GwMyLQ+PSO1a7U7m220ckoFwBOYGsAcHFewaWfJju5OmxSVjqN5r8LgSN
	0naOcM6+8RlGU0sDTSR/ruebLF7qdwRxtbcdgVoJOoWCTA55RL8z9rZpd9OnUa9dWRlAwxplreo
	taWLksmO+KWUQxbtS7txNft2BzmC8FXDs4dLao95YjfnKqK7mtq5WMjQ/SOkzOR3VvS+WcJYemq
	Q8xy++ZOTJPUc4LWhD0jDUVA1kEySU1Lag1rD268vz+GHSnas/YmWPWM4UqZpR97hvGJDTmZEua
	8KO3P6GcFZ6UtEfzswd3Bx/pbtVC7ASSE8Y9ghhJVse6lC4VeNQnloR6z2zxnnl7EJh5JsnVa2X
	7SRCUBeeDCBeXEZnB74rYCNIuFqX2+D8ZMmjmItPE0LDaNATbXDLCZ8U=
X-Received: by 2002:a05:600c:3ba9:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb7da0c1ccmr142659265e9.11.1795101870840;
        Thu, 19 Nov 2026 07:24:30 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:30 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/19] curl: fix CVE-2026-92388
Date: Thu, 19 Nov 2026 16:22:41 +0100
Message-ID: <303aadf5b095db2c485f257fe78a44f48326b72f.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250698
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 151 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  30 ++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 0000000000..1e91ab68f2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,151 @@
+From c6624e91bc9e8726b3cc45692ec0834650719a15 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+Backport notes for curl 8.7.1:
+- lib/cw-out.c: no CW_OUT_BODY_0LEN in 8.7.1; listmode handling applied
+  to CW_OUT_BODY only. Added #include "ftplistparser.h".
+- lib/ftplistparser.c: context conflict only; added Curl_ftp_listmode().
+- lib/ftplistparser.h: added Curl_ftp_listmode()/Curl_ftp_parselist
+  stubs to the existing CURL_DISABLE_FTP #else branch.
+- lib/ftp-int.h: does not exist in 8.7.1 (struct ftp_wc is in lib/ftp.h).
+  The now-unused ftp_wc.backup member is removed from lib/ftp.h instead.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 11 +++++++++--
+ lib/ftp.c           | 13 -------------
+ lib/ftp.h           |  5 -----
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 24 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index c168837817..e1527f475e 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -32,6 +32,7 @@
+ #include "multiif.h"
+ #include "sendf.h"
+ #include "cw-out.h"
++#include "ftplistparser.h"
+ 
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -166,8 +167,14 @@ static void cw_get_writefunc(struct Curl_easy *data, cw_out_type otype,
+ {
+   switch(otype) {
+   case CW_OUT_BODY:
+-    *pwcb = data->set.fwrite_func;
+-    *pwcb_data = data->set.out;
++    if(Curl_ftp_listmode(data)) {
++      *pwcb = Curl_ftp_parselist;
++      *pwcb_data = data;
++    }
++    else {
++      *pwcb = data->set.fwrite_func;
++      *pwcb_data = data->set.out;
++    }
+     *pmax_write = CURL_MAX_WRITE_SIZE;
+     /* if we ever want buffering of BODY output, we can set `min_write`
+      * the preferred size. The default should always be to pass data
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 5bbdeb0540..3ab395cee8 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -3949,15 +3949,6 @@ static CURLcode init_wc_data(struct Curl_easy *data)
+     goto fail;
+   }
+ 
+-  /* backup old write_function */
+-  ftpwc->backup.write_function = data->set.fwrite_func;
+-  /* parsing write function */
+-  data->set.fwrite_func = Curl_ftp_parselist;
+-  /* backup old file descriptor */
+-  ftpwc->backup.file_descriptor = data->set.out;
+-  /* let the writefunc callback know the transfer */
+-  data->set.out = data;
+-
+   infof(data, "Wildcard - Parsing started");
+   return CURLE_OK;
+ 
+@@ -3992,10 +3983,6 @@ static CURLcode wc_statemach(struct Curl_easy *data)
+       /* In this state is LIST response successfully parsed, so lets restore
+          previous WRITEFUNCTION callback and WRITEDATA pointer */
+       struct ftp_wc *ftpwc = wildcard->ftpwc;
+-      data->set.fwrite_func = ftpwc->backup.write_function;
+-      data->set.out = ftpwc->backup.file_descriptor;
+-      ftpwc->backup.write_function = ZERO_NULL;
+-      ftpwc->backup.file_descriptor = NULL;
+       wildcard->state = CURLWC_DOWNLOADING;
+ 
+       if(Curl_ftp_parselist_geterror(ftpwc->parser)) {
+diff --git a/lib/ftp.h b/lib/ftp.h
+index 977fc883b1..7e6097af8f 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -87,11 +87,6 @@ struct ftp_parselist_data; /* defined later in ftplistparser.c */
+ 
+ struct ftp_wc {
+   struct ftp_parselist_data *parser;
+-
+-  struct {
+-    curl_write_callback write_function;
+-    FILE *file_descriptor;
+-  } backup;
+ };
+ 
+ typedef enum {
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 82f1ea00d3..eae799ff3b 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -361,6 +361,16 @@ static CURLcode ftp_pl_insert_finfo(struct Curl_easy *data,
+ 
+ #define MAX_FTPLIST_BUFFER 10000 /* arbitrarily set */
+ 
++/* returns TRUE if in wildcard listing mode */
++bool Curl_ftp_listmode(struct Curl_easy *data)
++{
++  if(data->state.wildcardmatch) {
++    struct WildcardData * const wildcard = data->wildcard;
++    return wildcard && (wildcard->state <= CURLWC_MATCHING);
++  }
++  return FALSE;
++}
++
+ size_t Curl_ftp_parselist(char *buffer, size_t size, size_t nmemb,
+                           void *connptr)
+ {
+diff --git a/lib/ftplistparser.h b/lib/ftplistparser.h
+index 5ba1f6a97d..115f916f60 100644
+--- a/lib/ftplistparser.h
++++ b/lib/ftplistparser.h
+@@ -27,6 +27,9 @@
+ 
+ #ifndef CURL_DISABLE_FTP
+ 
++/* returns TRUE if in wildcard listing mode */
++bool Curl_ftp_listmode(struct Curl_easy *data);
++
+ /* WRITEFUNCTION callback for parsing LIST responses */
+ size_t Curl_ftp_parselist(char *buffer, size_t size, size_t nmemb,
+                           void *connptr);
+@@ -72,6 +75,8 @@ struct Curl_easy;
+ 
+ #else
+ /* FTP is disabled */
++#define Curl_ftp_listmode(x) FALSE
++#define Curl_ftp_parselist ZERO_NULL
+ #define Curl_wildcard_dtor(x)
+ #endif /* CURL_DISABLE_FTP */
+ #endif /* HEADER_CURL_FTPLISTPARSER_H */
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
new file mode 100644
index 0000000000..322461d028
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,30 @@
+From 8d0e0470e1eddf23a2d5c8f613e2a6d662a4b977 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 17 Sep 2026 14:32:52 +0200
+Subject: [PATCH] ftplistparser: only use the list parser in CURLWC_MATCHING
+ state
+
+Follow-up to ba8f8a7
+
+Closes #22985
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9]
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index eae799ff3b..daf7f06467 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -366,7 +366,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard = data->wildcard;
+-    return wildcard && (wildcard->state <= CURLWC_MATCHING);
++    return wildcard && (wildcard->state == CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index eade4f8d31..d1df661b1a 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -46,6 +46,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92389.patch \
            file://CVE-2026-18924.patch \
            file://CVE-2026-86409.patch \
+           file://CVE-2026-92388-1.patch \
+           file://CVE-2026-92388-2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
