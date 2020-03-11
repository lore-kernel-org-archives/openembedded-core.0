Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2403A61BBE
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:30 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id t24so317222pgj.7
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g/auE/YmIGQBmqWF9qosK7l9m5Yphj/2/oKBqUv7HuE=;
	b=FJwGTXk5CwkzYWRmEe4ikvAojjc1/3w8e6+O2dj9NSASm1v5dw7eL/YioJaDoRRq6Q
	Y0AMEsJ3DRxfqiHoHp6bi4S3VNk8FwJETmyOoVJLkqkVKCrn+PA2khVsYvITjXz+y14v
	VtF1Ou46fYC+haX+X5T4LIi05cyWe8dPfxWc6C7I02xp8Lcfi0KMnsxALmz6oNAkA1eW
	X1Di3jb64k2pFsdzfHwo+g/2WjNXntb97vAHllpNLD3Bxr+dKU6kR5NXG1AQESRfGyKp
	tKzYe9ehh7reFCSGwap/zWfwtwPTJTK+7RhntHawIVe7w2MINRoWUqljfANJa6H1k0Fx
	xs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g/auE/YmIGQBmqWF9qosK7l9m5Yphj/2/oKBqUv7HuE=;
	b=CSX08Tra8wKZ8Ji9Kog5uLJFHLtSiTK6C1F+P/RNoBhU38kFQuwGFZPS0Hhvn0wz8v
	gplYfi/N6PVrRfFYUKQsTIzAeCRA5BtRj0CclpoD+LA1EL8ylPLzYprzvs1M7TqHWv3/
	4K9QNqOCoR4NIuQ7+TfQ3AKl90XdN+/lKjzXvMsdH29VmDAjB1/+hUX2lNz2JpHJbsKd
	JVNx0v629z8fknL6BFnKp9q7/KgYct2bQzasGT6NxHiMR7jmCrVcakpnSpmTs02r7jKL
	FhdeLgccRlaT7jSY5QXJDPcNjP3BgEcJDSrNOqoyO6lC6Pd6WqHZsAZUhwACkaCwgsSq
	DF1Q==
X-Gm-Message-State: ANhLgQ3+XmRCFApwipALff3vmptN0SrKEQrk89rMWDPxQ9j0ON8h7tVB
	wIIfbfkPKp/rhrwdLL2DEGQJcIDB
X-Google-Smtp-Source: ADFU+vsoro3OMB/hTC5jkhT9aUn4GQ2AELHnP69VF0wDLbvckHSyiVr0i4+eFe4VxLy/iseSOikIFw==
X-Received: by 2002:a63:b04f:: with SMTP id z15mr673109pgo.58.1583893591703;
	Tue, 10 Mar 2020 19:26:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.31
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:13 -0700
Message-Id: <27ebe3b9c6954ee3be12f328f9cec58620930d02.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 12/16] virglrenderer: fix multiple CVEs
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:31 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix these CVE:
CVE-2019-18390
CVE-2019-18391
CVE-2020-8002

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../virglrenderer/CVE-2019-18390.patch        | 66 +++++++++++++++++++
 .../virglrenderer/CVE-2019-18391.patch        | 51 ++++++++++++++
 .../virglrenderer/CVE-2020-8002.patch         | 39 +++++++++++
 .../virglrenderer/virglrenderer_0.8.0.bb      |  3 +
 4 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
