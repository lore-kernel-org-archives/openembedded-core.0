Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 012A965F1E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:18:28 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so4350876wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Ti0I4LCrLxuc07HHGgilJ67PKJAVaNv9i4EpsnrfxVw=;
	b=Hd6n+kSFP4hJTwh/Us4e9IAmzAi3u7zVsuUBGy0AfkGEm8r1y5F5gvMk6zdleyT9cN
	pISDcntwHDP9mLaUR+Ndj62pJ68fmO7MKKsdCpwaNGXEMTRgI/PtLq5fwf46ZkJXdcP+
	Rv286sW3TlKV/sMrvuuzf4+Et48VXFDq3m7AX93zTycnz6oZGNRSO0TxFJXUJzze3I6Z
	HGVSK9uVG+941WVka5IJ9laaYdg1GK6PjZVdaj6s2sueUN8LNe0GiCzXHL6KNeN5L0xi
	xHzO4oIeschmwoAYsnHDImt1twyXkqJ03/d217HZTBINq7J9j5/mB2dyPsRen32F8T55
	fbQA==
X-Gm-Message-State: ALoCoQntaqXHQsGtNpmZgBTKRlpXvyVFbTDCmyd44HmHRGkhGON33ws1LaLIQwuVivO7f4IKVQH4
X-Received: by 10.180.107.97 with SMTP id hb1mr29582005wib.20.1402323509703;
	Mon, 09 Jun 2014 07:18:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id g9sm25200969wja.39.2014.06.09.07.18.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 07:18:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 15:18:18 +0100
Message-Id: <31d3bcfaeb85173bdf0dec7ee25e306fde1e539c.1402323356.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
In-Reply-To: <cover.1402323355.git.ross.burton@intel.com>
References: <cover.1402323355.git.ross.burton@intel.com>
Subject: [PATCH 2/3] mesa: upgrade to 10.1.3
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
X-List-Received-Date: Mon, 09 Jun 2014 14:18:34 -0000

From: Valentin Popa <valentin.popa@intel.com>

libdricore was removed and replaced with a megadriver with hardlinks from the
old driver names.

Add PACKAGECONFIG for DRI3 but disable by default as there are currently
regressions compared to DRI2.

License is unchanged.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |    0
 meta/recipes-graphics/mesa/mesa.inc                |   28 +++++++++++++-------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |    4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |    4 +--
 4 files changed, 22 insertions(+), 14 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6503c2d..453510a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,9 +10,8 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
 
-INC_PR = "r9"
 PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
@@ -39,6 +38,7 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
+PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
 
 EXTRA_OECONF += "--enable-gbm"
 
@@ -78,7 +78,6 @@ RDEPENDS_${PN}-dev = ""
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-             libdricore libdricore-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -88,6 +87,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libegl-gallium libgbm-gallium \
              libopenvg libopenvg-dev \
              libxvmcsoftpipe libxvmcsoftpipe-dev \
+             mesa-megadriver \
             "
 
 do_install_append () {
@@ -130,15 +130,24 @@ python __anonymous() {
 }
 
 python mesa_populate_packages() {
-    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-
     pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
-    pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
     for pkg in pkgs:
         d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
-    
+
+    import re
+    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
+    dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
+    lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+    for p in dri_pkgs:
+        m = re.match('^(.*)_dri\.so$', p)
+        if m:
+            pkg_name = " mesa-driver-%s" % legitimize_package_name(m.group(1))
+            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
+            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
+            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
+
     pipe_drivers_root = os.path.join(d.getVar('libdir', True), "gallium-pipe")
     do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
@@ -148,8 +157,8 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-
-FILES_libdricore = "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
+FILES_${PN} += "${sysconfdir}/drirc"
+FILES_mesa-megadriver = "${libdir}/dri/*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -164,7 +173,6 @@ FILES_libopenvg = "${libdir}/libOpenVG.so.*"
 FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
-FILES_libdricore-dev = "${libdir}/libdricore*.*"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-graphics/mesa/mesa_10.1.3.bb
similarity index 82%
rename from meta/recipes-graphics/mesa/mesa_9.2.5.bb
rename to meta/recipes-graphics/mesa/mesa_10.1.3.bb
index 02ecd46..abc450a 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.1.3.bb
@@ -5,8 +5,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0006-fix-out-of-tree-egl.patch \
            "
 
-SRC_URI[md5sum] = "9fb4de29ca1d9cfd03cbdefa123ba336"
-SRC_URI[sha256sum] = "b46ab9efed176df0591993397594d712ada9da6a47fd31bbe75050fe28eb6bf0"
+SRC_URI[md5sum] = "ba6dbe2b9cab0b4de840c996b9b6a3ad"
+SRC_URI[sha256sum] = "b2615e236ef25d0fb94b8420bdd2e2a520b7dd5ca2d4b93306154f7fd4adecc3"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 1e6fdb5..59b0d1c 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -5,8 +5,8 @@ DEFAULT_PREFERENCE = "-1"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
 
 PR = "${INC_PR}.0"
-SRCREV = "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
-PV = "9.2.5+git${SRCPV}"
+SRCREV = "0028eb1083e6adc110a23a5f02c993cda217067a"
+PV = "10.1.3+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
-- 
1.7.10.4


