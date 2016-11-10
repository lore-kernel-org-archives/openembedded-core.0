Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.40])
	by mail.openembedded.org (Postfix) with ESMTP id 97813606CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:23:38 +0000 (UTC)
Received: from 1c4la6-0004rq-U0 by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c4la6-0004sm-UT
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2016 01:23:38 -0800
Received: by emcmailer; Thu, 10 Nov 2016 01:23:38 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c4la6-0004rq-U0
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2016 01:23:38 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 10 Nov 2016 10:23:37 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 10:23:35 +0100
Message-ID: <1478769815-54819-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCHv2][krogoth] curl: fix multiple CVEs
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
X-List-Received-Date: Thu, 10 Nov 2016 09:23:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CVE-2016-8615: cookie injection for other servers
CVE-2016-8616: case insensitive password comparison
CVE-2016-8617: OOB write via unchecked multiplication
CVE-2016-8618: double-free in curl_maprintf
CVE-2016-8619: double-free in krb5 code
CVE-2016-8620: glob parser write/read out of bounds
CVE-2016-8621: curl_getdate read out of bounds
CVE-2016-8622: URL unescape heap overflow via integer truncation
CVE-2016-8623: Use-after-free via shared cookies
CVE-2016-8624: invalid URL parsing with '#'
CVE-2016-8625: IDNA 2003 makes curl use wrong host

[url-remove-unconditional-idn2.h-include.patch is needed
for CVE-2016-8625]

Reference:
https://curl.haxx.se/docs/security.html

