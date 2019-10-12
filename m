Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 12 Oct 2019 17:01:09 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id DEA727F58D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 17:01:09 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 29FE55839;
	Sat, 12 Oct 2019 12:54:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute7.internal (MEProxy); Sat, 12 Oct 2019 12:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=cl+K0aXqASB2Jeu+BuGinXP5hT
	3qQIHc3IlqTthIGnk=; b=aV2KDatkjvLcBEYjDqa2iH6LlR1Y0ZiXrrzOqA2Eh9
	+vHmBHqAh1QMH1zaDnYawsclk3YsTPCvS7dRRFsBDwfYqp2rPZUNSLcn2AGRZ35e
	OdeQdBiQuaJgrcXFZAdON+CYYxsVgkkTT9g9YUf5dMlaQ3AY/Zos6l192VTc1KYJ
	HeKDeSowhDhyA9YbtvbEDVzGBM+oRLaR/Dph2GDyFbdKtZ1qXMaqA3V2+zsrhU6Y
	GPKju8poPQzEOsPn9EtQuV6V6n84GisnEsB1YNuzj09LqcCO8UQOEgNeIneOV6fN
	3iEbv1tqXaJwac3/GNJ4m11hTsMGw6HrIKuNLFLZ7HlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cl+K0aXqASB2Jeu+B
	uGinXP5hT3qQIHc3IlqTthIGnk=; b=bzqSmYSsivKhAn03xF8+MORDMIuA/CPG4
	eVAJsu7VXE2EwzAStzEQvTq2YE6b1TnOjeXH8SSte85eP/ZlMzWaOIk8Gt1H7tsL
	wBynPMD+2ZjUgr/X9cp6Z/OfdkK5GGawWfo136LAGH4Wx0pGT0eINcBz1GJT1FR8
	Mw6abk75Mcf3qyOwxTpVCT3oC+Uwb6oKJZc1i0AcmNnXYEySyH4bL4mEt43weHSz
	O2vMs3DWP9EfraX2lZz6SzDLJNv9Ko49FW3TVpp7m/5wKzm22BtH8Yr8pRnCEIT/
	SphRBGQxljiPCFWfP+qyd5IY1SNWELVWiLZ6mQKc/95NQZUEsHAdA==
X-ME-Sender: <xms:TAWiXbfXtBJsKEF96FhA83XkRQN4XYUbbg6q5OdtLFnbFL-EyYQK2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieejgddutdejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgovehorghsthgrlhdqhfeguddvqddtvdculdduhe
	dtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhs
	thgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmh
	gvqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpmhgvshgrfegurdho
	rhhgnecukfhppeejfedrleefrdekgedrvddtkeenucfrrghrrghmpehmrghilhhfrhhomh
	eprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvnecuvehluhhsthgvrhfuihii
	vgeptd
X-ME-Proxy: <xmx:TAWiXbvqPaov4E7Bj9eXmbK5McKjPr_dhZynlCGa7lvi3A0mZQH1JA>
	<xmx:TAWiXReRyvGlRRiep1eihd0VwDpmUr-o1zDKUznTa4h5oLluBD5R-A>
	<xmx:TAWiXfo3O8BCd0ubCZGAtUuKTRFYO9O2kKX5qWOp1-EcNPkBP7b5eg>
	<xmx:TQWiXVJo21Jb_QqweFwev006_cmEH_tcjtDwT02hWtDbRpAELNrTSg>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 12CCF80061;
	Sat, 12 Oct 2019 12:54:35 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 09:54:33 -0700
Message-Id: <20191012165433.24511-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Sat, 12 Oct 2019 17:01:10 -0000
Content-Transfer-Encoding: 8bit

Upgrade mesa and mesa-gl to 19.2.1.

The license hash change was a trivial new line removal.

The glx-tls option was removed as it isn't included in the meson.build
file.

The -Dasm=false was removed as it also is no longer included.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...llow-enable-DRI-without-DRI-drivers.patch} |  0
 ...on.build-make-TLS-GLX-optional-again.patch | 52 -------------------
 .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 13 ++---
 .../mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}   |  7 ++-
 5 files changed, 7 insertions(+), 65 deletions(-)
 rename meta/recipes-graphics/mesa/files/{0003-Allow-enable-DRI-without-DRI-drivers.patch => 0002-Allow-enable-DRI-without-DRI-drivers.patch} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb} (71%)

diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0002-Allow-enable-DRI-without-DRI-drivers.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
rename to meta/recipes-graphics/mesa/files/0002-Allow-enable-DRI-without-DRI-drivers.patch
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
deleted file mode 100644
index 641bacf1d9..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 12 Jun 2019 14:15:57 -0300
-Subject: [PATCH] meson.build: make TLS GLX optional again
-Organization: O.S. Systems Software LTDA.
-
-This was optional with autotools, and needs to be disabled
-when using musl C library, for instance.
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- meson.build       | 4 +++-
- meson_options.txt | 7 +++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b33b430aed4..0e50bb26c0a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
-   endif
- endif
- 
--pre_args += '-DGLX_USE_TLS'
-+if get_option('glx-tls')
-+  pre_args += '-DGLX_USE_TLS'
-+endif
- if with_glx != 'disabled'
-   if not (with_platform_x11 and with_any_opengl)
-     error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
-diff --git a/meson_options.txt b/meson_options.txt
-index 1f72faabee8..fcd49efea27 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -339,6 +339,13 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'glx-tls',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable TLS support in GLX',
-+)
-+
- option(
-   'I-love-half-baked-turnips',
-   type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..dbf3f2ca67 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
 
 PE = "2"
 
@@ -57,12 +57,11 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-                   glx-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
-PACKAGECONFIG_remove_libc-musl = "glx-tls"
+PACKAGECONFIG_remove_libc-musl = ""
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
@@ -70,7 +69,6 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
@@ -140,9 +138,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
 
-# mesa tries to run cross-built gen_matypes on build machine to get struct size information
-EXTRA_OEMESON_append = " -Dasm=false"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
similarity index 71%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.2.1.bb
index 19221e9e25..6e87e0eb6a 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
@@ -2,12 +2,11 @@ require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
-           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+           file://0002-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "8f9c05cfbf7b357c60a5345bb87a92c7"
+SRC_URI[sha256sum] = "4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.23.0


