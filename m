Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B74727F2C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c17so398831pgg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vGOp327/pWP9UnOgBHSx1InHeZgPnIbwEGR+lPuACc8=;
	b=UHvsLqcMrUvU4Rv7Rv55vmgwDq21fDsg38Kh/lc4R+gTmeJk3he1kh58cN01ycMa/l
	1i/GBNCIfvfsHvBqHFFw+tjo04cN0YQiBXN/FxnqszQSMCcWbLxuQ5Sta4eAJ/PGg2AL
	6dtsFm1IIhuHCF7b04lEBHJzj5isjckeEM3gib1hHzwyORDVlxgw5pHcd6IBdJLrWs71
	oCtRCjC9qv+rHfCCDbn6UOfgu021tHfzXI/7gjHbzSSsWlT9QO9pmZPZA7fyskdHwUIA
	AWTkESMAoBqTsP91Sw3VfoJgst5TguxwKRep8kT9wsOmxeTbuPTdyQH9bdo3AcaWTD4I
	SF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vGOp327/pWP9UnOgBHSx1InHeZgPnIbwEGR+lPuACc8=;
	b=eScUB4NWhVsg/7FvNO607l0Mlf4ycKMlwrORizA/nsiQriLkVngr9GTFCpe22T3H5C
	pkYLw7LWSoguXl/kKzYwMYq7CxLpzstB9LdLhP4BZ3k5KifEZ3rbqpZkr1+ECBZMmjLG
	Hd6BigdxrCmVScLMtxmHi7lehLMC04y/0TjfRZKpTk7cFxunGVLyl/mF+Sky5WbQ9WDi
	n3oOSwJNKA3GQW7nstAeNQ1rPl5SkZ/pcwlCx3xvzslkSuzKAltOz7XDKBZ8D5alrlq3
	+snhbFxjKYNcRa4Xa29Z7atFGKgLg5iSHf3AQ3ke5lV/JjfMNsbv7Plj4aBpx3qqF0jY
	XLlA==
X-Gm-Message-State: APjAAAVfGDzDPrY2gJ/qtIsc6da+xouu0Q/nET0WHqJYbzMeievxKxfg
	RHA344oow1otbdMjumVosNqPfWZARlw=
X-Google-Smtp-Source: APXvYqwO95Z4KYJ5ppF71OSaXmgIWLm9BAaWBufi15Os/bOHltcASCFX2L5MCCC+3IhdriY5lykepQ==
X-Received: by 2002:a62:8209:: with SMTP id w9mr844736pfd.112.1569294823788;
	Mon, 23 Sep 2019 20:13:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:15 -0700
Message-Id: <30a639776423692a3fbdbc1cac89afa456eff7b6.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 19/24] libxslt: Cve fix CVE-2019-11068
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:43 -0000

From: Muminul Islam <misla011@fiu.edu>

Signed-off-by: Muminul Islam <muislam@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxslt/libxslt/CVE-2019-11068.patch           | 128 +++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch b/meta/recipes-support/libxslt/libxslt/CVE-2019-11068.patch
new file mode 100644
index 0000000..83ca8a3
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
index f0fa5e7..df3f97a 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -10,6 +10,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://fix-rvts-handling.patch \
+           file://CVE-2019-11068.patch \
            "
 
 SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
-- 
2.7.4


