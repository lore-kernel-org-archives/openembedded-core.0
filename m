Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1246.1793949576439388498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OrF7JOiR;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7835; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BauOyKL5mh2pvI445fMbGQU9N5hXO/aGXBBE8THArN8=;
  b=OrF7JOiRnojZT3vu34HgMFB+Qf0y2SD8GBZsp8L4Tz1TVso75vwZzO02
   N9w9/NOIiKJujYUwSN29XMA+g1Ao8Li0rHfzpdcWGyqQPta951NJAOyZY
   eOxo1uWrMk/nDy6ta71jfBCWWqmBG8NAMhfQ51YT3uD1Zf+2CE0eYgra1
   l917cwNZYM3nwKmGWcKmAO8WU2Ju4s8NBvFtdieAC20GZpqzJMVDC0WnN
   2gKCxxst+FpLKC3DM4jSfyE18fSM5tQbj//hIPT6e80x/AquMnUGCReJM
   CNMAnzF5nNMl6Rdv4AH41hhxt8ps3f9YVfpL8FQcbfCoRIA387rJohcV7
   A==;
X-CSE-ConnectionGUID: Ls6t61MZT0O17rlvAp2Odg==
X-CSE-MsgGUID: 4O42ckI0RmKOUCq/bHmFsg==
X-IPAS-Result: =?us-ascii?q?A0AnAADtfu1q/5X/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIYF+DwEBAQ9EDQQBAYUFAo4dAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjC?=
 =?us-ascii?q?BmDAgGCdAMRBrs4GzeBeTOBAYMpAT8CAkABUNszAQsUAYE4AYU/iCNdGAGEf?=
 =?us-ascii?q?ScbG4FygRWDaYEFgVwCAYE3EIZeBIIigQyBWh5ljBUCgVGGeUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUcJj4bCi8YDUgRLDcVGQQ+bgeSPYMSWQggDQEpAQEEE25AGyIGJ?=
 =?us-ascii?q?BELBhgUkmiQH4IhoREKKIN4jCSVOhozhVulFguYfY4KlWkbTYRpgWg8gVlwF?=
 =?us-ascii?q?TuCZwkWNBkPji4LC4F4gWiGQMYFJjICCTIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:eMN7jal1k7YKCiWJaWUvff/o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUW/UPPiDM2D2fIwibozkoU9Q7J/WmoRqGQo4rSpjEltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FakDpPopWER8y
 aQ/cW8Xag6qn7iRzL3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDTHZ8PwBbwS
 mTuo0OlWBoZFYSlzBmiz1m1weXvmA3gV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:9ozC16jYKH2IPgQcNqwC0iYs9HBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:tAxqB26oeFFNObYouNss0FVKBp58V0/hlFCJfFW8F09xEpqZRgrF
X-Talos-MUID: 9a23:QLb3dwv5upnXXPcfqc2n2BY+bsxrwvyUDWMqrL4f/MOkMAJrNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544102268"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 49C0118000337;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E4295CBF202; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/9] curl: fix CVE-2026-87863
Date: Thu,  5 Nov 2026 23:19:25 -0800
Message-Id: <20261106071932.490299-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249601
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Cap HSTS max-age at two years and keep saving valid entries if one
date cannot be serialized. Adapt the older parser so oversized quoted
ages are capped while preserving unquoted suffix handling. Retain
upstream test1862.

