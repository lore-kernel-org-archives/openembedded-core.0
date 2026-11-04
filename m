Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4448.1793777792286109070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=c+jlO8JC;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6249; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q4eAqSWEboS8IFNTs4CJbLxD7qCTmLiWtAM4GLFJLOo=;
  b=c+jlO8JCwDBTe1fhhKp7uIg2lctGwrxvdGLkcRoMLTf8fLsbza3TCtKS
   Pz0F3YDpZAx81IEw6LfNcge6qpFjUc8hIVuBX/H30JOQIguY/9P4i0Ye4
   1gP3tuUO5RYLzK1EKKjLZiurunQ+QuyqpcmyazjJRAPmw7WDkCIDBj840
   1lqbccB7ZH0bXyFNkdv7K4ThUgbGv+ysBW5oH6Zb/UUcyqS/QbwwWzk35
   LzkWA8/E0G44SSJHAx14pH6lmNwurNR/OrdUwG19XfGIjerZTzoYY7AMI
   CNT1WXb4lzUmoRuUx56YFcLSjKZDwntkfvBVSLfEgMxT4NIUNWgFYt+O3
   g==;
X-CSE-ConnectionGUID: GzNA8Mc6RE2nOhHWm6Hi1w==
X-CSE-MsgGUID: aH28ZiBXQtSmUsVQELKrdA==
X-IPAS-Result: =?us-ascii?q?A0AaAADZ3+pq/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWQOeIIF+DwEBAQ9EDQQBAYUFAo4cAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcA?=
 =?us-ascii?q?wECLysjCBmDAgGCdAMRBrl6GzeBeTOBAYMpAT8CAkABUNszAQsUAYE4AYU/i?=
 =?us-ascii?q?CNdGAGEfScbG4FyhH6BBYFcAgGBR4ZeBIIigQyBWh5ljBgCiEJIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2A?=
 =?us-ascii?q?oJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGYLGgVhCAIND?=
 =?us-ascii?q?HQ5EDAeJC8FHCZAGwoUGA1IESw3FRkEPm4Hki2CWTcBYRoJAQkBKQEBBIFkG?=
 =?us-ascii?q?jsLHpM3j2SCIYE1n1wKKIN4jCSVOhozhVulFguYfY4KlTcyG02EaYFoPIFZc?=
 =?us-ascii?q?BU7gmcJFjQZD44uCwuBeIFohkDIGyYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:YnbyO6JOYxi/0c7gFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShGADy
 2BLX22BO/+KZmTyftAgPt+xoEwCv5PWmoIwSAMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1BHmcfbagTpNxaW2dp9
 dwnLW4tb0mc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeSxaoaNI4DRLSlTtk+4/
 DL0/k7JOw0hMeGE9wOo1lG2isaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:shkGJajqcmwxQJyBxt/qYl6vEHBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AH19oWGvVlfRF9IfdYM2fHgQ56IsKYFv0nFLbfXW?=
 =?us-ascii?q?VU2BOSJ2qTAGw+fp7xp8=3D?=
X-Talos-MUID: 9a23:/iXLNwqreTOzUwolwgcezzhCbpda4o6eMVw2lKgdhfCpEQ9qNx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="544240143"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 1E286180001F2;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B9FF5CBF201; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 01/12] curl: fix CVE-2026-86414
Date: Tue,  3 Nov 2026 23:36:16 -0800
Message-Id: <20261104073627.302002-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249335
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Reject origin-authentication challenges during HTTP CONNECT while
preserving 407 proxy authentication. Cover both the HTTP/1 and
HTTP/2 tunnel implementations in curl 8.19.0.

Retain upstream test2173 with this version's receive-error result.

