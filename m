Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAF-0001q3-Uw
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:48 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:07 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so4667579wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=ocif3GgP1AXBP3dufZYlukh75X/9NuEB81wKEZBAxlQ=;
	b=FjUF717fLikozXKAbmmHaYOxwIaKIYVezWkeZFfXzd0cNJe2dUppL29Qk4IBKjOw4g
	J1TVNLJpVHBoUQoPNT13jDHQOrYwc17j8KnkVd3DL6OBoTMS/77DneUieCNIqyVCJ/ze
	ZRY2eawQxwz037plypHRqkWo/wVgTEycnsgJ9kfR3RTG1vwxt+gEWCKW94uyFDQBR152
	UN9Lw5VS3MgQLY/6RiwCPtSJA0jHSWfk2rZtp8AT89YJX70OIaU13M51OVc+cs0lCqH+
	IonSxl/I0yGrIeoNHut0q0EX7HyT3Z2pN3mZbA0gX9gNgtdTlMse4zDkHco8afk4bY3F
	r9Ew==
Received: by 10.216.255.146 with SMTP id j18mr8719290wes.163.1343835427718;
	Wed, 01 Aug 2012 08:37:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:31 +0100
Message-Id: <bda27909c0d8352dac276935dcbd9ef3cca6c90a.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl64+x+lc0WbZHZ0L2qUWc5bU5LfKZwq8LuqbBJlULdFQfY0X0LzGM8O80/gfBgAh0e5cuk
Subject: [PATCH 04/11] mesa: enable the Graphic Buffer Manager library
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    6 +++++-
 meta/recipes-graphics/mesa/mesa-dri.inc    |    6 ++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 509b021..0987478 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r17"
+INC_PR = "r18"
 PE = "2"
 
 
@@ -45,15 +45,18 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libosmesa libosmesa-dev \
              libgl libgl-dev \
              libglapi libglapi-dev libglapi-dbg\
+             libgbm libgbm-dev libgbm-dbg \
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
@@ -62,3 +65,4 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_libegl-dbg += "${libdir}/egl/.debug/*"
 FILES_libglapi-dbg += "${libdir}/.debug/libglapi*"
+FILES_libgbm-dbg += "${libdir}/.debug/libgbm*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 6bf2503..f8f1fff 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,5 +1,5 @@
 PROTO_DEPS += "dri2proto"
-LIB_DEPS += "libdrm expat"
+LIB_DEPS += "libdrm expat udev"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
@@ -8,7 +8,9 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
+EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--disable-egl --enable-gbm"
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.7.10



