Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1219.1793949576440671950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BJ9koAsf;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7313; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nssQ8Wso8i12nBne3miY76Auy5XAdB3NXsyMPSU2tQE=;
  b=BJ9koAsfgRYtoy9+cSLW24NyW0+8EBueX6IZGaeiv9eLd3awg7Bxl2u7
   ZmNtCRRXMRyOSURwNGBMBYFz2kYmgQ21WnNDV6QgLAJotJaB1rCPWan0/
   NDsRpw6+7/LkgdZPuVB5ViaEoEkfOnRJWrFEWI7rc7/uAVebhRGysy2hV
   VcQmnu0Bf000aGE1Zqo1I9m8n7S+VYqlGFFa17DfHiwOzDLHHvQfuv6Zl
   ErPehevNr9si4eDEbzJReCzX9a2nTyVP0ShPp8AG9qXImXvsEq8l4Os/9
   w3M6ouXNxAkFr/10vOWOndK48ql6PIiTQE+RJ0dnADhj2FZwGQpH3+qx8
   g==;
X-CSE-ConnectionGUID: 5RXvW9f6Teu/IcRW8zStuA==
X-CSE-MsgGUID: THdPAv0UQ1ewjO6rr3p/ig==
X-IPAS-Result: =?us-ascii?q?A0DQAgDtfu1q/5X/Ja1aglmCV3VgQ0mWSwOeIRSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGBcQEggnMCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8Nd4ZjiDgBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGu?=
 =?us-ascii?q?zgbN4F5M4EBgykBPwICQAFQ2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVg2mBB?=
 =?us-ascii?q?YFcAgGBIocDBIIigQyBWh5lCYwMAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+G?=
 =?us-ascii?q?wovGA1IESw3FRkEPm4Hkj2DEjEMIwEhDAETFgIvgg4pklcdB5AggiGBNZ9cC?=
 =?us-ascii?q?iiDeIwklToaM4VbpRYLmH2OCpYETYRpgWg8gVlwFYMiCRY0GQ+OLgsLgXiBa?=
 =?us-ascii?q?IZAxgUmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:yBKxn6Mk7gCR1LTvrR30lsFynXyQoLVcMsEvi/4bfWQNrUpx1DYDy
 TAWDDvXa/iPZDSgfIslb4q/8RkBsJbRmIUyG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66hUPF8JbINGxutqRkBFz
 8NIOgsRcznW0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsjOS2b4WFJobiqcN9omaUn
 kvYp1nAWxwFNvvB0yDe6jWtibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:4MKVEK6UwG+D7hLtAAPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:4P7HwmED1q1xlK4GqmI6zn4KJZErLEHQ0TDxKHWHWXRSVKC8HAo=
X-Talos-MUID: 9a23:pwKV/gucFjVjFdLM1M2nuBFuDO52u5mXUU0Sk7JYodPfLWtxNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544377842"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 454AD18000326;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E0600CBF201; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/9] curl: fix CVE-2026-92391
Date: Thu,  5 Nov 2026 23:19:24 -0800
Message-Id: <20261106071932.490299-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249600
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Avoid recursive cleanup of deeply nested MIME structures. Retain
upstream test3595 and register its helper in the older grouped test
lists.

