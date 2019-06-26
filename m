Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3C47BD97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y15so1664298pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iOFBc0XB0GXF07wISSTuPG3NV6t6CVL8/6ZRWJXzS7E=;
	b=KQ3oYUvoUzr9a2bGcULMKI143SLgL6Y/wT56wcKebfJR/LkRszj100k8tSa7nD9IzJ
	diLQ0jeu7vjvWNQITUMScWBhDgNCA0lGM1+Bb1nrCzrE8loTMOPxqQKz7ChWAFQngoxt
	xCPJkP84ryrnKgULygm0paBYdNKlIUMN1sbDRtYce7L5+/d8dUUUoS2kgIsGsHHhBNXT
	VH+Cl9vCH4lMYUUaQHWKsmcpwfFshWX6rItEVPYRiiksM6coGX4rOKp3+V2ESPlOMCeu
	4VfcwOws8eaOH4wrJTV817byokk7+HuLUP9zlYszr5ueRLQPsChqA3/iSDZ7cS3FAhmk
	F7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iOFBc0XB0GXF07wISSTuPG3NV6t6CVL8/6ZRWJXzS7E=;
	b=jO+gIoqdyFgy4OpgbYfLNMj3cQ0PdTddYCUUPhmyTCq5MdgbnPpevJHf+BB/MBrXuc
	2Iuj/lnHcruhCWEGjdj2ENdHWe2g8D+3P0G/OEibjjBc+dNzpnQ/1oWke3GoyK/+AL+d
	5FEoze2vmwmr5G/zAhO3tJHgBgwvoWAmwCv6x+MOrzCPsi2axb0k1wlXYbHPS3iWh0H8
	6rXtpaYUkIOobrDwbgK2Jos8lGYb+8ZljSPn31xc2W1GGyYztmCw0gZOYonBXdWqocYf
	VMYj1tW6aUk4vWIPwsVSBsGWo0QknZqpGcHRamz+piqSPsFIarV68rlN+uF0FDMt7Iji
	8wxw==
X-Gm-Message-State: APjAAAVAsgrS/BUKt6hEA3rm5R+jBgy3ubBY3PUITEBXmyY7NU2V/t7H
	WcTESwPgNoRDnWO1If9I7aQw3g5VPGU=
X-Google-Smtp-Source: APXvYqwune1wZS1bIBQFs/0OsAl0CgqL09vATwkqlTIHYKo4L3jhjPLG1FoQLojYalR8Zxd6PE3yBw==
X-Received: by 2002:a17:90a:342c:: with SMTP id o41mr39353pjb.1.1561568036233; 
	Wed, 26 Jun 2019 09:53:56 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:22 -0700
Message-Id: <9d5a7dd654a17b67f5cd8a73145e5f5299bfebcc.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 21/25] Curl: Securiyt fix CVE-2019-5435 CVE-2019-5436
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 16:53:55 -0000

From: Armin Kuster <akuster@mvista.com>

Source: CUrl.org
MR: 98455
Type: Security Fix
Disposition: Backport from https://curl.haxx.se/
ChangeID: 86b094a440ea473b114764e8d64df8142d561609
Description:

Fixes CVE-2019-5435 CVE-2019-5436

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5435.patch | 200 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2019-5436.patch |  32 ++++
 meta/recipes-support/curl/curl_7.61.0.bb           |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5435.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5436.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5435.patch b/meta/recipes-support/curl/curl/CVE-2019-5435.patch
