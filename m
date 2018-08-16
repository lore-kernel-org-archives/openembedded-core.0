Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BABD79260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:39:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2018 03:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,246,1531810800"; d="scan'208";a="65370172"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 16 Aug 2018 03:39:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id EAEC058040F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 03:39:46 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 13:41:30 +0300
Message-Id: <1534416090-26515-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] vala: refresh patch
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
X-List-Received-Date: Thu, 16 Aug 2018 10:39:46 -0000

Refresh the following patch:
"disable-graphviz.patch" to fix this warning:

Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
        checking file configure.ac
        checking file libvaladoc/Makefile.am
        checking file libvaladoc/html/basicdoclet.vala
        checking file libvaladoc/html/htmlmarkupwriter.vala
        Hunk #1 succeeded at 51 with fuzz 1 (offset 8 lines).

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/vala/vala/disable-graphviz.patch | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
index 8fb94dc..e7e38c7 100644
--- a/meta/recipes-devtools/vala/vala/disable-graphviz.patch
+++ b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
@@ -1,7 +1,8 @@
-From 500f4220f79c660a70a1ffc0d5b762d70088af5e Mon Sep 17 00:00:00 2001
+From 5ae347907b8c65983365a6325ac990fcde28d508 Mon Sep 17 00:00:00 2001
 From: Rico Tzschichholz <ricotz@ubuntu.com>
 Date: Wed, 6 Sep 2017 18:52:55 +0200
 Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
+
  valadoc
 
 https://bugzilla.gnome.org/show_bug.cgi?id=787375
@@ -16,7 +17,7 @@ Upstream-Status: Submitted [bugzilla link above]
  4 files changed, 63 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 662180b..82d7015 100644
+index 694ffd2..9150620 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -112,34 +112,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
@@ -159,7 +160,7 @@ index 384292f..cce50d8 100644
  EXTRA_DIST = \
  	$(libvaladoc_la_VALASOURCES) \
 diff --git a/libvaladoc/html/basicdoclet.vala b/libvaladoc/html/basicdoclet.vala
-index cc9ea4e..432c381 100644
+index 37c731c..e0326ef 100644
 --- a/libvaladoc/html/basicdoclet.vala
 +++ b/libvaladoc/html/basicdoclet.vala
 @@ -46,7 +46,11 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
@@ -201,11 +202,11 @@ index cc9ea4e..432c381 100644
  
  	public void write_namespace_content (Namespace node, Api.Node? parent) {
 diff --git a/libvaladoc/html/htmlmarkupwriter.vala b/libvaladoc/html/htmlmarkupwriter.vala
-index 15ed9ef..fe0d705 100644
+index dcc4dad..cf9c860 100644
 --- a/libvaladoc/html/htmlmarkupwriter.vala
 +++ b/libvaladoc/html/htmlmarkupwriter.vala
-@@ -43,12 +43,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
- 		}, xml_declaration);
+@@ -51,12 +51,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
+ 		}
  	}
  
 +#if HAVE_GRAPHVIZ
-- 
2.4.0


