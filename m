Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30510.1793870243133496268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T+Gr/ucu;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6750; q=dns/txt;
  s=iport01; t=1793870243; x=1795079843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=70CZW4fycfzJfwj5BqyP9v3ScUQHT1vGaauBtPbBcv0=;
  b=T+Gr/ucuf5YACWxS3Nn6mbUHrxNY7mehNZMj03Y5vQlCgJluxTBMtW0c
   PFK7Ro1jDvCEcCpvWC3kb8Zn1KxL5H2/iHnzk8pR143VvGs2k8OuOeIVU
   Kh2+e1Yq6DMbrNSVg4FoUb04lKM/IeMlnPlqBvvubOHRYK2vapXk0fy/M
   lfflXAlmEUeBV+oah7RW/eo5YXNaScbN49HplB18zm+/6vlxTw2X+XzcU
   Di2EfwRHBt9p1n3m1hJGB0o0rm6W9Cs7liIP34ccEpj1hiPmK54tXOHzz
   ijukRa9l+dIQ9paVYrfHMQKQNLz1drVPrvgDyE19o/jmDSKgnDZDJgqB4
   w==;
X-CSE-ConnectionGUID: jvuu1iXTRWuy1AvHHqXU7Q==
X-CSE-MsgGUID: psyvdoj6QHGQgWVMQN2RVw==
X-IPAS-Result: =?us-ascii?q?A0AbLwA6Sexq/5L/Ja1aglmCV3VgQ0kDlkgDgRObdoEYg?=
 =?us-ascii?q?X4PAQEBDy4WDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMBJgsBGAEtEBwDAQIvJwQjCBmDAgGCdAMRu?=
 =?us-ascii?q?38bN4F5M4EBgykBgVTbMwELFAGBOIVAiCNdGAGEfScbG4FygRWCc3aBBYFcA?=
 =?us-ascii?q?QGIJgSCIoEMgVoeZYwVAoFShnFIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hki+DCgeBDgErF4FtDxmTOBqSJKERCiiDeIwkjT6HfBozqnELm?=
 =?us-ascii?q?H2OChaWO4RpgWg8gVlwFYJuATMJShkPji4LC4Ngzk0mMgIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:yRKbbK/nUE8ud0Mk2UcODrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2sWXT3Ubv7cN2Kkctt1b4znpkNXv5KBx9FiQANtrytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k0I5AFo+dHPVtx6
 O1BAS4tTgmzur2PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaII4TbFJ8O9qqej
 nrd7nr1BRNEDfyw8DW6zFeVoLX1ozyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:SF+P6K89ReOeRDWHnWluk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Axvl+GGhFLD0ArMYT+p4K+2IEyzJucGPA0S7RE3O?=
 =?us-ascii?q?CNnt4EZSLaX+JyJ47qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A5oCkSw6YA7bX2yVcgF3K01sxxoxw+LWwBEcPz6w?=
 =?us-ascii?q?mlPCLChJVAhHHtgqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545109923"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:17:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 26D1F1800059F;
	Thu,  5 Nov 2026 09:17:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C36DECBF201; Thu,  5 Nov 2026 01:17:21 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/3] expat: fix CVE-2026-117610
Date: Thu,  5 Nov 2026 01:17:18 -0800
Message-Id: <20261105091719.1622520-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105091719.1622520-1-dkelaiya@cisco.com>
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 09:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249520
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the merged upstream fix [1] identified by the release
announcement [2], together with its regression test [3]. An initial
empty, non-final external-entity parse must remain in the correct
initialization state instead of reaching a handler with invalid state.

Use the final merged PR 1444 commits; the earlier advisory reference
7b0d50e4b1d16fafd55876260701e04279a7489d was superseded during review.
The regression test uses Expat 2.8.3's existing XCS literals and
xcstrcmp helper, so no string-helper refactoring is required.

The focused external-entity case crashes the unpatched native library
and passes with this fix. The full native unit suite also passes.
BitBake was not run.

[1] https://github.com/libexpat/libexpat/commit/bfc28346fa3efeb8ca56c17437d24a7344e5feab
[2] https://www.openwall.com/lists/oss-security/2026/11/02/6
[3] https://github.com/libexpat/libexpat/commit/cedb704d2cad9d6ef77f8f172104d3e751eccfd2

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../expat/expat/CVE-2026-117610_p1.patch      | 30 ++++++
 .../expat/expat/CVE-2026-117610_p2.patch      | 92 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-117610_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-117610_p1.patch
