Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4377.1793777792143251242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JhJsleK4;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5602; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qBt6PjDtMGyLCQPVmI/HEGM9RMhYQBlsrR4it2HgFS0=;
  b=JhJsleK4um7EIZPDDsrH8z3MvYZci9rb03ZwevVcFKZJB6yEvOSFTsGY
   vF/fj/guU26k/0eMazsL1Rz+cNxtVs+I1zGz0ez/EMuf2m6a/t/Uul+IE
   3UllyQG4b6yKElGBGgWXrN9RqyvWT6gwEjqZ7gcyD626lA2zolMM78p5J
   moVbC13YoDz01/zSXUdZmsJB+FrPO2+eb9LLMEiO865/jiQKpTqoAOrlW
   kE3tEhG2zEVypDfc4rjZAOcMO1iAuI2qZEiEdYTsLQXlKIicqHRCFmuM5
   i+o9wOZbXrvKinvHmH/MISyXqe+Vr74WhOB8tKpAc8MJPt9ouee5VYrWJ
   w==;
X-CSE-ConnectionGUID: kPC6lIhuTrmCJXpErrCS4Q==
X-CSE-MsgGUID: loFWbvXdQJ6p2YiS7UM2mg==
X-IPAS-Result: =?us-ascii?q?A0AnAADZ3+pq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIBSBag8BAQEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBLRAcAwECLysjC?=
 =?us-ascii?q?BmDAgGCdAMRBrl6GzeCLIEBgykBPwICQAFQ2zMBCxQBgTgBhT+II10YAYR9J?=
 =?us-ascii?q?xsbgXKBFYNpgQWBAFwCAYFFAoZeBIIigQyBWh5ljBgCiEJIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGYLGgVhCAINDHQ5E?=
 =?us-ascii?q?DAeJC8FHCZAGwoUGA1IESw3FRkEPm4Hki2DEVkIIAQJASkBAYF9BTspoxuCI?=
 =?us-ascii?q?aERCiiDeIwklToaM4VbpRYLmH2OCpZRhGmBaDyBWXAVO4JnCRY0GQ+OOYIDg?=
 =?us-ascii?q?WiGQMgbJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:T4zoX6k6WsFVLqW3XgUqejvo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaC2rXOayLMDP0fopxbtyw9x5Uu5DXmtIwHFNo+CFgE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/nb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY4g0bhzIGFTy
 eYdAxI9dj2ZncmNnIvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIII3VHZ0FwhjwS
 mTu+2PXPRsEBNCm62SdqEOtvbDyuHn+V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:1couz6/bIP0Zvkb8P1huk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:UhhmfGD306LHNtX6Eypf3xAQO8A4TmfY51XgO2KiE01SFITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AqdDrlQ8i63tuHVdVCJnuh+OQf8NvzZukFnABqLd?=
 =?us-ascii?q?Yo5O1NBcvBhLHiTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="529700846"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2396918000353;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C10C8CBF203; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 03/12] curl: fix CVE-2026-87862
Date: Tue,  3 Nov 2026 23:36:18 -0800
Message-Id: <20261104073627.302002-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249333
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Use an exact-host lookup when importing HSTS entries so a parent
policy cannot suppress a child policy with a later expiry. Adapt the
fix to hsts_add()/Curl_hsts() and register upstream test3109.