[1] https://github.com/curl/curl/commit/2956af6c7451029fb12c12f8166dff211f930d52
[2] https://curl.se/docs/CVE-2026-86414.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-86414.patch            | 155 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86414.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86414.patch b/meta/recipes-support/curl/curl/CVE-2026-86414.patch
new file mode 100644
index 00000000000..13bf17dcc1b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86414.patch
@@ -0,0 +1,155 @@
+From 2956af6c7451029fb12c12f8166dff211f930d52 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 3 Sep 2026 17:54:45 +0200
+Subject: [PATCH] HTTP-CONNECT: do not react to 401 responses
+
+When a proxy answers with a 401 on a CONNECT, ignore Authentication
+headers and fail the connect.
+
+Add test2173 to verify.
+
+Closes #22817
+
+CVE: CVE-2026-86414
+Upstream-Status: Backport [https://github.com/curl/curl/commit/2956af6c7451029fb12c12f8166dff211f930d52]
+
+Backport Changes:
+- Omitted the on_resp_header_udp() hunk: curl 8.19.0 has no separate
+  CONNECT-UDP response handler.
+- Applied the Curl_http_proxy_inspect_tunnel_response() change to
+  inspect_response() in lib/cf-h2-proxy.c, where curl 8.19.0 handles
+  HTTP/2 CONNECT responses. It uses ts->resp from the tunnel state
+  instead of upstream's resp argument.
+- Registered test2173 in the older compact TESTCASES list without
+  upstream's extra blank continuation line.
+- Changed test2173's expected error from 7 (CURLE_COULDNT_CONNECT)
+  to 56 (CURLE_RECV_ERROR). curl 8.19.0 reports this rejected CONNECT
+  as a receive error; upstream reports it as a connection failure.
+
+(cherry picked from commit 2956af6c7451029fb12c12f8166dff211f930d52)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cf-h1-proxy.c      |  3 +--
+ lib/cf-h2-proxy.c      |  5 +---
+ tests/data/Makefile.am |  1 +
+ tests/data/test2173    | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 71 insertions(+), 6 deletions(-)
+
+diff --git a/lib/cf-h1-proxy.c b/lib/cf-h1-proxy.c
+index 69e050b..fc68957 100644
+--- a/lib/cf-h1-proxy.c
++++ b/lib/cf-h1-proxy.c
+@@ -277,8 +277,7 @@ static CURLcode on_resp_header(struct Curl_cfilter *cf,
+   struct SingleRequest *k = &data->req;
+   (void)cf;
+ 
+-  if((checkprefix("WWW-Authenticate:", header) && (401 == k->httpcode)) ||
+-     (checkprefix("Proxy-authenticate:", header) && (407 == k->httpcode))) {
++  if(checkprefix("Proxy-authenticate:", header) && (407 == k->httpcode)) {
+ 
+     bool proxy = (k->httpcode == 407);
+     char *auth = Curl_copy_header_value(header);
+diff --git a/lib/cf-h2-proxy.c b/lib/cf-h2-proxy.c
+index 4275e1e..719f9b8 100644
+--- a/lib/cf-h2-proxy.c
++++ b/lib/cf-h2-proxy.c
+@@ -788,10 +788,7 @@ static CURLcode inspect_response(struct Curl_cfilter *cf,
+     return CURLE_OK;
+   }
+ 
+-  if(ts->resp->status == 401) {
+-    auth_reply = Curl_dynhds_cget(&ts->resp->headers, "WWW-Authenticate");
+-  }
+-  else if(ts->resp->status == 407) {
++  if(ts->resp->status == 407) {
+     auth_reply = Curl_dynhds_cget(&ts->resp->headers, "Proxy-Authenticate");
+   }
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index e157596..95a8fe4 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -257,6 +257,7 @@ test2072 test2073 test2074 test2075 test2076 test2077 test2078 test2079 \
+ test2080 test2081 test2082 test2083 test2084 test2085 test2086 test2087 \
+ test2088 test2089 test2090 test2091 \
+ test2100 test2101 test2102 test2103 test2104 \
++test2173 \
+ \
+ test2200 test2201 test2202 test2203 test2204 test2205 \
+ \
+diff --git a/tests/data/test2173 b/tests/data/test2173
+new file mode 100644
+index 0000000..fb85f40
+--- /dev/null
++++ b/tests/data/test2173
+@@ -0,0 +1,68 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++HTTP CONNECT
++HTTP Basic auth
++proxytunnel
++</keywords>
++</info>
++# Server-side
++<reply>
++<data>
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake swsclose
++Content-Type: text/html
++Funny-head: yesyes
++Content-Length: 9
++
++contents
++</data>
++<connect crlf="headers">
++HTTP/1.1 401 Tricking You
++WWW-Authenticate: Basic
++
++</connect>
++<datacheck crlf="headers">
++HTTP/1.1 401 Tricking You
++WWW-Authenticate: Basic
++
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++http-proxy
++</server>
++<name>
++HTTP over proxy-tunnel with site wrong 401 response
++</name>
++<command>
++http://test.%TESTNUMBER:%HTTPPORT/we/want/that/page/%TESTNUMBER -p -x %HOSTIP:%PROXYPORT --user 'iam:my:;self' --anyauth
++</command>
++<features>
++proxy
++</features>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<proxy crlf="headers">
++CONNECT test.%TESTNUMBER:%HTTPPORT HTTP/1.1
++Host: test.%TESTNUMBER:%HTTPPORT
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</proxy>
++<protocol crlf="headers">
++</protocol>
++<errorcode>
++56
++</errorcode>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index adee64a0188..9b28b9d7c98 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-80231.patch \
+           file://CVE-2026-86414.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
