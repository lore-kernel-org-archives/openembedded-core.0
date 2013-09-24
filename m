Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 412896CAC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 15:09:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Sep 2013 08:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="382857695"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2013 08:09:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 08:09:58 -0700
Message-Id: <1380035398-32760-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1380035398-32760-1-git-send-email-sgw@linux.intel.com>
References: <1380035398-32760-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] wget: remove po.m4 patch
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
X-List-Received-Date: Tue, 24 Sep 2013 15:09:59 -0000

With the seperation of the sourcedir (S) and builddir (B), the po.m4 file
is removed from S during autotools do_configure() so there no need to patch
it since the version aclocal-copy version is correct (has gettext version
0.18 specificed.

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


