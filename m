Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWNe-00059S-Fs
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:31:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 23:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="682838231"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 23:29:03 -0700
Message-Id: <93e699efd90a11677d32434f9c41fe08c25f0160.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:06:08 +0800
Date: Fri, 22 Apr 2011 23:29:02 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 11/37] util-macros: upgrade from 1.11.0 to 1.13.0
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
X-List-Received-Date: Sat, 23 Apr 2011 06:31:46 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

removed xaw.patch since it's not used by any recipe now.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../xorg-util/util-macros/xaw.patch                |   14 --------------
 ...util-macros_1.11.0.bb => util-macros_1.13.0.bb} |    4 ++--
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-util/util-macros/xaw.patch
 rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb => util-macros_1.13.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros/xaw.patch b/meta/recipes-graphics/xorg-util/util-macros/xaw.patch
deleted file mode 100644
index 8b39869..0000000
--- a/meta/recipes-graphics/xorg-util/util-macros/xaw.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: util-macros-1.2.1/xorg-macros.m4.in
-===================================================================
---- util-macros-1.2.1.orig/xorg-macros.m4.in	2009-01-15 13:49:56.000000000 +0000
-+++ util-macros-1.2.1/xorg-macros.m4.in	2009-01-15 13:52:22.000000000 +0000
-@@ -456,3 +456,9 @@
- fi
- AC_SUBST(CWARNFLAGS)
- ]) # XORG_CWARNFLAGS
-+
-+AC_DEFUN([XAW_CHECK_XPRINT_SUPPORT], [
-+PKG_CHECK_MODULES(TMP_XAW, xaw7)
-+$1_CFLAGS=$TMP_XAW_CFLAGS
-+$1_LIBS=$TMP_XAW_LIBS
-+])
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
index 765a577..a708ed0 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
@@ -20,5 +20,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
-SRC_URI[sha256sum] = "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
+SRC_URI[md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
+SRC_URI[sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
-- 
1.7.1.1



