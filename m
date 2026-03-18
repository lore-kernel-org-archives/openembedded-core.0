Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF7B10854DF
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:49:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10388.1773827353526172306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dTL9+p6M;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773827352; x=1805363352;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=anJo9d+vRocOmZIru96HxTskTRhZ2iRIHvwWWCX8Y8I=;
  b=dTL9+p6MqjkZlMGT8P9pgwxyjIF7wTodup73wT/kxlzK0kZKt0hzaeZJ
   bUnxcr+0aU4tCRwzC1C+1wLbhDpHHlegd0ePdkiddG7My2ZfIONgXsWlU
   ViPgRKNAfojiA9smvNgkjx/zEB7ZTf9gcBzgXVZ4mJLgGDnZag0qoBLUO
   3wwE+SUtdxD7jTyaWzLQxH0y1Rh05KGlu0K4DJfXr/sqO5H6N39L7WXfB
   BwwLAZfKrMip+VQT7fbqzZLB+GJuScjKlQfMx/jrVfMC3iWovYrjsORc/
   5rJSUH4PjPLd6+ef0H6+AJnJJTyav035lbv4hcOrTluwkK6j4xevnw+KD
   g==;
X-CSE-ConnectionGUID: HETp3vvFTQSGhX4wzUUZwg==
X-CSE-MsgGUID: 7jGSxy8jRQ25ARcqR9zeBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="222375464"
X-IronPort-AV: E=Sophos;i="6.23,127,1770562800"; 
   d="scan'208";a="222375464"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:49:10 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CC801C00540
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:49:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7C108C02F07
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:49:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DE85B20002BB
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:49:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libxml2: upgrade 2.15.1 -> 2.15.2
Date: Wed, 18 Mar 2026 17:49:05 +0800
Message-ID: <20260318094905.13065-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233373

1.Changelog
  https://gitlab.gnome.org/GNOME/libxml2/-/blob/2.15/NEWS?ref_type=heads

