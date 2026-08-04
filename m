Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00073C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:34:20 +0000 (UTC)
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13365.1785839652625183509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 03:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eAuJlrbw;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12043; q=dns/txt;
  s=iport01; t=1785839652; x=1787049252;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IKNUarulDxKf52w0kY7+ixAKMUIUldV3YWIq9RprboI=;
  b=eAuJlrbwXOLIo6NAS7tFLQESh/2IxzhfmxlcyX5MNsF23blSGN9ki9mc
   nHP9OzRcX0Ju820s+CQP7sa9dL/6MaE5wGv3AALjfXXueC6h4klU03GCb
   b4YX+Pp07o4jn8PBj+/zrxETRQM7bhycFaNFzIXKHgV/gGVRdpcG0O4PY
   fIx+BHaopvJmHBeqfJYkpvbfO7Gg+rQkBlX908l6zC/fRgvTIq4pamidp
   9JjdkteI2l+hj8gEExph+1ZC6UDQraW5/qxAg524kz0K+OHyqhxVAb5zF
   VbSEd9a2+bQbPD7j9keAH3gzCO68OO6a3pLypeIsVGZGqh9PjgalVj6HN
   Q==;
X-CSE-ConnectionGUID: YJv7LUj7SK6rm/b4ETmAuQ==
X-CSE-MsgGUID: 5N0xYWe0T7qTuCgkjKN0gA==
X-IPAS-Result: =?us-ascii?q?A0BIAgA4v3Fq/85K/pBaHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1nAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEbIhwDAQIvKyMIEAEIgwIBgnQDE?=
 =?us-ascii?q?Qa+cYF5M4EBgygBPwICQAFQ2y4BCxQBgTiFP4ghXRgBhHwnGxuBcoQIdoEFg?=
 =?us-ascii?q?VwCAYFHhl0EgiKBDIFagU2PLEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsHBYEdgSsshFMjGTZ8gS91SnUtahIXgRqDFQKCekMLGA1IESw3FBkEP?=
 =?us-ascii?q?m4HjgYggkMBYSQJAQcMFgEBgSBiCTILHpJoFQEakAOCHoE4n1oKKIN1jCGVO?=
 =?us-ascii?q?hozhVulEZkIjgqVaGiEaYFoPIFZcBU7gmcJFjQZD44tCwuBeIFohkDFYTw1A?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:gTt3h6i091NrjbcY/IBvEo7lX161NBEKZh0ujC45NGQN5FlHY01je
 htvWmGBPv/bZmT8fNpxa9vl90oA68WDmtM1QQJv+y8wEyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/rf8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUp2PgoJVxMq
 sc7dioIKRrfqt6z6a+CH7wEasQLdKEHPasWt2slyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZD/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIJIzRGpUFxi50o
 Eqb2TzpMy4XbODA0AaY2X2vhMzpxSzSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:v/vWuKs3gZxspXcqo7loGHWw7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:Ibk2kWDwhcN4YH36ExhF6hEwJ8J6SV6D1nKXKROVNWNAVYTAHA==
X-Talos-MUID: 9a23:CmMy9gnY1fNhTnvO3jFLdno/Ep940pujUHxSiKkbkMaHNw9WYzi02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,204,1779148800"; 
   d="scan'208";a="56837880"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2026 10:34:10 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 07D6E180003AA
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:34:10 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B49C0CC037D; Tue,  4 Aug 2026 16:04:08 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 3/5] curl: fix CVE-2026-6253
Date: Tue,  4 Aug 2026 16:03:03 +0530
Message-Id: <20260804103305.1180770-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260804103305.1180770-1-deeratho@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
 <20260804103305.1180770-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242712

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-6253.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Rebase the patches on top of scarthgap latest
fixes.
 .../curl/curl/CVE-2026-6253.patch             | 392 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 0000000000..956beac27b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
