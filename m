Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 58E997C23D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:44 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id c19-v6so9141424lja.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oJ/Cm2mBFVMQvhMGzYDi0izWKu3phUR/5dzh8LRG+LY=;
	b=U6Dfz+eHupDCJXT50IMQNZtVWhgGDNZZNWW5i95KoK0UZyLI7tYMmlFu5VMwgIV4q6
	Zl1mrkRUcNLOilNjP6WLYRKfDUbE1c5ACkuoKt5oPJekhzOzxVizv6WygtWj5d7v9yB1
	as0w5KAbUcLd0pzsNgo4ftAOnLNaywmR4ALHmhjp0Fj4hZC2Q7qBGHlrdk50Zcy4NJ0P
	6/lCz0qLs7MACFU9CRYoQ/XHVbSL+tF5uifnK1WS7Jf+hiaHUNyc7j+jYteIXzl61BJi
	/2p4usPrNiCsUyXhdKbsz4jUCeCFdHj/2Q5edqJ/ory+Axo85kbnlVexIbYsTFSt+NiT
	LXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oJ/Cm2mBFVMQvhMGzYDi0izWKu3phUR/5dzh8LRG+LY=;
	b=ONCp/ralOAFZEcKxzsISTqBDCRHM+YIcQtmhFaTMcb237Vr2aKO/+3p3Srvq11SzZO
	BnVXVeGmAswIdIwMGG0GC/Z1GD2/4RADxdtP/5BIoNdpf85dBRlaCmOOnUYo/OwunZ6y
	cWUi3yiKOd3g2g30fZ+ixpI/sBQXMSvTbydgaaEHy+4cQX41hpzT4WiF6cV/1Jn5XZcT
	WuZzQ26mQT3dsZOscqkvos/RBZRzzhyXSC7fWNUWRFbc/hoBI1tz4qzws7Mkxop2pxv1
	RorN9IlPcJEHJICJ6XXwqnQL1fCFv3LzmOkssQRadu1SBMA9RzGv69Tt1F8+EkIeJrxu
	sPdA==
X-Gm-Message-State: AJcUukeyzZKJcTPGmh9T+NfyZkYmCjQ552ZhgRdXQ3Rxqssjs7po9/iP
	27HMW+XWBOY7uF5UkhC0cL/EmHk5
X-Google-Smtp-Source: ALg8bN5mDTIjtz0HZkfl5aQgyoz29xkIB2pTF+f0e0781vwhzenJSaAC/8s8brYJMRISpGS80Mu5KQ==
X-Received: by 2002:a2e:93d7:: with SMTP id
	p23-v6mr10401369ljh.22.1547743244610; 
	Thu, 17 Jan 2019 08:40:44 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:03 +0100
Message-Id: <e04d1901117e3fdeed83ec4cebd11855e2b5e277.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 18/27] qemu: add a patch to avoid a missing definition error
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:45 -0000

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


