Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id CA9C97725F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:34 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 65so71005379pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PwLmx5a+FCuHNEeWg/MDPAYVUN7BYbp4YMqEJKxzCjU=;
	b=XJhfLAJn226UUZp5q2DIhMRI2ba5AtnGDlA01ZhgaY3Fj1YEDT7o4JExrJhL9CsA/u
	3yHuuzq9jfLPKyVZ2IXETxQBoU71TTjoaoMSUAG9rlMb6oaaq6PSgc1dy7uM1hZPqbkX
	48XJ8S0c6AsBvtash76CYArbND+bM5e7zDPP+JwerH2x7Ux2IwEK7EcqbsOL3jF+RQLZ
	iscwIT2TRr/Ib9PPyrkTk/FzOvz8IbErWPoKUaH2gNG55jM6cgpDl/GzEuXHk9RcAQTe
	qJvkBQ+huyOeS9lDl7bAh3v9+szV97pwODkvzzIn3t+Kc7HuBR/2vUzaPYVxEBK4KobI
	/pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PwLmx5a+FCuHNEeWg/MDPAYVUN7BYbp4YMqEJKxzCjU=;
	b=SnjA1WgESUWWBvD72ZKY4IjpCq1DS8cv5ZaX47XBj9P7WY+vuI70NHy9gywXdhXxkD
	MiHEWToCI6Ad15iqgWX//i2tJsKAloqQJlNxUl54GXrBQ68npUcq8P2x7ZOPnZTCwYsh
	PHYNZaIzQePgTtivDcPSvfRTldrEbOi2lKDPmyYYBYez9u31oqnJrlqhXfA+MH4d5+0s
	/IopS62XVlpRrIQ8dxdz3ysmY9rbVjMHRSz+5x3e8hVGhKu7AcWgJBz9kZEgYn+MTftR
	KlMG36Nt8kPE7/9xMcfOVHPWcAPMwGD65oVZAZL6c9OnIl4UyWzlPOdAbx3xM3yZNpCP
	Vzrw==
X-Gm-Message-State: AG10YOTvDgInKerOnh2AlPr8OxDUdEE3I2j+6YNHIc1KigdfUTtSYYZggzkwMXmcl1tN9w==
X-Received: by 10.98.15.82 with SMTP id x79mr32662526pfi.52.1454270015284;
	Sun, 31 Jan 2016 11:53:35 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:12 -0800
Message-Id: <0489ef12f087a409bded865cb9ff5154493bde7b.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 6/8] librsvg: Security fix CVE-2015-7558
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:35 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7558 librsvg2: Stack exhaustion causing DoS

including two supporting patches.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++++++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++++++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 ++++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   6 +-
 4 files changed, 597 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
