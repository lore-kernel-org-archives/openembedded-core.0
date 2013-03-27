Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKuqW-0000cO-Gp
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:13:29 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so2561579wib.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=0UKs4dpvTK9JMaagg2+Z9kQGvJ7pLeryAoeV89aHemA=;
	b=n4w3iIdYm4NbsaqNwvZWJ7weTuElP1Blc+LiotsuJTB9ZjrPoWekkYDnIGl8eLHFEl
	PUeHy/xEThvzUeeJVe0vABcEYAAyNp1HkxfvidS72NkNQ9ZYIiaAfROXhJnWQP5sBKtN
	qlIBCoqynzDVSu8Wjo+m5UDpTkTe+VlEqYzmrJue2OAflIUL7V/jnVW1W3CqpxlOIX2T
	+hLIhZfeDPLYa/HdlhBOWAK79DThVEES/PCYcE9s8obkRUDD8hvgpAAdYgRcqS2NQAkm
	9o3Sk0fqMM6QhsbeKIjoXfpu7awI42vV0lYSLMn8HMOJX/zL8b6AzAvCCvrIwrXKmmRC
	1ySA==
X-Received: by 10.194.58.202 with SMTP id t10mr33505705wjq.4.1364406971344;
	Wed, 27 Mar 2013 10:56:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bq19sm10461694wib.7.2013.03.27.10.56.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 10:56:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 17:53:31 +0000
Message-Id: <1364406811-2706-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmPZIGsxHtMuLZKtNUEZNMwEXChM80nljUpvqQdVDHO659IntVrHyB+slLYUNgNhSmt0uby
Subject: [PATCH] weston: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 27 Mar 2013 18:13:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.0.3.bb |   55 -------------------------
 meta/recipes-graphics/wayland/weston_1.0.6.bb |   55 +++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.6.bb

diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
deleted file mode 100644
index f769312..0000000
--- a/meta/recipes-graphics/wayland/weston_1.0.3.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Weston, a Wayland compositor"
-DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://weston.png \
-           file://weston.desktop"
-SRC_URI[md5sum] = "f82ac2e013e6b6a6303ac4ba7b64c7f2"
-SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968e04853"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
-DEPENDS += "wayland mesa virtual/egl"
-
-EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
-EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
-EXTRA_OECONF += "--enable-simple-clients --enable-clients --disable-simple-egl-clients"
-
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
-                  "
-# Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
-# Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
-# Weston on X11
-PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
-
-PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
-
-do_install_append() {
-	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
-
-	for feature in ${DISTRO_FEATURES}; do
-		# If X11, ship a desktop file to launch it
-		if [ "$feature" = "x11" ]; then
-			install -d ${D}${datadir}/applications
-			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
-
-			install -d ${D}${datadir}/icons/hicolor/48x48/apps
-			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
-                fi
-	done
-}
-
-FILES_${PN} += "${datadir}/applications ${datadir}/icons"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "liberation-fonts"
diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.0.6.bb
new file mode 100644
index 0000000..cb41e05
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_1.0.6.bb
@@ -0,0 +1,55 @@
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
+SRC_URI[md5sum] = "63202129d66d5514e572814da5dfa1f7"
+SRC_URI[sha256sum] = "c833bc4dc8667561d2639b57220541531c039aa9332ce2a7022a3c466eb894f1"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
+DEPENDS += "wayland mesa virtual/egl"
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
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
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
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
-- 
1.7.10.4



