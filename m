Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2902DC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.16393.1644196132891714473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/ZCMflM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso7544740wms.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5e2wxjxtspUXOXRDLk28YxwxR660a8Fw98OO6lYJ6Bw=;
        b=C/ZCMflMqdDfZcWybaxikyN713LXcyfda+3dWDaG4Cb60R93wF5JUQ/qcD8nABjNcL
         3wh9YQ3sPSOyrZcHGFiRW2lBpobkP3YM4RCSVBm9bj2J4nIJc5NjnMTkVQJisAau1ne9
         hsPcwPf9xBE1pw3IrDOQhkrRl9+5wC/wUBp+hScINsI7fTxTzkx8MK3KcFcJnO4j1t66
         /nzkRHGdwBNBrkQlxH3J7MR8ufzQAitwV4gtlqDOz0tLsMzOZwPRnTfMoZKjPjX0rkN4
         9tUBAxJZ4bkN1Gps4fCG4IgUXkYtyA740hirtGPvkuDvS+/6mVchDM/EzOH/g3G5t7hj
         VgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5e2wxjxtspUXOXRDLk28YxwxR660a8Fw98OO6lYJ6Bw=;
        b=Xf6++I3nDLqTy0PYoXEmgFONyxpayk0oCdDxKjalKp3uLoidSKxzr+/D6KvXWRaYOZ
         DuW5SAlFfIKaNtVDbin7PsonHLAywOjJp84FcBoLkrlYPKaO35Xdoy3OhoFDPqb7bFnW
         KSeKEc1PUgcLlCOhOtCrTVsCDp8yKjlUzJNlq30A8OTAfsF8nJEeNytZMwoUwo+INgja
         7FPYLv5Jw3T4SuXc6ANhZcAV6xibucpmQYCN6KesHotZBl1EeG1mECNHuBrei3OYRcFL
         V6RU15eWUpC7hvcLkRlSrHTk248Ab4edMxUjxfMtPb0UJCzkQXQMIdoGEYRuIgAn5N+g
         UHZw==
X-Gm-Message-State: AOAM531jw0FmL2OrPMKAYn969wSJRMjxNG+xQIbM9ayRNoQ1mfj66Gs7
	aUjf3eiO+JgNrskXU11Wxqsl5wKHtt4=
X-Google-Smtp-Source: 
 ABdhPJxG2kaOtm/1avDpm9/0YFDHVIBNifkzBFlxUSDUzDIuV9DH2u5+Auls405S25yQPwKcTWyG4Q==
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr8839564wmq.66.1644196131144;
        Sun, 06 Feb 2022 17:08:51 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:50 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 13/17] gstreamer1.0-libav: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:19 +0000
Message-Id: <20220207010823.143664-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161433

- License update:
  The code actually is LGPLv2.1 but the COPYING file is wrong.
  https://gitlab.freedesktop.org/gstreamer/gst-libav/-/commit/678773bb6468e815c180ff82a09d863451e89ba8

- Drop backported patches
  0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch

