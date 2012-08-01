Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYGz-0004Za-K9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:33 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:56 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=SdYQD/ioFnV1aDEvN3ASwyyIH45UYBEf0ODypl8Kpx0=;
	b=amNcyfi69JfWMF1ZxMafYySg7+B0b2ihcm+6zoDMvWlArWj8PjqbKw6Kiv4QQpfITk
	HBsHbcQvvASNMeTDo9xEaGj6N5mYuLBRBVQOrU8oG2VqaYhFKvH1+qyso40aW5dL/x+J
	R5eOkatjALmo/HqErw678dDrXkB9PX87Ge5TMEECTtjNrJ/us6SusEnaZXB/R7Kwhvn4
	w+bFC3lfKpDUt2UeXsMStck0H04WQl0+yu2BlqIXT81LbBoyp4Z7VAxQvvHYRUPxBeqM
	v9qTmo8S4jGz//Pa3Mom/TApNnPTr3HoHMljStArenPddfyuXw3sN4BtCabRyJhPGJ/e
	EUmw==
Received: by 10.180.81.165 with SMTP id b5mr11569325wiy.17.1343824316315;
	Wed, 01 Aug 2012 05:31:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:10 +0100
Message-Id: <32cbbd2c023a1cea85d3f85a532fa368b55de3d2.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlS/L2ZKV46ZAPxhF2Z8EWlAf4m63m4dDJ48pImZ2AIk2f5rEpp40OHyVr1N/wuILV7YMcN
Subject: [PATCH 04/12] mesa: enable the Graphic Buffer Manager library
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:33 -0000


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



