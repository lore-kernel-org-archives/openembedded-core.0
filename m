Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25429.1795543958546877115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WUPwl4Mo;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17113; q=dns/txt;
  s=iport01; t=1795543958; x=1796753558;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qLw0BcyIoqQakr0cbXOA6YhWa5K/rmV4WMKmNdoIZps=;
  b=WUPwl4MomLcTwnNhP/zdL+dUViyxlx5fe1FT32z5ziEy0x6Fs9rx7iZq
   wgUnabXnyLCIqY091ZofdVVmntPzULbJYXJRsn91OmLxY4N5s1w+qM9Am
   XAv4AkdwWNWghgGHDwMr+ifJxJlmPEocatX5Tsx8W2x/EczqvgPaMOfnA
   didpmfnAsZ6M591zh7TnvPPBBYhEgDg5HdfQPJqtRNNK9VyPvDqiNeJzq
   aD9YPwbJAOuNVljW/61X/waNrg97GGqg5ZNUu+NN5O3CVeAq2/drZnO5c
   T7YjGx/VbzHj0CIDpOEeWQOWVnaXFoyAQRjNwh+gYwIk1S3wvKxzMoznL
   Q==;
X-CSE-ConnectionGUID: jrBSvYsCSgicLQOn/u7X2w==
X-CSE-MsgGUID: APR5PzAWSmCyc9DRZs3mZA==
X-IPAS-Result: =?us-ascii?q?A0BGAgAuvAVr/9VK/pBaglmCV3VgQ0mWS54sFIFqDwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/Ro4kAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBKgsBGAEtLAMBAlojIYMCAYJ0AxG6Fhs3gXkzgQGCIoEHA?=
 =?us-ascii?q?T8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FygRWDaoEFgVwBAYEnEQ+GXwSCD?=
 =?us-ascii?q?RWBDIFUHoMGiXMCgU+ISkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CH?=
 =?us-ascii?q?xAGFiELHBgNSBEsNxUZBD5uB5QVgxkBAWIrARMYCYFOFRiTNCsIkjahEQoog?=
 =?us-ascii?q?3mMJJU6GjOqcguYfY4KlWEjTYRqgWg8gSgfCwdwFYJuATMJShkPjisDCwuDY?=
 =?us-ascii?q?IF/zFwmMgIJMgEBBwIHDgMLgWiQAAEngVYBAQ?=
IronPort-Data: A9a23:Lv85saz7UtSAdmTMGKF6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 WQfXD3UaP+MZWfzetAnYIW0pxtQsJTTyYM2S1FsrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEMsF7YGy/1cOm5P/
 tghDzZKc0+z3f3jldpXSsE07igiBMDmJsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2bC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oa1aoePJoLRLSlTtm+gn
 D/+7U3GORQxJdfO5QC36SmptMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:xrjwmK9VooMH9iPYf7huk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:banChGwQcdYsjSbaF472BgUWAOoebEzG50zfIkScMEFvD6DKeQWPrfY=
X-Talos-MUID: 9a23:vigOuAoJds+0qaVtQrEezxhaDppQ8Y2RM0UmgJ5Xl/O2Lnd1CR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60252463"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 18:12:36 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id D35401800035D;
	Tue, 24 Nov 2026 18:12:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7913ECC1611; Tue, 24 Nov 2026 10:12:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][blacksail][PATCH 1/3] expat: fix CVE-2026-113351
Date: Tue, 24 Nov 2026 10:12:27 -0800
Message-Id: <20261124181229.1704425-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 18:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251071
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the allocation-tracking reset fix [1] from upstream PR [2],
which is referenced by the NVD record [3].

Snapshot retained allocations during XML_ParserReset() and exclude
those bytes from the next document's allocation-amplification checks.
Include the required counter extraction, accounting-settings
correction and both upstream regression tests from the same PR.

Retain Expat 2.8.5's XmlBigCount counters and adapt the accounting
regression to its existing protection-setting APIs. Omit the PR's
comment-only encoding-check change because the later check that it
explains is absent from this source.

Refreshed for Blacksail 5b458838c126051c884c8cb5225c7265d1483ea6.
Source patches apply without fuzz. Builds and runtime tests were
not rerun.

[1] https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3
[2] https://github.com/libexpat/libexpat/pull/1431
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-113351

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-113351_p1.patch      | 40 ++++++++
 .../expat/expat/CVE-2026-113351_p2.patch      | 64 +++++++++++++
 .../expat/expat/CVE-2026-113351_p3.patch      | 77 +++++++++++++++
 .../expat/expat/CVE-2026-113351_p4.patch      | 94 +++++++++++++++++++
 .../expat/expat/CVE-2026-113351_p5.patch      | 71 ++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |  5 +
 6 files changed, 351 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
