Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30511.1793870243232825457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=knvzD9AY;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17936; q=dns/txt;
  s=iport01; t=1793870243; x=1795079843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GhWhMuNdX1zT40n3GIajBg0NGOT0VajN0urWFwJVtko=;
  b=knvzD9AYAIq4/MDA14NQ/DcljOsDYFjvY+2Z/l4q1ahapziml0EzcvD7
   THrvD+WyaCmJPuLhd4rYONielZI7DYSgKHL6W+wHScodBSFxsS6iDpgKl
   NT8ZBrGFIX9Vtlm+8zekAvquBDA2gPmS1cm1vTXO2l8fjwAIBp7CUlHNM
   BlNWmVBp6/XhgiZZDs2dyzpOkYJTNfwn6NqAQey9R8yaRTbbCc0rmwDq+
   5uMVZChXQK7X2pjp+l7fzC2VlbUmzyUmg9/t+4B6y2xkJuDauSdgznEvn
   8rOfs9bo3c6fdoR2hFqynFsjKTKVkIkoddEtLzWJEGdHLJBUbUcRP1RBX
   A==;
X-CSE-ConnectionGUID: ErXQDTLoRueVy89ozA7t5g==
X-CSE-MsgGUID: SFbZIhP5RXGYyAM0D7Tpeg==
X-IPAS-Result: =?us-ascii?q?A0BGAgCwSOxq/43/Ja1aHgEBCxIMggULgld1YENJlV9sn?=
 =?us-ascii?q?iQUgWoPAQEBD0QNBAEBhD9Gjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEbt2GzeBe?=
 =?us-ascii?q?TOBAYIigQcBPwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFYNpgQWBXAEBg?=
 =?us-ascii?q?ScRD4ZfBIINFYEMgVoegwmJcQKBUoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKG?=
 =?us-ascii?q?BgNSBEsNxUZBD5uB5IvgxABAWIhCgETGAmBThUYkzQrCJAWgiGhEQoog3iMJ?=
 =?us-ascii?q?JU6GjOqcQuYfY4KlWEjTYRpgWg8gSgfCwdwFYJuATMJShkPjisDAQoLg2CBf?=
 =?us-ascii?q?8xOJjICCTIBAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:Mz2SA678tXWxpBkePuFHJQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mFODWmEa/2NM2ujKtsgPNjkoEJU6pCGnN83QFY++Sg8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEJcow8pLJWZ06
 PEmOWBcaQKq2P7rz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeJIY3aH5sLwy50o
 Er90W7LIxEiaeav5guU21f0qrDzhS70Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:XHCNca4BXMMpRGRhjwPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:Z8HMH21D46+gkxtB84bol7xfN9oVS1Hh6HDqPkKGGDY4T6+8FkPN9/Yx
X-Talos-MUID: 9a23:omv96AuBI4eU4AL9FM2nvx9oBuZo2/mUOG88gLwj4+XbCTR9NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="543982665"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:17:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 24782180005D7;
	Thu,  5 Nov 2026 09:17:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C195DCC1611; Thu,  5 Nov 2026 01:17:21 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/3] expat: fix CVE-2026-113351
Date: Thu,  5 Nov 2026 01:17:17 -0800
Message-Id: <20261105091719.1622520-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 09:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249521
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the allocation-tracking reset fix [1] from upstream PR [2],
which is referenced by the NVD record [3].

Snapshot retained allocations during XML_ParserReset() and exclude
those bytes from the next document's allocation-amplification checks.
Include the required counter extraction, accounting-settings
correction and both upstream regression tests from the same PR.

Retain Expat 2.8.3's XmlBigCount counters and adapt the accounting
regression to its existing protection-setting APIs. Omit the PR's
comment-only encoding-check change because the later check that it
explains is absent from this source.

[1] https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3
[2] https://github.com/libexpat/libexpat/pull/1431
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-113351

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-113351_p1.patch      | 39 ++++++++
 .../expat/expat/CVE-2026-113351_p2.patch      | 65 +++++++++++++
 .../expat/expat/CVE-2026-113351_p3.patch      | 80 ++++++++++++++++
 .../expat/expat/CVE-2026-113351_p4.patch      | 95 +++++++++++++++++++
 .../expat/expat/CVE-2026-113351_p5.patch      | 70 ++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  7 +-
 6 files changed, 355 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
