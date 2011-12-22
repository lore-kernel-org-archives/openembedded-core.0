Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbz-0005NF-7v
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233740"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:12 -0800
Message-Id: <9d634d7fa355918d42f5279bc2a62c183027f5fd.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/26] texi2html: Upgrade to 5.0
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:47 -0000

Add patch to update GETTEXT_MACRO_VERSION to 0.18

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../texi2html-5.0/fix_gettext_version.patch        |   44 ++++++++++++++++++++
 .../{texi2html_1.82.bb => texi2html_5.0.bb}        |   19 +++++++--
 2 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
 rename meta/recipes-extended/texi2html/{texi2html_1.82.bb => texi2html_5.0.bb} (43%)

diff --git a/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch b/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
new file mode 100644
index 0000000..35c119b
--- /dev/null
+++ b/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
@@ -0,0 +1,44 @@
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: texi2html-5.0/po_document/Makefile.in.in
+===================================================================
+--- texi2html-5.0.orig/po_document/Makefile.in.in
++++ texi2html-5.0/po_document/Makefile.in.in
+@@ -9,7 +9,7 @@
+ # General Public License and is *not* in the public domain.
+ #
+ # Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+Index: texi2html-5.0/po_messages/Makefile.in.in
+===================================================================
+--- texi2html-5.0.orig/po_messages/Makefile.in.in
++++ texi2html-5.0/po_messages/Makefile.in.in
+@@ -9,7 +9,7 @@
+ # General Public License and is *not* in the public domain.
+ #
+ # Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+Index: texi2html-5.0/m4/po.m4
+===================================================================
+--- texi2html-5.0.orig/m4/po.m4
++++ texi2html-5.0/m4/po.m4
+@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
+ 
+   dnl Release version of the gettext macros. This is used to ensure that
+   dnl the gettext macros and po/Makefile.in.in are in sync.
+-  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
diff --git a/meta/recipes-extended/texi2html/texi2html_1.82.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
similarity index 43%
rename from meta/recipes-extended/texi2html/texi2html_1.82.bb
rename to meta/recipes-extended/texi2html/texi2html_5.0.bb
index f19b576..068f8bc 100644
--- a/meta/recipes-extended/texi2html/texi2html_1.82.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -6,9 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r0"
 
-SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2"
+SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2 \
+               file://fix_gettext_version.patch"
 
-SRC_URI[md5sum] = "a8a9193c0ac1bec2f3ca7be40a5a82eb"
-SRC_URI[sha256sum] = "d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1"
+SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
+SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89d9f9fa"
 
-inherit autotools
+inherit autotools gettext
+
+do_configure_prepend() {
+	# Make a directory for the old gettext setup
+	mkdir ${S}/po
+}
+
+do_configure_append() {
+	# Clean up the phony po directory
+	rm -rf ${S}/po
+}
-- 
1.7.6.4



