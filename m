Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDF67C128
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y185so1453829wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ccwzMBP8gYbxHuRyeoFmrcf5oHju9utMd9jS9FZ45Ts=;
	b=ZWZOCO9GCJybtSSYYF9kBwOaslKbeKYYfH/jj1wK89xKDR1W4wihGxQNfacLD3gGTl
	QV2SZUM/wRASf6RtZC6/PedouijckfuYQotzogThj7Qi0aqsE+c3U+oZ9a3fOGk5iveB
	39TYQT2lKpDDSwq45BsqqsQ58mL+RId3WUEW/2515JTVClDOBTAgOVTB8kkkZft1XIXG
	7oPDunaUni1RoV0E2IznktFJvTkMDL4sDH9a0mWHNKAhLpgXrFubwL63Ztuy9/41fuCW
	Y9w1tiw3F5nPS5A7HXVOwYeogRiueCmNXgIBrYWv0wIDUaPa/X/p6Xxt2+NwAf1CNOIg
	6IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ccwzMBP8gYbxHuRyeoFmrcf5oHju9utMd9jS9FZ45Ts=;
	b=t0Me2ydsW+1YVwc81eoFXy+5aevexQDMWVLeo4G1o/WvZ8HLDyk978MY7wmfenMiwT
	zYc7gbSjK8DgkxRbBOjc6Q0rC/kuc3y6DJPNisqqU4C1Vh/L0kqiupnIl7scCD0aS+ae
	P9lx2o3X9D/NIS8JgvYabGSa56UOigCSv5JXeSMg6SDrVwPI5Vl+2ioRTr2ENwOx8lkE
	z53KrXoEJt+tP7X5i3LOxrk3e7iiJ1QAPwtiRXbep4yqgBRfLCbmkvw+WSpYhfqhVdMq
	URCCrHE4FMr8eqEVgGQ9z5fn54UnZ4CrfaGKOqFN5Bbb3F9BcMKEIt1gZJhADwsiQDe1
	qudw==
X-Gm-Message-State: AJcUukcq5MGDlHM6oqG+yiX5eMZ8I9tNybu3T5JWRjbVVj2qZdyraSNP
	oF3GQO1ATBJmRTjYIqlC5YRsuAlRgkA=
X-Google-Smtp-Source: ALg8bN49QfLQja03bB8r+BUVDI4dn77RRbAghiYF6qN0l2Lj3K50ct4La59BqMkqQS7btUpY90m7Tw==
X-Received: by 2002:a1c:26c1:: with SMTP id m184mr3869274wmm.25.1547570361685; 
	Tue, 15 Jan 2019 08:39:21 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:53 +0100
Message-Id: <ae6b1ec1d369b9000d0138f58a96b0985f27031e.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 18/22] qemu: add a patch to avoid a missing include error
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:21 -0000

| In file included from /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/include/ui/egl-context.h:5,
|                  from /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/ui/egl-context.c:3:
| /home/alexander/development/poky/build-virgl-gtk-64/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/3.1.0-r0/qemu-3.1.0/include/ui/egl-helpers.h:46:55: error: unknown type name 'Window'; did you mean 'minor'?
|  EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, Window win);
|                                                        ^~~~~~
|                                                        minor

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../qemu/0001-Add-a-missing-X11-include.patch | 23 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
new file mode 100644
index 00000000000..8394947a1be
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
@@ -0,0 +1,23 @@
+From 97aa8f9124b4673d15a7823ef9300ec05def760f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 20 Dec 2018 18:06:29 +0100
+Subject: [PATCH] Add a missing X11 include
+
+Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg03350.html]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ include/ui/egl-helpers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
+index 9db7293b..2c32d77e 100644
+--- a/include/ui/egl-helpers.h
++++ b/include/ui/egl-helpers.h
+@@ -4,6 +4,7 @@
+ #include <epoxy/gl.h>
+ #include <epoxy/egl.h>
+ #include <gbm.h>
++#include <X11/Xlib.h>
+ 
+ extern EGLDisplay *qemu_egl_display;
+ extern EGLConfig qemu_egl_config;
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


