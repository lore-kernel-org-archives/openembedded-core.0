Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 78A536F751
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:20:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2014 08:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,721,1389772800"; d="scan'208";a="506414747"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.64])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2014 08:19:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2014 15:18:52 +0000
Message-Id: <7ccd1ebc2fbcb46d6fdeac032263e11a41ea74ea.1395674266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395674266.git.paul.eggleton@linux.intel.com>
References: <cover.1395674266.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395674266.git.paul.eggleton@linux.intel.com>
References: <cover.1395674266.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/binconfig: fix indentation in python function
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
X-List-Received-Date: Mon, 24 Mar 2014 15:20:15 -0000

If we don't fix this, the recently added dependency from
do_populate_sysroot on functions in SYSROOT_PREPROCESS_FUNCS in
staging.bbclass triggers warnings that the get_binconfig_mangle
function contains tabs for all recipes that inherit binconfig.

Related to fix for [YOCTO #5852].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/binconfig.bbclass | 44 +++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 848c744..7158c8c 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -2,29 +2,29 @@ FILES_${PN}-dev += "${bindir}/*-config"
  
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
-	s = "-e ''"
-	if not bb.data.inherits_class('native', d):
-		optional_quote = r"\(\"\?\)"
-		s += " -e 's:=%s${base_libdir}:=\\1OEBASELIBDIR:;'" % optional_quote
-		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
-		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
-		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
-		s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
-		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
-		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
-		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
-		s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
-		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-		s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
-		s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
-		s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
-		s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
-		s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
-		s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
-		if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
-			s += bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d)
+    s = "-e ''"
+    if not bb.data.inherits_class('native', d):
+        optional_quote = r"\(\"\?\)"
+        s += " -e 's:=%s${base_libdir}:=\\1OEBASELIBDIR:;'" % optional_quote
+        s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
+        s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
+        s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
+        s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
+        s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
+        s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
+        s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
+        s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
+        s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
+        s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
+        s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
+        s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
+        s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
+        s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
+        s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
+        if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
+            s += bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d)
 
-	return s
+    return s
 
 BINCONFIG_GLOB ?= "*-config"
 
-- 
1.8.5.3


