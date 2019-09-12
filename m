Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id DEABF7E08E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:23:13 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g4so31436653qtq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=6YaUGtBwhg25uQTGhtnB8Q7DxIiqFLhFKvXrctFvlkA=;
	b=frf7tsHfOvcGbW8v9pwBeDrOJE9eXyTt+oqb+hNOvoK+bX7kp3rx+ACq++WiDQtIcD
	V33YBNORY7v+znnJw3w/g7DylK3sj6pslWsYKmFY3yKu3G8lUtPmIekYERcDWEdzva6D
	EJr/zCde3tb5sJcY7ZxDywiCvAiEMZVoGxmcIU/jXmBvZEZOTxv3aqspIuhjmvzWQtEK
	qsxbLsXXmCiTrvpjvSdr1XcD4xt/tvFd75yNjo1VOhoqkTO4JKyCpwPSRBoH+RhWrPKY
	ckc8kpXDSRrDgcDtiY+UGq24pqHkcg+PHX61zI+CCviptDBP7OIsbCpzYPd5EPgSLVr8
	GG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=6YaUGtBwhg25uQTGhtnB8Q7DxIiqFLhFKvXrctFvlkA=;
	b=lM2JlH5s/0yrzTtswbGBJGrrfpgAOM6JRqa85q3kfLDGPcxJd5gp/lMljswQ6Bd42D
	tXIq4JuQ2+SalTJod3A1JuzcT/RLFg+1rKAN0RfAKIYdqePtaldl8FL/rAh6XtLvqlNq
	T45xZxuiW160eybXGXcO7wuEIF6tgzg/9JW+Rkibnh+3jCyeQdnSS0m5L+UOx+3jMXGw
	Ih9zoY3FZkNOka+lnFckF0qHmwu1v2Pf0wmKhiNVZ5nnTJjkuj0yt63n1ublluTJpNPb
	Ts99Am3Gcfvoc7WZG+Ox2+1bh0nl8/Zp57IPHvRMjSbEjSNqma1vLIiRlulVU03l7LFX
	WhmQ==
X-Gm-Message-State: APjAAAX6e32Cv1sScG4JY9FbBwjFM3L4oUaSaNmgG2I61N3T/zqSZ0g8
	bS5GFTb9Fip91tkloVFOELESouu3C8HcDQ==
X-Google-Smtp-Source: APXvYqzffkvAbmWi7EaG1jD9CWT+87+/VoLlA9k7CfkImU9nrK8t63EwOEp2G20Bzp6bswwmyaVARQ==
X-Received: by 2002:ac8:6b8b:: with SMTP id z11mr35152768qts.294.1568323394426;
	Thu, 12 Sep 2019 14:23:14 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	f14sm4885008qtq.54.2019.09.12.14.23.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Sep 2019 14:23:13 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 21:23:05 +0000
Message-Id: <20190912212305.50649-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v2] libxslt: Cve fix CVE-2019-11068
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
X-List-Received-Date: Thu, 12 Sep 2019 21:23:14 -0000
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


