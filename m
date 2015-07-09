Return-Path: <prvs=163270e187=steffen.pankratz@elektrobit.com>
X-Greylist: delayed 1825 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Jul 2015 14:12:12 UTC
Received: from smtpgwcipde.automotive.elektrobit.c
	(smtpgwcipde.automotive.elektrobit.com [213.95.163.141])
	by mail.openembedded.org (Postfix) with ESMTP id 44B2865CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:12:12 +0000 (UTC)
Received: from denue6es002.localdomain ([213.95.163.135])
	by denue6es004.ebgroup.elektrobit.com with ESMTP id
	t69DflES032417-t69DflEU032417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 15:41:47 +0200
Received: from denue6es002. (localhost [127.0.0.1])
	by denue6es002.localdomain (Postfix) with SMTP id F40DA19284
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:41:46 +0200 (CEST)
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by denue6es002.localdomain (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:41:46 +0200 (CEST)
Received: from vagrant-ubuntu-trusty-64.ebgroup.elektrobit.com (10.0.26.198)
	by deeres07.ebgroup.elektrobit.com (10.0.10.10) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 9 Jul 2015 15:41:46 +0200
From: Steffen Pankratz <steffen.pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jul 2015 13:41:35 +0000
Message-ID: <1436449295-31251-2-git-send-email-steffen.pankratz@elektrobit.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436449295-31251-1-git-send-email-steffen.pankratz@elektrobit.com>
References: <CAJTo0LbFvNiD5fbLkHF37SPCGJJ-5fGBxGdXKQ5yy5gD=Uh=sw@mail.gmail.com>
	<1436449295-31251-1-git-send-email-steffen.pankratz@elektrobit.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.26.198]
Subject: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Thu, 09 Jul 2015 14:12:17 -0000
Content-Type: text/plain

Signed-off-by: Steffen Pankratz <steffen.pankratz@elektrobit.com>
---
 .../recipes-graphics/drm/libdrm/installtests.patch |  8 ++---
 meta/recipes-graphics/drm/libdrm_2.4.59.bb         | 41 ---------------------
 meta/recipes-graphics/drm/libdrm_2.4.62.bb         | 42 ++++++++++++++++++++++
 3 files changed, 46 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.59.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.62.bb

diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index 03d6254..1175dae 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -8,7 +8,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index bf1987f..d909e19 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -6,10 +6,11 @@ AM_CPPFLAGS = \
+@@ -27,10 +27,11 @@ AM_CPPFLAGS = \
  
  LDADD = $(top_builddir)/libdrm.la
  
@@ -18,6 +18,6 @@ index bf1987f..d909e19 100644
  	drmstat
  
 +check_PROGRAMS =
- SUBDIRS = modeprint proptest
- 
- if HAVE_LIBKMS
+ if HAVE_NOUVEAU
+ SUBDIRS += nouveau
+ endif
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.59.bb b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
deleted file mode 100644
index 97f75ff..0000000
--- a/meta/recipes-graphics/drm/libdrm_2.4.59.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Userspace interface to the kernel DRM services"
-DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
-stands for \"Direct Rendering Manager\", which is the kernel portion of the \
-\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
-accelerated OpenGL drivers."
-HOMEPAGE = "http://dri.freedesktop.org"
-SECTION = "x11/base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
-PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev libpciaccess"
-
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://installtests.patch "
-SRC_URI[md5sum] = "d32a1d37c2546ee11fc5924abeedb23e"
-SRC_URI[sha256sum] = "68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --enable-omap-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-manpages \
-                "
-
-ALLOW_EMPTY_${PN}-drivers = "1"
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
-
-RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos ${PN}-freedreno"
-
-FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
-FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
-FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
-FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
-FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
-FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES_${PN}-kms = "${libdir}/libkms*.so.*"
-FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb b/meta/recipes-graphics/drm/libdrm_2.4.62.bb
new file mode 100644
index 0000000..ea6305e
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm_2.4.62.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Userspace interface to the kernel DRM services"
+DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
+stands for \"Direct Rendering Manager\", which is the kernel portion of the \
+\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
+accelerated OpenGL drivers."
+HOMEPAGE = "http://dri.freedesktop.org"
+SECTION = "x11/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs udev libpciaccess"
+
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
+           file://installtests.patch "
+SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
+SRC_URI[sha256sum] = "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-cairo-tests \
+                 --enable-omap-experimental-api \
+                 --enable-install-test-programs \
+                 --disable-manpages \
+                 --disable-valgrind \
+                "
+
+ALLOW_EMPTY_${PN}-drivers = "1"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
+
+RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                             ${PN}-exynos ${PN}-freedreno"
+
+FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
+FILES_${PN}-kms = "${libdir}/libkms*.so.*"
+FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
+
-- 
1.9.1


