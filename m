Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3158.1792748016320966398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b3DWSMiQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13765; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pf0wZ1kDMf8Mb44kWGPboxSBDbzseOJHZh9QTvnrANs=;
  b=b3DWSMiQf/Ptcy2h+js8Mlk+qT0YRkiZDWdtiEKRpEkAedJNIIiVA92C
   s9prbrgbmFpI6F4Mv+JCL0zGkaiL+2f2qCioe/WRbMu5BpAI/YodHZuaf
   AlmodLib34QsRS52ciKy4xZXeQz/CYUckyIRvwpHO1VEtm+VLk2qhOC8W
   Moae7bc90SElkOughbJya1M/25b7VDxWBYK/SQGI2CyrP3aXItsszy/H1
   rvrqvtmtvo07h9dx4i4Rzdll1Lptlca0pYsv55+p7lVHSBYT1bv/QMOat
   kK0XANW8Hek+P/gRitvkwCIhMQhi0hsKLv94CZyIa9j6gQZLdoWnIhOHs
   w==;
X-CSE-ConnectionGUID: DcndmAS9TSSLoMQl2TjD/g==
X-CSE-MsgGUID: aazlBlr+RmucRMyb/K9BRw==
X-IPAS-Result: =?us-ascii?q?A0BHAgBDKdtq/5H/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?hyBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa1e?=
 =?us-ascii?q?Rs3gXkzgQGDKQE/AgJAAVDWWoRYAQsUAYE4hUCII10YAYR8JxsbgXKCUIIug?=
 =?us-ascii?q?QWBXAIBgUeGXQSCInoSgVoYBmWNCQKGc0iBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgR6BFiMZNmuBCV2BKylgASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExouC4EaODwJJkEVDGYLGgViCAINDH85EB8YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeRb4MEBwFgLQEKHwEBF4FmBQIEHxYLFgijG4IhoQ8KKIN2jCKVO?=
 =?us-ascii?q?hozhASBV5JAklQLmH2OCpVoaIRpgWg8gVMGcBU7gmcJFjQZD44rDguBeIFoh?=
 =?us-ascii?q?kDIGicyAgkyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:iilpYak4cccXPfSxdt7xq6ro5gzvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXTuAOfqLNzb2e98gOdjl8EIG65HXx4Q2TwRt/n1nF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsfnb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaET/OpyKFofy
 ccjDDcoVxTZu+Cah73uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIIHTGpsOzxfwS
 mTu9m3rBjseLp+lzCeOyFe9jKjszAnBR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM/JBFOQ87keGzazb6gKxHW0FSjMHZsZOiSMtbSYh2
 lnMm5biAiZi9eXFD3mc7byT6zi1PED5MFM/WMPNdiNdi/GLnW35pkunogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:8NVkpak2ZHbdbuBFbZOUikLhSZjpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3A+JANwmib1rejln9kHZUHR1u7sjJuXnbbwHL5GB6?=
 =?us-ascii?q?EMl1NT5isTQWs+o8jnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJsu+xw+ZZtV+WHxLpblT21iQf85h8aCEDFpOq5A?=
 =?us-ascii?q?bsPOhJCY3GGa3tiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="525176399"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 070FA180001C2;
	Fri, 23 Oct 2026 09:33:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A60B6CBF203; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 3/5] curl: fix CVE-2026-80255
Date: Fri, 23 Oct 2026 02:33:29 -0700
Message-Id: <20261023093331.1886272-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261023093331.1886272-1-dkelaiya@cisco.com>
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248494
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Apply prerequisite [3] to reject TABs in attribute values, then
prerequisite [4] for per-attribute name/value validation. Carry them
as separate dependent_p1 and dependent_p2 patches before the main
TAB-handling fix. Preserve test 1685 and the invalid_octets()
adaptation required by the older parser.

Keep test 2885's Secure<TAB>HttpOnly regression case alongside the
upstream TAB-before-Secure case and normal Secure control.

[1] https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d350aa0a
[2] https://curl.se/docs/CVE-2026-80255.html
[3] https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd398d1c5d
[4] https://github.com/curl/curl/commit/67300814294ab0aa311b8568b460619ecc522949

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Reject malformed attribute names/values before dispatch so a cookie
  cannot lose its Secure flag.
- Carry the TAB-value fix and adapted validation in separate
  dependent_p1 and dependent_p2 patches before the main fix.
- Extend test 2885 with the malformed attribute case, retaining the
  TAB-before-Secure and normal Secure controls.
---
 .../curl/CVE-2026-80255-dependent_p1.patch    | 139 ++++++++++++++++++
 .../curl/CVE-2026-80255-dependent_p2.patch    |  81 ++++++++++
 .../curl/curl/CVE-2026-80255.patch            | 115 +++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
 4 files changed, 338 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
