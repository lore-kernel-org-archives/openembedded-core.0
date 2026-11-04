Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4378.1793777792173650437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hePNxCPM;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7919; q=dns/txt;
  s=iport01; t=1793777793; x=1794987393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFCyaAba7qk8WPDInLTUxIZE+fw31SHlgdIyuHRXElc=;
  b=hePNxCPMilWAf96sw33sNtibZu5NYO0emMWmThByiZRkjv3pakijE221
   /tQ+mnemu7kOMgljG4Dwo1snZgLkprgoT30Gzf/r97H9NY7YOa2FQAr2N
   FcmtqitXSpM1URa4fMxGrBUJfJnqRDH83V7FH/mKGMMSaWYiEBSm0igvT
   sDgwVs92XY4KK59f6ZllpeIkyG6rGt1ciZ4WzexBzEWpTM/3MCDONX0ft
   wWYcCxLSizK62e67w0m5yc1kHn1nTi6mK2m4sFr4yrBvWiNCkyMBqew/P
   Y6Q0Fgs1qzDfcW2jzswpEX9aR0LvEZGZezp1GFbI4DDUHcSBAG/cGvdob
   Q==;
X-CSE-ConnectionGUID: Zma9x68cQOmpsbLHNhNasQ==
X-CSE-MsgGUID: pF94FacoRBO7ueh7VcZmLA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZ3+pq/43/Ja1aHgEBCxIMggULgld1YENJlksDg?=
 =?us-ascii?q?ROdDYF+DwEBAQ9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgn0EAQGCO?=
 =?us-ascii?q?gM3AxEGuXobN4F5M4EBgykBPwICQAFQ2zMBCxQBgTiFQIgjXRgBhH0nGxuBc?=
 =?us-ascii?q?oEVgnN2gQWBXAIBgSaGfwSCIoEMgVoejH0CiEJIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGYLGgVhCAINDHQ5EDAeJC8FH?=
 =?us-ascii?q?CZAGwoUGA1IESw3FRkEPm4Hki2DCgcWSy0BKQEBIHhUUSkUoweCIaERCiiDe?=
 =?us-ascii?q?IwklToaM4QEgVeSQpJUC5h9izeCU5VpaIRpgWg8DYFMcBWDIgkWNBkPjisOC?=
 =?us-ascii?q?4NghkDIGyYyAgkyAQEHAgcOAwuBaJAAgR5gAQE?=
IronPort-Data: A9a23:BI29matVTEbKiZ8ahYO8tyr4dufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWCFOPmIazD8Ltx/aY2y9koA65bQm9ZqHldo+Co3Fn5GgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwyON+UHEQp
 fchDzUVdRqnp8S25rugc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWHp4Owx7A/
 woq+UzhLEBGGtWUzgCv1S2xi++QoyjJXaY7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YdLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:1v75Ha5CQdOXf2A16APXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:29nKgWG+Aq3HB8xtqmJV8UdFCp51eUT6yW/LKWuYL2ZPQaasHAo=
X-Talos-MUID: 9a23:l8RVFQgpRPPL3IPpT7QGk8MpLOk5v4qnA0c3u7JZpsSEahJ7CTK5pWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543335001"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 7EB0A18000182;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CE5B6CBF234; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 06/12] curl: fix CVE-2026-92386
Date: Tue,  3 Nov 2026 23:36:21 -0800
Message-Id: <20261104073627.302002-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249341
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Include the upstream correction [3] to accept every cookie-jar record
that curl can serialize. The original MAX_COOKIE_LINE + 48 allowance
is too small for long paths and domains. Keep both commits in separate
patches and include the test1902/lib1902.c regression coverage.

[1] https://github.com/curl/curl/commit/445aa87e13f91c94bc742f54343a2eac924e1765
[2] https://curl.se/docs/CVE-2026-92386.html
[3] https://github.com/curl/curl/commit/7d64440abba37e3d8039fe663d3edc84f582ce92

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92386_p1.patch         |  33 ++++
 .../curl/curl/CVE-2026-92386_p2.patch         | 146 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch
