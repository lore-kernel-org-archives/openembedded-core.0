Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3727.1793405751454532940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CUe4szNf;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so12080775e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405750; x=1794010550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G5ExFhJSxl6Fuf2kVJZ0kw9yTp6dqT+hn+zSnF2Sp4o=;
        b=CUe4szNf60HBawIBXxk1W6qXXn7Klb+ASWWIJFNbW8akaeXnSFCr5Hg3WBuW7uKf9Z
         246GNzizX4IKwobzaReX2NP/X+XJJZgzS0//SabfNicwNDwVw6D2rh4nrPvv9RFD3JS+
         VFQombGXXY5GhA9UCYncB00PmLJS16+SqOf1BgxAk3UapDm5N026lSRgpzy6EccBswyA
         m3606LrQy410HQlNn6uor8gl/O5FbhBgA1XS7tmemC95O6cL//SSb1luVL9oSXk47ixM
         iz/ktaAsTEwc7Kpxt075gmqo6Ytj1M1oDTSJhM4/QpKsqogaRqqg3Y6XVKLTCIx5eFxa
         ui/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405750; x=1794010550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G5ExFhJSxl6Fuf2kVJZ0kw9yTp6dqT+hn+zSnF2Sp4o=;
        b=1HErkgrV+KaunLh4MPEaFe/tJYhoYqrxcem8ADNW81HWFX7TaHDtJXM2lbvly7TEh5
         ngib6fPi2rRkB4CTgt0MjMUfShMlTnsHXXmBug3lDXFFrsY/5IGgD6B0DYlka/S/P1DL
         pkcaiuB8Os8RVwdetKz9Mtqu+aKCKVb45q7CZ1p+GEFHi/ueViknwF669nH8I0u8lur/
         pWVfI7fF7dZEYBw5SOXqoV+30g7t9i0Z/RMR+i8b6qWTrUwow3miWY0zCA71WZaE/so2
         SeEV7dSpUkojwDWvBwGm/msFg1gNsdTaepv5MtThZkYMaXEDeK9bjUcia+zOgrO9VzJi
         ybmQ==
X-Gm-Message-State: AFq9FYI4nWg9v0G7vxx+KfoY4pLG3F9wS4vVPDs2ImTY2dahhD1Jk+CJ
	hnxZmK5XCCRV66g1u1XE2O9hyv8IxwlKBNzi/FiL11xfGAl10F8zktBeSCLHSE52WRgcEAEXjnb
	esB/eR/s=
X-Gm-Gg: AYBFou2nKrX1m/s33ED/LTbTBsm+M3Bj1t0yzg2AYW1aHriwV59EMmCwt/CXnSzMTpv
	dEwlaTDDTYvixzZ4CAN/9NB5XmIWiu0Ep5uvb2IltYkz47ZECQg4AUuAivFj0a8CSMbvG/YThla
	sI31ZD+pbWTpO0gK1Qe76WsaVKGT3cga3rD481Bs86sOauTY+yAnCM/aC9rLcpxlmMKG8NlZ1Ln
	VgrgoqdoceNkSkejrCZS77hCPulZHEoWWpflHmi5psCLANrSbMknIHVx0sYjwTZJdBPtK2/DjIv
	1kZiHqZI94E1aJQorLd4c6GIYFoIPz8hmYkamPOwd04HFFpGgeIY4tpkLWTtw1oMMJThtOSCEWL
	H28ZuHG1DqX8c/jV2H7GsDpd8dlwYGzkPUKdFqks8iNwpb5GhaPwkcDLVZSPzNLIvz3/wBrdnsH
	xcesPG/aoFjupii1laIDU7pAo/c3YTNdJqPizqtf+BQYNAidqzmR/m+8ad/FJbWOaGnMiY8gMUf
	VtJ8vNjL98WDXbS1EGfqWamz/rnGC5at+2x7BQQR2tZEVQYOAZUlaq736WL/f2cRJ0Sft9MNFul
	+DKo2L8t767NwX709XatWtoSjNVflsZyjMrA0ccU4qJcwkbDXXdb3ZECzqM4JK6AisP/+OwWmlI
	h0HPxJs3pEFP3KNL6K5nIaWwVqGL6iQ==
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr91527625e9.2.1793405749666;
        Fri, 30 Oct 2026 17:15:49 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/55] expat: patch CVE-2026-77214
