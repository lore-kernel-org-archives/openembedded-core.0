Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzv-0000cy-LC
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 01:17:59 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 01:17:58 -0700
Message-Id: <c70333412b57c5ec8fc79a28ca975588b4a625cb.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 17:34:13 -0700
Date: Wed, 18 May 2011  1:17:58 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 11/15] recipes: add Upstream-Status to various recipe patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 08:20:56 -0000

From: Scott Garman <scott.a.garman@intel.com>

Add Upstream-Status tag to patches for the following recipes:

apmd
insserv
linuxdoc-tools
openjade
sgmlspl
at
sudo

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch  |   28 +++++++++++--------
 meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch  |   20 ++++++++-----
 .../insserv/files/disable_runtests.patch           |   11 +++++---
 meta/recipes-devtools/insserv/files/makefile.patch |   11 +++++---
 .../linuxdoc-tools-native/disable_dvips_doc.patch  |    4 +++
 .../linuxdoc-tools-native/disable_sgml2rtf.patch   |    4 +++
 .../linuxdoc-tools-native/disable_tex_doc.patch    |    4 +++
 .../linuxdoc-tools-native/disable_txt_doc.patch    |    4 +++
 .../openjade/openjade-1.3.2/makefile.patch         |    4 +++
 .../user-declared-default-constructor.patch        |    4 +++
 meta/recipes-devtools/sgmlspl/files/combined.patch |    3 ++
 meta/recipes-extended/sudo/files/libtool.patch     |    2 +-
 12 files changed, 70 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch b/meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch
index 711e777..834ee08 100644
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch
@@ -1,15 +1,19 @@
-# Add by RP to address "unable to infer tagged configuration" error:
-#    commit 35de05e61b88c0808a5e885bb0efdf420555d5ad
-#    Author: Richard Purdie <rpurdie@rpsys.net>
-#    Date:   Sun Jun 1 16:13:38 2008 +0000
-#
-#    apmd: Use libtool --tag options to avoid problems with libtool 2.2.4 (from poky)
-#
-# However I didn't see same issue with current libtool-2.2.10. Also per my understanding,
-# the default tag, if not specified, falls back to CC. So disable it from patching, but
-# keep it here. If we encounter similar issue in the future, we could then push upstream
-#
-# Comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-16
+Add by RP to address "unable to infer tagged configuration" error:
+   commit 35de05e61b88c0808a5e885bb0efdf420555d5ad
+   Author: Richard Purdie <rpurdie@rpsys.net>
+   Date:   Sun Jun 1 16:13:38 2008 +0000
+
+   apmd: Use libtool --tag options to avoid problems with libtool 2.2.4 (from poky)
+
+However I didn't see same issue with current libtool-2.2.10. Also per my understanding,
+the default tag, if not specified, falls back to CC. So disable it from patching, but
+keep it here. If we encounter similar issue in the future, we could then push upstream
+
+Comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-16
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 Index: apmd-3.2.2.orig/Makefile
 ===================================================================
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch b/meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch
index c64e7df..ec8206c 100644
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch
@@ -1,11 +1,15 @@
-# copy OE commit message here:
-#    commit 9456cdc1cf43e3ba9e6d88c63560c1b6fdee4359
-#    Author: Michael Krelin <hacker@klever.net>
-#    Date:   Tue May 29 12:27:45 2007 +0000
-#
-#    apmd: prevent build from interferring with host kernel headers. Closes #1257
-# 
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-13
+copy OE commit message here:
+   commit 9456cdc1cf43e3ba9e6d88c63560c1b6fdee4359
+   Author: Michael Krelin <hacker@klever.net>
+   Date:   Tue May 29 12:27:45 2007 +0000
+
+   apmd: prevent build from interferring with host kernel headers. Closes #1257
+
+comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-13
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 --- apmd-3.2.2.orig/Makefile
 +++ apmd-3.2.2/Makefile
diff --git a/meta/recipes-devtools/insserv/files/disable_runtests.patch b/meta/recipes-devtools/insserv/files/disable_runtests.patch
index 4e40848..15a7dd8 100644
--- a/meta/recipes-devtools/insserv/files/disable_runtests.patch
+++ b/meta/recipes-devtools/insserv/files/disable_runtests.patch
@@ -1,7 +1,10 @@
-# Disable the make check runtime tests, which cannot be run when
-# cross-compiled.
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Disable the make check runtime tests, which cannot be run when
+cross-compiled.
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN insserv-1.14.0.orig//Makefile insserv-1.14.0/Makefile
 --- insserv-1.14.0.orig//Makefile	2010-11-28 17:12:01.715597293 -0800
 +++ insserv-1.14.0/Makefile	2010-11-28 17:16:33.837780660 -0800
