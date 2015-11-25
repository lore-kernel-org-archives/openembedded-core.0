Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22C426057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:54:35 +0000 (UTC)
Received: by wmec201 with SMTP id c201so757677wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cNwmWo/HYkKxAFDjuetgy3bSGCiV5WFAaUQSQKt9syM=;
	b=kFKWBtDRXmfljmHYQkIXZL/qPJQJ5m/WS4VBCTK5eVDZeBfn3sWNFd5OyXNEqQtd5j
	shmkinNl6Pg7LUyOFFre5QusvCh860qah8p29Ul4zB631Iwynd3X3t5Q9ZEhPchJlQ1S
	a0Vad4Oud3ocBPMM7P6NcAQrdfr9CY1P9rTSvKpMKQxKyCaFaVYuxqWGhEGyngEY/+S/
	6dUn3H5k2IF+p/gERR/yaFHIxC8SZRthqGOCRf91i9lLvuTW4Xqk3bFnGNWHq9xWWzq9
	GMXIE5YDXbLgr8uoz1M0WNVVFHoZlOaZ/bvmSLJlu64104N6LfiYAR3z2Uw2ry0K3EEe
	27zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cNwmWo/HYkKxAFDjuetgy3bSGCiV5WFAaUQSQKt9syM=;
	b=KTdxoyoDPoq86Fb+SrEuXjI2KsHyGSL3lh80uQJfbJHhUhugOpZLEpYwy8a4PDgcU5
	23/whiOUwDa05GZrd7FLSNR+R/LdB+QFmNpJs4+WfEHe2Znf1X826VOclsyHUADDfT9e
	VK2UOBRy/jrYYnnU0ugu8RnbC2H/1Ed8zvxsWdNK1y/S2srXTDUtRC4Y8TfK2hq/qk1q
	c5efZDYZTR4uzTEVOE1YXZ+ojm0g3/Nkt5k1O1JXJb82iF8cA3FO1IVNcO+uze1gRe5O
	VTq+MyderZbLgcg/6R8xajWzeuP/I2FaBE6nM1yHtVir5Y4ZDgcnEK4GRHtwkiXEhkFU
	uejw==
X-Gm-Message-State: ALoCoQkDY4gOxJDdK8MLovSVSch6AXKIXdMIlgUSr4ifJH1UMOW8CiwJEXojLD5QVed5TyTP9A5Q
X-Received: by 10.194.179.162 with SMTP id dh2mr46005052wjc.17.1448492076090; 
	Wed, 25 Nov 2015 14:54:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ot9sm25206692wjc.12.2015.11.25.14.54.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 14:54:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 22:45:51 +0000
Message-Id: <1448491551-18658-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libxml2: upgrade to 2.9.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Nov 2015 22:54:41 -0000

