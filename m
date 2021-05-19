Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.1456.1621468475918273185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 16:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mLWBuTXh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468473; i=@fujitsu.com;
	bh=ZJSRCqe59jJpIk9KLaVTfUd98rQBEair09hQc29uuD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mLWBuTXhdtUhb2DeLVz4XCVNfigygTJYTTcbKRjRnjc03dhWB7WN5NAkNYL/jEKKm
	 Z+FBzEh0LINowTdlkc7QP+eBig3T+55kfXFTxu4/Ccg5lTcJujC+eyCBcrtJj2eRK6
	 +E5iZtDT+XneN8y/xClHuWGZ+e8ltGjcqgcTxCGfQ0bAo2ctbKfmUvVZdDNujiiodM
	 PVuun01GLbVlK5SB5LHZP7nV1h0vhL3TU3Fq0W8funNYWkjoqLqAIcudXTywp1Yk6h
	 uXDa+gyLMsiw5L8K8GuUL8CqT6pygW28JgXnIcKY4v1qnSjDHSsxnox2qRZclhZPFl
	 Bq4PnguQp1dmQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id AC/4C-19780-835A5A06; Wed, 19 May 2021 23:54:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxRddi6dI
  Eg+O/WSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owLJ+azFfxrZ6zYvOYPSwPjz8IuRi4OIYFZ
  TBJPNq9jhnBOMEo8m7yarYuRk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuYQexhQVsJ
  DZPWAxmswioSvSf/grWyivgJHH41xUmEFtCQEFiysP3zCA2p4CzxLr2V2D1QkA1a1ZtYYaoF5
  Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIvD58iXkCI/8sJC2zkLQsYGRaxWiRVJSZnlGSm5i
  Zo2toYKBraGisa6hraqiXWKWbqJdaqpucmldSlAiU1EssL9YrrsxNzknRy0st2cQIDMiUQkbj
  HYwHX3/QO8QoycGkJMprdn9RghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3mmLlyYICRalpqdWp
  GXmAKMDJi3BwaMkwqsxBSjNW1yQmFucmQ6ROsVoyXH5+rxFzBwvri4Gku9+Akkhlrz8vFQpcd
  7ZS4AaBEAaMkrz4MbBIvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeS5ApPJl5JXBbXwE
  dxAR00P/GRSAHlSQipKQamCa/Ty9UXXfiAPN3R/Mbkx3jakxlpjCEKgutWt4eX//dNrAlKOze
  37KsOYXSwXmB1yYb7zvkwV3bX71OP8Qr4UO0S/GeDzGJE+sX2RuUPbO/cj5EsHdJ+y6tJWp7G
  u7OmXlfhO/SJRv90zMtuh4WHZ7RdmhTteyslS92/tbv+PUp8u3ShOLWuM6DU1zr1RN/CMUWTj
  1cHnSR6ZzUj2n+Vetbi96o8BpFF33JLmS85nJ9eYfp/bRXq39vnrtKdrfziXllr7/VLMzftyQ
  nc/rko3I7P05dt27zR6Zn7pua/29+vbbH9IlP4kyBuTvr/fp2n7hg2PRWJ25Hpi7/NIXV0uW8
  gQ7WpyaczwyRlgqZoqzEUpyRaKjFXFScCAB5fWHMWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-232.messagelabs.com!1621468471!35913!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26017 invoked from network); 19 May 2021 23:54:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:54:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNsVMU010052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 00:54:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:54:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxml2: upgrade 2.9.10 -> 2.9.12
Date: Thu, 20 May 2021 07:53:55 +0800
Message-ID: <1621468435-21509-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

CVE-2019-20388.patch
CVE-2020-24977.patch
CVE-2020-7595.patch
fix-python39.patch
removed since they are included in 2.9.12