Date: Sat, 31 Oct 2026 01:14:32 +0100
Message-ID: <d53ec0988c873e8d18039b43b84b7b7d5c1896cb.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249086
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-77214

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-77214.patch          | 106 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-77214.patch b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
new file mode 100644
index 00000000000..6d746487054
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
@@ -0,0 +1,106 @@
+From 4d9b1c499ecb66323260a7274edcf86c5eab0517 Mon Sep 17 00:00:00 2001
+From: Filippo Tedeschi <filippotedeschi98@gmail.com>
+Date: Fri, 25 Sep 2026 19:51:10 +0200
+Subject: [PATCH] lib|tests: Validate len against buffer capacity in
+ XML_ParseBuffer
+
+In XML_ParseBuffer(), if len exceeds the unoccupied capacity of the
+internal buffer (EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd)),
+parser->m_bufferEnd was previously advanced past parser->m_bufferLim.
+This violated the parser's internal pointer invariant (m_bufferEnd <=
+m_bufferLim) and caused callProcessor() to read unallocated or
+uninitialized heap memory beyond the buffer bounds.
+
+Validate that len <= EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd) for
+both XML_INITIALIZED and XML_PARSING states. If len exceeds the
+available buffer capacity, return XML_STATUS_ERROR with
+XML_ERROR_INVALID_ARGUMENT.
+
+Also add test_parse_buffer_exceeds_buffer in tests/basic_tests.c.
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
+
+CVE: CVE-2026-77214
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4d9b1c499ecb66323260a7274edcf86c5eab0517]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c      |  5 +++++
+ tests/basic_tests.c | 41 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 08ef9f72..6e3af97b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2465,6 +2465,11 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+     parser->m_parsingStatus.parsing = XML_PARSING;
+   }
+ 
++  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEnd)) {
++    parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
++    return XML_STATUS_ERROR;
++  }
++
+   // Detect and avoid integer overflow
+   if ((uint64_t)len > UINT64_MAX - parser->m_parseEndByteIndex) {
+     parser->m_errorCode = XML_ERROR_NO_MEMORY;
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 06268469..35e17d31 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -3605,6 +3605,46 @@ START_TEST(test_negative_len_parse_buffer) {
+ }
+ END_TEST
+ 
++/* Test XML_ParseBuffer rejects calls where len exceeds available buffer */
++START_TEST(test_parse_buffer_exceeds_buffer) {
++  for (int isFinal = 0; isFinal < 2; isFinal++) {
++    set_subtest("isFinal=%d", isFinal);
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++
++    /* Calling XML_ParseBuffer without any prior XML_GetBuffer call */
++    if (XML_ParseBuffer(parser, 10, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer without XML_GetBuffer was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_NO_BUFFER)
++      fail("Expected XML_ERROR_NO_BUFFER.");
++
++    /* Acquire a small buffer */
++    void *const buffer = XML_GetBuffer(parser, 10);
++    if (buffer == NULL)
++      fail("XML_GetBuffer failed.");
++
++    /* Calling XML_ParseBuffer with len exceeding available buffer capacity */
++    if (XML_ParseBuffer(parser, 10000, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer with len > capacity was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Expected XML_ERROR_INVALID_ARGUMENT.");
++
++    /* Valid parse */
++    memcpy(buffer, "<r></r>", 7);
++    if (XML_ParseBuffer(parser, 7, XML_FALSE) != XML_STATUS_OK)
++      xml_failure(parser);
++
++    /* Subsequent XML_ParseBuffer where len exceeds remaining capacity */
++    if (XML_ParseBuffer(parser, 10000, isFinal) != XML_STATUS_ERROR)
++      fail("XML_ParseBuffer on subsequent chunk was expected to fail.");
++    if (XML_GetErrorCode(parser) != XML_ERROR_INVALID_ARGUMENT)
++      fail("Expected XML_ERROR_INVALID_ARGUMENT.");
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
+ /* Test odd corners of the XML_GetBuffer interface */
+ static enum XML_Status
+ get_feature(enum XML_FeatureEnum feature_id, long *presult) {
+@@ -7054,6 +7094,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_parse);
+   tcase_add_test(tc_basic, test_negative_len_parse);
+   tcase_add_test(tc_basic, test_negative_len_parse_buffer);
++  tcase_add_test(tc_basic, test_parse_buffer_exceeds_buffer);
+   tcase_add_test(tc_basic, test_get_buffer_1);
+   tcase_add_test(tc_basic, test_get_buffer_2);
+ #if XML_CONTEXT_BYTES > 0
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 3a179db62cc..02a8536440d 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-93990-01.patch \
            file://CVE-2026-93990-02.patch \
            file://CVE-2026-102633.patch \
+           file://CVE-2026-77214.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
