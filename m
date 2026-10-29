Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8317.1793268708115311245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UukNaHlq;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23436; q=dns/txt;
  s=iport01; t=1793268708; x=1794478308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vIrnqeLl3vnXauNLDArfse3AM5rqZZqFDZOPOFi5zys=;
  b=UukNaHlq/xAGxj5A6AnSbPAHqffl94gAmEGOi8ZRQVlqI9v1GnQOREUK
   Kyw+Ybgn75So0F46BGkUBeapZoWGWfUfQv5grZE+S5bcchcfnDvvqcH9c
   zj3gU8eolSZ+YmLeiZ+Mvu5ttmWHcEToMCzq8ub5CIsyGV7quQQNNyXcS
   3kZfdFK49NrCaqZ55SooV8eRNTGZsXIiAkHsGnRvG94D5fl2C3jpFd8jF
   4SAhtjkMNfa5kF4AUyLBH0eJTFIRjRr67hzpAizGGs/ZbRnhOk9ZL13B1
   PprZmCbVNssJYUPySuz5n3vWtZ/3mPiQlBfT7APNf+Q4Of3rdG7WJ/cYh
   Q==;
X-CSE-ConnectionGUID: CU/c3+eGTMSZy7r3XSB6vQ==
X-CSE-MsgGUID: LA2AkjncSByij4z45gVR0w==
X-IPAS-Result: =?us-ascii?q?A0BIAgB6G+Nq/4v/Ja1aglmCV3VhQkmWSwOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAxoNCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG0UoF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNszAQsUAQWBM4VAiCNdGAGEfScbG4FygRWDaYEFgVwBAYEnBguGb?=
 =?us-ascii?q?QSCInoSgVoejRACh1NIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRmBB12BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xouC4EaNTwJJkEVDGQLGgViCAINDHY5EDEgJjIEAx0YDUgRLDcVGQQ+bgeRX?=
 =?us-ascii?q?YMHBwF6EwErgRFzECmjRIIhoQ8KKIN2jCKVOhozqm8LmH2OCpZQhGmBaDyBK?=
 =?us-ascii?q?B8LB3AVSAGCWQlKGQ+OLgsLg2CBf4MUyUYkNQIBCDIBAQcCBw4DC4FokAABJ?=
 =?us-ascii?q?4FWAQE?=
IronPort-Data: A9a23:Tylq4KvTTC5YKZZIoerwcjzSzufnVABfMUV32f8akzHdYApBsoF/q
 tZmKWyPPPfZNmT0eIhxYNzlpEoEvJPdmtE2SApuryszQi8TgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvrZ+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0dswCjoN+
 NMkDQs/f0+Z3NKN6uylc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4fRGJ8NxRfBz
 o7A10DQWDgZNtqU8hCU83DwlLOSkh3BAJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:D5lOuK6V+Ma22k18rwPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AiP5Z/2movjQEfOoBhoXaBl9OXQ/XOVbgi3yLYEK?=
 =?us-ascii?q?XNUNSeqzKUwSgw4k6jfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Az2vimw1/BHrb39pnd5fBJ5fRADUjx430IUMPl54?=
 =?us-ascii?q?9kdiFN3BiZ2qSsg7vXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="533520391"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:11:28 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2316C18000237;
	Thu, 29 Oct 2026 10:11:28 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id BC8D9CC124C; Thu, 29 Oct 2026 03:11:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v4 2/5] apr-util: Fix CVE-2026-32327
Date: Thu, 29 Oct 2026 03:11:24 -0700
Message-Id: <20261029101127.2240608-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029101127.2240608-1-hthakar@cisco.com>
References: <20261029101127.2240608-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248926
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream test compatibility prerequisite [1], which is
required by the regression tests included with the XML nesting-depth
fix [2]. The fix addresses CVE-2026-32327 as described by the advisory
[3].

