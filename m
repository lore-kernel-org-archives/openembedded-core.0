Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102q-0001Xb-OC
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:20 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:25 -0700
Received: by weyt11 with SMTP id t11so2404982wey.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=f96mO8cjhKc7w+GoE83uKWCpBL2J4gEQNGU23V+K0mo=;
	b=aKbepp/Gx6uxrpHYPTrDOs5k/YDQoxo/wd6d34hNeo0+GMPv4x2yrz3ZmNVdVviJSQ
	SO5TBn5EqticJiqATHJYvoUcr6875lLVZlajB5v3YpARejNHJ6ZgCO/yGp8+aUVNaPQS
	JcrNA7jKALh6HVds6fh0xb4ZqjdLFqFfzKvhQ7OkaTrzN/C/k+eCAUMLlCOcdqWxA9SI
	qEl5MCu8Iap3VU52R+Mgtvvm8a6DEPDScHwpi2X5OIq7Wzmij/ZKY0R/W6I1k3yN0kw8
	tbNQNxYT5UOvxDF8DTvvIft5Mh8PkvjbAiCKT/VzFvpThE6XF9FvADHKNSVvFrKwCUHM
	QKTA==
Received: by 10.180.107.2 with SMTP id gy2mr20795853wib.2.1344884363777;
	Mon, 13 Aug 2012 11:59:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:43 +0100
Message-Id: <b34f64c55847fdc3bae12b7954e4ad9f90a6f2b9.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmGGXiaLL9AACQDAHslA1lt5peY0zrzR6AvBrKR7eKdR+xYfJHMLKmWNo8BCv8WnAGxj8y4
Subject: [PATCH 4/8] mesa: enable GLES v1 and v2
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:21 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   12 ++++++++++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index aac3bbe..24cc3d0 100644
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
@@ -34,6 +34,8 @@ EXTRA_OECONF = "--enable-glu \
                 --enable-glx-tls \
                 --enable-shared-glapi"
 
+PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)}"
+
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
@@ -46,10 +48,14 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
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
@@ -59,6 +65,8 @@ FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
+FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index f8f1fff..32ca4b2 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -12,6 +12,8 @@ EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "--disable-egl --enable-gbm"
 
+PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
+
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
 
-- 
1.7.10



