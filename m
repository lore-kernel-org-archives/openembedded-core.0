Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TgEge-000106-Kw
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:06:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 04:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="229266803"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 04:52:28 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 14:57:38 +0200
Message-Id: <ccdff41de5bcc1b1824af4a9384dbbc225b067aa.1354711738.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
Subject: [PATCH 4/4] curl: upgrade to 7.27.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 13:06:52 -0000

From: Constantin Musca <constantinx.musca@intel.com>

pkgconfig_fix.patch: Adapted to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |   25 +++++++++-----------
 .../curl/{curl_7.26.0.bb => curl_7.27.0.bb}        |    6 ++---
 2 files changed, 14 insertions(+), 17 deletions(-)
 rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.27.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
index ad73c00..f156cb4 100644
--- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
+++ b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
@@ -1,11 +1,8 @@
-Upstream-Status: Inappropriate [packaging]
-
-
-Index: curl-7.20.0/libcurl.pc.in
+Index: curl-7.27.0/libcurl.pc.in
 ===================================================================
---- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
-+++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
-@@ -35,6 +35,7 @@
+--- curl-7.27.0.orig/libcurl.pc.in
++++ curl-7.27.0/libcurl.pc.in
+@@ -34,6 +34,7 @@ Name: libcurl
  URL: http://curl.haxx.se/
  Description: Library to transfer files with ftp, http, etc.
  Version: @CURLVERSION@
@@ -14,12 +11,12 @@ Index: curl-7.20.0/libcurl.pc.in
 +Requires.private: @GNUTLS_REQUIRED@
 +Libs: -L${libdir} -lcurl
 +Libs.private: -ldl -lz
- Cflags: -I${includedir}
-Index: curl-7.20.0/configure.ac
+ Cflags: -I${includedir} @CPPFLAG_CURL_STATICLIB@
+Index: curl-7.27.0/configure.ac
 ===================================================================
---- curl-7.20.0.orig/configure.ac	2010-02-04 21:41:46.000000000 +0000
-+++ curl-7.20.0/configure.ac	2010-03-25 12:12:18.673129001 +0000
-@@ -1668,6 +1668,7 @@
+--- curl-7.27.0.orig/configure.ac
++++ curl-7.27.0/configure.ac
+@@ -1863,6 +1863,7 @@ if test "$curl_ssl_msg" = "$init_ssl_msg
         AC_SUBST(USE_GNUTLS, [1])
         GNUTLS_ENABLED=1
         USE_GNUTLS="yes"
@@ -27,9 +24,9 @@ Index: curl-7.20.0/configure.ac
         curl_ssl_msg="enabled (GnuTLS)"
         ],
         [
-@@ -1696,6 +1697,8 @@
+@@ -2102,6 +2103,8 @@ if test "$curl_ssl_msg" = "$init_ssl_msg
  
- fi dnl OPENSSL != 1
+ fi
  
 +AC_SUBST(GNUTLS_REQUIRED)
 +
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.27.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.26.0.bb
rename to meta/recipes-support/curl/curl_7.27.0.bb
index fef247c..2ba7837 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.27.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_class-native = "zlib-native openssl-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch"
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
-SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
+SRC_URI[md5sum] = "11fcbfc0de9c12512e607e7d72d500a0"
+SRC_URI[sha256sum] = "aba5582135c28470b46084da9747470c1c680485fc91f9f0d3f7928df8169398"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5



