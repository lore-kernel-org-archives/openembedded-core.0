Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CACCD6E45
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 04:44:41 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3576.1780029287637367324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 21:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=axua87Yw;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jackson.james9803@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de4be15125so12657115a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780029287; x=1780634087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mnqm8ozh8H+IYXmc21J9Knc/NLB5WvSZRy+Hp+S+S44=;
        b=axua87Yw7GVZqjO5a6nzvbsoc6ZaS23iZ1zmUDbgwnUQ+GJgS0En9JMeOpLqi3nRyc
         zuBLL6ckt+jb1ua+m38Dj+VaP2yu9b/fiK6ziu0BoV7joAuuCHWe0bU2kxeJe8+IUozH
         OZfOCys/vA75JA51k7xDhKItU9UFk7/3t9Nhl+qCUXOkIvk02+f46v3PMKHF7MEkOS+/
         4+i98WRbXwMto940Fl/TJysXwygjXfS1CK9dXkanm3gOVnnrh6CyeGXC/nGQEf/2imR2
         l9hukNRxXXgrfqPKSu8sg/Y10Zv8of407660mNrPcnzm5MXTBhkNouH3mvfLi50qYXP6
         CT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780029287; x=1780634087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mnqm8ozh8H+IYXmc21J9Knc/NLB5WvSZRy+Hp+S+S44=;
        b=rszz3oU2owlbLuRlbiJNuUA6Q/55AMQvOHki/rUc8p489mKouZQGplE/mk3Mt9K3NJ
         jhqW4Ia8KB8Z9wDWQNT/Yv70Er0O8ryJQGC1SySPQSd1QPunqpsdQolEcBQB5Amh3g0s
         gz7kbdDsoKDzaLhcMoehruI9vSLJF85e7kz5oH/IxF2l3Yni5UDtQLkSo4P2LPPO9bpP
         UWMY4qpeKR66sbQ6hYU4kawJfVV4sXINadAhbO+QgCoLv2dI6Y9x+JBJvX5bMFxiYCgx
         wZnWnJ67Lb/QWAzrb72pNM79YWRs4XJKxwPXtCbyXwL1/db8fBMNTx1yObmvDvlfjWpm
         7fSA==
X-Gm-Message-State: AOJu0YxeK/bLrRzg9uK4ZBGDD2cXWdGoIqvjG+vUfvVRChYQiMNDhqwk
	3uZGN2wIrFUf64lPvGef27zR2stytMXKN266DsnwQfMTZlUV/+9t0NFNFHv14g==
X-Gm-Gg: Acq92OGDfJRyWW6SUsmTyr8LCgRKmgNRlBDaiDp5mOZPvpIyG1bEp9Zty9B12m5XI2e
	3eluFLbx+RvKsbGa7j9Tt651usQjOBe7eepwmcy9VKDlRTgHi7O37tZxJE7p2YGrlOZ8mgvwERD
	tLPJBksrz9VXQIlOR3sjINdeD2mhHNvMyIlRpaIBT4v6Rg9f5bowU/8SyGp7mI8EJii21e66iPh
	rf7IPB1r36BsmQvemZTeyM1NZHKeTv2/PWkuRjyBCLG5Z587gr7WV6eTnu1lmkRiSK1s03/PN1Q
	UaiYHF6JswAWf/fvaxhobSCiNU8D9d+wviLM95Tq/ximMQV0JB8lcGVOLTkWzCLbEnOFnXXC5rG
	5MVgc7W0Pgozo1tDXv4+lXK8j2Ulu3kXoZSHzWOPHRmO3/9leAmTum4YPsKImVrmIygLzPRnyQ1
	6f0P+9I1JP7xewacYxR2JzAGeUJE8KBp37T7rzCw==
X-Received: by 2002:a17:90b:528e:b0:36b:7113:591d with SMTP id 98e67ed59e1d1-36bbceb8b2emr1704294a91.22.1780028921151;
        Thu, 28 May 2026 21:28:41 -0700 (PDT)
