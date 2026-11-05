Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30059.1793868228128627338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BOfwAqgE;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so967583f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868226; x=1794473026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1JweqCKJ8jwu2XniS07ecBTDFFPkZ44EarjE5ucR5Pg=;
        b=BOfwAqgECW3kHAsZXfM8dleMmEvQnlu/lXM9vM1Q4BYGsoIIy9vSwIPp+fgCAsrZH6
         eOtEcark6t67R/bkUTF0RgFavTh4MkSTigx1tfIQC/cZvp+WTi60ogyUJDXo/KgIe6Dx
         yjx8bZWVhxS1YDgXeM7Y6RMt/FLFVK2b9bUnPWBbJcTbJT9spGOa6SX8crX47t/GZzCF
         IFZIRp8YvSnZLRgeQiigf5ZBRg6bElTtVDu+Q0CoEORVsxaEprG2p5hEDExJu1TsOWaJ
         R9uUNZNo3uC5XGpod3blk52WKZIr1SCKILTTg+LX8z2Q4mlgXVIh2XNuQ8N0goJeYgjI
         7JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868226; x=1794473026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1JweqCKJ8jwu2XniS07ecBTDFFPkZ44EarjE5ucR5Pg=;
        b=mQnQ7+sLn2t0LQozEXMeUe6VuBqWGo0gAacQVZDAfw8bRI5SIlelXxVXiq9SFCbjYw
         i5xjeV+CcA9E83JnQH9gVJQXleloOWlI3GNx1dA9QSSfa1kjC6mW5QHPhX9mwG74eQcv
         dtAr7l0dCCOXmHm/tDExcfDaXQJWY99gZDcz1GYNAn6MLxI+U8X7tOg/8/GKciCPHhUJ
         /havGlb151fb8vnJEV31LOA+I48LfgIO1WMeGKYjhqPAwSOKROurEp1vgNSkgeUfvQfg
         a4h1Rkf0sh+tBYAB/zyYpIltb2k1JuvFq18OJRFIEpwt2cDk6lBC+cipcLX8XR3eaZ5K
         2wAw==
X-Gm-Message-State: APuU4Z8mRMhk8/hDtt5D9szTvmp0EGkAvxNuAlhNHpS9FwAP/rbwUyrL
	u7/RLA0Z8Cg3TVmyAI4hL5qrAESQlqSU0V8KRQC+AEBT37X8DzXEQ2Nb80PeSgYuqqZ+O8z8CCF
	w+c0ud60=
X-Gm-Gg: AYBFou3+nLMQ+CqT93VsOCvSIeutSAoO9tj7rrUvwXdbFo4fgVzxtNcmfudbKMJfm2V
	kq81MGn26PV1dRb//VkP/PVQk/vGQbK2rHKpn7IoC7JggvmRLKZcIzwwf+/ghnIHjM9SSYiFguI
	C7/eykUiUptE10tIIUheXswS5auR+BluY3bO9Twqx0fqm/MNbNuapjsbBgW/zzM3/p8kSC810UD
	gWWQsLUFWf/b5/amqRtiYitbwEg0quUG/2Z7CuXcxmr4CZQeitQ03CC0jFO8psaxUO94ALpYO1p
	uJSTjodxW8w8Uds5pQE27s+qYxc4QR/qMCG//cdtktYJkohIrnsDKLE+M5TkFvN23HN31YTRLHs
	HlV6iA40ruyDnCLa0/p0d7EnN5zulv4pasDWl52+f+u2OhqJEap16/Th0Yc4QZV44ACgdlA65Rr
	q/AB3AV2IdSUDItECbdbiy4fB6nl7J8J+hzI5xZ8ToMCqzJec3UbK+AF5HGiOGV0KoZi2eGbtHR
	eU4MKGtHMBPdyE7SnpwA2/77Hotf1eMTPyxZhjuo934OOvTSMRt5V/d4mgMSop/WUuSz25TxmFu
	1xN7hI6N9t6Ny1FRF6cRM0PqYyHNaa+zhJuRD0z4VhcyscJx45E5opkW5UnfeuLKQC4kzS+cqjc
	labbCHgIdJl1jeq38z78u0qJjXs6w
X-Received: by 2002:a05:6000:2409:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e6e5044fbmr41031502f8f.55.1793868226181;
        Thu, 05 Nov 2026 00:43:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 16/60] curl: fix CVE-2026-92388
Date: Thu,  5 Nov 2026 09:42:35 +0100
Message-ID: <2ff0d88615866c7f9622b2102e57244b0bcd6416.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249475
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 133 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 00000000000..1996a686c68
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,133 @@
+From 2beb5ec65a71022cc4d29aed72872d44c8dc05e5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 10 ++++++++--
+ lib/ftp-int.h       |  5 -----
+ lib/ftp.c           | 13 -------------
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index 0137975b1e..cceebf8c4e 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -147,8 +147,14 @@ static void cw_get_writefunc(struct Curl_easy *data, cw_out_type otype,
+   switch(otype) {
+   case CW_OUT_BODY:
+   case CW_OUT_BODY_0LEN:
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
+diff --git a/lib/ftp-int.h b/lib/ftp-int.h
+index 8d7e141274..0bf6b9a245 100644
+--- a/lib/ftp-int.h
++++ b/lib/ftp-int.h
+@@ -79,11 +79,6 @@ struct ftp_parselist_data; /* defined later in ftplistparser.c */
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
+ /* This FTP struct is used in the Curl_easy. All FTP data that is
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 70bf654bf9..36cc73397f 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -4017,15 +4017,6 @@ static CURLcode init_wc_data(struct Curl_easy *data,
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
+@@ -4061,10 +4052,6 @@ static CURLcode wc_statemach(struct Curl_easy *data,
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
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 47e3d75d94..2ee5fe3faf 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1012,6 +1012,16 @@ static CURLcode parse_winnt(struct Curl_easy *data,
+   return CURLE_OK;
+ }
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
+index 5d7aa492ba..942e102894 100644
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
+@@ -71,6 +74,8 @@ void Curl_wildcard_dtor(struct WildcardData **wcp);
+ struct Curl_easy;
+ 
+ #else /* CURL_DISABLE_FTP */
++#define Curl_ftp_listmode(x) FALSE
++#define Curl_ftp_parselist ZERO_NULL
+ #define Curl_wildcard_dtor(x)
+ #endif /* !CURL_DISABLE_FTP */
+ 
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
new file mode 100644
index 00000000000..e89658468f8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,31 @@
+From 318019e91cae747d1d5d85be8556466e6943408f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 17 Sep 2026 14:32:52 +0200
+Subject: [PATCH] ftplistparser: only use the list parser in CURLWC_MATCHING
+ state
+
+Follow-up to ba8f8a7f27a5c5e1
+
+Closes #22985
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 2ee5fe3faf..77f90c763d 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1017,7 +1017,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard = data->wildcard;
+-    return wildcard && (wildcard->state <= CURLWC_MATCHING);
++    return wildcard && (wildcard->state == CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.22.0.bb
index 96f889165e0..0d9596b1f37 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -14,6 +14,8 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2026-92388-1.patch \
+    file://CVE-2026-92388-2.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
