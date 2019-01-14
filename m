Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAEE7C085
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t27so23224238wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IM8LkPcG5uKW4ov4WLOXwuxaOBcrqEJBJkMzg+RAgmk=;
	b=oKrlrZbM5//81SWG8WgCFRbXHZkFoyKnWoEWuv2PYEpD2fThIyHqQROThLZ6qEDPV+
	CMTLfnUm7CZ+f/1EwerDIzdU38hJbFxa3gvxB+QX/4tZapgE0wRg+9vdJbJG0Fnsupk9
	YtViC1X0uhDKBGoITyiyc3RunL/xIjV1dBHwCdPjqxr3U95zLiBVllMS4QTykie1IOjL
	YtZHH8wBox5zp7NMmgBLF/53DEUPCb/dbfuNgfj8tWrHYSeFRXjZv8CCRpcPI9UMWjQd
	pNrH/6BJQubfM+6qlsJM1AxZJKCTvor6BkrLkSHHedbKK1JbuDcplJ+kLD6pG1SNGRD0
	iZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IM8LkPcG5uKW4ov4WLOXwuxaOBcrqEJBJkMzg+RAgmk=;
	b=cVOf3TDijMt2h8LZ3RzvEsO+62Bx9QgzQhopxqpPwPLlFbwBpoQraAUEdH540hW0JZ
	pcV1ilW/U1gCSTNJKHIGhpF73JminnCLb5J4jIAong7iloObImcCji0as9PEetevdU9R
	duG7QzuYsSTqZ2/+QBcyCo030+ZNyHZMDKhwFCa12P2YuYwZcebUledq/h7ONHVJq5I4
	7lvacovsyKsLRG97rCXtcpRuHes6y09vVHUAfSW38z2TlQsaRouoHRfIC+M8rEvsw0Kl
	3YDCtSM7T4/Sliy1aDUrMavFH1BGOn0mqaTmjTNjiNvRa1051+wEetF6PUuxJHA53e3x
	1qmw==
X-Gm-Message-State: AJcUukf6ASkWbM+1C2ULzuD7pyNPEG/PwvgLb1ckbjqgPnP2GWND9U3H
	q975CrZcFaiK2lrsp77FZ575LRR4
X-Google-Smtp-Source: ALg8bN6XTJxapKqWp8VrSZsc5Y9Pa/F2dK5KxnMMIb6PNwz86ZfU+8VJG7rcNNoThtc1fI7JSdzEfQ==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr23951257wrt.63.1547478222922; 
	Mon, 14 Jan 2019 07:03:42 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:15 +0100
Message-Id: <7367f82a8f1cd908fcfee4f994d823cf995b3dfb.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 19/23] qemu: add a patch to avoid a missing include error
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:43 -0000

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
index 00000000000..23d3d5cfba3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-a-missing-X11-include.patch
@@ -0,0 +1,23 @@
+From 97aa8f9124b4673d15a7823ef9300ec05def760f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 20 Dec 2018 18:06:29 +0100
+Subject: [PATCH] Add a missing X11 include
+
+Upstream-Status: Pending
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


