Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B910C73237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:51:01 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so54855775pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=RBqsJrO9dD+6ahBuqps/u3uQsdFPaEyBfkf3Da0lGgI=;
	b=DkyKGgC2cGWlXsOYDBs/Nk3ePntJudKah25W8ZmIHSBJB07S/pUrGTDAYboPXiQlor
	v2FiXm/MCbvdsS/POG8uwrR62kTcwVgQfvzrMUoKN+l3rZuXafkP7zbMTktsfskNHYR/
	UUBGzX1TTY7l4+U8psecDNCUa2hkLsEgetJy/QwRsPrOf7laxM+2tzrfND0hvflPReLq
	4HDgDAEDIMjFHLER+MTNuVgZ+H7AocK9t9pBayOpbJZSdCvFWs5dHqz+TanL378b4l/V
	HkKi/+ggdgpZvuAJAWPNeBKkzeEbhVFqYP7C5ztjIwUOZQK1MM6FC4PzT5M6nlItKOYV
	z82Q==
X-Gm-Message-State: ALoCoQkSdgFSj8F9Wdx3VYCeSHbnaIGUJQg0OwO4rZnDuCq6Sk1iTHkDcbIpB586AzYsSL+wNSKb
X-Received: by 10.70.90.193 with SMTP id by1mr70105635pdb.80.1438015861286;
	Mon, 27 Jul 2015 09:51:01 -0700 (PDT)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43]) by smtp.gmail.com with ESMTPSA id
	cj7sm30442612pdb.33.2015.07.27.09.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:51:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so54268717pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:50:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr70469657pab.19.1438015859282;
	Mon, 27 Jul 2015 09:50:59 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:50:59 -0700 (PDT)
In-Reply-To: <1437996407-29463-5-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-5-git-send-email-b54851@freescale.com>
Date: Mon, 27 Jul 2015 13:50:59 -0300
Message-ID: <CAP9ODKqYBs8XdR2+xL5ixxPRqSt2tMK1PbLmkAcg_Srhx5suMw@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 16:51:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> -Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>  This makes sure that the buffer is not reffed another time when
>  storing it in the GstVideoFrame, keeping it writable if it was writable.
>
> -Don't ref buffers twice when mapping
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Which recipe is applying this? It seems it is not being applied.

> ---
>  ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 25 +++++++
>  ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
> new file mode 100644
> index 0000000..c4eef00
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
> @@ -0,0 +1,25 @@
> +From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Tue, 16 Sep 2014 01:07:18 +0300
> +Subject: [PATCH] video-frame: Don't ref buffers twice when mapping


Upstream-Status: ???

> +---
> + gst-libs/gst/video/video-frame.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
> +index 01f23c0..8a9ae96 100644
> +--- a/gst-libs/gst/video/video-frame.c
> ++++ b/gst-libs/gst/video/video-frame.c
> +@@ -105,7 +105,7 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
> +       frame->data[i] = frame->map[0].data + info->offset[i];
> +     }
> +   }
> +-  frame->buffer = gst_buffer_ref (buffer);
> ++  frame->buffer = buffer;
> +   if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> +     gst_buffer_ref (frame->buffer);
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> new file mode 100644
> index 0000000..554b8ac
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> @@ -0,0 +1,87 @@
> +From 40a293d44d1aeccf5eb8e86f23a0b13666111c5c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Fri, 12 Sep 2014 14:39:16 +0300
> +Subject: [PATCH 2/3] video-frame: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
> +
> +This makes sure that the buffer is not reffed another time when
> +storing it in the GstVideoFrame, keeping it writable if it was
> +writable.
> +
> +Upstream Status: Accepted
> +https://bugzilla.gnome.org/show_bug.cgi?id=736118

The field is:

Upstream-Status: Submitted [https://...]

> +---
> + gst-libs/gst/video/video-frame.c |    9 ++++++++-
> + gst-libs/gst/video/video-frame.h |   18 ++++++++++++++++++
> + 2 files changed, 26 insertions(+), 1 deletion(-)
> +
> +diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
> +index 537cf70..01f23c0 100644
> +--- a/gst-libs/gst/video/video-frame.c
> ++++ b/gst-libs/gst/video/video-frame.c
> +@@ -106,6 +106,9 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
> +     }
> +   }
> +   frame->buffer = gst_buffer_ref (buffer);
> ++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> ++    gst_buffer_ref (frame->buffer);
> ++
> +   frame->meta = meta;
> +
> +   /* buffer flags enhance the frame flags */
> +@@ -189,11 +192,13 @@ gst_video_frame_unmap (GstVideoFrame * frame)
> +   GstBuffer *buffer;
> +   GstVideoMeta *meta;
> +   gint i;
> ++  GstMapFlags flags;
> +
> +   g_return_if_fail (frame != NULL);
> +
> +   buffer = frame->buffer;
> +   meta = frame->meta;
> ++  flags = frame->map[0].flags;
> +
> +   if (meta) {
> +     for (i = 0; i < frame->info.finfo->n_planes; i++) {
> +@@ -202,7 +207,9 @@ gst_video_frame_unmap (GstVideoFrame * frame)
> +   } else {
> +     gst_buffer_unmap (buffer, &frame->map[0]);
> +   }
> +-  gst_buffer_unref (buffer);
> ++
> ++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> ++    gst_buffer_unref (frame->buffer);
> + }
> +
> + /**
> +diff --git a/gst-libs/gst/video/video-frame.h b/gst-libs/gst/video/video-frame.h
> +index 627fab0..f8e6304 100644
> +--- a/gst-libs/gst/video/video-frame.h
> ++++ b/gst-libs/gst/video/video-frame.h
> +@@ -149,6 +149,24 @@ typedef enum {
> +   GST_VIDEO_BUFFER_FLAG_LAST        = (GST_BUFFER_FLAG_LAST << 8)
> + } GstVideoBufferFlags;
> +
> ++/**
> ++ * GstVideoBufferFlags:
> ++ * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
> ++ *                                    the GstVideoFrame. This makes sure that the buffer stays
> ++ *                                    writable while the frame is mapped, but requires that the
> ++ *                                    buffer reference stays valid until the frame is unmapped again.
> ++ * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
> ++ *
> ++ * Additional mapping flags for gst_video_frame_map().
> ++ *
> ++ * Since: 1.6
> ++ */
> ++typedef enum {
> ++  GST_VIDEO_FRAME_MAP_FLAG_NO_REF   = (GST_MAP_FLAG_LAST << 0),
> ++  GST_VIDEO_FRAME_MAP_FLAG_LAST     = (GST_MAP_FLAG_LAST << 8)
> ++  /* 8 more flags possible afterwards */
> ++} GstVideoFrameMapFlags;
> ++
> + G_END_DECLS
> +
> + #endif /* __GST_VIDEO_FRAME_H__ */
> +--
> +1.7.9.5
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

