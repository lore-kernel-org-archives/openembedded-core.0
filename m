Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D8AED7610C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:54 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so6523130pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=eRnD7c63g+XNwyoPS4h/0EjKlfT0J/Uu1WayYWkJrSM=;
	b=CmiAsWGZVLSlyXXoELWFh71bcsnGK12hI/MxHi+FnstbDr/XxWM2p0kPtry8CNs2nI
	6av7EF/nc40nILYmaevamEQuTwr47T/5DC2IO74lG8MvK2wh0t18j5yMWEaFbMWsfBoV
	r4NUTuyaoc2fj5sFlnsb3iGVV2fHkd3ov5PZ/mX6VeANuAnKLnKP2UpQMTxT7RFKarkG
	PRS7iDei6eBoi1LUBoeRgU+LmAgigj9QRi9r98UzgPpW88F0KBITfZG1ssf/TZCUVUWU
	8QgZ8GLcIqxqEt7Lrq+6ju37ukW2nA7DXtjQlITU+iU6g67tIeo2f0DohFPATBix4Eep
	jQIA==
X-Received: by 10.68.167.131 with SMTP id zo3mr40169563pbb.123.1437232614981; 
	Sat, 18 Jul 2015 08:16:54 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	fy5sm14599700pdb.93.2015.07.18.08.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 95DDEFC1301; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:32 -0700
Message-Id: <14e6cd75ae3c85bff5752915324f6639fb9137f1.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 25/25] libxml2: Security Advisory - libxml2 - CVE-2015-1819
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:55 -0000

From: Yue Tao <Yue.Tao@windriver.com>

for CVE-2015-1819 Enforce the reader to run in constant memory

(From OE-Core rev: 9e67d8ae592a37d7c92d6566466b09c83e9ec6a7)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta/recipes-core/libxml/libxml2.inc
---
 meta/recipes-core/libxml/libxml2.inc               |   1 +
 ...19-Enforce-the-reader-to-run-in-constant-.patch | 181 +++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index c729c19..840a8eb 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -22,6 +22,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
            file://libxml2-CVE-2014-3660.patch \
