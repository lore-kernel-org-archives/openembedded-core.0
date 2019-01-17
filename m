Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 08FB67C212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:13 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id k15-v6so9073166ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ABC7ZCzFsp4JpIYBHzai7Rn7yJaeH1CicdKmK3MDVaM=;
	b=UAu4u5DpLrAtTNYzPpDFiXhuac+KhznxTGrIwISq0FD7agdi5a6s1sMlYy6jDNJiQH
	RcqNiHZ6vPeegMNrD0US4NUWQqIt0JUFl1ZOyghYKjjZ8jgrIQlylSVH6M/3kllj9L0+
	E34S6b0PZ+410XP1LpLn+w338lwtGdEqnwzyWXKxMvORFBtqQKyN9CkbcWdFt+hdkSt+
	sWfBhLlq2cHA6No/UEWrbfo+vTajwPe7QbsfKW0DDo7YWYLr4kGMz07xr/BtUVn9VZAb
	ysiTQPCQJfF0KPLZMzee8K59Q8knwDFLrPze9l/q4xlTtVXrkJBivnxHmVrAn4xPd+vD
	pOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ABC7ZCzFsp4JpIYBHzai7Rn7yJaeH1CicdKmK3MDVaM=;
	b=JhewapZM7ylMNOznyA7IlCBak1SKia54xaDizOs65DSQRhmfrxptzBotTB4eDsT9Xy
	G/30eL5U0nQ9ydZs2W4r+a77MlflcTV8TEMXCtFrwZ2y5V5MYydVj5EGVRpiEwQnuExR
	FNHlviulI1ko2FyoiuHAEYxzFob82tFe7OZdwDyQj51v/xL3o/a7z1cv+WvCOZBcjGy2
	bLN92YaKx4K+xOUElxFloQSoudt8pSGsQAFisblsW6cvQ+MgaGtZP/VFD+wej6Yji+vB
	Am4vhY+gCblN/8NTl5hU0ryAGFktb9ztXoSmblwb6+5haIU0IAazMrnNfbAyjFY1jobl
	yO/g==
X-Gm-Message-State: AJcUukekycYqmBXC7ZuWrgNQZUSCKI6SbU0kRnZvfh2MqHiVlnRtSgV2
	xMdThM7mO6N3ZcNmxaMo3ndwbAOY
X-Google-Smtp-Source: ALg8bN6Lq+boLOtZpEAhskoT/dt2cOM/s+kHwpZpD5kqhgCu6LjoP05HBn1O1yA+gONnqqD5R4AcLg==
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr10033450ljl.162.1547742434325; 
	Thu, 17 Jan 2019 08:27:14 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:55 +0100
Message-Id: <20190117162659.24997-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/11] vala: update to 0.42.4
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../vala/vala/disable-graphviz.patch          | 30 ++++++++++---------
 .../vala/{vala_0.42.3.bb => vala_0.42.4.bb}   |  4 +--
 2 files changed, 18 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.42.3.bb => vala_0.42.4.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
index 477504dca3a..e521bc854b3 100644
--- a/meta/recipes-devtools/vala/vala/disable-graphviz.patch
+++ b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
@@ -1,4 +1,4 @@
-From 57f6b661d7865e8cecd17be36fab68f7f8447998 Mon Sep 17 00:00:00 2001
+From b2723ff18b70c67c8a7fab5375a7f3c442d49790 Mon Sep 17 00:00:00 2001
 From: Rico Tzschichholz <ricotz@ubuntu.com>
 Date: Wed, 6 Sep 2017 18:52:55 +0200
 Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Upstream-Status: Submitted [bugzilla link above]
 
 ---
- configure.ac                          | 60 +++++++++++++++++++----------------
- libvaladoc/Makefile.am                | 25 +++++++++++----
- libvaladoc/html/basicdoclet.vala      |  8 +++++
- libvaladoc/html/htmlmarkupwriter.vala |  4 +++
+ configure.ac                          | 60 ++++++++++++++-------------
+ libvaladoc/Makefile.am                | 25 ++++++++---
+ libvaladoc/html/basicdoclet.vala      |  8 ++++
+ libvaladoc/html/htmlmarkupwriter.vala |  4 ++
  4 files changed, 63 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
@@ -88,10 +88,10 @@ index 730c72d..af81986 100644
  
  AC_PATH_PROG([XSLTPROC], [xsltproc], :)
 diff --git a/libvaladoc/Makefile.am b/libvaladoc/Makefile.am
