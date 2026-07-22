Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A6DC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:13:18 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44579.1784715193687827690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lqWD8BhG;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11166; q=dns/txt;
  s=iport01; t=1784715193; x=1785924793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VQztAv2IZFeT8QXr8Tvpt3gq8zLO+m6F/1XuUoY0SCw=;
  b=lqWD8BhGqWysfIrWwRHlpVZzKpM8dIF0QTnVNlN2v6e59PtrxNnqLvyh
   GAUsts1W0DsIQBl21qA8Zn7HFNqESN6M8b/0YcIGdzJY4pNLaOy5kEWGc
   GJQ/HSmToo/94SKho48ZaAdPZq7nSXDHLKL5XwXkdKq/V9Z9x/ewpjKzY
   ITi0CpKb+HRw3xS/xTEMF05FU7GNiQM2YyBRhmIKgHj+PdF4hD6BX5s7m
   cjmjEIOsEnHub4Vp3m7YNzW6PQqxH7K6mUwFD2TEkup1oOlIbEYBsjFkf
   jh3bnRXHhaVGuNCJ+WED9LaFEUxky96sG6BLrvwlnoilglR5GqO32khyj
   Q==;
X-CSE-ConnectionGUID: CGC8R/2pRB+JnpK1tu8oPQ==
X-CSE-MsgGUID: YiCGIC2OTnm++eds5zISRg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDRlmBq/4v/Ja1aglmCV3ReQ0mWSgOLZJI3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBKoRbAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzcDEcB5giyBA?=
 =?us-ascii?q?YMoAT8CQ1DYSQ2CWAELFAEFgTOFP4J9hSNcGAGEfCcbG4FygRWDaYEFgRpCA?=
 =?us-ascii?q?QMYiAsEgiKBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ+bgeNaSOBTnJTOwEHIgEBIIEAQIEXpSugHnEKKIN1jCGPPoV8GjOFW6URC?=
 =?us-ascii?q?5h9izeCU4QJgmWOcnCEaYFoPIFHCwdwFYMiCUoZD44tCwuDYIF/zBInMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:WvBjja7dL2AHDI3r2znTNgxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mAcX2+EOf2CYGr9fIgnbdywoBgG7MSGmNA3SFdv/yxnZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFqIzqtwwW3l03
 786LiguNwye1+WO+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYOOKo3QH5gE9qqej
 lPH1EvYKUs9CNqainmI/mnxlM70pyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:SJi1CqglDyVRCm9yB+wsupvMoXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3A/rPZaGiYqya69Qlz/aQy8CdSYzJuWVL2nE2XeVe?=
 =?us-ascii?q?CIyVLTqW2EEONqKRcqp87?=
X-Talos-MUID: 9a23:aqDWAASX/qtYTcCnRXTdhRpNFewyxJioDQNOnJkd5tulDhZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513892259"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:13:12 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id AB00318000206;
	Wed, 22 Jul 2026 10:13:12 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 5C402CC12A6; Wed, 22 Jul 2026 03:13:12 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/4] wget: Fix CVE-2026-58472
Date: Wed, 22 Jul 2026 03:12:30 -0700
Message-Id: <20260722101230.34771-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722101230.34771-1-hthakar@cisco.com>
References: <20260722101230.34771-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241653

From: Hetvi Thakar <hthakar@cisco.com>

Apply the upstream fix referenced in [2] using the commit
listed in [1].
Also include the upstream follow-up commit [3], which fixes
encoded entity length handling and adds regression tests.

[1] https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e75587a812
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58472
[3] https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb73197a38ca2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58472-regression.patch | 236 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  77 ++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   2 +
 3 files changed, 315 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
