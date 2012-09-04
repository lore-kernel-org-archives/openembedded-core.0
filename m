Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T8naZ-0007t9-93
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 09:30:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Sep 2012 00:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,365,1344236400"; d="scan'208";a="188475522"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 04 Sep 2012 00:17:59 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 10:20:42 +0300
Message-Id: <1346743242-10214-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] curl: update to upstream version 7.27.0
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
X-List-Received-Date: Tue, 04 Sep 2012 07:30:23 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |   24 ++++++++++----------
 .../curl/{curl_7.26.0.bb => curl_7.27.0.bb}        |    4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.27.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
index ad73c00..20efd67 100644
--- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
+++ b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
@@ -1,11 +1,11 @@
 Upstream-Status: Inappropriate [packaging]
+Signed-off-by: Radu Moisan <radu.moisan@intel.com> 
 
-
-Index: curl-7.20.0/libcurl.pc.in
+Index: curl-7.27.0/libcurl.pc.in
 ===================================================================
---- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
-+++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
-@@ -35,6 +35,7 @@
+--- curl-7.27.0.orig/libcurl.pc.in	2012-05-26 00:56:17.000000000 +0300
++++ curl-7.27.0/libcurl.pc.in	2012-08-08 11:30:41.000000000 +0300
+@@ -34,6 +34,7 @@
  URL: http://curl.haxx.se/
  Description: Library to transfer files with ftp, http, etc.
  Version: @CURLVERSION@
@@ -14,12 +14,12 @@ Index: curl-7.20.0/libcurl.pc.in
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
+--- curl-7.27.0.orig/configure.ac	2012-07-27 21:25:09.000000000 +0300
++++ curl-7.27.0/configure.ac	2012-08-08 11:45:06.000000000 +0300
+@@ -1863,6 +1863,7 @@
         AC_SUBST(USE_GNUTLS, [1])
         GNUTLS_ENABLED=1
         USE_GNUTLS="yes"
@@ -27,9 +27,9 @@ Index: curl-7.20.0/configure.ac
         curl_ssl_msg="enabled (GnuTLS)"
         ],
         [
-@@ -1696,6 +1697,8 @@
+@@ -2102,6 +2103,8 @@
  
- fi dnl OPENSSL != 1
+ fi
  
 +AC_SUBST(GNUTLS_REQUIRED)
 +
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.27.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.26.0.bb
rename to meta/recipes-support/curl/curl_7.27.0.bb
index dad5572..2391630 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.27.0.bb
@@ -13,8 +13,8 @@ PR = "r1"
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
-SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
+SRC_URI[md5sum] = "11fcbfc0de9c12512e607e7d72d500a0"
+SRC_URI[sha256sum] = "aba5582135c28470b46084da9747470c1c680485fc91f9f0d3f7928df8169398"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.9.5



