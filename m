Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 025737C24A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:46 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id a8so8307509lfk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=Z0loeWyjooTo2OeSUCPrgeIZI1Thw6xFOdjJTPmUHdk4goDG9K/5aDGQkfJan2lYYQ
	1wclKqaL+4VxXePKvbu5ZH58ZIqD8Rr86GqAPXbDmamYTU75K1dYTzaoOttalcGdUjfb
	grdC27DPeFk1pIruMDv/h1LPcz1hR+bh6vrGnVMK4Vp2tImh4hOZBITv2TfDFA8rE1sX
	1p4nGUc+moIfpMyqWVMBe6UAztaWLtTFw+HtKMP+mu8K1BQFm/YLR0BeSpQ+FhScebBK
	/pOLCkCx2j7ITlBSBWGI8u3v7lLJ4muwqMy+cLK9BbY2V+UPbmLmzFWtB7w0yKot4nf9
	BHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eWPDj60+exZxV/yyvQsNANQL16N11ETa87iyMcQicMY=;
	b=dnH7F15yl4OUbj6Co9Kr2Ay1fABk15Ow0t5mGC751Fl/wI6MrWCtSWHgP7DpkdVa4E
	6kI9pyR3fU0/dwqn4M54uE1p0nojqFuyHQv2yU1dCNOi0YQpc57GHfxwX4xTfc8YdjD/
	wYfD4U2X6WjZ+hE80k5TcmhUdI+TicarLB5Xews/aLsiuMbvNAxoQ9PdIDAm9vMHj1RM
	2+q8CLh2g0wbr0WUDxHqIi1GtHAgJZE1WoAKpdOI2luZpt8I9eue4zjfmYxsrU3ocEiu
	zk8hRAA0nxlfAFX73tiLsgfwCRoB8Gb1sBs1wrtwJCfwu6z7S5mH6lua0HyBKZYwHTQC
	txTw==
X-Gm-Message-State: AJcUukfzQQ9fSIzwx7C2LE3ATzXISy15i8HNadtF5whQPxSqtUPSsXO3
	lqHNi0SkUzAfvGQ8FuHFjq+Oim6g
X-Google-Smtp-Source: ALg8bN5NHlan4HdLTE1oNIMjUnLwgRK0ArRekmw7AGW4EGYBtwHzC8rnJ9t3hZQFGzcTXoJiPVsuIA==
X-Received: by 2002:a19:ef15:: with SMTP id n21mr11157042lfh.21.1547743247014; 
	Thu, 17 Jan 2019 08:40:47 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:05 +0100
Message-Id: <984d63c9b6f5ec8b11cfc9489728b2aea62c5033.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 20/27] qemu: add a backported patch to fix egl-headless support
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-egl-headless-add-egl_create_context.patch | 50 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.1.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
new file mode 100644
index 00000000000..d9326c017ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
@@ -0,0 +1,50 @@
+From 952e5d584f5aabe41298c278065fe628f3f7aa7a Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 29 Nov 2018 13:35:02 +0100
+Subject: [PATCH] egl-headless: add egl_create_context
+
+We must set the correct context (via eglMakeCurrent) before
+calling qemu_egl_create_context, so we need a thin wrapper and can't
+hook qemu_egl_create_context directly as ->dpy_gl_ctx_create callback.
+
+Reported-by: Frederik Carlier <frederik.carlier@quamotion.mobi>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-id: 20181129123502.30129-1-kraxel@redhat.com
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=952e5d584f5aabe41298c278065fe628f3f7aa7a]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ui/egl-headless.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ui/egl-headless.c b/ui/egl-headless.c
+index 4cf3bbc0e4..519e7bad32 100644
+--- a/ui/egl-headless.c
++++ b/ui/egl-headless.c
+@@ -38,6 +38,14 @@ static void egl_gfx_switch(DisplayChangeListener *dcl,
+     edpy->ds = new_surface;
+ }
+ 
++static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
++                                        QEMUGLParams *params)
++{
++    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
++                   qemu_egl_rn_ctx);
++    return qemu_egl_create_context(dcl, params);
++}
++
+ static void egl_scanout_disable(DisplayChangeListener *dcl)
+ {
+     egl_dpy *edpy = container_of(dcl, egl_dpy, dcl);
+@@ -150,7 +158,7 @@ static const DisplayChangeListenerOps egl_ops = {
+     .dpy_gfx_update          = egl_gfx_update,
+     .dpy_gfx_switch          = egl_gfx_switch,
+ 
+-    .dpy_gl_ctx_create       = qemu_egl_create_context,
++    .dpy_gl_ctx_create       = egl_create_context,
+     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+     .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index cd7cd67a3f0..ea4277eddea 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0001-Add-a-missing-X11-include.patch \
+           file://0001-egl-headless-add-egl_create_context.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


