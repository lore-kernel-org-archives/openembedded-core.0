Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2085.1794939640046327861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jMfFfdQu;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a42b34e930so48206f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939638; x=1795544438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yy0NnWM81gxL8s6Ctkn6Lw9bX25ELREN1GWyZgmj+5M=;
        b=jMfFfdQu0KDumGPnlhmFuYQbKOPOe5aPLJLrsGmRO9y2OorTY1531RMVgyBqDXdLb6
         IzjvA+QyX2WglD1BycwfBoVVWg3IfXgS/G4mGfBQ+y/dtM8dOVSj1au90xu7mq7oc0L3
         6N8feY4m9SLXd1Wa1RX9FEDJeH4GKgrVBMwhffXw5gACbUNEOspd0AZAFdwyCzMe+Z9+
         //HDMU0rZvHsmT9+6c9LNxW/eQRpquNhfuDAzntrl9+v5EODTiEGwVFzGvcOFSTn86H2
         x5G/E4KQEYNDcyQ7NhLJJK8JjR8Ev82u4+WZj6w2bnYDP++xT1FxaPGNQ2/Sit/AJwG0
         +EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939638; x=1795544438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yy0NnWM81gxL8s6Ctkn6Lw9bX25ELREN1GWyZgmj+5M=;
        b=D6CdixvfCjV/xEoVefVdoVfpSOMRYAN6ZpQSGJtKCUxhSRfIGw6z8VJdKFCVWwH8i3
         5kP4cXu1pKTkVXgB/k505QRxw+tdlBwuVTnondgl7qX6zJptVt9eJGHiD1B89FNbwSHg
         D8rWNKZX4Rdw/We+kfo7adn2KqFYIExenYf2ntlxFsrsYHjuWWz6mbdz20quPs8Xmjcs
         7bw1ohRMe/p8PaabBxxfmH6wDlifR5Ff21xK3bsC8y1iC9Fc3KaTaCSeUH09bTsCuJn2
         sk8gH7edfcd2qnQIqZXL1x1+VbrDmJNeuehGrhZoDv4SI3axqnCyTafZwMjCI5oHCdCX
         tCXA==
X-Gm-Message-State: APuU4Z/d05zE8jb0X98NrF/wLW7FmnISnizIZOzz7ka03bOwf65pEfq/
	ubnyoP9lDJS+LdRrfFf9eO0yluA9gxotzuBDBTlGec8yTuTG2Wy8rNZ5TehLyNEU2xRiLq3HeLS
	elhHsba0=
X-Gm-Gg: AZFdTZcRHPLXHJ4dGmivWQy7kozySOeb5hhH3RDPw4nofUjMpkkkJoXwP7CX+kfJSHG
	6lM0TGbpfNAWHlm7uioJSVEhtgtu7Y5HbaZiM6NjSDgPSGj+O/AtfRup8QG/9UfOs5JW1pXFWYF
	1j2Sl3PRAsv/zAY60y8kVis+Mxm11XBTFOFcnPldYKgCPueoEbdJmQVD7PZAmd7YK4sTh1AqZEk
	CsWKQN3Wa768+G6TnuFjLDO1ag5FB/lTUZY03NmUsDQc5gpZuhiVOcvIn9CB36DuS1sl8L5l2Q7
	cOAhkTwrNzwg+uYIPuHoAPHpEty4g8WuFeC5CuOcqYDz7Ef+fAzmcxRXPZ7mpLnX7s8ubJ+hSW9
	GmJcK5aiqkqgqYACroetKw83n7gCDjYIZ0Y9e7/qd8FCbFCu59mIeGO1bD8aTf4ON67QXjpViKj
	jT3tUptWSKvwXQ7cF7amW5kRhfOc3Qk9gIQoiD2vgV+w5U9CpdPOeWuYghO/WrwMgVfjtJOZbL0
	qu/MiutlxbCecwLdQQCP6ViU/ok233OESLP6ace9wzkjxinSx4ummFJPHdmC13UXrELrtB+Kcev
	JzVV97bPjIEfhFqavWrljbE7fGYrSIQ94HXcP3FSnTVp2OeqUjQB37lGYXAOEvCzglkrQUtKOA/
	WDDzUI8urDntfrW/23owfz1qIa9KW
X-Received: by 2002:a05:6000:4286:b0:498:be72:6371 with SMTP id ffacd0b85a97d-4a63a0eabebmr606380f8f.21.1794939638139;
        Tue, 17 Nov 2026 10:20:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/17] curl: fix CVE-2026-92388
Date: Tue, 17 Nov 2026 19:20:08 +0100
Message-ID: <9badc140b108b12beb13fd672402d477a59f3717.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250475
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92388.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92388

Upstream fix:
  https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212
  https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc9

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-92388-1.patch          | 142 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
new file mode 100644
index 00000000000..607b8c9b936
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
@@ -0,0 +1,142 @@
+From 056e37ce04bd4d599dd014d305963d2194e30026 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+Conflicts Resolved:
+
+lib/ftp-int.h (1 conflict):
+- File does not exist in this branch; struct ftp_wc with its backup
+  member lives in lib/ftp.h instead. Applied the same removal of the
+  backup member to lib/ftp.h.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212b90b35a93559163e]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/cw-out.c        | 10 ++++++++--
+ lib/ftp.c           | 13 -------------
+ lib/ftp.h           |  5 -----
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index 554c32e84e..2500ea8ab3 100644
+--- a/lib/cw-out.c
++++ b/lib/cw-out.c
+@@ -148,8 +148,14 @@ static void cw_get_writefunc(struct Curl_easy *data, cw_out_type otype,
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
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 6047759e78..6b13fb6629 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -3988,15 +3988,6 @@ static CURLcode init_wc_data(struct Curl_easy *data,
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
+@@ -4032,10 +4023,6 @@ static CURLcode wc_statemach(struct Curl_easy *data,
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
+index 20b360033e..b1d3706db2 100644
+--- a/lib/ftp.h
++++ b/lib/ftp.h
+@@ -85,11 +85,6 @@ struct ftp_parselist_data; /* defined later in ftplistparser.c */
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
+index f82895d57a..9c7ad6e9a0 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1010,6 +1010,16 @@ static CURLcode parse_winnt(struct Curl_easy *data,
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
index 00000000000..80381035ff1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
@@ -0,0 +1,31 @@
+From 5f8207e667910351d7d5883910eac80f5b215b12 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc992e77b5f665d4]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 9c7ad6e9a0..91b24251c9 100644
+--- a/lib/ftplistparser.c
++++ b/lib/ftplistparser.c
+@@ -1015,7 +1015,7 @@ bool Curl_ftp_listmode(struct Curl_easy *data)
+ {
+   if(data->state.wildcardmatch) {
+     struct WildcardData * const wildcard = data->wildcard;
+-    return wildcard && (wildcard->state <= CURLWC_MATCHING);
++    return wildcard && (wildcard->state == CURLWC_MATCHING);
+   }
+   return FALSE;
+ }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index b6e05f66e42..744c5ed0ab1 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -41,6 +41,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-92388-1.patch \
+           file://CVE-2026-92388-2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