new file mode 100644
index 0000000000..ad61c95be3
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
@@ -0,0 +1,66 @@
+From 24f67de7a9088a873844a39be03cee6882260ac9 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Mon, 7 Oct 2019 10:59:56 +0200
+Subject: [PATCH] vrend: check info formats in blits
+
+Closes #141
+Closes #142
+
+v2 : drop colon in error description (Emil)
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/commit/24f67de7a9088a873844a39be03cee6882260ac9]
+CVE: CVE-2019-18390
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/virgl_hw.h       |  1 +
+ src/vrend_renderer.c | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/virgl_hw.h b/src/virgl_hw.h
+index 145780bf..5ccf3073 100644
+--- a/src/virgl_hw.h
++++ b/src/virgl_hw.h
+@@ -426,6 +426,7 @@ enum virgl_ctx_errors {
+         VIRGL_ERROR_CTX_ILLEGAL_CMD_BUFFER,
+         VIRGL_ERROR_CTX_GLES_HAVE_TES_BUT_MISS_TCS,
+         VIRGL_ERROR_GL_ANY_SAMPLES_PASSED,
++        VIRGL_ERROR_CTX_ILLEGAL_FORMAT,
+ };
+ 
+ #define VIRGL_RESOURCE_Y_0_TOP (1 << 0)
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 14fefb38..aa6a89c1 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -758,6 +758,7 @@ static const char *vrend_ctx_error_strings[] = {
+    [VIRGL_ERROR_CTX_ILLEGAL_CMD_BUFFER]    = "Illegal command buffer",
+    [VIRGL_ERROR_CTX_GLES_HAVE_TES_BUT_MISS_TCS] = "On GLES context and shader program has tesselation evaluation shader but no tesselation control shader",
+    [VIRGL_ERROR_GL_ANY_SAMPLES_PASSED] = "Query for ANY_SAMPLES_PASSED not supported",
++   [VIRGL_ERROR_CTX_ILLEGAL_FORMAT]        = "Illegal format ID",
+ };
+ 
+ static void __report_context_error(const char *fname, struct vrend_context *ctx,
+@@ -8492,6 +8493,16 @@ void vrend_renderer_blit(struct vrend_context *ctx,
+    if (ctx->in_error)
+       return;
+ 
++   if (!info->src.format || (enum virgl_formats)info->src.format >= VIRGL_FORMAT_MAX) {
++      report_context_error(ctx, VIRGL_ERROR_CTX_ILLEGAL_FORMAT, info->src.format);
++      return;
++   }
++
++   if (!info->dst.format || (enum virgl_formats)info->dst.format >= VIRGL_FORMAT_MAX) {
++      report_context_error(ctx, VIRGL_ERROR_CTX_ILLEGAL_FORMAT, info->dst.format);
++      return;
++   }
++
+    if (info->render_condition_enable == false)
+       vrend_pause_render_condition(ctx, true);
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
new file mode 100644
index 0000000000..cc641d8293
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
@@ -0,0 +1,51 @@
+From 2abeb1802e3c005b17a7123e382171b3fb665971 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 8 Oct 2019 17:27:01 +0200
+Subject: [PATCH] vrend: check that the transfer iov holds enough data for the
+ data upload
+
+Closes #140
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/commit/2abeb1802e3c005b17a7123e382171b3fb665971]
+CVE: CVE-2019-18391
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/vrend_renderer.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 694e1d0e..fe23846b 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -7005,15 +7005,22 @@ static int vrend_renderer_transfer_write_iov(struct vrend_context *ctx,
+             invert = true;
+       }
+ 
++      send_size = util_format_get_nblocks(res->base.format, info->box->width,
++                                          info->box->height) * elsize;
++      if (res->target == GL_TEXTURE_3D ||
++          res->target == GL_TEXTURE_2D_ARRAY ||
++          res->target == GL_TEXTURE_CUBE_MAP_ARRAY)
++          send_size *= info->box->depth;
++
+       if (need_temp) {
+-         send_size = util_format_get_nblocks(res->base.format, info->box->width,
+-                                             info->box->height) * elsize * info->box->depth;
+          data = malloc(send_size);
+          if (!data)
+             return ENOMEM;
+          read_transfer_data(iov, num_iovs, data, res->base.format, info->offset,
+                             stride, layer_stride, info->box, invert);
+       } else {
++         if (send_size > iov[0].iov_len - info->offset)
++            return EINVAL;
+          data = (char*)iov[0].iov_base + info->offset;
+       }
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch
new file mode 100644
index 0000000000..925f2c8eb0
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch
@@ -0,0 +1,39 @@
+From 63bcca251f093d83da7e290ab4bbd38ae69089b5 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Wed, 15 Jan 2020 13:43:58 +0100
+Subject: [PATCH] vrend: Don't try launching a grid if no CS is available
+
+Closes #155
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/63bcca251f093d83da7e290ab4bbd38ae69089b5.patch]
+CVE: CVE-2020-8002
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/vrend_renderer.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index a054bad8..2280fc43 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -4604,6 +4604,13 @@ void vrend_launch_grid(struct vrend_context *ctx,
+       }
+       ctx->sub->shader_dirty = true;
+    }
++
++   if (!ctx->sub->prog) {
++      vrend_printf("%s: Skipping compute shader execution due to missing shaders: %s\n",
++                   __func__, ctx->debug_name);
++      return;
++   }
++
+    vrend_use_program(ctx, ctx->sub->prog->id);
+ 
+    vrend_draw_bind_ubo_shader(ctx, PIPE_SHADER_COMPUTE, 0);
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index d2b11c103a..e91ccc6c57 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -8,6 +8,9 @@ DEPENDS = "libdrm mesa libepoxy"
 SRCREV = "48cc96c9aebb9d0164830a157efc8916f08f00c0"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
+           file://CVE-2019-18390.patch \
+           file://CVE-2019-18391.patch \
+           file://CVE-2020-8002.patch  \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


