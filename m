Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2F56057A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 19:32:59 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so8710560pga.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ENwobFwneS9AZH9VNcdB2YphOG6xPHc3o4JfgcweYvg=;
	b=tm/SixDT3CVfnNAsJGZqRBZu5QNwmTAmOE8Q0a89lcs4A8Q6WlO7dwHBL3MR4YM5p3
	EkqYucZmWYY/Y5zv8TxOv0GFw7C11isi/sOi7z7uz8PA2a1EYbzk36bMz0rls8qbAH2G
	WdXRJxwbn/F2x1WK9ce3FGLzrNBLaC+rB2B5MSIyN4n57yj/St0SJPp4pnREW38EkR8Z
	WTXU/sqotYoAnHOrREmMXr30CHKhi2NDUuHNhRUv+XIK14XIksBCeGFA5/j30cl9J0Gy
	42bT5UtWeJqzkR/joQc7CtF0rcfXzFiGjWIXFdhc4eBdX3s9KZmAHqaeLqwgWcc8c8C9
	Sbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ENwobFwneS9AZH9VNcdB2YphOG6xPHc3o4JfgcweYvg=;
	b=Jel86VIHb3QfMyk/QQkbKklMJKkDo1QkEdpw0ZtUS32T870VWBYn8Mffsofm6vOKb6
	5csa6+E5znT6cobBltwCGGtWmJ/2DwI2zIjJRUW5GDk5usxbqFeOnx96mqGm5P1tpep9
	0uCKe0YkOOhd8jIgd5AaVSaUoCnL50oYp+roeYflzw0RqqieOnvfhNVh1w0EBH8IlrHw
	eqoB1VdV2cucB6S5FalNoInA1FHdzq+J2MSnybPdI5/t+RMJIuSTR07fVeOYb2HtKy2c
	hD2G08oTLZoj3ezgfjAHh8ViMZCt+uTq2YbrmO0ojo2fbXiQMAnm+S7gFEmvC2C7fJJ6
	Gkxg==
X-Gm-Message-State: AKaTC01F/H14XZpJhGGh+tQvV229KC5+1EH1PzMnTnhIN9BgarafO6tP8E5CFrI/mDa34A==
X-Received: by 10.99.9.66 with SMTP id 63mr82002927pgj.84.1480707180622;
	Fri, 02 Dec 2016 11:33:00 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x90sm9532021pfk.73.2016.12.02.11.32.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 11:33:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2016 11:32:52 -0800
Message-Id: <20161202193253.12104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Cc: meta-intel@yoctoproject.org
Subject: [PATCH 1/2] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Fri, 02 Dec 2016 19:32:59 -0000

This recipe is used by intel and amd BSP layers
additional copies are also there see
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libva/libva_1.7.3.bb | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/libva/libva_1.7.3.bb

diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb b/meta/recipes-graphics/libva/libva_1.7.3.bb
new file mode 100644
index 0000000..9994158
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva_1.7.3.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Video Acceleration (VA) API for Linux"
+DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
+and API specification which enables and provides access to graphics \
+hardware (GPU) acceleration for video processing on Linux and UNIX \
+based operating systems. Accelerated processing includes video \
+decoding, video encoding, subpicture blending and rendering. The \
+specification was originally designed by Intel for its GMA (Graphics \
+Media Accelerator) series of GPU hardware, the API is however not \
+limited to GPUs or Intel specific hardware, as other hardware and \
+manufacturers can also freely use this API for hardware accelerated \
+video decoding."
+
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/vaapi"
+BUGTRACKER = "https://bugs.freedesktop.org"
+
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+
+SRC_URI = "http://www.freedesktop.org/software/vaapi/releases/libva/${BP}.tar.bz2"
+SRC_URI[md5sum] = "dafb1d7d6449e850e9eb1a099895c683"
+SRC_URI[sha256sum] = "22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c4670b9d9"
+
+DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-dummy-driver"
+
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
+
+PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
+
+RDEPENDS_${PN}-tpi =+ "${PN}"
+RDEPENDS_${PN}-x11 =+ "${PN}"
+RDEPENDS_${PN}-glx =+ "${PN}-x11"
+RDEPENDS_${PN}-egl =+ "${PN}-x11"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug"
+
+FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
+FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
+FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
+FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
+FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
-- 
2.10.2