new file mode 100644
index 0000000..8ac5554
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5435.patch
@@ -0,0 +1,200 @@
+From 5fc28510a4664f46459d9a40187d81cc08571e60 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Apr 2019 08:00:49 +0200
+Subject: [PATCH] CURL_MAX_INPUT_LENGTH: largest acceptable string input size
+
+This limits all accepted input strings passed to libcurl to be less than
+CURL_MAX_INPUT_LENGTH (8000000) bytes, for these API calls:
+curl_easy_setopt() and curl_url_set().
+
+The 8000000 number is arbitrary picked and is meant to detect mistakes
+or abuse, not to limit actual practical use cases. By limiting the
+acceptable string lengths we also reduce the risk of integer overflows
+all over.
+
+NOTE: This does not apply to `CURLOPT_POSTFIELDS`.
+
+Test 1559 verifies.
+
+Closes #3805
+
+Upstream-Status: Backport
+Dropped a few changes to apply against this version
+https://github.com/curl/curl/commit/5fc28510a4664f4
+
+CVE: CVE-2019-5435
+affects: libcurl 7.19.4 to and including 7.64.1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/setopt.c               |  7 +++++
+ lib/urldata.h              |  4 +++
+ 7 files changed, 146 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1559
+ create mode 100644 tests/libtest/lib1559.c
+
+Index: curl-7.61.0/lib/setopt.c
+===================================================================
+--- curl-7.61.0.orig/lib/setopt.c
++++ curl-7.61.0/lib/setopt.c
+@@ -60,6 +60,13 @@ CURLcode Curl_setstropt(char **charp, co
+   if(s) {
+     char *str = strdup(s);
+ 
++    if(str) {
++      size_t len = strlen(str);
++      if(len > CURL_MAX_INPUT_LENGTH) {
++        free(str);
++        return CURLE_BAD_FUNCTION_ARGUMENT;
++      }
++    }
+     if(!str)
+       return CURLE_OUT_OF_MEMORY;
+ 
+Index: curl-7.61.0/lib/urldata.h
+===================================================================
+--- curl-7.61.0.orig/lib/urldata.h
++++ curl-7.61.0/lib/urldata.h
+@@ -79,6 +79,10 @@
+ */
+ #define RESP_TIMEOUT (1800*1000)
+ 
++/* Max string intput length is a precaution against abuse and to detect junk
++   input easier and better. */
++#define CURL_MAX_INPUT_LENGTH 8000000
++
+ #include "cookie.h"
+ #include "psl.h"
+ #include "formdata.h"
+Index: curl-7.61.0/tests/data/test1559
+===================================================================
+--- /dev/null
++++ curl-7.61.0/tests/data/test1559
+@@ -0,0 +1,44 @@
++<testcase>
++<info>
++<keywords>
++CURLOPT_URL
++</keywords>
++</info>
++
++<reply>
++</reply>
++
++<client>
++<server>
++none
++</server>
++
++# require HTTP so that CURLOPT_POSTFIELDS works as assumed
++<features>
++http
++</features>
++<tool>
++lib1559
++</tool>
++
++<name>
++Set excessive URL lengths
++</name>
++</client>
++
++#
++# Verify that the test runs to completion without crashing
++<verify>
++<errorcode>
++0
++</errorcode>
++<stdout>
++CURLOPT_URL 10000000 bytes URL == 43
++CURLOPT_POSTFIELDS 10000000 bytes data == 0
++CURLUPART_URL 10000000 bytes URL == 3
++CURLUPART_SCHEME 10000000 bytes scheme == 3
++CURLUPART_USER 10000000 bytes user == 3
++</stdout>
++</verify>
++
++</testcase>
+Index: curl-7.61.0/tests/libtest/lib1559.c
+===================================================================
+--- /dev/null
++++ curl-7.61.0/tests/libtest/lib1559.c
+@@ -0,0 +1,78 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.haxx.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ ***************************************************************************/
++#include "test.h"
++
++#include "testutil.h"
++#include "warnless.h"
++#include "memdebug.h"
++
++#define EXCESSIVE 10*1000*1000
++int test(char *URL)
++{
++  CURLcode res = 0;
++  CURL *curl = NULL;
++  char *longurl = malloc(EXCESSIVE);
++  CURLU *u;
++  (void)URL;
++
++  memset(longurl, 'a', EXCESSIVE);
++  longurl[EXCESSIVE-1] = 0;
++
++  global_init(CURL_GLOBAL_ALL);
++  easy_init(curl);
++
++  res = curl_easy_setopt(curl, CURLOPT_URL, longurl);
++  printf("CURLOPT_URL %d bytes URL == %d\n",
++         EXCESSIVE, (int)res);
++
++  res = curl_easy_setopt(curl, CURLOPT_POSTFIELDS, longurl);
++  printf("CURLOPT_POSTFIELDS %d bytes data == %d\n",
++         EXCESSIVE, (int)res);
++
++  u = curl_url();
++  if(u) {
++    CURLUcode uc = curl_url_set(u, CURLUPART_URL, longurl, 0);
++    printf("CURLUPART_URL %d bytes URL == %d\n",
++           EXCESSIVE, (int)uc);
++    uc = curl_url_set(u, CURLUPART_SCHEME, longurl, CURLU_NON_SUPPORT_SCHEME);
++    printf("CURLUPART_SCHEME %d bytes scheme == %d\n",
++           EXCESSIVE, (int)uc);
++    uc = curl_url_set(u, CURLUPART_USER, longurl, 0);
++    printf("CURLUPART_USER %d bytes user == %d\n",
++           EXCESSIVE, (int)uc);
++    curl_url_cleanup(u);
++  }
++
++  free(longurl);
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return 0;
++
++test_cleanup:
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return res; /* return the final return code */
++}
diff --git a/meta/recipes-support/curl/curl/CVE-2019-5436.patch b/meta/recipes-support/curl/curl/CVE-2019-5436.patch
new file mode 100644
index 0000000..05fd8e9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5436.patch
@@ -0,0 +1,32 @@
+From 2576003415625d7b5f0e390902f8097830b82275 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 3 May 2019 22:20:37 +0200
+Subject: [PATCH] tftp: use the current blksize for recvfrom()
+
+bug: https://curl.haxx.se/docs/CVE-2019-5436.html
+Reported-by: l00p3r on hackerone
+CVE-2019-5436
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/2576003415625d7b5f0e390902f8097830b82275
+CVE: CVE-2019-5436
+affects: libcurl 7.19.4 to and including 7.64.1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/tftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: curl-7.61.0/lib/tftp.c
+===================================================================
+--- curl-7.61.0.orig/lib/tftp.c
++++ curl-7.61.0/lib/tftp.c
+@@ -1005,7 +1005,7 @@ static CURLcode tftp_connect(struct conn
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = TFTP_BLKSIZE_DEFAULT;
++  state->blksize = blksize;
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 56327a6..1027f75 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2018-16839.patch \
            file://CVE-2018-16840.patch \
            file://CVE-2018-16842.patch \
+           file://CVE-2019-5435.patch \
+           file://CVE-2019-5436.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.7.4


