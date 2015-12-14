Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 72F7F73183
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064259"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:31 +0200
Message-Id: <f13a78259ba7cc03038c63b8fd94f2dde9ff0ee9.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/20] procps: update to 3.3.11
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:20 -0000

fix-configure.patch was fixing lines that have been removed upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../procps/procps/fix-configure.patch                 | 19 -------------------
 .../procps/{procps_3.3.10.bb => procps_3.3.11.bb}     |  5 ++---
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/fix-configure.patch
 rename meta/recipes-extended/procps/{procps_3.3.10.bb => procps_3.3.11.bb} (93%)

diff --git a/meta/recipes-extended/procps/procps/fix-configure.patch b/meta/recipes-extended/procps/procps/fix-configure.patch
deleted file mode 100644
index 934ae80..0000000
--- a/meta/recipes-extended/procps/procps/fix-configure.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-exec_prefix is /usr default in OE-Core
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: procps-ng-3.3.10/configure.ac
-===================================================================
---- procps-ng-3.3.10.orig/configure.ac
-+++ procps-ng-3.3.10/configure.ac
-@@ -70,7 +70,7 @@ AC_FUNC_MMAP
- AC_FUNC_REALLOC
- AC_FUNC_STRTOD
- 
--usrbin_execdir='${exec_prefix}/usr/bin'
-+usrbin_execdir='${exec_prefix}/bin'
- AC_SUBST([usrbin_execdir])
- 
- AM_GNU_GETTEXT_VERSION([0.14.1])
diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.11.bb
similarity index 93%
rename from meta/recipes-extended/procps/procps_3.3.10.bb
rename to meta/recipes-extended/procps/procps_3.3.11.bb
index dcfaba7..3d8e13d 100644
--- a/meta/recipes-extended/procps/procps_3.3.10.bb
+++ b/meta/recipes-extended/procps/procps_3.3.11.bb
@@ -13,12 +13,11 @@ DEPENDS = "ncurses"
 inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
-           file://fix-configure.patch \
            file://sysctl.conf \
           "
 
-SRC_URI[md5sum] = "1fb7f3f6bf92ce6c5c9ed9949ae858fe"
-SRC_URI[sha256sum] = "a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f267f04"
+SRC_URI[md5sum] = "6cc5b94c1c5b8cbc89ad345a7b522f74"
+SRC_URI[sha256sum] = "e9493169a2d2adc0bc045538707310c8e877b385e4e296143b62607d2bb044ed"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.6.2