2.Remove following patch as merged upstream
  CVE-2026-0990.patch
  CVE-2026-0992-01.patch
  0001-testlimits-optionally-accept-timeout-input.patch
  CVE-2026-0989.patch
  CVE-2026-0992-02.patch
  CVE-2026-0992-03.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mits-optionally-accept-timeout-input.patch |  92 -----
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ----------------
 .../libxml/libxml2/CVE-2026-0990.patch        |  81 -----
 .../libxml/libxml2/CVE-2026-0992-01.patch     |  54 ---
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ------------------
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 --
 .../{libxml2_2.15.1.bb => libxml2_2.15.2.bb}  |   8 +-
 7 files changed, 1 insertion(+), 912 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.1.bb => libxml2_2.15.2.bb} (90%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch b/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch
deleted file mode 100644
index 2f0899a0be..0000000000
--- a/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From b45e38edab72e4f09b24a5c9672df818f8df020c Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 8 Jan 2026 15:30:47 -0500
-Subject: [PATCH] testlimits: optionally accept '-timeout' input
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/b45e38edab72e4f09b24a5c9672df818f8df020c]
-Fixes: #1032
-
-The testlimits tests can use a lot of system resources, and thus they
-may fail when run on systems under heavy load, given that the default
-parsing timeout is set to two seconds. Retain this default value, but
-make the timeout length configurable with a new '-timeout' flag.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- testlimits.c | 33 ++++++++++++++++++++++++++-------
- 1 file changed, 26 insertions(+), 7 deletions(-)
-
-diff --git a/testlimits.c b/testlimits.c
-index 695cbf48..87fcd1a1 100644
---- a/testlimits.c
-+++ b/testlimits.c
-@@ -35,9 +35,10 @@ static int tests_quiet = 0;
-  *									*
-  ************************************************************************/
- 
--/* maximum time for one parsing before declaring a timeout */
--#define MAX_TIME 2 /* seconds */
-+/* default maximum time for one parsing before declaring a timeout */
-+#define DEFAULT_MAX_TIME 2 /* seconds */
- 
-+static int max_time = DEFAULT_MAX_TIME;
- static clock_t t0;
- static int timeout = 0;
- 
-@@ -48,7 +49,7 @@ static void reset_timout(void) {
- 
- static int check_time(void) {
-     clock_t tnow = clock();
--    if (((tnow - t0) / CLOCKS_PER_SEC) > MAX_TIME) {
-+    if (((tnow - t0) / CLOCKS_PER_SEC) > max_time) {
-         timeout = 1;
-         return(0);
-     }
-@@ -1228,22 +1229,40 @@ runcrazy(void) {
-     return(ret);
- }
- 
--
- int
- main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
-     int i, a, ret = 0;
-     int subset = 0;
-+    char *endptr;
-+    long val;
- 
-     fillFilling();
-     initializeLibxml2();
- 
-     for (a = 1; a < argc;a++) {
-         if (!strcmp(argv[a], "-v"))
--	    verbose = 1;
-+            verbose = 1;
-         else if (!strcmp(argv[a], "-quiet"))
--	    tests_quiet = 1;
-+            tests_quiet = 1;
-         else if (!strcmp(argv[a], "-crazy"))
--	    subset = 1;
-+            subset = 1;
-+        else if (!strcmp(argv[a], "-timeout")) {
-+            if (a + 1 >= argc) {
-+                fprintf(stderr, "Error: -timeout requires a value in seconds\n");
-+                return 1;
-+            }
-+            val = strtol(argv[a + 1], &endptr, 10);
-+            if (endptr == argv[a + 1] || *endptr != '\0') {
-+                fprintf(stderr, "Error: -timeout value '%s' is not a valid number\n", argv[a + 1]);
-+                return 1;
-+            }
-+            if (val <= 0 || val > INT_MAX) {
-+                fprintf(stderr, "Error: -timeout must be a positive integer (got %s)\n", argv[a + 1]);
-+                return 1;
-+            }
-+            max_time = (int)val;
-+            a++;
-+        }
-     }
-     if (subset == 0) {
- 	for (i = 0; testDescriptions[i].func != NULL; i++) {
--- 
-2.52.0
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
deleted file mode 100644
index 635a39a7ed..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From 19549c61590c1873468c53e0026a2fbffae428ef Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 10 Oct 2025 09:38:31 +0200
-Subject: [PATCH] Add RelaxNG include limit
-
-This patch adds a default xmlRelaxNGIncludeLimit of 1.000, and that
-limit can be modified at runtime with the env variable
-RNG_INCLUDE_LIMIT.
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/998
-
-CVE: CVE-2026-0989
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/19549c61590c1873468c53e0026a2fbffae428ef]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- include/libxml/relaxng.h                 |  4 ++
- relaxng.c                                | 63 ++++++++++++++++++++--
- runtest.c                                | 67 ++++++++++++++++++++++++
- test/relaxng/include/include-limit.rng   |  4 ++
- test/relaxng/include/include-limit_1.rng |  4 ++
- test/relaxng/include/include-limit_2.rng |  4 ++
- test/relaxng/include/include-limit_3.rng |  8 +++
- 7 files changed, 150 insertions(+), 4 deletions(-)
- create mode 100644 test/relaxng/include/include-limit.rng
- create mode 100644 test/relaxng/include/include-limit_1.rng
- create mode 100644 test/relaxng/include/include-limit_2.rng
- create mode 100644 test/relaxng/include/include-limit_3.rng
-
-diff --git a/include/libxml/relaxng.h b/include/libxml/relaxng.h
-index eafc6604..099dacd8 100644
---- a/include/libxml/relaxng.h
-+++ b/include/libxml/relaxng.h
-@@ -136,6 +136,10 @@ XMLPUBFUN int
- 		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxt *ctxt,
- 						 int flag);
- 
-+XMLPUBFUN int
-+		    xmlRelaxParserSetIncLImit	(xmlRelaxNGParserCtxt *ctxt,
-+						 int limit);
-+
- XMLPUBFUN void
- 		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxt *ctxt);
- XMLPUBFUN void
-diff --git a/relaxng.c b/relaxng.c
-index 1d74ba9f..c0e94a3c 100644
---- a/relaxng.c
-+++ b/relaxng.c
-@@ -18,6 +18,8 @@
- 
- #ifdef LIBXML_RELAXNG_ENABLED
- 
-+#include <errno.h>
-+#include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
- #include <stddef.h>
-@@ -44,6 +46,12 @@
- static const xmlChar *xmlRelaxNGNs = (const xmlChar *)
-     "http://relaxng.org/ns/structure/1.0";
- 
-+/*
-+ * Default include limit, this can be override with RNG_INCLUDE_LIMIT
-+ * env variable
-+ */
-+static const int _xmlRelaxNGIncludeLimit = 1000;
-+
- #define IS_RELAXNG(node, typ)						\
-    ((node != NULL) && (node->ns != NULL) &&				\
-     (node->type == XML_ELEMENT_NODE) &&					\
-@@ -218,6 +226,7 @@ struct _xmlRelaxNGParserCtxt {
-     int incNr;                  /* Depth of the include parsing stack */
-     int incMax;                 /* Max depth of the parsing stack */
-     xmlRelaxNGIncludePtr *incTab;       /* array of incs */
-+    int incLimit;               /* Include limit, to avoid stack-overflow on parse */
- 
-     int idref;                  /* requires idref checking */
- 
-@@ -1342,6 +1351,23 @@ xmlRelaxParserSetFlag(xmlRelaxNGParserCtxt *ctxt, int flags)
-     return(0);
- }
- 
-+/**
-+ * Semi private function used to set the include recursion limit to a
-+ * parser context. Set to 0 to use the default value.
-+ *
-+ * @param ctxt  a RelaxNG parser context
-+ * @param limit the new include depth limit
-+ * @returns 0 if success and -1 in case of error
-+ */
-+int
-+xmlRelaxParserSetIncLImit(xmlRelaxNGParserCtxt *ctxt, int limit)
-+{
-+    if (ctxt == NULL) return(-1);
-+    if (limit < 0) return(-1);
-+    ctxt->incLimit = limit;
-+    return(0);
-+}
-+
- /************************************************************************
-  *									*
-  *			Document functions				*
-@@ -1397,7 +1423,7 @@ xmlRelaxReadMemory(xmlRelaxNGParserCtxtPtr ctxt, const char *buf, int size) {
-  *
-  * @param ctxt  the parser context
-  * @param value  the element doc
-- * @returns 0 in case of error, the index in the stack otherwise
-+ * @returns -1 in case of error, the index in the stack otherwise
-  */
- static int
- xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
-@@ -1411,9 +1437,15 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
-                                                sizeof(ctxt->incTab[0]));
-         if (ctxt->incTab == NULL) {
-             xmlRngPErrMemory(ctxt);
--            return (0);
-+            return (-1);
-         }
-     }
-+    if (ctxt->incNr >= ctxt->incLimit) {
-+        xmlRngPErr(ctxt, (xmlNodePtr)value->doc, XML_RNGP_PARSE_ERROR,
-+                   "xmlRelaxNG: inclusion recursion limit reached\n", NULL, NULL);
-+        return(-1);
-+    }
-+
-     if (ctxt->incNr >= ctxt->incMax) {
-         ctxt->incMax *= 2;
-         ctxt->incTab =
-@@ -1422,7 +1454,7 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
-                                                 sizeof(ctxt->incTab[0]));
-         if (ctxt->incTab == NULL) {
-             xmlRngPErrMemory(ctxt);
--            return (0);
-+            return (-1);
-         }
-     }
-     ctxt->incTab[ctxt->incNr] = value;
-@@ -1586,7 +1618,9 @@ xmlRelaxNGLoadInclude(xmlRelaxNGParserCtxtPtr ctxt, const xmlChar * URL,
-     /*
-      * push it on the stack
-      */
--    xmlRelaxNGIncludePush(ctxt, ret);
-+    if (xmlRelaxNGIncludePush(ctxt, ret) < 0) {
-+        return (NULL);
-+    }
- 
-     /*
-      * Some preprocessing of the document content, this include recursing
-@@ -7261,11 +7295,32 @@ xmlRelaxNGParse(xmlRelaxNGParserCtxt *ctxt)
-     xmlDocPtr doc;
-     xmlNodePtr root;
- 
-+    const char *include_limit_env = getenv("RNG_INCLUDE_LIMIT");
-+
-     xmlRelaxNGInitTypes();
- 
-     if (ctxt == NULL)
-         return (NULL);
- 
-+    if (ctxt->incLimit == 0) {
-+        ctxt->incLimit = _xmlRelaxNGIncludeLimit;
-+        if (include_limit_env != NULL) {
-+            char *strEnd;
-+            unsigned long val = 0;
-+            errno = 0;
-+            val = strtoul(include_limit_env, &strEnd, 10);
-+            if (errno != 0 || *strEnd != 0 || val > INT_MAX) {
-+                xmlRngPErr(ctxt, NULL, XML_RNGP_PARSE_ERROR,
-+                           "xmlRelaxNGParse: invalid RNG_INCLUDE_LIMIT %s\n",
-+                           (const xmlChar*)include_limit_env,
-+                           NULL);
-+                return(NULL);
-+            }
-+            if (val)
-+                ctxt->incLimit = val;
-+        }
-+    }
-+
-     /*
-      * First step is to parse the input document into an DOM/Infoset
-      */
-diff --git a/runtest.c b/runtest.c
-index 49519aef..45109f0a 100644
---- a/runtest.c
-+++ b/runtest.c
-@@ -3741,6 +3741,70 @@ rngTest(const char *filename,
-     return(ret);
- }
- 
-+/**
-+ * Parse an RNG schemas with a custom RNG_INCLUDE_LIMIT
-+ *
-+ * @param filename  the schemas file
-+ * @param result  the file with expected result
-+ * @param err  the file with error messages
-+ * @returns 0 in case of success, an error code otherwise
-+ */
-+static int
-+rngIncludeTest(const char *filename,
-+               const char *resul ATTRIBUTE_UNUSED,
-+               const char *errr ATTRIBUTE_UNUSED,
-+               int options ATTRIBUTE_UNUSED) {
-+    xmlRelaxNGParserCtxtPtr ctxt;
-+    xmlRelaxNGPtr schemas;
-+    int ret = 0;
-+
-+    /* first compile the schemas if possible */
-+    ctxt = xmlRelaxNGNewParserCtxt(filename);
-+    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
-+                                        NULL);
-+
-+    /* Should work */
-+    schemas = xmlRelaxNGParse(ctxt);
-+    if (schemas == NULL) {
-+        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
-+                         filename);
-+        ret = -1;
-+        goto done;
-+    }
-+    xmlRelaxNGFree(schemas);
-+    xmlRelaxNGFreeParserCtxt(ctxt);
-+
-+    ctxt = xmlRelaxNGNewParserCtxt(filename);
-+    /* Should fail */
-+    xmlRelaxParserSetIncLImit(ctxt, 2);
-+    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
-+                                        NULL);
-+    schemas = xmlRelaxNGParse(ctxt);
-+    if (schemas != NULL) {
-+        ret = -1;
-+        xmlRelaxNGFree(schemas);
-+    }
-+    xmlRelaxNGFreeParserCtxt(ctxt);
-+
-+    ctxt = xmlRelaxNGNewParserCtxt(filename);
-+    /* Should work */
-+    xmlRelaxParserSetIncLImit(ctxt, 3);
-+    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandler,
-+                                        NULL);
-+    schemas = xmlRelaxNGParse(ctxt);
-+    if (schemas == NULL) {
-+        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n",
-+                         filename);
-+        ret = -1;
-+        goto done;
-+    }
-+    xmlRelaxNGFree(schemas);
-+
-+done:
-+    xmlRelaxNGFreeParserCtxt(ctxt);
-+    return(ret);
-+}
-+
- #ifdef LIBXML_READER_ENABLED
- /**
-  * Parse a set of files with streaming, applying an RNG schemas
-@@ -5202,6 +5266,9 @@ testDesc testDescriptions[] = {
-     { "Relax-NG regression tests" ,
-       rngTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
-       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
-+    { "Relax-NG include limit tests" ,
-+      rngIncludeTest, "./test/relaxng/include/include-limit.rng", NULL, NULL, NULL,
-+      0 },
- #ifdef LIBXML_READER_ENABLED
-     { "Relax-NG streaming regression tests" ,
-       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
-diff --git a/test/relaxng/include/include-limit.rng b/test/relaxng/include/include-limit.rng
-new file mode 100644
-index 00000000..51f03942
---- /dev/null
-+++ b/test/relaxng/include/include-limit.rng
-@@ -0,0 +1,4 @@
-+<?xml version="1.0" encoding="UTF-8"?>
-+<grammar xmlns="http://relaxng.org/ns/structure/1.0">
-+    <include href="include-limit_1.rng"/>
-+</grammar>
-diff --git a/test/relaxng/include/include-limit_1.rng b/test/relaxng/include/include-limit_1.rng
-new file mode 100644
-index 00000000..4672da38
---- /dev/null
-+++ b/test/relaxng/include/include-limit_1.rng
-@@ -0,0 +1,4 @@
-+<?xml version="1.0" encoding="UTF-8"?>
-+<grammar xmlns="http://relaxng.org/ns/structure/1.0">
-+    <include href="include-limit_2.rng"/>
-+</grammar>
-diff --git a/test/relaxng/include/include-limit_2.rng b/test/relaxng/include/include-limit_2.rng
-new file mode 100644
-index 00000000..b35ecaa8
---- /dev/null
-+++ b/test/relaxng/include/include-limit_2.rng
-@@ -0,0 +1,4 @@
-+<?xml version="1.0" encoding="UTF-8"?>
-+<grammar xmlns="http://relaxng.org/ns/structure/1.0">
-+    <include href="include-limit_3.rng"/>
-+</grammar>
-diff --git a/test/relaxng/include/include-limit_3.rng b/test/relaxng/include/include-limit_3.rng
-new file mode 100644
-index 00000000..86213c62
---- /dev/null
-+++ b/test/relaxng/include/include-limit_3.rng
-@@ -0,0 +1,8 @@
-+<?xml version="1.0" encoding="UTF-8"?>
-+<grammar xmlns="http://relaxng.org/ns/structure/1.0">
-+    <start>
-+        <element name="root">
-+            <empty/>
-+        </element>
-+    </start>
-+</grammar>
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
deleted file mode 100644
index 6b2b8799f5..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 1961208e958ca22f80a0b4e4c9d71cfa050aa982 Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Wed, 17 Dec 2025 15:24:08 +0100
-Subject: [PATCH] catalog: prevent inf recursion in xmlCatalogXMLResolveURI
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018
-
-CVE: CVE-2026-0990
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1961208e958ca22f80a0b4e4c9d71cfa050aa982]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- catalog.c | 31 +++++++++++++++++++++++--------
- 1 file changed, 23 insertions(+), 8 deletions(-)
-
-diff --git a/catalog.c b/catalog.c
-index 76c063a8..46b877e6 100644
---- a/catalog.c
-+++ b/catalog.c
-@@ -2025,12 +2025,21 @@ static xmlChar *
- xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
-     xmlChar *ret = NULL;
-     xmlChar *urnID = NULL;
-+    xmlCatalogEntryPtr cur = NULL;
- 
-     if (catal == NULL)
-         return(NULL);
-     if (URI == NULL)
- 	return(NULL);
- 
-+    if (catal->depth > MAX_CATAL_DEPTH) {
-+	xmlCatalogErr(catal, NULL, XML_CATALOG_RECURSION,
-+		      "Detected recursion in catalog %s\n",
-+		      catal->name, NULL, NULL);
-+	return(NULL);
-+    }
-+    catal->depth++;
-+
-     if (!xmlStrncmp(URI, BAD_CAST XML_URN_PUBID, sizeof(XML_URN_PUBID) - 1)) {
- 	urnID = xmlCatalogUnWrapURN(URI);
- 	if (xmlDebugCatalogs) {
-@@ -2044,21 +2053,27 @@ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
- 	ret = xmlCatalogListXMLResolve(catal, urnID, NULL);
- 	if (urnID != NULL)
- 	    xmlFree(urnID);
-+	catal->depth--;
- 	return(ret);
-     }
--    while (catal != NULL) {
--	if (catal->type == XML_CATA_CATALOG) {
--	    if (catal->children == NULL) {
--		xmlFetchXMLCatalogFile(catal);
-+    cur = catal;
-+    while (cur != NULL) {
-+	if (cur->type == XML_CATA_CATALOG) {
-+	    if (cur->children == NULL) {
-+		xmlFetchXMLCatalogFile(cur);
- 	    }
--	    if (catal->children != NULL) {
--		ret = xmlCatalogXMLResolveURI(catal->children, URI);
--		if (ret != NULL)
-+	    if (cur->children != NULL) {
-+		ret = xmlCatalogXMLResolveURI(cur->children, URI);
-+		if (ret != NULL) {
-+		    catal->depth--;
- 		    return(ret);
-+		}
- 	    }
- 	}
--	catal = catal->next;
-+	cur = cur->next;
-     }
-+
-+    catal->depth--;
-     return(ret);
- }
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
deleted file mode 100644
index 5f0602f043..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 19 Dec 2025 11:02:18 +0100
-Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
-
-This patch makes the catalog parsing to ignore repeated entries of
-nextCatalog with the same value.
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
-
-CVE: CVE-2026-0992
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- catalog.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/catalog.c b/catalog.c
-index 46b877e6..fa6d77ca 100644
---- a/catalog.c
-+++ b/catalog.c
-@@ -1223,9 +1223,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
- 		BAD_CAST "delegateURI", BAD_CAST "uriStartString",
- 		BAD_CAST "catalog", prefer, cgroup);
-     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
-+	xmlCatalogEntryPtr prev = parent->children;
-+
- 	entry = xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
- 		BAD_CAST "nextCatalog", NULL,
- 		BAD_CAST "catalog", prefer, cgroup);
-+	/* Avoid duplication of nextCatalog */
-+	while (prev != NULL) {
-+	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
-+		(xmlStrEqual (prev->URL, entry->URL)) &&
-+		(xmlStrEqual (prev->value, entry->value)) &&
-+		(prev->prefer == entry->prefer) &&
-+		(prev->group == entry->group)) {
-+		    if (xmlDebugCatalogs)
-+			xmlCatalogPrintDebug(
-+			    "Ignoring repeated nextCatalog %s\n", entry->URL);
-+		    xmlFreeCatalogEntry(entry, NULL);
-+		    entry = NULL;
-+		    break;
-+	    }
-+	    prev = prev->next;
-+	}
-     }
-     if (entry != NULL) {
-         if (parent != NULL) {
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
deleted file mode 100644
index ebf6893b38..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
+++ /dev/null
@@ -1,336 +0,0 @@
-From f8399e62a31095bf1ced01827c33f9b29494046f Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 19 Dec 2025 12:27:54 +0100
-Subject: [PATCH] testcatalog: Add new tests for catalog.c
-
-Adds a new test program to run specific tests related to catalog
-parsing.
-
-This initial version includes a couple of tests, the first one to check
-the infinite recursion detection related to:
-https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018.
-
-The second one tests the nextCatalog element repeated parsing, related
-to:
-https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
-https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
-
-CVE: CVE-2026-0992
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f8399e62a31095bf1ced01827c33f9b29494046f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- CMakeLists.txt                          |  2 +
- Makefile.am                             |  6 ++
- catalog.c                               | 63 +++++++++++-----
- include/libxml/catalog.h                |  2 +
- meson.build                             |  1 +
- test/catalogs/catalog-recursive.xml     |  3 +
- test/catalogs/repeated-next-catalog.xml | 10 +++
- testcatalog.c                           | 96 +++++++++++++++++++++++++
- 8 files changed, 164 insertions(+), 19 deletions(-)
- create mode 100644 test/catalogs/catalog-recursive.xml
- create mode 100644 test/catalogs/repeated-next-catalog.xml
- create mode 100644 testcatalog.c
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 163661f8..7d5702df 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -465,6 +465,7 @@ if(LIBXML2_WITH_TESTS)
-         runxmlconf
-         runsuite
-         testapi
-+        testcatalog
-         testchar
-         testdict
-         testModule
-@@ -487,6 +488,7 @@ if(LIBXML2_WITH_TESTS)
-         add_test(NAME runxmlconf COMMAND runxmlconf WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
-     endif()
-     add_test(NAME testapi COMMAND testapi)
-+    add_test(NAME testcatalog COMMAND testcatalog)
-     add_test(NAME testchar COMMAND testchar)
-     add_test(NAME testdict COMMAND testdict)
-     add_test(NAME testparser COMMAND testparser WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
-diff --git a/Makefile.am b/Makefile.am
-index c51dfd8e..c794eac8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -23,6 +23,7 @@ check_PROGRAMS = \
- 	runxmlconf \
- 	testModule \
- 	testapi \
-+	testcatalog \
- 	testchar \
- 	testdict \
- 	testlimits \
-@@ -128,6 +129,10 @@ testlimits_SOURCES=testlimits.c
- testlimits_DEPENDENCIES = $(DEPS)
- testlimits_LDADD= $(LDADDS)
- 
-+testcatalog_SOURCES=testcatalog.c
-+testcatalog_DEPENDENCIES = $(DEPS)
-+testcatalog_LDADD= $(LDADDS)
-+
- testchar_SOURCES=testchar.c
- testchar_DEPENDENCIES = $(DEPS)
- testchar_LDADD= $(LDADDS)
-@@ -175,6 +180,7 @@ check-local:
- 	$(CHECKER) ./runtest$(EXEEXT)
- 	$(CHECKER) ./testrecurse$(EXEEXT)
- 	$(CHECKER) ./testapi$(EXEEXT)
-+	$(CHECKER) ./testcatalog$(EXEEXT)
- 	$(CHECKER) ./testchar$(EXEEXT)
- 	$(CHECKER) ./testdict$(EXEEXT)
- 	$(CHECKER) ./testparser$(EXEEXT)
-diff --git a/catalog.c b/catalog.c
-index 401dbc14..eb889162 100644
---- a/catalog.c
-+++ b/catalog.c
-@@ -640,43 +640,54 @@ static void xmlDumpXMLCatalogNode(xmlCatalogEntryPtr catal, xmlNodePtr catalog,
-     }
- }
- 
--static int
--xmlDumpXMLCatalog(FILE *out, xmlCatalogEntryPtr catal) {
--    int ret;
--    xmlDocPtr doc;
-+static xmlDocPtr
-+xmlDumpXMLCatalogToDoc(xmlCatalogEntryPtr catal) {
-     xmlNsPtr ns;
-     xmlDtdPtr dtd;
-     xmlNodePtr catalog;
--    xmlOutputBufferPtr buf;
-+    xmlDocPtr doc = xmlNewDoc(NULL);
-+    if (doc == NULL) {
-+        return(NULL);
-+    }
- 
--    /*
--     * Rebuild a catalog
--     */
--    doc = xmlNewDoc(NULL);
--    if (doc == NULL)
--	return(-1);
-     dtd = xmlNewDtd(doc, BAD_CAST "catalog",
--	       BAD_CAST "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN",
--BAD_CAST "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd");
-+                    BAD_CAST "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN",
-+                    BAD_CAST "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd");
- 
-     xmlAddChild((xmlNodePtr) doc, (xmlNodePtr) dtd);
- 
-     ns = xmlNewNs(NULL, XML_CATALOGS_NAMESPACE, NULL);
-     if (ns == NULL) {
--	xmlFreeDoc(doc);
--	return(-1);
-+        xmlFreeDoc(doc);
-+        return(NULL);
-     }
-     catalog = xmlNewDocNode(doc, ns, BAD_CAST "catalog", NULL);
-     if (catalog == NULL) {
--	xmlFreeNs(ns);
--	xmlFreeDoc(doc);
--	return(-1);
-+        xmlFreeDoc(doc);
-+        xmlFreeNs(ns);
-+        return(NULL);
-     }
-     catalog->nsDef = ns;
-     xmlAddChild((xmlNodePtr) doc, catalog);
--
-     xmlDumpXMLCatalogNode(catal, catalog, doc, ns, NULL);
- 
-+    return(doc);
-+}
-+
-+static int
-+xmlDumpXMLCatalog(FILE *out, xmlCatalogEntryPtr catal) {
-+    int ret;
-+    xmlDocPtr doc;
-+    xmlOutputBufferPtr buf;
-+
-+    /*
-+     * Rebuild a catalog
-+     */
-+    doc = xmlDumpXMLCatalogToDoc(catal);
-+    if (doc == NULL) {
-+        return(-1);
-+    }
-+
-     /*
-      * reserialize it
-      */
-@@ -3339,6 +3350,20 @@ xmlCatalogDump(FILE *out) {
- 
-     xmlACatalogDump(xmlDefaultCatalog, out);
- }
-+
-+/**
-+ * Dump all the global catalog content as a xmlDoc
-+ * This function is just for testing/debugging purposes
-+ *
-+ * @returns  The catalog as xmlDoc or NULL if failed, it must be freed by the caller.
-+ */
-+xmlDocPtr
-+xmlCatalogDumpDoc(void) {
-+    if (!xmlCatalogInitialized)
-+        xmlInitializeCatalog();
-+
-+    return xmlDumpXMLCatalogToDoc(xmlDefaultCatalog->xml);
-+}
- #endif /* LIBXML_OUTPUT_ENABLED */
- 
- /**
-diff --git a/include/libxml/catalog.h b/include/libxml/catalog.h
-index 88a7483c..e1bc5feb 100644
---- a/include/libxml/catalog.h
-+++ b/include/libxml/catalog.h
-@@ -138,6 +138,8 @@ XMLPUBFUN void
- #ifdef LIBXML_OUTPUT_ENABLED
- XMLPUBFUN void
- 		xmlCatalogDump		(FILE *out);
-+XMLPUBFUN xmlDocPtr
-+		xmlCatalogDumpDoc	(void);
- #endif /* LIBXML_OUTPUT_ENABLED */
- XMLPUBFUN xmlChar *
- 		xmlCatalogResolve	(const xmlChar *pubID,
-diff --git a/meson.build b/meson.build
-index 1cd89f09..4bf17f6c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -509,6 +509,7 @@ checks = {
- # Disabled for now, see #694
- #    'testModule': [],
-     'testapi': [],
-+    'testcatalog': [],
-     'testchar': [],
-     'testdict': [],
-     'testlimits': [],
-diff --git a/test/catalogs/catalog-recursive.xml b/test/catalogs/catalog-recursive.xml
-new file mode 100644
-index 00000000..3b3d03f9
---- /dev/null
-+++ b/test/catalogs/catalog-recursive.xml
-@@ -0,0 +1,3 @@
-+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-+    <delegateURI uriStartString="/foo" catalog="catalog-recursive.xml"/>
-+</catalog>
-diff --git a/test/catalogs/repeated-next-catalog.xml b/test/catalogs/repeated-next-catalog.xml
-new file mode 100644
-index 00000000..76d34c3c
---- /dev/null
-+++ b/test/catalogs/repeated-next-catalog.xml
-@@ -0,0 +1,10 @@
-+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-+  <nextCatalog catalog="registry.xml"/>
-+  <nextCatalog catalog="registry.xml"/>
-+  <nextCatalog catalog="./registry.xml"/>
-+  <nextCatalog catalog="././registry.xml"/>
-+  <nextCatalog catalog="./././registry.xml"/>
-+  <nextCatalog catalog="./../catalogs/registry.xml"/>
-+  <nextCatalog catalog="./../catalogs/./registry.xml"/>
-+</catalog>
-+
-diff --git a/testcatalog.c b/testcatalog.c
-new file mode 100644
-index 00000000..86d33bd0
---- /dev/null
-+++ b/testcatalog.c
-@@ -0,0 +1,96 @@
-+/*
-+ * testcatalog.c: C program to run libxml2 catalog.c unit tests
-+ *
-+ * To compile on Unixes:
-+ * cc -o testcatalog `xml2-config --cflags` testcatalog.c `xml2-config --libs` -lpthread
-+ *
-+ * See Copyright for the status of this software.
-+ *
-+ * Author: Daniel Garcia <dani@danigm.net>
-+ */
-+
-+
-+#include "libxml.h"
-+#include <stdio.h>
-+
-+#ifdef LIBXML_CATALOG_ENABLED
-+#include <libxml/catalog.h>
-+
-+/* Test catalog resolve uri with recursive catalog */
-+static int
-+testRecursiveDelegateUri(void) {
-+    int ret = 0;
-+    const char *cat = "test/catalogs/catalog-recursive.xml";
-+    const char *entity = "/foo.ent";
-+    xmlChar *resolved = NULL;
-+
-+    xmlInitParser();
-+    xmlLoadCatalog(cat);
-+
-+    /* This should trigger recursive error */
-+    resolved = xmlCatalogResolveURI(BAD_CAST entity);
-+    if (resolved != NULL) {
-+        fprintf(stderr, "CATALOG-FAILURE: Catalog %s entity should fail to resolve\n", entity);
-+        ret = 1;
-+    }
-+    xmlCatalogCleanup();
-+
-+    return ret;
-+}
-+
-+/* Test parsing repeated NextCatalog */
-+static int
-+testRepeatedNextCatalog(void) {
-+    int ret = 0;
-+    int i = 0;
-+    const char *cat = "test/catalogs/repeated-next-catalog.xml";
-+    const char *entity = "/foo.ent";
-+    xmlDocPtr doc = NULL;
-+    xmlNodePtr node = NULL;
-+
-+    xmlInitParser();
-+
-+    xmlLoadCatalog(cat);
-+    /* To force the complete recursive load */
-+    xmlCatalogResolveURI(BAD_CAST entity);
-+    /**
-+     * Ensure that the doc doesn't contain the same nextCatalog
-+     */
-+    doc = xmlCatalogDumpDoc();
-+    xmlCatalogCleanup();
-+
-+    if (doc == NULL) {
-+        fprintf(stderr, "CATALOG-FAILURE: Failed to dump the catalog\n");
-+        return 1;
-+    }
-+
-+    /* Just the root "catalog" node with a series of nextCatalog */
-+    node = xmlDocGetRootElement(doc);
-+    node = node->children;
-+    for (i=0; node != NULL; node=node->next, i++) {}
-+    if (i > 1) {
-+        fprintf(stderr, "CATALOG-FAILURE: Found %d nextCatalog entries and should be 1\n", i);
-+        ret = 1;
-+    }
-+
-+    xmlFreeDoc(doc);
-+
-+    return ret;
-+}
-+
-+int
-+main(void) {
-+    int err = 0;
-+
-+    err |= testRecursiveDelegateUri();
-+    err |= testRepeatedNextCatalog();
-+
-+    return err;
-+}
-+#else
-+/* No catalog, so everything okay */
-+int
-+main(void) {
-+    return 0;
-+}
-+#endif
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
deleted file mode 100644
index b7a4e4cf63..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From deed3b7873dff30b7f87f7f33154c9932a772522 Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <dani@danigm.net>
-Date: Sun, 18 Jan 2026 19:47:11 +0100
-Subject: [PATCH] catalog: Do not check value for duplication nextCatalog
-
-The value field stores the path as it appears in the catalog definition,
-the URL is built using xmlBuildURI that changes the relative paths to
-absolute.
-
-This change fixes the issue of using relative path to the same catalog
-in the same file.
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
-
-CVE: CVE-2026-0992
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/deed3b7873dff30b7f87f7f33154c9932a772522]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- catalog.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/catalog.c b/catalog.c
-index eb889162..ba9ee7ae 100644
---- a/catalog.c
-+++ b/catalog.c
-@@ -1243,7 +1243,6 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
- 	while (prev != NULL) {
- 	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
- 		(xmlStrEqual (prev->URL, entry->URL)) &&
--		(xmlStrEqual (prev->value, entry->value)) &&
- 		(prev->prefer == entry->prefer) &&
- 		(prev->group == entry->group)) {
- 		    if (xmlDebugCatalogs)
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.2.bb
similarity index 90%
rename from meta/recipes-core/libxml/libxml2_2.15.1.bb
rename to meta/recipes-core/libxml/libxml2_2.15.2.bb
index be37fa27fe..99560f4b24 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.2.bb
@@ -15,18 +15,12 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
-           file://CVE-2026-0990.patch \
-           file://CVE-2026-0992-01.patch \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://0001-testlimits-optionally-accept-timeout-input.patch \
-           file://CVE-2026-0989.patch \
-           file://CVE-2026-0992-02.patch \
-           file://CVE-2026-0992-03.patch \
            "
 
-SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"
+SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.43.0


