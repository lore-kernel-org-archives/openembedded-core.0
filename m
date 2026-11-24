Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25322.1795543958542925616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QCwZNsuv;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8223; q=dns/txt;
  s=iport01; t=1795543958; x=1796753558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xhjVwDrIohRadWguO8kTVcIUnht0vVRdjo9LD8NVg5Q=;
  b=QCwZNsuvS8rMPnQUJE2RhJnc2CTeCflHOWH0jCMUpsBcbDJLBpCmZKk0
   U7SXkeHDndHhYd1gjmxb0x5EIruHrlPUKDHgbhxOu8QrKCQSfBRjG9GM3
   1dC6t8l5U//D+p1K92EkAVxyreEoYCTpP/4ZVJexOEr+UPIc7bgb9XwZ8
   lGZq3D7Kxw3bWQfwmwDEoc8eTl+UKODfzy40xd/uq2+lpsgM3Jj/6Cdtv
   wxoANuKVk2jye8dnyZgqYNuJIMC9K4TqzVV5vGWatP5hkRJbuHAiGGtrx
   JrYJiAsq8jz2B393koQUd/Kk9cZMvpRblGbvhZvSOZWHYGaRNp+6nP/xj
   w==;
X-CSE-ConnectionGUID: rkOVBUEnTQW1hEnt0U0Ntw==
X-CSE-MsgGUID: jHW9xfLETsm0BndS2hUcgg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBD0gVr/85K/pBaglmCV3VgQ0mWSwOeKYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEbokGzeBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVCiCVdGAGCS4IzJxsbgXKBFYNqgQWBXAEBiCYEg?=
 =?us-ascii?q?g0VgQyBVB6MeQKBT4hVSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfE?=
 =?us-ascii?q?AYWIQsvGA1IESw3FRkEPm4HlB6DGxZNKwETGIEgSJN7AZAcgiGhEQoog3mMJ?=
 =?us-ascii?q?JU6GjOEBJQaklQLmH2OCpZRhGqBaDyBKAEaBAsHcBWCbgEzCUoZD44uCwuDY?=
 =?us-ascii?q?IF/zFwmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:UvkbqqKl+Pcga6iIFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENShmECx
 2MaCjzVafnZZzGkfNhwPdnlpB5VscTQnYVhTwUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10D2YIF7A1/NpOPjhO2
 PoEcA1VSAyc0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQviuizbYeEK7RmQ+1XvnnJt
 mzi0ljiB0kwMtCkkzq4+X2j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkveS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:NFjwAKqHTxAJNhLozqpF7egaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:0ZYIS2Mv3Aiwre5DQipAymQpN8YZS0KEzFrWPxeFUUB1V+jA
X-Talos-MUID: 9a23:5GP0sQvc+JOTXoLWU82nhhFdZddmx4mSE0VVu5MKgJOECCd/NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="62865599"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 18:12:36 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id CBBB218000231;
	Tue, 24 Nov 2026 18:12:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7F264CBF202; Tue, 24 Nov 2026 10:12:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][blacksail][PATCH 3/3] expat: fix CVE-2026-124317
Date: Tue, 24 Nov 2026 10:12:29 -0800
Message-Id: <20261124181229.1704425-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124181229.1704425-1-dkelaiya@cisco.com>
References: <20261124181229.1704425-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 18:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251070
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the unknown-encoding decoder fix [1] identified by [2] to
Expat 2.8.5. Applications registering multibyte unknown encodings can
pass truncated input to the conversion callback, causing an
out-of-bounds read.

Include the upstream regression test [3], adapted to the existing
XML_GetBuffer and xcstrcmp interfaces. Its custom encoding handler
asserts that conversion callbacks receive a complete sequence.

Refreshed for Blacksail 5b458838c126051c884c8cb5225c7265d1483ea6.
Source patches apply without fuzz. Builds and runtime tests were
not rerun.

[1] https://github.com/libexpat/libexpat/commit/3d77567612994172f9d09b46f31bb604e16fb08d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-124317
[3] https://github.com/libexpat/libexpat/commit/05075975dc246f5f6c0757d532f22f518850e7af

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-124317_p1.patch      |  56 +++++++++
 .../expat/expat/CVE-2026-124317_p2.patch      | 108 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
