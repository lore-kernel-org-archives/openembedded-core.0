Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C1CD4758D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 21:48:21 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 66C4B20744
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:48:21 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Sep 2015 23:48:06 +0200
Message-Id: <1443390491-23728-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
Subject: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to version 1.6.0
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
X-List-Received-Date: Sun, 27 Sep 2015 21:48:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A number of patches had to be deleted in order for the recipe to work.

Patches which cannot be applied cleanly to 1.6.0 and are nontrivial to fix:
* 0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
* do-not-change-eos-event-to-gap-event2.patch
* do-not-change-eos-event-to-gap-event3.patch
* do-not-change-eos-event-to-gap-event-if.patch
* handle-audio-video-decoder-error.patch
* taglist-not-send-to-down-stream-if-all-the-frame-cor.patch

Patches which either were backports or accepted and integrated:
* 0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
* 0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
* 0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
* fix-id3demux-utf16-to-utf8-issue.patch
* videobuffer_updata_alignment_update.patch
* videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  20 ++--
 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 ---------------------
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  26 -----
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 --------------
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 -----------
 .../do-not-change-eos-event-to-gap-event-if.patch  |  37 ------
 .../do-not-change-eos-event-to-gap-event2.patch    |  49 --------
 .../do-not-change-eos-event-to-gap-event3.patch    |  31 -----
 .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 ---------
 .../handle-audio-video-decoder-error.patch         |  64 ----------
 ...-send-to-down-stream-if-all-the-frame-cor.patch |  57 ---------
 .../videobuffer_updata_alignment_update.patch      |  53 ---------
 ...p-sticky-events-around-when-doing-a-soft-.patch |  46 --------
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  30 -----
 .../gstreamer/gstreamer1.0-plugins-base_1.6.0.bb   |  18 +++
 15 files changed, 29 insertions(+), 741 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 47f3f40..fbb6c59 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -3,7 +3,7 @@ require gstreamer1.0-plugins.inc
 LICENSE = "GPLv2+ & LGPLv2+"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
-DEPENDS += "freetype liboil util-linux"
+DEPENDS += "freetype liboil util-linux iso-codes zlib"
 
 inherit gettext
 
@@ -12,23 +12,25 @@ PACKAGES_DYNAMIC =+ "^libgst.*"
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    orc ivorbis ogg theora vorbis pango \
+    orc ivorbis ogg theora vorbis pango gio-unix-2.0 \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender"
 X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
 X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
-PACKAGECONFIG[x11]     = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-PACKAGECONFIG[alsa]    = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[ivorbis] = "--enable-ivorbis,--disable-ivorbis,tremor"
-PACKAGECONFIG[ogg]     = "--enable-ogg,--disable-ogg,libogg"
-PACKAGECONFIG[theora]  = "--enable-theora,--disable-theora,libtheora"
-PACKAGECONFIG[vorbis]  = "--enable-vorbis,--disable-vorbis,libvorbis"
-PACKAGECONFIG[pango]   = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
+PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
+PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
+PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
 
 
 # cdparanoia and libvisual do not seem to exist anywhere in OE
 EXTRA_OECONF += " \
+    --enable-zlib \
     --disable-freetypetest \
     --disable-cdparanoia \
     --disable-libvisual \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
