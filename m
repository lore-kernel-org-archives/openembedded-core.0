Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYH5-0004Za-6h
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:39 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:02 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=vOg9wk7IdSkfGTZ/V2lIhni9u+uXVn6/iU700xrO4K4=;
	b=dAyMYmUyNZZJNhNRTfR03wrQS69MWR6yNYNf4DJgbbN1kSs/Zzab0z+hUKM/qBo0zL
	MBzLNRYavbvZk0lGfhodMwF/2wHhDNZQgRugd26Dlf+qWxAB15qvWH4J2Qf9tFyTt8ko
	qIjQR6ctrJ1DYCOcHXqKol0q9XiWN6kTDRXDBhUGPbJuxh/ZHD3zWGAHEqe9TJrUYEBu
	Dn/pK9g7nC8koCIax4HHTQLYj4vJjZOaqcqtTbBdWMyMtjHq/B1mgSBgjruTrBNqhk9n
	rJnlzE37EZPduUf1lQt/BnK7hrRwQtZ6xRkfTBLftR2O4rpUVaZimzPoZ1UkxisV9Xw6
	3gmQ==
Received: by 10.180.98.138 with SMTP id ei10mr16243969wib.1.1343824321911;
	Wed, 01 Aug 2012 05:32:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:32:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:14 +0100
Message-Id: <1ceaab96512e3c370e4fe089b7217b46b914ba16.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn1gZ8S1pNfEJg6DTjzjd65YivQ1ZsvDcd7RwFftLduOuB8BcHKVxR218rAxMqC9NZrIREZ
Subject: [PATCH 08/12] mesa: enable EGL, with DRM and X11 platforms
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:39 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    6 +++---
 meta/recipes-graphics/mesa/mesa-dri.inc    |    5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d9758b9..7963896 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r1"
+INC_PR = "r2"
 PE = "2"
 
 
@@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
-PROVIDES = "virtual/libgl virtual/libgles2"
+PROVIDES = "virtual/libgl virtual/libgles2 virtual/egl"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -57,7 +57,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
-FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 1d325eb..0c5682c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -8,10 +8,13 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
+EGL_PLATFORMS  = "drm,x11"
+
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'opengles2', '--enable-gles2', '', d)}"
-EXTRA_OECONF += "--disable-egl --enable-gbm"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'egl', '--enable-egl --with-egl-platforms=${EGL_PLATFORMS}', '', d)}"
+EXTRA_OECONF += "--enable-gbm"
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-- 
1.7.10



