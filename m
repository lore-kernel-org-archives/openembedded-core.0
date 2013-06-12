Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 00E2F6A9D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:49 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so4518568eei.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4SlN5ahpHutgwKtT3O7P+bPcNfLx5m+HxttnxcI/l3A=;
	b=B8ZZp8DOPuRXY3ayICVTZAyVF0FWTPWRNiYqlF3Hzrxi5ww6XSFJShLv+yjJMj7qTt
	He0SDoejSRamSydnb9NTiIWwzeDwm5cfwjfelY/aqSeT8EBxzzkVCaZDNn6VX4JFpTFG
	99ysALdhGv8Atd+AX/T8V5Xrm+WhiblZcIVwjdMZbtUXk5LL7j+WR/NJfX0YKrCjKZMo
	cLCDfL10Wa4Wn6ogoNA7BIwCzaPmdHDd7n5/SX837/TEA+DjUATlsUsG8c1R2YjrqcyN
	xXWK8pyIat6RHyn3hV/btPGtPylZfekagVpcPCceVqoxcMKvlqHS/tvvVGq+EPPUbOo1
	JH4g==
X-Received: by 10.14.172.194 with SMTP id t42mr13899847eel.78.1371079190721;
	Wed, 12 Jun 2013 16:19:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p43sm39763099eem.11.2013.06.12.16.19.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:20:01 +0200
Message-Id: <0e8be36178c2af059cd3fa9a1abccf3d66238ba1.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/10] mesa: introduce openvg PACKAGECONFIG
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6207bb6..2caa238 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -46,6 +46,8 @@ EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
+PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
+
 GALLIUMDRIVERS = "swrast"
 PACKAGECONFIG[gallium] = "--enable-gallium --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers"
 
@@ -66,6 +68,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libwayland-egl libwayland-egl-dev \
              libegl-gallium libgbm-gallium \
+             libopenvg libopenvg-dev \
             "
 
 do_install_append () {
@@ -131,6 +134,7 @@ FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
 FILES_libegl-gallium = "${libdir}/egl/egl_gallium.so*"
 FILES_libgbm-gallium = "${libdir}/gbm/gbm_gallium_drm.so*"
+FILES_libopenvg = "${libdir}/libOpenVG.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libdricore-dev = "${libdir}/libdricore*.*"
@@ -143,5 +147,7 @@ FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/p
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
+FILES_libopenvg-dev = "${libdir}/libOpenVG.so ${libdir}/libOpenVG.la* \
+                       ${includedir}/VG ${libdir}/pkgconfig/vg.pc"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/* ${libdir}/gbm/.debug/* ${libdir}/gallium-pipe/.debug"
-- 
1.8.2.1