new file mode 100644
index 0000000000..cbb52a5412
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p1.patch
@@ -0,0 +1,39 @@
+From 45bb6e5bf4c288f3ea3dd4c1d2b4f93702d4aac3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 17 Oct 2026 20:43:01 +0200
+Subject: [PATCH] lib: Extract variable `bytesAllocated`
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16b6b2d583f8de3fe204f5ce3c2a6b9f1e2b4cd7]
+
+Backport Changes:
+- Drop the upstream expat/ prefix to match the release tarball.
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
+index cb8839be..74e832e2 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -871,11 +871,13 @@ expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
new file mode 100644
index 0000000000..c5153a4825
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p2.patch
@@ -0,0 +1,65 @@
+From 8cd33639f458d1bad41be4c455f2878653cb1014 Mon Sep 17 00:00:00 2001
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
+- Drop the upstream expat/ prefix to match the release tarball.
+- Retain XmlBigCount for the new reset snapshot and local byte count.
+- Place the snapshot before the existing success return. Expat 2.8.3
+  lacks the later encoding-name allocation-failure check, so omit the
+  comment-only prerequisite ba431e267e751bfd0ed8bb608d21b0b1b52bd604.
+
+(cherry picked from commit a6cf8a6944b6c6d81e74c4cd95faa29132e67aa3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 74e832e2..638f35c0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -479,6 +479,7 @@ typedef struct accounting {
+ typedef struct MALLOC_TRACKER {
+   XmlBigCount bytesAllocated;
+   XmlBigCount peakBytesAllocated; // updated live only for debug level >=2
++  XmlBigCount bytesAllocatedWhenLastReset;
+   unsigned long debugLevel;
+   float maximumAmplificationFactor; // >=1.0
+   XmlBigCount activationThresholdBytes;
+@@ -871,7 +872,16 @@ expat_heap_increase_tolerable(XML_Parser rootParser, XmlBigCount increase,
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
+@@ -1651,6 +1661,11 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
new file mode 100644
index 0000000000..7fd8c06b87
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p3.patch
@@ -0,0 +1,80 @@
+From 29dd825cec80e0e68c5dd7c2e692505e02ba1563 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Oct 2026 17:55:36 +0200
+Subject: [PATCH] tests/alloc_tests.c: Cover `XML_ParserReset` alloc tracker
+ neutrality
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c400537c2df393161946d60bedbdc2c3a7e971ef]
+
+Backport Changes:
+- Drop the upstream expat/ prefix to match the release tarball.
+- Insert the test beside the existing allocation-tracker API tests;
+  the newer property-API round-trip test is absent from Expat 2.8.3.
+
+(cherry picked from commit c400537c2df393161946d60bedbdc2c3a7e971ef)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/alloc_tests.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 42 insertions(+)
+
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index c7939708..76aebdbe 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2273,6 +2273,47 @@ START_TEST(test_alloc_tracker_api) {
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
+@@ -2386,6 +2427,7 @@ make_alloc_test_case(Suite *s) {
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_threshold);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_getbuffer_unlimited);
+   tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_api);
++  tcase_add_test__if_xml_ge(tc_alloc, test_alloc_tracker_reset_neutrality);
+ 
+   tcase_add_test(tc_alloc, test_mem_api_cycle);
+   tcase_add_test__if_xml_ge(tc_alloc, test_mem_api_unlimited);
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
new file mode 100644
index 0000000000..1ce4e4ee26
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p4.patch
@@ -0,0 +1,95 @@
+From 6c2084fc5609cb64822e0dc7085cc796846f7eee Mon Sep 17 00:00:00 2001
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
+Backport Changes:
+- Drop the upstream expat/ prefix to match the release tarball.
+
+(cherry picked from commit 8b722a1453b8179dbda9876df2af4ce62e34b00c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 638f35c0..ee89502d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -638,7 +638,8 @@ static XML_Parser parserCreate(const XML_Char *encodingName,
+                                const XML_Char *nameSep, DTD *dtd,
+                                XML_Parser parentParser);
+ 
+-static void parserInit(XML_Parser parser, const XML_Char *encodingName);
++static void parserInit(XML_Parser parser, const XML_Char *encodingName,
++                       bool isReset);
+ 
+ #if XML_GE == 1
+ static float accountingGetCurrentAmplification(XML_Parser rootParser);
+@@ -1482,7 +1483,7 @@ parserCreate(const XML_Char *encodingName,
+ 
+   poolInit(&parser->m_tempPool, parser);
+   poolInit(&parser->m_temp2Pool, parser);
+-  parserInit(parser, encodingName);
++  parserInit(parser, encodingName, /*isReset=*/false);
+ 
+   if (encodingName && ! parser->m_protocolEncodingName) {
+     if (dtd) {
+@@ -1509,7 +1510,7 @@ parserCreate(const XML_Char *encodingName,
+ }
+ 
+ static void
+-parserInit(XML_Parser parser, const XML_Char *encodingName) {
++parserInit(XML_Parser parser, const XML_Char *encodingName, bool isReset) {
+   parser->m_processor = prologInitProcessor;
+   XmlPrologStateInit(&parser->m_prologState);
+   if (encodingName != NULL) {
+@@ -1590,15 +1591,24 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
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
+@@ -1659,7 +1669,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   poolClear(&parser->m_temp2Pool);
+   FREE(parser, (void *)parser->m_protocolEncodingName);
+   parser->m_protocolEncodingName = NULL;
+-  parserInit(parser, encodingName);
++  parserInit(parser, encodingName, /*isReset=*/true);
+   dtdReset(parser->m_dtd, parser);
+ #if XML_GE == 1
+   parser->m_alloc_tracker.bytesAllocatedWhenLastReset
diff --git a/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch
new file mode 100644
index 0000000000..03a325422b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-113351_p5.patch
@@ -0,0 +1,70 @@
+From 488381c6972b5cec8764f0d08834b536b07b923d Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Oct 2026 18:35:15 +0200
+Subject: [PATCH] tests/acc_tests.c: Cover `XML_ParserReset` accounting
+ neutrality
+
+CVE: CVE-2026-113351
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f74501d61e09341a8a2899c65a03a5bbb1fa4535]
+
+Backport Changes:
+- Drop the upstream expat/ prefix to match the release tarball.
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
+index 5e38dee0..d9f58a49 100644
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
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 02a8536440..4f2672c955 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2"
 
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
+SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://run-ptest \
            file://CVE-2026-66046-01.patch \
            file://CVE-2026-66046-02.patch \
@@ -20,6 +20,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-93990-02.patch \
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

