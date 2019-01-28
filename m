Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B06F7C495
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so13826955wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oJ/Cm2mBFVMQvhMGzYDi0izWKu3phUR/5dzh8LRG+LY=;
	b=GsajO0vbBRplT6pm2sViYcP1WgPfnUnsMAGVUE/gG7QeJjcz5kxRAdGJeDZolekBAj
	KCtXO3XBZUH0vSJKZ20QM0nb/EmPXk4xqIPR+jrmEOYP8bnEjunLAuwBhZZdKUrxnBQu
	2Ceycc17sD9Qx5ituXTxOCbx+yHpPP6yxW3PkQO0CVtjB5dv9puI7BB4p+7nQsKHLngA
	bwpfKSxR09M1G7HOhsh3ljh8R0MqAHLd4DAiEb21jbJ8eoGoKRXmxv++DmPQOzC+VFs5
	k/3sgciI9PiVrjfyIrb78eA5dmbym7rwEEEZG4BBZtgt+kG73bxGOJEN5BNMCmErFmKY
	rs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oJ/Cm2mBFVMQvhMGzYDi0izWKu3phUR/5dzh8LRG+LY=;
	b=I+9ZqI2JykJbyi8ravHb/dLmFTv6ioFwSoV8Rs9ZVPm55wdWoSVhto+UZoMry9ABxi
	zXKy0tlY4PRbNQw7uLrEQ4wvTbL8JngUuF1XEDIthDQ7YXDF6IgMPGaQIJmJgJp/7pdr
	H2hiOlttLMAWfErinKIC224kD5wKMh4ziwwtwf5puza4cemrynWH84MOJgJR/3QW9k+n
	hOEvQLqrm/j2dTpgkyufE2o+SEZAKHA/lQpKW6v13zhxWUCx7iwvtrnAPe+4ZXKCUDPl
	kC1RANZ7y7SIMNGl2RMrjKEXjyxWaPuReOovNNTQSnJ86JNex6CCOY46OUP/QCAAJmoK
	0ASg==
X-Gm-Message-State: AJcUukeFis5Za0OYfpbOaZMOb6o+XyhvanFQaYBQ67cFeSqQrg2HtIdX
	VDAOqepAfynSMAIi0UbCawFhMNbB
X-Google-Smtp-Source: ALg8bN4kMdm/dIlXV7W1s64j/0yCVYetVzhh2gBr1xmbTLEXfvYYHotAVBxbapKOeCfTDr8F4ywdPA==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr17636761wme.35.1548679646638; 
	Mon, 28 Jan 2019 04:47:26 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:49 +0100
Message-Id: <74ee63046ab7809ccd793da2e8689f01ea005bca.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 18/24] qemu: add a patch to avoid a missing definition error
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:26 -0000

| In file included from /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/include/ui/egl-context.h:5,
|                  from /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/ui/egl-context.c:3:
| /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/include/ui/egl-helpers.h:46:55: error: unknown type name 'Window'; did you mean 'minor'?
|  EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win);
|                                                        ^~~~~~
|                                                        minor

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../qemu/0001-Add-a-missing-X11-include.patch | 65 +++++++++++++++++++
 ...x-libcap-header-issue-on-some-distro.patch |  2 +-
 ...-messages-when-qemi_cpu_kick_thread-.patch |  2 +-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |  1 +
 4 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
new file mode 100644
index 00000000000..192936e1e78
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
@@ -0,0 +1,65 @@
+From eb1a215a4f86dde4493c3e22ad9f6d698850915e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 20 Dec 2018 18:06:29 +0100
+Subject: [PATCH] egl-helpers.h: do not depend on X11 Window type, use
+ EGLNativeWindowType
+
+It was assumed that mesa provides the necessary X11 includes,
+but it is not always the case, as it can be configured without x11 support.
+
+Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg03706.html]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ include/ui/egl-helpers.h | 2 +-
+ ui/egl-helpers.c         | 4 ++--
+ ui/gtk-egl.c             | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
+index 9db7293b..3fc656a7 100644
+--- a/include/ui/egl-helpers.h
++++ b/include/ui/egl-helpers.h
+@@ -43,7 +43,7 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
+ 
+ #endif
+ 
+-EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win);
++EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win);
+ 
+ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode);
+ int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode);
+diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
+index 4f475142..5e115b3f 100644
+--- a/ui/egl-helpers.c
++++ b/ui/egl-helpers.c
+@@ -273,14 +273,14 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf)
+ 
+ /* ---------------------------------------------------------------------- */
+ 
+-EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win)
++EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win)
+ {
+     EGLSurface esurface;
+     EGLBoolean b;
+ 
+     esurface = eglCreateWindowSurface(qemu_egl_display,
+                                       qemu_egl_config,
+-                                      (EGLNativeWindowType)win, NULL);
++                                      win, NULL);
+     if (esurface == EGL_NO_SURFACE) {
+         error_report("egl: eglCreateWindowSurface failed");
+         return NULL;
+diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
+index 5420c236..1f941162 100644
+--- a/ui/gtk-egl.c
++++ b/ui/gtk-egl.c
+@@ -54,7 +54,7 @@ void gd_egl_init(VirtualConsole *vc)
+     }
+ 
+     vc->gfx.ectx = qemu_egl_init_ctx();
+-    vc->gfx.esurface = qemu_egl_init_surface_x11(vc->gfx.ectx, x11_window);
++    vc->gfx.esurface = qemu_egl_init_surface_x11(vc->gfx.ectx, (EGLNativeWindowType)x11_window);
+ 
+     assert(vc->gfx.esurface);
+ }
diff --git a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
index 690d2717f13..9cbe8388119 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
@@ -1,4 +1,4 @@
-From 091a16100a7e1e9e6493663392c5ba2884b99723 Mon Sep 17 00:00:00 2001
+From d3e0b8dac7c2eb20d7fcff747bc98b981f4398ef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 12 Mar 2013 09:54:06 +0800
 Subject: [PATCH] fix libcap header issue on some distro
diff --git a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
index 2232cb80e29..27e508c5a35 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
@@ -1,4 +1,4 @@
-From 3eeeaa45dd12c9f3942cfc8647a08c93fffe19ea Mon Sep 17 00:00:00 2001
+From 861c522df7791d7e93743d5641f3ef2a5a3c4632 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Wed, 12 Aug 2015 15:11:30 -0500
 Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fails.
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 67cebcc8308..cd7cd67a3f0 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
+           file://0001-Add-a-missing-X11-include.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


