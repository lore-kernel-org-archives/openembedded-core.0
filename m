Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A57FB71A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 9A077404A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 11:33:32 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 11:33:26 +0200
Message-Id: <1494408806-5348-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] mpeg2dec: upgrade to version 0.5.1
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
X-List-Received-Date: Wed, 10 May 2017 09:33:33 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{mpeg2dec-0.4.1 => files}/altivec_h_needed.patch       |  8 ++++----
 .../mpeg2dec/{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb}      | 14 ++++++++------
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec-0.4.1 => files}/altivec_h_needed.patch (86%)
 rename meta/recipes-multimedia/mpeg2dec/{mpeg2dec_0.4.1.bb => mpeg2dec_0.5.1.bb} (79%)

diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec-0.4.1/altivec_h_needed.patch b/meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch
similarity index 86%
rename from meta/recipes-multimedia/mpeg2dec/mpeg2dec-0.4.1/altivec_h_needed.patch
rename to meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch
index 7dc5643..5113ad4 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec-0.4.1/altivec_h_needed.patch
+++ b/meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch
@@ -24,10 +24,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
-diff -ruN mpeg2dec-0.4.1-orig/configure.in mpeg2dec-0.4.1/configure.in
---- mpeg2dec-0.4.1-orig/configure.in	2010-09-14 20:55:42.399687663 +0800
-+++ mpeg2dec-0.4.1/configure.in	2010-09-14 20:56:43.403204648 +0800
-@@ -75,11 +75,11 @@
+diff -ruN a/configure.in b/configure.in
+--- a/configure.ac	2010-09-14 20:55:42.399687663 +0800
++++ b/configure.ac	2010-09-14 20:56:43.403204648 +0800
+@@ -79,11 +79,11 @@
  		 CFLAGS="$OPT_CFLAGS $TRY_CFLAGS $CFLAGS"
  		 AC_MSG_CHECKING([if <altivec.h> is needed])
  		 AC_TRY_COMPILE([],
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
similarity index 79%
rename from meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
rename to meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index fe765da..8e995da 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -4,15 +4,15 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
+                    file://include/mpeg2.h;beginline=1;endline=22;md5=7766f4fcb58f0f8413c49a746f2ab89b"
 
-PR = "r2"
-
-SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
+SRC_URI = "http://libmpeg2.sourceforge.net/files/libmpeg2-${PV}.tar.gz \
            file://altivec_h_needed.patch"
 
-SRC_URI[md5sum] = "7631b0a4bcfdd0d78c0bb0083080b0dc"
-SRC_URI[sha256sum] = "c74a76068f8ec36d4bb59a03bf1157be44118ca02252180e8b358b0b5e3edeee"
+S = "${WORKDIR}/libmpeg2-${PV}"
+
+SRC_URI[md5sum] = "0f92c7454e58379b4a5a378485bbd8ef"
+SRC_URI[sha256sum] = "dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4"
 
 UPSTREAM_CHECK_URI = "http://libmpeg2.sourceforge.net/downloads.html"
 
@@ -30,11 +30,13 @@ FILES_libmpeg2 = "${libdir}/libmpeg2.so.*"
 FILES_libmpeg2convert = "${libdir}/libmpeg2convert.so.*"
 FILES_libmpeg2-dev = "${libdir}/libmpeg2.so \
                       ${libdir}/libmpeg2.la \
+                      ${libdir}/libmpeg2arch.la \
                       ${libdir}/pkgconfig/libmpeg2.pc \
                       ${includedir}/mpeg2dec/mpeg2.h"
 FILES_libmpeg2-staticdev = "${libdir}/libmpeg2.a"
 FILES_libmpeg2convert-dev = "${libdir}/libmpeg2convert.so \
                              ${libdir}/libmpeg2convert.la \
+                             ${libdir}/libmpeg2convertarch.la \
                              ${libdir}/pkgconfig/libmpeg2convert.pc \
                              ${includedir}/mpeg2dec/mpeg2convert.h"
 FILES_libmpeg2convert-staticdev = "${libdir}/libmpeg2convert.a"
-- 
2.7.4