[1] https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce
[2] https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-32327

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr-util/CVE-2026-32327-dependent.patch   |   34 +
 .../apr/apr-util/CVE-2026-32327.patch         | 2162 +++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |    2 +
 3 files changed, 2198 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
new file mode 100644
index 0000000000..c3c570f407
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
@@ -0,0 +1,34 @@
+From dba5d434dba0547478f411d6fa068766455446ce Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 19 Dec 2023 11:20:33 +0000
+Subject: [PATCH] Merge r1914772 from 1.7.x:
+
+* test/testutil.h: Define APR_ASSERT_SUCCESS for compatibility
+  with apr trunk.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1914774 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce]
+
+(cherry picked from commit dba5d434dba0547478f411d6fa068766455446ce)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ test/testutil.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/testutil.h b/test/testutil.h
+index eaa7e759..4c5e30b8 100644
+--- a/test/testutil.h
++++ b/test/testutil.h
+@@ -40,6 +40,8 @@ extern apr_pool_t *p;
+ /* Assert that RV is an APR_SUCCESS value; else fail giving strerror
+  * for RV and CONTEXT message. */
+ void apr_assert_success(abts_case* tc, const char *context, apr_status_t rv);
++#define APR_ASSERT_SUCCESS(tc, ctxt, rv) \
++             apr_assert_success(tc, ctxt, rv)
+ 
+ void apr_assert_failure(abts_case* tc, const char *context,
+                         apr_status_t rv, int lineno);
diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
new file mode 100644
index 0000000000..a0c4004709
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
@@ -0,0 +1,2162 @@
+From 414e12e427c89f135d8ee66ab1203feffd3e2bd8 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Mon, 3 Aug 2026 12:34:32 +0000
+Subject: [PATCH] Merge r1936807 from 1.7.x:
+
+limit XML processing depth
+
+Submitted By: jorton
+Reviewed By: jorton, jfclere, ivan
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936815 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8]
+
+(cherry picked from commit 414e12e427c89f135d8ee66ab1203feffd3e2bd8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ CMakeLists.txt        |    3 +
+ test/data/nesting.xml | 2001 +++++++++++++++++++++++++++++++++++++++++
+ test/testxml.c        |   32 +
+ xml/apr_xml.c         |   21 +-
+ 4 files changed, 2056 insertions(+), 1 deletion(-)
+ create mode 100644 test/data/nesting.xml
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fcbfc582..65b9194d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -288,6 +288,9 @@ IF(APR_BUILD_TESTAPR)
+   EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
+                   ${PROJECT_SOURCE_DIR}/test/data/billion-laughs.xml
+                   ${PROJECT_BINARY_DIR}/data/billion-laughs.xml)
++  EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
++                  ${PROJECT_SOURCE_DIR}/test/data/nesting.xml
++                  ${PROJECT_BINARY_DIR}/data/nesting.xml)
+ 
+   IF(TEST_STATIC_LIBS)
+     SET(whichapr    aprutil-1)
+diff --git a/test/data/nesting.xml b/test/data/nesting.xml
+new file mode 100644
+index 00000000..a4efda86
+--- /dev/null
++++ b/test/data/nesting.xml
+@@ -0,0 +1,2001 @@
++<?xml version="1.0"?>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
+diff --git a/test/testxml.c b/test/testxml.c
+index eed10672..5284f888 100644
+--- a/test/testxml.c
++++ b/test/testxml.c
+@@ -20,6 +20,10 @@
+ #include "abts.h"
+ #include "testutil.h"
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ static apr_status_t create_dummy_file_error(abts_case *tc, apr_pool_t *p,
+                                             apr_file_t **fd)
+ {
+@@ -166,6 +170,33 @@ static void test_billion_laughs(abts_case *tc, void *data)
+     apr_file_close(fd);
+ }
+ 
++static void test_nesting_limit(abts_case *tc, void *data)
++{
++    apr_file_t *fd;
++    apr_xml_parser *parser = NULL;
++    apr_xml_doc *doc;
++    apr_status_t rv;
++    char errbuf[256], *err;
++
++    rv = apr_file_open(&fd, "data/nesting.xml",
++                       APR_FOPEN_READ, 0, p);
++    APR_ASSERT_SUCCESS(tc, "open nesting.xml", rv);
++
++    rv = apr_xml_parse_file(p, &parser, &doc, fd, 2000);
++    ABTS_TRUE(tc, rv != APR_SUCCESS);
++
++    if (parser) {
++        err = apr_xml_parser_geterror(parser, errbuf, sizeof errbuf);
++        ABTS_STR_EQUAL(tc,
++                       "The maximum element nesting limit "
++                       "(" APR_STRINGIFY(APR_XML_MAX_DEPTH) ")"
++                       " was exceeded.",
++                       err);
++    }
++
++    apr_file_close(fd);
++}
++
+ static void test_CVE_2009_3720_alpha(abts_case *tc, void *data)
+ {
+     apr_xml_parser *xp;
+@@ -198,6 +229,7 @@ abts_suite *testxml(abts_suite *suite)
+ 
+     abts_run_test(suite, test_xml_parser, NULL);
+     abts_run_test(suite, test_billion_laughs, NULL);
++    abts_run_test(suite, test_nesting_limit, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_alpha, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_beta, NULL);
+ 
+diff --git a/xml/apr_xml.c b/xml/apr_xml.c
+index 2685a9a5..a2535f98 100644
+--- a/xml/apr_xml.c
++++ b/xml/apr_xml.c
+@@ -61,12 +61,19 @@ struct apr_xml_parser {
+     int error;			/* an error has occurred */
+ #define APR_XML_ERROR_EXPAT             1
+ #define APR_XML_ERROR_PARSE_DONE        2
+-/* also: public APR_XML_NS_ERROR_* values (if any) */
++#define APR_XML_ERROR_DEPTH_LIMIT       3
+ 
++/* also: public APR_XML_NS_ERROR_* values (if any) */
++    /** depth of element tree. */
++    unsigned int depth;
+     XML_Parser xp;              /* the actual (Expat) XML parser */
+     enum XML_Error xp_err;      /* stored Expat error code */
+ };
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ /* struct for scoping namespace declarations */
+ typedef struct apr_xml_ns_scope {
+     const char *prefix;		/* prefix used for this ns */
+@@ -154,6 +161,11 @@ static void start_handler(void *userdata, const char *name, const char **attrs)
+     if (parser->error)
+ 	return;
+ 
++    if (++parser->depth > APR_XML_MAX_DEPTH) {
++        parser->error = APR_XML_ERROR_DEPTH_LIMIT;
++        return;
++    }
++
+     elem = apr_pcalloc(parser->p, sizeof(*elem));
+ 
+     /* prep the element */
+@@ -327,6 +339,8 @@ static void end_handler(void *userdata, const char *name)
+     if (parser->error)
+ 	return;
+ 
++    parser->depth--;
++
+     /* pop up one level */
+     parser->cur_elem = parser->cur_elem->parent;
+ }
+@@ -499,6 +513,11 @@ APU_DECLARE(char *) apr_xml_parser_geterror(apr_xml_parser *parser,
+                             XML_ErrorString(parser->xp_err), parser->xp_err);
+         return errbuf;
+ 
++    case APR_XML_ERROR_DEPTH_LIMIT:
++        msg = "The maximum element nesting limit ("
++            APR_STRINGIFY(APR_XML_MAX_DEPTH) ") was exceeded.";
++        break;
++
+     case APR_XML_ERROR_PARSE_DONE:
+         msg = "The parser is not active.";
+         break;
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 7b5a04c435..00a9589ae8 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -14,6 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configure_fixes.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
            file://CVE-2025-49506.patch \
+           file://CVE-2026-32327-dependent.patch \
+           file://CVE-2026-32327.patch \
            file://run-ptest \
            "
 
-- 
2.35.6

