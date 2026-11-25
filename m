Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36914.1795588397418072167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iT8P/VpI;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8102; q=dns/txt;
  s=iport01; t=1795588397; x=1796797997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AyS/f2fxji4eKm/yHqQsVPFfW1ukjczY8bBHvSEWewI=;
  b=iT8P/VpIKYJZ4fyB0EngVyVHhdadCRMzNCPL6zQTvxXUgReq5a7q3L7G
   8Q4h2x/TTOrz53OeVSocZONxcdr6wJl/3OMfTyQ/NfHgQ0GeLKN+wiKuU
   D5Yk9FNCunf5tiBeZPzsx/EZ1fqhPmutI6lnBEnHymqZ1OUTFzr/HqEYL
   vtWro/uOpupLgZLl0C7mXQiboP1o+ItvNFiqRoXmXx0Tc9JgQDOAK2HUC
   q4fX5+qNfr3y4wWlSZTi4DsDygYuzJgt0Oz4qfVwYl5rzBDsnEyGHkCvW
   gbbEZGSdogb7OeJhWoLXpLFw2hmxQ8hJ1vMp4vHtIdI77A6HG0rk+Zu2/
   w==;
X-CSE-ConnectionGUID: 8cDvVel2R9+nISLzNVAZsw==
X-CSE-MsgGUID: 6z3eaEoJRiCpcrwQ2wmyUw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCtfgZr/9VK/pBaglmCV3VgQ0mWSwOeKYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEbkPGzeBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVCiCVdGAGCS4IzJxsbgXKBFYNqgQWBXAEBiCYEg?=
 =?us-ascii?q?g0VgQyBVB6MdQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpB?=
 =?us-ascii?q?hYhCzQYDUgRLDcVGQQ+bgeUE4MbFk0rARMYgSBIk3uQHYIhoREKKIN5jCSVO?=
 =?us-ascii?q?hozhASUGpJUC5h9jgqWUYRqgWg8gSgBGgQLB3AVgm4BMwlKGQ+OLgsLg2CBf?=
 =?us-ascii?q?8xcJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:7IJubKl+IM/2HL9a89kCTZ/o5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJUWmBO6qPY2H9e4pyYdi08h9Vv5DVydA1TwZqrStkEltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fd0T1vhJDGUUz
 61bLhE2SgKlucuE263uH4GAhux7RCXqFIoSoDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQUUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGISNIYPVGpgO9qqej
 jzUpGnwLxY4Dt200TGf7Uv2mereoDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:zLiGcqniJHfbq7t3UzJWJGfyvuLpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3A+n+oF2nkq3HkTiaUAHKwebK19zDXOS3W4GnuLkv?=
 =?us-ascii?q?iMzcqTpyubU22xopWiNU7zg=3D=3D?=
X-Talos-MUID: 9a23:8IDX1Qq7B6VOKeMoXPUez29wb8phzqOMMkEmiZ4cpPDeKilhBijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60377753"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:33:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 26FC018000371;
	Wed, 25 Nov 2026 06:33:15 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A912ACBF202; Tue, 24 Nov 2026 22:33:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/2] expat: fix CVE-2026-124317
Date: Tue, 24 Nov 2026 22:33:09 -0800
Message-Id: <20261125063309.3652971-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125063309.3652971-1-dkelaiya@cisco.com>
References: <20261125063309.3652971-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251163
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the unknown-encoding decoder fix [1] identified by [2] to
Expat 2.8.3. Applications registering multibyte unknown encodings can
pass truncated input to the conversion callback, causing an
out-of-bounds read.

Include the upstream regression test [3]. Its custom encoding handler
asserts that conversion callbacks receive a complete sequence. The
test reuses the XML_Char helpers from the preceding CVE-2026-115506
backport.

[1] https://github.com/libexpat/libexpat/commit/3d77567612994172f9d09b46f31bb604e16fb08d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-124317
[3] https://github.com/libexpat/libexpat/commit/05075975dc246f5f6c0757d532f22f518850e7af

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-124317_p1.patch      |  54 +++++++++
 .../expat/expat/CVE-2026-124317_p2.patch      | 106 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
new file mode 100644
index 0000000..82c01c3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
@@ -0,0 +1,54 @@
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
+index 8f1b8827..7bd6b54a 100644
+--- a/lib/xmltok.c
++++ b/lib/xmltok.c
+@@ -1409,13 +1409,17 @@ unknown_toUtf8(const ENCODING *enc, const char **fromP, const char *fromLim,
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
+@@ -1433,9 +1437,13 @@ unknown_toUtf16(const ENCODING *enc, const char **fromP, const char *fromLim,
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch
new file mode 100644
index 0000000..24d820c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch
@@ -0,0 +1,106 @@
+From 05075975dc246f5f6c0757d532f22f518850e7af Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Nov 2026 18:22:39 +0100
+Subject: [PATCH] tests: Cover overread in `unknown_toUtf8`
+
+CVE: CVE-2026-124317
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/05075975dc246f5f6c0757d532f22f518850e7af]
+
+Backport Changes:
+- Use XML_GetBuffer instead of XML_GetBuffer64. Expat 2.8.3 lacks the
+  64-bit API; the fixed test document fits in int, so cast its length
+  for the existing XML_GetBuffer interface.
+- Use the existing xcstrcmp test helper from common.h for the
+  XML_Char encoding-name comparison.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/misc_tests.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 68 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 6c827153..e5e8cd0d 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -893,6 +893,73 @@ START_TEST(test_misc_unknown_encoding_callbacks_protected) {
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
+@@ -1045,6 +1112,7 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
+   tcase_add_test(tc_misc, test_misc_resume_parser_forbidden_from_handler);
+   tcase_add_test(tc_misc, test_misc_unknown_encoding_callbacks_protected);
++  tcase_add_test(tc_misc, test_misc_unknown_encoding_no_source_overread);
+   tcase_add_test(tc_misc, test_misc_input_2gb);
+   tcase_add_test(tc_misc, test_misc_low_surrogate_mozilla_bug_2053153);
+   tcase_add_test(tc_misc, test_misc_empty_nonfinal_subparser_parse);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index aa6a179..c267af4 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -40,6 +40,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://CVE-2026-115506_p1.patch \
            file://CVE-2026-115506_p2.patch \
            file://CVE-2026-115506_p3.patch \
+           file://CVE-2026-124317_p1.patch \
+           file://CVE-2026-124317_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6