Received: from LL-868L.kpit.com ([49.206.135.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc10c8746sm350339a91.0.2026.05.28.21.28.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 21:28:40 -0700 (PDT)
From: Jackson James <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson James <jacksonj2@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glibc: Fix CVEs
Date: Fri, 29 May 2026 09:58:11 +0530
Message-Id: <20260529042811.2210385-1-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237742

Fix the following CVEs-
CVE-2026-4046 CVE-2026-4437 CVE-2026-4438 CVE-2026-5450,
CVE-2026-5928

Signed-off-by: Jackson James <jacksonj2@kpit.com>
---
 ...ount-records-correctly-CVE-2026-4437.patch | 248 +++++++++++++
 ...eck-hostname-for-validity-CVE-2026-4.patch | 328 +++++++++++++++++
 ...x-buffer-overflow-in-scanf-mc-BZ-340.patch | 138 +++++++
 ...x-ungetwc-operating-on-byte-stream-B.patch | 117 ++++++
 ...e-pending-character-state-in-IBM1390.patch | 336 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   5 +
 6 files changed, 1172 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-records-correctly-CVE-2026-4437.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostname-for-validity-CVE-2026-4.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending-character-state-in-IBM1390.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-records-correctly-CVE-2026-4437.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-records-correctly-CVE-2026-4437.patch
new file mode 100644
index 0000000000..3ad5f41935
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-records-correctly-CVE-2026-4437.patch
@@ -0,0 +1,248 @@
+From 9f5f18aab40ec6b61fa49a007615e6077e9a979b Mon Sep 17 00:00:00 2001
+From: Carlos O'Donell <carlos@redhat.com>
+Date: Fri, 20 Mar 2026 16:43:33 -0400
+Subject: resolv: Count records correctly (CVE-2026-4437)
+
+The answer section boundary was previously ignored, and the code in
+getanswer_ptr would iterate past the last resource record, but not
+beyond the end of the returned data.  This could lead to subsequent data
+being interpreted as answer records, thus violating the DNS
+specification.  Such resource records could be maliciously crafted and
+hidden from other tooling, but processed by the glibc stub resolver and
+acted upon by the application.  While we trust the data returned by the
+configured recursive resolvers, we should not trust its format and
+should validate it as required.  It is a security issue to incorrectly
+process the DNS protocol.
+
+A regression test is added for response section crossing.
+
+No regressions on x86_64-linux-gnu.
+
+Reviewed-by: Collin Funk <collin.funk1@gmail.com>
+
+CVE: CVE-2026-4437
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=9f5f18aab40ec6b61fa49a007615e6077e9a979b]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ resolv/Makefile                 |   4 +
+ resolv/nss_dns/dns-host.c       |   2 +-
+ resolv/tst-resolv-dns-section.c | 162 ++++++++++++++++++++++++++++++++
+ 3 files changed, 167 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-dns-section.c
+
+diff --git a/resolv/Makefile b/resolv/Makefile
+index abff7fc0..7d2aa9b5 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -98,6 +98,7 @@ tests += \
+   tst-resolv-basic \
+   tst-resolv-binary \
+   tst-resolv-byaddr \
++  tst-resolv-dns-section \
+   tst-resolv-edns \
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+@@ -109,6 +110,7 @@ tests += \
+   tst-resolv-semi-failure \
+   tst-resolv-short-response \
+   tst-resolv-trailing \
++  # tests
+ 
+ # This test calls __res_context_send directly, which is not exported
+ # from libresolv.
+@@ -286,6 +288,8 @@ $(objpfx)tst-resolv-aliases: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-basic: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-binary: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-byaddr: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-dns-section: $(objpfx)libresolv.so \
++  $(shared-thread-library)
+ $(objpfx)tst-resolv-edns: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-network: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-res_init: $(objpfx)libresolv.so
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index 95a7b3f0..74a7c08d 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -820,7 +820,7 @@ getanswer_ptr (unsigned char *packet, size_t packetlen,
+   /* expected_name may be updated to point into this buffer.  */
+   unsigned char name_buffer[NS_MAXCDNAME];
+ 
+-  while (ancount > 0)
++  for (; ancount > 0; --ancount)
+     {
+       struct ns_rr_wire rr;
+       if (!__ns_rr_cursor_next (&c, &rr))
+diff --git a/resolv/tst-resolv-dns-section.c b/resolv/tst-resolv-dns-section.c
+new file mode 100644
+index 00000000..d233dc5f
+--- /dev/null
++++ b/resolv/tst-resolv-dns-section.c
+@@ -0,0 +1,162 @@
++/* Test handling of invalid section transitions (bug 34014).
++   Copyright (C) 2022-2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <array_length.h>
++#include <errno.h>
++#include <netdb.h>
++#include <resolv.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/format_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++
++/* Name of test, and the second section type.  */
++struct item {
++  const char *test;
++  int ns_section;
++};
++
++static const struct item test_items[] =
++  {
++    { "Test crossing from ns_s_an to ns_s_ar.", ns_s_ar },
++    { "Test crossing from ns_s_an to ns_s_an.", ns_s_ns },
++
++    { NULL, 0 },
++  };
++
++/* The response is designed to contain the following:
++   - An Answer section with one T_PTR record that is skipped.
++   - A second section with a semantically invalid T_PTR record.
++   The original defect is that the response parsing would cross
++   section boundaries and handle the additional section T_PTR
++   as if it were an answer.  A conforming implementation would
++   stop as soon as it reaches the end of the section.  */
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  TEST_COMPARE (qclass, C_IN);
++
++  /* We only test PTR.  */
++  TEST_COMPARE (qtype, T_PTR);
++
++  unsigned int count;
++  char *tail = NULL;
++
++  if (strstr (qname, "in-addr.arpa") != NULL
++      && sscanf (qname, "%u.%ms", &count, &tail) == 2)
++    TEST_COMPARE_STRING (tail, "0.168.192.in-addr.arpa");
++  else if (sscanf (qname, "%x.%ms", &count, &tail) == 2)
++    {
++    TEST_COMPARE_STRING (tail, "\
++0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa");
++    }
++  else
++    FAIL_EXIT1 ("invalid QNAME: %s\n", qname);
++  free (tail);
++
++  /* We have a bounded number of possible tests.  */
++  TEST_VERIFY (count >= 0);
++  TEST_VERIFY (count <= 15);
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++  resolv_response_section (b, ns_s_an);
++
++  /* Actual answer record, but the wrong name (skipped).  */
++  resolv_response_open_record (b, "1.0.0.10.in-addr.arpa", qclass, qtype, 60);
++
++  /* Record the answer.  */
++  resolv_response_add_name (b, "test.ptr.example.net");
++  resolv_response_close_record (b);
++
++  /* Add a second section to test section boundary crossing.  */
++  resolv_response_section (b, test_items[count].ns_section);
++  /* Semantically incorrect, but hide a T_PTR entry.  */
++  resolv_response_open_record (b, qname, qclass, qtype, 60);
++  resolv_response_add_name (b, "wrong.ptr.example.net");
++  resolv_response_close_record (b);
++}
++
++
++/* Perform one check using a reverse lookup.  */
++static void
++check_reverse (int af, int count)
++{
++  TEST_VERIFY (af == AF_INET || af == AF_INET6);
++  TEST_VERIFY (count < array_length (test_items));
++
++  char addr[sizeof (struct in6_addr)] = { 0 };
++  socklen_t addrlen;
++  if (af == AF_INET)
++    {
++      addr[0] = (char) 192;
++      addr[1] = (char) 168;
++      addr[2] = (char) 0;
++      addr[3] = (char) count;
++      addrlen = 4;
++    }
++  else
++    {
++      addr[0] = 0x20;
++      addr[1] = 0x01;
++      addr[2] = 0x0d;
++      addr[3] = 0xb8;
++      addr[4] = addr[5] = addr[6] = addr[7] = 0x0;
++      addr[8] = addr[9] = addr[10] = addr[11] = 0x0;
++      addr[12] = 0x0;
++      addr[13] = 0x0;
++      addr[14] = 0x0;
++      addr[15] = count;
++      addrlen = 16;
++    }
++
++  h_errno = 0;
++  struct hostent *answer = gethostbyaddr (addr, addrlen, af);
++  TEST_VERIFY (answer == NULL);
++  TEST_VERIFY (h_errno == NO_RECOVERY);
++  if (answer != NULL)
++    printf ("error: unexpected success: %s\n",
++	    support_format_hostent (answer));
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  for (int i = 0; test_items[i].test != NULL; i++)
++    {
++      check_reverse (AF_INET, i);
++      check_reverse (AF_INET6, i);
++    }
++
++  resolv_test_end (obj);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostname-for-validity-CVE-2026-4.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostname-for-validity-CVE-2026-4.patch
new file mode 100644
index 0000000000..b95cc99e06
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostname-for-validity-CVE-2026-4.patch
@@ -0,0 +1,328 @@
+From e10977481f4db4b2a3ce34fa4c3a1e26651ae312 Mon Sep 17 00:00:00 2001
+From: Carlos O'Donell <carlos@redhat.com>
+Date: Fri, 20 Mar 2026 17:14:33 -0400
+Subject: resolv: Check hostname for validity (CVE-2026-4438)
+
+The processed hostname in getanswer_ptr should be correctly checked to
+avoid invalid characters from being allowed, including shell
+metacharacters. It is a security issue to fail to check the returned
+hostname for validity.
+
+A regression test is added for invalid metacharacters and other cases
+of invalid or valid characters.
+
+No regressions on x86_64-linux-gnu.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-4438
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=e10977481f4db4b2a3ce34fa4c3a1e26651ae312]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ resolv/Makefile                 |   3 +
+ resolv/nss_dns/dns-host.c       |   2 +-
+ resolv/tst-resolv-invalid-ptr.c | 255 ++++++++++++++++++++++++++++++++
+ 3 files changed, 259 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-invalid-ptr.c
+
+diff --git a/resolv/Makefile b/resolv/Makefile
+index 7d2aa9b5..20ffa9b5 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -101,6 +101,7 @@ tests += \
+   tst-resolv-dns-section \
+   tst-resolv-edns \
+   tst-resolv-invalid-cname \
++  tst-resolv-invalid-ptr \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
+   tst-resolv-noaaaa-vc \
+@@ -299,6 +300,8 @@ $(objpfx)tst-resolv-res_init-thread: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
+   $(shared-thread-library)
++$(objpfx)tst-resolv-invalid-ptr: $(objpfx)libresolv.so \
++  $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index 74a7c08d..b8f5d61b 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -866,7 +866,7 @@ getanswer_ptr (unsigned char *packet, size_t packetlen,
+ 	  char hname[MAXHOSTNAMELEN + 1];
+ 	  if (__ns_name_unpack (c.begin, c.end, rr.rdata,
+ 				name_buffer, sizeof (name_buffer)) < 0
+-	      || !__res_binary_hnok (expected_name)
++	      || !__res_binary_hnok (name_buffer)
+ 	      || __ns_name_ntop (name_buffer, hname, sizeof (hname)) < 0)
+ 	    {
+ 	      *h_errnop = NO_RECOVERY;
+diff --git a/resolv/tst-resolv-invalid-ptr.c b/resolv/tst-resolv-invalid-ptr.c
+new file mode 100644
+index 00000000..9cdc4dce
+--- /dev/null
++++ b/resolv/tst-resolv-invalid-ptr.c
+@@ -0,0 +1,255 @@
++/* Test handling of invalid T_PTR results (bug 34015).
++   Copyright (C) 2022-2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <array_length.h>
++#include <errno.h>
++#include <netdb.h>
++#include <resolv.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/format_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++
++/* Name of test, the answer, the expected error return, and if we
++   expect the call to fail.  */
++struct item {
++  const char *test;
++  const char *answer;
++  int expected;
++  bool fail;
++};
++
++static const struct item test_items[] =
++  {
++    /* Test for invalid characters.  */
++    { "Invalid use of \"|\"",
++      "test.|.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"&\"",
++      "test.&.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \";\"",
++      "test.;.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"<\"",
++      "test.<.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \">\"",
++      "test.>.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"(\"",
++      "test.(.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \")\"",
++      "test.).ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"$\"",
++      "test.$.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"`\"",
++      "test.`.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\\\"",
++      "test.\\.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\'\"",
++      "test.'.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\"\"",
++      "test.\".ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \" \"",
++      "test. .ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\\t\"",
++      "test.\t.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\\n\"",
++      "test.\n.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"\\r\"",
++      "test.\r.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"*\"",
++      "test.*.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"?\"",
++      "test.?.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"[\"",
++      "test.[.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"]\"",
++      "test.].ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \",\"",
++      "test.,.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"~\"",
++      "test.~.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \":\"",
++      "test.:.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"!\"",
++      "test.!.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"@\"",
++      "test.@.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"#\"",
++      "test.#.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"%\"",
++      "test.%%.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of \"^\"",
++      "test.^.ptr.example", NO_RECOVERY, true },
++
++    /* Test for invalid UTF-8 characters (2-byte, 4-byte, 6-byte).  */
++    { "Invalid use of UTF-8 (2-byte, U+00C0-U+00C2)",
++      "ÁÂÃ.test.ptr.example", NO_RECOVERY, true },
++    { "Invalid use of UTF-8 (4-byte, U+0750-U+0752)",
++      "ݐݑݒ.test.ptr.example", NO_RECOVERY, true },
++     { "Invalid use of UTF-8 (6-byte, U+0904-U+0906)",
++      "ऄअआ.test.ptr.example", NO_RECOVERY, true },
++
++    /* Test for "-" which may be valid depending on position.  */
++    { "Invalid leading \"-\"",
++      "-test.ptr.example", NO_RECOVERY, true },
++    { "Valid trailing \"-\"",
++      "test-.ptr.example", 0, false },
++    { "Valid mid-label use of \"-\"",
++      "te-st.ptr.example", 0, false },
++
++    /* Test for "_" which is always valid in any position.  */
++    { "Valid leading use of \"_\"",
++      "_test.ptr.example", 0, false },
++    { "Valid mid-label use of \"_\"",
++      "te_st.ptr.example", 0, false },
++    { "Valid trailing use of \"_\"",
++      "test_.ptr.example", 0, false },
++
++    /* Sanity test the broader set [A-Za-z0-9_-] of valid characters.  */
++    { "Valid \"[A-Z]\"",
++      "test.ABCDEFGHIJKLMNOPQRSTUVWXYZ.ptr.example", 0, false },
++    { "Valid \"[a-z]\"",
++      "test.abcdefghijklmnopqrstuvwxyz.ptr.example", 0, false },
++    { "Valid \"[0-9]\"",
++      "test.0123456789.ptr.example", 0, false },
++    { "Valid mixed use of \"[A-Za-z0-9_-]\"",
++      "test.012abcABZ_-.ptr.example", 0, false },
++  };
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  TEST_COMPARE (qclass, C_IN);
++
++  /* We only test PTR.  */
++  TEST_COMPARE (qtype, T_PTR);
++
++  unsigned int count, count1;
++  char *tail = NULL;
++
++  /* The test implementation can handle up to 255 tests.  */
++  if (strstr (qname, "in-addr.arpa") != NULL
++      && sscanf (qname, "%u.%ms", &count, &tail) == 2)
++    TEST_COMPARE_STRING (tail, "0.168.192.in-addr.arpa");
++  else if (sscanf (qname, "%x.%x.%ms", &count, &count1, &tail) == 3)
++    {
++      TEST_COMPARE_STRING (tail, "\
++0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa");
++      count |= count1 << 4;
++    }
++  else
++    FAIL_EXIT1 ("invalid QNAME: %s\n", qname);
++  free (tail);
++
++  /* Cross check. Count has a fixed bound (soft limit).  */
++  TEST_VERIFY (count >= 0 && count <= 255);
++
++  /* We have a fixed number of tests (hard limit).  */
++  TEST_VERIFY_EXIT (count < array_length (test_items));
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++  resolv_response_section (b, ns_s_an);
++
++  /* Actual answer record.  */
++  resolv_response_open_record (b, qname, qclass, qtype, 60);
++
++  /* Record the answer.  */
++  resolv_response_add_name (b, test_items[count].answer);
++  resolv_response_close_record (b);
++}
++
++/* Perform one check using a reverse lookup.  */
++static void
++check_reverse (int af, int count)
++{
++  TEST_VERIFY (af == AF_INET || af == AF_INET6);
++  TEST_VERIFY_EXIT (count < array_length (test_items));
++
++  /* Generate an address to query for each test.  */
++  char addr[sizeof (struct in6_addr)] = { 0 };
++  socklen_t addrlen;
++  if (af == AF_INET)
++    {
++      addr[0] = (char) 192;
++      addr[1] = (char) 168;
++      addr[2] = (char) 0;
++      addr[3] = (char) count;
++      addrlen = 4;
++    }
++  else
++    {
++      addr[0] = 0x20;
++      addr[1] = 0x01;
++      addr[2] = 0x0d;
++      addr[3] = 0xb8;
++      addr[4] = addr[5] = addr[6] = addr[7] = 0x0;
++      addr[8] = addr[9] = addr[10] = addr[11] = 0x0;
++      addr[12] = 0x0;
++      addr[13] = 0x0;
++      addr[14] = 0x0;
++      addr[15] = (char) count;
++      addrlen = 16;
++    }
++
++  h_errno = 0;
++  struct hostent *answer = gethostbyaddr (addr, addrlen, af);
++
++  /* Verify h_errno is as expected.  */
++  TEST_COMPARE (h_errno, test_items[count].expected);
++  if (h_errno != test_items[count].expected)
++    /* And print more information if it's not.  */
++    printf ("INFO: %s\n", test_items[count].test);
++
++  if (test_items[count].fail)
++    {
++      /* We expected a failure so verify answer is NULL.  */
++      TEST_VERIFY (answer == NULL);
++      /* If it's not NULL we should print out what we received.  */
++      if (answer != NULL)
++        printf ("error: unexpected success: %s\n",
++		support_format_hostent (answer));
++    }
++  else
++    /* We don't expect a failure so answer must be valid.  */
++    TEST_COMPARE_STRING (answer->h_name, test_items[count].answer);
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  for (int i = 0; i < array_length (test_items); i++)
++    {
++      check_reverse (AF_INET, i);
++      check_reverse (AF_INET6, i);
++    }
++  resolv_test_end (obj);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch b/meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch
new file mode 100644
index 0000000000..989ddcdae8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch
@@ -0,0 +1,138 @@
+From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 17 Apr 2026 23:48:41 -0700
+Subject: stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2026-5450
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=839898777226a3ed88c0859f25ffe712519b4ead]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ stdio-common/Makefile              |  4 +++
+ stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
+ stdio-common/vfscanf-internal.c    |  7 +++---
+ 3 files changed, 56 insertions(+), 4 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+index c8224342..7d76f55a 100644
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -266,6 +266,7 @@ tests := \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV = MALLOC_TRACE=$(objpfx)tst-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV = \
++  MALLOC_CHECK_=3 \
++  LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf-bz34008.c
+new file mode 100644
+index 00000000..48371c8a
+--- /dev/null
++++ b/stdio-common/tst-vfscanf-bz34008.c
+@@ -0,0 +1,48 @@
++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
++   Copyright (C) 2026 The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "malloc/mcheck.h"
++#include <stddef.h>
++#include <stdio.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdlib.h>
++#include <malloc.h>
++#include <support/check.h>
++
++#define WIDTH 0x410
++#define SCANFSTR "%1040mc"
++static int
++do_test (void)
++{
++  mcheck_pedantic (NULL);
++  char *input = malloc (WIDTH + 1);
++  TEST_VERIFY (input != NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] = '\0';
++
++  char *buf = NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) != -1);
++  TEST_VERIFY (buf != NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-internal.c
+index 1b82deff..8a813e94 100644
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -853,8 +853,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 			{
+ 			  /* Enlarge the buffer.  */
+ 			  size_t newsize
+-			    = strsize
+-			      + (strsize >= width ? width - 1 : strsize);
++			    = strsize + (strsize >= width ? width : strsize);
+ 
+ 			  str = (char *) realloc (*strptr, newsize);
+ 			  if (str == NULL)
+@@ -925,7 +925,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		      && wstr == (wchar_t *) *strptr + strsize)
+ 		    {
+ 		      size_t newsize
+-			= strsize + (strsize > width ? width - 1 : strsize);
++			= strsize + (strsize >= width ? width : strsize);
+ 		      /* Enlarge the buffer.  */
+ 		      wstr = (wchar_t *) realloc (*strptr,
+ 						  newsize * sizeof (wchar_t));
+@@ -980,7 +980,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		    && wstr == (wchar_t *) *strptr + strsize)
+ 		  {
+ 		    size_t newsize
+-		      = strsize + (strsize > width ? width - 1 : strsize);
++		      = strsize + (strsize >= width ? width : strsize);
+ 		    /* Enlarge the buffer.  */
+ 		    wstr = (wchar_t *) realloc (*strptr,
+ 						newsize * sizeof (wchar_t));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch b/meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch
new file mode 100644
index 0000000000..21228a44b7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch
@@ -0,0 +1,117 @@
+From ef3bfb5f910011f3780cb06aa47e730035f53285 Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 1 May 2026 20:39:07 -0700
+Subject: libio: Fix ungetwc operating on byte stream [BZ #33998]
+
+* libio/wgenops.c: When _IO_wdefault_pbackfail attempts to push back one
+character, it accidently compare the wchar to push back with the last
+char from byte stream, instead of wide stream. Under specific coding,
+attacker may exploit this to leak information. This commit fix bug
+33998, or CVE-2026-5928.
+
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+
+CVE: CVE-2026-5928
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=ef3bfb5f910011f3780cb06aa47e730035f53285]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ libio/Makefile              |  1 +
+ libio/bug-wgenops-bz33998.c | 54 +++++++++++++++++++++++++++++++++++++
+ libio/wgenops.c             |  4 +--
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 libio/bug-wgenops-bz33998.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+index b189455b..20e2b056 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -83,6 +83,7 @@ tests = \
+   bug-ungetwc1 \
+   bug-ungetwc2 \
+   bug-wfflush \
++  bug-wgenops-bz33998 \
+   bug-wmemstream1 \
+   bug-wsetpos \
+   test-fmemopen \
+diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
+new file mode 100644
+index 00000000..cc4067da
+--- /dev/null
++++ b/libio/bug-wgenops-bz33998.c
+@@ -0,0 +1,54 @@
++/* Regression test for ungetwc operating on byte stream (BZ #33998)
++   Copyright (C) 2026 The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "support/temp_file.h"
++#include "support/xstdio.h"
++#include "support/xunistd.h"
++#include <stdlib.h>
++#include <unistd.h>
++#include <sys/mman.h>
++#include <stdio.h>
++#include <wchar.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  char *filename;
++  int fd = create_temp_file ("tst-bz33998-", &filename);
++  TEST_VERIFY (fd != -1);
++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
++  xclose (fd);
++
++  FILE *fp = xfopen (filename, "r+");
++  TEST_COMPARE (getwc (fp), L'A');
++  /* If the bug is fixed, then ungetwc should not touch byte stream.
++     If the bug is not fixed, ungetwc firstly match last read char, L'A',
++     failed, then the pbackfail branch, matching last read char in byte
++     stream, that is, '\0' (initialized when setup wide stream). */
++  char *old_read_ptr = fp->_IO_read_ptr;
++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
++  TEST_VERIFY (fp->_IO_read_ptr == old_read_ptr);
++
++  xfclose (fp);
++  free (filename);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/libio/wgenops.c b/libio/wgenops.c
+index adfb9701..14ece4e7 100644
+--- a/libio/wgenops.c
++++ b/libio/wgenops.c
+@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
+ {
+   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
+       && !_IO_in_backup (fp)
+-      && (wint_t) fp->_IO_read_ptr[-1] == c)
+-    --fp->_IO_read_ptr;
++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] == c)
++    --fp->_wide_data->_IO_read_ptr;
+   else
+     {
+       /* Need to handle a filebuf in write mode (switch to read mode). FIXME!*/
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending-character-state-in-IBM1390.patch b/meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending-character-state-in-IBM1390.patch
new file mode 100644
index 0000000000..3deccbc072
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending-character-state-in-IBM1390.patch
@@ -0,0 +1,336 @@
+From d6f08d1cf027f4eb2ba289a6cc66853722d4badc Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 16 Apr 2026 19:13:43 +0200
+Subject: Use pending character state in IBM1390, IBM1399 character sets
+ (CVE-2026-4046)
+
+Follow the example in iso-2022-jp-3.c and use the __count state
+variable to store the pending character.  This avoids restarting
+the conversion if the output buffer ends between two 4-byte UCS-4
+code points, so that the assert reported in the bug can no longer
+happen.
+
+Even though the fix is applied to ibm1364.c, the change is only
+effective for the two HAS_COMBINED codecs for IBM1390, IBM1399.
+
+The test case was mostly auto-generated using
+claude-4.6-opus-high-thinking, and composer-2-fast shows up in the
+log as well.  During review, gpt-5.4-xhigh flagged that the original
+version of the test case was not exercising the new character
+flush logic.
+
+This fixes bug 33980.
+
+Assisted-by: LLM
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+
+CVE: CVE-2026-4046
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=d6f08d1cf027f4eb2ba289a6cc66853722d4badc]
+
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ iconvdata/Makefile       |   4 +-
+ iconvdata/ibm1364.c      |  70 ++++++++++++++----
+ iconvdata/tst-bug33980.c | 153 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 211 insertions(+), 16 deletions(-)
+ create mode 100644 iconvdata/tst-bug33980.c
+
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index 7196a874..090ba929 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -76,7 +76,7 @@ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+ 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
+ 	bug-iconv13 bug-iconv14 bug-iconv15 \
+-	tst-iconv-iso-2022-cn-ext
++	tst-iconv-iso-2022-cn-ext tst-bug33980
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+@@ -333,6 +333,8 @@ $(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 			  $(addprefix $(objpfx),$(modules.so))
+ $(objpfx)tst-iconv-iso-2022-cn-ext.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 					$(addprefix $(objpfx),$(modules.so))
++$(objpfx)tst-bug33980.out: $(addprefix $(objpfx), $(gconv-modules)) \
++			   $(addprefix $(objpfx),$(modules.so))
+ 
+ $(objpfx)iconv-test.out: run-iconv-test.sh \
+ 			 $(addprefix $(objpfx), $(gconv-modules)) \
+diff --git a/iconvdata/ibm1364.c b/iconvdata/ibm1364.c
+index 4c37f30e..fd255a46 100644
+--- a/iconvdata/ibm1364.c
++++ b/iconvdata/ibm1364.c
+@@ -67,12 +67,29 @@
+ 
+ /* Since this is a stateful encoding we have to provide code which resets
+    the output state to the initial state.  This has to be done during the
+-   flushing.  */
++   flushing.  For the to-internal direction (FROM_DIRECTION is true),
++   there may be a pending character that needs flushing.  */
+ #define EMIT_SHIFT_TO_INIT \
+   if ((data->__statep->__count & ~7) != sb)				      \
+     {									      \
+       if (FROM_DIRECTION)						      \
+-	data->__statep->__count &= 7;					      \
++	{								      \
++	  uint32_t ch = data->__statep->__count >> 7;			      \
++	  if (__glibc_unlikely (ch != 0))				      \
++	    {								      \
++	      if (__glibc_unlikely (outend - outbuf < 4))		      \
++		status = __GCONV_FULL_OUTPUT;				      \
++	      else							      \
++		{							      \
++		  put32 (outbuf, ch);					      \
++		  outbuf += 4;						      \
++		  /* Clear character and db bit.  */			      \
++		  data->__statep->__count &= 7;				      \
++		}							      \
++	    }								      \
++	  else								      \
++	    data->__statep->__count &= 7;				      \
++	}								      \
+       else								      \
+ 	{								      \
+ 	  /* We are not in the initial state.  To switch back we have	      \
+@@ -99,11 +116,13 @@
+     *curcsp = save_curcs
+ 
+ 
+-/* Current codeset type.  */
++/* Current codeset type.  The bit is stored in the __count variable of
++   the conversion state.  If the db bit is set, bit 7 and above store
++   a pending UCS-4 code point if non-zero.  */
+ enum
+ {
+-  sb = 0,
+-  db = 64
++  sb = 0,			/* Single byte mode.  */
++  db = 64			/* Double byte mode.  */
+ };
+ 
+ 
+@@ -119,21 +138,29 @@ enum
+       }									      \
+     else								      \
+       {									      \
+-	/* This is a combined character.  Make sure we have room.  */	      \
+-	if (__glibc_unlikely (outptr + 8 > outend))			      \
+-	  {								      \
+-	    result = __GCONV_FULL_OUTPUT;				      \
+-	    break;							      \
+-	  }								      \
+-									      \
+ 	const struct divide *cmbp					      \
+ 	  = &DB_TO_UCS4_COMB[ch - __TO_UCS4_COMBINED_MIN];		      \
+ 	assert (cmbp->res1 != 0 && cmbp->res2 != 0);			      \
+ 									      \
+ 	put32 (outptr, cmbp->res1);					      \
+ 	outptr += 4;							      \
+-	put32 (outptr, cmbp->res2);					      \
+-	outptr += 4;							      \
++									      \
++	/* See whether we have room for the second character.  */	      \
++	if (outend - outptr >= 4)					      \
++	  {								      \
++	    put32 (outptr, cmbp->res2);					      \
++	    outptr += 4;						      \
++	  }								      \
++	else								      \
++	  {								      \
++	    /* Otherwise store only the first character now, and	      \
++	       put the second one into the queue.  */			      \
++	    curcs |= cmbp->res2 << 7;					      \
++	    inptr += 2;							      \
++	    /* Tell the caller why we terminate the loop.  */		      \
++	    result = __GCONV_FULL_OUTPUT;				      \
++	    break;							      \
++	  }								      \
+       }									      \
+   }
+ #else
+@@ -153,7 +180,20 @@ enum
+ #define LOOPFCT 		FROM_LOOP
+ #define BODY \
+   {									      \
+-    uint32_t ch = *inptr;						      \
++    uint32_t ch;							      \
++									      \
++    ch = curcs >> 7;							      \
++    if (__glibc_unlikely (ch != 0))					      \
++      {									      \
++	put32 (outptr, ch);						      \
++	outptr += 4;							      \
++	/* Remove the pending character, but preserve state bits.  */	      \
++	curcs &= (1 << 7) - 1;						      \
++	continue;							      \
++      }									      \
++									      \
++    /* Otherwise read the next input byte.  */				      \
++    ch = *inptr;							      \
+ 									      \
+     if (__builtin_expect (ch, 0) == SO)					      \
+       {									      \
+diff --git a/iconvdata/tst-bug33980.c b/iconvdata/tst-bug33980.c
+new file mode 100644
+index 00000000..c9693e0e
+--- /dev/null
++++ b/iconvdata/tst-bug33980.c
+@@ -0,0 +1,153 @@
++/* Test for bug 33980: combining characters in IBM1390/IBM1399.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <alloc_buffer.h>
++#include <errno.h>
++#include <iconv.h>
++#include <stdbool.h>
++#include <string.h>
++
++#include <support/check.h>
++#include <support/next_to_fault.h>
++#include <support/support.h>
++
++/* Run iconv in a loop with a small output buffer of OUTBUFSIZE bytes
++   starting at OUTBUF.  OUTBUF should be right before an unmapped page
++   so that writing past the end will fault.  Skip SHIFT bytes at the
++   start of the input and output, to exercise different buffer
++   alignment.  TRUNCATE indicates skipped bytes at the end of
++   input (0 and 1 a valid).  */
++static void
++test_one (const char *encoding, unsigned int shift, unsigned int truncate,
++          char *outbuf, size_t outbufsize)
++{
++  /* In IBM1390 and IBM1399, the DBCS code 0xECB5 expands to two
++     Unicode code points when translated.  */
++  static char input[] =
++    {
++      /* 8 letters X.  */
++      0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7,
++      /* SO, 0xECB5, SI: shift to DBCS, special character, shift back.  */
++      0x0e, 0xec, 0xb5, 0x0f
++    };
++
++  /* Expected output after UTF-8 conversion.  */
++  static char expected[] =
++    {
++      'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X',
++      /* U+304B (HIRAGANA LETTER KA).  */
++      0xe3, 0x81, 0x8b,
++      /* U+309A (COMBINING KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK).  */
++      0xe3, 0x82, 0x9a
++    };
++
++  iconv_t cd = iconv_open ("UTF-8", encoding);
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  char result_storage[64];
++  struct alloc_buffer result_buf
++    = alloc_buffer_create (result_storage, sizeof (result_storage));
++
++  char *inptr = &input[shift];
++  size_t inleft = sizeof (input) - shift - truncate;
++
++  while (inleft > 0)
++    {
++      char *outptr = outbuf;
++      size_t outleft = outbufsize;
++      size_t inleft_before = inleft;
++
++      size_t ret = iconv (cd, &inptr, &inleft, &outptr, &outleft);
++      size_t produced = outptr - outbuf;
++      alloc_buffer_copy_bytes (&result_buf, outbuf, produced);
++
++      if (ret == (size_t) -1 && errno == E2BIG)
++        {
++          if (produced == 0 && inleft == inleft_before)
++            {
++              /* Output buffer too small to make progress.  This is
++                 expected for very small output buffer sizes.  */
++              TEST_VERIFY_EXIT (outbufsize < 3);
++              break;
++            }
++          continue;
++        }
++      if (ret == (size_t) -1)
++        FAIL_EXIT1 ("%s (outbufsize %zu): iconv: %m", encoding, outbufsize);
++      break;
++    }
++
++  /* Flush any pending state (e.g. a buffered combined character).
++     With outbufsize < 3, we could not store the first character, so
++     the second character did not become pending, and there is nothing
++     to flush.  */
++  {
++    char *outptr = outbuf;
++    size_t outleft = outbufsize;
++
++    size_t ret = iconv (cd, NULL, NULL, &outptr, &outleft);
++    TEST_VERIFY_EXIT (ret == 0);
++    size_t produced = outptr - outbuf;
++    alloc_buffer_copy_bytes (&result_buf, outbuf, produced);
++
++    /* Second flush does not provide more data.  */
++    outptr = outbuf;
++    outleft = outbufsize;
++    ret = iconv (cd, NULL, NULL, &outptr, &outleft);
++    TEST_VERIFY_EXIT (ret == 0);
++    TEST_VERIFY (outptr == outbuf);
++  }
++
++  TEST_VERIFY_EXIT (!alloc_buffer_has_failed (&result_buf));
++  size_t result_used
++    = sizeof (result_storage) - alloc_buffer_size (&result_buf);
++
++  if (outbufsize >= 3)
++    {
++      TEST_COMPARE (inleft, 0);
++      TEST_COMPARE (result_used, sizeof (expected) - shift);
++      TEST_COMPARE_BLOB (result_storage, result_used,
++                         &expected[shift], sizeof (expected) - shift);
++    }
++  else
++    /* If the buffer is too small, only the leading X could be converted.  */
++    TEST_COMPARE (result_used, 8 - shift);
++
++  TEST_VERIFY_EXIT (iconv_close (cd) == 0);
++}
++
++static int
++do_test (void)
++{
++  struct support_next_to_fault ntf
++    = support_next_to_fault_allocate (8);
++
++  for (int shift = 0; shift <= 8; ++shift)
++    for (int truncate = 0; truncate < 2; ++truncate)
++      for (size_t outbufsize = 1; outbufsize <= 8; outbufsize++)
++        {
++          char *outbuf = ntf.buffer + ntf.length - outbufsize;
++          test_one ("IBM1390", shift, truncate, outbuf, outbufsize);
++          test_one ("IBM1399", shift, truncate, outbuf, outbufsize);
++        }
++
++  support_next_to_fault_free (&ntf);
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 7958d64eed..12a2e696ad 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -55,6 +55,11 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0024-CVE-2026-4437-Count-records-correctly-CVE-2026-4437.patch \
+           file://0025-CVE-2026-4438-Check-hostname-for-validity-CVE-2026-4.patch \
+           file://0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch \
+           file://0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch \
+           file://0028-CVE-2026-4046-Use-pending-character-state-in-IBM1390.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


