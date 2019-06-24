Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id F0ADE7E62D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z19so3394085pgl.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S9SebKG9yIdTft/eetRnjGUVDpKE/ixHpCchOIZxfuA=;
	b=egUTFRFGg/Mtk06cWW4/wvCPZ76r4fhNVweKs5PdK2kL6AzUGYaxpgG3xrYCHySGqD
	WHRB2e3TxroJ/U8CEtKd8ebwSKKdVrFf17sbGy8mxs7VC57n49BaaNkLqGY4iAB0ucK8
	BtNlog03+13eQYjcRQ3CevJQ7gMbGgfJBiOa9StUEFtY2uMm0g7qyhusCXFz3+lfKudm
	sDMf6VSbWAyjsIHehguyjWhBAmWzph8ufIGjCB8PmnhFbTMXhNhfg+TlEgKn/fu7ppq0
	EuoYYCZ+tE5hquoqpCXVoccqmBHltzby6871YCA05imn9uLqXkk86frRjveq5n8Zg5ak
	hJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S9SebKG9yIdTft/eetRnjGUVDpKE/ixHpCchOIZxfuA=;
	b=avdP9HS6HrmD/yQvOti4frYpUjIj3cVHDgNLqOpdUwxFv8qmSdJgOX3tbi9WG84qFr
	sQT5zsP0uIteoX3Nr6IO9xRWH7AvOI0e8oM3EoMPtievCwg4krYmVE8gQeOnSk4AI/Wl
	kHkuvh5225qIj7kIG4AQle2KrL9EDyvIN+ucTAIMp++s6lD7MCipULy/VREv/ukUOdAr
	YeTCl46kht1KXfejXip66mxzaYI/A1aQrd2GsSTBItrcIYR76ltrcM5O1HnKHbSpG5zg
	lY4vBSE/M1q6aztpd75MbmNXx9DJtrBIuWiHTxmySy9xMhx7wYfBu8GrRs11nEPGQo9W
	7MeQ==
X-Gm-Message-State: APjAAAUUBs7eNivrJMlqQ07PbZd+OkO0gMnbbvIIV6YbhHgXRM/EG64k
	ox/UYVcpsKjTrZ0Zz/4TxfM4iEGqB90=
X-Google-Smtp-Source: APXvYqxI3LrVBMVIvLN2NtSbyXdvy0QL8bZ1mjgGYG/aLfxEDxARbPIqf3jn9MeLhmS+s02oxCTKXQ==
X-Received: by 2002:a63:1651:: with SMTP id 17mr30164882pgw.243.1561348475803; 
	Sun, 23 Jun 2019 20:54:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:13 -0700
Message-Id: <83ea6de3142736cfe5a63740e1919bcf42de54d2.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 14/19] libxslt: Fix CVE-2019-11068
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:35 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Fix-security-framework-bypass.patch | 124 +++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   4 +-
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch

diff --git a/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
new file mode 100644
index 0000000..89b647d
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
@@ -0,0 +1,124 @@
+From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 24 Mar 2019 09:51:39 +0100
+Subject: Fix security framework bypass
+
+xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
+don't check for this condition and allow access. With a specially
+crafted URL, xsltCheckRead could be tricked into returning an error
+because of a supposedly invalid URL that would still be loaded
+succesfully later on.
+
+Fixes #12.
+
+Thanks to Felix Wilhelm for the report.
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Backport
+CVE: CVE-2019-11068
+---
+ libxslt/documents.c | 18 ++++++++++--------
+ libxslt/imports.c   |  9 +++++----
+ libxslt/transform.c |  9 +++++----
+ libxslt/xslt.c      |  9 +++++----
+ 4 files changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/libxslt/documents.c b/libxslt/documents.c
+index 3f3a7312..4aad11bb 100644
+--- a/libxslt/documents.c
++++ b/libxslt/documents.c
+@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
+-	if (res == 0) {
+-	    xsltTransformError(ctxt, NULL, NULL,
+-		 "xsltLoadDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(ctxt, NULL, NULL,
++                     "xsltLoadDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, URI);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltLoadStyleDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltLoadStyleDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+diff --git a/libxslt/imports.c b/libxslt/imports.c
+index 874870cc..3783b247 100644
+--- a/libxslt/imports.c
++++ b/libxslt/imports.c
+@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
+ 	int secres;
+ 
+ 	secres = xsltCheckRead(sec, NULL, URI);
+-	if (secres == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsl:import: read rights for %s denied\n",
+-			     URI);
++	if (secres <= 0) {
++            if (secres == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsl:import: read rights for %s denied\n",
++                                 URI);
+ 	    goto error;
+ 	}
+     }
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 13793914..0636dbd0 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
+      */
+     if (ctxt->sec != NULL) {
+ 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
+-	if (ret == 0) {
+-	    xsltTransformError(ctxt, NULL, inst,
+-		 "xsltDocumentElem: write rights for %s denied\n",
+-			     filename);
++	if (ret <= 0) {
++            if (ret == 0)
++                xsltTransformError(ctxt, NULL, inst,
++                     "xsltDocumentElem: write rights for %s denied\n",
++                                 filename);
+ 	    xmlFree(URL);
+ 	    xmlFree(filename);
+ 	    return;
+diff --git a/libxslt/xslt.c b/libxslt/xslt.c
+index 780a5ad7..a234eb79 100644
+--- a/libxslt/xslt.c
++++ b/libxslt/xslt.c
+@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, filename);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltParseStylesheetFile: read rights for %s denied\n",
+-			     filename);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltParseStylesheetFile: read rights for %s denied\n",
++                                 filename);
+ 	    return(NULL);
+ 	}
+     }
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 28d404c..42b21c7 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
+           file://0001-Fix-security-framework-bypass.patch \
+"
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
 SRC_URI[sha256sum] = "8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"
-- 
2.7.4


