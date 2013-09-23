Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDB7610D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:32:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2013 11:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,964,1371106800"; d="scan'208";a="405975710"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 11:31:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 11:31:54 -0700
Message-Id: <1379961116-29929-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379961116-29929-1-git-send-email-sgw@linux.intel.com>
References: <1379961116-29929-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3] texi2html: remove po.m4 patch
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
X-List-Received-Date: Mon, 23 Sep 2013 18:32:00 -0000

With the seperation of the sourcedir (S) and builddir (B), the po.m4 file is
removed from S during autotools aclocal-copy creation and there no need to
patch it since the aclocal-copy version is correct (has gettext version 0.18
specificed

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../texi2html/texi2html-5.0/fix_gettext_version.patch       | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch b/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
index 35c119b..d1c9fe5 100644
--- a/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
+++ b/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
@@ -29,16 +29,3 @@ Index: texi2html-5.0/po_messages/Makefile.in.in
  
  PACKAGE = @PACKAGE@
  VERSION = @VERSION@
-Index: texi2html-5.0/m4/po.m4
-===================================================================
---- texi2html-5.0.orig/m4/po.m4
-+++ texi2html-5.0/m4/po.m4
-@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
- 
-   dnl Release version of the gettext macros. This is used to ensure that
-   dnl the gettext macros and po/Makefile.in.in are in sync.
--  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
-+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
- 
-   dnl Perform the following tests also if --disable-nls has been given,
-   dnl because they are needed for "make dist" to work.
-- 
1.8.3.1


