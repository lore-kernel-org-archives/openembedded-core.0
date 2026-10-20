Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4764.1792538576867559012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=APaAbSnq;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so58104f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538575; x=1793143375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G5ExFhJSxl6Fuf2kVJZ0kw9yTp6dqT+hn+zSnF2Sp4o=;
        b=APaAbSnqff2dgH541JSiipFLYXn4BkbjMy8YPqRgwlQ7HMNUQ2F+bUJi/sjHB9l59A
         Xl9ozEnp8YiMJ70Y1/RItpvjBVO7FNZkKnwA7xVita2672HIARd5p3Owce0GFHXuH3Uh
         s87cWt30Ps9VpF29+1KhUOTJQvYhfss3QUwzVS3GZDlZ/tosGtPqIqBJDnthqI6Xxxyw
         Y2x91jF+8Yj2gdKtDwIoWHHr8DYkAEr//BZd5RZMNHPUFgNu++a64xQn//bL73vxA7vj
         TgJH/P9PdbFdGtqFa0APjItyviPOT5zw+IAp6x1g10p/uR5LZFPTu7PRttpomA/VzGpz
         TWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538575; x=1793143375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G5ExFhJSxl6Fuf2kVJZ0kw9yTp6dqT+hn+zSnF2Sp4o=;
        b=tvDFUvkwTWDMl+ZQqdeJ0RyP3k9DrGldd78PmhysQ4NZSz/DQv51pYXoZeK/KQKYlz
         HP/U25k4I6mzbkxyeHeUndDnqkw2G5d5UpWJPv/EXm1tNYSUaD3sasj1ws/hP6RqcWXI
         oZRdhp3ZsRn2BUqSsMoVM8rzIvb0vTDtWYzeTKVip+sp7dlP2TdixlFrqfeBWsnDC7vQ
         lygKWJ7bTBwlqGYwkTRKanEWamk7jROR84wewxUTiKS8RpX3E1LQ2JD2LM1RvVRht4HZ
         GG6W+Ywt0wrbrzj9SzIQJthtgtxxyUl+V/dfFj9pWpcd7wshq6txWL5Lshg325JzV8Sl
         i/ZA==
X-Gm-Message-State: AFq9FYJ8Z5UHYhSBckYtIsPep1fg/6BU1rwVfK7zpHzPHBwF11zjNlKI
	e/owIXBwb/O+f9zCsn6sNTztm60dj5HC8cyErnxPaN/ziqsnfs1pKxDhEpOS/HXlobKa4rWB4tW
	E5mX9xsU=
X-Gm-Gg: AYBFou0YlqT/m6TVROm658tXgIRU29z4WiuXmhknWCy19OnvSaXsVjPYcgOe0PfObnH
	6VZodoAyijlytbkUzweKa2DxcmDKbSMekwiXtIbhn2UQyukkQOP+nArB/NjkK6zGmQCShiRrg3L
	fd6FhCzo+hCtCVpnlivr+CjIs322mg+LYU1U4avu+hwvN0SSmckGDuIpomNLnoUkWkC2XDYYIz2
	h8b6J+4A8iHd3WK81NJ48LLDzf7Krwz4t0BODWtLk8UB7ffcz+67QF+FpYbWzyulJXmXyg6BUYg
	xjUEpduZRKg1xonnFoKiJ7zDKBXqSEeOPj0Z2v0Lu8tXQVfwM202msYu1SqkdyzlmoDxaqmaEPZ
	FH/XAzlXxKUNJj0OdGL4Ylf3TY96RnFlkQV7uYQ4PHdu6ixx2+4IkD96vIwXd/azLDqjjOiVWxN
	SvvMdzMV1m1UoFS00o7mO7bp3ysCCVdDUekGBOSt1LrTicQAEqX7TvVFO598nMsXywX91lmi4sK
	FBmNh8zlJUm9USbBtGOn+4cd16dsduWVZFnGdY+omAaLXkJoD3ahtMZ27BvTCyWl0lKo2Q1jQ==
X-Received: by 2002:a05:6000:1049:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e264dd966mr238015f8f.44.1792538574920;
        Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/25] expat: patch CVE-2026-77214
Date: Wed, 21 Oct 2026 01:22:16 +0200
Message-ID: <8c8ed2edcb616c3c07500b0378554dcf1b10ea6e.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248324
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