refresh 0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
and libxml-m4-use-pkgconfig.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...he-python-tests-if-python-is-enabled.patch | 33 +++----
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 --------
 .../libxml/libxml2/CVE-2020-24977.patch       | 41 --------
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 -------
 .../libxml/libxml2/fix-python39.patch         | 94 -------------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 29 +++---
 .../{libxml2_2.9.10.bb => libxml2_2.9.12.bb}  | 14 +--
 7 files changed, 35 insertions(+), 249 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-python39.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.10.bb => libxml2_2.9.12.bb} (88%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
index 5e9a0a506b..4bdd56bbf7 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
@@ -9,15 +9,16 @@ be due to the fact that the tests are forced to run with Python 3.
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 
+rebase for 2.9.12
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- Makefile.am                  |  2 +-
- python/Makefile.am           |  9 +++++++++
- python/tests/Makefile.am     | 10 ++++++++++
- python/tests/tstLastError.py |  2 +-
- 4 files changed, 21 insertions(+), 2 deletions(-)
+ Makefile.am              |  2 +-
+ python/Makefile.am       |  9 +++++++++
+ python/tests/Makefile.am | 10 ++++++++++
+ 3 files changed, 20 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index ae62274..bd1e425 100644
+index b428452..dc18d6d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -203,9 +203,9 @@ install-ptest:
@@ -32,7 +33,7 @@ index ae62274..bd1e425 100644
  runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
 diff --git a/python/Makefile.am b/python/Makefile.am
-index 34aed96..ba3ec6a 100644
+index 34aed96..567d81d 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class.txt $(BUILT_SOURCES)
@@ -53,7 +54,7 @@ index 34aed96..ba3ec6a 100644
  tests test: all
  	cd tests && $(MAKE) tests
 diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
-index 227e24d..021bb29 100644
+index 227e24d..faf9056 100644
 --- a/python/tests/Makefile.am
 +++ b/python/tests/Makefile.am
 @@ -59,6 +59,11 @@ XMLS=		\
@@ -83,16 +84,6 @@ index 227e24d..021bb29 100644
 +
  tests:
  endif
-diff --git a/python/tests/tstLastError.py b/python/tests/tstLastError.py
-index 81d0acc..162c8db 100755
---- a/python/tests/tstLastError.py
-+++ b/python/tests/tstLastError.py
-@@ -25,7 +25,7 @@ class TestCase(unittest.TestCase):
-         when the exception is raised, check the libxml2.lastError for
-         expected values."""
-         # disable the default error handler
--        libxml2.registerErrorHandler(None,None)
-+        libxml2.registerErrorHandler(lambda ctx,str: None,None)
-         try:
-             f(*args)
-         except exc:
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
deleted file mode 100644
index 88eb65a6a5..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Tue, 20 Aug 2019 16:33:06 +0800
-Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
-
-When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
-alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
-to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
-vctxt->xsiAssemble to 0 again which cause the alloced schema
-can not be freed anymore.
-
-Found with libFuzzer.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/7ffcd44d7e6c46704f8af0321d9314cd26e0e18a]
-CVE: CVE-2019-20388
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- xmlschemas.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/xmlschemas.c b/xmlschemas.c
-index 301c8449..39d92182 100644
---- a/xmlschemas.c
-+++ b/xmlschemas.c
-@@ -28090,7 +28090,6 @@ xmlSchemaPreRun(xmlSchemaValidCtxtPtr vctxt) {
-     vctxt->nberrors = 0;
-     vctxt->depth = -1;
-     vctxt->skipDepth = -1;
--    vctxt->xsiAssemble = 0;
-     vctxt->hasKeyrefs = 0;
- #ifdef ENABLE_IDC_NODE_TABLES_TEST
-     vctxt->createIDCNodeTables = 1;
--- 
-2.24.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
deleted file mode 100644
index 8224346660..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 7 Aug 2020 21:54:27 +0200
-Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
-
-Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
-array access.
-
-Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
-the report.
-
-Fixes #178.
-
-CVE: CVE-2020-24977
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- xmllint.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/xmllint.c b/xmllint.c
-index f6a8e463..c647486f 100644
---- a/xmllint.c
-+++ b/xmllint.c
-@@ -528,6 +528,12 @@ static void
- xmlHTMLEncodeSend(void) {
-     char *result;
- 
-+    /*
-+     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
-+     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
-+     * an out-of-bounds read.
-+     */
-+    memset(&buffer[sizeof(buffer)-4], 0, 4);
-     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
-     if (result) {
- 	xmlGenericError(xmlGenericErrorContext, "%s", result);
--- 
-2.17.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
deleted file mode 100644
index facfefd362..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Thu, 12 Dec 2019 17:30:55 +0800
-Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
-
-When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
-return NULL which cause a infinite loop in xmlStringLenDecodeEntities
-
-Found with libFuzzer.
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/0e1a49c89076]
-CVE: CVE-2020-7595
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
----
- parser.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/parser.c b/parser.c
-index d1c31963..a34bb6cd 100644
---- a/parser.c
-+++ b/parser.c
-@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
-     else
-         c = 0;
-     while ((c != 0) && (c != end) && /* non input consuming loop */
--	   (c != end2) && (c != end3)) {
-+           (c != end2) && (c != end3) &&
-+           (ctxt->instate != XML_PARSER_EOF)) {
- 
- 	if (c == 0) break;
-         if ((c == '&') && (str[1] == '#')) {
--- 
-2.24.1
-
diff --git a/meta/recipes-core/libxml/libxml2/fix-python39.patch b/meta/recipes-core/libxml/libxml2/fix-python39.patch
deleted file mode 100644
index 32590f9ddf..0000000000
--- a/meta/recipes-core/libxml/libxml2/fix-python39.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From e4fb36841800038c289997432ca547c9bfef9db1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Fri, 28 Feb 2020 12:48:14 +0100
-Subject: [PATCH] Parenthesize Py<type>_Check() in ifs
-
-In C, if expressions should be parenthesized.
-PyLong_Check, PyUnicode_Check etc. happened to expand to a parenthesized
-expression before, but that's not API to rely on.
-
-Since Python 3.9.0a4 it needs to be parenthesized explicitly.
-
-Fixes https://gitlab.gnome.org/GNOME/libxml2/issues/149
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- python/libxml.c |  4 ++--
- python/types.c  | 12 ++++++------
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/python/libxml.c b/python/libxml.c
-index bc676c4e0..81e709f34 100644
---- a/python/libxml.c
-+++ b/python/libxml.c
-@@ -294,7 +294,7 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
- 	lenread = PyBytes_Size(ret);
- 	data = PyBytes_AsString(ret);
- #ifdef PyUnicode_Check
--    } else if PyUnicode_Check (ret) {
-+    } else if (PyUnicode_Check (ret)) {
- #if PY_VERSION_HEX >= 0x03030000
-         Py_ssize_t size;
- 	const char *tmp;
-@@ -359,7 +359,7 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
- 	lenread = PyBytes_Size(ret);
- 	data = PyBytes_AsString(ret);
- #ifdef PyUnicode_Check
--    } else if PyUnicode_Check (ret) {
-+    } else if (PyUnicode_Check (ret)) {
- #if PY_VERSION_HEX >= 0x03030000
-         Py_ssize_t size;
- 	const char *tmp;
-diff --git a/python/types.c b/python/types.c
-index c2bafeb19..ed284ec74 100644
---- a/python/types.c
-+++ b/python/types.c
-@@ -602,16 +602,16 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
-     if (obj == NULL) {
-         return (NULL);
-     }
--    if PyFloat_Check (obj) {
-+    if (PyFloat_Check (obj)) {
-         ret = xmlXPathNewFloat((double) PyFloat_AS_DOUBLE(obj));
--    } else if PyLong_Check(obj) {
-+    } else if (PyLong_Check(obj)) {
- #ifdef PyLong_AS_LONG
-         ret = xmlXPathNewFloat((double) PyLong_AS_LONG(obj));
- #else
-         ret = xmlXPathNewFloat((double) PyInt_AS_LONG(obj));
- #endif
- #ifdef PyBool_Check
--    } else if PyBool_Check (obj) {
-+    } else if (PyBool_Check (obj)) {
- 
-         if (obj == Py_True) {
-           ret = xmlXPathNewBoolean(1);
-@@ -620,14 +620,14 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
-           ret = xmlXPathNewBoolean(0);
-         }
- #endif
--    } else if PyBytes_Check (obj) {
-+    } else if (PyBytes_Check (obj)) {
-         xmlChar *str;
- 
-         str = xmlStrndup((const xmlChar *) PyBytes_AS_STRING(obj),
-                          PyBytes_GET_SIZE(obj));
-         ret = xmlXPathWrapString(str);
- #ifdef PyUnicode_Check
--    } else if PyUnicode_Check (obj) {
-+    } else if (PyUnicode_Check (obj)) {
- #if PY_VERSION_HEX >= 0x03030000
-         xmlChar *str;
- 	const char *tmp;
-@@ -650,7 +650,7 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
- 	ret = xmlXPathWrapString(str);
- #endif
- #endif
--    } else if PyList_Check (obj) {
-+    } else if (PyList_Check (obj)) {
-         int i;
-         PyObject *node;
-         xmlNodePtr cur;
--- 
-GitLab
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index e6998f6e68..53bf7869ea 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -9,16 +9,21 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Rebase to 2.9.9
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rease to 2.9.12
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- libxml.m4 | 186 ++------------------------------------------------------------
- 1 file changed, 5 insertions(+), 181 deletions(-)
+ libxml.m4 | 189 ++----------------------------------------------------
+ 1 file changed, 5 insertions(+), 184 deletions(-)
 
 diff --git a/libxml.m4 b/libxml.m4
-index 2d7a6f5..1c53585 100644
+index 09de9fe..2163f41 100644
 --- a/libxml.m4
 +++ b/libxml.m4
-@@ -1,188 +1,12 @@
+@@ -1,192 +1,13 @@
 -# Configure paths for LIBXML2
+-# Simon Josefsson 2020-02-12
+-# Fix autoconf 2.70+ warnings
 -# Mike Hommey 2004-06-19
 -# use CPPFLAGS instead of CFLAGS
 -# Toshio Kuratomi 2001-04-21
@@ -78,7 +83,8 @@ index 2d7a6f5..1c53585 100644
 -dnl (Also sanity checks the results of xml2-config to some extent)
 -dnl
 -      rm -f conf.xmltest
--      AC_TRY_RUN([
+-      AC_RUN_IFELSE(
+-            [AC_LANG_SOURCE([[
 -#include <stdlib.h>
 -#include <stdio.h>
 -#include <string.h>
@@ -126,7 +132,7 @@ index 2d7a6f5..1c53585 100644
 -   * only exits if there's a serious mismatch between header and library.
 -   */
 -    LIBXML_TEST_VERSION;
--
+ 
 -    /* Test that the library is greater than our minimum version */
 -    if ((xml_major_version > major) ||
 -        ((xml_major_version == major) && (xml_minor_version > minor)) ||
@@ -148,12 +154,12 @@ index 2d7a6f5..1c53585 100644
 -        printf("*** being found. The easiest way to fix this is to remove the old version\n");
 -        printf("*** of LIBXML, but you can also set the XML2_CONFIG environment to point to the\n");
 -        printf("*** correct copy of xml2-config. (In this case, you will have to\n");
--        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
+-        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
 -        printf("*** so that the correct libraries are found at run-time))\n");
 -    }
 -  return 1;
 -}
--],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
+-]])],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
 -       CPPFLAGS="$ac_save_CPPFLAGS"
 -       LIBS="$ac_save_LIBS"
 -     fi
@@ -178,10 +184,11 @@ index 2d7a6f5..1c53585 100644
 -          echo "*** Could not run libxml test program, checking why..."
 -          CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
 -          LIBS="$LIBS $XML_LIBS"
--          AC_TRY_LINK([
+-	  AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM([[
 -#include <libxml/xmlversion.h>
 -#include <stdio.h>
--],      [ LIBXML_TEST_VERSION; return 0;],
+-]],    [[ LIBXML_TEST_VERSION; return 0;]])],
 -        [ echo "*** The test program compiled, but did not run. This usually means"
 -          echo "*** that the run-time linker is not finding LIBXML or finding the wrong"
 -          echo "*** version of LIBXML. If it is not finding LIBXML, you'll need to set your"
@@ -212,5 +219,5 @@ index 2d7a6f5..1c53585 100644
 -  rm -f conf.xmltest
  ])
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
similarity index 88%
rename from meta/recipes-core/libxml/libxml2_2.9.10.bb
rename to meta/recipes-core/libxml/libxml2_2.9.12.bb
index 858ee0c66a..73aa613de6 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
-                    file://hash.c;beginline=6;endline=15;md5=96f7296605eae807670fb08947829969 \
-                    file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
-                    file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
+                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
+                    file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
+                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
 
 DEPENDS = "zlib virtual/libiconv"
 
@@ -20,14 +20,10 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
-           file://CVE-2020-7595.patch \
-           file://CVE-2019-20388.patch \
-           file://CVE-2020-24977.patch \
-           file://fix-python39.patch \
            "
 
-SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-SRC_URI[libtar.sha256sum] = "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
+SRC_URI[libtar.md5sum] = "f433a39be087a9f0b197eb2307ad9f75"
+SRC_URI[libtar.sha256sum] = "c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.25.1