new file mode 100644
index 00000000000..d37356d3090
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
@@ -0,0 +1,56 @@
+From 3d77567612994172f9d09b46f31bb604e16fb08d Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Nov 2026 18:35:50 +0100
+Subject: [PATCH] lib: Reject overread in `unknown_toUtf8` and
+ `unknown_toUtf16`
+
+CVE: CVE-2026-124317
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3d77567612994172f9d09b46f31bb604e16fb08d]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmltok.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmltok.c b/lib/xmltok.c
+index a3bf5e0e95b0..72758d734a44 100644
+--- a/lib/xmltok.c
++++ b/lib/xmltok.c
+@@ -1447,13 +1447,17 @@ unknown_toUtf8(const ENCODING *enc, const char **fromP, const char *fromLim,
+     utf8 = uenc->utf8[(unsigned char)**fromP];
+     n = *utf8++;
+     if (n == 0) {
++      const size_t readLen
++          = (AS_NORMAL_ENCODING(enc)->type[(unsigned char)**fromP]
++             - (BT_LEAD2 - 2));
++      if (readLen > (size_t)(fromLim - *fromP))
++        return XML_CONVERT_INPUT_INCOMPLETE;
+       int c = uenc->convert(uenc->userData, *fromP);
+       n = XmlUtf8Encode(c, buf);
+       if (n > toLim - *toP)
+         return XML_CONVERT_OUTPUT_EXHAUSTED;
+       utf8 = buf;
+-      *fromP += (AS_NORMAL_ENCODING(enc)->type[(unsigned char)**fromP]
+-                 - (BT_LEAD2 - 2));
++      *fromP += readLen;
+     } else {
+       if (n > toLim - *toP)
+         return XML_CONVERT_OUTPUT_EXHAUSTED;
+@@ -1471,9 +1475,13 @@ unknown_toUtf16(const ENCODING *enc, const char **fromP, const char *fromLim,
+   while (*fromP < fromLim && *toP < toLim) {
+     unsigned short c = uenc->utf16[(unsigned char)**fromP];
+     if (c == 0) {
++      const size_t readLen
++          = (AS_NORMAL_ENCODING(enc)->type[(unsigned char)**fromP]
++             - (BT_LEAD2 - 2));
++      if (readLen > (size_t)(fromLim - *fromP))
++        return XML_CONVERT_INPUT_INCOMPLETE;
+       c = (unsigned short)uenc->convert(uenc->userData, *fromP);
+-      *fromP += (AS_NORMAL_ENCODING(enc)->type[(unsigned char)**fromP]
+-                 - (BT_LEAD2 - 2));
++      *fromP += readLen;
+     } else
+       (*fromP)++;
+     *(*toP)++ = c;
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch
new file mode 100644
index 00000000000..3d592808d6b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch
@@ -0,0 +1,108 @@
+From 05075975dc246f5f6c0757d532f22f518850e7af Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Nov 2026 18:22:39 +0100
+Subject: [PATCH] tests: Cover overread in `unknown_toUtf8`
+
+CVE: CVE-2026-124317
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/05075975dc246f5f6c0757d532f22f518850e7af]
+
+Backport Changes:
+- Use XML_GetBuffer instead of XML_GetBuffer64. Expat 2.8.5 lacks the
+  64-bit API; the fixed test document fits in int, so cast its length
+  for the existing XML_GetBuffer interface.
+- Use the existing xcstrcmp test helper from common.h for the
+  XML_Char encoding-name comparison.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/misc_tests.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 68 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 717cc2dd31aa..814fb84aa6d8 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -894,6 +894,73 @@ START_TEST(test_misc_unknown_encoding_callbacks_protected) {
+ }
+ END_TEST
+ 
++struct DecoderInfo {
++  size_t docLen;
++  const char *buffer;
++};
++
++static int
++decodeUnknownEncoding(void *data, const char *s) {
++  struct DecoderInfo *const info = data;
++  assert_true(info != NULL);
++
++  // Determine the sequence length in accordence with encoding map
++  const unsigned char lead = (unsigned char)s[0];
++  const int length = (lead == 0xC3) ? 2 : ((lead == 0xA9) ? 4 : 1);
++
++  const size_t offset = s - info->buffer;
++  assert_true(offset + length <= info->docLen); // or we would overread
++
++  if (lead == 0xC3 && (unsigned char)s[1] == 0xA9)
++    return 0x49;
++
++  return -1;
++}
++
++static int
++unknown_encoding_handler(void *data, const XML_Char *name, XML_Encoding *info) {
++  XML_Char *const expectedEncodingName = xcsdup_str("x-q5");
++  assert_true(expectedEncodingName != NULL);
++  assert_true(xcstrcmp(name, expectedEncodingName) == 0);
++  free(expectedEncodingName);
++
++  for (int i = 0; i < 256; i++)
++    info->map[i] = (i < 128) ? i : -1;
++
++  info->map[0xC3] = -2;
++  info->map[0xA9] = -4;
++
++  info->convert = decodeUnknownEncoding;
++  info->data = data;
++  info->release = NULL;
++
++  return XML_STATUS_OK;
++}
++
++START_TEST(test_misc_unknown_encoding_no_source_overread) {
++  const char *const doc = "<?xml \xC3\xA9?>";
++  const size_t docLen = strlen(doc);
++
++  XML_Char *const encodingName = xcsdup_str("x-q5");
++  assert_true(encodingName != NULL);
++
++  XML_Parser parser = XML_ParserCreate(encodingName);
++
++  char *const buffer = XML_GetBuffer(parser, (int)docLen);
++  assert_true(buffer != NULL);
++  memcpy(buffer, doc, docLen);
++
++  struct DecoderInfo info = {docLen, buffer};
++  XML_SetUnknownEncodingHandler(parser, unknown_encoding_handler, &info);
++
++  assert_true(XML_ParseBuffer(parser, docLen, /*isFinal=*/XML_TRUE)
++              == XML_STATUS_ERROR);
++
++  XML_ParserFree(parser);
++  free(encodingName);
++}
++END_TEST
++
+ // General attack payload idea by Jason Kratzer of Mozilla
+ START_TEST(test_misc_low_surrogate_mozilla_bug_2053153) {
+   const char doc_before[] = "<\0!\0D\0O\0C\0T\0Y\0P\0E\0 \0d\0 \0[\0\n\0"
+@@ -992,6 +1059,7 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
+   tcase_add_test(tc_misc, test_misc_resume_parser_forbidden_from_handler);
+   tcase_add_test(tc_misc, test_misc_unknown_encoding_callbacks_protected);
++  tcase_add_test(tc_misc, test_misc_unknown_encoding_no_source_overread);
+   tcase_add_test(tc_misc, test_misc_input_2gb);
+   tcase_add_test(tc_misc, test_misc_low_surrogate_mozilla_bug_2053153);
+ }
+-- 
+2.35.6
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.8.5.bb
index f380aab56fa..7116ea3dfad 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-115506_p1.patch \
            file://CVE-2026-115506_p2.patch \
            file://CVE-2026-115506_p3.patch \
+           file://CVE-2026-124317_p1.patch \
+           file://CVE-2026-124317_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