new file mode 100644
index 0000000000..c82d2f2b06
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
@@ -0,0 +1,236 @@
+From 6ab6b6d2fc2ed5e4cbb4908b9ad282110f30a688 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 2 Jul 2026 13:13:07 +0200
+Subject: [PATCH] Regression: Fix buffer overflow in html_quote_string()
+
+The regression has been introduced in commit dd692d9 and
+is not part of any release.
+
+The tests allow the address sanitizer to find the issue.
+
+* src/convert.c: Fix string size calculation.
+* tests/unit-tests.c: Added tests including tests for html_quote_string().
+* tests/unit-tests.h: Add definitions for the test functions.
+
+Reported-by: Trung Nguyen <trungnh@cystack.net>
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb73197a38ca2]
+
+(cherry picked from commit f76978a51ba9365e7ecaed96c1cfb73197a38ca2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/convert.c      | 148 +++++++++++++++++++++++++++++++++++++++++++--
+ tests/unit-tests.c |   4 ++
+ tests/unit-tests.h |   4 ++
+ 3 files changed, 152 insertions(+), 4 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index 51636340..4dae497c 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -48,6 +48,9 @@ as that of the covered work.  */
+ #include "css-url.h"
+ #include "iri.h"
+ #include "xstrndup.h"
++#ifdef TESTING
++#include "../tests/unit-tests.h"
++#endif
+ 
+ static struct hash_table *dl_file_url_map;
+ struct hash_table *dl_url_file_map;
+@@ -1177,13 +1180,13 @@ html_quote_string (const char *s)
+   for (i = 0; *s; s++)
+     {
+       if (*s == '&')
+-        ok = INT_ADD_OK (i, 4, &i);     /* `amp;' */
++        ok = INT_ADD_OK (i, 4 + 1, &i);     /* `amp;' */
+       else if (*s == '<' || *s == '>')
+-        ok = INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
++        ok = INT_ADD_OK (i, 3 + 1, &i);     /* `lt;' and `gt;' */
+       else if (*s == '\"')
+-        ok = INT_ADD_OK (i, 5, &i);     /* `quot;' */
++        ok = INT_ADD_OK (i, 5 + 1, &i);     /* `quot;' */
+       else if (*s == ' ')
+-        ok = INT_ADD_OK (i, 4, &i);     /* #32; */
++        ok = INT_ADD_OK (i, 4 + 1, &i);     /* #32; */
+       else
+         ok = INT_ADD_OK (i, 1, &i);
+ 
+@@ -1242,6 +1245,143 @@ html_quote_string (const char *s)
+   return res;
+ }
+ 
++#ifdef TESTING
++
++const char *
++test_construct_relative (void)
++{
++  static const struct {
++    const char *basefile;
++    const char *linkfile;
++    const char *expected;
++  } test_array[] = {
++    { "foo", "bar", "bar" },
++    { "A/foo", "A/bar", "bar" },
++    { "A/foo", "A/B/bar", "B/bar" },
++    { "A/X/foo", "A/Y/bar", "../Y/bar" },
++    { "X/", "Y/bar", "../Y/bar" },
++    { "/foo", "/bar", "bar" },
++    { "/a/b/c", "/a/b/d", "d" },
++    { "/a/b/c", "/a/b/c/d", "c/d" },
++    { "/a/b/c", "/a/b/c/d/e", "c/d/e" },
++    { "/a/b/c", "/x/y/z", "../../x/y/z" },
++    { "a/b", "c/d", "../c/d" },
++    { "./foo", "./bar", "bar" },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      char *result = construct_relative (test_array[i].basefile,
++                                         test_array[i].linkfile);
++      mu_assert ("test_construct_relative: wrong result",
++                 strcmp (result, test_array[i].expected) == 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++const char *
++test_match_except_index (void)
++{
++  static const struct {
++    const char *s1;
++    const char *s2;
++    bool expected;
++  } test_array[] = {
++    { "foo/index.html", "foo/", true },
++    { "foo/", "foo/index.html", true },
++    { "foo", "foo/index.html", true },
++    { "foo", "foo/", true },
++    { "foo", "foo", true },
++    { "/foo/index.html", "/foo/", true },
++    { "/foo/", "/foo/index.html", true },
++    { "/foo", "/foo/index.html", true },
++    { "/foo", "/foo/", true },
++    { "foo/bar", "foo/qux", false },
++    { "foo/bar", "bar/foo", false },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      bool result = match_except_index (test_array[i].s1, test_array[i].s2);
++      mu_assert ("test_match_except_index: wrong result",
++                 result == test_array[i].expected);
++    }
++
++  return NULL;
++}
++
++const char *
++test_find_fragment (void)
++{
++  static const struct {
++    const char *input;
++    int size;
++    bool has_fragment;
++    const char *fragment;
++  } test_array[] = {
++    { "http://example.com#section", 26, true, "#section" },
++    { "http://example.com", 18, false, NULL },
++    { "http://example.com?a=1#frag", 24, true, "#frag" },
++    { "http://example.com?a=1%26#frag", 28, true, "#frag" },
++    { "http://example.com?a=1&b=2#frag", 30, true, "#frag" },
++    { "a#b", 3, true, "#b" },
++    { "a", 1, false, NULL },
++  };
++  const char *bp, *ep;
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      bool result = find_fragment (test_array[i].input,
++                                   test_array[i].size, &bp, &ep);
++      mu_assert ("test_find_fragment: wrong result",
++                 result == test_array[i].has_fragment);
++      if (test_array[i].has_fragment)
++        {
++          mu_assert ("test_find_fragment: wrong fragment", bp != NULL);
++          mu_assert ("test_find_fragment: fragment mismatch",
++                     strncmp (bp, test_array[i].fragment,
++                              strlen (test_array[i].fragment)) == 0 &&
++                     ep == test_array[i].input + test_array[i].size);
++        }
++    }
++
++  return NULL;
++}
++
++const char *
++test_html_quote_string (void)
++{
++  static const struct {
++    const char *input;
++    const char *expected;
++  } test_array[] = {
++    { "hello", "hello" },
++    { "a&b", "a&amp;b" },
++    { "<tag>", "&lt;tag&gt;" },
++    { "\"quote\"", "&quot;quote&quot;" },
++    { "space here", "space&#32;here" },
++    { "&<>\" ", "&amp;&lt;&gt;&quot;&#32;" },
++    { "no special", "no&#32;special" },
++    { "&&&&", "&amp;&amp;&amp;&amp;" },
++    { "<<>>", "&lt;&lt;&gt;&gt;" },
++    { "" , "" },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      char *result = html_quote_string (test_array[i].input);
++      mu_assert ("test_html_quote_string: wrong result",
++                 strcmp (result, test_array[i].expected) == 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++#endif /* TESTING */
++
+ /*
+  * vim: et ts=2 sw=2
+  */
+diff --git a/tests/unit-tests.c b/tests/unit-tests.c
+index 085a0321..f92d72b4 100644
+--- a/tests/unit-tests.c
++++ b/tests/unit-tests.c
+@@ -66,6 +66,10 @@ all_tests(void)
+   mu_run_test (test_hsts_read_database);
+ #endif
+   mu_run_test (test_parse_netrc);
++  mu_run_test (test_construct_relative);
++  mu_run_test (test_match_except_index);
++  mu_run_test (test_find_fragment);
++  mu_run_test (test_html_quote_string);
+ 
+   return NULL;
+ }
+diff --git a/tests/unit-tests.h b/tests/unit-tests.h
+index 16573b1c..7542660b 100644
+--- a/tests/unit-tests.h
++++ b/tests/unit-tests.h
+@@ -62,6 +62,10 @@ const char *test_hsts_url_rewrite_superdomain(void);
+ const char *test_hsts_url_rewrite_congruent(void);
+ const char *test_hsts_read_database(void);
+ const char *test_parse_netrc(void);
++const char *test_construct_relative(void);
++const char *test_match_except_index(void);
++const char *test_find_fragment(void);
++const char *test_html_quote_string(void);
+ 
+ #endif /* TEST_H */
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 0000000000..29f6f23d07
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,77 @@
+From 7d0400b63382fbf336df9b63c787571d2df8a772 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 19:13:15 +0200
+Subject: [PATCH] * src/convert.c (html_quote_string): Fix integer+buffer
+ overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e75587a812]
+
+(cherry picked from commit dd692d9cea5335b181d877ae917fe6e75587a812)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/convert.c | 31 ++++++++++++++++++++++++-------
+ 1 file changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index b934d49b..51636340 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -36,6 +36,7 @@ as that of the covered work.  */
+ #include <unistd.h>
+ #include <errno.h>
+ #include <assert.h>
++#include <intprops.h>
+ #include "convert.h"
+ #include "url.h"
+ #include "recur.h"
+@@ -1169,21 +1170,37 @@ html_quote_string (const char *s)
+ {
+   const char *b = s;
+   char *p, *res;
+-  int i;
++  size_t i;
++  int ok;
+ 
+   /* Pass through the string, and count the new size.  */
+-  for (i = 0; *s; s++, i++)
++  for (i = 0; *s; s++)
+     {
+       if (*s == '&')
+-        i += 4;                 /* `amp;' */
++        ok = INT_ADD_OK (i, 4, &i);     /* `amp;' */
+       else if (*s == '<' || *s == '>')
+-        i += 3;                 /* `lt;' and `gt;' */
++        ok = INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
+       else if (*s == '\"')
+-        i += 5;                 /* `quot;' */
++        ok = INT_ADD_OK (i, 5, &i);     /* `quot;' */
+       else if (*s == ' ')
+-        i += 4;                 /* #32; */
++        ok = INT_ADD_OK (i, 4, &i);     /* #32; */
++      else
++        ok = INT_ADD_OK (i, 1, &i);
++
++      if (!ok)
++        {
++          DEBUGP (("Overflow detected in html_quote_string().\n"));
++          abort();
++        }
+     }
+-  res = xmalloc (i + 1);
++
++  if (!INT_ADD_OK (i, 1, &i))
++    {
++      DEBUGP (("Overflow detected in html_quote_string().\n"));
++      abort();
++    }
++
++  res = xmalloc (i);
+   s = b;
+   for (p = res; *s; s++)
+     {
+-- 
+2.35.6
+
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index fa4958a485..be3b750880 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -7,6 +7,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
+           file://CVE-2026-58472-regression.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.35.6


