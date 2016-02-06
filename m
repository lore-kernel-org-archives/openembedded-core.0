Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6C910772A7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:51 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 66so6920287pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6g628O8BPlqMeTqfs9adDmrufQJkPmS3YRF+ehNZT2I=;
	b=viPN66A8DE6Ko290ojONgCGfHFHKWwCuuoWuocJI769MS/c+7fNH8fV3+YGvQoXRdV
	d1bFfiPDEHVZZuRW79X7SsUgq3v5lHzJRBjYLVMM+MCZdxyFiwCciOVD7+0XxAQcNizq
	W7pvWvkS0aTO8aspzyFqJZqN2jbX/X/hl5MpazvbT4EfNNfpccL5Lg6tEzUyrmS7P7Qh
	4j6v5Miuz3cJweuRJ4P0Ej9ecZFzb4k8EpPIqhTINmuk9HT1D1qdo65GSKCK04LhJR42
	3I6deF7IOlMNXGZk0yYsDBGvx3IUdjtoygXtFptaj3L08cFjFcTxUG1OGyH+wzsGrPoT
	K1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6g628O8BPlqMeTqfs9adDmrufQJkPmS3YRF+ehNZT2I=;
	b=KVvZ6g3UTyfpbtvXHiHyD0oYky4wUkCDSN6gMTpt96XmYlYSRou5R0RWh1OxuiiGaH
	6M8rf6ZNixl7F7D/jsw8oT8wg8wun65ltiskErh6Zzogu9Dpf+juOt868G8uzCFGQGXM
	EfUoA5xmCH4h0ljDu3nGtgNC1Z7jNvelI5eiKOa5B/WZntt/1R49g97TqsY2l2f7X90k
	JR9NAySUftHCOGNdNVL7iqKDUsC25AyYoiBT5qifuwoNpREkqKYqYI2+du3JgVOZdHAu
	Jyrd7YojU0h2/P0Aq+iHfoN5IlHZ35qtkBFzMG5WeuI2/+p/B06qkrN5NqrcxslAwX1i
	nPIg==
X-Gm-Message-State: AG10YORM32rNAdxuWgSScyQ1ZqxrTXUjmeX6P7P0u7MEBST174LFJOhrXRcTcPC2EFbV3g==
X-Received: by 10.98.0.135 with SMTP id 129mr30907215pfa.156.1454800552146;
	Sat, 06 Feb 2016 15:15:52 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:15:01 -0800
Message-Id: <4bee82881d9e4907ffc8d9613b150708e71bd773.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 20/21] libxml2: Security fix CVE-2015-8710
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:51 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8710 libxml2: out-of-bounds memory access when parsing an unclosed HTML comment

(From OE-Core rev: 03d481070ebc6f9af799aec5d038871f9c73901c)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8710.patch             | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 01d6bbe..2748b4f 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -38,6 +38,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
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


