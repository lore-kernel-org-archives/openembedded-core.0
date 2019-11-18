Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B25087F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w9so19427678wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=juZ9FfBlMoAXudpw8eWYupJKezZesrvyXu4GgHS1tFU=;
	b=vhpeTZcCgU2jXiBbjQoVgUrYzAC9zVevHDIsK+lpW42gh7frokOZEdpw9+N00T3s8L
	4D42DXG3BlrI+zT0DmNrIqjm8kwl4miFKf5crlVE89niei+jyNwZhv127hUzwVHQI3e4
	hobfY0jGAn53P1/rmUcbUUKnd6G2vISljdDvX/CJBS8PdbzPB1e8xwT7z/bRk9AbTdjm
	tewDCtNPnBVtmzWIIcTokIKPQgJvEpRG2BB66dwUes8qFiqQeDI3R2QtjJAnyIdQLE7g
	qqMDErgfA44YpmvlrsiIu+Y2/ZGOCcI3pVfhu+GYhn9Qo1uRiCCvxe9qehvwr7O8HIKl
	votw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=juZ9FfBlMoAXudpw8eWYupJKezZesrvyXu4GgHS1tFU=;
	b=EHTjQVuBTeMs/8oIXXiNQJHWotfwmk4m24ujkCuGCBTqlNDX3PznBK7J8RoE9LT0Lp
	ubCbBhlnUXqEhhpTTMHoE6ktTBaY3uyAHD+MDW9Mzy0mn11peTC0EjHb650WclIQOVbp
	eXzuEl5Vm5rsVfAn3Rt7XZOGi0kAiAwU7QaG667Oi0TDQR+1Ylb0cSrCp++y2sYowdVZ
	ss+UtkGwm4nSdp8aLIRuVI/BwA6QN240XJvy7RGw1Rw7vH9KB5c8SmVhXabwi4vF5XXM
	Jnki7urrXf9B0ItaEUJcGflW6FEuytOQNl3qho0yLa7yhEEu2f/rahNUMT5G1ko17a50
	Ryjg==
X-Gm-Message-State: APjAAAWYansfyrROTh+/zk3ovNM+vzeuVmZ14F0JMcnpdurYdKPhkcNl
	jFf11GAnBaxim5HMWhZSpX72ni7L
X-Google-Smtp-Source: APXvYqw5/IP0+pjydYfiUoI4uhmTzkqvNQuL6Zq9Yhb7hL0Q7GAxOr1XK24wANIY5krIUz/2DWBPNA==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr28867216wrw.383.1574082512100; 
	Mon, 18 Nov 2019 05:08:32 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:56 +0100
Message-Id: <20191118130801.21860-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] libxslt: update to 1.1.34
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-security-framework-bypass.patch  | 124 ------------------
 .../libxslt/files/CVE-2019-13117.patch        |  33 -----
 .../libxslt/files/CVE-2019-13118.patch        |  76 -----------
 .../libxslt/files/CVE-2019-18197.patch        |  33 -----
 .../{libxslt_1.1.33.bb => libxslt_1.1.34.bb}  |  12 +-
 5 files changed, 4 insertions(+), 274 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
 delete mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 delete mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch
 delete mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.33.bb => libxslt_1.1.34.bb} (81%)

