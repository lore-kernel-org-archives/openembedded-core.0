Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYH3-0004Za-EA
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:37 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:00 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=wTw7xNzO9/PrCG/VrLqjfaOY01JxZ5RuwUFechs5gPA=;
	b=Z6wDO1BQJAse63g4eWIxqxENzpFGiw5W2ceAhAXLoZRwTvYzrdQWScpWgHtAIG3FUT
	vuSOMRabknEQZabqpqx3SYd3Y6EKrZPm07w7jtAAuVPoLqmjnhtqB4G7cfZdmYAEZObp
	KH2ewZ0ftEasI49CbZt9B1e64I9JtEE2pWzUgZHXeygS6I1UgZMD1JSCpIUl9ADFYW5m
	0CBcRkGb1vgDAKJvhjjqGUEurnryq9xf57UJLD9P6LcoyfFcxD5ueE5s1HcBrl5W2DPL
	aoxuaZlvGmkvM3KFKMK7/mekKL+/u6rwXIf5r0tDqflcBjc6mEZgmttd17vxTQSm2q6j
	JgLw==
Received: by 10.180.19.138 with SMTP id f10mr104028wie.0.1343824320392;
	Wed, 01 Aug 2012 05:32:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:13 +0100
Message-Id: <6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlTXGsmpPRs44GyYK6/tFtM397zCSk6NGsMk3L5aMfof2YUT/Vw03TrCQBrxAnt6pj5Jlon
Subject: [PATCH 07/12] mesa: enable GLESv2
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:37 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    7 +++++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 01eb5b3..d9758b9 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r0"
+INC_PR = "r1"
 PE = "2"
 
 
@@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
-PROVIDES = "virtual/libgl"
+PROVIDES = "virtual/libgl virtual/libgles2"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -46,10 +46,12 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libgl libgl-dev \
              libglapi libglapi-dev libglapi-dbg\
              libgbm libgbm-dev libgbm-dbg \
+             libgles2 libgles2-dev \
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgbm = "${libdir}/libgbm.so.*"
+FILES_libgles2 = "${libdir}/libGLESv2.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
@@ -59,6 +61,7 @@ FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
+FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index f8f1fff..1d325eb 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -10,6 +10,7 @@ DRIDRIVERS_append_x86-64 = ",i915,i965"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'opengles2', '--enable-gles2', '', d)}"
 EXTRA_OECONF += "--disable-egl --enable-gbm"
 
 python populate_packages_prepend() {
-- 
1.7.10



