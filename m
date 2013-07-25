Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id D889A6B0FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 11:45:35 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so852716eek.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SQD17BPcgagFCsBjNQSPMM88RofN3pme3QDpPUnhHSU=;
	b=r3js7bx0OK7mTvfChsQ0HvNOqexwqjpyu+reG5u+nCxETOXqfi6BPc8X/1b+B9PCur
	lPWdx4DwMapDhtCGkwLplbHXkOmso2bZguRExQoyxR8oFaprlmdVaPz2gw6slMgP2/O9
	QObE8IPPOvDISB4zFlur5+59rixcWHLxXfexC0z6rpjcQ1YerGhyH8Tml/3YRHSwvCXl
	XW7FukNas/8tU6iu3VdBsgy/Qg7YBtmHgPzx16BK3mfki0ITn1SAvEaTKPJVQET4e6oc
	Vt3bJ5nj4veEv9SvsK4l/oJ8ohM900gzitdayhvEAd/+OTkwsHocdhcKvnpetaIa6kHP
	XuFQ==
X-Received: by 10.14.0.4 with SMTP id 4mr41657487eea.68.1374752735937;
	Thu, 25 Jul 2013 04:45:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm73111937eed.9.2013.07.25.04.45.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 04:45:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 13:45:57 +0200
Message-Id: <1374752757-22453-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: add PACKAGEs and PACKAGECONFIG for xvmc
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
X-List-Received-Date: Thu, 25 Jul 2013 11:45:37 -0000

* fixes [YOCTO #4898]
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 65c2770..e888201 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -30,6 +30,7 @@ PACKAGECONFIG ??= "egl gles dri \
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
+PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland"
 
 DRIDRIVERS = "swrast"
@@ -78,6 +79,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libwayland-egl libwayland-egl-dev \
              libegl-gallium libgbm-gallium \
              libopenvg libopenvg-dev \
+             libxvmcsoftpipe libxvmcsoftpipe-dev \
             "
 
 do_install_append () {
@@ -146,6 +148,7 @@ FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
 FILES_libegl-gallium = "${libdir}/egl/egl_gallium.so*"
 FILES_libgbm-gallium = "${libdir}/gbm/gbm_gallium_drm.so*"
 FILES_libopenvg = "${libdir}/libOpenVG.so.*"
+FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libdricore-dev = "${libdir}/libdricore*.*"
@@ -160,5 +163,6 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pk
 FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
 FILES_libopenvg-dev = "${libdir}/libOpenVG.so ${libdir}/libOpenVG.la* \
                        ${includedir}/VG ${libdir}/pkgconfig/vg.pc"
+FILES_libxvmcsoftpipe-dev = "${libdir}/libXvMCsoftpipe.so ${libdir}/libXvMCsoftpipe.la"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/* ${libdir}/gbm/.debug/* ${libdir}/gallium-pipe/.debug"
-- 
1.8.3.2