@@ -0,0 +1,392 @@
+From eb175878ffa07392d6654127f3d4637d4d335c78 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 5 Jun 2026 01:18:43 -0700
+Subject: [PATCH] http: clear the proxy credentials as well on port or scheme
+ change
+
+Add tests 2009-2011 to verify switching between proxies with credentials
+when the switch is driven by a redirect
+
+Reported-by: Dwij Mehta
+
+Closes #21304
+
+CVE: CVE-2026-6253
+Upstream-Status: Backport [https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f]
+
+Backport Changes:
+- The upstream lib/http.c hunk adds the credential resets to
+  Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirect
+  handler and carries the equivalent logic in lib/transfer.c via
+  Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
+- The upstream Curl_reset_proxypwd() helper includes a CURL_DISABLE_PROXY
+  fallback. In curl-8.7.1, the proxy credential fields and string slots are
+  unconditional and the pre-existing code accesses them without that guard,
+  so this backport retains the target-version behavior instead.
+- curl-8.7.1 uses tests/data/Makefile.inc instead of the upstream
+  tests/data/Makefile.am list.
+
+(cherry picked from commit 188c2f166a20fa97c2325b2da7d0e5cecc13725f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/transfer.c          | 56 ++++++++++++++++++++++++--------
+ lib/transfer.h          |  2 ++
+ tests/data/Makefile.inc |  1 +
+ tests/data/test2009     | 70 ++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2010     | 71 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2011     | 70 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 257 insertions(+), 13 deletions(-)
+ create mode 100644 tests/data/test2009
+ create mode 100644 tests/data/test2010
+ create mode 100644 tests/data/test2011
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index ccd042b80d..a73462928d 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -553,6 +553,35 @@ void Curl_init_CONNECT(struct Curl_easy *data)
+   data->state.upload = (data->state.httpreq == HTTPREQ_PUT);
+ }
+
++/*
++ * Restore the user credentials to those set in options.
++ */
++CURLcode Curl_reset_userpwd(struct Curl_easy *data)
++{
++  CURLcode result;
++  if(data->set.str[STRING_USERNAME] || data->set.str[STRING_PASSWORD])
++    data->state.creds_from = CREDS_OPTION;
++  result = Curl_setstropt(&data->state.aptr.user,
++                          data->set.str[STRING_USERNAME]);
++  if(!result)
++    result = Curl_setstropt(&data->state.aptr.passwd,
++                            data->set.str[STRING_PASSWORD]);
++  return result;
++}
++
++/*
++ * Restore the proxy credentials to those set in options.
++ */
++CURLcode Curl_reset_proxypwd(struct Curl_easy *data)
++{
++  CURLcode result = Curl_setstropt(&data->state.aptr.proxyuser,
++                                   data->set.str[STRING_PROXYUSERNAME]);
++  if(!result)
++    result = Curl_setstropt(&data->state.aptr.proxypasswd,
++                            data->set.str[STRING_PROXYPASSWORD]);
++  return result;
++}
++
+ /*
+  * Curl_pretransfer() is called immediately before a transfer starts, and only
+  * once for one transfer no matter if it has redirects or do multi-pass
+@@ -700,21 +729,10 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+
+-  if(data->set.str[STRING_USERNAME] ||
+-     data->set.str[STRING_PASSWORD])
+-    data->state.creds_from = CREDS_OPTION;
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.user,
+-                            data->set.str[STRING_USERNAME]);
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.passwd,
+-                            data->set.str[STRING_PASSWORD]);
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxyuser,
+-                            data->set.str[STRING_PROXYUSERNAME]);
++    result = Curl_reset_userpwd(data);
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxypasswd,
+-                            data->set.str[STRING_PROXYPASSWORD]);
++    result = Curl_reset_proxypwd(data);
+
+   data->req.headerbytecount = 0;
+   Curl_headers_cleanup(data);
+@@ -759,6 +777,7 @@ CURLcode Curl_follow(struct Curl_easy *data,
+   bool disallowport = FALSE;
+   bool reachedmax = FALSE;
+   CURLUcode uc;
++  CURLcode result;
+
+   DEBUGASSERT(type != FOLLOW_NONE);
+
+@@ -889,12 +908,23 @@ CURLcode Curl_follow(struct Curl_easy *data,
+         free(scheme);
+       }
+       if(clear) {
++        result = Curl_reset_userpwd(data);
++        if(result) {
++          free(newurl);
++          return result;
++        }
+         Curl_safefree(data->state.aptr.user);
+         Curl_safefree(data->state.aptr.passwd);
+       }
+     }
+   }
+
++  result = Curl_reset_proxypwd(data);
++  if(result) {
++    free(newurl);
++    return result;
++  }
++
+   if(type == FOLLOW_FAKE) {
+     /* we're only figuring out the new url if we would've followed locations
+        but now we're done so we can get out! */
+diff --git a/lib/transfer.h b/lib/transfer.h
+index e65b2b1472..f1a791f1cf 100644
+--- a/lib/transfer.h
++++ b/lib/transfer.h
+@@ -31,6 +31,8 @@ char *Curl_checkheaders(const struct Curl_easy *data,
+
+ void Curl_init_CONNECT(struct Curl_easy *data);
+
++CURLcode Curl_reset_userpwd(struct Curl_easy *data);
++CURLcode Curl_reset_proxypwd(struct Curl_easy *data);
+ CURLcode Curl_pretransfer(struct Curl_easy *data);
+ CURLcode Curl_posttransfer(struct Curl_easy *data);
+
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 9fb92742ee..aafd309a9d 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -231,6 +231,7 @@ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
+ \
+ test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
++test2009 test2010 test2011 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2009 b/tests/data/test2009
+new file mode 100644
+index 0000000000..d2fd79e0d6
+--- /dev/null
++++ b/tests/data/test2009
+@@ -0,0 +1,70 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy credentials via env variables, redirect from http to https
++</name>
++
++<setenv>
++http_proxy=http://user:secret@%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++http://somewhere.example/ --follow --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[user:secret]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/data/test2010 b/tests/data/test2010
+new file mode 100644
+index 0000000000..443ae9d2f9
+--- /dev/null
++++ b/tests/data/test2010
+@@ -0,0 +1,71 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy credentials via options for two proxies, redirect from http to https
++</name>
++
++<setenv>
++http_proxy=http://%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++--proxy-user batman:robin http://somewhere.example/ --follow --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[batman:robin]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++Proxy-Authorization: Basic %b64[batman:robin]b64%
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/data/test2011 b/tests/data/test2011
+new file mode 100644
+index 0000000000..dd4e534248
+--- /dev/null
++++ b/tests/data/test2011
+@@ -0,0 +1,70 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy creds via env, cross-scheme redirect, --location-trusted
++</name>
++
++<setenv>
++http_proxy=http://user:secret@%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++http://somewhere.example/ --location-trusted --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[user:secret]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 296507eef8..19f24c3205 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://CVE-2026-6276.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