diff --git a/meta/recipes-devtools/insserv/files/makefile.patch b/meta/recipes-devtools/insserv/files/makefile.patch
index 19e99c6..5a248b6 100644
--- a/meta/recipes-devtools/insserv/files/makefile.patch
+++ b/meta/recipes-devtools/insserv/files/makefile.patch
@@ -1,7 +1,10 @@
-# Enable debug options and modify the use of CLFAGS (carried over
-# from the previous version's patch).
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Enable debug options and modify the use of CLFAGS (carried over
+from the previous version's patch).
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN insserv-1.14.0.orig//Makefile insserv-1.14.0//Makefile
 --- insserv-1.14.0.orig//Makefile	2010-04-29 03:33:40.000000000 -0700
 +++ insserv-1.14.0//Makefile	2010-11-28 17:09:20.537996190 -0800
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
index 7ac1a1f..490b367 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
@@ -2,7 +2,11 @@ Disable building documentation which requires the dvips utility.
 This patch should be dropped once we include a native version of
 dvips.
 
+Upstream-Status: Inappropriate [Other]
+Temporary workaround which disables documentation.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
 --- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2011-02-25 15:26:41.142917782 -0800
 +++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:27:25.141917472 -0800
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
index 0fcaceb..424410d 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
@@ -3,7 +3,11 @@ link to a shared library version of flex. Flex only ships with a
 static lib. Rather than diverging from upstream flex, simply skip
 building this un-needed utility.
 
+Upstream-Status: Inappropriate [Other]
+Workaround which disables a feature.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN linuxdoc-tools-0.9.66.orig//Makefile.in linuxdoc-tools-0.9.66/Makefile.in
 --- linuxdoc-tools-0.9.66.orig//Makefile.in	2009-11-09 11:58:25.000000000 -0800
 +++ linuxdoc-tools-0.9.66/Makefile.in	2011-02-24 15:37:46.556937051 -0800
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
index f47693b..b62895c 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
@@ -2,7 +2,11 @@ Disable building documentation which requires the latex utility.
 This patch should be dropped once we include a native version of
 latex.
 
+Upstream-Status: Inappropriate [Other]
+Temporary workaround which disables documentation.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
 --- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2009-11-09 11:58:25.000000000 -0800
 +++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:23:58.610016114 -0800
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch
index 17c7670..8d78411 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch
@@ -9,7 +9,11 @@ during do_install:
 | troff: fatal error: can't find macro file s
 |  fmt_txt::postASP: Empty output file, error when calling groff. Aborting...
 
+Upstream-Status: Inappropriate [Other]
+Temporary workaround which disables documentation.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN linuxdoc-tools-0.9.66.orig//doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
 --- linuxdoc-tools-0.9.66.orig//doc/Makedoc.sh	2009-11-09 11:58:25.000000000 -0800
 +++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-03-04 17:37:24.788923998 -0800
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
index 84e1d63..968b9b4 100644
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
@@ -1,7 +1,11 @@
 This patch fixes libtool QA issues with WORKDIR creeping in to
 libospgrove.la and libostyle.la. Patch obtained from OpenEmbedded.
 
+Upstream-Status: Inappropriate [Other]
+Workaround is specific to our build system.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: openjade-1.3.2/spgrove/Makefile.sub
 ===================================================================
 --- openjade-1.3.2.orig/spgrove/Makefile.sub
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
index 2f2adfe..073af46 100644
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
@@ -12,6 +12,10 @@ https://bugs.gentoo.org/358021
 http://clang.llvm.org/compatibility.html#default_init_const
 http://gcc.gnu.org/PR44499"
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- a/jade/TeXFOTBuilder.cxx
 +++ b/jade/TeXFOTBuilder.cxx
 @@ -88,6 +88,8 @@ public:
diff --git a/meta/recipes-devtools/sgmlspl/files/combined.patch b/meta/recipes-devtools/sgmlspl/files/combined.patch
index 31536f5..bea3dab 100644
--- a/meta/recipes-devtools/sgmlspl/files/combined.patch
+++ b/meta/recipes-devtools/sgmlspl/files/combined.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- libsgmls-perl-1.03ii.orig/Makefile
 +++ libsgmls-perl-1.03ii/Makefile
 @@ -94,5 +94,5 @@
diff --git a/meta/recipes-extended/sudo/files/libtool.patch b/meta/recipes-extended/sudo/files/libtool.patch
index 22fda53..b0cd675 100644
--- a/meta/recipes-extended/sudo/files/libtool.patch
+++ b/meta/recipes-extended/sudo/files/libtool.patch
@@ -1,7 +1,7 @@
 Fix path to libtool scripts so autoreconf can succeed.
 
 Upstream-Status: Inappropriate [Other]
-Workaround specific to our build system.
+Workaround is specific to our build system.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-- 
1.7.3.4