new file mode 100644
index 00000000000..69fcedd4faf
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92386_p1.patch
@@ -0,0 +1,33 @@
+From 445aa87e13f91c94bc742f54343a2eac924e1765 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 11:09:18 +0200
+Subject: [PATCH] cookie: accept slightly longer lines in cookie jars
+
+Closes #22964
+
+CVE: CVE-2026-92386
+Upstream-Status: Backport [https://github.com/curl/curl/commit/445aa87e13f91c94bc742f54343a2eac924e1765]
+
+(cherry picked from commit 445aa87e13f91c94bc742f54343a2eac924e1765)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 8d9acf1..b88ff56 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1115,7 +1115,9 @@ static CURLcode cookie_load(struct Curl_easy *data, const char *file,
+   if(fp) {
+     struct dynbuf buf;
+     bool eof = FALSE;
+-    curlx_dyn_init(&buf, MAX_COOKIE_LINE);
++    /* accept a little longer lines so that a full cookie fits and does not
++       abort the file read */
++    curlx_dyn_init(&buf, MAX_COOKIE_LINE + 48);
+     do {
+       result = Curl_get_line(&buf, fp, &eof);
+       if(!result) {
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
new file mode 100644
index 00000000000..4228387ae63
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
@@ -0,0 +1,146 @@
+From 7d64440abba37e3d8039fe663d3edc84f582ce92 Mon Sep 17 00:00:00 2001
+From: Zheng Yu <dataisland@outlook.com>
+Date: Wed, 14 Oct 2026 18:13:59 -0700
+Subject: [PATCH] cookie: reload complete self-generated cookie jar rows
+
+Closes #23407
+
+CVE: CVE-2026-92386
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7d64440abba37e3d8039fe663d3edc84f582ce92]
+
+Backport Changes:
+- Match the two spaces before URL in the deleted CURLOPT_COOKIEJAR
+  line in lib1902.c; upstream's deleted line uses one space.
+
+(cherry picked from commit 7d64440abba37e3d8039fe663d3edc84f582ce92)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c            |  9 ++++++---
+ tests/data/test1902     |  5 ++++-
+ tests/libtest/lib1902.c | 39 ++++++++++++++++++++++++++++++++++-----
+ 3 files changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index b88ff56..de40297 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -37,6 +37,7 @@
+ #include "curl_memrchr.h"
+ #include "parsedate.h"
+ #include "curlx/strdup.h"
++#include "curlx/dynbuf.h"
+ #include "llist.h"
+ #include "curlx/strparse.h"
+ 
+@@ -1115,9 +1116,11 @@ static CURLcode cookie_load(struct Curl_easy *data, const char *file,
+   if(fp) {
+     struct dynbuf buf;
+     bool eof = FALSE;
+-    /* accept a little longer lines so that a full cookie fits and does not
+-       abort the file read */
+-    curlx_dyn_init(&buf, MAX_COOKIE_LINE + 48);
++    /* get_netscape_format() uses curl_maprintf(), which returns at most
++       DYN_APRINTF - 1 bytes. cookie_output() adds a newline (CRLF on Windows),
++       and this dynbuf needs one more byte for its null-terminator. This is a
++       cap, not an allocation. */
++    curlx_dyn_init(&buf, DYN_APRINTF + 2);
+     do {
+       result = Curl_get_line(&buf, fp, &eof);
+       if(!result) {
+diff --git a/tests/data/test1902 b/tests/data/test1902
+index a794fd4..876384d 100644
+--- a/tests/data/test1902
++++ b/tests/data/test1902
+@@ -3,6 +3,7 @@
+ <info>
+ <keywords>
+ cookies
++cookiejar
+ </keywords>
+ </info>
+ 
+@@ -10,7 +11,7 @@ cookies
+ <client>
+ 
+ <name>
+-set COOKIEFILE and COOKIEJAR but make no transfer
++reload a long cookie jar line without a transfer
+ </name>
+ <features>
+ cookies
+@@ -27,6 +28,7 @@ lib%TESTNUMBER
+ # https://curl.se/docs/http-cookies.html
+ # This file was generated by libcurl! Edit at your own risk.
+ 
++example.com	FALSE	/%repeat[6000 x q]%	FALSE	0	long	value
+ example.com	FALSE	/	FALSE	0	has_js	1
+ </file>
+ </client>
+@@ -38,6 +40,7 @@ example.com	FALSE	/	FALSE	0	has_js	1
+ # https://curl.se/docs/http-cookies.html
+ # This file was generated by libcurl! Edit at your own risk.
+ 
++example.com	FALSE	/%repeat[6000 x q]%	FALSE	0	long	value
+ example.com	FALSE	/	FALSE	0	has_js	1
+ </file>
+ </verify>
+diff --git a/tests/libtest/lib1902.c b/tests/libtest/lib1902.c
+index da3b23a..4af6249 100644
+--- a/tests/libtest/lib1902.c
++++ b/tests/libtest/lib1902.c
+@@ -27,19 +27,48 @@ static CURLcode test_lib1902(const char *URL)
+ {
+   CURLcode result = CURLE_OK;
+   CURL *curl;
++  struct curl_slist *cookies = NULL;
++  struct curl_slist *cookie;
++  bool long_found = FALSE;
++  bool short_found = FALSE;
++  size_t count = 0;
+ 
+   curl_global_init(CURL_GLOBAL_ALL);
+ 
+   curl = curl_easy_init();
+-  if(curl) {
+-    easy_setopt(curl, CURLOPT_COOKIEFILE, URL);
+-    easy_setopt(curl, CURLOPT_COOKIEJAR,  URL);
++  if(!curl) {
++    result = TEST_ERR_EASY_INIT;
++    goto test_cleanup;
++  }
++  easy_setopt(curl, CURLOPT_COOKIEFILE, URL);
++  easy_setopt(curl, CURLOPT_COOKIEJAR, URL);
++
++  /* The original case: no transfer means no cookie jar write. */
++  curl_easy_cleanup(curl);
++  curl = curl_easy_init();
++  if(!curl) {
++    result = TEST_ERR_EASY_INIT;
++    goto test_cleanup;
++  }
+ 
+-    /* Do not perform any actual network operation,
+-       the issue occur when not calling curl.*perform */
++  /* Explicitly reload the same jar, also without starting a transfer. */
++  easy_setopt(curl, CURLOPT_COOKIEFILE, URL);
++  easy_setopt(curl, CURLOPT_COOKIELIST, "RELOAD");
++  result = curl_easy_getinfo(curl, CURLINFO_COOKIELIST, &cookies);
++  if(result)
++    goto test_cleanup;
++  for(cookie = cookies; cookie; cookie = cookie->next) {
++    if(strstr(cookie->data, "\tlong\tvalue"))
++      long_found = strlen(cookie->data) > 5048;
++    if(strstr(cookie->data, "\thas_js\t1"))
++      short_found = TRUE;
++    count++;
+   }
++  if(count != 2 || !long_found || !short_found)
++    result = TEST_ERR_FAILURE;
+ 
+ test_cleanup:
++  curl_slist_free_all(cookies);
+   curl_easy_cleanup(curl);
+   curl_global_cleanup();
+   return result;
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 7749c1907f9..3e804a26f3a 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -53,6 +53,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87862.patch \
            file://CVE-2026-92387.patch \
            file://CVE-2026-86412.patch \
+           file://CVE-2026-92386_p1.patch \
+           file://CVE-2026-92386_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
