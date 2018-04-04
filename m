Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 53F2D74889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:42 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id g20-v6so11745909plo.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RZw5bxsVgiOSxCOZOI+Wv1N/LzP9RtpSVRx/HSvCKL8=;
	b=HgAhMY+9SAXDsf/6v2J5IUyAeAgLtxTPsz7mpNIv9hKRJPj/iXf++q+DV3wPuhN8r9
	4Y1rKHIL+P0BOYvXUO2Bg8OARR+9rTpy0mm/FImbyvGXVfPU0MQQ512hohdE6vIa9W9D
	W2XhrztZtk0LyzrfvleZg/cC+NUkmOBtYySD1UUEumHO5zLCtBjljpIgknBp9YlvivLW
	016Shrt4VcBKe0gWcISPA5f2YwLu91biYoNTD1ogPU3fkwy+bKpwmbDY8V37jCJ/w8I8
	+xRACm4BUNfSWHermh+1UflhliZQ2SWOsViVwuq1TBy4Dz0GJ13Hb5B3rc/X/EvlhzPk
	rZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RZw5bxsVgiOSxCOZOI+Wv1N/LzP9RtpSVRx/HSvCKL8=;
	b=SSwyF2pwzCnkPUNG14gIOXr3NvP1sHm0CsjSrfcOvZAhQI9d156iD/GVhgBc3MFrPH
	j1MgslWUaCEQLHgR88W8CYlrAPXeR4jvbrm876fsXwYIT8kuF2Kn4CHGi9KuPHDgxRXw
	22fAO/alINuWXErdvSu8cb/F/8QAaMQEqqEISCVvoP48CuweDMF1Tg+WGhG5a2ozUsHq
	GgjvF1YdpLEsNSyq6nycWtW2di7o1m8VHT/7hSoEZRcqRI1Pi8I/ACjPqy1G7Jx0FJD7
	i+syYi7Zn/ltB6/6Zl2aO3T6G/As8+klbT2vAFVfLjHGEM+wel/NnyJTteVaRB4NQFXQ
	slew==
X-Gm-Message-State: AElRT7Getx8gFIRy9agA3b5P5ky3e/HqvjxM7fpgnSJtxA7Be8aoXD3P
	UXrEhNofZwns+05ipBQ5MfK1QQ==
X-Google-Smtp-Source: AIpwx4+Ui/6akrwUfeayvEwlJBUOhz1oT7MeCpVfY/MEMeiX6KH+kX8duHXJk7++8Qeety3EFpqFXQ==
X-Received: by 2002:a17:902:b494:: with SMTP id
	y20-v6mr14744578plr.234.1522806583000; 
	Tue, 03 Apr 2018 18:49:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:19 -0700
Message-Id: <73c2f1983d242da865a0dfb827e26fab260ad3f9.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 20/21] xorg: replace depricated *proto depends with xorgproto
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:42 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc                          |  6 +++---
 meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb          |  2 +-
 meta/recipes-graphics/xorg-app/rgb_1.0.6.bb                  |  2 +-
 meta/recipes-graphics/xorg-app/xev_1.2.2.bb                  |  2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb    |  6 +++---
 meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb   |  2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb   |  2 +-
 .../recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb |  2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc     |  2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc      |  2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-video.inc      |  2 +-
 meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb               |  2 +-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb           |  2 +-
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb               |  2 +-
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc                    |  4 ++--
 meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb               |  2 +-
 meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb          |  2 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.13.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb        |  2 +-
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb           |  2 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb             |  2 +-
 meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb              |  2 +-
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb            |  2 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb            |  2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb             |  2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb          |  2 +-
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb           |  2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb            |  2 +-
 meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb          |  2 +-
 meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb              |  2 +-
 meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb        |  2 +-
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb              |  2 +-
 meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb               |  2 +-
 meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb             |  2 +-
 meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb          |  2 +-
 meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb         |  2 +-
 meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb           |  2 +-
 meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb          |  2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc          | 12 ++++++------
 42 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e4da81..45335e9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -47,7 +47,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
