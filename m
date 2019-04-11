Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id CCB6D7D91E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:38:38 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d13so6833143qth.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F4BL9lck4+c3QrfaWTmZpJJM3+dxdYWaPzQNa5nsU/E=;
	b=dgLYM7GvGi8QkrLllPHfwfLnvp4aG7gTqkFWcu5znR6tQoGnjSRlNCOluzwQNAIz8f
	UNgtx2wh3jimIHrzagl499u+xjCpozfjuf4W95okOmCXH706QUV8utvFeOcB/35U7HMX
	I3p3CW2DF1viFLseHIkn7oIlyWe9wC6TS38I8Q8IiVBf6KCEjV5F6xjXa6cnXdMnx5FL
	15QspHwKJIbpFRpv6jCE9L6BsC8nB+Z3n4UZ+aRgJgv5/4+vc2qbSdU3IL9/AYV+mdtz
	rS4BgEKZpVBcFOJrm/H6zdmsoNEOTM9QJ+mCH6GGUyGgdkkbcZBSEoz3XtWA4Wlrzafd
	gW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F4BL9lck4+c3QrfaWTmZpJJM3+dxdYWaPzQNa5nsU/E=;
	b=GP0WD9AC41m+6oJMoMv1grCnix+5cPuYEJYO9Nt01moau7SFsXlARrAg4ef+nAowOc
	AXz9SWPQQ/saWToFJGCq51bVnxBq+iaYWt629Z1RPZeM77PF4neVw1V1mAPhWTf7sTvb
	XXio8TIm2O58ZrF9zGRbKln07YM0j2nlEc3Rmh1FDb362JdmI7B/2YjYprkW7HjPNaZG
	dFnCerCnnVQL1RoxADlHv0PPO/GZ0ZzmT/kB78Cw6Ste/SLsGux0foB6ktt+K1RrMQAG
	N661Jqi6yjmxWvKFVID7TkbjQz/kEExJwWsC5aEKMGBxNnEHg4wJKV5kJTW7DOOBd7dp
	DgJQ==
X-Gm-Message-State: APjAAAW0KRNH/7MRwRbJKP6uc6iVobi71InWscyWuPI35GURByOdaaEM
	mLnk+IbGCcM+pVg8ZHMHEidKj/9L9v2xdg==
X-Google-Smtp-Source: APXvYqxymIOlYqDzz7FH0I6gIeimZl8pDYWtQgC6ANwt1kJ4XSMD+6IvYoGf/NhSW/InzTfQXI1tvQ==
X-Received: by 2002:a0c:d1f7:: with SMTP id k52mr20077582qvh.5.1554986319325; 
	Thu, 11 Apr 2019 05:38:39 -0700 (PDT)
Received: from jfddesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	y18sm25134392qtc.52.2019.04.11.05.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 05:38:38 -0700 (PDT)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 08:38:19 -0400
Message-Id: <20190411123819.20731-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v1] weston: introduce meson build on v5.0.94
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
X-List-Received-Date: Thu, 11 Apr 2019 12:38:39 -0000

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
Changes in v1:
        - v5.0.94 is a pre-release, so this is preliminary work. I wanted to
	  submit this imperfect recipe now because I have to put aside working
	  on weston for a while. Since I put a reasonable amount of work into
	  this, I thought it may be useful for others to get the ball rolling
	  quicker. Enjoy!

 meta/recipes-graphics/wayland/weston_git.bb | 102 ++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston_git.bb

diff --git a/meta/recipes-graphics/wayland/weston_git.bb b/meta/recipes-graphics/wayland/weston_git.bb
new file mode 100644
index 0000000000..f591550f9a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_git.bb
@@ -0,0 +1,102 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
+                    file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
+
+SRC_URI = "git://github.com/wayland-project/weston \
+           file://weston.png \
+           file://weston.desktop \
+           file://xwayland.weston-start \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "cc64cc3717ab39882df37bc244d1ac6cf8526f93"
+PV = "5.0.94+git${SRCPV}"
+# from meson.build:libweston_major
+WESTON_MAJOR_VERSION = "6"
+
+UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+
+inherit meson useradd distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+DEPENDS = "libxkbcommon pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
+
+EXTRA_OEMESON = " \
+                -Dbackend-default=auto \
+                -Dimage-jpeg=true \
+		-Dsimple-dmabuf-drm= \
+                "
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'drm fbdev egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   launch tools shell-desktop demo-clients simple-clients"
+
+WESTON_TOOLS ?= "calibrator,debug,info,terminal,touch-calibrator"
+
+#
+# see https://github.com/wayland-project/weston/raw/master/meson_options.txt
+#
+PACKAGECONFIG[drm] = "-Ddrm-compositor=true,-Ddrm-compositor=false,drm udev virtual/mesa virtual/libgbm mtdev"
+PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapir=true,-Dbackend-drm-screencast-vaapi=false,libva drm"
+PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false,"
+PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
+PACKAGECONFIG[screenshare] = "-Dscreenshare=true -Dshell-fullscreen=true,-Dscreenshare=false"
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
+PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,libxcb"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor"
+PACKAGECONFIG[systemd] = "-Dlauncher-logind=true,-Dlauncher-logind=false,systemd dbus"
+PACKAGECONFIG[remote] = "-Dremoting=true,-Dremoting=false, gstreamer"
+PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
+PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
+PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
+PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,libinput mtdev udev (>=136)"
+PACKAGECONFIG[egl] = "-Drender-gl=true,-Drender-gl=false"
+PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
+PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,lcms"
+PACKAGECONFIG[launch] = "-Dweston-launch=true,-Dweston-launch=false,drm libpam systemd"
+PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
+PACKAGECONFIG[tools] = "-Dtools=${WESTON_TOOLS},-Dtools=,"
+PACKAGECONFIG[demo-clients] = "-Ddemo-clients=true,-Ddemo-clients=false"
+PACKAGECONFIG[simple-clients] = "-Dsimple-clients=all,-Dsimple-clients="
+PACKAGECONFIG[wcap-decode] = "-Dwcap-decode=true,-Dwcap-decode=false"
+PACKAGECONFIG[test-junit-xml] = "-Dtest-junit-xml=true,-Dtest-junit-xml=false,libxml"
+
+do_install_append() {
+	# If X11, ship a desktop file to launch it
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
+		install -d ${D}${datadir}/applications
+		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+		install -d ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
+		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
+	fi
+}
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
+             libweston-${WESTON_MAJOR_VERSION} ${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
+
+FILES_libweston-${WESTON_MAJOR_VERSION} = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.so"
+SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wayland window managers'."
+
+FILES_${PN}-examples = "${bindir}/*"
+
+FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
+RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "weston-conf liberation-fonts"
+RRECOMMENDS_${PN}-dev += "wayland-protocols"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
2.11.0