+           file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
new file mode 100644
index 0000000..96d58f9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
@@ -0,0 +1,181 @@
+From 213f1fe0d76d30eaed6e5853057defc43e6df2c9 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 14 Apr 2015 17:41:48 +0800
+Subject: [PATCH] CVE-2015-1819 Enforce the reader to run in constant memory
+
+One of the operation on the reader could resolve entities
+leading to the classic expansion issue. Make sure the
+buffer used for xmlreader operation is bounded.
+Introduce a new allocation type for the buffers for this effect.
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ buf.c                 |   43 ++++++++++++++++++++++++++++++++++++++++++-
+ include/libxml/tree.h |    3 ++-
+ xmlreader.c           |   20 +++++++++++++++++++-
+ 3 files changed, 63 insertions(+), 3 deletions(-)
+
+diff --git a/buf.c b/buf.c
+index 6efc7b6..07922ff 100644
+--- a/buf.c
++++ b/buf.c
+@@ -27,6 +27,7 @@
+ #include <libxml/tree.h>
+ #include <libxml/globals.h>
+ #include <libxml/tree.h>
++#include <libxml/parserInternals.h> /* for XML_MAX_TEXT_LENGTH */
+ #include "buf.h"
+ 
+ #define WITH_BUFFER_COMPAT
+@@ -299,7 +300,8 @@ xmlBufSetAllocationScheme(xmlBufPtr buf,
+     if ((scheme == XML_BUFFER_ALLOC_DOUBLEIT) ||
+         (scheme == XML_BUFFER_ALLOC_EXACT) ||
+         (scheme == XML_BUFFER_ALLOC_HYBRID) ||
+-        (scheme == XML_BUFFER_ALLOC_IMMUTABLE)) {
++        (scheme == XML_BUFFER_ALLOC_IMMUTABLE) ||
++	(scheme == XML_BUFFER_ALLOC_BOUNDED)) {
+ 	buf->alloc = scheme;
+         if (buf->buffer)
+             buf->buffer->alloc = scheme;
+@@ -458,6 +460,18 @@ xmlBufGrowInternal(xmlBufPtr buf, size_t len) {
+     size = buf->use + len + 100;
+ #endif
+ 
++    if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
++        /*
++	 * Used to provide parsing limits
++	 */
++        if ((buf->use + len >= XML_MAX_TEXT_LENGTH) ||
++	    (buf->size >= XML_MAX_TEXT_LENGTH)) {
++	    xmlBufMemoryError(buf, "buffer error: text too long\n");
++	    return(0);
++	}
++	if (size >= XML_MAX_TEXT_LENGTH)
++	    size = XML_MAX_TEXT_LENGTH;
++    }
+     if ((buf->alloc == XML_BUFFER_ALLOC_IO) && (buf->contentIO != NULL)) {
+         size_t start_buf = buf->content - buf->contentIO;
+ 
+@@ -739,6 +753,15 @@ xmlBufResize(xmlBufPtr buf, size_t size)
+     CHECK_COMPAT(buf)
+ 
+     if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return(0);
++    if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
++        /*
++	 * Used to provide parsing limits
++	 */
++        if (size >= XML_MAX_TEXT_LENGTH) {
++	    xmlBufMemoryError(buf, "buffer error: text too long\n");
++	    return(0);
++	}
++    }
+ 
+     /* Don't resize if we don't have to */
+     if (size < buf->size)
+@@ -867,6 +890,15 @@ xmlBufAdd(xmlBufPtr buf, const xmlChar *str, int len) {
+ 
+     needSize = buf->use + len + 2;
+     if (needSize > buf->size){
++	if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
++	    /*
++	     * Used to provide parsing limits
++	     */
++	    if (needSize >= XML_MAX_TEXT_LENGTH) {
++		xmlBufMemoryError(buf, "buffer error: text too long\n");
++		return(-1);
++	    }
++	}
+         if (!xmlBufResize(buf, needSize)){
+ 	    xmlBufMemoryError(buf, "growing buffer");
+             return XML_ERR_NO_MEMORY;
+@@ -938,6 +970,15 @@ xmlBufAddHead(xmlBufPtr buf, const xmlChar *str, int len) {
+     }
+     needSize = buf->use + len + 2;
+     if (needSize > buf->size){
++	if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
++	    /*
++	     * Used to provide parsing limits
++	     */
++	    if (needSize >= XML_MAX_TEXT_LENGTH) {
++		xmlBufMemoryError(buf, "buffer error: text too long\n");
++		return(-1);
++	    }
++	}
+         if (!xmlBufResize(buf, needSize)){
+ 	    xmlBufMemoryError(buf, "growing buffer");
+             return XML_ERR_NO_MEMORY;
+diff --git a/include/libxml/tree.h b/include/libxml/tree.h
+index 2f90717..4a9b3bc 100644
+--- a/include/libxml/tree.h
++++ b/include/libxml/tree.h
+@@ -76,7 +76,8 @@ typedef enum {
+     XML_BUFFER_ALLOC_EXACT,	/* grow only to the minimal size */
+     XML_BUFFER_ALLOC_IMMUTABLE, /* immutable buffer */
+     XML_BUFFER_ALLOC_IO,	/* special allocation scheme used for I/O */
+-    XML_BUFFER_ALLOC_HYBRID	/* exact up to a threshold, and doubleit thereafter */
++    XML_BUFFER_ALLOC_HYBRID,	/* exact up to a threshold, and doubleit thereafter */
++    XML_BUFFER_ALLOC_BOUNDED	/* limit the upper size of the buffer */
+ } xmlBufferAllocationScheme;
+ 
+ /**
+diff --git a/xmlreader.c b/xmlreader.c
+index f19e123..471e7e2 100644
+--- a/xmlreader.c
++++ b/xmlreader.c
+@@ -2091,6 +2091,9 @@ xmlNewTextReader(xmlParserInputBufferPtr input, const char *URI) {
+ 		"xmlNewTextReader : malloc failed\n");
+ 	return(NULL);
+     }
++    /* no operation on a reader should require a huge buffer */
++    xmlBufSetAllocationScheme(ret->buffer,
++			      XML_BUFFER_ALLOC_BOUNDED);
+     ret->sax = (xmlSAXHandler *) xmlMalloc(sizeof(xmlSAXHandler));
+     if (ret->sax == NULL) {
+ 	xmlBufFree(ret->buffer);
+@@ -3616,6 +3619,7 @@ xmlTextReaderConstValue(xmlTextReaderPtr reader) {
+ 	    return(((xmlNsPtr) node)->href);
+         case XML_ATTRIBUTE_NODE:{
+ 	    xmlAttrPtr attr = (xmlAttrPtr) node;
++	    const xmlChar *ret;
+ 
+ 	    if ((attr->children != NULL) &&
+ 	        (attr->children->type == XML_TEXT_NODE) &&
+@@ -3629,10 +3633,21 @@ xmlTextReaderConstValue(xmlTextReaderPtr reader) {
+                                         "xmlTextReaderSetup : malloc failed\n");
+                         return (NULL);
+                     }
++		    xmlBufSetAllocationScheme(reader->buffer,
++		                              XML_BUFFER_ALLOC_BOUNDED);
+                 } else
+                     xmlBufEmpty(reader->buffer);
+ 	        xmlBufGetNodeContent(reader->buffer, node);
+-		return(xmlBufContent(reader->buffer));
++		ret = xmlBufContent(reader->buffer);
++		if (ret == NULL) {
++		    /* error on the buffer best to reallocate */
++		    xmlBufFree(reader->buffer);
++		    reader->buffer = xmlBufCreateSize(100);
++		    xmlBufSetAllocationScheme(reader->buffer,
++		                              XML_BUFFER_ALLOC_BOUNDED);
++		    ret = BAD_CAST "";
++		}
++		return(ret);
+ 	    }
+ 	    break;
+ 	}
+@@ -5131,6 +5146,9 @@ xmlTextReaderSetup(xmlTextReaderPtr reader,
+                         "xmlTextReaderSetup : malloc failed\n");
+         return (-1);
+     }
++    /* no operation on a reader should require a huge buffer */
++    xmlBufSetAllocationScheme(reader->buffer,
++			      XML_BUFFER_ALLOC_BOUNDED);
+     if (reader->sax == NULL)
+ 	reader->sax = (xmlSAXHandler *) xmlMalloc(sizeof(xmlSAXHandler));
+     if (reader->sax == NULL) {
+-- 
+1.7.9.5
+
-- 
1.9.1