deleted file mode 100644
index 03dca95..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 3781d40940d46d7e6a502092d24aac7997f6da5b Mon Sep 17 00:00:00 2001
-From: Mingke Wang <mingke.wang@freescale.com>
-Date: Thu, 5 Mar 2015 12:06:23 +0800
-Subject: [PATCH 1/4] basetextoverlay: make memory copy when video buffer's
- memory is ready only
-
-1. since gst_buffer_make_writable just lookup the refcount to determine if
-   a buffer is writable, and it will use _gst_buffer_copy() which don't
-   perform a deep memory copy even if the flag of a memory is set to
-   GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
-   gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to perform
-   deep memory copy. if the allocator of a memory don't support mem_copy
-   interface, the it will return NULL, if this case, we can use
-   gst_buffer_make_writable() to get a shared memory buffer or the orignal
-   buffer if the buffer's refcount is 1.
-2.  new feature is no added if caps has no feature during caps negotiation
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747495]
-
-Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
-
-diff --git a/ext/pango/gstbasetextoverlay.c b/ext/pango/gstbasetextoverlay.c
-index c919861..3c0a1d7 100755
---- a/ext/pango/gstbasetextoverlay.c
-+++ b/ext/pango/gstbasetextoverlay.c
-@@ -747,6 +747,7 @@ gst_base_text_overlay_negotiate (GstBaseTextOverlay * overlay, GstCaps * caps)
-     if (f == NULL) {
-       f = gst_caps_features_new
-           (GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION, NULL);
-+      gst_caps_set_features(overlay_caps, 0, f);
-     } else {
-       gst_caps_features_add (f,
-           GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION);
-@@ -1890,16 +1891,71 @@ gst_base_text_overlay_push_frame (GstBaseTextOverlay * overlay,
-   if (gst_pad_check_reconfigure (overlay->srcpad))
-     gst_base_text_overlay_negotiate (overlay, NULL);
- 
--  video_frame = gst_buffer_make_writable (video_frame);
--
-   if (overlay->attach_compo_to_buffer) {
-     GST_DEBUG_OBJECT (overlay, "Attaching text overlay image to video buffer");
-+    video_frame = gst_buffer_make_writable (video_frame);
-     gst_buffer_add_video_overlay_composition_meta (video_frame,
-         overlay->composition);
-     /* FIXME: emulate shaded background box if want_shading=true */
-     goto done;
-   }
- 
-+  gint m = gst_buffer_n_memory(video_frame);
-+  gboolean mem_rdonly = FALSE;
-+  GstMemory *mem;
-+  GstBuffer *orig = video_frame;
-+
-+  while (--m>=0) {
-+    mem = gst_buffer_get_memory(video_frame, m);
-+    if (GST_MEMORY_IS_READONLY(mem)) {
-+      mem_rdonly = TRUE;
-+      gst_memory_unref (mem);
-+      break;
-+    }
-+    gst_memory_unref (mem);
-+  }
-+
-+  if (mem_rdonly) {
-+    // since gst_buffer_make_writable just lookup the refcount to determine if
-+    // a buffer is writable, and it will use _gst_buffer_copy() which don't
-+    // perform a deep memory copy even if the flag of a memory is set to
-+    // GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
-+    // gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to perform
-+    // deep memory copy. if the allocator of a memory don't support mem_copy
-+    // interface, the it will return NULL, if this case, we can use
-+    // gst_buffer_make_writable() to get a shared memory buffer or the orignal
-+    // buffer if the buffer's refcount is 1.
-+    GstBuffer *new_buf = gst_buffer_copy_region (video_frame,
-+        GST_BUFFER_COPY_ALL | GST_BUFFER_COPY_DEEP, 0, -1);
-+
-+    GST_DEBUG_OBJECT (overlay, "copy %s video frame buffer %p -> %p",
-+        g_type_name (GST_MINI_OBJECT_TYPE (video_frame)), video_frame, new_buf);
-+
-+    if (!new_buf) {
-+      //maybe the allocator don't support mem_copy interface, the we just use
-+      //gst_buffer_make_writable() to get a writable buffer.
-+      video_frame = gst_buffer_make_writable (video_frame);
-+    } else {
-+      gst_mini_object_unref (video_frame);
-+      GST_BUFFER_FLAG_UNSET (new_buf, GST_BUFFER_FLAG_TAG_MEMORY);
-+      video_frame = new_buf;
-+    }
-+
-+    if (!video_frame) {
-+      GST_WARNING_OBJECT (overlay, "make writable buffer failed");
-+      return GST_FLOW_OK;
-+    }
-+
-+    m = gst_buffer_n_memory(video_frame);
-+    while (--m>=0) {
-+      mem = gst_buffer_get_memory(video_frame, m);
-+      GST_MEMORY_FLAG_UNSET (mem, GST_MEMORY_FLAG_READONLY);
-+      gst_memory_unref (mem);
-+    }
-+  } else {
-+    video_frame = gst_buffer_make_writable (video_frame);
-+  }
-+
-   if (!gst_video_frame_map (&frame, &overlay->info, video_frame,
-           GST_MAP_READWRITE))
-     goto invalid_frame;
-@@ -1918,6 +1974,18 @@ gst_base_text_overlay_push_frame (GstBaseTextOverlay * overlay,
- 
-   gst_video_frame_unmap (&frame);
- 
-+  if (mem_rdonly && orig == video_frame) {
-+    //if we used the original buffer and it's mem is set to read only,
-+    //recover the memory ready only flag since we unset it before
-+    // gst_video_frame_map ()
-+    m = gst_buffer_n_memory(video_frame);
-+    while (--m>=0) {
-+      mem = gst_buffer_get_memory(video_frame, m);
-+      GST_MEMORY_FLAGS(mem) |= (GST_MEMORY_FLAG_READONLY);
-+      gst_memory_unref (mem);
-+    }
-+  }
-+
- done:
- 
-   return gst_pad_push (overlay->srcpad, video_frame);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
deleted file mode 100644
index 3db4724..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 16 Sep 2014 01:07:18 +0300
-Subject: [PATCH] video-frame: Don't ref buffers twice when mapping
-
-Upstream-Status: Backport [1.5.1]
----
- gst-libs/gst/video/video-frame.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
-index 01f23c0..8a9ae96 100644
---- a/gst-libs/gst/video/video-frame.c
-+++ b/gst-libs/gst/video/video-frame.c
-@@ -105,7 +105,7 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
-       frame->data[i] = frame->map[0].data + info->offset[i];
-     }
-   }
--  frame->buffer = gst_buffer_ref (buffer);
-+  frame->buffer = buffer;
-   if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
-     gst_buffer_ref (frame->buffer);
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
deleted file mode 100644
index c465b5c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 40a293d44d1aeccf5eb8e86f23a0b13666111c5c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Fri, 12 Sep 2014 14:39:16 +0300
-Subject: [PATCH 2/3] video-frame: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
-
-This makes sure that the buffer is not reffed another time when
-storing it in the GstVideoFrame, keeping it writable if it was
-writable.
-
-Upstream-Status: Backport [1.5.1]
-https://bugzilla.gnome.org/show_bug.cgi?id=736118
----
- gst-libs/gst/video/video-frame.c |    9 ++++++++-
- gst-libs/gst/video/video-frame.h |   18 ++++++++++++++++++
- 2 files changed, 26 insertions(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
-index 537cf70..01f23c0 100644
---- a/gst-libs/gst/video/video-frame.c
-+++ b/gst-libs/gst/video/video-frame.c
-@@ -106,6 +106,9 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
-     }
-   }
-   frame->buffer = gst_buffer_ref (buffer);
-+  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
-+    gst_buffer_ref (frame->buffer);
-+
-   frame->meta = meta;
- 
-   /* buffer flags enhance the frame flags */
-@@ -189,11 +192,13 @@ gst_video_frame_unmap (GstVideoFrame * frame)
-   GstBuffer *buffer;
-   GstVideoMeta *meta;
-   gint i;
-+  GstMapFlags flags;
- 
-   g_return_if_fail (frame != NULL);
- 
-   buffer = frame->buffer;
-   meta = frame->meta;
-+  flags = frame->map[0].flags;
- 
-   if (meta) {
-     for (i = 0; i < frame->info.finfo->n_planes; i++) {
-@@ -202,7 +207,9 @@ gst_video_frame_unmap (GstVideoFrame * frame)
-   } else {
-     gst_buffer_unmap (buffer, &frame->map[0]);
-   }
--  gst_buffer_unref (buffer);
-+
-+  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
-+    gst_buffer_unref (frame->buffer);
- }
- 
- /**
-diff --git a/gst-libs/gst/video/video-frame.h b/gst-libs/gst/video/video-frame.h
-index 627fab0..f8e6304 100644
---- a/gst-libs/gst/video/video-frame.h
-+++ b/gst-libs/gst/video/video-frame.h
-@@ -149,6 +149,24 @@ typedef enum {
-   GST_VIDEO_BUFFER_FLAG_LAST        = (GST_BUFFER_FLAG_LAST << 8)
- } GstVideoBufferFlags;
- 
-+/**
-+ * GstVideoBufferFlags:
-+ * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
-+ *                                    the GstVideoFrame. This makes sure that the buffer stays
-+ *                                    writable while the frame is mapped, but requires that the
-+ *                                    buffer reference stays valid until the frame is unmapped again.
-+ * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
-+ *
-+ * Additional mapping flags for gst_video_frame_map().
-+ *
-+ * Since: 1.6
-+ */
-+typedef enum {
-+  GST_VIDEO_FRAME_MAP_FLAG_NO_REF   = (GST_MAP_FLAG_LAST << 0),
-+  GST_VIDEO_FRAME_MAP_FLAG_LAST     = (GST_MAP_FLAG_LAST << 8)
-+  /* 8 more flags possible afterwards */
-+} GstVideoFrameMapFlags;
-+
- G_END_DECLS
- 
- #endif /* __GST_VIDEO_FRAME_H__ */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
deleted file mode 100644
index 132bf06..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Fri, 12 Sep 2014 14:41:01 +0300
-Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
-
-Upstream-Status: Backport [1.5.1]
-https://bugzilla.gnome.org/show_bug.cgi?id=736118
----
- gst-libs/gst/video/gstvideofilter.c |   23 ++++-------------------
- 1 file changed, 4 insertions(+), 19 deletions(-)
-
-diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
-index e1fa2c1..874b2e8 100644
---- a/gst-libs/gst/video/gstvideofilter.c
-+++ b/gst-libs/gst/video/gstvideofilter.c
-@@ -260,23 +260,15 @@ gst_video_filter_transform (GstBaseTransform * trans, GstBuffer * inbuf,
-   if (fclass->transform_frame) {
-     GstVideoFrame in_frame, out_frame;
- 
--    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf, GST_MAP_READ))
-+    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf,
-+            GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
-       goto invalid_buffer;
- 
-     if (!gst_video_frame_map (&out_frame, &filter->out_info, outbuf,
--            GST_MAP_WRITE))
-+            GST_MAP_WRITE | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
-       goto invalid_buffer;
- 
--    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
--     * meaning that we can't attach any metas or anything to it. Other
--     * map() functions like gst_buffer_map() don't get another reference
--     * of the buffer and expect the buffer reference to be kept until
--     * the buffer is unmapped again. */
--    gst_buffer_unref (inbuf);
--    gst_buffer_unref (outbuf);
-     res = fclass->transform_frame (filter, &in_frame, &out_frame);
--    gst_buffer_ref (inbuf);
--    gst_buffer_ref (outbuf);
- 
-     gst_video_frame_unmap (&out_frame);
-     gst_video_frame_unmap (&in_frame);
-@@ -317,7 +309,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
-     GstVideoFrame frame;
-     GstMapFlags flags;
- 
--    flags = GST_MAP_READ;
-+    flags = GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF;
- 
-     if (!gst_base_transform_is_passthrough (trans))
-       flags |= GST_MAP_WRITE;
-@@ -325,14 +317,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
-     if (!gst_video_frame_map (&frame, &filter->in_info, buf, flags))
-       goto invalid_buffer;
- 
--    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
--     * meaning that we can't attach any metas or anything to it. Other
--     * map() functions like gst_buffer_map() don't get another reference
--     * of the buffer and expect the buffer reference to be kept until
--     * the buffer is unmapped again. */
--    gst_buffer_unref (buf);
-     res = fclass->transform_frame_ip (filter, &frame);
--    gst_buffer_ref (buf);
- 
-     gst_video_frame_unmap (&frame);
-   } else {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
deleted file mode 100644
index aa55de1..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b608d027fff6efc2d1988ebf169cbe3b2b44a61b Mon Sep 17 00:00:00 2001
-From: zhouming <b42586@freescale.com>
-Date: Thu, 8 May 2014 12:01:17 +0800
-Subject: [PATCH] ENGR00312034: do not change eos event to gap event if no
- data has passed to streamsynchronizer.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=727074
-
-Upstream-Status: Pending
-
-Signed-off-by: zhouming <b42586@freescale.com>
----
- gst/playback/gststreamsynchronizer.c |    5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
-index 3997d1b..3e17c55 100644
---- a/gst/playback/gststreamsynchronizer.c
-+++ b/gst/playback/gststreamsynchronizer.c
-@@ -488,12 +488,11 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
-         }
-         g_slist_free (pads);
-       } else {
--        /* if EOS, but no data has passed, then send something to replace EOS
--         * for preroll purposes */
-+        /* if EOS, but no data has passed, then send EOS event */
-         if (!seen_data) {
-           GstEvent *gap_event;
- 
--          gap_event = gst_event_new_gap (timestamp, GST_CLOCK_TIME_NONE);
-+          gap_event = gst_event_new_eos ();
-           ret = gst_pad_push_event (srcpad, gap_event);
-         } else {
-           GstEvent *gap_event;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
deleted file mode 100755
index f24bc7c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-commit f9536544f5ad182b4f78d0143d1daa45dd64e624
-Author: Song Bing <b06498@freescale.com>
-Date:   Thu Oct 9 17:37:43 2014 +0800
-
-[gststreamsynchronizer] send EOS event insterd of GAP event as GAP
-event has issue when A/V have different duration.
-    
-send EOS event insterd of GAP event as GAP event has issue when A/V have different duration.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=736655]
-
-Signed-off-by: Song Bing <b06498@freescale.com>
-
-diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
-index 3e17c55..ff42d72 100644
---- a/gst/playback/gststreamsynchronizer.c
-+++ b/gst/playback/gststreamsynchronizer.c
-@@ -488,19 +488,24 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
-         }
-         g_slist_free (pads);
-       } else {
--        /* if EOS, but no data has passed, then send EOS event */
-+        /* if EOS, but no data has passed, then send something to replace EOS
-+         * for preroll purposes */
-         if (!seen_data) {
--          GstEvent *gap_event;
-+          GstEvent *eos_event;
- 
--          gap_event = gst_event_new_eos ();
--          ret = gst_pad_push_event (srcpad, gap_event);
-+          /* FIXME: change to EOS event as GAP event has issue when A/V have
-+           * different duration */
-+          eos_event = gst_event_new_eos ();
-+          ret = gst_pad_push_event (srcpad, eos_event);
-         } else {
--          GstEvent *gap_event;
-+          GstEvent *eos_event;
- 
-           /* FIXME: Also send a GAP event to let audio sinks start their
-            * clock in case they did not have enough data yet */
--          gap_event = gst_event_new_gap (timestamp, GST_CLOCK_TIME_NONE);
--          ret = gst_pad_push_event (srcpad, gap_event);
-+          /* FIXME: change to EOS event as GAP event has issue when A/V have
-+           * different duration */
-+          eos_event = gst_event_new_eos ();
-+          ret = gst_pad_push_event (srcpad, eos_event);
-         }
-       }
-       gst_object_unref (srcpad);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
deleted file mode 100755
index 731be68..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-commit 3f7052aac5e0118a9a9e09fff2f65091be448972
-Author: Song Bing <b06498@freescale.com>
-Date:   Thu Oct 23 13:35:13 2014 +0800
-
-[streamsynchronizer] One stream can finish playback.
-  
-As changed GAP event EOS event, so EOS will send more times, which will
-cause send function return error.
-Streamsynchronizer will don’t send second track EOS event if send the
-first track EOS return fail. Fixed by ignore the return error.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=736655]
-
-Signed-off-by: Song Bing b06498@freescale.com
-
-diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
-index ff42d72..d1732c3 100644
---- a/gst/playback/gststreamsynchronizer.c
-+++ b/gst/playback/gststreamsynchronizer.c
-@@ -482,7 +482,10 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
-         while (epad) {
-           pad = epad->data;
-           GST_DEBUG_OBJECT (pad, "Pushing EOS");
--          ret = ret && gst_pad_push_event (pad, gst_event_new_eos ());
-+          /* FIXME: remove error check as GAP changed to EOS will send EOS
-+           * more times, which will cause return error and then don't send
-+           * EOS event to following tracks. */
-+          gst_pad_push_event (pad, gst_event_new_eos ());
-           gst_object_unref (pad);
-           epad = g_slist_next (epad);
-         }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
deleted file mode 100755
index ef3f75f..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Author: Lyon Wang <b12696@freescale.com>
-Date:   Thu Oct 9 17:37:43 2014 +0800
-
-[id3v2frames] Bug fix for id3demux issue
-
-Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
-when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
-failed.
-
-Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
-convert the buffer from UTF-16 to UTF-8, however it will return err that this
-conversion is not supported which cause the extraction failed with these UTF-16
-characters.
-
-In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
-character format successfully.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=741144
-
-Upstream-Status: Backport [1.5.1]
-
-Signed-off-by: Lyon Wang <b12696@freescale.com>
-
-diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
-old mode 100644
-new mode 100755
-index 3785c2a..7b9d8ac
---- a/gst-libs/gst/tag/id3v2frames.c
-+++ b/gst-libs/gst/tag/id3v2frames.c
-@@ -1057,14 +1057,17 @@ parse_insert_string_field (guint8 encoding, gchar * data, gint data_size,
-         data_size -= 2;
-       }
- 
--      field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
--
--      if (field == NULL || g_utf8_validate (field, -1, NULL) == FALSE) {
--        /* As a fallback, try interpreting UTF-16 in the other endianness */
--        if (in_encode == utf16beenc)
--          field = g_convert (data, data_size, "UTF-8", utf16leenc,
--              NULL, NULL, NULL);
-+      if (in_encode == utf16beenc) {
-+           gunichar2 *data_utf16;
-+           guint i;
-+           data_utf16 =  (gunichar2 *) data;
-+          for (i=0; i<(data_size>>1); i++) {
-+            data_utf16[i] = GUINT16_TO_LE (data_utf16[i]);
-+          }
-       }
-+      //field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
-+       field = g_utf16_to_utf8((gunichar2 *)data, (glong)(data_size>>1), NULL, NULL, NULL);
-+
-     }
- 
-       break;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
deleted file mode 100755
index 833ce72..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From bcb2b8b6f49e7c66124a4f5e07dea829d5ebfe59 Mon Sep 17 00:00:00 2001
-From: Lyon Wang <lyon.wang@freescale.com>
-Date: Mon, 15 Dec 2014 16:52:07 +0800
-Subject: [PATCH] handle audio/video decoder error
-
-When there is input data and no output data to the end of the stream, it will
-send GST_ELEMENT_ERROR, So the clips playing will quit.
-However, if only one of the tracks is corrupt, there is no need to quit other
-tracks playing.
-
-The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
-information instead.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=741542]
-
-Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
----
- gst-libs/gst/audio/gstaudiodecoder.c |    5 +++--
- gst-libs/gst/video/gstvideodecoder.c |    5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
- mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
- mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
-
-diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
-old mode 100644
-new mode 100755
-index c2e7a28..891df0a
---- a/gst-libs/gst/audio/gstaudiodecoder.c
-+++ b/gst-libs/gst/audio/gstaudiodecoder.c
-@@ -2123,9 +2123,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
-       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
- 
-       if (dec->priv->ctx.had_input_data && !dec->priv->ctx.had_output_data) {
--        GST_ELEMENT_ERROR (dec, STREAM, DECODE,
-+        /* GST_ELEMENT_ERROR (dec, STREAM, DECODE,
-             ("No valid frames decoded before end of stream"),
--            ("no valid frames found"));
-+            ("no valid frames found")); */
-+        GST_ERROR_OBJECT(dec, "No valid frames decoded before end of stream");
-       }
- 
-       /* send taglist if no valid frame is decoded util EOS */
-diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
-old mode 100644
-new mode 100755
-index ac581e1..4278bcd
---- a/gst-libs/gst/video/gstvideodecoder.c
-+++ b/gst-libs/gst/video/gstvideodecoder.c
-@@ -1068,9 +1068,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
- 
-       /* Error out even if EOS was ok when we had input, but no output */
-       if (ret && priv->had_input_data && !priv->had_output_data) {
--        GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
-+        /* GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
-             ("No valid frames decoded before end of stream"),
--            ("no valid frames found"));
-+            ("no valid frames found")); */
-+        GST_ERROR_OBJECT(decoder, "No valid frames decoded before end of stream");
-       }
- 
-       /* Forward EOS immediately. This is required because no
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
deleted file mode 100644
index 62a52b0..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 68fa1b1425ad2c5f7c5013d0943153a8a6d0934e Mon Sep 17 00:00:00 2001
-From: Jian Li <lj.qfy.sh@gmail.com>
-Date: Wed, 24 Sep 2014 17:21:02 +0800
-Subject: [PATCH] taglist not send to down stream if all the frame corrupted
-
-https://bugzilla.gnome.org/show_bug.cgi?id=737246
-
-Upstream-Status: Pending
-
-Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
----
- gst-libs/gst/audio/gstaudiodecoder.c |    9 +++++++++
- gst-libs/gst/video/gstvideodecoder.c |    8 ++++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
-index 3504678..3d69efe 100644
---- a/gst-libs/gst/audio/gstaudiodecoder.c
-+++ b/gst-libs/gst/audio/gstaudiodecoder.c
-@@ -2083,6 +2083,15 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
-       gst_audio_decoder_drain (dec);
-       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
- 
-+      /* send taglist if no valid frame is decoded util EOS */
-+      if (dec->priv->taglist && dec->priv->taglist_changed) {
-+        GST_DEBUG_OBJECT (dec, "codec tag %" GST_PTR_FORMAT, dec->priv->taglist);
-+        if (!gst_tag_list_is_empty (dec->priv->taglist))
-+          gst_audio_decoder_push_event (dec,
-+              gst_event_new_tag (gst_tag_list_ref (dec->priv->taglist)));
-+        dec->priv->taglist_changed = FALSE;
-+      }
-+
-       /* Forward EOS because no buffer or serialized event will come after
-        * EOS and nothing could trigger another _finish_frame() call. */
-       ret = gst_audio_decoder_push_event (dec, event);
-diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
-index dd8abe3..d9bfe4d 100644
---- a/gst-libs/gst/video/gstvideodecoder.c
-+++ b/gst-libs/gst/video/gstvideodecoder.c
-@@ -1024,6 +1024,14 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
-        * parent class' ::sink_event() until a later time.
-        */
-       forward_immediate = TRUE;
-+
-+      /* send taglist if no valid frame is decoded util EOS */
-+      if (decoder->priv->tags && decoder->priv->tags_changed) {
-+        gst_video_decoder_push_event (decoder,
-+            gst_event_new_tag (gst_tag_list_ref (decoder->priv->tags)));
-+        decoder->priv->tags_changed = FALSE;
-+      }
-+
-       break;
-     }
-     case GST_EVENT_GAP:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
deleted file mode 100755
index 8cfda95..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-commit 88d253ea23b06289df40401160b606323f16c910
-Author: Song Bing <b06498@freescale.com>
-Date:   Mon Dec 15 09:34:35 2014 +0800
-
-videopool: update video alignment after video alignment
-
-Video buffer pool will update video alignment to respect stride alignment
-requirement. But haven't update it to video alignment in configure.
-Which will cause user get wrong video alignment.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=741501
-
-Upstream-Status: Backport [1.5.1]
-
-Signed-off-by: Song Bing <b06498@freescale.com>
-diff --git a/gst-libs/gst/video/gstvideopool.c b/gst-libs/gst/video/gstvideopool.c
-index 4475f45..acef594 100644
---- a/gst-libs/gst/video/gstvideopool.c
-+++ b/gst-libs/gst/video/gstvideopool.c
-@@ -167,6 +167,7 @@ video_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
-     /* get an apply the alignment to the info */
-     gst_buffer_pool_config_get_video_alignment (config, &priv->video_align);
-     gst_video_info_align (&info, &priv->video_align);
-+    gst_buffer_pool_config_set_video_alignment (config, &priv->video_align);
-   }
-   priv->info = info;
-
-diff --git a/sys/ximage/ximagepool.c b/sys/ximage/ximagepool.c
-index 6cc2cfa..6a1cbc9 100644
---- a/sys/ximage/ximagepool.c
-+++ b/sys/ximage/ximagepool.c
-@@ -597,6 +597,8 @@ ximage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
-     /* do padding and alignment */
-     gst_video_info_align (&info, &priv->align);
-
-+    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
-+
-     /* we need the video metadata too now */
-     priv->add_metavideo = TRUE;
-   } else {
-diff --git a/sys/xvimage/xvimagepool.c b/sys/xvimage/xvimagepool.c
-index 244a51a..34b1ab2 100644
---- a/sys/xvimage/xvimagepool.c
-+++ b/sys/xvimage/xvimagepool.c
-@@ -124,6 +124,8 @@ xvimage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
-     /* do padding and alignment */
-     gst_video_info_align (&info, &priv->align);
-
-+    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
-+
-     /* we need the video metadata too now */
-     priv->add_metavideo = TRUE;
-   } else {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
deleted file mode 100644
index b476969..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c3f7d36b992a3cbcee3386dea85720f3cb04e1ff Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Fri, 27 Mar 2015 13:39:43 +0800
-Subject: [PATCH] videoencoder: Keep sticky events around when doing a soft
- reset
-
-The current code will first discard all frames, and then tries to copy
-all sticky events from the (now discarded) frames. Let's change the order.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=746865
-
-Upstream-Status: Accepted 
-
----
- gst-libs/gst/video/gstvideoencoder.c |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gst-libs/gst/video/gstvideoencoder.c b/gst-libs/gst/video/gstvideoencoder.c
-index 614ba2d..4c5b111 100644
---- a/gst-libs/gst/video/gstvideoencoder.c
-+++ b/gst-libs/gst/video/gstvideoencoder.c
-@@ -340,10 +340,6 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
- 
-   priv->drained = TRUE;
- 
--  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
--  g_list_free (priv->frames);
--  priv->frames = NULL;
--
-   priv->bytes = 0;
-   priv->time = 0;
- 
-@@ -392,6 +388,10 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
-         encoder->priv->current_frame_events);
-   }
- 
-+  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
-+  g_list_free (priv->frames);
-+  priv->frames = NULL;
-+
-   GST_VIDEO_ENCODER_STREAM_UNLOCK (encoder);
- 
-   return ret;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
deleted file mode 100644
index b09c2cb..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-include gstreamer1.0-plugins-base.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                   "
-
-SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
-            file://get-caps-from-src-pad-when-query-caps.patch \
-            file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
-            file://fix-id3demux-utf16-to-utf8-issue.patch \
-            file://handle-audio-video-decoder-error.patch \
-            file://videobuffer_updata_alignment_update.patch \
-            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
-            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
-            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
-            file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
-            file://do-not-change-eos-event-to-gap-event2.patch \
-            file://do-not-change-eos-event-to-gap-event3.patch \
-            file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
-            file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
-            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-            file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
-            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
-"
-
-SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-SRC_URI[sha256sum] = "77bd8199e7a312d3d71de9b7ddf761a3b78560a2c2a80829d0815ca39cbd551d"
-
-S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.0.bb
new file mode 100644
index 0000000..bc780d8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.0.bb
@@ -0,0 +1,18 @@
+include gstreamer1.0-plugins-base.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                   "
+
+SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
+            file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
+            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
+            file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+"
+
+SRC_URI[md5sum] = "3c223f1d2716e1861ba84287ea02b164"
+SRC_URI[sha256sum] = "314fd1b707f65caf8eb6164d9422fc51e2b220a890ccd2de6ec03a2883d77231"
+
+S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.9.1