Fixes [Yocto #10617]

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8615.patch |  70 +++
 meta/recipes-support/curl/curl/CVE-2016-8616.patch |  50 ++
 meta/recipes-support/curl/curl/CVE-2016-8617.patch |  29 +
 meta/recipes-support/curl/curl/CVE-2016-8618.patch |  49 ++
 meta/recipes-support/curl/curl/CVE-2016-8619.patch |  49 ++
 meta/recipes-support/curl/curl/CVE-2016-8620.patch |  47 ++
 meta/recipes-support/curl/curl/CVE-2016-8621.patch | 104 ++++
 meta/recipes-support/curl/curl/CVE-2016-8622.patch |  95 ++++
 meta/recipes-support/curl/curl/CVE-2016-8623.patch | 174 ++++++
 meta/recipes-support/curl/curl/CVE-2016-8624.patch |  55 ++
 meta/recipes-support/curl/curl/CVE-2016-8625.patch | 593 +++++++++++++++++++++
 .../url-remove-unconditional-idn2.h-include.patch  |  29 +
 meta/recipes-support/curl/curl_7.47.1.bb           |  12 +
 13 files changed, 1356 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8615.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8616.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8617.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8618.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8619.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8620.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8621.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8622.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8623.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8624.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8625.patch
 create mode 100644 meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8615.patch b/meta/recipes-support/curl/curl/CVE-2016-8615.patch
new file mode 100644
index 0000000..95070f4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8615.patch
@@ -0,0 +1,70 @@
+From cff89bc088b7884098ea0c5378bbda3d49c437bc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Sep 2016 17:36:19 +0200
+Subject: [PATCH] cookie: replace use of fgets() with custom version
+
+... that will ignore lines that are too long to fit in the buffer.
+
+CVE: CVE-2016-8615
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102A.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/cookie.c | 31 ++++++++++++++++++++++++++++++-
+ 1 file changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4932ab1..1b3e645 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -902,6 +902,35 @@ Curl_cookie_add(struct Curl_easy *data,
+   return co;
+ }
+ 
++/*
++ * get_line() makes sure to only return complete whole lines that fit in 'len'
++ * bytes and end with a newline.
++ */
++static char *get_line(char *buf, int len, FILE *input)
++{
++  bool partial = FALSE;
++  while(1) {
++    char *b = fgets(buf, len, input);
++    if(b) {
++      size_t rlen = strlen(b);
++      if(rlen && (b[rlen-1] == '\n')) {
++        if(partial) {
++          partial = FALSE;
++          continue;
++        }
++        return b;
++      }
++      else
++        /* read a partial, discard the next piece that ends with newline */
++        partial = TRUE;
++    }
++    else
++      break;
++  }
++  return NULL;
++}
++
++
+ /*****************************************************************************
+  *
+  * Curl_cookie_init()
+@@ -958,7 +987,7 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     line = malloc(MAX_COOKIE_LINE);
+     if(!line)
+       goto fail;
+-    while(fgets(line, MAX_COOKIE_LINE, fp)) {
++    while(get_line(line, MAX_COOKIE_LINE, fp)) {
+       if(checkprefix("Set-Cookie:", line)) {
+         /* This is a cookie line, get it! */
+         lineptr=&line[11];
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8616.patch b/meta/recipes-support/curl/curl/CVE-2016-8616.patch
new file mode 100644
index 0000000..2849d28
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8616.patch
@@ -0,0 +1,50 @@
+From b3ee26c5df75d97f6895e6ec4538894ebaf76e48 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Sep 2016 18:01:53 +0200
+Subject: [PATCH] connectionexists: use case sensitive user/password
+ comparisons
+
+CVE: CVE-2016-8616
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102B.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/lib/url.c b/lib/url.c
+--- a/lib/url.c	2016-11-07 08:50:23.030126833 +0100
++++ b/lib/url.c	2016-11-07 09:16:20.459836564 +0100
+@@ -3305,8 +3305,8 @@
+       if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
+         /* This protocol requires credentials per connection,
+            so verify that we're using the same name and password as well */
+-        if(!strequal(needle->user, check->user) ||
+-           !strequal(needle->passwd, check->passwd)) {
++        if(strcmp(needle->user, check->user) ||
++           strcmp(needle->passwd, check->passwd)) {
+           /* one of them was different */
+           continue;
+         }
+@@ -3369,8 +3369,8 @@
+            possible. (Especially we must not reuse the same connection if
+            partway through a handshake!) */
+         if(wantNTLMhttp) {
+-          if(!strequal(needle->user, check->user) ||
+-             !strequal(needle->passwd, check->passwd))
++          if(strcmp(needle->user, check->user) ||
++             strcmp(needle->passwd, check->passwd))
+             continue;
+         }
+         else if(check->ntlm.state != NTLMSTATE_NONE) {
+@@ -3380,8 +3380,8 @@
+ 
+         /* Same for Proxy NTLM authentication */
+         if(wantProxyNTLMhttp) {
+-          if(!strequal(needle->proxyuser, check->proxyuser) ||
+-             !strequal(needle->proxypasswd, check->proxypasswd))
++          if(strcmp(needle->proxyuser, check->proxyuser) ||
++             strcmp(needle->proxypasswd, check->proxypasswd))
+             continue;
+         }
+         else if(check->proxyntlm.state != NTLMSTATE_NONE) {
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8617.patch b/meta/recipes-support/curl/curl/CVE-2016-8617.patch
new file mode 100644
index 0000000..a9bb509
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8617.patch
@@ -0,0 +1,29 @@
+From efd24d57426bd77c9b5860e6b297904703750412 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 28 Sep 2016 00:05:12 +0200
+Subject: [PATCH] base64: check for integer overflow on large input
+
+CVE: CVE-2016-8617
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102C.html
+Reported-by: Cure53
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/lib/base64.c b/lib/base64.c
+--- a/lib/base64.c	2016-02-03 00:02:43.000000000 +0100
++++ b/lib/base64.c	2016-11-07 09:22:07.918167530 +0100
+@@ -190,6 +190,11 @@
+   if(0 == insize)
+     insize = strlen(indata);
+ 
++#if SIZEOF_SIZE_T == 4
++  if(insize > UINT_MAX/4)
++    return CURLE_OUT_OF_MEMORY;
++#endif
++
+   base64data = output = malloc(insize*4/3+4);
+   if(NULL == output)
+     return CURLE_OUT_OF_MEMORY;
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8618.patch b/meta/recipes-support/curl/curl/CVE-2016-8618.patch
new file mode 100644
index 0000000..57b3397
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8618.patch
@@ -0,0 +1,49 @@
+From 8732ec40db652c53fa58cd13e2acb8eab6e40874 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 28 Sep 2016 10:15:34 +0200
+Subject: [PATCH] aprintf: detect wrap-around when growing allocation
+
+On 32bit systems we could otherwise wrap around after 2GB and allocate 0
+bytes and crash.
+
+CVE: CVE-2016-8618
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102D.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/mprintf.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/lib/mprintf.c b/lib/mprintf.c
+index dbedeaa..2c88aa8 100644
+--- a/lib/mprintf.c
++++ b/lib/mprintf.c
+@@ -1036,16 +1036,19 @@ static int alloc_addbyter(int output, FILE *data)
+     infop->len =0;
+   }
+   else if(infop->len+1 >= infop->alloc) {
+-    char *newptr;
++    char *newptr = NULL;
++    size_t newsize = infop->alloc*2;
+ 
+-    newptr = realloc(infop->buffer, infop->alloc*2);
++    /* detect wrap-around or other overflow problems */
++    if(newsize > infop->alloc)
++      newptr = realloc(infop->buffer, newsize);
+ 
+     if(!newptr) {
+       infop->fail = 1;
+       return -1; /* fail */
+     }
+     infop->buffer = newptr;
+-    infop->alloc *= 2;
++    infop->alloc = newsize;
+   }
+ 
+   infop->buffer[ infop->len ] = outc;
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8619.patch b/meta/recipes-support/curl/curl/CVE-2016-8619.patch
new file mode 100644
index 0000000..13c67c2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8619.patch
@@ -0,0 +1,49 @@
+From 3d6460edeee21d7d790ec570d0887bed1f4366dd Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 28 Sep 2016 12:56:02 +0200
+Subject: [PATCH] krb5: avoid realloc(0)
+
+If the requested size is zero, bail out with error instead of doing a
+realloc() that would cause a double-free: realloc(0) acts as a free()
+and then there's a second free in the cleanup path.
+
+CVE: CVE-2016-8619
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102E.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/security.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/lib/security.c b/lib/security.c
+index a268d4a..4cef8f8 100644
+--- a/lib/security.c
++++ b/lib/security.c
+@@ -192,15 +192,18 @@ static CURLcode read_data(struct connectdata *conn,
+                           struct krb5buffer *buf)
+ {
+   int len;
+-  void* tmp;
++  void *tmp = NULL;
+   CURLcode result;
+ 
+   result = socket_read(fd, &len, sizeof(len));
+   if(result)
+     return result;
+ 
+-  len = ntohl(len);
+-  tmp = realloc(buf->data, len);
++  if(len) {
++    /* only realloc if there was a length */
++    len = ntohl(len);
++    tmp = realloc(buf->data, len);
++  }
+   if(tmp == NULL)
+     return CURLE_OUT_OF_MEMORY;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8620.patch b/meta/recipes-support/curl/curl/CVE-2016-8620.patch
new file mode 100644
index 0000000..9cea298
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8620.patch
@@ -0,0 +1,47 @@
+From fbb5f1aa0326d485d5a7ac643b48481897ca667f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 3 Oct 2016 17:27:16 +0200
+Subject: [PATCH] range: prevent negative end number in a glob range
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2016-8620
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102F.html
+Reported-by: Luật Nguyễn
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ src/tool_urlglob.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
+index a357b8b..64c75ba 100644
+--- a/src/tool_urlglob.c
++++ b/src/tool_urlglob.c
+@@ -257,6 +257,12 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
+         endp = NULL;
+       else {
+         pattern = endp+1;
++        while(*pattern && ISBLANK(*pattern))
++          pattern++;
++        if(!ISDIGIT(*pattern)) {
++          endp = NULL;
++          goto fail;
++        }
+         errno = 0;
+         max_n = strtoul(pattern, &endp, 10);
+         if(errno || (*endp == ':')) {
+@@ -277,6 +283,7 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
+       }
+     }
+ 
++    fail:
+     *posp += (pattern - *patternp);
+ 
+     if(!endp || (min_n > max_n) || (step_n > (max_n - min_n)) || !step_n)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8621.patch b/meta/recipes-support/curl/curl/CVE-2016-8621.patch
new file mode 100644
index 0000000..c05968e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8621.patch
@@ -0,0 +1,104 @@
+From 96a80b5a262fb6dd2ddcea7987296f3b9a405618 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 16:59:38 +0200
+Subject: [PATCH] parsedate: handle cut off numbers better
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+... and don't read outside of the given buffer!
+
+CVE: CVE-2016-8621
+
+Upstream-Status: Backport
+
+bug: https://curl.haxx.se/docs/adv_20161102G.html
+Reported-by: Luật Nguyễn
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/parsedate.c        | 12 +++++++-----
+ tests/data/test517     |  6 ++++++
+ tests/libtest/lib517.c |  8 +++++++-
+ 3 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/lib/parsedate.c b/lib/parsedate.c
+index dfcf855..8e932f4 100644
+--- a/lib/parsedate.c
++++ b/lib/parsedate.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -386,15 +386,17 @@ static int parsedate(const char *date, time_t *output)
+       /* a digit */
+       int val;
+       char *end;
++      int len=0;
+       if((secnum == -1) &&
+-         (3 == sscanf(date, "%02d:%02d:%02d", &hournum, &minnum, &secnum))) {
++         (3 == sscanf(date, "%02d:%02d:%02d%n",
++                      &hournum, &minnum, &secnum, &len))) {
+         /* time stamp! */
+-        date += 8;
++        date += len;
+       }
+       else if((secnum == -1) &&
+-              (2 == sscanf(date, "%02d:%02d", &hournum, &minnum))) {
++              (2 == sscanf(date, "%02d:%02d%n", &hournum, &minnum, &len))) {
+         /* time stamp without seconds */
+-        date += 5;
++        date += len;
+         secnum = 0;
+       }
+       else {
+diff --git a/tests/data/test517 b/tests/data/test517
+index c81a45e..513634f 100644
+--- a/tests/data/test517
++++ b/tests/data/test517
+@@ -116,6 +116,12 @@ nothing
+ 81: 20111323 12:34:56 => -1
+ 82: 20110623 12:34:79 => -1
+ 83: Wed, 31 Dec 2008 23:59:60 GMT => 1230768000
++84: 20110623 12:3 => 1308830580
++85: 20110623 1:3 => 1308790980
++86: 20110623 1:30 => 1308792600
++87: 20110623 12:12:3 => 1308831123
++88: 20110623 01:12:3 => 1308791523
++89: 20110623 01:99:30 => -1
+ </stdout>
+ 
+ # This test case previously tested an overflow case ("2094 Nov 6 =>
+diff --git a/tests/libtest/lib517.c b/tests/libtest/lib517.c
+index 2f68ebd..22162ff 100644
+--- a/tests/libtest/lib517.c
++++ b/tests/libtest/lib517.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -116,6 +116,12 @@ static const char * const dates[]={
+   "20111323 12:34:56",
+   "20110623 12:34:79",
+   "Wed, 31 Dec 2008 23:59:60 GMT", /* leap second */
++  "20110623 12:3",
++  "20110623 1:3",
++  "20110623 1:30",
++  "20110623 12:12:3",
++  "20110623 01:12:3",
++  "20110623 01:99:30",
+   NULL
+ };
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8622.patch b/meta/recipes-support/curl/curl/CVE-2016-8622.patch
new file mode 100644
index 0000000..aedc85b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8622.patch
@@ -0,0 +1,95 @@
+From 53e71e47d6b81650d26ec33a58d0dca24c7ffb2c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 18:56:45 +0200
+Subject: [PATCH] unescape: avoid integer overflow
+
+CVE: CVE-2016-8622
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102H.html
+Reported-by: Cure53
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/docs/libcurl/curl_easy_unescape.3 b/docs/libcurl/curl_easy_unescape.3
+--- a/docs/libcurl/curl_easy_unescape.3	2016-02-03 00:08:02.000000000 +0100
++++ b/docs/libcurl/curl_easy_unescape.3	2016-11-07 09:25:45.999933275 +0100
+@@ -5,7 +5,7 @@
+ .\" *                            | (__| |_| |  _ <| |___
+ .\" *                             \___|\___/|_| \_\_____|
+ .\" *
+-.\" * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
++.\" * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+ .\" *
+ .\" * This software is licensed as described in the file COPYING, which
+ .\" * you should have received as part of this distribution. The terms
+@@ -40,7 +40,10 @@
+ 
+ If \fBoutlength\fP is non-NULL, the function will write the length of the
+ returned string in the integer it points to. This allows an escaped string
+-containing %00 to still get used properly after unescaping.
++containing %00 to still get used properly after unescaping. Since this is a
++pointer to an \fIint\fP type, it can only return a value up to INT_MAX so no
++longer string can be unescaped if the string length is returned in this
++parameter.
+ 
+ You must \fIcurl_free(3)\fP the returned string when you're done with it.
+ .SH AVAILABILITY
+diff -ruN a/lib/dict.c b/lib/dict.c
+--- a/lib/dict.c	2016-02-03 00:02:44.000000000 +0100
++++ b/lib/dict.c	2016-11-07 09:25:45.999933275 +0100
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -52,7 +52,7 @@
+ #include <curl/curl.h>
+ #include "transfer.h"
+ #include "sendf.h"
+-
++#include "escape.h"
+ #include "progress.h"
+ #include "strequal.h"
+ #include "dict.h"
+@@ -96,12 +96,12 @@
+   char *newp;
+   char *dictp;
+   char *ptr;
+-  int len;
++  size_t len;
+   char ch;
+   int olen=0;
+ 
+-  newp = curl_easy_unescape(data, inputbuff, 0, &len);
+-  if(!newp)
++  CURLcode result = Curl_urldecode(data, inputbuff, 0, &newp, &len, FALSE);
++  if(!newp || result)
+     return NULL;
+ 
+   dictp = malloc(((size_t)len)*2 + 1); /* add one for terminating zero */
+diff -ruN a/lib/escape.c b/lib/escape.c
+--- a/lib/escape.c	2016-02-05 10:02:03.000000000 +0100
++++ b/lib/escape.c	2016-11-07 09:29:43.073671606 +0100
+@@ -217,8 +217,14 @@
+                                 FALSE);
+   if(res)
+     return NULL;
+-  if(olen)
+-    *olen = curlx_uztosi(outputlen);
++
++    if(olen) {
++      if(outputlen <= (size_t) INT_MAX)
++        *olen = curlx_uztosi(outputlen);
++      else
++        /* too large to return in an int, fail! */
++        Curl_safefree(str);
++    }
+   return str;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8623.patch b/meta/recipes-support/curl/curl/CVE-2016-8623.patch
new file mode 100644
index 0000000..e791ecd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8623.patch
@@ -0,0 +1,174 @@
+From c5be3d7267c725dbd093ff3a883e07ee8cf2a1d5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 23:26:13 +0200
+Subject: [PATCH] cookies: getlist() now holds deep copies of all cookies
+
+Previously it only held references to them, which was reckless as the
+thread lock was released so the cookies could get modified by other
+handles that share the same cookie jar over the share interface.
+
+CVE: CVE-2016-8623
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102I.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/cookie.c | 61 +++++++++++++++++++++++++++++++++++++++---------------------
+ lib/cookie.h |  4 ++--
+ lib/http.c   |  2 +-
+ 3 files changed, 43 insertions(+), 24 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0f05da2..8607ce3 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1024,6 +1024,40 @@ static int cookie_sort(const void *p1, const void *p2)
+   return 0;
+ }
+ 
++#define CLONE(field)                     \
++  do {                                   \
++    if(src->field) {                     \
++      dup->field = strdup(src->field);   \
++      if(!dup->field)                    \
++        goto fail;                       \
++    }                                    \
++  } while(0)
++
++static struct Cookie *dup_cookie(struct Cookie *src)
++{
++  struct Cookie *dup = calloc(sizeof(struct Cookie), 1);
++  if(dup) {
++    CLONE(expirestr);
++    CLONE(domain);
++    CLONE(path);
++    CLONE(spath);
++    CLONE(name);
++    CLONE(value);
++    CLONE(maxage);
++    CLONE(version);
++    dup->expires = src->expires;
++    dup->tailmatch = src->tailmatch;
++    dup->secure = src->secure;
++    dup->livecookie = src->livecookie;
++    dup->httponly = src->httponly;
++  }
++  return dup;
++
++  fail:
++  freecookie(dup);
++  return NULL;
++}
++
+ /*****************************************************************************
+  *
+  * Curl_cookie_getlist()
+@@ -1079,11 +1113,8 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+           /* and now, we know this is a match and we should create an
+              entry for the return-linked-list */
+ 
+-          newco = malloc(sizeof(struct Cookie));
++          newco = dup_cookie(co);
+           if(newco) {
+-            /* first, copy the whole source cookie: */
+-            memcpy(newco, co, sizeof(struct Cookie));
+-
+             /* then modify our next */
+             newco->next = mainco;
+ 
+@@ -1095,12 +1126,7 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+           else {
+             fail:
+             /* failure, clear up the allocated chain and return NULL */
+-            while(mainco) {
+-              co = mainco->next;
+-              free(mainco);
+-              mainco = co;
+-            }
+-
++            Curl_cookie_freelist(mainco);
+             return NULL;
+           }
+         }
+@@ -1152,7 +1178,7 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+ void Curl_cookie_clearall(struct CookieInfo *cookies)
+ {
+   if(cookies) {
+-    Curl_cookie_freelist(cookies->cookies, TRUE);
++    Curl_cookie_freelist(cookies->cookies);
+     cookies->cookies = NULL;
+     cookies->numcookies = 0;
+   }
+@@ -1164,21 +1190,14 @@ void Curl_cookie_clearall(struct CookieInfo *cookies)
+  *
+  * Free a list of cookies previously returned by Curl_cookie_getlist();
+  *
+- * The 'cookiestoo' argument tells this function whether to just free the
+- * list or actually also free all cookies within the list as well.
+- *
+  ****************************************************************************/
+ 
+-void Curl_cookie_freelist(struct Cookie *co, bool cookiestoo)
++void Curl_cookie_freelist(struct Cookie *co)
+ {
+   struct Cookie *next;
+   while(co) {
+     next = co->next;
+-    if(cookiestoo)
+-      freecookie(co);
+-    else
+-      free(co); /* we only free the struct since the "members" are all just
+-                   pointed out in the main cookie list! */
++    freecookie(co);
+     co = next;
+   }
+ }
+@@ -1233,7 +1252,7 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     free(c->filename);
+-    Curl_cookie_freelist(c->cookies, TRUE);
++    Curl_cookie_freelist(c->cookies);
+     free(c); /* free the base struct as well */
+   }
+ }
+diff --git a/lib/cookie.h b/lib/cookie.h
+index cd7c54a..a9a4578 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -82,7 +82,7 @@ struct Cookie *Curl_cookie_add(struct Curl_easy *data,
+ 
+ struct Cookie *Curl_cookie_getlist(struct CookieInfo *, const char *,
+                                    const char *, bool);
+-void Curl_cookie_freelist(struct Cookie *cookies, bool cookiestoo);
++void Curl_cookie_freelist(struct Cookie *cookies);
+ void Curl_cookie_clearall(struct CookieInfo *cookies);
+ void Curl_cookie_clearsess(struct CookieInfo *cookies);
+ 
+diff --git a/lib/http.c b/lib/http.c
+index 65c145a..e6e7d37 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2384,7 +2384,7 @@ CURLcode Curl_http(struct connectdata *conn, bool *done)
+         }
+         co = co->next; /* next cookie please */
+       }
+-      Curl_cookie_freelist(store, FALSE); /* free the cookie list */
++      Curl_cookie_freelist(store);
+     }
+     if(addcookies && !result) {
+       if(!count)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8624.patch b/meta/recipes-support/curl/curl/CVE-2016-8624.patch
new file mode 100644
index 0000000..fb62282
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8624.patch
@@ -0,0 +1,55 @@
+From 3bb273db7e40ebc284cff45f3ce3f0475c8339c2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 11 Oct 2016 00:48:35 +0200
+Subject: [PATCH] urlparse: accept '#' as end of host name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+'http://example.com#@127.0.0.1/x.txt' equals a request to example.com
+for the '/' document with the rest of the URL being a fragment.
+
+CVE: CVE-2016-8624
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102J.html
+Reported-by: Fernando Muñoz
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/lib/url.c b/lib/url.c
+--- a/lib/url.c	2016-11-07 08:50:23.030126833 +0100
++++ b/lib/url.c	2016-11-07 10:16:13.562089428 +0100
+@@ -4086,7 +4086,7 @@
+     path[0]=0;
+ 
+     if(2 > sscanf(data->change.url,
+-                   "%15[^\n:]://%[^\n/?]%[^\n]",
++                   "%15[^\n:]://%[^\n/?#]%[^\n]",
+                    protobuf,
+                    conn->host.name, path)) {
+ 
+@@ -4094,7 +4094,7 @@
+        * The URL was badly formatted, let's try the browser-style _without_
+        * protocol specified like 'http://'.
+        */
+-      rc = sscanf(data->change.url, "%[^\n/?]%[^\n]", conn->host.name, path);
++      rc = sscanf(data->change.url, "%[^\n/?#]%[^\n]", conn->host.name, path);
+       if(1 > rc) {
+         /*
+          * We couldn't even get this format.
+@@ -4184,10 +4184,10 @@
+   }
+ 
+   /* If the URL is malformatted (missing a '/' after hostname before path) we
+-   * insert a slash here. The only letter except '/' we accept to start a path
+-   * is '?'.
++   * insert a slash here. The only letters except '/' that can start a path is
++   * '?' and '#' - as controlled by the two sscanf() patterns above.
+    */
+-  if(path[0] == '?') {
++  if(path[0] != '/') {
+     /* We need this function to deal with overlapping memory areas. We know
+        that the memory area 'path' points to is 'urllen' bytes big and that
+        is bigger than the path. Use +1 to move the zero byte too. */
diff --git a/meta/recipes-support/curl/curl/CVE-2016-8625.patch b/meta/recipes-support/curl/curl/CVE-2016-8625.patch
new file mode 100644
index 0000000..eb21e60
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8625.patch
@@ -0,0 +1,593 @@
+commit 9c91ec778104ae3b744b39444d544e82d5ee9ece
+Author: Daniel Stenberg <daniel@haxx.se>
+Date:   Wed Oct 12 09:01:06 2016 +0200
+
+idn: switch to libidn2 use and IDNA2008 support
+
+CVE: CVE-2016-8625
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102K.html
+Reported-by: Christian Heimes
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/CMakeLists.txt b/CMakeLists.txt
+--- a/CMakeLists.txt	2016-02-03 00:08:44.000000000 +0100
++++ b/CMakeLists.txt	2016-11-08 13:05:14.055757175 +0100
+@@ -440,7 +440,7 @@
+ endif()
+ 
+ # Check for idn
+-check_library_exists_concat("idn" idna_to_ascii_lz HAVE_LIBIDN)
++check_library_exists_concat("idn2" idn2_lookup_ul HAVE_LIBIDN2)
+ 
+ # Check for symbol dlopen (same as HAVE_LIBDL)
+ check_library_exists("${CURL_LIBS}" dlopen "" HAVE_DLOPEN)
+@@ -608,7 +608,7 @@
+ check_include_file_concat("err.h"            HAVE_ERR_H)
+ check_include_file_concat("errno.h"          HAVE_ERRNO_H)
+ check_include_file_concat("fcntl.h"          HAVE_FCNTL_H)
+-check_include_file_concat("idn-free.h"       HAVE_IDN_FREE_H)
++check_include_file_concat("idn2.h"           HAVE_IDN2_H)
+ check_include_file_concat("ifaddrs.h"        HAVE_IFADDRS_H)
+ check_include_file_concat("io.h"             HAVE_IO_H)
+ check_include_file_concat("krb.h"            HAVE_KRB_H)
+@@ -638,7 +638,6 @@
+ check_include_file_concat("termio.h"         HAVE_TERMIO_H)
+ check_include_file_concat("termios.h"        HAVE_TERMIOS_H)
+ check_include_file_concat("time.h"           HAVE_TIME_H)
+-check_include_file_concat("tld.h"            HAVE_TLD_H)
+ check_include_file_concat("unistd.h"         HAVE_UNISTD_H)
+ check_include_file_concat("utime.h"          HAVE_UTIME_H)
+ check_include_file_concat("x509.h"           HAVE_X509_H)
+@@ -652,9 +651,6 @@
+ check_include_file_concat("stdint.h"        HAVE_STDINT_H)
+ check_include_file_concat("sockio.h"        HAVE_SOCKIO_H)
+ check_include_file_concat("sys/utsname.h"   HAVE_SYS_UTSNAME_H)
+-check_include_file_concat("idna.h"          HAVE_IDNA_H)
+-
+-
+ 
+ check_type_size(size_t  SIZEOF_SIZE_T)
+ check_type_size(ssize_t  SIZEOF_SSIZE_T)
+@@ -802,9 +798,6 @@
+ check_symbol_exists(ftruncate      "${CURL_INCLUDES}" HAVE_FTRUNCATE)
+ check_symbol_exists(getprotobyname "${CURL_INCLUDES}" HAVE_GETPROTOBYNAME)
+ check_symbol_exists(getrlimit      "${CURL_INCLUDES}" HAVE_GETRLIMIT)
+-check_symbol_exists(idn_free       "${CURL_INCLUDES}" HAVE_IDN_FREE)
+-check_symbol_exists(idna_strerror  "${CURL_INCLUDES}" HAVE_IDNA_STRERROR)
+-check_symbol_exists(tld_strerror   "${CURL_INCLUDES}" HAVE_TLD_STRERROR)
+ check_symbol_exists(setlocale      "${CURL_INCLUDES}" HAVE_SETLOCALE)
+ check_symbol_exists(setrlimit      "${CURL_INCLUDES}" HAVE_SETRLIMIT)
+ check_symbol_exists(fcntl          "${CURL_INCLUDES}" HAVE_FCNTL)
+@@ -1067,7 +1060,7 @@
+ _add_if("unix-sockets"  USE_UNIX_SOCKETS)
+ _add_if("libz"          HAVE_LIBZ)
+ _add_if("AsynchDNS"     USE_ARES OR USE_THREADS_POSIX)
+-_add_if("IDN"           HAVE_LIBIDN)
++_add_if("IDN"           HAVE_LIBIDN2)
+ # TODO SSP1 (WinSSL) check is missing
+ _add_if("SSPI"          USE_WINDOWS_SSPI)
+ _add_if("GSS-API"       HAVE_GSSAPI)
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2016-11-08 11:36:12.569919895 +0100
++++ b/configure.ac	2016-11-08 13:05:14.059756325 +0100
+@@ -157,7 +157,7 @@
+     curl_res_msg="default (--enable-ares / --enable-threaded-resolver)"
+    curl_ipv6_msg="no      (--enable-ipv6)"
+ curl_unix_sockets_msg="no      (--enable-unix-sockets)"
+-    curl_idn_msg="no      (--with-{libidn,winidn})"
++    curl_idn_msg="no      (--with-{libidn2,winidn})"
+  curl_manual_msg="no      (--enable-manual)"
+ curl_libcurl_msg="enabled (--disable-libcurl-option)"
+ curl_verbose_msg="enabled (--disable-verbose)"
+@@ -2825,15 +2825,15 @@
+ dnl Check for the presence of IDN libraries and headers
+ dnl **********************************************************************
+ 
+-AC_MSG_CHECKING([whether to build with libidn])
++AC_MSG_CHECKING([whether to build with libidn2])
+ OPT_IDN="default"
+ AC_ARG_WITH(libidn,
+-AC_HELP_STRING([--with-libidn=PATH],[Enable libidn usage])
+-AC_HELP_STRING([--without-libidn],[Disable libidn usage]),
++AC_HELP_STRING([--with-libidn2=PATH],[Enable libidn2 usage])
++AC_HELP_STRING([--without-libidn2],[Disable libidn2 usage]),
+   [OPT_IDN=$withval])
+ case "$OPT_IDN" in
+   no)
+-    dnl --without-libidn option used
++    dnl --without-libidn2 option used
+     want_idn="no"
+     AC_MSG_RESULT([no])
+     ;;
+@@ -2844,13 +2844,13 @@
+     AC_MSG_RESULT([(assumed) yes])
+     ;;
+   yes)
+-    dnl --with-libidn option used without path
++    dnl --with-libidn2 option used without path
+     want_idn="yes"
+     want_idn_path="default"
+     AC_MSG_RESULT([yes])
+     ;;
+   *)
+-    dnl --with-libidn option used with path
++    dnl --with-libidn2 option used with path
+     want_idn="yes"
+     want_idn_path="$withval"
+     AC_MSG_RESULT([yes ($withval)])
+@@ -2867,33 +2867,33 @@
+   if test "$want_idn_path" != "default"; then
+     dnl path has been specified
+     IDN_PCDIR="$want_idn_path/lib$libsuff/pkgconfig"
+-    CURL_CHECK_PKGCONFIG(libidn, [$IDN_PCDIR])
++    CURL_CHECK_PKGCONFIG(libidn2, [$IDN_PCDIR])
+     if test "$PKGCONFIG" != "no"; then
+       IDN_LIBS=`CURL_EXPORT_PCDIR([$IDN_PCDIR]) dnl
+-        $PKGCONFIG --libs-only-l libidn 2>/dev/null`
++        $PKGCONFIG --libs-only-l libidn2 2>/dev/null`
+       IDN_LDFLAGS=`CURL_EXPORT_PCDIR([$IDN_PCDIR]) dnl
+-        $PKGCONFIG --libs-only-L libidn 2>/dev/null`
++        $PKGCONFIG --libs-only-L libidn2 2>/dev/null`
+       IDN_CPPFLAGS=`CURL_EXPORT_PCDIR([$IDN_PCDIR]) dnl
+-        $PKGCONFIG --cflags-only-I libidn 2>/dev/null`
++        $PKGCONFIG --cflags-only-I libidn2 2>/dev/null`
+       IDN_DIR=`echo $IDN_LDFLAGS | $SED -e 's/-L//'`
+     else
+       dnl pkg-config not available or provides no info
+-      IDN_LIBS="-lidn"
++      IDN_LIBS="-lidn2"
+       IDN_LDFLAGS="-L$want_idn_path/lib$libsuff"
+       IDN_CPPFLAGS="-I$want_idn_path/include"
+       IDN_DIR="$want_idn_path/lib$libsuff"
+     fi
+   else
+     dnl path not specified
+-    CURL_CHECK_PKGCONFIG(libidn)
++    CURL_CHECK_PKGCONFIG(libidn2)
+     if test "$PKGCONFIG" != "no"; then
+-      IDN_LIBS=`$PKGCONFIG --libs-only-l libidn 2>/dev/null`
+-      IDN_LDFLAGS=`$PKGCONFIG --libs-only-L libidn 2>/dev/null`
+-      IDN_CPPFLAGS=`$PKGCONFIG --cflags-only-I libidn 2>/dev/null`
++      IDN_LIBS=`$PKGCONFIG --libs-only-l libidn2 2>/dev/null`
++      IDN_LDFLAGS=`$PKGCONFIG --libs-only-L libidn2 2>/dev/null`
++      IDN_CPPFLAGS=`$PKGCONFIG --cflags-only-I libidn2 2>/dev/null`
+       IDN_DIR=`echo $IDN_LDFLAGS | $SED -e 's/-L//'`
+     else
+       dnl pkg-config not available or provides no info
+-      IDN_LIBS="-lidn"
++      IDN_LIBS="-lidn2"
+     fi
+   fi
+   #
+@@ -2913,9 +2913,9 @@
+   LDFLAGS="$IDN_LDFLAGS $LDFLAGS"
+   LIBS="$IDN_LIBS $LIBS"
+   #
+-  AC_MSG_CHECKING([if idna_to_ascii_4i can be linked])
++  AC_MSG_CHECKING([if idn2_lookup_ul can be linked])
+   AC_LINK_IFELSE([
+-    AC_LANG_FUNC_LINK_TRY([idna_to_ascii_4i])
++    AC_LANG_FUNC_LINK_TRY([idn2_lookup_ul])
+   ],[
+     AC_MSG_RESULT([yes])
+     tst_links_libidn="yes"
+@@ -2923,37 +2923,19 @@
+     AC_MSG_RESULT([no])
+     tst_links_libidn="no"
+   ])
+-  if test "$tst_links_libidn" = "no"; then
+-    AC_MSG_CHECKING([if idna_to_ascii_lz can be linked])
+-    AC_LINK_IFELSE([
+-      AC_LANG_FUNC_LINK_TRY([idna_to_ascii_lz])
+-    ],[
+-      AC_MSG_RESULT([yes])
+-      tst_links_libidn="yes"
+-    ],[
+-      AC_MSG_RESULT([no])
+-      tst_links_libidn="no"
+-    ])
+-  fi
+   #
++  AC_CHECK_HEADERS( idn2.h )
++
+   if test "$tst_links_libidn" = "yes"; then
+-    AC_DEFINE(HAVE_LIBIDN, 1, [Define to 1 if you have the `idn' library (-lidn).])
++    AC_DEFINE(HAVE_LIBIDN2, 1, [Define to 1 if you have the `idn2' library (-lidn2).])
+     dnl different versions of libidn have different setups of these:
+-    AC_CHECK_FUNCS( idn_free idna_strerror tld_strerror )
+-    AC_CHECK_HEADERS( idn-free.h tld.h )
+-    if test "x$ac_cv_header_tld_h" = "xyes"; then
+-      AC_SUBST([IDN_ENABLED], [1])
+-      curl_idn_msg="enabled"
+-      if test -n "$IDN_DIR" -a "x$cross_compiling" != "xyes"; then
+-        LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$IDN_DIR"
+-        export LD_LIBRARY_PATH
+-        AC_MSG_NOTICE([Added $IDN_DIR to LD_LIBRARY_PATH])
+-      fi
+-    else
+-      AC_MSG_WARN([Libraries for IDN support too old: IDN disabled])
+-      CPPFLAGS="$clean_CPPFLAGS"
+-      LDFLAGS="$clean_LDFLAGS"
+-      LIBS="$clean_LIBS"
++
++    AC_SUBST([IDN_ENABLED], [1])
++    curl_idn_msg="enabled (libidn2)"
++    if test -n "$IDN_DIR" -a "x$cross_compiling" != "xyes"; then
++      LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$IDN_DIR"
++      export LD_LIBRARY_PATH
++      AC_MSG_NOTICE([Added $IDN_DIR to LD_LIBRARY_PATH])
+     fi
+   else
+     AC_MSG_WARN([Cannot find libraries for IDN support: IDN disabled])
+diff -ruN a/lib/curl_setup.h b/lib/curl_setup.h
+--- a/lib/curl_setup.h	2016-02-04 23:00:56.000000000 +0100
++++ b/lib/curl_setup.h	2016-11-08 13:05:14.059756325 +0100
+@@ -590,10 +590,9 @@
+ #endif
+ #endif
+ 
+-#if defined(HAVE_LIBIDN) && defined(HAVE_TLD_H)
+-/* The lib was present and the tld.h header (which is missing in libidn 0.3.X
+-   but we only work with libidn 0.4.1 or later) */
+-#define USE_LIBIDN
++#if defined(HAVE_LIBIDN2) && defined(HAVE_IDN2_H)
++/* The lib and header are present */
++#define USE_LIBIDN2
+ #endif
+ 
+ #ifndef SIZEOF_TIME_T
+diff -ruN a/lib/easy.c b/lib/easy.c
+--- a/lib/easy.c	2016-02-03 00:02:44.000000000 +0100
++++ b/lib/easy.c	2016-11-08 13:05:14.063755476 +0100
+@@ -144,28 +144,6 @@
+   return CURLE_OK;
+ }
+ 
+-#ifdef USE_LIBIDN
+-/*
+- * Initialise use of IDNA library.
+- * It falls back to ASCII if $CHARSET isn't defined. This doesn't work for
+- * idna_to_ascii_lz().
+- */
+-static void idna_init (void)
+-{
+-#ifdef WIN32
+-  char buf[60];
+-  UINT cp = GetACP();
+-
+-  if(!getenv("CHARSET") && cp > 0) {
+-    snprintf(buf, sizeof(buf), "CHARSET=cp%u", cp);
+-    putenv(buf);
+-  }
+-#else
+-  /* to do? */
+-#endif
+-}
+-#endif  /* USE_LIBIDN */
+-
+ /* true globals -- for curl_global_init() and curl_global_cleanup() */
+ static unsigned int  initialized;
+ static long          init_flags;
+@@ -262,10 +240,6 @@
+   }
+ #endif
+ 
+-#ifdef USE_LIBIDN
+-  idna_init();
+-#endif
+-
+   if(Curl_resolver_global_init()) {
+     DEBUGF(fprintf(stderr, "Error: resolver_global_init failed\n"));
+     return CURLE_FAILED_INIT;
+diff -ruN a/lib/strerror.c b/lib/strerror.c
+--- a/lib/strerror.c	2016-02-04 15:49:31.000000000 +0100
++++ b/lib/strerror.c	2016-11-08 13:05:14.063755476 +0100
+@@ -35,8 +35,8 @@
+ 
+ #include <curl/curl.h>
+ 
+-#ifdef USE_LIBIDN
+-#include <idna.h>
++#ifdef USE_LIBIDN2
++#include <idn2.h>
+ #endif
+ 
+ #ifdef USE_WINDOWS_SSPI
+@@ -723,83 +723,6 @@
+   return buf;
+ }
+ 
+-#ifdef USE_LIBIDN
+-/*
+- * Return error-string for libidn status as returned from idna_to_ascii_lz().
+- */
+-const char *Curl_idn_strerror (struct connectdata *conn, int err)
+-{
+-#ifdef HAVE_IDNA_STRERROR
+-  (void)conn;
+-  return idna_strerror((Idna_rc) err);
+-#else
+-  const char *str;
+-  char *buf;
+-  size_t max;
+-
+-  DEBUGASSERT(conn);
+-
+-  buf = conn->syserr_buf;
+-  max = sizeof(conn->syserr_buf)-1;
+-  *buf = '\0';
+-
+-#ifndef CURL_DISABLE_VERBOSE_STRINGS
+-  switch ((Idna_rc)err) {
+-    case IDNA_SUCCESS:
+-      str = "No error";
+-      break;
+-    case IDNA_STRINGPREP_ERROR:
+-      str = "Error in string preparation";
+-      break;
+-    case IDNA_PUNYCODE_ERROR:
+-      str = "Error in Punycode operation";
+-      break;
+-    case IDNA_CONTAINS_NON_LDH:
+-      str = "Illegal ASCII characters";
+-      break;
+-    case IDNA_CONTAINS_MINUS:
+-      str = "Contains minus";
+-      break;
+-    case IDNA_INVALID_LENGTH:
+-      str = "Invalid output length";
+-      break;
+-    case IDNA_NO_ACE_PREFIX:
+-      str = "No ACE prefix (\"xn--\")";
+-      break;
+-    case IDNA_ROUNDTRIP_VERIFY_ERROR:
+-      str = "Round trip verify error";
+-      break;
+-    case IDNA_CONTAINS_ACE_PREFIX:
+-      str = "Already have ACE prefix (\"xn--\")";
+-      break;
+-    case IDNA_ICONV_ERROR:
+-      str = "Locale conversion failed";
+-      break;
+-    case IDNA_MALLOC_ERROR:
+-      str = "Allocation failed";
+-      break;
+-    case IDNA_DLOPEN_ERROR:
+-      str = "dlopen() error";
+-      break;
+-    default:
+-      snprintf(buf, max, "error %d", err);
+-      str = NULL;
+-      break;
+-  }
+-#else
+-  if((Idna_rc)err == IDNA_SUCCESS)
+-    str = "No error";
+-  else
+-    str = "Error";
+-#endif
+-  if(str)
+-    strncpy(buf, str, max);
+-  buf[max] = '\0';
+-  return (buf);
+-#endif
+-}
+-#endif  /* USE_LIBIDN */
+-
+ #ifdef USE_WINDOWS_SSPI
+ const char *Curl_sspi_strerror (struct connectdata *conn, int err)
+ {
+diff -ruN a/lib/strerror.h b/lib/strerror.h
+--- a/lib/strerror.h	2016-02-03 00:02:44.000000000 +0100
++++ b/lib/strerror.h	2016-11-08 13:05:14.063755476 +0100
+@@ -7,7 +7,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2012, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -26,7 +26,7 @@
+ 
+ const char *Curl_strerror (struct connectdata *conn, int err);
+ 
+-#ifdef USE_LIBIDN
++#ifdef USE_LIBIDN2
+ const char *Curl_idn_strerror (struct connectdata *conn, int err);
+ #endif
+ 
+diff -ruN a/lib/url.c b/lib/url.c
+--- a/lib/url.c	2016-11-08 11:36:14.789448511 +0100
++++ b/lib/url.c	2016-11-08 14:28:29.402683080 +0100
+@@ -59,24 +59,15 @@
+ #include <limits.h>
+ #endif
+ 
+-#ifdef USE_LIBIDN
+-#include <idna.h>
+-#include <tld.h>
+-#include <stringprep.h>
+-#ifdef HAVE_IDN_FREE_H
+-#include <idn-free.h>
+-#else
+-/* prototype from idn-free.h, not provided by libidn 0.4.5's make install! */
+-void idn_free (void *ptr);
+-#endif
+-#ifndef HAVE_IDN_FREE
+-/* if idn_free() was not found in this version of libidn use free() instead */
+-#define idn_free(x) (free)(x)
+-#endif
++#ifdef USE_LIBIDN2
++#include <idn2.h>
++
+ #elif defined(USE_WIN32_IDN)
+ /* prototype for curl_win32_idn_to_ascii() */
+ int curl_win32_idn_to_ascii(const char *in, char **out);
+-#endif  /* USE_LIBIDN */
++#endif  /* USE_LIBIDN2 */
++
++#include <idn2.h>
+ 
+ #include "urldata.h"
+ #include "netrc.h"
+@@ -3693,59 +3684,15 @@
+   return TRUE;
+ }
+ 
+-#ifdef USE_LIBIDN
+-/*
+- * Check if characters in hostname is allowed in Top Level Domain.
+- */
+-static bool tld_check_name(struct SessionHandle *data,
+-                           const char *ace_hostname)
+-{
+-  size_t err_pos;
+-  char *uc_name = NULL;
+-  int rc;
+-#ifndef CURL_DISABLE_VERBOSE_STRINGS
+-  const char *tld_errmsg = "<no msg>";
+-#else
+-  (void)data;
+-#endif
+-
+-  /* Convert (and downcase) ACE-name back into locale's character set */
+-  rc = idna_to_unicode_lzlz(ace_hostname, &uc_name, 0);
+-  if(rc != IDNA_SUCCESS)
+-    return FALSE;
+-
+-  rc = tld_check_lz(uc_name, &err_pos, NULL);
+-#ifndef CURL_DISABLE_VERBOSE_STRINGS
+-#ifdef HAVE_TLD_STRERROR
+-  if(rc != TLD_SUCCESS)
+-    tld_errmsg = tld_strerror((Tld_rc)rc);
+-#endif
+-  if(rc == TLD_INVALID)
+-    infof(data, "WARNING: %s; pos %u = `%c'/0x%02X\n",
+-          tld_errmsg, err_pos, uc_name[err_pos],
+-          uc_name[err_pos] & 255);
+-  else if(rc != TLD_SUCCESS)
+-    infof(data, "WARNING: TLD check for %s failed; %s\n",
+-          uc_name, tld_errmsg);
+-#endif /* CURL_DISABLE_VERBOSE_STRINGS */
+-  if(uc_name)
+-     idn_free(uc_name);
+-  if(rc != TLD_SUCCESS)
+-    return FALSE;
+-
+-  return TRUE;
+-}
+-#endif
+-
+ /*
+  * Perform any necessary IDN conversion of hostname
+  */
+-static void fix_hostname(struct SessionHandle *data,
+-                         struct connectdata *conn, struct hostname *host)
++static void fix_hostname(struct connectdata *conn, struct hostname *host)
+ {
+   size_t len;
++  struct Curl_easy *data = conn->data;
+ 
+-#ifndef USE_LIBIDN
++#ifndef USE_LIBIDN2
+   (void)data;
+   (void)conn;
+ #elif defined(CURL_DISABLE_VERBOSE_STRINGS)
+@@ -3762,24 +3709,15 @@
+     host->name[len-1]=0;
+ 
+   if(!is_ASCII_name(host->name)) {
+-#ifdef USE_LIBIDN
++#ifdef USE_LIBIDN2
+   /*************************************************************
+    * Check name for non-ASCII and convert hostname to ACE form.
+    *************************************************************/
+-  if(stringprep_check_version(LIBIDN_REQUIRED_VERSION)) {
++  if(stringprep_check_version(IDN2_VERSION)) {
+     char *ace_hostname = NULL;
+-    int rc = idna_to_ascii_lz(host->name, &ace_hostname, 0);
+-    infof (data, "Input domain encoded as `%s'\n",
+-           stringprep_locale_charset ());
+-    if(rc != IDNA_SUCCESS)
+-      infof(data, "Failed to convert %s to ACE; %s\n",
+-            host->name, Curl_idn_strerror(conn, rc));
+-    else {
+-      /* tld_check_name() displays a warning if the host name contains
+-         "illegal" characters for this TLD */
+-      (void)tld_check_name(data, ace_hostname);
+-
+-      host->encalloc = ace_hostname;
++      int rc = idn2_lookup_ul((const char *)host->name, &ace_hostname, 0);
++      if(rc == IDN2_OK) {
++        host->encalloc = (char *)ace_hostname;
+       /* change the name pointer to point to the encoded hostname */
+       host->name = host->encalloc;
+     }
+@@ -3809,9 +3747,9 @@
+  */
+ static void free_fixed_hostname(struct hostname *host)
+ {
+-#if defined(USE_LIBIDN)
++#if defined(USE_LIBIDN2)
+   if(host->encalloc) {
+-    idn_free(host->encalloc); /* must be freed with idn_free() since this was
++    idn2_free(host->encalloc); /* must be freed with idn2_free() since this was
+                                  allocated by libidn */
+     host->encalloc = NULL;
+   }
+@@ -5708,9 +5646,9 @@
+   /*************************************************************
+    * IDN-fix the hostnames
+    *************************************************************/
+-  fix_hostname(data, conn, &conn->host);
++  fix_hostname(conn, &conn->host);
+   if(conn->proxy.name && *conn->proxy.name)
+-    fix_hostname(data, conn, &conn->proxy);
++    fix_hostname(conn, &conn->proxy);
+ 
+   /*************************************************************
+    * Setup internals depending on protocol. Needs to be done after
+diff -ruN a/lib/version.c b/lib/version.c
+--- a/lib/version.c	2016-02-03 00:02:44.000000000 +0100
++++ b/lib/version.c	2016-11-08 13:05:14.071753778 +0100
+@@ -36,8 +36,8 @@
+ #  include <ares.h>
+ #endif
+ 
+-#ifdef USE_LIBIDN
+-#include <stringprep.h>
++#ifdef USE_LIBIDN2
++#include <idn2.h>
+ #endif
+ 
+ #ifdef USE_LIBPSL
+@@ -97,9 +97,9 @@
+   left -= len;
+   ptr += len;
+ #endif
+-#ifdef USE_LIBIDN
+-  if(stringprep_check_version(LIBIDN_REQUIRED_VERSION)) {
+-    len = snprintf(ptr, left, " libidn/%s", stringprep_check_version(NULL));
++#ifdef USE_LIBIDN2
++  if(idn2_check_version(IDN2_VERSION)) {
++    len = snprintf(ptr, left, " libidn2/%s", idn2_check_version(NULL));
+     left -= len;
+     ptr += len;
+   }
+@@ -344,10 +344,10 @@
+     version_info.ares_num = aresnum;
+   }
+ #endif
+-#ifdef USE_LIBIDN
++#ifdef USE_LIBIDN2
+   /* This returns a version string if we use the given version or later,
+      otherwise it returns NULL */
+-  version_info.libidn = stringprep_check_version(LIBIDN_REQUIRED_VERSION);
++  version_info.libidn = idn2_check_version(IDN2_VERSION);
+   if(version_info.libidn)
+     version_info.features |= CURL_VERSION_IDN;
+ #elif defined(USE_WIN32_IDN)
diff --git a/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch b/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch
new file mode 100644
index 0000000..7e2287d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch
@@ -0,0 +1,29 @@
+From c27013c05d99d92370b57e1a7af1b854eef4e7c1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 31 Oct 2016 09:49:50 +0100
+Subject: [PATCH] url: remove unconditional idn2.h include
+
+Mistake brought by 9c91ec778104a
+
+Upstream-Status: Backport
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/url.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index c90a1c5..b997f41 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -67,8 +67,6 @@
+ bool curl_win32_idn_to_ascii(const char *in, char **out);
+ #endif  /* USE_LIBIDN2 */
+ 
+-#include <idn2.h>
+-
+ #include "urldata.h"
+ #include "netrc.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 3670a11..7fab7cf 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -15,6 +15,18 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-5420.patch \
              file://CVE-2016-5421.patch \
              file://CVE-2016-7141.patch \
+             file://CVE-2016-8615.patch \
+             file://CVE-2016-8616.patch \
+             file://CVE-2016-8617.patch \
+             file://CVE-2016-8618.patch \
+             file://CVE-2016-8619.patch \
+             file://CVE-2016-8620.patch \
+             file://CVE-2016-8621.patch \
+             file://CVE-2016-8622.patch \
+             file://CVE-2016-8623.patch \
+             file://CVE-2016-8624.patch \
+             file://CVE-2016-8625.patch \
+             file://url-remove-unconditional-idn2.h-include.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