-index 384292f..cce50d8 100644
+index f3f790e..3c5dc4c 100644
 --- a/libvaladoc/Makefile.am
 +++ b/libvaladoc/Makefile.am
-@@ -126,10 +126,6 @@ libvaladoc_la_VALASOURCES = \
+@@ -128,10 +128,6 @@ libvaladoc_la_VALASOURCES = \
  	content/tablerow.vala \
  	content/taglet.vala \
  	content/text.vala \
@@ -102,7 +102,7 @@ index 384292f..cce50d8 100644
  	parser/manyrule.vala \
  	parser/oneofrule.vala \
  	parser/optionalrule.vala \
-@@ -156,13 +152,24 @@ libvaladoc_la_VALASOURCES = \
+@@ -158,13 +154,24 @@ libvaladoc_la_VALASOURCES = \
  	highlighter/codetoken.vala \
  	highlighter/highlighter.vala \
  	html/basicdoclet.vala \
@@ -128,18 +128,20 @@ index 384292f..cce50d8 100644
  libvaladoc@PACKAGE_SUFFIX@_la_SOURCES = \
  	libvaladoc.vala.stamp \
  	$(libvaladoc_la_VALASOURCES:.vala=.c) \
-@@ -182,9 +189,9 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
+@@ -184,11 +191,11 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
  		--library valadoc \
  		--vapi valadoc@PACKAGE_SUFFIX@.vapi \
  		--vapidir $(top_srcdir)/vapi --pkg gmodule-2.0 \
 -		--vapidir $(top_srcdir)/vapi --pkg libgvc \
  		--vapidir $(top_srcdir)/gee --pkg gee \
  		--vapidir $(top_srcdir)/vala --pkg vala \
+ 		--vapidir $(top_srcdir)/ccode --pkg ccode \
+ 		--vapidir $(top_srcdir)/codegen --pkg codegen \
 +		$(LIBGVC_PKG) \
  		--pkg config \
  		$(filter %.vala %.c,$^)
  	touch $@
-@@ -211,6 +218,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
+@@ -217,6 +224,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
  
  valadoc@PACKAGE_SUFFIX@.pc: valadoc.pc
  	cp $< $@
@@ -149,7 +151,7 @@ index 384292f..cce50d8 100644
  
  vapidir = $(datadir)/vala/vapi
  dist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.vapi
-@@ -218,6 +228,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
+@@ -224,6 +234,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
  
  valadoc@PACKAGE_SUFFIX@.deps: valadoc.deps
  	cp $< $@
@@ -160,7 +162,7 @@ index 384292f..cce50d8 100644
  EXTRA_DIST = \
  	$(libvaladoc_la_VALASOURCES) \
 diff --git a/libvaladoc/html/basicdoclet.vala b/libvaladoc/html/basicdoclet.vala
-index 37c731c..e0326ef 100644
+index 192e488..ec09602 100644
 --- a/libvaladoc/html/basicdoclet.vala
 +++ b/libvaladoc/html/basicdoclet.vala
 @@ -46,7 +46,11 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
@@ -185,7 +187,7 @@ index 37c731c..e0326ef 100644
  	}
  
  
-@@ -1025,6 +1031,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+@@ -1026,6 +1032,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
  	}
  
  	protected void write_image_block (Api.Node element) {
@@ -193,7 +195,7 @@ index 37c731c..e0326ef 100644
  		if (element is Class || element is Interface || element is Struct) {
  			unowned string format = (settings.use_svg_images ? "svg" : "png");
  			var chart = new Charts.Hierarchy (image_factory, element);
-@@ -1044,6 +1051,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+@@ -1045,6 +1052,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
  									   this.get_img_path_html (element, format)});
  			writer.add_usemap (chart);
  		}
diff --git a/meta/recipes-devtools/vala/vala_0.42.3.bb b/meta/recipes-devtools/vala/vala_0.42.4.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.42.3.bb
rename to meta/recipes-devtools/vala/vala_0.42.4.bb
index 0d11ff6ba76..49ffc41bc36 100644
--- a/meta/recipes-devtools/vala/vala_0.42.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.42.4.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "6fdd6fadbef27e3dd05086d6a3220556"
-SRC_URI[sha256sum] = "5fc73dd1e683dc7391bb96d02b2f671aa8289411a48611a05265629e0048587d"
+SRC_URI[md5sum] = "f34cb465a164ba7f1f2e7fea31f36d13"
+SRC_URI[sha256sum] = "b528906d080ac5b6043285a82c194c988e495c70da71ae19c1fc7811509f4f1e"
-- 
2.17.1


