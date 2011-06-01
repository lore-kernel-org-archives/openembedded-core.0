Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRert-00041j-H3
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203840"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:59 -0700
Message-Id: <5fdd0f896ae0b3724b843fc09299062660ad97a4.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/32] clutter-1.6: Add patch to update gettext macro version
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
X-List-Received-Date: Wed, 01 Jun 2011 06:36:53 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-graphics/clutter/clutter-1.6_1.6.14.bb |    5 ++-
 .../clutter/update_gettext_macro_version.patch     |   32 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
index 938a30c..555133f 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.14.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/clutter/clutter.inc
 
-PR = "r1"
+PR = "r2"
 
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib"
@@ -9,7 +9,8 @@ PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
 SRC_URI = "http://source.clutter-project.org/sources/clutter/1.6/clutter-${PV}.tar.bz2 \
-           file://enable_tests-1.4.patch"
+           file://enable_tests-1.4.patch \
+           file://update_gettext_macro_version.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 S = "${WORKDIR}/clutter-${PV}"
diff --git a/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch b/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
new file mode 100644
index 0000000..6671098
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: clutter-1.6.14/build/autotools/po.m4
+===================================================================
+--- clutter-1.6.14.orig/build/autotools/po.m4	2011-05-31 22:39:55.000000000 -0700
++++ clutter-1.6.14/build/autotools/po.m4	2011-05-31 22:40:36.898833113 -0700
+@@ -29,7 +29,7 @@
+ 
+   dnl Release version of the gettext macros. This is used to ensure that
+   dnl the gettext macros and po/Makefile.in.in are in sync.
+-  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
+Index: clutter-1.6.14/po/Makefile.in.in
+===================================================================
+--- clutter-1.6.14.orig/po/Makefile.in.in	2011-05-31 22:40:05.000000000 -0700
++++ clutter-1.6.14/po/Makefile.in.in	2011-05-31 22:40:21.030833109 -0700
+@@ -8,8 +8,8 @@
+ # Please note that the actual code of GNU gettext is covered by the GNU
+ # General Public License and is *not* in the public domain.
+ #
+-# Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++# Origin: gettext-0.18
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
-- 
1.7.3.4