[1] https://github.com/curl/curl/commit/d7546809d5bd548b69ec49fca26565c8f6f0d344
[2] https://curl.se/docs/CVE-2026-92391.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92391.patch            | 203 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92391.patch b/meta/recipes-support/curl/curl/CVE-2026-92391.patch
new file mode 100644
index 0000000000..4b952050f1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92391.patch
@@ -0,0 +1,203 @@
+From d7546809d5bd548b69ec49fca26565c8f6f0d344 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 13 Sep 2026 00:06:44 +0200
+Subject: [PATCH] mime: do curl_mime_free() non-recursively
+
+Verify with test 3595: deeply nested curl_mime_free()
+
+Closes #22927
+
+CVE: CVE-2026-92391
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d7546809d5bd548b69ec49fca26565c8f6f0d344]
+
+Backport Changes:
+- Register test3595 and lib3595.c in the older grouped TESTCASES and
+  TESTS_C lists instead of upstream's one-entry-per-line layout.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/mime.c                 | 28 +++++++++++----
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test3595        | 21 ++++++++++++
+ tests/libtest/Makefile.inc |  3 +-
+ tests/libtest/lib3595.c    | 70 ++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 116 insertions(+), 8 deletions(-)
+ create mode 100644 tests/data/test3595
+ create mode 100644 tests/libtest/lib3595.c
+
+diff --git a/lib/mime.c b/lib/mime.c
+index 37ea514..3da989b 100644
+--- a/lib/mime.c
++++ b/lib/mime.c
+@@ -1078,20 +1078,36 @@ void Curl_mime_cleanpart(curl_mimepart *part)
+   }
+ }
+ 
+-/* Recursively delete a mime handle and its parts. */
++/* Non-recursively delete a mime handle and its parts. */
+ void curl_mime_free(curl_mime *mime)
+ {
+   curl_mimepart *part;
+ 
+-  if(mime) {
+-    mime_subparts_unbind(mime);  /* Be sure it is not referenced anymore. */
+-    while(mime->firstpart) {
+-      part = mime->firstpart;
++  if(!mime)
++    return;
++
++  mime_subparts_unbind(mime);  /* Be sure it is not referenced anymore. */
++
++  while(mime) {
++    part = mime->firstpart;
++    if(part) {
+       mime->firstpart = part->nextpart;
++      if(part->kind == MIMEKIND_MULTIPART && part->arg &&
++         part->freefunc == mime_subparts_free) {
++        curl_mime *subparts = (curl_mime *)part->arg;
++        part->freefunc = NULL;
++        cleanup_part_content(part);
++        subparts->parent = mime->parent;
++        mime->parent = (curl_mimepart *)subparts;
++      }
+       Curl_mime_cleanpart(part);
+       curlx_free(part);
+     }
+-    curlx_free(mime);
++    else {
++      curl_mime *parent = (curl_mime *)mime->parent;
++      curlx_free(mime);
++      mime = parent;
++    }
+   }
+ }
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 7a9b8d0..933c3c7 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -287,7 +287,7 @@ test3209 test3210 test3211 test3212 test3213 test3214 test3215 test3216 \
+ \
+ test3303 test3304 \
+ \
+-test3500 \
++test3500 test3595 \
+ \
+ test4000 test4001
+ 
+diff --git a/tests/data/test3595 b/tests/data/test3595
+new file mode 100644
+index 0000000..b2b1dd2
+--- /dev/null
++++ b/tests/data/test3595
+@@ -0,0 +1,21 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++mime
++</keywords>
++</info>
++
++# Client-side
++<client>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++curl_mime_free
++</name>
++</client>
++
++<verify>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index d7af26f..e494189 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -118,4 +118,5 @@ TESTS_C = \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+-  lib3207.c lib3208.c
++  lib3207.c lib3208.c \
++  lib3595.c
+diff --git a/tests/libtest/lib3595.c b/tests/libtest/lib3595.c
+new file mode 100644
+index 0000000..1f343f5
+--- /dev/null
++++ b/tests/libtest/lib3595.c
+@@ -0,0 +1,70 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++#include "unitcheck.h"
++
++static CURLcode test_lib3595(const char *arg)
++{
++  UNITTEST_BEGIN_SIMPLE
++
++#if !defined(CURL_DISABLE_MIME) &&                                      \
++  (!defined(CURL_DISABLE_HTTP) ||                                       \
++   !defined(CURL_DISABLE_SMTP) ||                                       \
++   !defined(CURL_DISABLE_IMAP))
++
++  curl_mime *root = NULL;
++  curl_mime *current = NULL;
++  curl_mime *sub = NULL;
++  curl_mimepart *part = NULL;
++  int i;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  /* Create a deeply nested mime structure to verify that non-recursive
++     curl_mime_free works properly. */
++  (void)arg;
++  root = curl_mime_init(NULL);
++  fail_unless(root != NULL, "curl_mime_init root failed");
++  current = root;
++
++  for(i = 0; i < 50; i++) {
++    part = curl_mime_addpart(current);
++    fail_unless(part != NULL, "curl_mime_addpart failed");
++    sub = curl_mime_init(NULL);
++    fail_unless(sub != NULL, "curl_mime_init sub failed");
++    curl_mime_subparts(part, sub);
++    current = sub;
++  }
++
++  /* Free deep structure */
++  curl_mime_free(root);
++  curl_global_cleanup();
++#else
++  (void)arg;
++#endif
++
++  UNITTEST_END_SIMPLE
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index f2de4dfa04..20dbeb9dfd 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92389.patch \
            file://CVE-2026-87865_p1.patch \
            file://CVE-2026-87865_p2.patch \
+           file://CVE-2026-92391.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