new file mode 100644
index 0000000..a3ba41f
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
@@ -0,0 +1,139 @@
+From d1c9191949747f6dcfd207831d15dd4ba00e31f2 Mon Sep 17 00:00:00 2001
+From: Benjamin Otte <otte@redhat.com>
+Date: Wed, 7 Oct 2015 05:31:08 +0200
+Subject: [PATCH] state: Store mask as reference
+
+Instead of immediately looking up the mask, store the reference and look
+it up on use.
+
+Upstream-status: Backport
+
+supporting patch
+https://git.gnome.org/browse/librsvg/commit/rsvg-styles.c?id=d1c9191949747f6dcfd207831d15dd4ba00e31f2
+
+CVE: CVE-2015-7558
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ rsvg-cairo-draw.c |  6 +++++-
+ rsvg-mask.c       | 17 -----------------
+ rsvg-mask.h       |  2 --
+ rsvg-styles.c     | 12 ++++++++----
+ rsvg-styles.h     |  2 +-
+ 5 files changed, 14 insertions(+), 25 deletions(-)
+
+Index: librsvg-2.40.10/rsvg-cairo-draw.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-cairo-draw.c
++++ librsvg-2.40.10/rsvg-cairo-draw.c
+@@ -825,7 +825,11 @@ rsvg_cairo_pop_render_stack (RsvgDrawing
+     cairo_set_operator (render->cr, state->comp_op);
+ 
+     if (state->mask) {
+-        rsvg_cairo_generate_mask (render->cr, state->mask, ctx, &render->bbox);
++        RsvgNode *mask;
++
++        mask = rsvg_defs_lookup (ctx->defs, state->mask);
++        if (mask && RSVG_NODE_TYPE (mask) == RSVG_NODE_TYPE_MASK)
++          rsvg_cairo_generate_mask (render->cr, (RsvgMask *) mask, ctx, &render->bbox);
+     } else if (state->opacity != 0xFF)
+         cairo_paint_with_alpha (render->cr, (double) state->opacity / 255.0);
+     else
+Index: librsvg-2.40.10/rsvg-mask.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-mask.c
++++ librsvg-2.40.10/rsvg-mask.c
+@@ -103,23 +103,6 @@ rsvg_get_url_string (const char *str)
+ }
+ 
+ RsvgNode *
+-rsvg_mask_parse (const RsvgDefs * defs, const char *str)
+-{
+-    char *name;
+-
+-    name = rsvg_get_url_string (str);
+-    if (name) {
+-        RsvgNode *val;
+-        val = rsvg_defs_lookup (defs, name);
+-        g_free (name);
+-
+-        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_MASK)
+-            return val;
+-    }
+-    return NULL;
+-}
+-
+-RsvgNode *
+ rsvg_clip_path_parse (const RsvgDefs * defs, const char *str)
+ {
+     char *name;
+Index: librsvg-2.40.10/rsvg-mask.h
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-mask.h
++++ librsvg-2.40.10/rsvg-mask.h
+@@ -48,8 +48,6 @@ struct _RsvgMask {
+ 
+ G_GNUC_INTERNAL
+ RsvgNode *rsvg_new_mask	    (void);
+-G_GNUC_INTERNAL
+-RsvgNode *rsvg_mask_parse   (const RsvgDefs * defs, const char *str);
+ 
+ typedef struct _RsvgClipPath RsvgClipPath;
+ 
+Index: librsvg-2.40.10/rsvg-styles.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-styles.c
++++ librsvg-2.40.10/rsvg-styles.c
+@@ -221,6 +221,7 @@ rsvg_state_clone (RsvgState * dst, const
+ 
+     *dst = *src;
+     dst->parent = parent;
++    dst->mask = g_strdup (src->mask);
+     dst->font_family = g_strdup (src->font_family);
+     dst->lang = g_strdup (src->lang);
+     rsvg_paint_server_ref (dst->fill);
+@@ -356,7 +357,8 @@ rsvg_state_inherit_run (RsvgState * dst,
+ 
+     if (inherituninheritables) {
+         dst->clip_path_ref = src->clip_path_ref;
+-        dst->mask = src->mask;
++        g_free (dst->mask);
++        dst->mask = g_strdup (src->mask);
+         dst->enable_background = src->enable_background;
+         dst->adobe_blend = src->adobe_blend;
+         dst->opacity = src->opacity;
+@@ -444,6 +446,7 @@ rsvg_state_inherit (RsvgState * dst, con
+ void
+ rsvg_state_finalize (RsvgState * state)
+ {
++    g_free (state->mask);
+     g_free (state->font_family);
+     g_free (state->lang);
+     rsvg_paint_server_unref (state->fill);
+@@ -517,9 +520,10 @@ rsvg_parse_style_pair (RsvgHandle * ctx,
+             state->adobe_blend = 11;
+         else
+             state->adobe_blend = 0;
+-    } else if (g_str_equal (name, "mask"))
+-        state->mask = rsvg_mask_parse (ctx->priv->defs, value);
+-    else if (g_str_equal (name, "clip-path")) {
++    } else if (g_str_equal (name, "mask")) {
++        g_free (state->mask);
++        state->mask = rsvg_get_url_string (value);
++    } else if (g_str_equal (name, "clip-path")) {
+         state->clip_path_ref = rsvg_clip_path_parse (ctx->priv->defs, value);
+     } else if (g_str_equal (name, "overflow")) {
+         if (!g_str_equal (value, "inherit")) {
+Index: librsvg-2.40.10/rsvg-styles.h
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-styles.h
++++ librsvg-2.40.10/rsvg-styles.h
+@@ -80,7 +80,7 @@ struct _RsvgState {
+     cairo_matrix_t personal_affine;
+ 
+     RsvgFilter *filter;
+-    void *mask;
++    char *mask;
+     void *clip_path_ref;
+     guint8 adobe_blend;         /* 0..11 */
+     guint8 opacity;             /* 0..255 */
diff --git a/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
new file mode 100644
index 0000000..9f6820e
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
@@ -0,0 +1,230 @@
+From 6cfaab12c70cd4a34c4730837f1ecdf792593c90 Mon Sep 17 00:00:00 2001
+From: Benjamin Otte <otte@redhat.com>
+Date: Wed, 7 Oct 2015 07:57:39 +0200
+Subject: [PATCH] state: Look up clip path lazily
+
+Upstream-status: Backport
+
+supporting patch
+https://git.gnome.org/browse/librsvg/commit/rsvg-styles.c?id=6cfaab12c70cd4a34c4730837f1ecdf792593c90
+
+CVE: CVE-2015-7558
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ rsvg-cairo-draw.c | 56 +++++++++++++++++++++++++++++++++----------------------
+ rsvg-mask.c       | 17 -----------------
+ rsvg-mask.h       |  2 --
+ rsvg-styles.c     | 10 +++++++---
+ rsvg-styles.h     |  2 +-
+ 5 files changed, 42 insertions(+), 45 deletions(-)
+
+Index: librsvg-2.40.10/rsvg-cairo-draw.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-cairo-draw.c
++++ librsvg-2.40.10/rsvg-cairo-draw.c
+@@ -461,7 +461,7 @@ rsvg_cairo_render_path (RsvgDrawingCtx *
+         return;
+ 
+     need_tmpbuf = ((state->fill != NULL) && (state->stroke != NULL) && state->opacity != 0xff)
+-        || state->clip_path_ref || state->mask || state->filter
++        || state->clip_path || state->mask || state->filter
+         || (state->comp_op != CAIRO_OPERATOR_OVER);
+ 
+     if (need_tmpbuf)
+@@ -708,18 +708,6 @@ rsvg_cairo_generate_mask (cairo_t * cr,
+ }
+ 
+ static void
+-rsvg_cairo_push_early_clips (RsvgDrawingCtx * ctx)
+-{
+-    RsvgCairoRender *render = RSVG_CAIRO_RENDER (ctx->render);
+-  
+-    cairo_save (render->cr);
+-    if (rsvg_current_state (ctx)->clip_path_ref)
+-        if (((RsvgClipPath *) rsvg_current_state (ctx)->clip_path_ref)->units == userSpaceOnUse)
+-            rsvg_cairo_clip (ctx, rsvg_current_state (ctx)->clip_path_ref, NULL);
+-
+-}
+-
+-static void
+ rsvg_cairo_push_render_stack (RsvgDrawingCtx * ctx)
+ {
+     /* XXX: Untested, probably needs help wrt filters */
+@@ -731,9 +719,27 @@ rsvg_cairo_push_render_stack (RsvgDrawin
+     RsvgState *state = rsvg_current_state (ctx);
+     gboolean lateclip = FALSE;
+ 
+-    if (rsvg_current_state (ctx)->clip_path_ref)
+-        if (((RsvgClipPath *) rsvg_current_state (ctx)->clip_path_ref)->units == objectBoundingBox)
+-            lateclip = TRUE;
++    if (rsvg_current_state (ctx)->clip_path) {
++        RsvgNode *node;
++        node = rsvg_defs_lookup (ctx->defs, rsvg_current_state (ctx)->clip_path);
++        if (node && RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_CLIP_PATH) {
++            RsvgClipPath *clip_path = (RsvgClipPath *) node;
++
++            switch (clip_path->units) {
++            case userSpaceOnUse:
++                rsvg_cairo_clip (ctx, clip_path, NULL);
++                break;
++            case objectBoundingBox:
++                lateclip = TRUE;
++                break;
++
++            default:
++                g_assert_not_reached ();
++                break;
++            }
++
++        }
++    }
+ 
+     if (state->opacity == 0xFF
+         && !state->filter && !state->mask && !lateclip && (state->comp_op == CAIRO_OPERATOR_OVER)
+@@ -774,7 +780,9 @@ rsvg_cairo_push_render_stack (RsvgDrawin
+ void
+ rsvg_cairo_push_discrete_layer (RsvgDrawingCtx * ctx)
+ {
+-    rsvg_cairo_push_early_clips (ctx);
++    RsvgCairoRender *render = RSVG_CAIRO_RENDER (ctx->render);
++
++    cairo_save (render->cr);
+     rsvg_cairo_push_render_stack (ctx);
+ }
+ 
+@@ -783,14 +791,18 @@ rsvg_cairo_pop_render_stack (RsvgDrawing
+ {
+     RsvgCairoRender *render = RSVG_CAIRO_RENDER (ctx->render);
+     cairo_t *child_cr = render->cr;
+-    gboolean lateclip = FALSE;
++    RsvgClipPath *lateclip = NULL;
+     cairo_surface_t *surface = NULL;
+     RsvgState *state = rsvg_current_state (ctx);
+     gboolean nest;
+ 
+-    if (rsvg_current_state (ctx)->clip_path_ref)
+-        if (((RsvgClipPath *) rsvg_current_state (ctx)->clip_path_ref)->units == objectBoundingBox)
+-            lateclip = TRUE;
++    if (rsvg_current_state (ctx)->clip_path) {
++        RsvgNode *node;
++        node = rsvg_defs_lookup (ctx->defs, rsvg_current_state (ctx)->clip_path);
++        if (node && RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_CLIP_PATH
++            && ((RsvgClipPath *) node)->units == objectBoundingBox)
++            lateclip = (RsvgClipPath *) node;
++    }
+ 
+     if (state->opacity == 0xFF
+         && !state->filter && !state->mask && !lateclip && (state->comp_op == CAIRO_OPERATOR_OVER)
+@@ -820,7 +832,7 @@ rsvg_cairo_pop_render_stack (RsvgDrawing
+                               nest ? 0 : render->offset_y);
+ 
+     if (lateclip)
+-        rsvg_cairo_clip (ctx, rsvg_current_state (ctx)->clip_path_ref, &render->bbox);
++        rsvg_cairo_clip (ctx, lateclip, &render->bbox);
+ 
+     cairo_set_operator (render->cr, state->comp_op);
+ 
+Index: librsvg-2.40.10/rsvg-mask.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-mask.c
++++ librsvg-2.40.10/rsvg-mask.c
+@@ -102,23 +102,6 @@ rsvg_get_url_string (const char *str)
+     return NULL;
+ }
+ 
+-RsvgNode *
+-rsvg_clip_path_parse (const RsvgDefs * defs, const char *str)
+-{
+-    char *name;
+-
+-    name = rsvg_get_url_string (str);
+-    if (name) {
+-        RsvgNode *val;
+-        val = rsvg_defs_lookup (defs, name);
+-        g_free (name);
+-
+-        if (val && RSVG_NODE_TYPE (val) == RSVG_NODE_TYPE_CLIP_PATH)
+-            return val;
+-    }
+-    return NULL;
+-}
+-
+ static void
+ rsvg_clip_path_set_atts (RsvgNode * self, RsvgHandle * ctx, RsvgPropertyBag * atts)
+ {
+Index: librsvg-2.40.10/rsvg-mask.h
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-mask.h
++++ librsvg-2.40.10/rsvg-mask.h
+@@ -58,8 +58,6 @@ struct _RsvgClipPath {
+ 
+ G_GNUC_INTERNAL
+ RsvgNode *rsvg_new_clip_path	(void);
+-G_GNUC_INTERNAL
+-RsvgNode *rsvg_clip_path_parse	(const RsvgDefs * defs, const char *str);
+ 
+ G_END_DECLS
+ #endif
+Index: librsvg-2.40.10/rsvg-styles.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-styles.c
++++ librsvg-2.40.10/rsvg-styles.c
+@@ -149,7 +149,7 @@ rsvg_state_init (RsvgState * state)
+     state->visible = TRUE;
+     state->cond_true = TRUE;
+     state->filter = NULL;
+-    state->clip_path_ref = NULL;
++    state->clip_path = NULL;
+     state->startMarker = NULL;
+     state->middleMarker = NULL;
+     state->endMarker = NULL;
+@@ -222,6 +222,7 @@ rsvg_state_clone (RsvgState * dst, const
+     *dst = *src;
+     dst->parent = parent;
+     dst->mask = g_strdup (src->mask);
++    dst->clip_path = g_strdup (src->clip_path);
+     dst->font_family = g_strdup (src->font_family);
+     dst->lang = g_strdup (src->lang);
+     rsvg_paint_server_ref (dst->fill);
+@@ -356,7 +357,8 @@ rsvg_state_inherit_run (RsvgState * dst,
+     }
+ 
+     if (inherituninheritables) {
+-        dst->clip_path_ref = src->clip_path_ref;
++        g_free (dst->clip_path);
++        dst->clip_path = g_strdup (src->clip_path);
+         g_free (dst->mask);
+         dst->mask = g_strdup (src->mask);
+         dst->enable_background = src->enable_background;
+@@ -447,6 +449,7 @@ void
+ rsvg_state_finalize (RsvgState * state)
+ {
+     g_free (state->mask);
++    g_free (state->clip_path);
+     g_free (state->font_family);
+     g_free (state->lang);
+     rsvg_paint_server_unref (state->fill);
+@@ -524,7 +527,8 @@ rsvg_parse_style_pair (RsvgHandle * ctx,
+         g_free (state->mask);
+         state->mask = rsvg_get_url_string (value);
+     } else if (g_str_equal (name, "clip-path")) {
+-        state->clip_path_ref = rsvg_clip_path_parse (ctx->priv->defs, value);
++        g_free (state->clip_path);
++        state->clip_path = rsvg_get_url_string (value);
+     } else if (g_str_equal (name, "overflow")) {
+         if (!g_str_equal (value, "inherit")) {
+             state->overflow = rsvg_css_parse_overflow (value, &state->has_overflow);
+Index: librsvg-2.40.10/rsvg-styles.h
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-styles.h
++++ librsvg-2.40.10/rsvg-styles.h
+@@ -81,7 +81,7 @@ struct _RsvgState {
+ 
+     RsvgFilter *filter;
+     char *mask;
+-    void *clip_path_ref;
++    char *clip_path;
+     guint8 adobe_blend;         /* 0..11 */
+     guint8 opacity;             /* 0..255 */
+ 
diff --git a/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch
new file mode 100644
index 0000000..dd67ab7
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch
@@ -0,0 +1,223 @@
+From a51919f7e1ca9c535390a746fbf6e28c8402dc61 Mon Sep 17 00:00:00 2001
+From: Benjamin Otte <otte@redhat.com>
+Date: Wed, 7 Oct 2015 08:45:37 +0200
+Subject: [PATCH] rsvg: Add rsvg_acquire_node()
+
+This function does proper recursion checks when looking up resources
+from URLs and thereby helps avoiding infinite loops when cyclic
+references span multiple types of elements.
+
+Upstream-status: Backport
+
+https://git.gnome.org/browse/librsvg/commit/rsvg-styles.c?id=a51919f7e1ca9c535390a746fbf6e28c8402dc61
+
+CVE: CVE-2015-7558
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ rsvg-base.c         | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ rsvg-cairo-draw.c   | 15 +++++++++++----
+ rsvg-cairo-render.c |  1 +
+ rsvg-filter.c       |  9 +++++++--
+ rsvg-private.h      |  5 +++++
+ 5 files changed, 79 insertions(+), 6 deletions(-)
+
+Index: librsvg-2.40.10/rsvg-base.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-base.c
++++ librsvg-2.40.10/rsvg-base.c
+@@ -1236,6 +1236,8 @@ rsvg_drawing_ctx_free (RsvgDrawingCtx *
+ 	g_slist_free (handle->drawsub_stack);
+ 
+     g_slist_free (handle->ptrs);
++    g_warn_if_fail (handle->acquired_nodes == NULL);
++    g_slist_free (handle->acquired_nodes);
+ 	
+     if (handle->base_uri)
+         g_free (handle->base_uri);
+@@ -2018,6 +2020,59 @@ rsvg_push_discrete_layer (RsvgDrawingCtx
+     ctx->render->push_discrete_layer (ctx);
+ }
+ 
++/*
++ * rsvg_acquire_node:
++ * @ctx: The drawing context in use
++ * @url: The IRI to lookup
++ *
++ * Use this function when looking up urls to other nodes. This
++ * function does proper recursion checking and thereby avoids
++ * infinite loops.
++ *
++ * Nodes acquired by this function must be released using
++ * rsvg_release_node() in reverse acquiring order.
++ *
++ * Returns: The node referenced by @url or %NULL if the @url
++ *          does not reference a node.
++ */
++RsvgNode *
++rsvg_acquire_node (RsvgDrawingCtx * ctx, const char *url)
++{
++  RsvgNode *node;
++
++  node = rsvg_defs_lookup (ctx->defs, url);
++  if (node == NULL)
++    return NULL;
++
++  if (g_slist_find (ctx->acquired_nodes, node))
++    return NULL;
++
++  ctx->acquired_nodes = g_slist_prepend (ctx->acquired_nodes, node);
++
++  return node;
++}
++
++/*
++ * rsvg_release_node:
++ * @ctx: The drawing context the node was acquired from
++ * @node: Node to release
++ *
++ * Releases a node previously acquired via rsvg_acquire_node().
++ *
++ * if @node is %NULL, this function does nothing.
++ */
++void
++rsvg_release_node (RsvgDrawingCtx * ctx, RsvgNode *node)
++{
++  if (node == NULL)
++    return;
++
++  g_return_if_fail (ctx->acquired_nodes != NULL);
++  g_return_if_fail (ctx->acquired_nodes->data == node);
++
++  ctx->acquired_nodes = g_slist_remove (ctx->acquired_nodes, node);
++}
++
+ void
+ rsvg_render_path (RsvgDrawingCtx * ctx, const cairo_path_t *path)
+ {
+Index: librsvg-2.40.10/rsvg-cairo-draw.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-cairo-draw.c
++++ librsvg-2.40.10/rsvg-cairo-draw.c
+@@ -721,7 +721,7 @@ rsvg_cairo_push_render_stack (RsvgDrawin
+ 
+     if (rsvg_current_state (ctx)->clip_path) {
+         RsvgNode *node;
+-        node = rsvg_defs_lookup (ctx->defs, rsvg_current_state (ctx)->clip_path);
++        node = rsvg_acquire_node (ctx, rsvg_current_state (ctx)->clip_path);
+         if (node && RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_CLIP_PATH) {
+             RsvgClipPath *clip_path = (RsvgClipPath *) node;
+ 
+@@ -739,6 +739,8 @@ rsvg_cairo_push_render_stack (RsvgDrawin
+             }
+ 
+         }
++        
++        rsvg_release_node (ctx, node);
+     }
+ 
+     if (state->opacity == 0xFF
+@@ -798,10 +800,12 @@ rsvg_cairo_pop_render_stack (RsvgDrawing
+ 
+     if (rsvg_current_state (ctx)->clip_path) {
+         RsvgNode *node;
+-        node = rsvg_defs_lookup (ctx->defs, rsvg_current_state (ctx)->clip_path);
++        node = rsvg_acquire_node (ctx, rsvg_current_state (ctx)->clip_path);
+         if (node && RSVG_NODE_TYPE (node) == RSVG_NODE_TYPE_CLIP_PATH
+             && ((RsvgClipPath *) node)->units == objectBoundingBox)
+             lateclip = (RsvgClipPath *) node;
++        else
++            rsvg_release_node (ctx, node);
+     }
+ 
+     if (state->opacity == 0xFF
+@@ -831,17 +835,20 @@ rsvg_cairo_pop_render_stack (RsvgDrawing
+                               nest ? 0 : render->offset_x,
+                               nest ? 0 : render->offset_y);
+ 
+-    if (lateclip)
++    if (lateclip) {
+         rsvg_cairo_clip (ctx, lateclip, &render->bbox);
++        rsvg_release_node (ctx, (RsvgNode *) lateclip);
++    }
+ 
+     cairo_set_operator (render->cr, state->comp_op);
+ 
+     if (state->mask) {
+         RsvgNode *mask;
+ 
+-        mask = rsvg_defs_lookup (ctx->defs, state->mask);
++        mask = rsvg_acquire_node (ctx, state->mask);
+         if (mask && RSVG_NODE_TYPE (mask) == RSVG_NODE_TYPE_MASK)
+           rsvg_cairo_generate_mask (render->cr, (RsvgMask *) mask, ctx, &render->bbox);
++        rsvg_release_node (ctx, mask);
+     } else if (state->opacity != 0xFF)
+         cairo_paint_with_alpha (render->cr, (double) state->opacity / 255.0);
+     else
+Index: librsvg-2.40.10/rsvg-cairo-render.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-cairo-render.c
++++ librsvg-2.40.10/rsvg-cairo-render.c
+@@ -155,6 +155,7 @@ rsvg_cairo_new_drawing_ctx (cairo_t * cr
+     draw->pango_context = NULL;
+     draw->drawsub_stack = NULL;
+     draw->ptrs = NULL;
++    draw->acquired_nodes = NULL;
+ 
+     rsvg_state_push (draw);
+     state = rsvg_current_state (draw);
+Index: librsvg-2.40.10/rsvg-filter.c
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-filter.c
++++ librsvg-2.40.10/rsvg-filter.c
+@@ -3921,6 +3921,7 @@ rsvg_filter_primitive_image_render_in (R
+     RsvgDrawingCtx *ctx;
+     RsvgFilterPrimitiveImage *upself;
+     RsvgNode *drawable;
++    cairo_surface_t *result;
+ 
+     ctx = context->ctx;
+ 
+@@ -3929,13 +3930,17 @@ rsvg_filter_primitive_image_render_in (R
+     if (!upself->href)
+         return NULL;
+ 
+-    drawable = rsvg_defs_lookup (ctx->defs, upself->href->str);
++    drawable = rsvg_acquire_node (ctx, upself->href->str);
+     if (!drawable)
+         return NULL;
+ 
+     rsvg_current_state (ctx)->affine = context->paffine;
+ 
+-    return rsvg_get_surface_of_node (ctx, drawable, context->width, context->height);
++    result = rsvg_get_surface_of_node (ctx, drawable, context->width, context->height);
++
++    rsvg_release_node (ctx, drawable);
++
++    return result;
+ }
+ 
+ static cairo_surface_t *
+Index: librsvg-2.40.10/rsvg-private.h
+===================================================================
+--- librsvg-2.40.10.orig/rsvg-private.h
++++ librsvg-2.40.10/rsvg-private.h
+@@ -200,6 +200,7 @@ struct RsvgDrawingCtx {
+     GSList *vb_stack;
+     GSList *drawsub_stack;
+     GSList *ptrs;
++    GSList *acquired_nodes;
+ };
+ 
+ /*Abstract base class for context for our backends (one as yet)*/
+@@ -360,6 +361,10 @@ void rsvg_pop_discrete_layer    (RsvgDra
+ G_GNUC_INTERNAL
+ void rsvg_push_discrete_layer   (RsvgDrawingCtx * ctx);
+ G_GNUC_INTERNAL
++RsvgNode *rsvg_acquire_node     (RsvgDrawingCtx * ctx, const char *url);
++G_GNUC_INTERNAL
++void rsvg_release_node          (RsvgDrawingCtx * ctx, RsvgNode *node);
++G_GNUC_INTERNAL
+ void rsvg_render_path           (RsvgDrawingCtx * ctx, const cairo_path_t *path);
+ G_GNUC_INTERNAL
+ void rsvg_render_surface        (RsvgDrawingCtx * ctx, cairo_surface_t *surface,
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
index 06552c2..cb8a73c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
@@ -12,7 +12,11 @@ BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 
-SRC_URI += "file://gtk-option.patch"
+SRC_URI += "file://gtk-option.patch \
+            file://CVE-2015-7558_1.patch \
+            file://CVE-2015-7558_2.patch \
+            file://CVE-2015-7558_3.patch \
+            "
 
 SRC_URI[archive.md5sum] = "fadebe2e799ab159169ee3198415ff85"
 SRC_URI[archive.sha256sum] = "965c807438ce90b204e930ff80c92eba1606a2f6fd5ccfd09335c99896dd3479"
-- 
2.3.5


