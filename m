Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgh-0008V7-11
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495947"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:56 -0700
Message-Id: <cb522419501d3191ed678c39f9b7c8c3494eb582.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 17/21] gnutls: Update to 2.12.11
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-fix.patch                            |   40 +++++++++----------
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../gnutls/{gnutls_2.12.5.bb => gnutls_2.12.11.bb} |    4 +-
 4 files changed, 21 insertions(+), 23 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/configure-fix.patch (54%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.5.bb => gnutls_2.12.11.bb} (46%)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch
similarity index 54%
rename from meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch
index e6f9785..14f87e0 100644
--- a/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch
@@ -11,13 +11,13 @@ against 2.8.6
 07/02/2010 - qhe
 
 ---
-Index: gnutls-2.12.5/lib/configure.ac
+Index: gnutls-2.12.11/lib/configure.ac
 ===================================================================
---- gnutls-2.12.5.orig/lib/configure.ac	2011-05-11 00:05:33.000000000 -0700
-+++ gnutls-2.12.5/lib/configure.ac	2011-05-25 19:45:23.721180103 -0700
-@@ -96,8 +96,8 @@
- dnl for pakchois
- AC_LIB_HAVE_LINKFLAGS(dl,, [#include <dlfcn.h>], [dlclose (0);])
+--- gnutls-2.12.11.orig/lib/configure.ac
++++ gnutls-2.12.11/lib/configure.ac
+@@ -126,8 +126,8 @@ lgl_INIT
+ AC_CHECK_FUNCS(getrusage,,)
+ AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_lock (0);])
  
 -LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
 -LIBGNUTLS_CFLAGS="-I${includedir}"
@@ -26,24 +26,22 @@ Index: gnutls-2.12.5/lib/configure.ac
  AC_SUBST(LIBGNUTLS_LIBS)
  AC_SUBST(LIBGNUTLS_CFLAGS)
  
-Index: gnutls-2.12.5/lib/gnutls.pc.in
+Index: gnutls-2.12.11/lib/gnutls.pc.in
 ===================================================================
---- gnutls-2.12.5.orig/lib/gnutls.pc.in	2011-04-23 08:00:07.000000000 -0700
-+++ gnutls-2.12.5/lib/gnutls.pc.in	2011-05-25 19:50:11.926102288 -0700
-@@ -19,7 +19,6 @@
- Description: Transport Security Layer implementation for the GNU system
+--- gnutls-2.12.11.orig/lib/gnutls.pc.in
++++ gnutls-2.12.11/lib/gnutls.pc.in
+@@ -20,6 +20,4 @@ Description: Transport Security Layer im
  URL: http://www.gnu.org/software/gnutls/
  Version: @VERSION@
-+Requires.private: libgcrypt, libtasn1
  Libs: -L${libdir} -lgnutls
--Libs.private: @LTLIBGCRYPT@ @NETTLE_LIBS@
+-Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LIBS_PRIVATE@
 -@GNUTLS_REQUIRES_PRIVATE@
  Cflags: -I${includedir}
-Index: gnutls-2.12.5/libextra/configure.ac
+Index: gnutls-2.12.11/libextra/configure.ac
 ===================================================================
---- gnutls-2.12.5.orig/libextra/configure.ac	2011-05-11 00:05:31.000000000 -0700
-+++ gnutls-2.12.5/libextra/configure.ac	2011-05-25 19:45:23.722186801 -0700
-@@ -41,8 +41,8 @@
+--- gnutls-2.12.11.orig/libextra/configure.ac
++++ gnutls-2.12.11/libextra/configure.ac
+@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
  
  xgl_INIT
  
@@ -54,11 +52,11 @@ Index: gnutls-2.12.5/libextra/configure.ac
  AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
  AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
  
-Index: gnutls-2.12.5/libextra/gnutls-extra.pc.in
+Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
 ===================================================================
---- gnutls-2.12.5.orig/libextra/gnutls-extra.pc.in	2011-04-07 17:30:45.000000000 -0700
-+++ gnutls-2.12.5/libextra/gnutls-extra.pc.in	2011-05-25 19:45:23.722186801 -0700
-@@ -22,5 +22,5 @@
+--- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
++++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
+@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
  Requires: gnutls
  Version: @VERSION@
  Libs: -L${libdir} -lgnutls-extra
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.5.bb b/meta/recipes-support/gnutls/gnutls_2.12.11.bb
similarity index 46%
rename from meta/recipes-support/gnutls/gnutls_2.12.5.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.11.bb
index 9d3f5ab..bd5ebb3 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.11.bb
@@ -5,5 +5,5 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch"
 
-SRC_URI[md5sum] = "2d0bd5ae11534074fcd78da6ea384e64"
-SRC_URI[sha256sum] = "bf263880f327ac34a561d8e66b5a729cbe33eea56728bfed3406ff2898448b60"
+SRC_URI[md5sum] = "f08234b64a8025d6d5aa1307868b02ed"
+SRC_URI[sha256sum] = "00b58e1aafe99bbd0cb371e7f1df9cc58bf807301cf70a7eebedeee093991360"
-- 
1.7.6.2



