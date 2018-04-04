Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 98E407479F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:19:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599790"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:19:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:03 +0300
Message-Id: <20180404111321.10824-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/22] vala: update to 0.40.2
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
X-List-Received-Date: Wed, 04 Apr 2018 11:19:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../vala/vala/disable-graphviz.patch               | 26 +++++++++++-----------
 .../vala/{vala_0.38.8.bb => vala_0.40.2.bb}        |  4 ++--
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.38.8.bb => vala_0.40.2.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
index 15d186de054..8fb94dc149c 100644
--- a/meta/recipes-devtools/vala/vala/disable-graphviz.patch
+++ b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
@@ -1,4 +1,4 @@
-From eb716dc856c20b3da146a4e83e9800bd1f53c739 Mon Sep 17 00:00:00 2001
+From 500f4220f79c660a70a1ffc0d5b762d70088af5e Mon Sep 17 00:00:00 2001
 From: Rico Tzschichholz <ricotz@ubuntu.com>
 Date: Wed, 6 Sep 2017 18:52:55 +0200
 Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
@@ -7,6 +7,7 @@ Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
 https://bugzilla.gnome.org/show_bug.cgi?id=787375
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Upstream-Status: Submitted [bugzilla link above]
+
 ---
  configure.ac                          | 60 +++++++++++++++++++----------------
  libvaladoc/Makefile.am                | 25 +++++++++++----
@@ -15,10 +16,10 @@ Upstream-Status: Submitted [bugzilla link above]
  4 files changed, 63 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c73d5d6b1..291e503d5 100644
+index 662180b..82d7015 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -98,34 +98,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
+@@ -112,34 +112,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
  AC_SUBST(GMODULE_CFLAGS)
  AC_SUBST(GMODULE_LIBS)
  
@@ -86,10 +87,10 @@ index c73d5d6b1..291e503d5 100644
  
  AC_PATH_PROG([XSLTPROC], [xsltproc], :)
 diff --git a/libvaladoc/Makefile.am b/libvaladoc/Makefile.am
-index 89245d86b..7c07498b9 100644
+index 384292f..cce50d8 100644
 --- a/libvaladoc/Makefile.am
 +++ b/libvaladoc/Makefile.am
-@@ -127,10 +127,6 @@ libvaladoc_la_VALASOURCES = \
+@@ -126,10 +126,6 @@ libvaladoc_la_VALASOURCES = \
  	content/tablerow.vala \
  	content/taglet.vala \
  	content/text.vala \
@@ -100,7 +101,7 @@ index 89245d86b..7c07498b9 100644
  	parser/manyrule.vala \
  	parser/oneofrule.vala \
  	parser/optionalrule.vala \
-@@ -158,13 +154,24 @@ libvaladoc_la_VALASOURCES = \
+@@ -156,13 +152,24 @@ libvaladoc_la_VALASOURCES = \
  	highlighter/codetoken.vala \
  	highlighter/highlighter.vala \
  	html/basicdoclet.vala \
@@ -126,17 +127,18 @@ index 89245d86b..7c07498b9 100644
  libvaladoc@PACKAGE_SUFFIX@_la_SOURCES = \
  	libvaladoc.vala.stamp \
  	$(libvaladoc_la_VALASOURCES:.vala=.c) \
-@@ -182,8 +189,8 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
+@@ -182,9 +189,9 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
  		--library valadoc \
  		--vapi valadoc@PACKAGE_SUFFIX@.vapi \
  		--vapidir $(top_srcdir)/vapi --pkg gmodule-2.0 \
 -		--vapidir $(top_srcdir)/vapi --pkg libgvc \
  		--vapidir $(top_srcdir)/gee --pkg gee \
+ 		--vapidir $(top_srcdir)/vala --pkg vala \
 +		$(LIBGVC_PKG) \
  		--pkg config \
  		$(filter %.vala %.c,$^)
  	touch $@
-@@ -209,6 +216,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
+@@ -211,6 +218,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
  
  valadoc@PACKAGE_SUFFIX@.pc: valadoc.pc
  	cp $< $@
@@ -146,7 +148,7 @@ index 89245d86b..7c07498b9 100644
  
  vapidir = $(datadir)/vala/vapi
  dist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.vapi
-@@ -216,6 +226,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
+@@ -218,6 +228,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
  
  valadoc@PACKAGE_SUFFIX@.deps: valadoc.deps
  	cp $< $@
@@ -157,7 +159,7 @@ index 89245d86b..7c07498b9 100644
  EXTRA_DIST = \
  	$(libvaladoc_la_VALASOURCES) \
 diff --git a/libvaladoc/html/basicdoclet.vala b/libvaladoc/html/basicdoclet.vala
-index cc9ea4ed7..432c3818f 100644
+index cc9ea4e..432c381 100644
 --- a/libvaladoc/html/basicdoclet.vala
 +++ b/libvaladoc/html/basicdoclet.vala
 @@ -46,7 +46,11 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
@@ -199,7 +201,7 @@ index cc9ea4ed7..432c3818f 100644
  
  	public void write_namespace_content (Namespace node, Api.Node? parent) {
 diff --git a/libvaladoc/html/htmlmarkupwriter.vala b/libvaladoc/html/htmlmarkupwriter.vala
-index 15ed9efd1..fe0d705d4 100644
+index 15ed9ef..fe0d705 100644
 --- a/libvaladoc/html/htmlmarkupwriter.vala
 +++ b/libvaladoc/html/htmlmarkupwriter.vala
 @@ -43,12 +43,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
@@ -219,5 +221,3 @@ index 15ed9efd1..fe0d705d4 100644
  
  		return this;
  	}
--- 
-2.14.1
diff --git a/meta/recipes-devtools/vala/vala_0.38.8.bb b/meta/recipes-devtools/vala/vala_0.40.2.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.38.8.bb
rename to meta/recipes-devtools/vala/vala_0.40.2.bb
index e2baf655596..3176a9127e1 100644
--- a/meta/recipes-devtools/vala/vala_0.38.8.bb
+++ b/meta/recipes-devtools/vala/vala_0.40.2.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "37edd0467d056fd9e3937d0bbceda80b"
-SRC_URI[sha256sum] = "2fa746b51cd66e43577d1da06a80b708c2875cadaafee77e9700ea35cf23882c"
+SRC_URI[md5sum] = "e7d05683bcac0306fc8d7c875eb3fef1"
+SRC_URI[sha256sum] = "75a3dc2de36873d8ceab168b2fde1b2c378a1f7104a3b3391ba3acf579c674b3"
-- 
2.16.1


