Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3456F610E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:32:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2013 11:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,964,1371106800"; d="scan'208";a="405975714"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 11:31:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 11:31:55 -0700
Message-Id: <1379961116-29929-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379961116-29929-1-git-send-email-sgw@linux.intel.com>
References: <1379961116-29929-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] wget: remove po.m4 patch
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
X-List-Received-Date: Mon, 23 Sep 2013 18:32:01 -0000

With the seperation of the sourcedir (S) and builddir (B), the po.m4 file is
removed from S during autotools aclocal-copy creation and there no need to
patch it since the aclocal-copy version is correct (has gettext version 0.18
specificed

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/wget/wget-1.14/fix_makefile.patch | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch b/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
index b76a017..8ad7c62 100644
--- a/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
+++ b/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
@@ -31,16 +31,3 @@ Index: wget-1.12/configure.ac
  
  AC_PROG_RANLIB
  
-Index: wget-1.12/m4/po.m4
-===================================================================
---- wget-1.12.orig/m4/po.m4	2009-09-04 09:31:54.000000000 -0700
-+++ wget-1.12/m4/po.m4	2011-10-19 20:33:53.426812176 -0700
-@@ -30,7 +30,7 @@
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