new file mode 100644
index 0000000000..fd645dae66
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-117610_p1.patch
@@ -0,0 +1,30 @@
+From bfc28346fa3efeb8ca56c17437d24a7344e5feab Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 26 Oct 2026 17:39:32 +0100
+Subject: [PATCH] lib: Fix initial non-final empty subparser call with a
+ handler
+
+CVE: CVE-2026-117610
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/bfc28346fa3efeb8ca56c17437d24a7344e5feab]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/xmlparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a0946be..b17f5e0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3233,6 +3233,11 @@ externalEntityInitProcessor2(XML_Parser parser, const char *start,
+     }
+     parser->m_eventPtr = start;
+     return XML_ERROR_PARTIAL_CHAR;
++  case XML_TOK_NONE:
++    if (! parser->m_parsingStatus.finalBuffer) {
++      *endPtr = start;
++    }
++    return XML_ERROR_NONE;
+   }
+   parser->m_processor = externalEntityInitProcessor3;
+   return externalEntityInitProcessor3(parser, start, end, endPtr);
diff --git a/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
new file mode 100644
index 0000000000..2ebe6446c4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
@@ -0,0 +1,92 @@
+From cedb704d2cad9d6ef77f8f172104d3e751eccfd2 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 26 Oct 2026 17:17:57 +0100
+Subject: [PATCH] tests: Add a test for a initial non-final empty subparser
+ parse
+
+.. with a handler call
+
+CVE: CVE-2026-117610
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cedb704d2cad9d6ef77f8f172104d3e751eccfd2]
+
+Backport Changes:
+- Compare handler data with the existing XCS macro and xcstrcmp test
+  helper in Expat 2.8.3. This replaces xcsdup_str allocations,
+  allocation assertions and frees, avoiding the newer xcs helpers.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/misc_tests.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 04538c2..6c82715 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -957,6 +957,60 @@ START_TEST(test_misc_input_2gb) {
+ }
+ END_TEST
+ 
++static void
++comparingPiHandler(void *userData, const XML_Char *target,
++                   const XML_Char *data) {
++  UNUSED_P(userData);
++
++  assert_true(xcstrcmp(target, XCS("target")) == 0);
++  assert_true(xcstrcmp(data, XCS("data")) == 0);
++}
++
++static int XMLCALL
++piParsingExternalEntityHandler(XML_Parser parent, const XML_Char *context,
++                               const XML_Char *base, const XML_Char *systemId,
++                               const XML_Char *publicId) {
++  UNUSED_P(base);
++  UNUSED_P(systemId);
++  UNUSED_P(publicId);
++
++  const char *const doc = "<?target data?>";
++
++  XML_Parser subParser = XML_ExternalEntityParserCreate(parent, context, NULL);
++  assert_true(subParser != NULL);
++
++  // NOTE: Related test "test_empty_ext_param_entity_in_value" could be of
++  // interest
++  assert_true(_XML_Parse_SINGLE_BYTES(subParser, "", 0, /*isFinal=*/XML_FALSE)
++              == XML_STATUS_OK);
++  assert_true(_XML_Parse_SINGLE_BYTES(subParser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(subParser);
++
++  return XML_STATUS_OK;
++}
++
++START_TEST(test_misc_empty_nonfinal_subparser_parse) {
++  const char *const doc = "<!DOCTYPE root [\n"
++                          "  <!ENTITY ext SYSTEM 'external.dtd'>\n"
++                          "]>\n"
++                          "<root>&ext;</root>\n";
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  XML_SetProcessingInstructionHandler(parser, comparingPiHandler);
++  XML_SetExternalEntityRefHandler(parser, piParsingExternalEntityHandler);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE));
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -993,4 +1047,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_unknown_encoding_callbacks_protected);
+   tcase_add_test(tc_misc, test_misc_input_2gb);
+   tcase_add_test(tc_misc, test_misc_low_surrogate_mozilla_bug_2053153);
++  tcase_add_test(tc_misc, test_misc_empty_nonfinal_subparser_parse);
+ }
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 4f2672c955..b6911e79de 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -25,6 +25,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2 \
            file://CVE-2026-113351_p3.patch \
            file://CVE-2026-113351_p4.patch \
            file://CVE-2026-113351_p5.patch \
+           file://CVE-2026-117610_p1.patch \
+           file://CVE-2026-117610_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6