- Add new meson options

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ------------------
 ...1.18.5.bb => gstreamer1.0-libav_1.20.0.bb} |  12 +-
 2 files changed, 7 insertions(+), 351 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.20.0.bb} (75%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
deleted file mode 100644
index 022ff9af29..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From 38d10ee800e42afeacc6bee714216e4c974c11f5 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@mengyan1223.wang>
-Date: Mon, 17 Jan 2022 01:33:47 +0800
-Subject: [PATCH] gst-libav: fix build with ffmpeg-5.0.0
-
-Latest ffmpeg has removed avcodec_get_context_defaults(), and its
-documentation says a new AVCodecContext should be allocated for this
-purpose.  The pointer returned by avcodec_find_decoder() is now
-const-qualified so we also need to adjust for it.  And, AVCOL_RANGE_MPEG
-is now rejected with strict_std_compliance > FF_COMPLIANCE_UNOFFICIAL.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1531>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ext/libav/gstavauddec.c   | 22 ++++++++-------------
- ext/libav/gstavaudenc.c   | 40 +++++++++++++++++++--------------------
- ext/libav/gstavcodecmap.c |  7 ++++---
- ext/libav/gstavutils.c    |  2 +-
- ext/libav/gstavviddec.c   | 28 +++++++++++----------------
- ext/libav/gstavvidenc.c   | 21 ++++++++++----------
- 6 files changed, 54 insertions(+), 66 deletions(-)
-
-diff --git a/ext/libav/gstavauddec.c b/ext/libav/gstavauddec.c
-index baf7aa5..b03a724 100644
---- a/ext/libav/gstavauddec.c
-+++ b/ext/libav/gstavauddec.c
-@@ -168,12 +168,7 @@ gst_ffmpegauddec_finalize (GObject * object)
-   GstFFMpegAudDec *ffmpegdec = (GstFFMpegAudDec *) object;
- 
-   av_frame_free (&ffmpegdec->frame);
--
--  if (ffmpegdec->context != NULL) {
--    gst_ffmpeg_avcodec_close (ffmpegdec->context);
--    av_free (ffmpegdec->context);
--    ffmpegdec->context = NULL;
--  }
-+  avcodec_free_context (&ffmpegdec->context);
- 
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -193,14 +188,12 @@ gst_ffmpegauddec_close (GstFFMpegAudDec * ffmpegdec, gboolean reset)
-   gst_ffmpeg_avcodec_close (ffmpegdec->context);
-   ffmpegdec->opened = FALSE;
- 
--  if (ffmpegdec->context->extradata) {
--    av_free (ffmpegdec->context->extradata);
--    ffmpegdec->context->extradata = NULL;
--  }
-+  av_freep (&ffmpegdec->context->extradata);
- 
-   if (reset) {
--    if (avcodec_get_context_defaults3 (ffmpegdec->context,
--            oclass->in_plugin) < 0) {
-+    avcodec_free_context (&ffmpegdec->context);
-+    ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegdec->context == NULL) {
-       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -219,8 +212,9 @@ gst_ffmpegauddec_start (GstAudioDecoder * decoder)
-   oclass = (GstFFMpegAudDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
- 
-   GST_OBJECT_LOCK (ffmpegdec);
--  gst_ffmpeg_avcodec_close (ffmpegdec->context);
--  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plugin) < 0) {
-+  avcodec_free_context (&ffmpegdec->context);
-+  ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegdec->context == NULL) {
-     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-     GST_OBJECT_UNLOCK (ffmpegdec);
-     return FALSE;
-diff --git a/ext/libav/gstavaudenc.c b/ext/libav/gstavaudenc.c
-index 3ff6432..689982f 100644
---- a/ext/libav/gstavaudenc.c
-+++ b/ext/libav/gstavaudenc.c
-@@ -175,10 +175,8 @@ gst_ffmpegaudenc_finalize (GObject * object)
- 
-   /* clean up remaining allocated data */
-   av_frame_free (&ffmpegaudenc->frame);
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->refcontext);
--  av_free (ffmpegaudenc->context);
--  av_free (ffmpegaudenc->refcontext);
-+  avcodec_free_context (&ffmpegaudenc->context);
-+  avcodec_free_context (&ffmpegaudenc->refcontext);
- 
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -193,9 +191,9 @@ gst_ffmpegaudenc_start (GstAudioEncoder * encoder)
-   ffmpegaudenc->opened = FALSE;
-   ffmpegaudenc->need_reopen = FALSE;
- 
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
--  if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--          oclass->in_plugin) < 0) {
-+  avcodec_free_context (&ffmpegaudenc->context);
-+  ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegaudenc->context == NULL) {
-     GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
-     return FALSE;
-   }
-@@ -241,10 +239,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
- 
-   /* close old session */
-   if (ffmpegaudenc->opened) {
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     ffmpegaudenc->opened = FALSE;
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0) {
-+    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegaudenc->context == NULL) {
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -286,11 +284,11 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
-   /* open codec */
-   if (gst_ffmpeg_avcodec_open (ffmpegaudenc->context, oclass->in_plugin) < 0) {
-     gst_caps_unref (allowed_caps);
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     GST_DEBUG_OBJECT (ffmpegaudenc, "avenc_%s: Failed to open FFMPEG codec",
-         oclass->in_plugin->name);
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegaudenc->context == NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
- 
-     if ((oclass->in_plugin->capabilities & AV_CODEC_CAP_EXPERIMENTAL) &&
-@@ -312,10 +310,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
- 
-   if (!other_caps) {
-     gst_caps_unref (allowed_caps);
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     GST_DEBUG ("Unsupported codec - no caps found");
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegaudenc->context == NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
-     return FALSE;
-   }
-@@ -331,10 +329,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
- 
-   if (!gst_audio_encoder_set_output_format (GST_AUDIO_ENCODER (ffmpegaudenc),
-           icaps)) {
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     gst_caps_unref (icaps);
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegaudenc->context == NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
-     return FALSE;
-   }
-@@ -403,8 +401,8 @@ buffer_info_free (void *opaque, guint8 * data)
-     gst_buffer_unmap (info->buffer, &info->map);
-     gst_buffer_unref (info->buffer);
-   } else {
--    av_free (info->ext_data);
--    av_free (info->ext_data_array);
-+    av_freep (&info->ext_data);
-+    av_freep (&info->ext_data_array);
-   }
-   g_slice_free (BufferInfo, info);
- }
-diff --git a/ext/libav/gstavcodecmap.c b/ext/libav/gstavcodecmap.c
-index f58633d..e2a3641 100644
---- a/ext/libav/gstavcodecmap.c
-+++ b/ext/libav/gstavcodecmap.c
-@@ -2331,7 +2331,7 @@ gst_ffmpeg_codecid_to_caps (enum AVCodecID codec_id,
-   }
- 
-   if (buildcaps) {
--    AVCodec *codec;
-+    const AVCodec *codec;
- 
-     if ((codec = avcodec_find_decoder (codec_id)) ||
-         (codec = avcodec_find_encoder (codec_id))) {
-@@ -2975,6 +2975,7 @@ gst_ffmpeg_videoinfo_to_context (GstVideoInfo * info, AVCodecContext * context)
-     context->color_range = AVCOL_RANGE_JPEG;
-   } else {
-     context->color_range = AVCOL_RANGE_MPEG;
-+    context->strict_std_compliance = FF_COMPLIANCE_UNOFFICIAL;
-   }
- }
- 
-@@ -4330,7 +4331,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * context)
-     audio = TRUE;
-   } else if (!strncmp (mimetype, "audio/x-gst-av-", 15)) {
-     gchar ext[16];
--    AVCodec *codec;
-+    const AVCodec *codec;
- 
-     if (strlen (mimetype) <= 30 &&
-         sscanf (mimetype, "audio/x-gst-av-%s", ext) == 1) {
-@@ -4342,7 +4343,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * context)
-     }
-   } else if (!strncmp (mimetype, "video/x-gst-av-", 15)) {
-     gchar ext[16];
--    AVCodec *codec;
-+    const AVCodec *codec;
- 
-     if (strlen (mimetype) <= 30 &&
-         sscanf (mimetype, "video/x-gst-av-%s", ext) == 1) {
-diff --git a/ext/libav/gstavutils.c b/ext/libav/gstavutils.c
-index 3780cff..f3878c3 100644
---- a/ext/libav/gstavutils.c
-+++ b/ext/libav/gstavutils.c
-@@ -36,7 +36,7 @@
- const gchar *
- gst_ffmpeg_get_codecid_longname (enum AVCodecID codec_id)
- {
--  AVCodec *codec;
-+  const AVCodec *codec;
-   /* Let's use what ffmpeg can provide us */
- 
-   if ((codec = avcodec_find_decoder (codec_id)) ||
-diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
-index 7ec5766..5dd207e 100644
---- a/ext/libav/gstavviddec.c
-+++ b/ext/libav/gstavviddec.c
-@@ -320,12 +320,7 @@ gst_ffmpegviddec_finalize (GObject * object)
-   GstFFMpegVidDec *ffmpegdec = (GstFFMpegVidDec *) object;
- 
-   av_frame_free (&ffmpegdec->picture);
--
--  if (ffmpegdec->context != NULL) {
--    gst_ffmpeg_avcodec_close (ffmpegdec->context);
--    av_free (ffmpegdec->context);
--    ffmpegdec->context = NULL;
--  }
-+  avcodec_free_context (&ffmpegdec->context);
- 
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -363,13 +358,11 @@ gst_ffmpegviddec_close (GstFFMpegVidDec * ffmpegdec, gboolean reset)
- 
-   gst_buffer_replace (&ffmpegdec->palette, NULL);
- 
--  if (ffmpegdec->context->extradata) {
--    av_free (ffmpegdec->context->extradata);
--    ffmpegdec->context->extradata = NULL;
--  }
-+  av_freep (&ffmpegdec->context->extradata);
-   if (reset) {
--    if (avcodec_get_context_defaults3 (ffmpegdec->context,
--            oclass->in_plugin) < 0) {
-+    avcodec_free_context (&ffmpegdec->context);
-+    ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegdec->context == NULL) {
-       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -1704,7 +1697,7 @@ gst_ffmpegviddec_video_frame (GstFFMpegVidDec * ffmpegdec,
-     if (side_data) {
-       GST_LOG_OBJECT (ffmpegdec,
-           "Found CC side data of type AV_FRAME_DATA_A53_CC, size %d",
--          side_data->size);
-+          (int) side_data->size);
-       GST_MEMDUMP ("A53 CC", side_data->data, side_data->size);
- 
-       /* do not add closed caption meta if it already exists */
-@@ -1966,8 +1959,9 @@ gst_ffmpegviddec_start (GstVideoDecoder * decoder)
-   oclass = (GstFFMpegVidDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
- 
-   GST_OBJECT_LOCK (ffmpegdec);
--  gst_ffmpeg_avcodec_close (ffmpegdec->context);
--  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plugin) < 0) {
-+  avcodec_free_context (&ffmpegdec->context);
-+  ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegdec->context == NULL) {
-     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-     GST_OBJECT_UNLOCK (ffmpegdec);
-     return FALSE;
-@@ -2261,10 +2255,10 @@ gst_ffmpegviddec_get_property (GObject * object,
- 
-   switch (prop_id) {
-     case PROP_LOWRES:
--      g_value_set_enum (value, ffmpegdec->context->lowres);
-+      g_value_set_enum (value, ffmpegdec->lowres);
-       break;
-     case PROP_SKIPFRAME:
--      g_value_set_enum (value, ffmpegdec->context->skip_frame);
-+      g_value_set_enum (value, ffmpegdec->skip_frame);
-       break;
-     case PROP_DIRECT_RENDERING:
-       g_value_set_boolean (value, ffmpegdec->direct_rendering);
-diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
-index 0468d88..2ed9e5a 100644
---- a/ext/libav/gstavvidenc.c
-+++ b/ext/libav/gstavvidenc.c
-@@ -224,8 +224,8 @@ gst_ffmpegvidenc_finalize (GObject * object)
-   av_frame_free (&ffmpegenc->picture);
-   gst_ffmpeg_avcodec_close (ffmpegenc->context);
-   gst_ffmpeg_avcodec_close (ffmpegenc->refcontext);
--  av_free (ffmpegenc->context);
--  av_free (ffmpegenc->refcontext);
-+  av_freep (&ffmpegenc->context);
-+  av_freep (&ffmpegenc->refcontext);
- 
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -247,10 +247,10 @@ gst_ffmpegvidenc_set_format (GstVideoEncoder * encoder,
- 
-   /* close old session */
-   if (ffmpegenc->opened) {
--    gst_ffmpeg_avcodec_close (ffmpegenc->context);
-+    avcodec_free_context (&ffmpegenc->context);
-     ffmpegenc->opened = FALSE;
--    if (avcodec_get_context_defaults3 (ffmpegenc->context,
--            oclass->in_plugin) < 0) {
-+    ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegenc->context == NULL) {
-       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -454,9 +454,9 @@ bad_input_fmt:
-   }
- close_codec:
-   {
--    gst_ffmpeg_avcodec_close (ffmpegenc->context);
--    if (avcodec_get_context_defaults3 (ffmpegenc->context,
--            oclass->in_plugin) < 0)
-+    avcodec_free_context (&ffmpegenc->context);
-+    ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegenc->context == NULL)
-       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-     goto cleanup_stats_in;
-   }
-@@ -896,8 +896,9 @@ gst_ffmpegvidenc_start (GstVideoEncoder * encoder)
-   ffmpegenc->need_reopen = FALSE;
- 
-   /* close old session */
--  gst_ffmpeg_avcodec_close (ffmpegenc->context);
--  if (avcodec_get_context_defaults3 (ffmpegenc->context, oclass->in_plugin) < 0) {
-+  avcodec_free_context (&ffmpegenc->context);
-+  ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegenc->context == NULL) {
-     GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-     return FALSE;
-   }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
similarity index 75%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
index 64b8bcdb52..98b2650bb0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
@@ -7,14 +7,12 @@ SECTION = "multimedia"
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
 LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch \
-           "
-SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[sha256sum] = "5eee5ed8d5082a31b500448e41535c722ee30cd5f8224f32982bbaba2eedef17"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
@@ -22,5 +20,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
 
 inherit meson pkgconfig upstream-version-is-even
 
+EXTRA_OEMESON += " \
+    -Dtests=disabled \
+"
+
 FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-- 
2.35.1


