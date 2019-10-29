Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D432B7FBA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s1so12888635wro.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=LLew1lxJf7yus75imsJGWOcwCi3nMtMzrY6RnuRlFAY=;
	b=sz4l+YuFKZG1MPDriCr8zdTG1ZZ2wmyDkPbgsf3vJmJUPHWnESqVUGlN9EOZB1xjhj
	hWU1LaDWmfev73GB6DYpEgiXz6GZr/l8Tbzt5JJvLzIOlkth7YjNyyW79VLcbTbvDeQb
	c8STukuUurQwXwwXwsWRZHqD3+aDAbHl1CJ6CZsoQfefdckHVgCdssyOVxD5WR/S23eD
	lK+GTBUFEtIXPWZ0T8UL17jqtL2sDkg1ILWOISDfh8kG3ndB561rhECWhG+86jz4SxGV
	94IMp8Psi7NWUT+uNszleRUTLJY4mJTfGiJG3Za+gfeMfGHAPwGKZ+io9HNcn8hIqdbd
	ZovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=LLew1lxJf7yus75imsJGWOcwCi3nMtMzrY6RnuRlFAY=;
	b=SfmQDY/+nQy/nieR+La2lJuKgQaSsDtQ8n25PI1A6UCEavSTCchky7LGsmDZu2elWn
	I7h9OHGxxvVkBKdEw2OVevxqnTNFM3GwcnznINDbUeY4/U16jeUdz/tvMjpta+mID0JJ
	CepPz4dSpMFwfgpPKJQ7DoxR2pK+h7IDXfEk1gYpj35oFIOAyFfKGFZ+eunZpaVeG/jE
	XFF6fDf8o04WEQszhuEir2WCalf+KW3HcKK1KTwjXCXnf6jQDxQFhssAYvfpZpu8NLoI
	Dg03uUEMCPpyT7TgANq337WkBx5SkpIVqTenkJLt8a16zTvsHLduA0DRX9dhxn0aQX2w
	IIlQ==
X-Gm-Message-State: APjAAAVjVgVLq0pZofDaN2OBgikccXZIDya5X4nnO/xixGr7kSSABYEz
	Z+Fx9NI2Gvcc5NafqBzswpc0/RRjLwM=
X-Google-Smtp-Source: APXvYqx+atZHYqCNSXJaCLQNGTtgYCDwqVoWnB4vM36ta8SXlD7J7VzdqGbBLJ57S7n9vEA9ouxYQg==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr18512813wrl.278.1572342479496; 
	Tue, 29 Oct 2019 02:47:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:32 +0100
Message-Id: <4d258f77807d05f760a038f975d61be17d3ba76e.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 19/19] qemu: update to 3.1.1.1
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
X-List-Received-Date: Tue, 29 Oct 2019 09:48:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bug fix only update.

Drop patches included in update.