[1] https://github.com/curl/curl/commit/a1614c3bcf1593eb524b37792124357d97a5429c
[2] https://curl.se/docs/CVE-2026-87862.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-87862.patch            | 147 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87862.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87862.patch b/meta/recipes-support/curl/curl/CVE-2026-87862.patch
new file mode 100644
index 00000000000..313b767ea86
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87862.patch
@@ -0,0 +1,147 @@
+From a1614c3bcf1593eb524b37792124357d97a5429c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 8 Sep 2026 09:07:13 +0200
+Subject: [PATCH] hsts: on load, only remove exact duplicates
+
+Added test3109: verify HSTS when parent+subdomain expires before child
+
+Reported-by: Stanislav Fort
+Closes #22869
+
+CVE: CVE-2026-87862
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a1614c3bcf1593eb524b37792124357d97a5429c]
+
+Backport Changes:
+- Apply the exact-host lookup in curl 8.19.0's hsts_add() using
+  Curl_hsts(); upstream uses hsts_add_host_expire() and hsts_check().
+- Register test3109 in the older grouped tests/data/Makefile.am list.
+
+(cherry picked from commit a1614c3bcf1593eb524b37792124357d97a5429c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/hsts.c             |  2 +-
+ tests/data/Makefile.am |  2 +-
+ tests/data/test3109    | 86 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 88 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test3109
+
+diff --git a/lib/hsts.c b/lib/hsts.c
+index 03f51f8..5ad5bd4 100644
+--- a/lib/hsts.c
++++ b/lib/hsts.c
+@@ -423,7 +423,7 @@ static CURLcode hsts_add(struct hsts *h, const char *line)
+       subdomain = TRUE;
+     }
+     /* only add it if not already present */
+-    e = Curl_hsts(h, curlx_str(&host), curlx_strlen(&host), subdomain);
++    e = Curl_hsts(h, curlx_str(&host), curlx_strlen(&host), FALSE);
+     if(!e)
+       result = hsts_create(h, curlx_str(&host), curlx_strlen(&host),
+                            subdomain, expires);
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index e157596..f39d613 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -279,7 +279,7 @@ test3016 test3017 test3018 test3019 test3020 test3021 test3022 test3023 \
+ test3024 test3025 test3026 test3027 test3028 test3029 test3030 test3031 \
+ test3032 test3033 test3034 test3035 \
+ \
+-test3100 test3101 test3102 test3103 test3104 test3105 \
++test3100 test3101 test3102 test3103 test3104 test3105 test3109 \
+ \
+ test3200 test3201 test3202 test3203 test3204 test3205 test3206 test3207 test3208 \
+ test3209 test3210 test3211 test3212 test3213 test3214 test3215 test3216 \
+diff --git a/tests/data/test3109 b/tests/data/test3109
+new file mode 100644
+index 0000000..d256a40
+--- /dev/null
++++ b/tests/data/test3109
+@@ -0,0 +1,86 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++HSTS
++</keywords>
++</info>
++
++<reply>
++
++# we use this as response to a CONNECT
++<connect crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Server: fake
++
++</connect>
++
++<data nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Type: text/html
++Content-Length: 0
++
++</data>
++</reply>
++
++<client>
++<server>
++http
++http-proxy
++https
++</server>
++<features>
++HSTS
++proxy
++https
++Debug
++</features>
++
++# October 1, 2024
++<setenv>
++CURL_HSTS_HTTP=yes
++CURL_TIME=1727733600
++</setenv>
++
++# the child name has a later expiury than the parent so it must not be removed
++# before
++<file name="%LOGDIR/input%TESTNUMBER">
++.example.test "20241010 09:42:27"
++.child.example.test "20251010 09:42:27"
++</file>
++
++<name>
++HSTS parent expires before child
++</name>
++<command>
++-x http://%HOSTIP:%PROXYPORT http://child.example.test:%HTTPSPORT/%TESTNUMBER --hsts %LOGDIR/input%TESTNUMBER --insecure
++</command>
++<disable>
++test-duphandle
++</disable>
++</client>
++
++<verify>
++
++<stdout>
++HTTP/1.1 200 OK%CR
++Server: fake%CR
++%CR
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Type: text/html
++Content-Length: 0
++
++</stdout>
++
++<file name="%LOGDIR/input%TESTNUMBER" mode="text">
++# Your HSTS cache. https://curl.se/docs/hsts.html
++# This file was generated by libcurl! Edit at your own risk.
++.example.test "20241010 09:42:27"
++.child.example.test "20251010 09:42:27"
++</file>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index be140ccc485..3828c26f507 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80231.patch \
            file://CVE-2026-86414.patch \
            file://CVE-2026-86409.patch \
+           file://CVE-2026-87862.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