new file mode 100644
index 00000000000..00868aab3b4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
@@ -0,0 +1,40 @@
+From 16b6b2d583f8de3fe204f5ce3c2a6b9f1e2b4cd7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 17 Oct 2026 20:43:01 +0200
+Subject: [PATCH] lib: Extract variable `bytesAllocated`
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16b6b2d583f8de3fe204f5ce3c2a6b9f1e2b4cd7]
+
+Backport Changes:
+- Retain XmlBigCount and its maximum-value overflow check instead of
+  the newer size_t and SIZE_MAX allocation-counter representation.
+
+(cherry picked from commit 16b6b2d583f8de3fe204f5ce3c2a6b9f1e2b4cd7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0ece606716b5..2a1b5ef1c094 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -846,11 +846,13 @@ expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
+   XmlBigCount newTotal = 0;
+   bool tolerable = true;
+ 
++  const XmlBigCount bytesAllocated = rootParser->m_alloc_tracker.bytesAllocated;
++
+   // Detect integer overflow
+-  if ((XmlBigCount)-1 - rootParser->m_alloc_tracker.bytesAllocated < increase) {
++  if ((XmlBigCount)-1 - bytesAllocated < increase) {
+     tolerable = false;
+   } else {
+-    newTotal = rootParser->m_alloc_tracker.bytesAllocated + increase;
++    newTotal = bytesAllocated + increase;
+ 
+     if (newTotal >= rootParser->m_alloc_tracker.activationThresholdBytes) {
+       assert(newTotal > 0);
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
new file mode 100644
index 00000000000..753d45068d6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
@@ -0,0 +1,64 @@
+From a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 17 Oct 2026 20:51:49 +0200
+Subject: [PATCH] lib: Offset allocation tracking at `XML_ParserReset` time
+
+.. to enforce the same rules to later parses as to the first
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3]
+
+Backport Changes:
+- Retain XmlBigCount for the new reset snapshot and local byte count;
+  Expat 2.8.5 uses this type for its allocation-tracking counters.
+
+(cherry picked from commit a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2a1b5ef1c094..0213243e8b00 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -464,6 +464,7 @@ typedef struct accounting {
+ typedef struct MALLOC_TRACKER {
+   XmlBigCount bytesAllocated;
+   XmlBigCount peakBytesAllocated; // updated live only for debug level >=2
++  XmlBigCount bytesAllocatedWhenLastReset;
+   unsigned long debugLevel;
+   float maximumAmplificationFactor; // >=1.0
+   XmlBigCount activationThresholdBytes;
+@@ -846,7 +847,16 @@ expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
+   XmlBigCount newTotal = 0;
+   bool tolerable = true;
+ 
+-  const XmlBigCount bytesAllocated = rootParser->m_alloc_tracker.bytesAllocated;
++  // The idea is to subtract the amount of memory that was already
++  // allocated the last time that `XML_ParserReset` was called for
++  // this parser, the memory use of one document could skew the
++  // memory statso of the next document.
++  const XmlBigCount bytesAllocated
++      = (rootParser->m_alloc_tracker.bytesAllocatedWhenLastReset
++         > rootParser->m_alloc_tracker.bytesAllocated)
++            ? 0
++            : (rootParser->m_alloc_tracker.bytesAllocated
++               - rootParser->m_alloc_tracker.bytesAllocatedWhenLastReset);
+ 
+   // Detect integer overflow
+   if ((XmlBigCount)-1 - bytesAllocated < increase) {
+@@ -1627,6 +1637,11 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_protocolEncodingName = NULL;
+   parserInit(parser, encodingName);
+   dtdReset(parser->m_dtd, parser);
++#if XML_GE == 1
++  parser->m_alloc_tracker.bytesAllocatedWhenLastReset
++      = parser->m_alloc_tracker.bytesAllocated;
++#endif
++
+   return XML_TRUE;
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
new file mode 100644
index 00000000000..a2adbac3639
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
@@ -0,0 +1,77 @@
+From c400537c2df393161946d60bedbdc2c3a7e971ef Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Oct 2026 17:55:36 +0200
+Subject: [PATCH] tests/alloc_tests.c: Cover `XML_ParserReset` alloc tracker
+ neutrality
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c400537c2df393161946d60bedbdc2c3a7e971ef]
+
+(cherry picked from commit c400537c2df393161946d60bedbdc2c3a7e971ef)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/alloc_tests.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 42 insertions(+)
+
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index d206f11a1d8e..6dcfe93468a6 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2277,6 +2277,47 @@ START_TEST(test_alloc_tracker_api) {
+ }
+ END_TEST
+ 
++START_TEST(test_alloc_tracker_reset_neutrality) {
++  // Speed up the test, chunk size expected to not matter in this test
++  if (g_chunkSize != 0)
++    return;
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  const char *const small = "<hello/>";
++
++  // Create a document that drives `parser->m_alloc_tracker.bytesAllocated`
++  // towards the activation threshold
++#if XML_GE == 1
++  const size_t bigSizeBytes
++      = (size_t)(1.1f * EXPAT_ALLOC_TRACKER_ACTIVATION_THRESHOLD_DEFAULT);
++  const char *const before = "<doc a='";
++  const char *const after = "'/>";
++  char *const big = malloc(bigSizeBytes);
++  assert_true(big != NULL);
++  memset(big, 'X', bigSizeBytes);
++  memcpy(big, before, strlen(before)); // without zero terminator
++  strcpy(big + (bigSizeBytes - strlen(after) - 1),
++         after);                                // with zero terminator
++  assert_true(strlen(big) == bigSizeBytes - 1); // self-test
++
++  assert_true(
++      _XML_Parse_SINGLE_BYTES(parser, big, strlen(big), /*isFinal=*/XML_TRUE)
++      == XML_STATUS_OK);
++
++  free(big);
++#endif // XML_GE == 1
++
++  XML_ParserReset(parser, NULL);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, small, strlen(small),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ START_TEST(test_mem_api_cycle) {
+   XML_Parser parser = XML_ParserCreate(NULL);
+ 
+@@ -2390,6 +2431,7 @@ make_alloc_test_case(Suite *s) {
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_threshold);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_getbuffer_unlimited);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_api);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_reset_neutrality);
+ 
+   tcase_add_test(tc_alloc, test_mem_api_cycle);
+   tcase_add_test__if_xml_ge(tc_alloc, test_mem_api_unlimited);
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
new file mode 100644
index 00000000000..8d4c4e94095
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
@@ -0,0 +1,94 @@
+From 8b722a1453b8179dbda9876df2af4ce62e34b00c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Oct 2026 19:17:06 +0200
+Subject: [PATCH] lib: Stop `XML_ParserReset` from resetting accounting
+ settings
+
+.. and debugging levels
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8b722a1453b8179dbda9876df2af4ce62e34b00c]
+
+(cherry picked from commit 8b722a1453b8179dbda9876df2af4ce62e34b00c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0213243e8b00..fed2cf69a16e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -613,7 +613,8 @@ static XML_Parser parserCreate(const XML_Char *encodingName,
+                                const XML_Char *nameSep, DTD *dtd,
+                                XML_Parser parentParser);
+ 
+-static void parserInit(XML_Parser parser, const XML_Char *encodingName);
++static void parserInit(XML_Parser parser, const XML_Char *encodingName,
++                       bool isReset);
+ 
+ #if XML_GE == 1
+ static float accountingGetCurrentAmplification(XML_Parser rootParser);
+@@ -1458,7 +1459,7 @@ parserCreate(const XML_Char *encodingName,
+ 
+   poolInit(&parser->m_tempPool, parser);
+   poolInit(&parser->m_temp2Pool, parser);
+-  parserInit(parser, encodingName);
++  parserInit(parser, encodingName, /*isReset=*/false);
+ 
+   if (encodingName && ! parser->m_protocolEncodingName) {
+     if (dtd) {
+@@ -1485,7 +1486,7 @@ parserCreate(const XML_Char *encodingName,
+ }
+ 
+ static void
+-parserInit(XML_Parser parser, const XML_Char *encodingName) {
++parserInit(XML_Parser parser, const XML_Char *encodingName, bool isReset) {
+   parser->m_processor = prologInitProcessor;
+   XmlPrologStateInit(&parser->m_prologState);
+   if (encodingName != NULL) {
+@@ -1566,15 +1567,24 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_hash_secret_salt_set = XML_FALSE;
+ 
+ #if XML_GE == 1
+-  memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+-  parser->m_accounting.debugLevel = getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
+-  parser->m_accounting.maximumAmplificationFactor
+-      = EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT;
+-  parser->m_accounting.activationThresholdBytes
+-      = EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT;
+-
+-  memset(&parser->m_entity_stats, 0, sizeof(ENTITY_STATS));
+-  parser->m_entity_stats.debugLevel = getDebugLevel("EXPAT_ENTITY_DEBUG", 0u);
++  parser->m_accounting.countBytesDirect = 0;
++  parser->m_accounting.countBytesIndirect = 0;
++  if (! isReset) {
++    parser->m_accounting.debugLevel
++        = getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
++    parser->m_accounting.maximumAmplificationFactor
++        = EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT;
++    parser->m_accounting.activationThresholdBytes
++        = EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT;
++  }
++
++  parser->m_entity_stats.countEverOpened = 0;
++  parser->m_entity_stats.currentDepth = 0;
++  parser->m_entity_stats.maximumDepthSeen = 0;
++  if (! isReset)
++    parser->m_entity_stats.debugLevel = getDebugLevel("EXPAT_ENTITY_DEBUG", 0u);
++#else
++  UNUSED_P(isReset);
+ #endif
+ }
+ 
+@@ -1635,7 +1645,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   poolClear(&parser->m_temp2Pool);
+   FREE(parser, (void *)parser->m_protocolEncodingName);
+   parser->m_protocolEncodingName = NULL;
+-  parserInit(parser, encodingName);
++  parserInit(parser, encodingName, /*isReset=*/true);
+   dtdReset(parser->m_dtd, parser);
+ #if XML_GE == 1
+   parser->m_alloc_tracker.bytesAllocatedWhenLastReset
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch
new file mode 100644
index 00000000000..95ac5e87d94
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch
@@ -0,0 +1,71 @@
+From f74501d61e09341a8a2899c65a03a5bbb1fa4535 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Oct 2026 18:35:15 +0200
+Subject: [PATCH] tests/acc_tests.c: Cover `XML_ParserReset` accounting
+ neutrality
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f74501d61e09341a8a2899c65a03a5bbb1fa4535]
+
+Backport Changes:
+- Use the existing XML_SetBillionLaughsAttackProtection APIs and
+  XML_TRUE return checks instead of the unavailable property APIs.
+  Rewrap the calls for their older signatures and use the float limit.
+
+(cherry picked from commit f74501d61e09341a8a2899c65a03a5bbb1fa4535)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/acc_tests.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/tests/acc_tests.c b/tests/acc_tests.c
+index 5e38dee0f5e2..d9f58a490bec 100644
+--- a/tests/acc_tests.c
++++ b/tests/acc_tests.c
+@@ -440,6 +440,36 @@ START_TEST(test_amplification_isolated_external_parser) {
+ }
+ END_TEST
+ 
++START_TEST(test_amplification_reset_neutrality) {
++  // Speed up the test, chunk size expected to not matter in this test
++  if (g_chunkSize != 0)
++    return;
++
++  const char *const doc
++      = "<!DOCTYPE r [<!ENTITY e 'general entity'>]><r>&e;</r>";
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(
++      XML_SetBillionLaughsAttackProtectionMaximumAmplification(parser, 1.0f)
++      == XML_TRUE);
++  assert_true(XML_SetBillionLaughsAttackProtectionActivationThreshold(parser, 0)
++              == XML_TRUE);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_ERROR);
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_AMPLIFICATION_LIMIT_BREACH);
++
++  assert_true(XML_ParserReset(parser, NULL) == XML_STATUS_OK);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_ERROR);
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_AMPLIFICATION_LIMIT_BREACH);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ #endif // XML_GE == 1
+ 
+ void
+@@ -454,6 +484,7 @@ make_accounting_test_case(Suite *s) {
+   tcase_add_test(tc_accounting, test_helper_unsigned_char_to_printable);
+   tcase_add_test__ifdef_xml_dtd(tc_accounting,
+                                 test_amplification_isolated_external_parser);
++  tcase_add_test(tc_accounting, test_amplification_reset_neutrality);
+ #else
+   UNUSED_P(s);
+ #endif /* XML_GE == 1 */
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.8.5.bb
index 125d0e1f82e..2faedb35c7e 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -12,6 +12,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-102633.patch \
            file://CVE-2026-77214.patch \
+           file://CVE-2026-113351_p1.patch \
+           file://CVE-2026-113351_p2.patch \
+           file://CVE-2026-113351_p3.patch \
+           file://CVE-2026-113351_p4.patch \
+           file://CVE-2026-113351_p5.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