@@ -57,8 +57,8 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
-PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
+PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
+PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
 # radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
index 88c88f1..2a6bec1 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
@@ -8,7 +8,7 @@ font name (XLFD) is generated, and is written together with the file \
 name to a file fonts.scale in the directory.  The resulting fonts.scale \
 is used by the mkfontdir program."
 
-DEPENDS = "util-macros-native zlib libfontenc freetype xproto"
+DEPENDS = "util-macros-native zlib libfontenc freetype xorgproto"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb b/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb
index 8726804..c3e8536 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb
@@ -6,7 +6,7 @@ to RGB values (rgb.txt) and, if configured to use a database for color \
 lookup, the rgb program to convert the text file into the binary database \
 format."
 
-DEPENDS += " xproto util-macros"
+DEPENDS += " xorgproto util-macros"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb b/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
index f151b57..0705b7f 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 
 PE = "1"
 
-DEPENDS += "libxrandr xproto"
+DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 2623cb2..893f5ce 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -28,9 +28,9 @@ DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 PACKAGECONFIG ??= "xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
-PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1,xf86driproto"
-PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
+PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1,xorgproto"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,xorgproto"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,xorgproto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
index bef3636..0430f67 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
@@ -22,7 +22,7 @@ omapdrm kernel driver w/ GEM support. \
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
-DEPENDS += "virtual/libx11 libdrm xf86driproto"
+DEPENDS += "virtual/libx11 libdrm xorgproto"
 
 SRC_URI[md5sum] = "3b8ea5e8fba63355c0dc6681c49d5fe5"
 SRC_URI[sha256sum] = "93e7d42107521e61f61980eaea64fb452e87b7b94272e48938ac8d904ccfab5a"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
index 5c1356d..9a11014 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
@@ -9,7 +9,7 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
-DEPENDS += "virtual/libx11 randrproto libpciaccess"
+DEPENDS += "virtual/libx11 xorgproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
index 706d35d..0b63bbc 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
-DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
+DEPENDS += "virtual/libx11 xorgproto libpciaccess"
 
 SRC_URI += "file://0002-add-option-for-vmwgfx.patch"
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index bca0aad..e657c65 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -7,7 +7,7 @@ LICENSE = "MIT-X"
 PE = "2"
 INC_PR = "r21"
 
-DEPENDS = "virtual/xserver xproto randrproto util-macros"
+DEPENDS = "virtual/xserver xorgproto util-macros"
 
 SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index 342067d..57912e7 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -1,6 +1,6 @@
 require xorg-driver-common.inc
 