diff --git a/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
deleted file mode 100644
index 89b647ddbf1..00000000000
--- a/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Sun, 24 Mar 2019 09:51:39 +0100
-Subject: Fix security framework bypass
-
-xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
-don't check for this condition and allow access. With a specially
-crafted URL, xsltCheckRead could be tricked into returning an error
-because of a supposedly invalid URL that would still be loaded
-succesfully later on.
-
-Fixes #12.
-
-Thanks to Felix Wilhelm for the report.
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Backport
-CVE: CVE-2019-11068
----
- libxslt/documents.c | 18 ++++++++++--------
- libxslt/imports.c   |  9 +++++----
- libxslt/transform.c |  9 +++++----
- libxslt/xslt.c      |  9 +++++----
- 4 files changed, 25 insertions(+), 20 deletions(-)
-
-diff --git a/libxslt/documents.c b/libxslt/documents.c
-index 3f3a7312..4aad11bb 100644
---- a/libxslt/documents.c
-+++ b/libxslt/documents.c
-@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
- 	int res;
- 
- 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
--	if (res == 0) {
--	    xsltTransformError(ctxt, NULL, NULL,
--		 "xsltLoadDocument: read rights for %s denied\n",
--			     URI);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(ctxt, NULL, NULL,
-+                     "xsltLoadDocument: read rights for %s denied\n",
-+                                 URI);
- 	    return(NULL);
- 	}
-     }
-@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
- 	int res;
- 
- 	res = xsltCheckRead(sec, NULL, URI);
--	if (res == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsltLoadStyleDocument: read rights for %s denied\n",
--			     URI);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsltLoadStyleDocument: read rights for %s denied\n",
-+                                 URI);
- 	    return(NULL);
- 	}
-     }
-diff --git a/libxslt/imports.c b/libxslt/imports.c
-index 874870cc..3783b247 100644
---- a/libxslt/imports.c
-+++ b/libxslt/imports.c
-@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
- 	int secres;
- 
- 	secres = xsltCheckRead(sec, NULL, URI);
--	if (secres == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsl:import: read rights for %s denied\n",
--			     URI);
-+	if (secres <= 0) {
-+            if (secres == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsl:import: read rights for %s denied\n",
-+                                 URI);
- 	    goto error;
- 	}
-     }
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 13793914..0636dbd0 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
-      */
-     if (ctxt->sec != NULL) {
- 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
--	if (ret == 0) {
--	    xsltTransformError(ctxt, NULL, inst,
--		 "xsltDocumentElem: write rights for %s denied\n",
--			     filename);
-+	if (ret <= 0) {
-+            if (ret == 0)
-+                xsltTransformError(ctxt, NULL, inst,
-+                     "xsltDocumentElem: write rights for %s denied\n",
-+                                 filename);
- 	    xmlFree(URL);
- 	    xmlFree(filename);
- 	    return;
-diff --git a/libxslt/xslt.c b/libxslt/xslt.c
-index 780a5ad7..a234eb79 100644
---- a/libxslt/xslt.c
-+++ b/libxslt/xslt.c
-@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
- 	int res;
- 
- 	res = xsltCheckRead(sec, NULL, filename);
--	if (res == 0) {
--	    xsltTransformError(NULL, NULL, NULL,
--		 "xsltParseStylesheetFile: read rights for %s denied\n",
--			     filename);
-+	if (res <= 0) {
-+            if (res == 0)
-+                xsltTransformError(NULL, NULL, NULL,
-+                     "xsltParseStylesheetFile: read rights for %s denied\n",
-+                                 filename);
- 	    return(NULL);
- 	}
-     }
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13117.patch b/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
deleted file mode 100644
index ef3f2709f73..00000000000
--- a/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c5eb6cf3aba0af048596106ed839b4ae17ecbcb1 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Sat, 27 Apr 2019 11:19:48 +0200
-Subject: [PATCH] Fix uninitialized read of xsl:number token
-
-Found by OSS-Fuzz.
-
-CVE: CVE-2019-13117
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/c5eb6cf3aba0af048596106ed839b4ae17ecbcb1]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- libxslt/numbers.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libxslt/numbers.c b/libxslt/numbers.c
-index 89e1f668..75c31eba 100644
---- a/libxslt/numbers.c
-+++ b/libxslt/numbers.c
-@@ -382,7 +382,10 @@ xsltNumberFormatTokenize(const xmlChar *format,
- 		tokens->tokens[tokens->nTokens].token = val - 1;
- 		ix += len;
- 		val = xmlStringCurrentChar(NULL, format+ix, &len);
--	    }
-+	    } else {
-+                tokens->tokens[tokens->nTokens].token = (xmlChar)'0';
-+                tokens->tokens[tokens->nTokens].width = 1;
-+            }
- 	} else if ( (val == (xmlChar)'A') ||
- 		    (val == (xmlChar)'a') ||
- 		    (val == (xmlChar)'I') ||
--- 
-2.21.0
-
diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13118.patch b/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
deleted file mode 100644
index 595e6c2f336..00000000000
--- a/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 6ce8de69330783977dd14f6569419489875fb71b Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Mon, 3 Jun 2019 13:14:45 +0200
-Subject: [PATCH] Fix uninitialized read with UTF-8 grouping chars
-
-The character type in xsltFormatNumberConversion was too narrow and
-an invalid character/length combination could be passed to
-xsltNumberFormatDecimal, resulting in an uninitialized read.
-
-Found by OSS-Fuzz.
-
-CVE: CVE-2019-13118
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/6ce8de69330783977dd14f6569419489875fb71b]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- libxslt/numbers.c         | 5 +++--
- tests/docs/bug-222.xml    | 1 +
- tests/general/bug-222.out | 2 ++
- tests/general/bug-222.xsl | 6 ++++++
- 4 files changed, 12 insertions(+), 2 deletions(-)
- create mode 100644 tests/docs/bug-222.xml
- create mode 100644 tests/general/bug-222.out
- create mode 100644 tests/general/bug-222.xsl
-
-diff --git a/libxslt/numbers.c b/libxslt/numbers.c
-index f1ed8846..20b99d5a 100644
---- a/libxslt/numbers.c
-+++ b/libxslt/numbers.c
-@@ -1298,13 +1298,14 @@ OUTPUT_NUMBER:
-     number = floor((scale * number + 0.5)) / scale;
-     if ((self->grouping != NULL) &&
-         (self->grouping[0] != 0)) {
-+        int gchar;
- 
- 	len = xmlStrlen(self->grouping);
--	pchar = xsltGetUTF8Char(self->grouping, &len);
-+	gchar = xsltGetUTF8Char(self->grouping, &len);
- 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
- 				format_info.integer_digits,
- 				format_info.group,
--				pchar, len);
-+				gchar, len);
-     } else
- 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
- 				format_info.integer_digits,
-diff --git a/tests/docs/bug-222.xml b/tests/docs/bug-222.xml
-new file mode 100644
-index 00000000..69d62f2c
---- /dev/null
-+++ b/tests/docs/bug-222.xml
-@@ -0,0 +1 @@
-+<doc/>
-diff --git a/tests/general/bug-222.out b/tests/general/bug-222.out
-new file mode 100644
-index 00000000..e3139698
---- /dev/null
-+++ b/tests/general/bug-222.out
-@@ -0,0 +1,2 @@
-+<?xml version="1.0"?>
-+1⠢0
-diff --git a/tests/general/bug-222.xsl b/tests/general/bug-222.xsl
-new file mode 100644
-index 00000000..e32dc473
---- /dev/null
-+++ b/tests/general/bug-222.xsl
-@@ -0,0 +1,6 @@
-+<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
-+  <xsl:decimal-format name="f" grouping-separator="⠢"/>
-+  <xsl:template match="/">
-+    <xsl:value-of select="format-number(10,'#⠢0','f')"/>
-+  </xsl:template>
-+</xsl:stylesheet>
--- 
-2.21.0
-
diff --git a/meta/recipes-support/libxslt/files/CVE-2019-18197.patch b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
deleted file mode 100644
index 5f2b620396f..00000000000
--- a/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-libxslt: fix CVE-2019-18197
-
-Added after 1.1.33 release.
-
-CVE: CVE-2019-18197
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt.git]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-commit 2232473733b7313d67de8836ea3b29eec6e8e285
-Author: Nick Wellnhofer <wellnhofer@aevum.de>
-Date:   Sat Aug 17 16:51:53 2019 +0200
-
-    Fix dangling pointer in xsltCopyText
-    
-    xsltCopyText didn't reset ctxt->lasttext in some cases which could
-    lead to various memory errors in relation with CDATA sections in input
-    documents.
-    
-    Found by OSS-Fuzz.
-
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 95ebd07..d7ab0b6 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -1094,6 +1094,8 @@ xsltCopyText(xsltTransformContextPtr ctxt, xmlNodePtr target,
- 	    if ((copy->content = xmlStrdup(cur->content)) == NULL)
- 		return NULL;
- 	}
-+
-+	ctxt->lasttext = NULL;
-     } else {
-         /*
- 	 * normal processing. keep counters to extend the text node
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
similarity index 81%
rename from meta/recipes-support/libxslt/libxslt_1.1.33.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.34.bb
index 9f268e7bb03..ad37b5a44a0 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -9,14 +9,10 @@ SECTION = "libs"
 DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
-           file://0001-Fix-security-framework-bypass.patch \
-           file://CVE-2019-13117.patch \
-           file://CVE-2019-13118.patch \
-           file://CVE-2019-18197.patch \
-"
-
-SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-SRC_URI[sha256sum] = "8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"
+          "
+
+SRC_URI[md5sum] = "db8765c8d076f1b6caafd9f2542a304a"
+SRC_URI[sha256sum] = "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