- Drop all the upstreamed patches
- Rework the ansidecl removal so it's contained in a single patch

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...19-Enforce-the-reader-to-run-in-constant-.patch | 181 ---------------------
 ...ine-pthread-definitions-for-glibc-complia.patch |  32 ----
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch |  30 ----
 .../libxml/libxml2/CVE-2015-7942.patch             |  55 -------
 .../libxml/libxml2/CVE-2015-8035.patch             |  41 -----
 meta/recipes-core/libxml/libxml2/ansidecl.patch    |  22 +--
 .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |  37 -----
 .../libxml/{libxml2_2.9.2.bb => libxml2_2.9.3.bb}  |  27 +--
 8 files changed, 19 insertions(+), 406 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.2.bb => libxml2_2.9.3.bb} (78%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
deleted file mode 100644
index 96d58f9..0000000
--- a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 213f1fe0d76d30eaed6e5853057defc43e6df2c9 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Tue, 14 Apr 2015 17:41:48 +0800
-Subject: [PATCH] CVE-2015-1819 Enforce the reader to run in constant memory
-
-One of the operation on the reader could resolve entities
-leading to the classic expansion issue. Make sure the
-buffer used for xmlreader operation is bounded.
-Introduce a new allocation type for the buffers for this effect.
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- buf.c                 |   43 ++++++++++++++++++++++++++++++++++++++++++-
- include/libxml/tree.h |    3 ++-
- xmlreader.c           |   20 +++++++++++++++++++-
- 3 files changed, 63 insertions(+), 3 deletions(-)
-
-diff --git a/buf.c b/buf.c
-index 6efc7b6..07922ff 100644
---- a/buf.c
-+++ b/buf.c
-@@ -27,6 +27,7 @@
- #include <libxml/tree.h>
- #include <libxml/globals.h>
- #include <libxml/tree.h>
-+#include <libxml/parserInternals.h> /* for XML_MAX_TEXT_LENGTH */
- #include "buf.h"
- 
- #define WITH_BUFFER_COMPAT
-@@ -299,7 +300,8 @@ xmlBufSetAllocationScheme(xmlBufPtr buf,
-     if ((scheme == XML_BUFFER_ALLOC_DOUBLEIT) ||
-         (scheme == XML_BUFFER_ALLOC_EXACT) ||
-         (scheme == XML_BUFFER_ALLOC_HYBRID) ||
--        (scheme == XML_BUFFER_ALLOC_IMMUTABLE)) {
-+        (scheme == XML_BUFFER_ALLOC_IMMUTABLE) ||
-+	(scheme == XML_BUFFER_ALLOC_BOUNDED)) {
- 	buf->alloc = scheme;
-         if (buf->buffer)
-             buf->buffer->alloc = scheme;
-@@ -458,6 +460,18 @@ xmlBufGrowInternal(xmlBufPtr buf, size_t len) {
-     size = buf->use + len + 100;
- #endif
- 
-+    if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
-+        /*
-+	 * Used to provide parsing limits
-+	 */
-+        if ((buf->use + len >= XML_MAX_TEXT_LENGTH) ||
-+	    (buf->size >= XML_MAX_TEXT_LENGTH)) {
-+	    xmlBufMemoryError(buf, "buffer error: text too long\n");
-+	    return(0);
-+	}
-+	if (size >= XML_MAX_TEXT_LENGTH)
-+	    size = XML_MAX_TEXT_LENGTH;
-+    }
-     if ((buf->alloc == XML_BUFFER_ALLOC_IO) && (buf->contentIO != NULL)) {
-         size_t start_buf = buf->content - buf->contentIO;
- 
-@@ -739,6 +753,15 @@ xmlBufResize(xmlBufPtr buf, size_t size)
-     CHECK_COMPAT(buf)
- 
-     if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return(0);
-+    if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
-+        /*
-+	 * Used to provide parsing limits
-+	 */
-+        if (size >= XML_MAX_TEXT_LENGTH) {
-+	    xmlBufMemoryError(buf, "buffer error: text too long\n");
-+	    return(0);
-+	}
-+    }
- 
-     /* Don't resize if we don't have to */
-     if (size < buf->size)
-@@ -867,6 +890,15 @@ xmlBufAdd(xmlBufPtr buf, const xmlChar *str, int len) {
- 
-     needSize = buf->use + len + 2;
-     if (needSize > buf->size){
-+	if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
-+	    /*
-+	     * Used to provide parsing limits
-+	     */
-+	    if (needSize >= XML_MAX_TEXT_LENGTH) {
-+		xmlBufMemoryError(buf, "buffer error: text too long\n");
-+		return(-1);
-+	    }
-+	}
-         if (!xmlBufResize(buf, needSize)){
- 	    xmlBufMemoryError(buf, "growing buffer");
-             return XML_ERR_NO_MEMORY;
-@@ -938,6 +970,15 @@ xmlBufAddHead(xmlBufPtr buf, const xmlChar *str, int len) {
-     }
-     needSize = buf->use + len + 2;
-     if (needSize > buf->size){
-+	if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
-+	    /*
-+	     * Used to provide parsing limits
-+	     */
-+	    if (needSize >= XML_MAX_TEXT_LENGTH) {
-+		xmlBufMemoryError(buf, "buffer error: text too long\n");
-+		return(-1);
-+	    }
-+	}
-         if (!xmlBufResize(buf, needSize)){
- 	    xmlBufMemoryError(buf, "growing buffer");
-             return XML_ERR_NO_MEMORY;
-diff --git a/include/libxml/tree.h b/include/libxml/tree.h
-index 2f90717..4a9b3bc 100644
---- a/include/libxml/tree.h
-+++ b/include/libxml/tree.h
-@@ -76,7 +76,8 @@ typedef enum {
-     XML_BUFFER_ALLOC_EXACT,	/* grow only to the minimal size */
-     XML_BUFFER_ALLOC_IMMUTABLE, /* immutable buffer */
-     XML_BUFFER_ALLOC_IO,	/* special allocation scheme used for I/O */
--    XML_BUFFER_ALLOC_HYBRID	/* exact up to a threshold, and doubleit thereafter */
-+    XML_BUFFER_ALLOC_HYBRID,	/* exact up to a threshold, and doubleit thereafter */
-+    XML_BUFFER_ALLOC_BOUNDED	/* limit the upper size of the buffer */
- } xmlBufferAllocationScheme;
- 
- /**
-diff --git a/xmlreader.c b/xmlreader.c
-index f19e123..471e7e2 100644
---- a/xmlreader.c
-+++ b/xmlreader.c
-@@ -2091,6 +2091,9 @@ xmlNewTextReader(xmlParserInputBufferPtr input, const char *URI) {
- 		"xmlNewTextReader : malloc failed\n");
- 	return(NULL);
-     }
-+    /* no operation on a reader should require a huge buffer */
-+    xmlBufSetAllocationScheme(ret->buffer,
-+			      XML_BUFFER_ALLOC_BOUNDED);
-     ret->sax = (xmlSAXHandler *) xmlMalloc(sizeof(xmlSAXHandler));
-     if (ret->sax == NULL) {
- 	xmlBufFree(ret->buffer);
-@@ -3616,6 +3619,7 @@ xmlTextReaderConstValue(xmlTextReaderPtr reader) {
- 	    return(((xmlNsPtr) node)->href);
-         case XML_ATTRIBUTE_NODE:{
- 	    xmlAttrPtr attr = (xmlAttrPtr) node;
-+	    const xmlChar *ret;
- 
- 	    if ((attr->children != NULL) &&
- 	        (attr->children->type == XML_TEXT_NODE) &&
-@@ -3629,10 +3633,21 @@ xmlTextReaderConstValue(xmlTextReaderPtr reader) {
-                                         "xmlTextReaderSetup : malloc failed\n");
-                         return (NULL);
-                     }
-+		    xmlBufSetAllocationScheme(reader->buffer,
-+		                              XML_BUFFER_ALLOC_BOUNDED);
-                 } else
-                     xmlBufEmpty(reader->buffer);
- 	        xmlBufGetNodeContent(reader->buffer, node);
--		return(xmlBufContent(reader->buffer));
-+		ret = xmlBufContent(reader->buffer);
-+		if (ret == NULL) {
-+		    /* error on the buffer best to reallocate */
-+		    xmlBufFree(reader->buffer);
-+		    reader->buffer = xmlBufCreateSize(100);
-+		    xmlBufSetAllocationScheme(reader->buffer,
-+		                              XML_BUFFER_ALLOC_BOUNDED);
-+		    ret = BAD_CAST "";
-+		}
-+		return(ret);
- 	    }
- 	    break;
- 	}
-@@ -5131,6 +5146,9 @@ xmlTextReaderSetup(xmlTextReaderPtr reader,
-                         "xmlTextReaderSetup : malloc failed\n");
-         return (-1);
-     }
-+    /* no operation on a reader should require a huge buffer */
-+    xmlBufSetAllocationScheme(reader->buffer,
-+			      XML_BUFFER_ALLOC_BOUNDED);
-     if (reader->sax == NULL)
- 	reader->sax = (xmlSAXHandler *) xmlMalloc(sizeof(xmlSAXHandler));
-     if (reader->sax == NULL) {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch b/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
deleted file mode 100644
index c653a81..0000000
--- a/meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6750cc564a17c812555cca587660240ccffaaed3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 4 Apr 2015 08:50:40 -0700
-Subject: [PATCH] threads: Define pthread* definitions for glibc compliant libs
-
-This code is assuming glibc but not explicitly saying it
-so lets make it so. Fixes following on musl
-
-threads.c:80:27: error: macro "pthread_equal" requires 2 arguments, but
-only 1 given
-|  extern int pthread_equal ()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- threads.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libxml2-2.9.2/threads.c
-===================================================================
---- libxml2-2.9.2.orig/threads.c
-+++ libxml2-2.9.2/threads.c
-@@ -47,7 +47,7 @@
- #ifdef HAVE_PTHREAD_H
- 
- static int libxml_is_threaded = -1;
--#ifdef __GNUC__
-+#if defined(__GNUC__) && defined(__GLIBC__)
- #ifdef linux
- #if (__GNUC__ == 3 && __GNUC_MINOR__ >= 3) || (__GNUC__ > 3)
- extern int pthread_once (pthread_once_t *__once_control,
diff --git a/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch b/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
deleted file mode 100644
index 10a8112..0000000
--- a/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 72a46a519ce7326d9a00f0b6a7f2a8e958cd1675 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Thu, 23 Oct 2014 11:35:36 +0800
-Subject: Fix missing entities after CVE-2014-3660 fix
-
-For https://bugzilla.gnome.org/show_bug.cgi?id=738805
-
-The fix for CVE-2014-3660 introduced a regression in some case
-where entity substitution is required and the entity is used
-first in anotther entity referenced from an attribute value
-
-Upstream-Status: Backport
-
-diff --git a/parser.c b/parser.c
-index 67c9dfd..a8d1b67 100644
---- a/parser.c
-+++ b/parser.c
-@@ -7235,7 +7235,8 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
-      * far more secure as the parser will only process data coming from
-      * the document entity by default.
-      */
--    if ((ent->checked == 0) &&
-+    if (((ent->checked == 0) ||
-+         ((ent->children == NULL) && (ctxt->options & XML_PARSE_NOENT))) &&
-         ((ent->etype != XML_EXTERNAL_GENERAL_PARSED_ENTITY) ||
-          (ctxt->options & (XML_PARSE_NOENT | XML_PARSE_DTDVALID)))) {
- 	unsigned long oldnbent = ctxt->nbentities;
--- 
-cgit v0.10.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
deleted file mode 100644
index a5930ed..0000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-libxml2: CVE-2015-7942
-
-From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Mon, 23 Feb 2015 11:29:20 +0800
-Subject: Cleanup conditional section error handling
-
-For https://bugzilla.gnome.org/show_bug.cgi?id=744980
-
-The error handling of Conditional Section also need to be
-straightened as the structure of the document can't be
-guessed on a failure there and it's better to stop parsing
-as further errors are likely to be irrelevant.
-
-Upstream-Status: Backport
-https://git.gnome.org/browse/libxml2/patch/?id=9b8512337d14c8ddf662fcb98b0135f225a1c489
-
-[YOCTO #8641]
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- parser.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-Index: libxml2-2.9.2/parser.c
-===================================================================
---- libxml2-2.9.2.orig/parser.c
-+++ libxml2-2.9.2/parser.c
-@@ -6783,6 +6783,8 @@ xmlParseConditionalSections(xmlParserCtx
- 	SKIP_BLANKS;
- 	if (RAW != '[') {
- 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
-+	    xmlStopParser(ctxt);
-+	    return;
- 	} else {
- 	    if (ctxt->input->id != id) {
- 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
-@@ -6843,6 +6845,8 @@ xmlParseConditionalSections(xmlParserCtx
- 	SKIP_BLANKS;
- 	if (RAW != '[') {
- 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
-+	    xmlStopParser(ctxt);
-+	    return;
- 	} else {
- 	    if (ctxt->input->id != id) {
- 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
-@@ -6898,6 +6902,8 @@ xmlParseConditionalSections(xmlParserCtx
- 
-     } else {
- 	xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
-+	xmlStopParser(ctxt);
-+	return;
-     }
- 
-     if (RAW == 0)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
deleted file mode 100644
index d175f74..0000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-libxml2: CVE-2015-8035
-
-From f0709e3ca8f8947f2d91ed34e92e38a4c23eae63 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Tue, 3 Nov 2015 15:31:25 +0800
-Subject: CVE-2015-8035 Fix XZ compression support loop
-
-For https://bugzilla.gnome.org/show_bug.cgi?id=757466
-DoS when parsing specially crafted XML document if XZ support
-is compiled in (which wasn't the case for 2.9.2 and master since
-Nov 2013, fixed in next commit !)
-
-Upstream-Status: Backport
-https://git.gnome.org/browse/libxml2/patch/?id=f0709e3ca8f8947f2d91ed34e92e38a4c23eae63
-
-[YOCTO #8641]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- xzlib.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/xzlib.c b/xzlib.c
-index 0dcb9f4..1fab546 100644
---- a/xzlib.c
-+++ b/xzlib.c
-@@ -581,6 +581,10 @@ xz_decomp(xz_statep state)
-             xz_error(state, LZMA_DATA_ERROR, "compressed data error");
-             return -1;
-         }
-+        if (ret == LZMA_PROG_ERROR) {
-+            xz_error(state, LZMA_PROG_ERROR, "compression error");
-+            return -1;
-+        }
-     } while (strm->avail_out && ret != LZMA_STREAM_END);
- 
-     /* update available output and crc check value */
--- 
-cgit v0.11.2
-
diff --git a/meta/recipes-core/libxml/libxml2/ansidecl.patch b/meta/recipes-core/libxml/libxml2/ansidecl.patch
index 2452d78..1085c68 100644
--- a/meta/recipes-core/libxml/libxml2/ansidecl.patch
+++ b/meta/recipes-core/libxml/libxml2/ansidecl.patch
@@ -9,17 +9,17 @@ RP 2012/7/10
 
 Upstream-Status: Inappropriate [its really a cmake bug]
 
-Index: libxml2-2.8.0/include/libxml/xmlversion.h.in
-===================================================================
---- libxml2-2.8.0.orig/include/libxml/xmlversion.h.in	2012-07-10 11:51:52.460750573 +0000
-+++ libxml2-2.8.0/include/libxml/xmlversion.h.in	2012-07-10 11:52:41.436749397 +0000
-@@ -401,9 +401,6 @@
- #endif
- 
- #ifdef __GNUC__
+diff --git a/configure.ac b/configure.ac
+index 0260281..fdb58e9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -484 +483,0 @@ AC_CHECK_HEADERS([time.h])
+-AC_CHECK_HEADERS([ansidecl.h])
+diff --git a/include/libxml/xmlversion.h.in b/include/libxml/xmlversion.h.in
+index b173be9..d10f975 100644
+--- a/include/libxml/xmlversion.h.in
++++ b/include/libxml/xmlversion.h.in
+@@ -413,3 +412,0 @@ XMLPUBFUN void XMLCALL xmlCheckVersion(int version);
 -#ifdef HAVE_ANSIDECL_H
 -#include <ansidecl.h>
 -#endif
- 
- /**
-  * ATTRIBUTE_UNUSED:
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
deleted file mode 100644
index 1c05ae6..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From: Daniel Veillard <veillard@redhat.com>
-Date: Tue, 22 Apr 2014 15:30:56 +0800
-Subject: Do not fetch external parameter entities
-
-Unless explicitely asked for when validating or replacing entities
-with their value. Problem pointed out by Daniel Berrange <berrange@redhat.com>
-
-Upstream-Status: Backport
-Reference: https://access.redhat.com/security/cve/CVE-2014-0191
-
-Signed-off-by: Daniel Veillard <veillard@redhat.com>
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
-diff -Naur libxml2-2.9.1-orig/parser.c libxml2-2.9.1/parser.c
---- libxml2-2.9.1-orig/parser.c	2013-04-16 15:39:18.000000000 +0200
-+++ libxml2-2.9.1/parser.c	2014-05-07 13:35:46.883687946 +0200
-@@ -2595,6 +2595,20 @@
- 		    xmlCharEncoding enc;
- 
- 		    /*
-+		     * Note: external parsed entities will not be loaded, it is
-+		     * not required for a non-validating parser, unless the
-+		     * option of validating, or substituting entities were
-+		     * given. Doing so is far more secure as the parser will
-+		     * only process data coming from the document entity by
-+		     * default.
-+		     */
-+                    if ((entity->etype == XML_EXTERNAL_PARAMETER_ENTITY) &&
-+		        ((ctxt->options & XML_PARSE_NOENT) == 0) &&
-+			((ctxt->options & XML_PARSE_DTDVALID) == 0) &&
-+			(ctxt->validate == 0))
-+			return;
-+
-+		    /*
- 		     * handle the extra spaces added before and after
- 		     * c.f. http://www.w3.org/TR/REC-xml#as-PE
- 		     * this is done independently.
diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb b/meta/recipes-core/libxml/libxml2_2.9.3.bb
similarity index 78%
rename from meta/recipes-core/libxml/libxml2_2.9.2.bb
rename to meta/recipes-core/libxml/libxml2_2.9.3.bb
index ebb9fa7..20bf1e0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.3.bb
@@ -9,27 +9,21 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
-DEPENDS =+ "zlib"
+DEPENDS = "zlib"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
+           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
            file://libxml-64bit.patch \
            file://ansidecl.patch \
            file://runtest.patch \
            file://run-ptest \
-           file://libxml2-CVE-2014-0191-fix.patch \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
            file://configure.ac-fix-cross-compiling-warning.patch \
-           file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
-           file://CVE-2015-7942.patch \
-           file://CVE-2015-8035.patch \
-           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
-           file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch \
-           file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
           "
 
-SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
-SRC_URI[libtar.sha256sum] = "5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc"
+SRC_URI[libtar.md5sum] = "daece17e045f1c107610e137ab50c179"
+SRC_URI[libtar.sha256sum] = "4de9e31f46b44d34871c22f54bfc54398ef124d6f7cafb1f4a5958fbcd3ba12d"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
@@ -41,25 +35,20 @@ RDEPENDS_${PN}-ptest += "python-core"
 
 RDEPENDS_${PN}-python += "python-core"
 
-RDEPENDS_${PN}-ptest_append_libc-glibc += "glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
-
-# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
-do_configure_prepend () {
-	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac
-}
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
 
 export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 
 PACKAGECONFIG ??= "python"
-
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python"
+
 # WARNING: zlib is require for RPM use
 EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
-# required for pythong binding
+# required for python binding
 export HOST_SYS
 export BUILD_SYS
 export STAGING_LIBDIR
@@ -80,7 +69,7 @@ FILES_${PN}-utils += "${bindir}/*"
 FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_ptest () {
-  cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
+	cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


