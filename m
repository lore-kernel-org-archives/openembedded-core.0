Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 941CF6C149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 20:58:46 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h126so18263543qke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=6YaUGtBwhg25uQTGhtnB8Q7DxIiqFLhFKvXrctFvlkA=;
	b=OUVWHAHcGrHJIt/EU0y5qaQBBtg9YzjyNkZGTkIwg4rvSmXF8gBBil7OHp1EwWk6Lc
	HgIqEjjaE9PojIUGwyCyo0CWFMMgrvaXAX1o/tiklVUDvQ8fy+17sy0AXV0ZAnTHiB9K
	H4TyscKgbJHyCSXNec9/HIIILt69Ck8U0gRy3AHj220DQ09Na7PLZdFzxbeSY6U+9p8y
	MvGZLZY/bEDMClLmk6kdPbkMP+dihVMxtGq4hdyyj/PGJhIja53jWuzTp8Aw3h4MnylC
	cLoZixl1v9mpW8rEO0qx33d2zMZ0zQl/XRyYp9S0/UkIegwnzVj3bAKZglreYFxCmzT0
	mquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=6YaUGtBwhg25uQTGhtnB8Q7DxIiqFLhFKvXrctFvlkA=;
	b=tHnJA8L+kctDq5pQDuNnCcyBhYuYym1WwnvxaVW8UqAmnc+M9ieQiMXKMzhYWNcW6/
	6QK+1FqqazY7tuNHwvNbLx1e8RRPTB+AtzWoyuFt20XtWcP8DXSvkDQAPoFXzaYQg0Bd
	lryVb68uNs06/uJ/IFG7bq8mF7LmFGstZE7JCEXZN2Rhnh5baGHEFM1mSNxSJj/j83Q9
	pmpTogDMs5w5yyW1EXtMx/zstz44LTnJUjHG5gXQapTvp1sK7bSCh7TwIHjspNHXdTAU
	2jZwUndPxwmcVCxW56GDCHL1mGp5iiDeuizcUE+egj60eDCJR7SsxIG15mWnLf/oURqv
	o2UA==
X-Gm-Message-State: APjAAAU8yJmidnP6rUru/qHDPNRAwd/MCXGIP7M3raS0slz50XVXF3Ct
	pskMZQXGIPPCDWmzUMk56lstC0lqwSZft4Zp
X-Google-Smtp-Source: APXvYqy41sY4n4yQKwaE0SeIsSr8YsTNbTTUIt+x7gN8xqIbGRt40C66P7FmCA0CxiRi3bcfMw59vw==
X-Received: by 2002:a37:95c6:: with SMTP id
	x189mr42413159qkd.323.1568321927016; 
	Thu, 12 Sep 2019 13:58:47 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	d3sm11710268qtr.55.2019.09.12.13.58.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Sep 2019 13:58:46 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 20:58:38 +0000
Message-Id: <20190912205838.42869-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH] CVE fix for libxslt <CVE-2019-11068>
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
X-List-Received-Date: Thu, 12 Sep 2019 20:58:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../libxslt/libxslt/CVE-2019-11068.patch      | 128 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.32.bb |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch b/meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch
new file mode 100644
index 0000000000..83ca8a3c00
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch
@@ -0,0 +1,128 @@
+From aed812d8dbbb6d1337312652aa72aa7f44d2b07d Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 24 Mar 2019 09:51:39 +0100
+Subject: [PATCH] Fix security framework bypass
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
+Signed-off-by: Muminul Islam <muminul.islam@microsoft.com>
+
+CVE: CVE-2019-11068
+
+Upstream-Status: Backport
+
+https://gitlab.gnome.org/GNOME/libxslt/commit/e03553605b45c88f0b4b2980adfbbb8f6fca2fd6
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
+index 7262aab9..b62e0877 100644
+--- a/libxslt/imports.c
++++ b/libxslt/imports.c
+@@ -131,10 +131,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
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
+index 560f43ca..46eef553 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -3485,10 +3485,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
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
+index 54a39de9..359913e4 100644
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
+2.23.0
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
index f0fa5e723f..df3f97aa12 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -10,6 +10,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://fix-rvts-handling.patch \
+           file://CVE-2019-11068.patch \
            "
 
 SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
-- 
2.23.0