[1] https://github.com/curl/curl/commit/08d50a791b3197a3d0a4fc2f778e243f5501c67e
[2] https://curl.se/docs/CVE-2026-87863.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-87863.patch            | 203 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87863.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87863.patch b/meta/recipes-support/curl/curl/CVE-2026-87863.patch
new file mode 100644
index 0000000000..d1f489e47e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87863.patch
@@ -0,0 +1,203 @@
+From 08d50a791b3197a3d0a4fc2f778e243f5501c67e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 8 Sep 2026 16:04:42 +0200
+Subject: [PATCH] hsts: cap max-age to two years
+
+And ignore problems saving individual HSTS entries - a single entry
+problem should not affect storing other entries.
+
+Added test 1862 to verify.
+
+Closes #22878
+
+CVE: CVE-2026-87863
+Upstream-Status: Backport [https://github.com/curl/curl/commit/08d50a791b3197a3d0a4fc2f778e243f5501c67e]
+
+Backport Changes:
+- Keep curl 8.19.0's max-age parser, which reads directly from the
+  header using TIME_T_MAX as its numeric limit. Upstream first
+  extracts the value and parses it with a two-year numeric limit.
+  Cap parsed ages and numeric overflows at two years.
+- After overflow in a quoted age, skip its digits before checking
+  the closing quote. The older number reader leaves its position
+  unchanged on overflow. For unquoted overflow, keep that position
+  so trailing text is handled as before.
+- Register test1862 in the older grouped tests/data/Makefile.am list.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/hsts.c             | 32 ++++++++++--------
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1862    | 73 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 93 insertions(+), 14 deletions(-)
+ create mode 100644 tests/data/test1862
+
+diff --git a/lib/hsts.c b/lib/hsts.c
+index 5ad5bd4..9e5b456 100644
+--- a/lib/hsts.c
++++ b/lib/hsts.c
+@@ -43,6 +43,8 @@
+ #define MAX_HSTS_DATELEN 256
+ #define UNLIMITED        "unlimited"
+ 
++#define CAP_HSTS_MAX_AGE (2*365*24*3600) /* two years cap */
++
+ #if defined(DEBUGBUILD) || defined(UNITTESTS)
+ /* to play well with debug builds, we can *set* a fixed time this will
+    return */
+@@ -152,11 +154,18 @@ CURLcode Curl_hsts_parse(struct hsts *h, const char *hostname,
+         quoted = TRUE;
+ 
+       rc = curlx_str_number(&p, &expires, TIME_T_MAX);
+-      if(rc == STRE_OVERFLOW)
+-        expires = CURL_OFF_T_MAX;
++      if(rc == STRE_OVERFLOW) {
++        expires = CAP_HSTS_MAX_AGE;
++        if(quoted) {
++          while(ISDIGIT(*p))
++            p++;
++        }
++      }
+       else if(rc)
+         /* invalid max-age */
+         return CURLE_BAD_FUNCTION_ARGUMENT;
++      else if(expires > CAP_HSTS_MAX_AGE)
++        expires = CAP_HSTS_MAX_AGE;
+ 
+       if(quoted) {
+         if(*p != '\"')
+@@ -304,22 +313,21 @@ static CURLcode hsts_push(struct Curl_easy *data,
+ /*
+  * Write this single hsts entry to a single output line
+  */
+-static CURLcode hsts_out(struct stsentry *sts, FILE *fp)
++static void hsts_out(struct stsentry *sts, FILE *fp)
+ {
+   struct tm stamp;
+   if(sts->expires != TIME_T_MAX) {
+     CURLcode result = curlx_gmtime((time_t)sts->expires, &stamp);
+-    if(result)
+-      return result;
+-    curl_mfprintf(fp, "%s%s \"%d%02d%02d %02d:%02d:%02d\"\n",
+-                  sts->includeSubDomains ? "." : "", sts->host,
+-                  stamp.tm_year + 1900, stamp.tm_mon + 1, stamp.tm_mday,
+-                  stamp.tm_hour, stamp.tm_min, stamp.tm_sec);
++    if(!result)
++      /* skip the entry if the date function fails */
++      curl_mfprintf(fp, "%s%s \"%d%02d%02d %02d:%02d:%02d\"\n",
++                    sts->includeSubDomains ? "." : "", sts->host,
++                    stamp.tm_year + 1900, stamp.tm_mon + 1, stamp.tm_mday,
++                    stamp.tm_hour, stamp.tm_min, stamp.tm_sec);
+   }
+   else
+     curl_mfprintf(fp, "%s%s \"%s\"\n",
+                   sts->includeSubDomains ? "." : "", sts->host, UNLIMITED);
+-  return CURLE_OK;
+ }
+ 
+ /*
+@@ -354,9 +362,7 @@ CURLcode Curl_hsts_save(struct Curl_easy *data, struct hsts *h,
+     for(e = Curl_llist_head(&h->list); e; e = n) {
+       struct stsentry *sts = Curl_node_elem(e);
+       n = Curl_node_next(e);
+-      result = hsts_out(sts, out);
+-      if(result)
+-        break;
++      hsts_out(sts, out);
+     }
+     curlx_fclose(out);
+     if(!result && tempstore && curlx_rename(tempstore, file))
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 7a9b8d0..e678290 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -231,7 +231,7 @@ test1680 test1681 test1682 test1683 test1685 \
+ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
+ \
+-test1800 test1801 test1802 test1847 test1848 test1849 test1850 \
++test1800 test1801 test1802 test1847 test1848 test1849 test1850 test1862 \
+ \
+ test1900 test1901 test1902 test1903 test1904 test1905 test1906 test1907 \
+ test1908 test1909 test1910 test1911 test1912 test1913 test1914 test1915 \
+diff --git a/tests/data/test1862 b/tests/data/test1862
+new file mode 100644
+index 0000000..b9a29f6
+--- /dev/null
++++ b/tests/data/test1862
+@@ -0,0 +1,73 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HSTS
++</keywords>
++</info>
++
++<reply>
++
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 6
++Connection: close
++Strict-Transport-Security: max-age=1152921504606846976
++
++-foo-
++</data>
++</reply>
++
++<client>
++<server>
++http
++</server>
++<features>
++HSTS
++Debug
++</features>
++
++# November 11, 2030
++<setenv>
++CURL_HSTS_HTTP=yes
++CURL_TIME=1920582000
++</setenv>
++
++<name>
++HSTS with extreme max-age
++</name>
++<command>
++http://this.hsts.example:%HTTPPORT/%TESTNUMBER --hsts %LOGDIR/input%TESTNUMBER --resolve this.hsts.example:%HTTPPORT:%HOSTIP
++</command>
++<file name="%LOGDIR/input%TESTNUMBER">
++# Your HSTS cache. https://curl.se/docs/hsts.html
++# This file was generated by libcurl! Edit at your own risk.
++somehere.example "20330525 03:33:20"
++elsewhere.example.com "20330727 03:33:20"
++</file>
++<disable>
++test-duphandle
++</disable>
++</client>
++
++<verify>
++# we let it CONNECT to the server to confirm HSTS but deny from there
++<protocol crlf="headers">
++GET /1862 HTTP/1.1
++Host: this.hsts.example:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/input%TESTNUMBER" mode="text">
++# Your HSTS cache. https://curl.se/docs/hsts.html
++# This file was generated by libcurl! Edit at your own risk.
++somehere.example "20330525 03:33:20"
++elsewhere.example.com "20330727 03:33:20"
++this.hsts.example "20321109 23:00:00"
++</file>
++
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 20dbeb9dfd..9fd78a0fd8 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87865_p1.patch \
            file://CVE-2026-87865_p2.patch \
            file://CVE-2026-92391.patch \
+           file://CVE-2026-87863.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