For full set of changes, see: https://git.qemu.org/?p=qemu.git;a=shortlog;h=refs/tags/v3.1.1.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...qemu-native_3.1.0.bb => qemu-native_3.1.1.1.bb} |   0
 ...tive_3.1.0.bb => qemu-system-native_3.1.1.1.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc                |  14 +-
 .../0001-egl-headless-add-egl_create_context.patch |  50 -----
 .../qemu/qemu/0014-fix-CVE-2018-16872.patch        |  85 --------
 .../qemu/qemu/0015-fix-CVE-2018-20124.patch        |  60 ------
 .../qemu/qemu/0016-fix-CVE-2018-20125.patch        |  54 ------
 .../qemu/qemu/0017-fix-CVE-2018-20126.patch        | 113 -----------
 .../qemu/qemu/0018-fix-CVE-2018-20191.patch        |  47 -----
 .../qemu/qemu/0019-fix-CVE-2018-20216.patch        |  85 --------
 .../qemu/qemu/CVE-2018-20815.patch                 |  38 ----
 .../recipes-devtools/qemu/qemu/CVE-2019-3812.patch |  39 ----
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 ---------------------
 .../qemu/{qemu_3.1.0.bb => qemu_3.1.1.1.bb}        |   0
 14 files changed, 2 insertions(+), 798 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_3.1.0.bb => qemu-native_3.1.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_3.1.0.bb => qemu-system-native_3.1.1.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
 rename meta/recipes-devtools/qemu/{qemu_3.1.0.bb => qemu_3.1.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_3.1.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_3.1.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_3.1.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 40c3174..202134b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,24 +22,14 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0001-Add-a-missing-X11-include.patch \
-           file://0001-egl-headless-add-egl_create_context.patch \
-           file://0014-fix-CVE-2018-16872.patch \
-           file://0015-fix-CVE-2018-20124.patch \
-           file://0016-fix-CVE-2018-20125.patch \
-           file://0017-fix-CVE-2018-20126.patch \
-           file://0018-fix-CVE-2018-20191.patch \
-           file://0019-fix-CVE-2018-20216.patch \
-           file://CVE-2019-3812.patch \
            file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
-           file://CVE-2018-20815.patch \
-           file://CVE-2019-8934.patch \
            file://0001-linux-user-assume-__NR_gettid-always-exists.patch \
            file://0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "fb687ce0b02d3bf4327e36d3b99427a8"
-SRC_URI[sha256sum] = "6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc"
+SRC_URI[md5sum] = "aafb005c252eb3a667c2468868348c0a"
+SRC_URI[sha256sum] = "b148fc3c7382c5addd915db433383160ca7b840bc6ea90bb0d35c6b253526d56"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch b/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
deleted file mode 100644
index d9326c0..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 952e5d584f5aabe41298c278065fe628f3f7aa7a Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 29 Nov 2018 13:35:02 +0100
-Subject: [PATCH] egl-headless: add egl_create_context
-
-We must set the correct context (via eglMakeCurrent) before
-calling qemu_egl_create_context, so we need a thin wrapper and can't
-hook qemu_egl_create_context directly as ->dpy_gl_ctx_create callback.
-
-Reported-by: Frederik Carlier <frederik.carlier@quamotion.mobi>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Message-id: 20181129123502.30129-1-kraxel@redhat.com
-
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=952e5d584f5aabe41298c278065fe628f3f7aa7a]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ui/egl-headless.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/ui/egl-headless.c b/ui/egl-headless.c
-index 4cf3bbc0e4..519e7bad32 100644
---- a/ui/egl-headless.c
-+++ b/ui/egl-headless.c
-@@ -38,6 +38,14 @@ static void egl_gfx_switch(DisplayChangeListener *dcl,
-     edpy->ds = new_surface;
- }
- 
-+static QEMUGLContext egl_create_context(DisplayChangeListener *dcl,
-+                                        QEMUGLParams *params)
-+{
-+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
-+                   qemu_egl_rn_ctx);
-+    return qemu_egl_create_context(dcl, params);
-+}
-+
- static void egl_scanout_disable(DisplayChangeListener *dcl)
- {
-     egl_dpy *edpy = container_of(dcl, egl_dpy, dcl);
-@@ -150,7 +158,7 @@ static const DisplayChangeListenerOps egl_ops = {
-     .dpy_gfx_update          = egl_gfx_update,
-     .dpy_gfx_switch          = egl_gfx_switch,
- 
--    .dpy_gl_ctx_create       = qemu_egl_create_context,
-+    .dpy_gl_ctx_create       = egl_create_context,
-     .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
-     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
-     .dpy_gl_ctx_get_current  = qemu_egl_get_current_context,
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch b/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
deleted file mode 100644
index 412aa16..0000000
--- a/meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-CVE: CVE-2018-16872
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=bab9df35]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From bab9df35ce73d1c8e19a37e2737717ea1c984dc1 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 13 Dec 2018 13:25:11 +0100
-Subject: [PATCH] usb-mtp: use O_NOFOLLOW and O_CLOEXEC.
-
-Open files and directories with O_NOFOLLOW to avoid symlinks attacks.
-While being at it also add O_CLOEXEC.
-
-usb-mtp only handles regular files and directories and ignores
-everything else, so users should not see a difference.
-
-Because qemu ignores symlinks, carrying out a successful symlink attack
-requires swapping an existing file or directory below rootdir for a
-symlink and winning the race against the inotify notification to qemu.
-
-Fixes: CVE-2018-16872
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: Bandan Das <bsd@redhat.com>
-Reported-by: Michael Hanselmann <public@hansmi.ch>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Michael Hanselmann <public@hansmi.ch>
-Message-id: 20181213122511.13853-1-kraxel@redhat.com
----
- hw/usb/dev-mtp.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
-index 100b7171f4..36c43b8c20 100644
---- a/hw/usb/dev-mtp.c
-+++ b/hw/usb/dev-mtp.c
-@@ -653,13 +653,18 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
- {
-     struct dirent *entry;
-     DIR *dir;
-+    int fd;
- 
-     if (o->have_children) {
-         return;
-     }
-     o->have_children = true;
- 
--    dir = opendir(o->path);
-+    fd = open(o->path, O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
-+    if (fd < 0) {
-+        return;
-+    }
-+    dir = fdopendir(fd);
-     if (!dir) {
-         return;
-     }
-@@ -1007,7 +1012,7 @@ static MTPData *usb_mtp_get_object(MTPState *s, MTPControl *c,
- 
-     trace_usb_mtp_op_get_object(s->dev.addr, o->handle, o->path);
- 
--    d->fd = open(o->path, O_RDONLY);
-+    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
-     if (d->fd == -1) {
-         usb_mtp_data_free(d);
-         return NULL;
-@@ -1031,7 +1036,7 @@ static MTPData *usb_mtp_get_partial_object(MTPState *s, MTPControl *c,
-                                         c->argv[1], c->argv[2]);
- 
-     d = usb_mtp_data_alloc(c);
--    d->fd = open(o->path, O_RDONLY);
-+    d->fd = open(o->path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
-     if (d->fd == -1) {
-         usb_mtp_data_free(d);
-         return NULL;
-@@ -1658,7 +1663,7 @@ static void usb_mtp_write_data(MTPState *s)
-                                  0, 0, 0, 0);
-             goto done;
-         }
--        d->fd = open(path, O_CREAT | O_WRONLY, mask);
-+        d->fd = open(path, O_CREAT | O_WRONLY | O_CLOEXEC | O_NOFOLLOW, mask);
-         if (d->fd == -1) {
-             usb_mtp_queue_result(s, RES_STORE_FULL, d->trans,
-                                  0, 0, 0, 0);
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
deleted file mode 100644
index 985b819..0000000
--- a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-CVE: CVE-2018-20124
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0e68373]
-
-Backport patch to fix CVE-2018-20124. Update context and stay with current
-function comp_handler() which has been replaced with complete_work() in latest
-git repo.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 0e68373cc2b3a063ce067bc0cc3edaf370752890 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 13 Dec 2018 01:00:34 +0530
-Subject: [PATCH] rdma: check num_sge does not exceed MAX_SGE
-
-rdma back-end has scatter/gather array ibv_sge[MAX_SGE=4] set
-to have 4 elements. A guest could send a 'PvrdmaSqWqe' ring element
-with 'num_sge' set to > MAX_SGE, which may lead to OOB access issue.
-Add check to avoid it.
-
-Reported-by: Saar Amar <saaramar5@gmail.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
-Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
----
- hw/rdma/rdma_backend.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
-index d7a4bbd9..7f8028f8 100644
---- a/hw/rdma/rdma_backend.c
-+++ b/hw/rdma/rdma_backend.c
-@@ -311,9 +311,9 @@ void rdma_backend_post_send(RdmaBackendDev *backend_dev,
-     }
- 
-     pr_dbg("num_sge=%d\n", num_sge);
--    if (!num_sge) {
--        pr_dbg("num_sge=0\n");
--        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
-+    if (!num_sge || num_sge > MAX_SGE) {
-+        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
-         return;
-     }
- 
-@@ -390,9 +390,9 @@ void rdma_backend_post_recv(RdmaBackendDev *backend_dev,
-     }
- 
-     pr_dbg("num_sge=%d\n", num_sge);
--    if (!num_sge) {
--        pr_dbg("num_sge=0\n");
--        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
-+    if (!num_sge || num_sge > MAX_SGE) {
-+        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
-         return;
-     }
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch b/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
deleted file mode 100644
index 56559c8..0000000
--- a/meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-CVE: CVE-2018-20125
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=2c858ce]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 2c858ce5da8ae6689c75182b73bc455a291cad41 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 13 Dec 2018 01:00:36 +0530
-Subject: [PATCH] pvrdma: check number of pages when creating rings
-
-When creating CQ/QP rings, an object can have up to
-PVRDMA_MAX_FAST_REG_PAGES 8 pages. Check 'npages' parameter
-to avoid excessive memory allocation or a null dereference.
-
-Reported-by: Li Qiang <liq3ea@163.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
-Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
----
- hw/rdma/vmw/pvrdma_cmd.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
-index 3b94545761..f236ac4795 100644
---- a/hw/rdma/vmw/pvrdma_cmd.c
-+++ b/hw/rdma/vmw/pvrdma_cmd.c
-@@ -259,6 +259,11 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRing **ring,
-     int rc = -EINVAL;
-     char ring_name[MAX_RING_NAME_SZ];
- 
-+    if (!nchunks || nchunks > PVRDMA_MAX_FAST_REG_PAGES) {
-+        pr_dbg("invalid nchunks: %d\n", nchunks);
-+        return rc;
-+    }
-+
-     pr_dbg("pdir_dma=0x%llx\n", (long long unsigned int)pdir_dma);
-     dir = rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
-     if (!dir) {
-@@ -372,6 +377,12 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
-     char ring_name[MAX_RING_NAME_SZ];
-     uint32_t wqe_sz;
- 
-+    if (!spages || spages > PVRDMA_MAX_FAST_REG_PAGES
-+        || !rpages || rpages > PVRDMA_MAX_FAST_REG_PAGES) {
-+        pr_dbg("invalid pages: %d, %d\n", spages, rpages);
-+        return rc;
-+    }
-+
-     pr_dbg("pdir_dma=0x%llx\n", (long long unsigned int)pdir_dma);
-     dir = rdma_pci_dma_map(pci_dev, pdir_dma, TARGET_PAGE_SIZE);
-     if (!dir) {
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch b/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
deleted file mode 100644
index 8329f2c..0000000
--- a/meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-CVE: CVE-2018-20126
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=509f57c]
-
-Backport and rebase patch to fix CVE-2018-20126.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 509f57c98e7536905bb4902363d0cba66ce7e089 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 13 Dec 2018 01:00:37 +0530
-Subject: [PATCH] pvrdma: release ring object in case of an error
-
-create_cq and create_qp routines allocate ring object, but it's
-not released in case of an error, leading to memory leakage.
-
-Reported-by: Li Qiang <liq3ea@163.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
-Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
----
- hw/rdma/vmw/pvrdma_cmd.c | 41 ++++++++++++++++++++++++++++++-----------
- 1 file changed, 30 insertions(+), 11 deletions(-)
-
-diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
-index 4faeb21..9b6796f 100644
---- a/hw/rdma/vmw/pvrdma_cmd.c
-+++ b/hw/rdma/vmw/pvrdma_cmd.c
-@@ -310,6 +310,14 @@ out:
-     return rc;
- }
- 
-+static void destroy_cq_ring(PvrdmaRing *ring)
-+{
-+    pvrdma_ring_free(ring);
-+    /* ring_state was in slot 1, not 0 so need to jump back */
-+    rdma_pci_dma_unmap(ring->dev, --ring->ring_state, TARGET_PAGE_SIZE);
-+    g_free(ring);
-+}
-+
- static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
-                      union pvrdma_cmd_resp *rsp)
- {
-@@ -333,6 +341,10 @@ static int create_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
- 
-     resp->hdr.err = rdma_rm_alloc_cq(&dev->rdma_dev_res, &dev->backend_dev,
-                                      cmd->cqe, &resp->cq_handle, ring);
-+    if (resp->hdr.err) {
-+        destroy_cq_ring(ring);
-+    }
-+
-     resp->cqe = cmd->cqe;
- 
- out:
-@@ -356,10 +368,7 @@ static int destroy_cq(PVRDMADev *dev, union pvrdma_cmd_req *req,
-     }
- 
-     ring = (PvrdmaRing *)cq->opaque;
--    pvrdma_ring_free(ring);
--    /* ring_state was in slot 1, not 0 so need to jump back */
--    rdma_pci_dma_unmap(PCI_DEVICE(dev), --ring->ring_state, TARGET_PAGE_SIZE);
--    g_free(ring);
-+    destroy_cq_ring(ring);
- 
-     rdma_rm_dealloc_cq(&dev->rdma_dev_res, cmd->cq_handle);
- 
-@@ -451,6 +460,17 @@ out:
-     return rc;
- }
- 
-+static void destroy_qp_rings(PvrdmaRing *ring)
-+{
-+    pr_dbg("sring=%p\n", &ring[0]);
-+    pvrdma_ring_free(&ring[0]);
-+    pr_dbg("rring=%p\n", &ring[1]);
-+    pvrdma_ring_free(&ring[1]);
-+
-+    rdma_pci_dma_unmap(ring->dev, ring->ring_state, TARGET_PAGE_SIZE);
-+    g_free(ring);
-+}
-+
- static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
-                      union pvrdma_cmd_resp *rsp)
- {
-@@ -482,6 +502,11 @@ static int create_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
-                                      cmd->max_recv_wr, cmd->max_recv_sge,
-                                      cmd->recv_cq_handle, rings, &resp->qpn);
- 
-+    if (resp->hdr.err) {
-+        destroy_qp_rings(rings);
-+        return resp->hdr.err;
-+    }
-+
-     resp->max_send_wr = cmd->max_send_wr;
-     resp->max_recv_wr = cmd->max_recv_wr;
-     resp->max_send_sge = cmd->max_send_sge;
-@@ -555,13 +580,7 @@ static int destroy_qp(PVRDMADev *dev, union pvrdma_cmd_req *req,
-     rdma_rm_dealloc_qp(&dev->rdma_dev_res, cmd->qp_handle);
- 
-     ring = (PvrdmaRing *)qp->opaque;
--    pr_dbg("sring=%p\n", &ring[0]);
--    pvrdma_ring_free(&ring[0]);
--    pr_dbg("rring=%p\n", &ring[1]);
--    pvrdma_ring_free(&ring[1]);
--
--    rdma_pci_dma_unmap(PCI_DEVICE(dev), ring->ring_state, TARGET_PAGE_SIZE);
--    g_free(ring);
-+    destroy_qp_rings(ring);
- 
-     return 0;
- }
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch b/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
deleted file mode 100644
index 8f8ff05..0000000
--- a/meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-CVE: CVE-2018-20191
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=2aa8645]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 2aa86456fb938a11f2b7bd57c8643c213218681c Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 13 Dec 2018 01:00:35 +0530
-Subject: [PATCH] pvrdma: add uar_read routine
-
-Define skeleton 'uar_read' routine. Avoid NULL dereference.
-
-Reported-by: Li Qiang <liq3ea@163.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
-Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
----
- hw/rdma/vmw/pvrdma_main.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
-index 64de16fb52..838ad8a949 100644
---- a/hw/rdma/vmw/pvrdma_main.c
-+++ b/hw/rdma/vmw/pvrdma_main.c
-@@ -448,6 +448,11 @@ static const MemoryRegionOps regs_ops = {
-     },
- };
- 
-+static uint64_t uar_read(void *opaque, hwaddr addr, unsigned size)
-+{
-+    return 0xffffffff;
-+}
-+
- static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
- {
-     PVRDMADev *dev = opaque;
-@@ -489,6 +494,7 @@ static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
- }
- 
- static const MemoryRegionOps uar_ops = {
-+    .read = uar_read,
-     .write = uar_write,
-     .endianness = DEVICE_LITTLE_ENDIAN,
-     .impl = {
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch b/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
deleted file mode 100644
index c02bad3..0000000
--- a/meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-CVE: CVE-2018-20216
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=f1e2e38]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From f1e2e38ee0136b7710a2caa347049818afd57a1b Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 13 Dec 2018 01:00:39 +0530
-Subject: [PATCH] pvrdma: check return value from pvrdma_idx_ring_has_ routines
-
-pvrdma_idx_ring_has_[data/space] routines also return invalid
-index PVRDMA_INVALID_IDX[=-1], if ring has no data/space. Check
-return value from these routines to avoid plausible infinite loops.
-
-Reported-by: Li Qiang <liq3ea@163.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
-Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
----
- hw/rdma/vmw/pvrdma_dev_ring.c | 29 +++++++++++------------------
- 1 file changed, 11 insertions(+), 18 deletions(-)
-
-diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
-index 01247fc041..e8e5b502f6 100644
---- a/hw/rdma/vmw/pvrdma_dev_ring.c
-+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
-@@ -73,23 +73,16 @@ out:
- 
- void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
- {
-+    int e;
-     unsigned int idx = 0, offset;
- 
--    /*
--    pr_dbg("%s: t=%d, h=%d\n", ring->name, ring->ring_state->prod_tail,
--           ring->ring_state->cons_head);
--    */
--
--    if (!pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx)) {
-+    e = pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx);
-+    if (e <= 0) {
-         pr_dbg("No more data in ring\n");
-         return NULL;
-     }
- 
-     offset = idx * ring->elem_sz;
--    /*
--    pr_dbg("idx=%d\n", idx);
--    pr_dbg("offset=%d\n", offset);
--    */
-     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
- }
- 
-@@ -105,20 +98,20 @@ void pvrdma_ring_read_inc(PvrdmaRing *ring)
- 
- void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)
- {
--    unsigned int idx, offset, tail;
-+    int idx;
-+    unsigned int offset, tail;
- 
--    /*
--    pr_dbg("%s: t=%d, h=%d\n", ring->name, ring->ring_state->prod_tail,
--           ring->ring_state->cons_head);
--    */
--
--    if (!pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &tail)) {
-+    idx = pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &tail);
-+    if (idx <= 0) {
-         pr_dbg("CQ is full\n");
-         return NULL;
-     }
- 
-     idx = pvrdma_idx(&ring->ring_state->prod_tail, ring->max_elems);
--    /* TODO: tail == idx */
-+    if (idx < 0 || tail != idx) {
-+        pr_dbg("invalid idx\n");
-+        return NULL;
-+    }
- 
-     offset = idx * ring->elem_sz;
-     return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
deleted file mode 100644
index c9508d9..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8bb018af1a7f2b9965f872a4b1121864e73e1b61 Mon Sep 17 00:00:00 2001
-From: Peter Maydell <peter.maydell@linaro.org>
-Date: Fri, 14 Dec 2018 13:30:52 +0000
-Subject: [PATCH] device_tree.c: Don't use load_image()
-
-The load_image() function is deprecated, as it does not let the
-caller specify how large the buffer to read the file into is.
-Instead use load_image_size().
-
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Reviewed-by: Eric Blake <eblake@redhat.com>
-Message-id: 20181130151712.2312-9-peter.maydell@linaro.org
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/da885fe1ee8b4589047484bd7fa05a4905b52b17]
-CVE: CVE-2018-20815
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- device_tree.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/device_tree.c b/device_tree.c
-index 6d9c9726f6..296278e12a 100644
---- a/device_tree.c
-+++ b/device_tree.c
-@@ -91,7 +91,7 @@ void *load_device_tree(const char *filename_path, int *sizep)
-     /* First allocate space in qemu for device tree */
-     fdt = g_malloc0(dt_size);
- 
--    dt_file_load_size = load_image(filename_path, fdt);
-+    dt_file_load_size = load_image_size(filename_path, fdt, dt_size);
-     if (dt_file_load_size < 0) {
-         error_report("Unable to open device tree file '%s'",
-                      filename_path);
--- 
-2.17.1
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
deleted file mode 100644
index 7de5882..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-QEMU, through version 2.10 and through version 3.1.0, is vulnerable to an
-out-of-bounds read of up to 128 bytes in the hw/i2c/i2c-ddc.c:i2c_ddc()
-function. A local attacker with permission to execute i2c commands could exploit
-this to read stack memory of the qemu process on the host.
-
-CVE: CVE-2019-3812
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b05b267840515730dbf6753495d5b7bd8b04ad1c Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Tue, 8 Jan 2019 11:23:01 +0100
-Subject: [PATCH] i2c-ddc: fix oob read
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Suggested-by: Michael Hanselmann <public@hansmi.ch>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Michael Hanselmann <public@hansmi.ch>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Message-id: 20190108102301.1957-1-kraxel@redhat.com
----
- hw/i2c/i2c-ddc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
-index be34fe072cf..0a0367ff38f 100644
---- a/hw/i2c/i2c-ddc.c
-+++ b/hw/i2c/i2c-ddc.c
-@@ -56,7 +56,7 @@ static int i2c_ddc_rx(I2CSlave *i2c)
-     I2CDDCState *s = I2CDDC(i2c);
- 
-     int value;
--    value = s->edid_blob[s->reg];
-+    value = s->edid_blob[s->reg % sizeof(s->edid_blob)];
-     s->reg++;
-     return value;
- }
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
deleted file mode 100644
index d1d7d23..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 8c2e30a92d95d89e2cf45d229bce274881026cf7 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Mon, 18 Feb 2019 23:43:49 +0530
-Subject: [PATCH] ppc: add host-serial and host-model machine attributes
- (CVE-2019-8934)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On ppc hosts, hypervisor shares following system attributes
-
-  - /proc/device-tree/system-id
-  - /proc/device-tree/model
-
-with a guest. This could lead to information leakage and misuse.[*]
-Add machine attributes to control such system information exposure
-to a guest.
-
-[*] https://wiki.openstack.org/wiki/OSSN/OSSN-0028
-
-Reported-by: Daniel P. Berrangé <berrange@redhat.com>
-Fix-suggested-by: Daniel P. Berrangé <berrange@redhat.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20190218181349.23885-1-ppandit@redhat.com>
-Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
-Reviewed-by: Greg Kurz <groug@kaod.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-
-CVE: CVE-2019-8934
-Upstream-Status: Backport
-[https://github.com/qemu/qemu/commit/27461d69a0f108dea756419251acc3ea65198f1b]
-
-Signed-off-by: Dan Tran <dantran@microsoft.com>
----
- hw/ppc/spapr.c         | 128 ++++++++++++++++++++++++++++++++++++++---
- include/hw/ppc/spapr.h |   2 +
- 2 files changed, 123 insertions(+), 7 deletions(-)
-
-diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
-index 7afd1a175b..bcee7c162d 100644
---- a/hw/ppc/spapr.c
-+++ b/hw/ppc/spapr.c
-@@ -1244,13 +1244,30 @@ static void *spapr_build_fdt(sPAPRMachineState *spapr,
-      * Add info to guest to indentify which host is it being run on
-      * and what is the uuid of the guest
-      */
--    if (kvmppc_get_host_model(&buf)) {
--        _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
--        g_free(buf);
-+    if (spapr->host_model && !g_str_equal(spapr->host_model, "none")) {
-+        if (g_str_equal(spapr->host_model, "passthrough")) {
-+            /* -M host-model=passthrough */
-+            if (kvmppc_get_host_model(&buf)) {
-+                _FDT(fdt_setprop_string(fdt, 0, "host-model", buf));
-+                g_free(buf);
-+            }
-+        } else {
-+            /* -M host-model=<user-string> */
-+            _FDT(fdt_setprop_string(fdt, 0, "host-model", spapr->host_model));
-+        }
-     }
--    if (kvmppc_get_host_serial(&buf)) {
--        _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
--        g_free(buf);
-+
-+    if (spapr->host_serial && !g_str_equal(spapr->host_serial, "none")) {
-+        if (g_str_equal(spapr->host_serial, "passthrough")) {
-+            /* -M host-serial=passthrough */
-+            if (kvmppc_get_host_serial(&buf)) {
-+                _FDT(fdt_setprop_string(fdt, 0, "host-serial", buf));
-+                g_free(buf);
-+            }
-+        } else {
-+            /* -M host-serial=<user-string> */
-+            _FDT(fdt_setprop_string(fdt, 0, "host-serial", spapr->host_serial));
-+        }
-     }
- 
-     buf = qemu_uuid_unparse_strdup(&qemu_uuid);
-@@ -3031,6 +3048,73 @@ static void spapr_set_vsmt(Object *obj, Visitor *v, const char *name,
-     visit_type_uint32(v, name, (uint32_t *)opaque, errp);
- }
- 
-+static char *spapr_get_ic_mode(Object *obj, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    if (spapr->irq == &spapr_irq_xics_legacy) {
-+        return g_strdup("legacy");
-+    } else if (spapr->irq == &spapr_irq_xics) {
-+        return g_strdup("xics");
-+    } else if (spapr->irq == &spapr_irq_xive) {
-+        return g_strdup("xive");
-+    } else if (spapr->irq == &spapr_irq_dual) {
-+        return g_strdup("dual");
-+    }
-+    g_assert_not_reached();
-+}
-+
-+static void spapr_set_ic_mode(Object *obj, const char *value, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
-+        error_setg(errp, "This machine only uses the legacy XICS backend, don't pass ic-mode");
-+        return;
-+    }
-+
-+    /* The legacy IRQ backend can not be set */
-+    if (strcmp(value, "xics") == 0) {
-+        spapr->irq = &spapr_irq_xics;
-+    } else if (strcmp(value, "xive") == 0) {
-+        spapr->irq = &spapr_irq_xive;
-+    } else if (strcmp(value, "dual") == 0) {
-+        spapr->irq = &spapr_irq_dual;
-+    } else {
-+        error_setg(errp, "Bad value for \"ic-mode\" property");
-+    }
-+}
-+
-+static char *spapr_get_host_model(Object *obj, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    return g_strdup(spapr->host_model);
-+}
-+
-+static void spapr_set_host_model(Object *obj, const char *value, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    g_free(spapr->host_model);
-+    spapr->host_model = g_strdup(value);
-+}
-+
-+static char *spapr_get_host_serial(Object *obj, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    return g_strdup(spapr->host_serial);
-+}
-+
-+static void spapr_set_host_serial(Object *obj, const char *value, Error **errp)
-+{
-+    sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-+
-+    g_free(spapr->host_serial);
-+    spapr->host_serial = g_strdup(value);
-+}
-+
- static void spapr_instance_init(Object *obj)
- {
-     sPAPRMachineState *spapr = SPAPR_MACHINE(obj);
-@@ -3067,6 +3151,25 @@ static void spapr_instance_init(Object *obj)
-                                     " the host's SMT mode", &error_abort);
-     object_property_add_bool(obj, "vfio-no-msix-emulation",
-                              spapr_get_msix_emulation, NULL, NULL);
-+
-+    /* The machine class defines the default interrupt controller mode */
-+    spapr->irq = smc->irq;
-+    object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
-+                            spapr_set_ic_mode, NULL);
-+    object_property_set_description(obj, "ic-mode",
-+                 "Specifies the interrupt controller mode (xics, xive, dual)",
-+                 NULL);
-+
-+    object_property_add_str(obj, "host-model",
-+        spapr_get_host_model, spapr_set_host_model,
-+        &error_abort);
-+    object_property_set_description(obj, "host-model",
-+        "Set host's model-id to use - none|passthrough|string", &error_abort);
-+    object_property_add_str(obj, "host-serial",
-+        spapr_get_host_serial, spapr_set_host_serial,
-+        &error_abort);
-+    object_property_set_description(obj, "host-serial",
-+        "Set host's system-id to use - none|passthrough|string", &error_abort);
- }
- 
- static void spapr_machine_finalizefn(Object *obj)
-@@ -3965,7 +4068,18 @@ static void spapr_machine_3_1_instance_options(MachineState *machine)
- 
- static void spapr_machine_3_1_class_options(MachineClass *mc)
- {
--    /* Defaults for the latest behaviour inherited from the base class */
-+    sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
-+    static GlobalProperty compat[] = {
-+        { TYPE_SPAPR_MACHINE, "host-model", "passthrough" },
-+        { TYPE_SPAPR_MACHINE, "host-serial", "passthrough" },
-+    };
-+
-+    spapr_machine_4_0_class_options(mc);
-+    compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
-+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
-+
-+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
-+    smc->update_dt_enabled = false;
- }
- 
- DEFINE_SPAPR_MACHINE(3_1, "3.1", true);
-diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
-index 6279711fe8..63692a13bd 100644
---- a/include/hw/ppc/spapr.h
-+++ b/include/hw/ppc/spapr.h
-@@ -171,6 +171,8 @@ struct sPAPRMachineState {
- 
-     /*< public >*/
-     char *kvm_type;
-+    char *host_model;
-+    char *host_serial;
- 
-     const char *icp_type;
-     int32_t irq_map_nr;
--- 
-2.22.0.vfs.1.1.57.gbaf16c8
-
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_3.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_3.1.1.1.bb
-- 
2.7.4


