Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A9CDD77205
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:28 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id o185so66240045pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TyJr6zW9FVMNv64JgdlllBe/elFFSu3pTK7K4Xo1Iew=;
	b=jfA6yU/QordlmgeE/CV+XhpDdyezBH/uaVP4S44NZU63VTpZJrDZKTuvayW2gpg/4G
	+nUFJVbknXqXr/9kY711jBS4F7F5igEDYOl+ayBrX7dGchg5trTBvzN2WZiWWfkOsUP5
	P+BMMPiBjdwpN5n1JfLsENo5u/z76ZBK1LW0/CqvC25J7ze28eJ8OQCF+ZG99Qpt7FEV
	y2rFAQfZ9A64jXGInBs5A0dcoTykFQ1tCQMhrrj5ej7pl334KlF/U5RJF7smZJAw/aFB
	u1OtCFUBkzJc79bKCrx6aoKeXcTLWWbLdJmUh3daDZKZZMeBFmHPOINtqLRaMR+ZkWbT
	wAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TyJr6zW9FVMNv64JgdlllBe/elFFSu3pTK7K4Xo1Iew=;
	b=HfYOV8wXA7L81GHBRaBKJ5WHDhQUo7KFhitbZnm9gBQGuHJbxDV+wYpBll8dXwKw+S
	TZ21ptOy7nv41ofzZTb+RgL1ahWvPV8Itnq/QyiooA8LQ/vYPz76kROUQSZ3yvhH+8Um
	YIDAPJplTYy+A2u9YJ1kqjUxDirU6XV0hMWE24ijv3OufIFW8GCfDzDRU3FBTS991R8b
	Hlna3secKAy2UG/5BSijK253tGB8QiEhrw7rkTZKmlMoUTHGjix3zlAU5wzxY3/vrUKJ
	0UgDH3ZRTLV7joVaokfsvRz4i3yCGIVzLaDfc5/a5yAsgWYGGyPdzGkyYjXlPsvo4VYR
	eDfQ==
X-Gm-Message-State: AG10YOQludl7dU+RKAHIki3Sd0MUYFRptrZ3xuMPUWMrOy37vdzFOwSLray+y1uVPUpiMw==
X-Received: by 10.98.65.203 with SMTP id g72mr32570926pfd.44.1454270009028;
	Sun, 31 Jan 2016 11:53:29 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:09 -0800
Message-Id: <6f678a02279cbef0b0e7d69f50d10fac156a08f1.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 3/8] libxml2: Security fix CVE-2015-8710
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:32 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8710 libxml2: out-of-bounds memory access when parsing an unclosed HTML comment

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8710.patch             | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index bced950f..310d5bb 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -36,6 +36,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
            file://0001-CVE-2015-5312-Another-entity-expansion-issue.patch \
            file://CVE-2015-8241.patch \
+           file://CVE-2015-8710.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
new file mode 100644
index 0000000..be06cc2
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
@@ -0,0 +1,71 @@
+From e724879d964d774df9b7969fc846605aa1bac54c Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Fri, 30 Oct 2015 21:14:55 +0800
+Subject: [PATCH] Fix parsing short unclosed comment uninitialized access
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=746048
+The HTML parser was too optimistic when processing comments and
+didn't check for the end of the stream on the first 2 characters
+
+Upstream-Status: Backport
+
+https://git.gnome.org/browse/libxml2/commit/?id=e724879d964d774df9b7969fc846605aa1bac54c
+
+CVE: CVE-2015-8710
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ HTMLparser.c | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+Index: libxml2-2.9.2/HTMLparser.c
+===================================================================
+--- libxml2-2.9.2.orig/HTMLparser.c
++++ libxml2-2.9.2/HTMLparser.c
+@@ -3245,12 +3245,17 @@ htmlParseComment(htmlParserCtxtPtr ctxt)
+ 	ctxt->instate = state;
+ 	return;
+     }
++    len = 0;
++    buf[len] = 0;
+     q = CUR_CHAR(ql);
++    if (!IS_CHAR(q))
++        goto unfinished;
+     NEXTL(ql);
+     r = CUR_CHAR(rl);
++    if (!IS_CHAR(r))
++        goto unfinished;
+     NEXTL(rl);
+     cur = CUR_CHAR(l);
+-    len = 0;
+     while (IS_CHAR(cur) &&
+            ((cur != '>') ||
+ 	    (r != '-') || (q != '-'))) {
+@@ -3281,18 +3286,20 @@ htmlParseComment(htmlParserCtxtPtr ctxt)
+ 	}
+     }
+     buf[len] = 0;
+-    if (!IS_CHAR(cur)) {
+-	htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
+-	             "Comment not terminated \n<!--%.50s\n", buf, NULL);
+-	xmlFree(buf);
+-    } else {
++    if (IS_CHAR(cur)) {
+         NEXT;
+ 	if ((ctxt->sax != NULL) && (ctxt->sax->comment != NULL) &&
+ 	    (!ctxt->disableSAX))
+ 	    ctxt->sax->comment(ctxt->userData, buf);
+ 	xmlFree(buf);
++	ctxt->instate = state;
++	return;
+     }
+-    ctxt->instate = state;
++
++unfinished:
++    htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
++		 "Comment not terminated \n<!--%.50s\n", buf, NULL);
++    xmlFree(buf);
+ }
+ 
+ /**
-- 
2.3.5


