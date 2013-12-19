Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C681260DFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:32:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2013 01:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="454758878"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 01:32:20 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 11:34:52 +0200
Message-Id: <26d43a93974dad769d4e3992b9f1b6f5f75acd11.1387445582.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1387445582.git.cristian.iorga@intel.com>
References: <cover.1387445582.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1387445582.git.cristian.iorga@intel.com>
References: <cover.1387445582.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/1] libtirpc: upgrade to 0.2.4
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
X-List-Received-Date: Thu, 19 Dec 2013 09:32:32 -0000

obsolete_automake_macros.patch removed,
no longer needed.
Disabled GSS APIs, as those APIs are
not present in our distro.
Patches directory is now generic,
as patches are not created for a specific version.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libtirpc-0.2.3/obsolete_automake_macros.patch         | 15 ---------------
 .../libtirpc-0.2.1-fortify.patch                          |  0
 .../{libtirpc-0.2.3 => libtirpc}/remove-des-uclibc.patch  |  0
 .../libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb}     |  8 +++++---
 4 files changed, 5 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb} (84%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
deleted file mode 100644
index 88d759f..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libtirpc-0.2.2/configure.ac libtirpc-0.2.2/configure.ac
---- libtirpc-0.2.2/configure.ac	2011-05-02 15:10:40.000000000 +0300
-+++ libtirpc-0.2.2/configure.ac	2013-01-11 15:11:24.275000030 +0200
-@@ -17,7 +17,7 @@
- fi
-
- AC_PROG_CC
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AC_PROG_LIBTOOL
- AC_HEADER_DIRENT
- AC_PREFIX_DEFAULT(/usr)
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc/libtirpc-0.2.1-fortify.patch
similarity index 100%
rename from meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch
rename to meta/recipes-extended/libtirpc/libtirpc/libtirpc-0.2.1-fortify.patch
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
similarity index 100%
rename from meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
rename to meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
similarity index 84%
rename from meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
rename to meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
index 407e38e..88e2d82 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
@@ -13,17 +13,19 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-0.2.1-fortify.patch \
-           file://obsolete_automake_macros.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
 
-SRC_URI[libtirpc.md5sum] = "b70e6c12a369a91e69fcc3b9feb23d61"
-SRC_URI[libtirpc.sha256sum] = "4f29ea0491b4ca4c29f95f3c34191b857757873bbbf4b069f9dd4da01a6a923c"
+SRC_URI[libtirpc.md5sum] = "847995e8d002cbf1387bda05947be086"
+SRC_URI[libtirpc.sha256sum] = "45c3e21dfc23a5ba501f9dfc6671678316fdfdb8355a1ec404ae2aa2f81943a1"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
 SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
+
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--disable-gssapi"
+
 do_configure_prepend () {
         cp -r ${S}/../tirpc ${S}
 }
-- 
1.8.3.2


