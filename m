Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DABF26A4C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 12:20:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2013 05:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,750,1363158000"; d="scan'208";a="320184293"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2013 05:20:12 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 15:19:55 +0300
Message-Id: <bea61fdd2a8d86adf3db6a1d70935825ab23aff8.1369657070.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
Subject: [PATCH 3/3] autogen-native: upgraded to 5.17.4
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
X-List-Received-Date: Mon, 27 May 2013 12:20:12 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...en-native_5.17.3.bb => autogen-native_5.17.4.bb} |    4 ++--
 meta/recipes-devtools/autogen/files/guile.patch     |   19 +++++++++----------
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.17.3.bb => autogen-native_5.17.4.bb} (90%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.17.3.bb b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
similarity index 90%
rename from meta/recipes-devtools/autogen/autogen-native_5.17.3.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
index b101966..e5234c2 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.17.3.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://guile.patch"
 
-SRC_URI[md5sum] = "2d14ced1c28f71e61bb7c58e93317a40"
-SRC_URI[sha256sum] = "2f795c224fac899ec3a801a9a32aad2a8104fe926dcc1994cc0797f9a3f4e97d"
+SRC_URI[md5sum] = "09f074cba57610bf4ef1147e01c8ae90"
+SRC_URI[sha256sum] = "cd2585f4794d0e9d7f2cb0b9af4f2bd429946e718473edf1cf8c49f081ca71ed"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 RDEPENDS = "automake pkgconfig"
diff --git a/meta/recipes-devtools/autogen/files/guile.patch b/meta/recipes-devtools/autogen/files/guile.patch
index 09b441b..8a77dba 100644
--- a/meta/recipes-devtools/autogen/files/guile.patch
+++ b/meta/recipes-devtools/autogen/files/guile.patch
@@ -1,14 +1,14 @@
-Disable the autoconf macros that use dpkg (!) and guile-config to determine what
-version and where guile is installed, and just use pkg-config directly (guile-config is a deprecated wrapper around pkg-config).
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Pending (should be submitted)
+Disable the autoconf macros that use dpkg (!) and guile-config to determine what 
+version and where guile is installed, and just use pkg-config directly (guile-config is a deprecated wrapper around pkg-config). 
+ 
+ Signed-off-by: Ross Burton <ross.burton@intel.com> 
+ Upstream-Status: Pending (should be submitted)
 
 diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
-index c69b11c..915968b 100644
+index 9914a65..b6db97a 100644
 --- a/config/ag_macros.m4
 +++ b/config/ag_macros.m4
-@@ -175,124 +175,12 @@ return 0;],
+@@ -175,123 +175,12 @@ return 0;],
  
  
  AC_DEFUN([AG_WITHLIB_GUILE],[
@@ -69,8 +69,6 @@ index c69b11c..915968b 100644
 -    test -n "${f}" && ag_cv_with_libguile_libs="${f}" && \
 -      AC_MSG_NOTICE([guile-config used for LIBS: $f]) ;;
 -  esac
--  fi ## disabled by request
--
 -  case "X${ag_cv_with_libguile_cflags}" in
 -  Xyes|Xno|X )
 -    ag_cv_with_libguile_cflags="" ;;
@@ -107,6 +105,7 @@ index c69b11c..915968b 100644
 -    [ag_cv_with_libguile=yes],
 -    [ag_cv_with_libguile=no]) # end of AC_LINK_IFELSE 
 -  ]) # end of AC_CACHE_VAL for ag_cv_with_libguile
+-  fi ## disabled by request
 -  AC_MSG_RESULT([${ag_cv_with_libguile}])
 -    AC_SUBST([LIBGUILE_CFLAGS])
 -    AC_SUBST([LIBGUILE_LIBS])
@@ -138,7 +137,7 @@ index c69b11c..915968b 100644
  ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
  
  
-@@ -312,40 +200,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
+@@ -311,40 +200,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
  
  
  AC_DEFUN([AG_TEST_GUILE_VERSION],[
-- 
1.7.10.4