-DEPENDS += "inputproto kbproto "
+DEPENDS += "xorgproto"
 
 python add_xorg_abi_depends() {
     _add_xorg_abi_depends(d, "input")
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index b5862da..2938ef1 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -1,6 +1,6 @@
 require xorg-driver-common.inc
 
-DEPENDS =+ "renderproto videoproto xextproto fontsproto"
+DEPENDS =+ "xorgproto"
 
 python add_xorg_abi_depends() {
     _add_xorg_abi_depends(d, "video")
diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
index e623cee..c74b706 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
@@ -11,7 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a3c3499231a8035efd0e004cfbd3b72a \
                     file://src/dmx.c;endline=33;md5=c43f19af03c7c8619cadc9724ed9afe1"
 
-DEPENDS += "libxext dmxproto"
+DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
index a181f05..34d5fc4 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
@@ -8,7 +8,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 
-DEPENDS += "zlib xproto font-util"
+DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index f069749..0337d21 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -11,7 +11,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d162b1b3c6fa812da9d804dcf8584a93"
 
-DEPENDS += "xproto xtrans"
+DEPENDS += "xorgproto xtrans"
 PROVIDES = "ice"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
index 48922cb..fdc693b 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
@@ -11,7 +11,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
 
-DEPENDS += "libice xproto xtrans"
+DEPENDS += "libice xorgproto xtrans"
 
 # libSM can work without libuuid, we explicitly disable it to break the following circular dependency
 # when DISTRO_FEATURES contains 'systemd' and 'x11'.
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 4af40ab..d9a2b52 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -18,8 +18,8 @@ XORG_PN = "libX11"
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
-DEPENDS += "xproto-native"
+DEPENDS += "xorgproto xtrans libxcb"
+DEPENDS += "xorgproto-native"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
index 2ef8bfa..8c52475 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
@@ -11,7 +11,7 @@ inherit gettext
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 
-DEPENDS += " xproto"
+DEPENDS += " xorgproto"
 PROVIDES = "xau"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index 0fe6531..0ed8fda 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xcalibrate.h;endline=21;md5=fa572df6439f0f235f2612f370f153d7 \
                     file://xcalibrate.c;endline=21;md5=fa572df6439f0f235f2612f370f153d7"
 
-DEPENDS = "virtual/libx11 calibrateproto libxext"
+DEPENDS = "virtual/libx11 xorgproto libxext"
 
 SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
 PV = "0.0+git${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
index 04b58ea..a8e0307 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "xcb-proto xproto libxau libpthread-stubs libxdmcp"
+DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
 
 PACKAGES_DYNAMIC = "^libxcb-.*"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
index 7025719..73e2948 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
@@ -14,7 +14,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
 
-DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
+DEPENDS += " xorgproto virtual/libx11 libxfixes libxext"
 PROVIDES = "xcomposite"
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
index c3d7004..6d6ffad 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.4.bb
@@ -16,7 +16,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
-DEPENDS += "virtual/libx11 damageproto libxfixes"
+DEPENDS += "virtual/libx11 xorgproto libxfixes"
 PROVIDES = "xdamage"
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
index f4e30d9..466f349 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
@@ -13,7 +13,7 @@ inherit gettext
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d559fb26e129626022e052a5e6e0e123"
 
-DEPENDS += "xproto"
+DEPENDS += "xorgproto"
 PROVIDES = "xdmcp"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb
index 063e531..aae8f2a 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb
@@ -13,7 +13,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=879ce266785414bd1cbc3bc2f4d9d7c8"
 
-DEPENDS += "xproto virtual/libx11 xextproto"
+DEPENDS += "xorgproto virtual/libx11"
 PROVIDES = "xext"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
index c80042d..f0e2f60 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
@@ -10,7 +10,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 
-DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
+DEPENDS += "virtual/libx11 xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
index 5f27a55..2b72d67 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
-DEPENDS += "freetype xtrans fontsproto libfontenc zlib"
+DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 
 XORG_PN = "libXfont2"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 79f77fc..94c6c66 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
-DEPENDS += "freetype xtrans fontsproto libfontenc zlib"
+DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 PROVIDES = "xfont"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
index 74f0527..08381d9 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.9.bb
@@ -11,7 +11,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
                     file://src/XIGetDevFocus.c;endline=23;md5=cdfb0d435a33ec57ea0d1e8e395b729f"
 
-DEPENDS += "libxext inputproto libxfixes"
+DEPENDS += "libxext xorgproto libxfixes"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
index bb03f44..367ad26 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6f4f634d1643a2e638bba3fcd19c2536 \
                     file://src/Xinerama.c;beginline=2;endline=25;md5=fcef273bfb66339256411dd06ea79c02"
 
-DEPENDS += "libxext xineramaproto"
+DEPENDS += "libxext xorgproto"
 PROVIDES = "xinerama"
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
index 39a344c..f5c1860 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
@@ -8,7 +8,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
 
-DEPENDS += "virtual/libx11 kbproto"
+DEPENDS += "virtual/libx11 xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
index 48e88d2..b90ebc6 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
@@ -11,7 +11,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9d1a2118a6cd5727521db8e7a2fee69"
 
-DEPENDS += "virtual/libx11 randrproto libxrender libxext"
+DEPENDS += "virtual/libx11 xorgproto libxrender libxext"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
index 92b3102..9b18366 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
@@ -11,7 +11,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8bc71986d3b9b3639f6dfd6fac8f196"
 
-DEPENDS += "virtual/libx11 renderproto xproto"
+DEPENDS += "virtual/libx11 xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
index 8c34e47..af6bb19 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
@@ -10,7 +10,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c89441a8df261bdc56587465e13c7fa"
 
-DEPENDS += "libxext resourceproto"
+DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
index 354e5de..ddf09af 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
@@ -12,7 +12,7 @@ image is to be displayed and to provide the graphics."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=21fd154ee757813632ada871a34113fb"
 
-DEPENDS += "libxext scrnsaverproto"
+DEPENDS += "libxext xorgproto"
 PROVIDES = "libxss"
 RREPLACES_${PN} = "libxss"
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
index 180d00d..f8d94a2 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
@@ -16,7 +16,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6565b1e0094ea1caae0971cc4035f343"
 
 
-DEPENDS += "util-linux libxcb libsm virtual/libx11 kbproto libxdmcp"
+DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
 PROVIDES = "xt"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
index 5717fa5..266bd1c 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bb4f89972c3869f617f61c1a79ad1952 \
                     file://src/XTest.c;beginline=2;endline=32;md5=b1c8c9dff842b4d5b89ca5fa32c40e99"
 
-DEPENDS += "libxext recordproto inputproto libxi"
+DEPENDS += "libxext xorgproto libxi"
 PROVIDES = "xtst"
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
index a226c27..c602723 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
@@ -10,7 +10,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=827da9afab1f727f2a66574629e0f39c"
 
-DEPENDS += "libxext videoproto"
+DEPENDS += "libxext xorgproto"
 
 XORG_PN = "libXv"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
index 6ed49b1..7e49a98 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.10.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0a207f08d4961489c55046c9a5e500da \
                     file://wrapper/XvMCWrapper.c;endline=26;md5=5151daa8172a3f1bb0cb0e0ff157d9de"
 
-DEPENDS += "libxext libxv videoproto"
+DEPENDS += "libxext libxv xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
index 695a396..626199e 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
@@ -9,7 +9,7 @@ emulators for games."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=abb99ac125f84f424a4278153988e32f"
 
-DEPENDS += "libxext xf86dgaproto"
+DEPENDS += "libxext"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
index af6f1f7..04fe962 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
@@ -8,7 +8,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27c91ecc435bd3d2bfad868914c94b45"
 
-DEPENDS += "libxext xf86miscproto"
+DEPENDS += "libxext"
 PROVIDES = "xxf86misc"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
index 35f87d2..95fc0b6 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
@@ -10,7 +10,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fa0b9c462d8f2f13eba26492d42ea63d"
 
-DEPENDS += "libxext xf86vidmodeproto"
+DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
index 84a967a..727ab54 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
@@ -10,7 +10,7 @@ directives would be used in a compilation. Any #include, directives \
 can reference files having other #include directives, and parsing will \
 occur in these files as well."
 
-DEPENDS = "xproto util-macros"
+DEPENDS = "xorgproto util-macros"
 PE = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index cf2286c..882897b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -26,7 +26,7 @@ inherit autotools pkgconfig
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto presentproto"
+PROTO_DEPS = "xorgproto"
 LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
@@ -127,18 +127,18 @@ PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
-PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xorgproto virtual/mesa"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,xorgproto"
 # DRI3 requires xshmfence to also be enabled
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,xorgproto"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,xorgproto virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
-PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xorgproto"
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy"
 
 # Xorg requires a SHA1 implementation, pick one
-- 
2.7.4


