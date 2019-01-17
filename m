Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 819037C1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:07 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l15-v6so9069580lja.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ePHM0KB4jil66R23QsXEHosgOQDZ+weRBqH8KC2HSbk=;
	b=k4ATAKYKQZ7ok7yeY9RjUg4/3nV5ao7SKWIxzg4Pf6oj5Fmh2VgPeRRv8k3zBxp+vK
	T+ZVcPbOlJyJkJYEMFPlXSxQiYaLof5P4BOma9Sn6UxPRFEgYJ3ssqAwv1EngvVawa9B
	k9JLWZqdZwXmAMWQVHXND0ZsvB8NhMuayfWtHsOVgNlk94ejLLmw1FWnvsDcDymT41xa
	dkl7aZIPy2H8Rhhs5BoZMTXYatXNC1gq+THY83w/sqfzdtmZVlKZo+mL07ebLsaXfqRE
	im4OasMVmP++th9ZrOVZuwjjtfI7epN/rDHCjTIgbvs7kj6Nl2HqfDVqhRoZBzZ4JDO9
	5WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ePHM0KB4jil66R23QsXEHosgOQDZ+weRBqH8KC2HSbk=;
	b=d7PEiUzFyXt1+cUkdPLFuNMZKPy7Dq3u0DVy645KhMJhQSlACyu6+M0K9XXJPAeX/F
	9OvxYEfkh8QHlmq0JDyta0ayIge9xwS8KT3xlmutfJr16/jdQvDMu+foeDP+pXYqwX5/
	4htTDNM4enhNYi/1CQlS6zKso7uzYDHU84u3BZrEmW5DYQExsPc3NfE0l5VXYEF3Dt+W
	Po8jT00pIuyBrE9PWir/ofwP9c7ufYS58b3Q3wi2xuybNgoIH3SS+9/OYAIgGTN/8ow5
	eMEY734UfSMZFAgus6e1sPdDjLwxAJwotc/54Yp2FJqw5JBuZ5ZIFtKcB2isZ0u4uZth
	9osw==
X-Gm-Message-State: AJcUukc1IOjVnxGSR9Hpgapew3DQxPOJFJMnSL7kgoc2fPbetaz9JGZe
	rWBMBeYLY9PO0O9lOOYB3k49IB72
X-Google-Smtp-Source: ALg8bN7mlqkft+/H0uDkP/hnyph24IDZHvlT+1bDmoUbrFXkKEoVacBcGXNDQMup3P8B8eCT6sXW0w==
X-Received: by 2002:a2e:2b8d:: with SMTP id
	r13-v6mr10232948ljr.79.1547742427641; 
	Thu, 17 Jan 2019 08:27:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:49 +0100
Message-Id: <20190117162659.24997-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/11] libxslt: update to 1.1.33
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:08 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libxslt/libxslt/fix-rvts-handling.patch   | 80 -------------------
 .../{libxslt_1.1.32.bb => libxslt_1.1.33.bb}  |  8 +-
 2 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.32.bb => libxslt_1.1.33.bb} (83%)

diff --git a/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch b/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
deleted file mode 100644
index ea3ae51e937..00000000000
--- a/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-libxslt-1.1.32: Fix handling of RVTs returned from nested EXSLT functions
-
-[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=792580
-
-Set the context variable to NULL when evaluating EXSLT functions.
-Fixes potential use-after-free errors or memory leaks.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/8bd32f7753ac253a54279a0b6a88d15a57076bb0]
-bug: 792580
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/libexslt/functions.c b/libexslt/functions.c
-index dc794e3..8511cb0 100644
---- a/libexslt/functions.c
-+++ b/libexslt/functions.c
-@@ -280,6 +280,7 @@ exsltFuncFunctionFunction (xmlXPathParserContextPtr ctxt, int nargs) {
-     exsltFuncFunctionData *func;
-     xmlNodePtr paramNode, oldInsert, fake;
-     int oldBase;
-+    void *oldCtxtVar;
-     xsltStackElemPtr params = NULL, param;
-     xsltTransformContextPtr tctxt = xsltXPathGetTransformContext(ctxt);
-     int i, notSet;
-@@ -418,11 +419,14 @@ exsltFuncFunctionFunction (xmlXPathParserContextPtr ctxt, int nargs) {
-     fake = xmlNewDocNode(tctxt->output, NULL,
- 			 (const xmlChar *)"fake", NULL);
-     oldInsert = tctxt->insert;
-+    oldCtxtVar = tctxt->contextVariable;
-     tctxt->insert = fake;
-+    tctxt->contextVariable = NULL;
-     xsltApplyOneTemplate (tctxt, tctxt->node,
- 			  func->content, NULL, NULL);
-     xsltLocalVariablePop(tctxt, tctxt->varsBase, -2);
-     tctxt->insert = oldInsert;
-+    tctxt->contextVariable = oldCtxtVar;
-     tctxt->varsBase = oldBase;	/* restore original scope */
-     if (params != NULL)
- 	xsltFreeStackElemList(params);
-diff --git a/tests/docs/bug-209.xml b/tests/docs/bug-209.xml
-new file mode 100644
-index 0000000..69d62f2
---- /dev/null
-+++ b/tests/docs/bug-209.xml
-@@ -0,0 +1 @@
-+<doc/>
-diff --git a/tests/general/bug-209.out b/tests/general/bug-209.out
-new file mode 100644
-index 0000000..e829790
---- /dev/null
-+++ b/tests/general/bug-209.out
-@@ -0,0 +1,2 @@
-+<?xml version="1.0"?>
-+<result/>
-diff --git a/tests/general/bug-209.xsl b/tests/general/bug-209.xsl
-new file mode 100644
-index 0000000..fe69ac6
---- /dev/null
-+++ b/tests/general/bug-209.xsl
-@@ -0,0 +1,21 @@
-+<xsl:stylesheet
-+    version="1.0"
-+    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
-+    xmlns:func="http://exslt.org/functions"
-+    extension-element-prefixes="func">
-+
-+    <xsl:template match="/">
-+        <xsl:variable name="v" select="func:a()" />
-+        <xsl:copy-of select="$v"/>
-+    </xsl:template>
-+
-+    <func:function name="func:a">
-+        <func:result select="func:b()" />
-+    </func:function>
-+
-+    <func:function name="func:b">
-+        <func:result>
-+            <result/>
-+        </func:result>
-+    </func:function>
-+</xsl:stylesheet>
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
similarity index 83%
rename from meta/recipes-support/libxslt/libxslt_1.1.32.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.33.bb
index f0fa5e723ff..0e0c10d8168 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
-           file://fix-rvts-handling.patch \
-           "
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
-SRC_URI[sha256sum] = "526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460"
+SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
+SRC_URI[sha256sum] = "8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