new file mode 100644
index 0000000000..ca7737e5dd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p1.patch
@@ -0,0 +1,139 @@
+From 8e8bdd36048c146fe843d8948a912fbd398d1c5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 1 Apr 2026 08:09:47 +0200
+Subject: [PATCH] cookie: fix rejection when tabs in value
+
+A previous refactor changed the TAB check so that the octet could be
+accepted in the 'path', which would cause an invalid line in the saved
+cookie file so not possible to read the cookie back. Not terrible
+because the path cannot contain a raw tab anyway so it would never match
+anyway.
+
+Add test 1685 to verify
+
+Reported-by: Izan on hackerone
+
+Closes #21185
+
+CVE: CVE-2026-80255
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd398d1c5d]
+
+Backport Changes:
+- Registered test 1685 in the older curl 8.19.0 test-list row.
+
+(cherry picked from commit 8e8bdd36048c146fe843d8948a912fbd398d1c5d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c           | 14 ++++++-------
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1685    | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 8 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4d53cc4..cd95130 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -461,6 +461,13 @@ parse_cookie_header(struct Curl_easy *data,
+         sep = TRUE; /* a '=' was used */
+         if(!curlx_str_cspn(&ptr, &val, ";\r\n"))
+           curlx_str_trimblanks(&val);
++
++        /* Reject cookies with a TAB inside the value */
++        if(curlx_strlen(&val) &&
++           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
++          infof(data, "cookie contains TAB, dropping");
++          return CURLE_OK;
++        }
+       }
+       else
+         curlx_str_init(&val);
+@@ -489,13 +496,6 @@ parse_cookie_header(struct Curl_easy *data,
+           return CURLE_OK;
+         }
+ 
+-        /* Reject cookies with a TAB inside the value */
+-        if(curlx_strlen(&val) &&
+-           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
+-          infof(data, "cookie contains TAB, dropping");
+-          return CURLE_OK;
+-        }
+-
+         /* Check if we have a reserved prefix set. */
+         if(!strncmp("__Secure-", curlx_str(&name), 9))
+           co->prefix_secure = TRUE;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index ea700cd..5bb4f7e 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -226,7 +226,7 @@ test1660 test1661 test1662 test1663 test1664 test1665 \
+ \
+ test1670 test1671 \
+ \
+-test1680 test1681 test1682 test1683 \
++test1680 test1681 test1682 test1683 test1685 \
+ \
+ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
+diff --git a/tests/data/test1685 b/tests/data/test1685
+new file mode 100644
+index 0000000..b98dc20
+--- /dev/null
++++ b/tests/data/test1685
+@@ -0,0 +1,57 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers">
++HTTP/1.0 200 OK swsclose
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Type: text/html
++Set-Cookie: name=content; path=/we%TABwant
++Set-Cookie: accept=this; path=/only/this
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++HTTP, reject cookie with tab in path
++</name>
++<command>
++http://%HOSTIP:%HTTPPORT/ -c %LOGDIR/jar%TESTNUMBER.txt
++</command>
++
++<features>
++cookies
++</features>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/jar%TESTNUMBER.txt" mode="text">
++# Netscape HTTP Cookie File
++# https://curl.se/docs/http-cookies.html
++# This file was generated by libcurl! Edit at your own risk.
++
++127.0.0.1%TABFALSE%TAB/only/this%TABFALSE%TAB0%TABaccept%TABthis
++</file>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
new file mode 100644
index 0000000000..8950b28784
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent_p2.patch
@@ -0,0 +1,81 @@
+From 67300814294ab0aa311b8568b460619ecc522949 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 3 Jun 2026 08:10:14 +0200
+Subject: [PATCH] cookie: refactor parse_cookie_header
+
+- introduce a few static helper functions
+- simplify the bad octet checks
+- simplify the too long cookie/value check
+
+Closes #21854
+
+CVE: CVE-2026-80255
+Upstream-Status: Backport [https://github.com/curl/curl/commit/67300814294ab0aa311b8568b460619ecc522949]
+
+Backport Changes:
+- Kept parse_cookie_header() in its curl 8.19.0 form instead of
+  extracting parse_first_pair(), parse_flag(), parse_domain(),
+  parse_maxage() and parse_expires().
+- Applied the control-octet checks to that existing parser: reject
+  TAB in invalid_octets(), validate every attribute name/value,
+  and remove the duplicate first-pair checks.
+- Kept the older cookie name/value length limits; omitted upstream's
+  separate simplification of those limits.
+
+(cherry picked from commit 67300814294ab0aa311b8568b460619ecc522949)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index cd95130..b3b1ebd 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -354,9 +354,9 @@ static bool bad_domain(const char *domain, size_t len)
+ static bool invalid_octets(const char *ptr, size_t len)
+ {
+   const unsigned char *p = (const unsigned char *)ptr;
+-  /* Reject all bytes \x01 - \x1f (*except* \x09, TAB) + \x7f */
++  /* Reject all bytes \x01 - \x1f + \x7f */
+   while(len && *p) {
+-    if(((*p != 9) && (*p < 0x20)) || (*p == 0x7f))
++    if((*p < 0x20) || (*p == 0x7f))
+       return TRUE;
+     p++;
+     len--;
+@@ -457,15 +457,18 @@ parse_cookie_header(struct Curl_easy *data,
+       bool sep = FALSE;
+       curlx_str_trimblanks(&name);
+ 
++      if(invalid_octets(curlx_str(&name), curlx_strlen(&name))) {
++        infof(data, "invalid octets in name, cookie dropped");
++        return CURLE_OK;
++      }
++
+       if(!curlx_str_single(&ptr, '=')) {
+         sep = TRUE; /* a '=' was used */
+         if(!curlx_str_cspn(&ptr, &val, ";\r\n"))
+           curlx_str_trimblanks(&val);
+ 
+-        /* Reject cookies with a TAB inside the value */
+-        if(curlx_strlen(&val) &&
+-           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
+-          infof(data, "cookie contains TAB, dropping");
++        if(invalid_octets(curlx_str(&val), curlx_strlen(&val))) {
++          infof(data, "invalid octets in value, cookie dropped");
+           return CURLE_OK;
+         }
+       }
+@@ -476,8 +479,6 @@ parse_cookie_header(struct Curl_easy *data,
+         /* The first name/value pair is the actual cookie name */
+         if(!sep ||
+            /* Bad name/value pair. */
+-           invalid_octets(curlx_str(&name), curlx_strlen(&name)) ||
+-           invalid_octets(curlx_str(&val), curlx_strlen(&val)) ||
+            !curlx_strlen(&name)) {
+           infof(data, "invalid octets in name/value, cookie dropped");
+           return CURLE_OK;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255.patch b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
new file mode 100644
index 0000000000..43ef27f9bc
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
@@ -0,0 +1,115 @@
+From 4f6aa41a0145e930e766775dbe860883d350aa0a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 27 Aug 2026 08:33:30 +0200
+Subject: [PATCH] cookie: improve TAB handling
+
+For entries with a leading tab. Verified in test 2885.
+
+Reported-by: Stanislav Fort
+Closes #22699
+
+CVE: CVE-2026-80255
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d350aa0a]
+
+Backport Changes:
+- Extended test 2885 to reject Secure<TAB>HttpOnly, alongside the
+  upstream TAB-before-Secure case and normal Secure control.
+- Registered test 2885 in the older curl 8.19.0 test-list layout.
+
+(cherry picked from commit 4f6aa41a0145e930e766775dbe860883d350aa0a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c           |  2 +-
+ tests/data/Makefile.am |  2 +-
+ tests/data/test2885    | 53 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 55 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test2885
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index b3b1ebd..a8959a6 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -453,7 +453,7 @@ parse_cookie_header(struct Curl_easy *data,
+     struct Curl_str val;
+ 
+     /* we have a <name>=<value> pair or a stand-alone word here */
+-    if(!curlx_str_cspn(&ptr, &name, ";\t\r\n=")) {
++    if(!curlx_str_cspn(&ptr, &name, ";\r\n=")) {
+       bool sep = FALSE;
+       curlx_str_trimblanks(&name);
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 5bb4f7e..e157596 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -272,7 +272,7 @@ test2600 test2601 test2602 test2603 test2604 test2605 \
+ test2700 test2701 test2702 test2703 test2704 test2705 test2706 test2707 \
+ test2708 test2709 test2710 test2711 test2712 test2713 test2714 test2715 \
+ test2716 test2717 test2718 test2719 test2720 test2721 test2722 test2723 \
+-\
++test2885 \
+ test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007 \
+ test3008 test3009 test3010 test3011 test3012 test3013 test3014 test3015 \
+ test3016 test3017 test3018 test3019 test3020 test3021 test3022 test3023 \
+diff --git a/tests/data/test2885 b/tests/data/test2885
+new file mode 100644
+index 0000000..2635b6f
+--- /dev/null
++++ b/tests/data/test2885
+@@ -0,0 +1,53 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++<reply>
++<data crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Set-Cookie: thisis=SECRET;%TABSecure
++Set-Cookie: malformed=SECRET; Secure%TABHttpOnly
++Set-Cookie: also=notab; Secure
++
++</data>
++</reply>
++
++<client>
++<features>
++cookies
++</features>
++<server>
++https
++</server>
++<name>
++Cookies with TAB before 'secure'
++</name>
++<command>
++https://cookie.example:%HTTPSPORT/%TESTNUMBER -c %LOGDIR/cookies.txt --resolve cookie.example:%HTTPSPORT:%HOSTIP --insecure
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: cookie.example:%HTTPSPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/cookies.txt" mode="text">
++# Netscape HTTP Cookie File
++# https://curl.se/docs/http-cookies.html
++# This file was generated by libcurl! Edit at your own risk.
++
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABalso%TABnotab
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABthisis%TABSECRET
++</file>
++</verify>
++</testcase>
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 322304f47d..096e27570c 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -42,6 +42,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8926_p1.patch \
            file://CVE-2026-8926_p2.patch \
            file://CVE-2026-11564.patch \
+           file://CVE-2026-80255-dependent_p1.patch \
+           file://CVE-2026-80255-dependent_p2.patch \
+           file://CVE-2026-80255.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6

