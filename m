Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvVmw-0006vm-79
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:24:41 +0100
Received: from mail-wi0-f199.google.com ([209.85.212.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 08:09:06 -0800
Received: by mail-wi0-f199.google.com with SMTP id hn19so1889387wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=1cCXBJzOdkVfoeXFsliU5nNwCv73gQMyFwsT3F8clYQ=;
	b=BrSAF2AiFZZbqH4ISsaAPsGgYvKH6UH4MYXOS8QljE0UT2qu8g2/34wN1z2MyjmZiE
	LK8WrYPNPnaZ6X3amAdSCvD3ZPgagoTriFuRHW/2KwDBCXPyXspP/XWTqH2oNh3f3ZK2
	qzPDh74GgLrCxC+8Ej/t3M4ZF8hUgq8Q4ZBs8w+dtU0zobdynybAJGWVqMty5jUgM0+p
	JLRmS0ZlJ49cRrSoDqURi1j8s0nnTgSNMZkZmpfF16aeXHPnWD/Kw0Vwl17apA6wz9ws
	B3S8XbHiGdNUTG5teZLQIpVGlNYJwGDuHlg0/UVwOrfcMS7+1zINiVJABIRoqNHgdnpf
	lOCQ==
X-Received: by 10.180.93.3 with SMTP id cq3mr11789834wib.1.1358352544575;
	Wed, 16 Jan 2013 08:09:04 -0800 (PST)
X-Received: by 10.180.93.3 with SMTP id cq3mr11789826wib.1.1358352544464;
	Wed, 16 Jan 2013 08:09:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9768803wid.3.2013.01.16.08.09.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:09:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:06:59 +0000
Message-Id: <b9bddcdeee3b8b0091e54b2e414757458101779b.1358351050.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnLKfQc4DShk1hNrzEsor65uDrM2JGSUkIAwt0usWLxMPjRbOhduK1DbohtoSH3Ia63G+CsybIOvSZZ8/RIfRyXNbREmxTL8ZQ+JgywtvuqzgKmSTZZJPL1breYKsLkrdwBJqn7uw2z6YmRhJ/WWD7pSFuiDFy5M0yQHjf+E7Xl532KZ66Dwgk/U87BYhYPyCWfo/pt
Subject: [PATCH 4/4] weston: add reference Wayland compositor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:24:42 -0000

This is the reference Wayland compositor.

If the "wayland" DISTRO_FEATURE is present the KMS and Wayland (nested)
compositors are enabled.

If the "x11" DISTRO_FEATURE is present the X11 compositor is enabled, and a
launcher installed.

This also ships a basic Wayland terminal.

Based on work by Alexandru Damian <alexandru.damian@intel.com>, Daniel Stone
<daniel@fooishbar.org>, and Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/wayland/weston/weston.desktop |    9 ++++
 meta/recipes-graphics/wayland/weston/weston.png    |  Bin 0 -> 2383 bytes
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |   52 ++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.desktop
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.png
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb

diff --git a/meta/recipes-graphics/wayland/weston/weston.desktop b/meta/recipes-graphics/wayland/weston/weston.desktop
new file mode 100644
index 0000000..1086ae8
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/weston.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Encoding=UTF-8
+Type=Application
+Name=Weston
+Comment=Wayland Compostitor
+Exec=weston
+Icon=weston
+Terminal=false
+Categories=Utility;
diff --git a/meta/recipes-graphics/wayland/weston/weston.png b/meta/recipes-graphics/wayland/weston/weston.png
new file mode 100644
index 0000000000000000000000000000000000000000..ea8b7e0e233c86301a88e5bc925f09b3de2f9dec
GIT binary patch
literal 2383
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
BD_j5o

literal 0
HcmV?d00001

diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
new file mode 100644
index 0000000..d192fb2
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://weston.png \
+           file://weston.desktop"
+SRC_URI[md5sum] = "f82ac2e013e6b6a6303ac4ba7b64c7f2"
+SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968e04853"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
+DEPENDS += "wayland mesa-dri virtual/egl"
+
+EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
+EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
+EXTRA_OECONF += "--enable-simple-clients --enable-clients --disable-simple-egl-clients"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                  "
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa-dri libpam"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa-dri"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+
+PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/weston/*.la
+
+	for feature in ${DISTRO_FEATURES}; do
+		# If X11, ship a desktop file to launch it
+		if [ "$feature" = "x11" ]; then
+			install -d ${D}${datadir}/applications
+			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+			install -d ${D}${datadir}/icons/hicolor/48x48/apps
+			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+                fi
+	done
+}
+
+FILES_${PN} += "${datadir}/applications ${datadir}/icons"
-- 
1.7.10.4



