Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id B49607ED15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i32so1092569pgl.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vGOp327/pWP9UnOgBHSx1InHeZgPnIbwEGR+lPuACc8=;
	b=ZFW/MwsOJ3/qJ77gqjyz9RYy85LPVRTdeymsnnPkbOj05xamaljpO4Q/qS035l2lCJ
	E+x49Q0U3t1LsmYkqtejptelU1wW64//NazhKw4zo1IkBzG58I2x2icN4hQVF+vFKM8R
	BCqYSa5nr38bEierkwDlKIkye+nNcZ05E1l2peGvMHgiO1W7ufNI1f7Qyif9ILj7EMpS
	u034lmNKiWX18mZUEmjJ9kSTrFfniSK6VybLcHwOrTFellv07LE9keSJIqL3OnvWousA
	4HuTLRChBKELiLp4TjEydu5ISA0jdiwIAUCbKEWge4TAsz0xpnHksToH++VF/ISBmoUt
	Gffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vGOp327/pWP9UnOgBHSx1InHeZgPnIbwEGR+lPuACc8=;
	b=Yy3fnhQ9a5F18dAtnAdjcnJzQO0iwE+Al1gEqT8B/D7Tbm+N4grWuKBjiouOzPDye8
	jubwOIbIH7hEkp+lb3/nVDOIWGqNA6/QCfHGVWLc19UMXV+rSxUqtCmMyyTuFVopTi87
	oHRtgCx/jrUJ9Sg9LoQ8W1FW3hItwPSaU3yxYINEEbT9OWY2pkKr2FnEln0o0H0ir+5w
	cXhXuQ/QYSDASM0eF6IkAWIoQvZJmr79q9JQRRna3niN153v/K4EN3o1avfJZ66NdGoL
	Pg4JpUQDEAaZiwI1L6zun7jwxlSnjALhB1Gt5ROhJkTK1x1z+vC+FcL3cMp4BIsrq0+k
	N7Eg==
X-Gm-Message-State: APjAAAUMZAEhw+12t2FbYyPLeFKvqxqnUQhbZSei905iLy8BGjXfTX9Z
	mxOYxD1jl+2X+eBs2xJAsaKevogwJAI=
X-Google-Smtp-Source: APXvYqwql9w7jBy9wVhhiOV14QUBuib5+1g0caM9ia0JZljSYmjf9q7FZhCcROy5dIJDPVVDh0vHHw==
X-Received: by 2002:a62:4e52:: with SMTP id c79mr34012651pfb.28.1570461089450; 
	Mon, 07 Oct 2019 08:11:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:58 -0700
Message-Id: <c9c3fabddb4e1779ef330f2073f85dce83cb460b.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 21/26] libxslt: Cve fix CVE-2019-11068
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:29 -0000

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


