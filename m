Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1218.1793949576373352610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q1pvAKEd;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8037; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h+wB4xT/R7r7zvzp5eRts5RRoZ/qe+IsO3qX35g93m4=;
  b=Q1pvAKEdB7FXTbwdEFCyAp858k93QXgz35sAMaX5Pdbkgr2PN6nQE48E
   6AL2FtHATEfHwAnZ1aUKrsma0F4vh8yYh138/lO9YxDkDF17e65Z0YjP/
   lMwEmHJb/QoTOwIdgRKIRojNdRjAYZD8Zuvg2D89W7G4zVccItTfZur/V
   hdEmMAqvL2teFSDtao8UDMzZQvKdwLLsqoFlk6obO26+qd+rHPFWlfXAI
   kucIhDgCl9AhMnwww7LQ843RGwhr6fZNrnKseVzEUn8Hbm5Y3BpjydwVX
   dVVJgsCY86/NO5mp9NL/+dM+OtpeckI/roivHk20Ay5+HiJ6pyfORhbuJ
   g==;
X-CSE-ConnectionGUID: jw9TGChTQU2RlPKVRBbizQ==
X-CSE-MsgGUID: vhbyuAC9QkuAD5e/b8voxg==
X-IPAS-Result: =?us-ascii?q?A0BJAgBrfu1q/4v/Ja1aglmCV3VgQ0mWSwOBE50OgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIEAmDAgGCdAMRBrs7GzeBe?=
 =?us-ascii?q?TOBAYMpAT8CAkABUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFYJzdoEFgVwCA?=
 =?us-ascii?q?YEZDYZ/BIIigQyBWh5ljBUCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSPYMLB2EtAQciAoEgXQ4yPZJgBwqSN4E1n1wKKIN4jCSVO?=
 =?us-ascii?q?hozqnELmH2OCpVpaIRpgWg8gVlwFTuCZwkWNBkPji4LC4NghkDGBSYyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:N/eoEKrxCKRn4cvd4sDpMnDHIEBeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCOP6INmagfNxxOY/k/EhUuMeGyNZrG1dupCE9Rn5B9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uRoUF1h3
 vwkEQ1XVBS7pNyM6ri6WNA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHpsFxxrI9
 juuE2LRHBEQJcG24mu88W+FqrLC2imrRoUCG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:oUWRha+1Ab/D69WBJipuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Aq3TOJmpD5CsRMFD4taKEIizmUcI6I0Hy53fsGnL?=
 =?us-ascii?q?iM2JRa4OvY1WR6poxxg=3D=3D?=
X-Talos-MUID: 9a23:HmglGQrBWhxn4zRd2eUezy9iPtZ1yo//MUMQuLlbto6OZTJ3KzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536814881"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id A8569180007DA;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id F2A6CCBF21E; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 5/9] curl: fix CVE-2026-92388
Date: Thu,  5 Nov 2026 23:19:28 -0800
Message-Id: <20261106071932.490299-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249604
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fixes referenced in [3],
using the commits shown in [1] and [2].

Route wildcard directory listings through the internal write path
without replacing the application's WRITEFUNCTION or WRITEDATA.
Previously, ftp_wc.backup saved those options for restoration after
LIST. Failed listings could skip that restoration and leave internal
parser state in the application settings.

The writer now selects the listing parser and easy handle directly
without changing application options. This removes the need to save
and restore callbacks, so remove the backup fields and that code, as
upstream does. Apply the field removal in curl 8.19.0's lib/ftp.h.
Keep the matching-state correction in a separate patch.

[1] https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212b90b35a93559163e
[2] https://github.com/curl/curl/commit/b85acacec9b38442741bb019bc992e77b5f665d4
[3] https://curl.se/docs/CVE-2026-92388.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92388_p1.patch         | 139 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388_p2.patch         |  33 +++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-92388_p1.patch
new file mode 100644
index 0000000000..92752eb21e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388_p1.patch
@@ -0,0 +1,139 @@
+From ba8f8a7f27a5c5e19e4ef212b90b35a93559163e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 15:17:37 +0200
+Subject: [PATCH] ftplistparser: no more overwriting set.write_func
+
+The entries in the 'set' struct should remain as set by the application.
+
+Closes #22969
+
+CVE: CVE-2026-92388
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba8f8a7f27a5c5e19e4ef212b90b35a93559163e]
+
+Backport Changes:
+- Remove the ftp_wc backup fields from lib/ftp.h instead of
+  lib/ftp-int.h, which is absent from curl 8.19.0.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cw-out.c        | 10 ++++++++--
+ lib/ftp.c           | 13 -------------
+ lib/ftp.h           |  5 -----
+ lib/ftplistparser.c | 10 ++++++++++
+ lib/ftplistparser.h |  5 +++++
+ 5 files changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cw-out.c b/lib/cw-out.c
+index 554c32e..2500ea8 100644
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
+index 6047759..6b13fb6 100644
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
+index 20b3600..b1d3706 100644
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
+index f82895d..9c7ad6e 100644
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
+index 5d7aa49..942e102 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92388_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-92388_p2.patch
new file mode 100644
index 0000000000..0f819509f5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92388_p2.patch
@@ -0,0 +1,33 @@
+From b85acacec9b38442741bb019bc992e77b5f665d4 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/ftplistparser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ftplistparser.c b/lib/ftplistparser.c
+index 9c7ad6e..91b2425 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index a458a69e20..5abde681e7 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -65,6 +65,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86410.patch \
            file://CVE-2026-92390_p1.patch \
            file://CVE-2026-92390_p2.patch \
+           file://CVE-2026-92388_p1.patch \
+           file://CVE-2026-92388_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
