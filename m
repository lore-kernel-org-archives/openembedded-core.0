Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymK-0006J8-Su
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:41 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:02 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so5542447wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=za9IRe05i6WZuDwk9eDDEU651OvtK/TGEbLTjCWsTAE=;
	b=Idg4VIb5LgxbReUjgQAWTy4bp4AJJbzHfp84uvYYW6cTt3t+Kj1YMeSH9WjsRBXrnf
	moQ+J1uTh8Nd3PKaS94TyZlNSdJC+djth+TX+dlmC6EOt4PvA6ukV98M8ly53NtxJJtB
	sDLuAF3a8Ivm4nI1q8l0nfYeWzhDjxTScUxsUp53vgPfVcl2I+wAYCR2tuIBh0Gx/B5X
	MZKkXDBCM66oTNy2/Z5SSqnAVtSrXZnFxiPDk1x5lEP7YlSgpyGIAzNiuGlSNBt0Hqiy
	nBGg+2GyVF3mE+4ZCGWis3PfCAa6Trk6wp0F4vMKqj9YN+2SwiLYYhYpth/MzEpvvGJ3
	kZOA==
Received: by 10.180.109.129 with SMTP id hs1mr6224215wib.0.1343926202055;
	Thu, 02 Aug 2012 09:50:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.50.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:50:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:02 +0100
Message-Id: <b1883478e1349f63104f1a61609333d979e73077.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl0DaKj5ocMPd0YzW9Dfqk6uym1Zatuxc8jZcFwbbgXZSxbuY78oL5AJEEeewfzQBfr4Niv
Subject: [PATCH V3 08/11] mesa: enable GLES v1 and v2
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:42 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   10 ++++++++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index aac3bbe..38b4ab0 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r0"
+INC_PR = "r1"
 PE = "2"
 
 
@@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "makedepend-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
-PROVIDES = "virtual/libgl"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -46,10 +46,14 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libgl libgl-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
+             libgles1 libgles1-dev \
+             libgles2 libgles2-dev \
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgbm = "${libdir}/libgbm.so.*"
+FILES_libgles1 = "${libdir}/libGLESv1*.so.*"
+FILES_libgles2 = "${libdir}/libGLESv2.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
@@ -59,6 +63,8 @@ FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
+FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index f8f1fff..ab4487f 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -10,6 +10,7 @@ DRIDRIVERS_append_x86-64 = ",i915,i965"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--enable-gles1 --enable-gles2"
 EXTRA_OECONF += "--disable-egl --enable-gbm"
 
 python populate_packages_prepend() {
-- 
1.7.10



