Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id B5527610F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 18:23:56 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 10so2874056lbg.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2XsmQ5oC+wXcebOxSlP8Q5RY1dCJte4Au2I3ZPe5ueo=;
	b=PmTjqrVxVfh6rrr1Mt7gwszrzSLVCfD4IKVS/XpENeKZcLZ76tHExyVnTi/wrWtd41
	rneKodNh50hG7pozCizb0vHA6oq99R+nRBfG9jzDfQ+vAqV6p+4K404jNKEEq8EPIPKV
	4uAiQi90LgCOy/d7Qx+KYcsl520PwLc0t86AsC7Azf/GE3NtffoqCTmRM9SKlrgivUUz
	/g1os/LFpNTlPhpWj1G8ZwTSnS79FnJm+PRQ9Wb1i+NYoo2xHS3xVeguLSg+Rfo6kvte
	1Th9VszK+BexwsoJZLchWcRiK+igkVFGSs1ZSC5pPhI+QTxF1Ww9YGxlZgNGpH0rLbn4
	LFcA==
X-Received: by 10.112.5.170 with SMTP id t10mr8166008lbt.64.1408213437328;
	Sat, 16 Aug 2014 11:23:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am2sm18557608lbc.6.2014.08.16.11.23.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 11:23:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 20:23:54 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140816182354.GE3660@jama>
References: <20140808102805.GD14848@jama>
	<1407506272-2684-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407506272-2684-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] gst-ffmpeg: add PACKAGECONFIG for libav9 and patch from Gentoo
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
X-List-Received-Date: Sat, 16 Aug 2014 18:23:58 -0000
X-Groupsio-MsgNum: 56616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline

--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 03:57:52PM +0200, Martin Jansa wrote:
> * apply the patch only when PACKAGECONFIG is selected, because the changes
>   aren't backwards compatible

ping

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gstreamer/gst-ffmpeg-0.10.13/libav-9.patch     | 9304 ++++++++++++++=
++++++
>  .../gstreamer/gst-ffmpeg_0.10.13.bb                |    2 +
>  2 files changed, 9306 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
libav-9.patch
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9=
=2Epatch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.pat=
ch
> new file mode 100644
> index 0000000..9055b34
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch
> @@ -0,0 +1,9304 @@
> +Taken from gentoo patchset:
> +http://dev.gentoo.org/~tetromino/distfiles/gst-plugins-ffmpeg/gst-ffmpeg=
-0.10.13_p2012.11-libav-9-patches.tar.xz
> +
> +Upstream-Status: Pending
> +
> +Contains following changes, rebased to apply on top of our changes
> +0002-Fix-includes-for-systemwide-build.patch
> +0003-libav-Switch-to-non-deprecated-symbols.patch
> +0005-av-Update-for-some-constant-changes.patch
> +0006-av-Remove-palette-support-for-now.patch
> +0007-av-Port-remaining-simple-bits.patch
> +0008-av-Use-av_codec_is_-en-de-coder-API-instead-of-priva.patch
> +0009-avprotocol-Port-from-the-URL-protocol-handler-to-san.patch
> +0010-avdec-don-t-wait-for-keyframe.patch
> +
> +Following changes were skipped:
> +0001-Partially-revert-commit-0300801b.patch
> +0004-av-update-to-use-AVOption-variants.patch
> +0011-av_get_bits_per_sample_format-was-removed-in-libav-9.patch
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.c gst-ffmpeg-0.10=
=2E13/ext/ffmpeg/gstffmpeg.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.c	2011-10-31 11:14:03.0=
00000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.c	2014-08-08 15:26:07.872857=
555 +0200
> +@@ -151,9 +151,6 @@
> + #endif
> +   gst_ffmpegaudioresample_register (plugin);
> +=20
> +-  av_register_protocol2 (&gstreamer_protocol, sizeof (URLProtocol));
> +-  av_register_protocol2 (&gstpipe_protocol, sizeof (URLProtocol));
> +-
> +   /* Now we can return the pointer to the newly created Plugin object. =
*/
> +   return TRUE;
> + }
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.h gst-ffmpeg-0.10=
=2E13/ext/ffmpeg/gstffmpeg.h
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.h	2011-05-17 10:53:16.0=
00000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.h	2014-08-08 15:26:07.872857=
555 +0200
> +@@ -58,10 +58,13 @@
> + int gst_ffmpeg_avcodec_close (AVCodecContext *avctx);
> + int gst_ffmpeg_av_find_stream_info(AVFormatContext *ic);
> +=20
> +-G_END_DECLS
> ++int gst_ffmpegdata_open (GstPad * pad, int flags, AVIOContext ** contex=
t);
> ++int gst_ffmpegdata_close (AVIOContext * h);
> ++typedef struct _GstFFMpegPipe GstFFMpegPipe;
> ++int gst_ffmpeg_pipe_open (GstFFMpegPipe *ffpipe, int flags, AVIOContext=
 ** context);
> ++int gst_ffmpeg_pipe_close (AVIOContext * h);
> +=20
> +-extern URLProtocol gstreamer_protocol;
> +-extern URLProtocol gstpipe_protocol;
> ++G_END_DECLS
> +=20
> + /* use GST_FFMPEG URL_STREAMHEADER with URL_WRONLY if the first
> +  * buffer should be used as streamheader property on the pad's caps. */
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcfg.c gst-ffmpeg-0=
=2E10.13/ext/ffmpeg/gstffmpegcfg.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcfg.c	2011-07-12 16:35:2=
7.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcfg.c	2014-08-08 15:24:17.899=
853612 +0200
> +@@ -147,7 +147,6 @@
> +       {FF_DCT_FASTINT, "Fast Integer", "fastint"},
> +       {FF_DCT_INT, "Accurate Integer", "int"},
> +       {FF_DCT_MMX, "MMX", "mmx"},
> +-      {FF_DCT_MLIB, "MLIB", "mlib"},
> +       {FF_DCT_ALTIVEC, "ALTIVEC", "altivec"},
> +       {FF_DCT_FAAN, "FAAN", "faan"},
> +       {0, NULL, NULL},
> +@@ -173,8 +172,6 @@
> +       {FF_IDCT_SIMPLE, "Simple", "simple"},
> +       {FF_IDCT_SIMPLEMMX, "Simple MMX", "simplemmx"},
> +       {FF_IDCT_LIBMPEG2MMX, "LIBMPEG2MMX", "libmpeg2mmx"},
> +-      {FF_IDCT_PS2, "PS2", "ps2"},
> +-      {FF_IDCT_MLIB, "MLIB", "mlib"},
> +       {FF_IDCT_ARM, "ARM", "arm"},
> +       {FF_IDCT_ALTIVEC, "ALTIVEC", "altivec"},
> +       {FF_IDCT_SH4, "SH4", "sh4"},
> +@@ -263,16 +260,11 @@
> +=20
> +   if (!ffmpeg_flags_type) {
> +     static const GFlagsValue ffmpeg_flags[] =3D {
> +-      {CODEC_FLAG_OBMC, "Use overlapped block motion compensation (h263=
+)",
> +-          "obmc"},
> +       {CODEC_FLAG_QSCALE, "Use fixed qscale", "qscale"},
> +       {CODEC_FLAG_4MV, "Allow 4 MV per MB", "4mv"},
> +-      {CODEC_FLAG_H263P_AIV, "H.263 alternative inter VLC", "aiv"},
> +       {CODEC_FLAG_QPEL, "Quartel Pel Motion Compensation", "qpel"},
> +       {CODEC_FLAG_GMC, "GMC", "gmc"},
> +       {CODEC_FLAG_MV0, "Always try a MB with MV (0,0)", "mv0"},
> +-      {CODEC_FLAG_PART,
> +-          "Store MV, DC and AC coefficients in seperate partitions", "p=
art"},
> +       {CODEC_FLAG_LOOP_FILTER, "Loop filter", "loop-filter"},
> +       {CODEC_FLAG_GRAY, "Only decode/encode grayscale", "gray"},
> +       {CODEC_FLAG_NORMALIZE_AQP,
> +@@ -282,13 +274,9 @@
> +           "global-headers"},
> +       {CODEC_FLAG_AC_PRED, "H263 Advanced Intra Coding / MPEG4 AC predi=
ction",
> +           "aic"},
> +-      {CODEC_FLAG_H263P_UMV, "Unlimited Motion Vector", "umv"},
> +       {CODEC_FLAG_CBP_RD, "Rate Distoration Optimization for CBP", "cbp=
-rd"},
> +       {CODEC_FLAG_QP_RD, "Rate Distoration Optimization for QP selectio=
n",
> +           "qp-rd"},
> +-      {CODEC_FLAG_H263P_SLICE_STRUCT, "H263 slice struct", "ss"},
> +-      {CODEC_FLAG_SVCD_SCAN_OFFSET,
> +-          "Reserve space for SVCD scan offset user data", "scanoffset"},
> +       {CODEC_FLAG_CLOSED_GOP, "Closed GOP", "closedgop"},
> +       {0, NULL, NULL},
> +     };
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c gst-ffm=
peg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c	2011-10-31 11=
:14:03.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c	2014-08-08 15:31:3=
0.968869139 +0200
> +@@ -25,8 +25,10 @@
> + #include <gst/gst.h>
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avcodec.h>
> ++#include <channel_layout.h>>
> + #else
> + #include <libavcodec/avcodec.h>
> ++#include <libavutil/channel_layout.h>
> + #endif
> + #include <string.h>
> +=20
> +@@ -35,43 +37,6 @@
> +=20
> + #include <gst/pbutils/codec-utils.h>
> +=20
> +-/*
> +- * Read a palette from a caps.
> +- */
> +-
> +-static void
> +-gst_ffmpeg_get_palette (const GstCaps * caps, AVCodecContext * context)
> +-{
> +-  GstStructure *str =3D gst_caps_get_structure (caps, 0);
> +-  const GValue *palette_v;
> +-  const GstBuffer *palette;
> +-
> +-  /* do we have a palette? */
> +-  if ((palette_v =3D gst_structure_get_value (str, "palette_data")) && =
context) {
> +-    palette =3D gst_value_get_buffer (palette_v);
> +-    if (GST_BUFFER_SIZE (palette) >=3D AVPALETTE_SIZE) {
> +-      if (context->palctrl)
> +-        av_free (context->palctrl);
> +-      context->palctrl =3D av_malloc (sizeof (AVPaletteControl));
> +-      context->palctrl->palette_changed =3D 1;
> +-      memcpy (context->palctrl->palette, GST_BUFFER_DATA (palette),
> +-          AVPALETTE_SIZE);
> +-    }
> +-  }
> +-}
> +-
> +-static void
> +-gst_ffmpeg_set_palette (GstCaps * caps, AVCodecContext * context)
> +-{
> +-  if (context->palctrl) {
> +-    GstBuffer *palette =3D gst_buffer_new_and_alloc (AVPALETTE_SIZE);
> +-
> +-    memcpy (GST_BUFFER_DATA (palette), context->palctrl->palette,
> +-        AVPALETTE_SIZE);
> +-    gst_caps_set_simple (caps, "palette_data", GST_TYPE_BUFFER, palette=
, NULL);
> +-  }
> +-}
> +-
> + /* IMPORTANT: Keep this sorted by the ffmpeg channel masks */
> + static const struct
> + {
> +@@ -79,26 +44,26 @@
> +   GstAudioChannelPosition gst;
> + } _ff_to_gst_layout[] =3D {
> +   {
> +-  CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> +-  CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> +-  CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> +-  CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> +-  CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> +-  CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> +-  CH_FRONT_LEFT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_CEN=
TER}, {
> +-  CH_FRONT_RIGHT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_OF_C=
ENTER}, {
> +-  CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> +-  CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> +-  CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> +-  CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> +-  CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> ++  AV_CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> ++  AV_CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> ++  AV_CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> ++  AV_CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> ++  AV_CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> ++  AV_CH_FRONT_LEFT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_=
CENTER}, {
> ++  AV_CH_FRONT_RIGHT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_O=
F_CENTER}, {
> ++  AV_CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> ++  AV_CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> ++  AV_CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> ++  AV_CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> + };
> +=20
> + static GstAudioChannelPosition *
> +@@ -342,8 +307,8 @@
> +=20
> +     if (channel_layout =3D=3D 0) {
> +       const guint64 default_channel_set[] =3D {
> +-        0, 0, CH_LAYOUT_SURROUND, CH_LAYOUT_QUAD, CH_LAYOUT_5POINT0,
> +-        CH_LAYOUT_5POINT1, 0, CH_LAYOUT_7POINT1
> ++        0, 0, AV_CH_LAYOUT_SURROUND, AV_CH_LAYOUT_QUAD, AV_CH_LAYOUT_5P=
OINT0,
> ++        AV_CH_LAYOUT_5POINT1, 0, AV_CH_LAYOUT_7POINT1
> +       };
> +=20
> +       switch (codec_id) {
> +@@ -1267,8 +1232,6 @@
> +     case CODEC_ID_FLIC:
> +     case CODEC_ID_VMDVIDEO:
> +     case CODEC_ID_VMDAUDIO:
> +-    case CODEC_ID_SONIC:
> +-    case CODEC_ID_SONIC_LS:
> +     case CODEC_ID_SNOW:
> +     case CODEC_ID_VIXL:
> +     case CODEC_ID_QPEG:
> +@@ -1689,11 +1652,6 @@
> +       gst_buffer_unref (data);
> +     }
> +=20
> +-    /* palette */
> +-    if (context) {
> +-      gst_ffmpeg_set_palette (caps, context);
> +-    }
> +-
> +     GST_LOG ("caps for codec_id=3D%d: %" GST_PTR_FORMAT, codec_id, caps=
);
> +=20
> +   } else {
> +@@ -1830,9 +1788,6 @@
> +             "bpp", G_TYPE_INT, bpp,
> +             "depth", G_TYPE_INT, depth,
> +             "endianness", G_TYPE_INT, endianness, NULL);
> +-        if (caps && context) {
> +-          gst_ffmpeg_set_palette (caps, context);
> +-        }
> +       }
> +     } else if (fmt) {
> +       caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw-yuv=
",
> +@@ -1857,7 +1812,7 @@
> +  */
> +=20
> + static GstCaps *
> +-gst_ffmpeg_smpfmt_to_caps (enum SampleFormat sample_fmt,
> ++gst_ffmpeg_smpfmt_to_caps (enum AVSampleFormat sample_fmt,
> +     AVCodecContext * context, enum CodecID codec_id)
> + {
> +   GstCaps *caps =3D NULL;
> +@@ -1867,22 +1822,22 @@
> +   gboolean signedness =3D FALSE;
> +=20
> +   switch (sample_fmt) {
> +-    case SAMPLE_FMT_S16:
> ++    case AV_SAMPLE_FMT_S16:
> +       signedness =3D TRUE;
> +       bpp =3D 16;
> +       break;
> +=20
> +-    case SAMPLE_FMT_S32:
> ++    case AV_SAMPLE_FMT_S32:
> +       signedness =3D TRUE;
> +       bpp =3D 32;
> +       break;
> +=20
> +-    case SAMPLE_FMT_FLT:
> ++    case AV_SAMPLE_FMT_FLT:
> +       integer =3D FALSE;
> +       bpp =3D 32;
> +       break;
> +=20
> +-    case SAMPLE_FMT_DBL:
> ++    case AV_SAMPLE_FMT_DBL:
> +       integer =3D FALSE;
> +       bpp =3D 64;
> +       break;
> +@@ -1941,12 +1896,12 @@
> +     }
> +   } else {
> +     GstCaps *temp;
> +-    enum SampleFormat i;
> ++    enum AVSampleFormat i;
> +     AVCodecContext ctx =3D { 0, };
> +=20
> +     ctx.channels =3D -1;
> +     caps =3D gst_caps_new_empty ();
> +-    for (i =3D 0; i <=3D SAMPLE_FMT_DBL; i++) {
> ++    for (i =3D 0; i <=3D AV_SAMPLE_FMT_DBL; i++) {
> +       temp =3D gst_ffmpeg_smpfmt_to_caps (i, encode ? &ctx : NULL, code=
c_id);
> +       if (temp !=3D NULL) {
> +         gst_caps_append (caps, temp);
> +@@ -2049,9 +2004,9 @@
> +         gst_structure_get_int (structure, "endianness", &endianness)) {
> +       if (endianness =3D=3D G_BYTE_ORDER) {
> +         if (width =3D=3D 32)
> +-          context->sample_fmt =3D SAMPLE_FMT_FLT;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_FLT;
> +         else if (width =3D=3D 64)
> +-          context->sample_fmt =3D SAMPLE_FMT_DBL;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_DBL;
> +       }
> +     }
> +   } else {
> +@@ -2062,9 +2017,9 @@
> +         gst_structure_get_int (structure, "endianness", &endianness)) {
> +       if ((endianness =3D=3D G_BYTE_ORDER) && (signedness =3D=3D TRUE))=
 {
> +         if ((width =3D=3D 16) && (depth =3D=3D 16))
> +-          context->sample_fmt =3D SAMPLE_FMT_S16;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S16;
> +         else if ((width =3D=3D 32) && (depth =3D=3D 32))
> +-          context->sample_fmt =3D SAMPLE_FMT_S32;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S32;
> +       }
> +     }
> +   }
> +@@ -2190,7 +2145,6 @@
> +       } else {
> +         if (bpp =3D=3D 8) {
> +           context->pix_fmt =3D PIX_FMT_PAL8;
> +-          gst_ffmpeg_get_palette (caps, context);
> +         }
> +       }
> +     }
> +@@ -2576,7 +2530,6 @@
> +   switch (codec_type) {
> +     case AVMEDIA_TYPE_VIDEO:
> +       gst_ffmpeg_caps_to_pixfmt (caps, context, codec_id =3D=3D CODEC_I=
D_RAWVIDEO);
> +-      gst_ffmpeg_get_palette (caps, context);
> +       break;
> +     case AVMEDIA_TYPE_AUDIO:
> +       gst_ffmpeg_caps_to_smpfmt (caps, context, FALSE);
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.orig gs=
t-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.orig	1970-01-=
01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.orig	2014-08-08 15=
:30:34.006867097 +0200
> +@@ -0,0 +1,3447 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ * This file:
> ++ * Copyright (c) 2002-2004 Ronald Bultje <rbultje@ronald.bitfreak.net>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++#include <gst/gst.h>
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#include <channel_layout.h>>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#include <libavutil/channel_layout.h>
> ++#endif
> ++#include <string.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++
> ++#include <gst/pbutils/codec-utils.h>
> ++
> ++/*
> ++ * Read a palette from a caps.
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_get_palette (const GstCaps * caps, AVCodecContext * context)
> ++{
> ++  GstStructure *str =3D gst_caps_get_structure (caps, 0);
> ++  const GValue *palette_v;
> ++  const GstBuffer *palette;
> ++
> ++  /* do we have a palette? */
> ++  if ((palette_v =3D gst_structure_get_value (str, "palette_data")) && =
context) {
> ++    palette =3D gst_value_get_buffer (palette_v);
> ++    if (GST_BUFFER_SIZE (palette) >=3D AVPALETTE_SIZE) {
> ++      if (context->palctrl)
> ++        av_free (context->palctrl);
> ++      context->palctrl =3D av_malloc (sizeof (AVPaletteControl));
> ++      context->palctrl->palette_changed =3D 1;
> ++      memcpy (context->palctrl->palette, GST_BUFFER_DATA (palette),
> ++          AVPALETTE_SIZE);
> ++    }
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpeg_set_palette (GstCaps * caps, AVCodecContext * context)
> ++{
> ++  if (context->palctrl) {
> ++    GstBuffer *palette =3D gst_buffer_new_and_alloc (AVPALETTE_SIZE);
> ++
> ++    memcpy (GST_BUFFER_DATA (palette), context->palctrl->palette,
> ++        AVPALETTE_SIZE);
> ++    gst_caps_set_simple (caps, "palette_data", GST_TYPE_BUFFER, palette=
, NULL);
> ++  }
> ++}
> ++
> ++/* IMPORTANT: Keep this sorted by the ffmpeg channel masks */
> ++static const struct
> ++{
> ++  guint64 ff;
> ++  GstAudioChannelPosition gst;
> ++} _ff_to_gst_layout[] =3D {
> ++  {
> ++  AV_CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> ++  AV_CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> ++  AV_CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> ++  AV_CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> ++  AV_CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> ++  AV_CH_FRONT_LEFT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_=
CENTER}, {
> ++  AV_CH_FRONT_RIGHT_OF_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_O=
F_CENTER}, {
> ++  AV_CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> ++  AV_CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> ++  AV_CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> ++  AV_CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> ++};
> ++
> ++static GstAudioChannelPosition *
> ++gst_ff_channel_layout_to_gst (guint64 channel_layout, guint channels)
> ++{
> ++  guint nchannels =3D 0, i, j;
> ++  GstAudioChannelPosition *pos =3D NULL;
> ++  gboolean none_layout =3D FALSE;
> ++
> ++  for (i =3D 0; i < 64; i++) {
> ++    if ((channel_layout & (G_GUINT64_CONSTANT (1) << i)) !=3D 0) {
> ++      nchannels++;
> ++    }
> ++  }
> ++
> ++  if (channel_layout =3D=3D 0) {
> ++    nchannels =3D channels;
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (nchannels !=3D channels) {
> ++    GST_ERROR ("Number of channels is different (%u !=3D %u)", channels,
> ++        nchannels);
> ++    return NULL;
> ++  }
> ++
> ++  pos =3D g_new (GstAudioChannelPosition, nchannels);
> ++
> ++  for (i =3D 0, j =3D 0; i < G_N_ELEMENTS (_ff_to_gst_layout); i++) {
> ++    if ((channel_layout & _ff_to_gst_layout[i].ff) !=3D 0) {
> ++      pos[j++] =3D _ff_to_gst_layout[i].gst;
> ++
> ++      if (_ff_to_gst_layout[i].gst =3D=3D GST_AUDIO_CHANNEL_POSITION_NO=
NE)
> ++        none_layout =3D TRUE;
> ++    }
> ++  }
> ++
> ++  if (j !=3D nchannels) {
> ++    GST_WARNING ("Unknown channels in channel layout - assuming NONE la=
yout");
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (!none_layout && !gst_audio_check_channel_positions (pos, nchannel=
s)) {
> ++    GST_ERROR ("Invalid channel layout %" G_GUINT64_FORMAT
> ++        " - assuming NONE layout", channel_layout);
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (none_layout) {
> ++    if (nchannels =3D=3D 1) {
> ++      pos[0] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_MONO;
> ++    } else if (nchannels =3D=3D 2) {
> ++      pos[0] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT;
> ++      pos[1] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT;
> ++    } else if (channel_layout =3D=3D 0) {
> ++      g_free (pos);
> ++      pos =3D NULL;
> ++    } else {
> ++      for (i =3D 0; i < nchannels; i++)
> ++        pos[i] =3D GST_AUDIO_CHANNEL_POSITION_NONE;
> ++    }
> ++  }
> ++
> ++  if (nchannels =3D=3D 1 && pos[0] =3D=3D GST_AUDIO_CHANNEL_POSITION_FR=
ONT_CENTER) {
> ++    GST_DEBUG ("mono common case; won't set channel positions");
> ++    g_free (pos);
> ++    pos =3D NULL;
> ++  } else if (nchannels =3D=3D 2 && pos[0] =3D=3D GST_AUDIO_CHANNEL_POSI=
TION_FRONT_LEFT
> ++      && pos[1] =3D=3D GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT) {
> ++    GST_DEBUG ("stereo common case; won't set channel positions");
> ++    g_free (pos);
> ++    pos =3D NULL;
> ++  }
> ++
> ++  return pos;
> ++}
> ++
> ++/* this macro makes a caps width fixed or unfixed width/height
> ++ * properties depending on whether we've got a context.
> ++ *
> ++ * See below for why we use this.
> ++ *
> ++ * We should actually do this stuff at the end, like in riff-media.c,
> ++ * but I'm too lazy today. Maybe later.
> ++ */
> ++static GstCaps *
> ++gst_ff_vid_caps_new (AVCodecContext * context, enum CodecID codec_id,
> ++    const char *mimetype, const char *fieldname, ...)
> ++{
> ++  GstStructure *structure =3D NULL;
> ++  GstCaps *caps =3D NULL;
> ++  va_list var_args;
> ++  gint i;
> ++
> ++  GST_LOG ("context:%p, codec_id:%d, mimetype:%s", context, codec_id, m=
imetype);
> ++
> ++  /* fixed, non probing context */
> ++  if (context !=3D NULL && context->width !=3D -1) {
> ++    gint num, denom;
> ++
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "width", G_TYPE_INT, context->width,
> ++        "height", G_TYPE_INT, context->height, NULL);
> ++
> ++    num =3D context->time_base.den / context->ticks_per_frame;
> ++    denom =3D context->time_base.num;
> ++
> ++    if (!denom) {
> ++      GST_LOG ("invalid framerate: %d/0, -> %d/1", num, num);
> ++      denom =3D 1;
> ++    }
> ++    if (gst_util_fraction_compare (num, denom, 1000, 1) > 0) {
> ++      GST_LOG ("excessive framerate: %d/%d, -> 0/1", num, denom);
> ++      num =3D 0;
> ++      denom =3D 1;
> ++    }
> ++    GST_LOG ("setting framerate: %d/%d", num, denom);
> ++    gst_caps_set_simple (caps,
> ++        "framerate", GST_TYPE_FRACTION, num, denom, NULL);
> ++  } else {
> ++    /* so we are after restricted caps in this case */
> ++    switch (codec_id) {
> ++      case CODEC_ID_H261:
> ++      {
> ++        caps =3D gst_caps_new_simple (mimetype,
> ++            "width", G_TYPE_INT, 352,
> ++            "height", G_TYPE_INT, 288,
> ++            "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, NU=
LL);
> ++        gst_caps_append (caps, gst_caps_new_simple (mimetype,
> ++                "width", G_TYPE_INT, 176,
> ++                "height", G_TYPE_INT, 144,
> ++                "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1=
, NULL));
> ++        break;
> ++      }
> ++      case CODEC_ID_H263:
> ++      {
> ++        /* 128x96, 176x144, 352x288, 704x576, and 1408x1152. slightly r=
eordered
> ++         * because we want automatic negotiation to go as close to 320x=
240 as
> ++         * possible. */
> ++        const static gint widths[] =3D { 352, 704, 176, 1408, 128 };
> ++        const static gint heights[] =3D { 288, 576, 144, 1152, 96 };
> ++        GstCaps *temp;
> ++        gint n_sizes =3D G_N_ELEMENTS (widths);
> ++
> ++        caps =3D gst_caps_new_empty ();
> ++        for (i =3D 0; i < n_sizes; i++) {
> ++          temp =3D gst_caps_new_simple (mimetype,
> ++              "width", G_TYPE_INT, widths[i],
> ++              "height", G_TYPE_INT, heights[i],
> ++              "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, =
NULL);
> ++
> ++          gst_caps_append (caps, temp);
> ++        }
> ++        break;
> ++      }
> ++      case CODEC_ID_DVVIDEO:
> ++      {
> ++        static struct
> ++        {
> ++          guint32 csp;
> ++          gint width, height;
> ++          gint par_n, par_d;
> ++          gint framerate_n, framerate_d;
> ++        } profiles[] =3D {
> ++          {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 480, 10, 11, 30000=
, 1001}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 480, 40, 33, 30000=
, 1001}, {
> ++          GST_MAKE_FOURCC ('I', '4', '2', '0'), 720, 576, 59, 54, 25, 1=
}, {
> ++          GST_MAKE_FOURCC ('I', '4', '2', '0'), 720, 576, 118, 81, 25, =
1}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 576, 59, 54, 25, 1=
}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 576, 118, 81, 25, =
1}
> ++        };
> ++        GstCaps *temp;
> ++        gint n_sizes =3D G_N_ELEMENTS (profiles);
> ++
> ++        caps =3D gst_caps_new_empty ();
> ++        for (i =3D 0; i < n_sizes; i++) {
> ++          temp =3D gst_caps_new_simple (mimetype,
> ++              "width", G_TYPE_INT, profiles[i].width,
> ++              "height", G_TYPE_INT, profiles[i].height,
> ++              "framerate", GST_TYPE_FRACTION, profiles[i].framerate_n,
> ++              profiles[i].framerate_d, "pixel-aspect-ratio", GST_TYPE_F=
RACTION,
> ++              profiles[i].par_n, profiles[i].par_d, NULL);
> ++
> ++          gst_caps_append (caps, temp);
> ++        }
> ++        break;
> ++      }
> ++      case CODEC_ID_DNXHD:
> ++      {
> ++        caps =3D gst_caps_new_simple (mimetype,
> ++            "width", G_TYPE_INT, 1920,
> ++            "height", G_TYPE_INT, 1080,
> ++            "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, NU=
LL);
> ++        gst_caps_append (caps, gst_caps_new_simple (mimetype,
> ++                "width", G_TYPE_INT, 1280,
> ++                "height", G_TYPE_INT, 720,
> ++                "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1=
, NULL));
> ++        break;
> ++      }
> ++      default:
> ++        break;
> ++    }
> ++  }
> ++
> ++  /* no fixed caps or special restrictions applied;
> ++   * default unfixed setting */
> ++  if (!caps) {
> ++    GST_DEBUG ("Creating default caps");
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "width", GST_TYPE_INT_RANGE, 16, 4096,
> ++        "height", GST_TYPE_INT_RANGE, 16, 4096,
> ++        "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, NULL);
> ++  }
> ++
> ++  for (i =3D 0; i < gst_caps_get_size (caps); i++) {
> ++    va_start (var_args, fieldname);
> ++    structure =3D gst_caps_get_structure (caps, i);
> ++    gst_structure_set_valist (structure, fieldname, var_args);
> ++    va_end (var_args);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* same for audio - now with channels/sample rate
> ++ */
> ++static GstCaps *
> ++gst_ff_aud_caps_new (AVCodecContext * context, enum CodecID codec_id,
> ++    const char *mimetype, const char *fieldname, ...)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++  GstStructure *structure =3D NULL;
> ++  gint i;
> ++  va_list var_args;
> ++
> ++  /* fixed, non-probing context */
> ++  if (context !=3D NULL && context->channels !=3D -1) {
> ++    GstAudioChannelPosition *pos;
> ++    guint64 channel_layout =3D context->channel_layout;
> ++
> ++    if (channel_layout =3D=3D 0) {
> ++      const guint64 default_channel_set[] =3D {
> ++        0, 0, AV_CH_LAYOUT_SURROUND, AV_CH_LAYOUT_QUAD, AV_CH_LAYOUT_5P=
OINT0,
> ++        AV_CH_LAYOUT_5POINT1, 0, AV_CH_LAYOUT_7POINT1
> ++      };
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_EAC3:
> ++        case CODEC_ID_AC3:
> ++        case CODEC_ID_DTS:
> ++          if (context->channels > 0
> ++              && context->channels < G_N_ELEMENTS (default_channel_set))
> ++            channel_layout =3D default_channel_set[context->channels - =
1];
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "rate", G_TYPE_INT, context->sample_rate,
> ++        "channels", G_TYPE_INT, context->channels, NULL);
> ++
> ++    pos =3D gst_ff_channel_layout_to_gst (channel_layout, context->chan=
nels);
> ++    if (pos !=3D NULL) {
> ++      gst_audio_set_channel_positions (gst_caps_get_structure (caps, 0)=
, pos);
> ++      g_free (pos);
> ++    }
> ++  } else {
> ++    gint maxchannels =3D 2;
> ++    const gint *rates =3D NULL;
> ++    gint n_rates =3D 0;
> ++
> ++    /* so we must be after restricted caps in this case */
> ++    switch (codec_id) {
> ++      case CODEC_ID_AAC:
> ++      case CODEC_ID_AAC_LATM:
> ++      case CODEC_ID_DTS:
> ++        maxchannels =3D 6;
> ++        break;
> ++      case CODEC_ID_MP2:
> ++      {
> ++        const static gint l_rates[] =3D
> ++            { 48000, 44100, 32000, 24000, 22050, 16000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_EAC3:
> ++      case CODEC_ID_AC3:
> ++      {
> ++        const static gint l_rates[] =3D { 48000, 44100, 32000 };
> ++        maxchannels =3D 6;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_G722:
> ++      {
> ++        const static gint l_rates[] =3D { 16000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        maxchannels =3D 1;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_G726:
> ++      {
> ++        const static gint l_rates[] =3D { 8000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        maxchannels =3D 1;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_SWF:
> ++      {
> ++        const static gint l_rates[] =3D { 11025, 22050, 44100 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_ROQ_DPCM:
> ++      {
> ++        const static gint l_rates[] =3D { 22050 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_AMR_NB:
> ++      {
> ++        const static gint l_rates[] =3D { 8000 };
> ++        maxchannels =3D 1;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_AMR_WB:
> ++      {
> ++        const static gint l_rates[] =3D { 16000 };
> ++        maxchannels =3D 1;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      default:
> ++        break;
> ++    }
> ++
> ++    /* TODO: handle context->channel_layouts here to set
> ++     * the list of channel layouts supported by the encoder.
> ++     * Unfortunately no encoder uses this yet....
> ++     */
> ++    /* regardless of encode/decode, open up channels if applicable */
> ++    /* Until decoders/encoders expose the maximum number of channels
> ++     * they support, we whitelist them here. */
> ++    switch (codec_id) {
> ++      case CODEC_ID_WMAPRO:
> ++      case CODEC_ID_TRUEHD:
> ++        maxchannels =3D 8;
> ++        break;
> ++      default:
> ++        break;
> ++    }
> ++
> ++    if (maxchannels =3D=3D 1)
> ++      caps =3D gst_caps_new_simple (mimetype,
> ++          "channels", G_TYPE_INT, maxchannels, NULL);
> ++    else
> ++      caps =3D gst_caps_new_simple (mimetype,
> ++          "channels", GST_TYPE_INT_RANGE, 1, maxchannels, NULL);
> ++    if (n_rates) {
> ++      GValue list =3D { 0, };
> ++      GstStructure *structure;
> ++
> ++      g_value_init (&list, GST_TYPE_LIST);
> ++      for (i =3D 0; i < n_rates; i++) {
> ++        GValue v =3D { 0, };
> ++
> ++        g_value_init (&v, G_TYPE_INT);
> ++        g_value_set_int (&v, rates[i]);
> ++        gst_value_list_append_value (&list, &v);
> ++        g_value_unset (&v);
> ++      }
> ++      structure =3D gst_caps_get_structure (caps, 0);
> ++      gst_structure_set_value (structure, "rate", &list);
> ++      g_value_unset (&list);
> ++    } else
> ++      gst_caps_set_simple (caps, "rate", GST_TYPE_INT_RANGE, 4000, 9600=
0, NULL);
> ++  }
> ++
> ++  for (i =3D 0; i < gst_caps_get_size (caps); i++) {
> ++    va_start (var_args, fieldname);
> ++    structure =3D gst_caps_get_structure (caps, i);
> ++    gst_structure_set_valist (structure, fieldname, var_args);
> ++    va_end (var_args);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG codec ID and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * CodecID is primarily meant for compressed data GstCaps!
> ++ *
> ++ * encode is a special parameter. gstffmpegdec will say
> ++ * FALSE, gstffmpegenc will say TRUE. The output caps
> ++ * depends on this, in such a way that it will be very
> ++ * specific, defined, fixed and correct caps for encoders,
> ++ * yet very wide, "forgiving" caps for decoders. Example
> ++ * for mp3: decode: audio/mpeg,mpegversion=3D1,layer=3D[1-3]
> ++ * but encode: audio/mpeg,mpegversion=3D1,layer=3D3,bitrate=3Dx,
> ++ * rate=3Dx,channels=3Dx.
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_codecid_to_caps (enum CodecID codec_id,
> ++    AVCodecContext * context, gboolean encode)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++  gboolean buildcaps =3D FALSE;
> ++
> ++  GST_LOG ("codec_id:%d, context:%p, encode:%d", codec_id, context, enc=
ode);
> ++
> ++  switch (codec_id) {
> ++    case CODEC_ID_MPEG1VIDEO:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1,
> ++          "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MPEG2VIDEO:
> ++      if (encode) {
> ++        /* FIXME: bitrate */
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/mpeg",
> ++            "mpegversion", G_TYPE_INT, 2,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      } else {
> ++        /* decode both MPEG-1 and MPEG-2; width/height/fps are all in
> ++         * the MPEG video stream headers, so may be omitted from caps. =
*/
> ++        caps =3D gst_caps_new_simple ("video/mpeg",
> ++            "mpegversion", GST_TYPE_INT_RANGE, 1, 2,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MPEG2VIDEO_XVMC:
> ++      /* this is a special ID - don't need it in GStreamer, I think */
> ++      break;
> ++
> ++    case CODEC_ID_H263:
> ++      if (encode) {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-h263",
> ++            "variant", G_TYPE_STRING, "itu",
> ++            "h263version", G_TYPE_STRING, "h263", NULL);
> ++      } else {
> ++        /* don't pass codec_id, we can decode other variants with the H=
263
> ++         * decoder that don't have specific size requirements
> ++         */
> ++        caps =3D gst_ff_vid_caps_new (context, CODEC_ID_NONE, "video/x-=
h263",
> ++            "variant", G_TYPE_STRING, "itu", NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_H263P:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-h263",
> ++          "variant", G_TYPE_STRING, "itu",
> ++          "h263version", G_TYPE_STRING, "h263p", NULL);
> ++      if (encode && context) {
> ++
> ++        gst_caps_set_simple (caps,
> ++            "annex-f", G_TYPE_BOOLEAN, context->flags & CODEC_FLAG_4MV,
> ++            "annex-j", G_TYPE_BOOLEAN, context->flags & CODEC_FLAG_LOOP=
_FILTER,
> ++            "annex-i", G_TYPE_BOOLEAN, context->flags & CODEC_FLAG_AC_P=
RED,
> ++            "annex-t", G_TYPE_BOOLEAN, context->flags & CODEC_FLAG_AC_P=
RED,
> ++            NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_H263I:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-intel-h=
263",
> ++          "variant", G_TYPE_STRING, "intel", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_H261:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-h261", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV40:
> ++    {
> ++      gint version;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_RV40:
> ++          version =3D 4;
> ++          break;
> ++        case CODEC_ID_RV30:
> ++          version =3D 3;
> ++          break;
> ++        case CODEC_ID_RV20:
> ++          version =3D 2;
> ++          break;
> ++        default:
> ++          version =3D 1;
> ++          break;
> ++      }
> ++
> ++      /* FIXME: context->sub_id must be filled in during decoding */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-pn-real=
video",
> ++          "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++          "rmversion", G_TYPE_INT, version, NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps, "format", G_TYPE_INT, context->sub_i=
d, NULL);
> ++        if (context->extradata_size >=3D 8) {
> ++          gst_caps_set_simple (caps,
> ++              "subformat", G_TYPE_INT, GST_READ_UINT32_BE (context->ext=
radata),
> ++              NULL);
> ++        }
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_MP1:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MP2:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MP3:
> ++      if (encode) {
> ++        /* FIXME: bitrate */
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++            "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 3, NULL);
> ++      } else {
> ++        /* Decodes MPEG-1 layer 1/2/3. Samplerate, channels et al are
> ++         * in the MPEG audio header, so may be omitted from caps. */
> ++        caps =3D gst_caps_new_simple ("audio/mpeg",
> ++            "mpegversion", G_TYPE_INT, 1,
> ++            "layer", GST_TYPE_INT_RANGE, 1, 3, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MUSEPACK7:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id,
> ++          "audio/x-ffmpeg-parsed-musepack", "streamversion", G_TYPE_INT=
, 7,
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MUSEPACK8:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id,
> ++          "audio/x-ffmpeg-parsed-musepack", "streamversion", G_TYPE_INT=
, 8,
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AC3:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-ac3", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_EAC3:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-eac3", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUEHD:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-true-hd=
", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ATRAC1:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, "audio/x-vnd.sony.atr=
ac1",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ATRAC3:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, "audio/x-vnd.sony.atr=
ac3",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DTS:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-dts", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_APE:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, "audio/x-ffmpeg-parse=
d-ape",
> ++          NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, context->bits_per_coded_sample, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MLP:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-mlp", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_IMC:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-imc", N=
ULL);
> ++      break;
> ++
> ++      /* MJPEG is normal JPEG, Motion-JPEG and Quicktime MJPEG-A. MJPEGB
> ++       * is Quicktime's MJPEG-B. LJPEG is lossless JPEG. I don't know w=
hat
> ++       * sp5x is, but it's apparently something JPEG... We don't separa=
te
> ++       * between those in GStreamer. Should we (at least between MJPEG,
> ++       * MJPEG-B and sp5x decoding...)? */
> ++    case CODEC_ID_MJPEG:
> ++    case CODEC_ID_LJPEG:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/jpeg", NU=
LL);
> ++      break;
> ++
> ++    case CODEC_ID_SP5X:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/sp5x", NU=
LL);
> ++      break;
> ++
> ++    case CODEC_ID_MJPEGB:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-mjpeg-b=
", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MPEG4:
> ++      if (encode && context !=3D NULL) {
> ++        /* I'm not exactly sure what ffmpeg outputs... ffmpeg itself us=
es
> ++         * the AVI fourcc 'DIVX', but 'mp4v' for Quicktime... */
> ++        switch (context->codec_tag) {
> ++          case GST_MAKE_FOURCC ('D', 'I', 'V', 'X'):
> ++            caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-d=
ivx",
> ++                "divxversion", G_TYPE_INT, 5, NULL);
> ++            break;
> ++          case GST_MAKE_FOURCC ('m', 'p', '4', 'v'):
> ++          default:
> ++            /* FIXME: bitrate */
> ++            caps =3D gst_ff_vid_caps_new (context, codec_id, "video/mpe=
g",
> ++                "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++                "mpegversion", G_TYPE_INT, 4, NULL);
> ++            break;
> ++        }
> ++      } else {
> ++        /* The trick here is to separate xvid, divx, mpeg4, 3ivx et al =
*/
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/mpeg",
> ++            "mpegversion", G_TYPE_INT, 4,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++        if (encode) {
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, codec_id,
> ++                  "video/x-divx", "divxversion", G_TYPE_INT, 5, NULL));
> ++        } else {
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, codec_id,
> ++                  "video/x-divx", "divxversion", GST_TYPE_INT_RANGE, 4,=
 5,
> ++                  NULL));
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, codec_id,
> ++                  "video/x-xvid", NULL));
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, codec_id,
> ++                  "video/x-3ivx", NULL));
> ++        }
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_RAWVIDEO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_caps (AVMEDIA_TYPE_VIDEO, context, co=
dec_id,
> ++          encode);
> ++      break;
> ++
> ++    case CODEC_ID_MSMPEG4V1:
> ++    case CODEC_ID_MSMPEG4V2:
> ++    case CODEC_ID_MSMPEG4V3:
> ++    {
> ++      gint version =3D 41 + codec_id - CODEC_ID_MSMPEG4V1;
> ++
> ++      /* encode-FIXME: bitrate */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-msmpeg",
> ++          "msmpegversion", G_TYPE_INT, version, NULL);
> ++      if (!encode && codec_id =3D=3D CODEC_ID_MSMPEG4V3) {
> ++        gst_caps_append (caps, gst_ff_vid_caps_new (context, codec_id,
> ++                "video/x-divx", "divxversion", G_TYPE_INT, 3, NULL));
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_WMV1:
> ++    case CODEC_ID_WMV2:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_WMV1) ? 1 : 2;
> ++
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, version, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_FLV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-flash-v=
ideo",
> ++          "flvversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SVQ1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-svq",
> ++          "svqversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SVQ3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-svq",
> ++          "svqversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DVAUDIO:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-dv", NU=
LL);
> ++      break;
> ++
> ++    case CODEC_ID_DVVIDEO:
> ++    {
> ++      if (encode && context) {
> ++        guint32 fourcc;
> ++
> ++        switch (context->pix_fmt) {
> ++          case PIX_FMT_YUYV422:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', 'U', 'Y', '2');
> ++            break;
> ++          case PIX_FMT_YUV420P:
> ++            fourcc =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++            break;
> ++          case PIX_FMT_YUVA420P:
> ++            fourcc =3D GST_MAKE_FOURCC ('A', '4', '2', '0');
> ++            break;
> ++          case PIX_FMT_YUV411P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', '4', '1', 'B');
> ++            break;
> ++          case PIX_FMT_YUV422P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', '4', '2', 'B');
> ++            break;
> ++          case PIX_FMT_YUV410P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', 'U', 'V', '9');
> ++            break;
> ++          default:
> ++            GST_WARNING
> ++                ("Couldnt' find fourcc for pixfmt %d, defaulting to I42=
0",
> ++                context->pix_fmt);
> ++            fourcc =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++            break;
> ++        }
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-dv",
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++            "format", GST_TYPE_FOURCC, fourcc, NULL);
> ++      } else {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-dv",
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_WMAV1:
> ++    case CODEC_ID_WMAV2:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_WMAV1) ? 1 : 2;
> ++
> ++      if (context) {
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-wma",
> ++            "wmaversion", G_TYPE_INT, version,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      } else {
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-wma",
> ++            "wmaversion", G_TYPE_INT, version,
> ++            "block_align", GST_TYPE_INT_RANGE, 0, G_MAXINT,
> ++            "bitrate", GST_TYPE_INT_RANGE, 0, G_MAXINT, NULL);
> ++      }
> ++    }
> ++      break;
> ++    case CODEC_ID_WMAPRO:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-wma",
> ++          "wmaversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++    }
> ++
> ++    case CODEC_ID_WMAVOICE:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-wms", N=
ULL);
> ++      break;
> ++    }
> ++
> ++    case CODEC_ID_MACE3:
> ++    case CODEC_ID_MACE6:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_MACE3) ? 3 : 6;
> ++
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-mace",
> ++          "maceversion", G_TYPE_INT, version, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_HUFFYUV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-huffyuv=
", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "bpp", G_TYPE_INT, context->bits_per_coded_sample, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_CYUV:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "video/x-compressed-y=
uv",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_H264:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-h264", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO5:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 5, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FLASHSV:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "video/x-flash-screen=
", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp3", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP5:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp5", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp6", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6F:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp6-fla=
sh", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6A:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp6-alp=
ha", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP8:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vp8", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_THEORA:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-theora"=
, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AAC:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg", NU=
LL);
> ++
> ++      if (!encode) {
> ++        GValue arr =3D { 0, };
> ++        GValue item =3D { 0, };
> ++
> ++        g_value_init (&arr, GST_TYPE_LIST);
> ++        g_value_init (&item, G_TYPE_INT);
> ++        g_value_set_int (&item, 2);
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_int (&item, 4);
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_unset (&item);
> ++
> ++        gst_caps_set_value (caps, "mpegversion", &arr);
> ++        g_value_unset (&arr);
> ++
> ++        g_value_init (&arr, GST_TYPE_LIST);
> ++        g_value_init (&item, G_TYPE_STRING);
> ++        g_value_set_string (&item, "raw");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_string (&item, "adts");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_string (&item, "adif");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_unset (&item);
> ++
> ++        gst_caps_set_value (caps, "stream-format", &arr);
> ++        g_value_unset (&arr);
> ++      } else {
> ++        gst_caps_set_simple (caps, "mpegversion", G_TYPE_INT, 4,
> ++            "stream-format", G_TYPE_STRING, "raw",
> ++            "base-profile", G_TYPE_STRING, "lc", NULL);
> ++
> ++        if (context && context->extradata_size > 0)
> ++          gst_codec_utils_aac_caps_set_level_and_profile (caps,
> ++              context->extradata, context->extradata_size);
> ++      }
> ++
> ++      break;
> ++    }
> ++    case CODEC_ID_AAC_LATM:    /* LATM/LOAS AAC syntax */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 4, "stream-format", G_TYPE_STRING,=
 "loas",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ASV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-asus",
> ++          "asusversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++    case CODEC_ID_ASV2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-asus",
> ++          "asusversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FFV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-ffv",
> ++          "ffvversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_4XM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-4xm", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_XAN_WC3:
> ++    case CODEC_ID_XAN_WC4:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-xan",
> ++          "wcversion", G_TYPE_INT, 3 - CODEC_ID_XAN_WC3 + codec_id, NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_CLJR:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id,
> ++          "video/x-cirrus-logic-accupak", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FRAPS:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-fraps",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MDEC:
> ++    case CODEC_ID_ROQ:
> ++    case CODEC_ID_INTERPLAY_VIDEO:
> ++      buildcaps =3D TRUE;
> ++      break;
> ++
> ++    case CODEC_ID_VCR1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-ati-vcr=
",
> ++          "vcrversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_RPZA:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "video/x-apple-video"=
, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_CINEPAK:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-cinepak=
", NULL);
> ++      break;
> ++
> ++      /* WS_VQA belogns here (order) */
> ++
> ++    case CODEC_ID_MSRLE:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-rle",
> ++          "layout", G_TYPE_STRING, "microsoft", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) context->bits_per_coded_sample,=
 NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 1, 64, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_QTRLE:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-rle",
> ++          "layout", G_TYPE_STRING, "quicktime", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) context->bits_per_coded_sample,=
 NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 1, 64, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MSVIDEO1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-msvideo=
codec",
> ++          "msvideoversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_WMV3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++    case CODEC_ID_VC1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, 3, "format", GST_TYPE_FOURCC,
> ++          GST_MAKE_FOURCC ('W', 'V', 'C', '1'), NULL);
> ++      break;
> ++    case CODEC_ID_QDM2:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-qdm2", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MSZH:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-mszh", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ZLIB:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-zlib", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUEMOTION1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-truemot=
ion",
> ++          "trueversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++    case CODEC_ID_TRUEMOTION2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-truemot=
ion",
> ++          "trueversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ULTI:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-ultimot=
ion",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TSCC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-camtasi=
a", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) context->bits_per_coded_sample,=
 NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 8, 32, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_KMVC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-kmvc", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_NUV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-nuv", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_GIF:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/gif", NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_PNG:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/png", NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_PPM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/ppm", NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_PBM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/pbm", NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_PAM:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "image/x-portable-any=
map",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PGM:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "image/x-portable-gra=
ymap",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PCX:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/x-pcx", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_SGI:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/x-sgi", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_TARGA:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/x-tga", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_TIFF:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/tiff", NU=
LL);
> ++      break;
> ++
> ++    case CODEC_ID_SUNRAST:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, "image/x-sun-raster",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SMC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-smc", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_QDRAW:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-qdrw", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DNXHD:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-dnxhd",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MIMIC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-mimic",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VMNC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-vmnc", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUESPEECH:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, "audio/x-truespeech",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_QCELP:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/qcelp", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_AMV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-amv", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_AASC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-aasc", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_LOCO:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-loco", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ZMBV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-zmbv", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_LAGARITH:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-lagarit=
h", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_CSCD:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-camstud=
io", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) context->bits_per_coded_sample,=
 NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 8, 32, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_WS_VQA:
> ++    case CODEC_ID_IDCIN:
> ++    case CODEC_ID_8BPS:
> ++    case CODEC_ID_FLIC:
> ++    case CODEC_ID_VMDVIDEO:
> ++    case CODEC_ID_VMDAUDIO:
> ++    case CODEC_ID_SNOW:
> ++    case CODEC_ID_VIXL:
> ++    case CODEC_ID_QPEG:
> ++    case CODEC_ID_PGMYUV:
> ++    case CODEC_ID_FFVHUFF:
> ++    case CODEC_ID_WNV1:
> ++    case CODEC_ID_MP3ADU:
> ++    case CODEC_ID_MP3ON4:
> ++    case CODEC_ID_WESTWOOD_SND1:
> ++    case CODEC_ID_MMVIDEO:
> ++    case CODEC_ID_AVS:
> ++    case CODEC_ID_CAVS:
> ++      buildcaps =3D TRUE;
> ++      break;
> ++
> ++      /* weird quasi-codecs for the demuxers only */
> ++    case CODEC_ID_PCM_S16LE:
> ++    case CODEC_ID_PCM_S16BE:
> ++    case CODEC_ID_PCM_U16LE:
> ++    case CODEC_ID_PCM_U16BE:
> ++    case CODEC_ID_PCM_S8:
> ++    case CODEC_ID_PCM_U8:
> ++    {
> ++      gint width =3D 0, depth =3D 0, endianness =3D 0;
> ++      gboolean signedness =3D FALSE;      /* blabla */
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_PCM_S16LE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_LITTLE_ENDIAN;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_S16BE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_BIG_ENDIAN;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_U16LE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_LITTLE_ENDIAN;
> ++          signedness =3D FALSE;
> ++          break;
> ++        case CODEC_ID_PCM_U16BE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_BIG_ENDIAN;
> ++          signedness =3D FALSE;
> ++          break;
> ++        case CODEC_ID_PCM_S8:
> ++          width =3D 8;
> ++          depth =3D 8;
> ++          endianness =3D G_BYTE_ORDER;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_U8:
> ++          width =3D 8;
> ++          depth =3D 8;
> ++          endianness =3D G_BYTE_ORDER;
> ++          signedness =3D FALSE;
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-raw-int=
",
> ++          "width", G_TYPE_INT, width,
> ++          "depth", G_TYPE_INT, depth,
> ++          "endianness", G_TYPE_INT, endianness,
> ++          "signed", G_TYPE_BOOLEAN, signedness, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_PCM_MULAW:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-mulaw",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PCM_ALAW:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-alaw", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ADPCM_G722:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/G722", NU=
LL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ADPCM_G726:
> ++    {
> ++      /* the G726 decoder can also handle G721 */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-adpcm",
> ++          "layout", G_TYPE_STRING, "g726", NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++
> ++      if (!encode) {
> ++        gst_caps_append (caps, gst_caps_new_simple ("audio/x-adpcm",
> ++                "layout", G_TYPE_STRING, "g721",
> ++                "channels", G_TYPE_INT, 1, "rate", G_TYPE_INT, 8000, NU=
LL));
> ++      }
> ++      break;
> ++    }
> ++    case CODEC_ID_ADPCM_IMA_QT:
> ++    case CODEC_ID_ADPCM_IMA_WAV:
> ++    case CODEC_ID_ADPCM_IMA_DK3:
> ++    case CODEC_ID_ADPCM_IMA_DK4:
> ++    case CODEC_ID_ADPCM_IMA_WS:
> ++    case CODEC_ID_ADPCM_IMA_SMJPEG:
> ++    case CODEC_ID_ADPCM_IMA_AMV:
> ++    case CODEC_ID_ADPCM_IMA_ISS:
> ++    case CODEC_ID_ADPCM_IMA_EA_EACS:
> ++    case CODEC_ID_ADPCM_IMA_EA_SEAD:
> ++    case CODEC_ID_ADPCM_MS:
> ++    case CODEC_ID_ADPCM_4XM:
> ++    case CODEC_ID_ADPCM_XA:
> ++    case CODEC_ID_ADPCM_ADX:
> ++    case CODEC_ID_ADPCM_EA:
> ++    case CODEC_ID_ADPCM_CT:
> ++    case CODEC_ID_ADPCM_SWF:
> ++    case CODEC_ID_ADPCM_YAMAHA:
> ++    case CODEC_ID_ADPCM_SBPRO_2:
> ++    case CODEC_ID_ADPCM_SBPRO_3:
> ++    case CODEC_ID_ADPCM_SBPRO_4:
> ++    case CODEC_ID_ADPCM_EA_R1:
> ++    case CODEC_ID_ADPCM_EA_R2:
> ++    case CODEC_ID_ADPCM_EA_R3:
> ++    case CODEC_ID_ADPCM_EA_MAXIS_XA:
> ++    case CODEC_ID_ADPCM_EA_XAS:
> ++    case CODEC_ID_ADPCM_THP:
> ++    {
> ++      const gchar *layout =3D NULL;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_ADPCM_IMA_QT:
> ++          layout =3D "quicktime";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_WAV:
> ++          layout =3D "dvi";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_DK3:
> ++          layout =3D "dk3";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_DK4:
> ++          layout =3D "dk4";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_WS:
> ++          layout =3D "westwood";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_SMJPEG:
> ++          layout =3D "smjpeg";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_AMV:
> ++          layout =3D "amv";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_ISS:
> ++          layout =3D "iss";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_EA_EACS:
> ++          layout =3D "ea-eacs";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_EA_SEAD:
> ++          layout =3D "ea-sead";
> ++          break;
> ++        case CODEC_ID_ADPCM_MS:
> ++          layout =3D "microsoft";
> ++          break;
> ++        case CODEC_ID_ADPCM_4XM:
> ++          layout =3D "4xm";
> ++          break;
> ++        case CODEC_ID_ADPCM_XA:
> ++          layout =3D "xa";
> ++          break;
> ++        case CODEC_ID_ADPCM_ADX:
> ++          layout =3D "adx";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA:
> ++          layout =3D "ea";
> ++          break;
> ++        case CODEC_ID_ADPCM_CT:
> ++          layout =3D "ct";
> ++          break;
> ++        case CODEC_ID_ADPCM_SWF:
> ++          layout =3D "swf";
> ++          break;
> ++        case CODEC_ID_ADPCM_YAMAHA:
> ++          layout =3D "yamaha";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_2:
> ++          layout =3D "sbpro2";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_3:
> ++          layout =3D "sbpro3";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_4:
> ++          layout =3D "sbpro4";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R1:
> ++          layout =3D "ea-r1";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R2:
> ++          layout =3D "ea-r3";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R3:
> ++          layout =3D "ea-r3";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_MAXIS_XA:
> ++          layout =3D "ea-maxis-xa";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_XAS:
> ++          layout =3D "ea-xas";
> ++          break;
> ++        case CODEC_ID_ADPCM_THP:
> ++          layout =3D "thp";
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      /* FIXME: someone please check whether we need additional propert=
ies
> ++       * in this caps definition. */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-adpcm",
> ++          "layout", G_TYPE_STRING, layout, NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_AMR_NB:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/AMR", NUL=
L);
> ++      break;
> ++
> ++    case CODEC_ID_AMR_WB:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/AMR-WB", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_GSM:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-gsm", N=
ULL);
> ++      break;
> ++
> ++    case CODEC_ID_GSM_MS:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/ms-gsm", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_NELLYMOSER:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, "audio/x-nellymoser",=
 NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SIPR:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-sipro",=
 NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "leaf_size", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_RA_144:
> ++    case CODEC_ID_RA_288:
> ++    case CODEC_ID_COOK:
> ++    {
> ++      gint version =3D 0;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_RA_144:
> ++          version =3D 1;
> ++          break;
> ++        case CODEC_ID_RA_288:
> ++          version =3D 2;
> ++          break;
> ++        case CODEC_ID_COOK:
> ++          version =3D 8;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++
> ++      /* FIXME: properties? */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-pn-real=
audio",
> ++          "raversion", G_TYPE_INT, version, NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "leaf_size", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_ROQ_DPCM:
> ++    case CODEC_ID_INTERPLAY_DPCM:
> ++    case CODEC_ID_XAN_DPCM:
> ++    case CODEC_ID_SOL_DPCM:
> ++    {
> ++      const gchar *layout =3D NULL;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_ROQ_DPCM:
> ++          layout =3D "roq";
> ++          break;
> ++        case CODEC_ID_INTERPLAY_DPCM:
> ++          layout =3D "interplay";
> ++          break;
> ++        case CODEC_ID_XAN_DPCM:
> ++          layout =3D "xan";
> ++          break;
> ++        case CODEC_ID_SOL_DPCM:
> ++          layout =3D "sol";
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      /* FIXME: someone please check whether we need additional propert=
ies
> ++       * in this caps definition. */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-dpcm",
> ++          "layout", G_TYPE_STRING, layout, NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_SHORTEN:
> ++      caps =3D gst_caps_new_simple ("audio/x-shorten", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ALAC:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-alac", =
NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "samplesize", G_TYPE_INT, context->bits_per_coded_sample, N=
ULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_FLAC:
> ++      /* Note that ffmpeg has no encoder yet, but just for safety. In t=
he
> ++       * encoder case, we want to add things like samplerate, channels.=
=2E. */
> ++      if (!encode) {
> ++        caps =3D gst_caps_new_simple ("audio/x-flac", NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_DVD_SUBTITLE:
> ++    case CODEC_ID_DVB_SUBTITLE:
> ++      caps =3D NULL;
> ++      break;
> ++    case CODEC_ID_BMP:
> ++      caps =3D gst_caps_new_simple ("image/bmp", NULL);
> ++      break;
> ++    case CODEC_ID_TTA:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-tta", N=
ULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "samplesize", G_TYPE_INT, context->bits_per_coded_sample, N=
ULL);
> ++      }
> ++      break;
> ++    case CODEC_ID_TWINVQ:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-twin-vq=
", NULL);
> ++      break;
> ++    default:
> ++      GST_DEBUG ("Unknown codec ID %d, please add mapping here", codec_=
id);
> ++      break;
> ++  }
> ++
> ++  if (buildcaps) {
> ++    AVCodec *codec;
> ++
> ++    if ((codec =3D avcodec_find_decoder (codec_id)) ||
> ++        (codec =3D avcodec_find_encoder (codec_id))) {
> ++      gchar *mime =3D NULL;
> ++
> ++      GST_LOG ("Could not create stream format caps for %s", codec->nam=
e);
> ++
> ++      switch (codec->type) {
> ++        case AVMEDIA_TYPE_VIDEO:
> ++          mime =3D g_strdup_printf ("video/x-gst_ff-%s", codec->name);
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, mime, NULL);
> ++          g_free (mime);
> ++          break;
> ++        case AVMEDIA_TYPE_AUDIO:
> ++          mime =3D g_strdup_printf ("audio/x-gst_ff-%s", codec->name);
> ++          caps =3D gst_ff_aud_caps_new (context, codec_id, mime, NULL);
> ++          if (context)
> ++            gst_caps_set_simple (caps,
> ++                "block_align", G_TYPE_INT, context->block_align,
> ++                "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++          g_free (mime);
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++
> ++    /* set private data */
> ++    if (context && context->extradata_size > 0) {
> ++      GstBuffer *data =3D gst_buffer_new_and_alloc (context->extradata_=
size);
> ++
> ++      memcpy (GST_BUFFER_DATA (data), context->extradata,
> ++          context->extradata_size);
> ++      gst_caps_set_simple (caps, "codec_data", GST_TYPE_BUFFER, data, N=
ULL);
> ++      gst_buffer_unref (data);
> ++    }
> ++
> ++    /* palette */
> ++    if (context) {
> ++      gst_ffmpeg_set_palette (caps, context);
> ++    }
> ++
> ++    GST_LOG ("caps for codec_id=3D%d: %" GST_PTR_FORMAT, codec_id, caps=
);
> ++
> ++  } else {
> ++    GST_LOG ("No caps found for codec_id=3D%d", codec_id);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG Pixel Format and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * See below for usefullness
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_pixfmt_to_caps (enum PixelFormat pix_fmt, AVCodecContext * c=
ontext,
> ++    enum CodecID codec_id)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  int bpp =3D 0, depth =3D 0, endianness =3D 0;
> ++  gulong g_mask =3D 0, r_mask =3D 0, b_mask =3D 0, a_mask =3D 0;
> ++  guint32 fmt =3D 0;
> ++
> ++  switch (pix_fmt) {
> ++    case PIX_FMT_YUVJ420P:
> ++    case PIX_FMT_YUV420P:
> ++      fmt =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++      break;
> ++    case PIX_FMT_YUVA420P:
> ++      fmt =3D GST_MAKE_FOURCC ('A', '4', '2', '0');
> ++      break;
> ++    case PIX_FMT_YUYV422:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', 'U', 'Y', '2');
> ++      break;
> ++    case PIX_FMT_RGB24:
> ++      bpp =3D depth =3D 24;
> ++      endianness =3D G_BIG_ENDIAN;
> ++      r_mask =3D 0xff0000;
> ++      g_mask =3D 0x00ff00;
> ++      b_mask =3D 0x0000ff;
> ++      break;
> ++    case PIX_FMT_BGR24:
> ++      bpp =3D depth =3D 24;
> ++      endianness =3D G_BIG_ENDIAN;
> ++      r_mask =3D 0x0000ff;
> ++      g_mask =3D 0x00ff00;
> ++      b_mask =3D 0xff0000;
> ++      break;
> ++    case PIX_FMT_YUVJ422P:
> ++    case PIX_FMT_YUV422P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '2', 'B');
> ++      break;
> ++    case PIX_FMT_YUVJ444P:
> ++    case PIX_FMT_YUV444P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '4', '4');
> ++      break;
> ++    case PIX_FMT_RGB32:
> ++      bpp =3D 32;
> ++      depth =3D 32;
> ++      endianness =3D G_BIG_ENDIAN;
> ++#if (G_BYTE_ORDER =3D=3D G_BIG_ENDIAN)
> ++      r_mask =3D 0x00ff0000;
> ++      g_mask =3D 0x0000ff00;
> ++      b_mask =3D 0x000000ff;
> ++      a_mask =3D 0xff000000;
> ++#else
> ++      r_mask =3D 0x0000ff00;
> ++      g_mask =3D 0x00ff0000;
> ++      b_mask =3D 0xff000000;
> ++      a_mask =3D 0x000000ff;
> ++#endif
> ++      break;
> ++    case PIX_FMT_YUV410P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', 'U', 'V', '9');
> ++      break;
> ++    case PIX_FMT_YUV411P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '1', 'B');
> ++      break;
> ++    case PIX_FMT_RGB565:
> ++      bpp =3D depth =3D 16;
> ++      endianness =3D G_BYTE_ORDER;
> ++      r_mask =3D 0xf800;
> ++      g_mask =3D 0x07e0;
> ++      b_mask =3D 0x001f;
> ++      break;
> ++    case PIX_FMT_RGB555:
> ++      bpp =3D 16;
> ++      depth =3D 15;
> ++      endianness =3D G_BYTE_ORDER;
> ++      r_mask =3D 0x7c00;
> ++      g_mask =3D 0x03e0;
> ++      b_mask =3D 0x001f;
> ++      break;
> ++    case PIX_FMT_PAL8:
> ++      bpp =3D depth =3D 8;
> ++      endianness =3D G_BYTE_ORDER;
> ++      break;
> ++    case PIX_FMT_GRAY8:
> ++      bpp =3D depth =3D 8;
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw-gra=
y",
> ++          "bpp", G_TYPE_INT, bpp, "depth", G_TYPE_INT, depth, NULL);
> ++      break;
> ++    default:
> ++      /* give up ... */
> ++      break;
> ++  }
> ++
> ++  if (caps =3D=3D NULL) {
> ++    if (bpp !=3D 0) {
> ++      if (r_mask !=3D 0) {
> ++        if (a_mask) {
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw=
-rgb",
> ++              "bpp", G_TYPE_INT, bpp,
> ++              "depth", G_TYPE_INT, depth,
> ++              "red_mask", G_TYPE_INT, r_mask,
> ++              "green_mask", G_TYPE_INT, g_mask,
> ++              "blue_mask", G_TYPE_INT, b_mask,
> ++              "alpha_mask", G_TYPE_INT, a_mask,
> ++              "endianness", G_TYPE_INT, endianness, NULL);
> ++        } else {
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw=
-rgb",
> ++              "bpp", G_TYPE_INT, bpp,
> ++              "depth", G_TYPE_INT, depth,
> ++              "red_mask", G_TYPE_INT, r_mask,
> ++              "green_mask", G_TYPE_INT, g_mask,
> ++              "blue_mask", G_TYPE_INT, b_mask,
> ++              "endianness", G_TYPE_INT, endianness, NULL);
> ++        }
> ++      } else {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw-r=
gb",
> ++            "bpp", G_TYPE_INT, bpp,
> ++            "depth", G_TYPE_INT, depth,
> ++            "endianness", G_TYPE_INT, endianness, NULL);
> ++        if (caps && context) {
> ++          gst_ffmpeg_set_palette (caps, context);
> ++        }
> ++      }
> ++    } else if (fmt) {
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/x-raw-yuv=
",
> ++          "format", GST_TYPE_FOURCC, fmt, NULL);
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++    GST_DEBUG ("caps for pix_fmt=3D%d: %" GST_PTR_FORMAT, pix_fmt, caps=
);
> ++  } else {
> ++    GST_LOG ("No caps found for pix_fmt=3D%d", pix_fmt);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG Sample Format and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * See below for usefullness
> ++ */
> ++
> ++static GstCaps *
> ++gst_ffmpeg_smpfmt_to_caps (enum AVSampleFormat sample_fmt,
> ++    AVCodecContext * context, enum CodecID codec_id)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  int bpp =3D 0;
> ++  gboolean integer =3D TRUE;
> ++  gboolean signedness =3D FALSE;
> ++
> ++  switch (sample_fmt) {
> ++    case AV_SAMPLE_FMT_S16:
> ++      signedness =3D TRUE;
> ++      bpp =3D 16;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_S32:
> ++      signedness =3D TRUE;
> ++      bpp =3D 32;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_FLT:
> ++      integer =3D FALSE;
> ++      bpp =3D 32;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_DBL:
> ++      integer =3D FALSE;
> ++      bpp =3D 64;
> ++      break;
> ++    default:
> ++      /* .. */
> ++      break;
> ++  }
> ++
> ++  if (bpp) {
> ++    if (integer) {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-raw-int=
",
> ++          "signed", G_TYPE_BOOLEAN, signedness,
> ++          "endianness", G_TYPE_INT, G_BYTE_ORDER,
> ++          "width", G_TYPE_INT, bpp, "depth", G_TYPE_INT, bpp, NULL);
> ++    } else {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-raw-flo=
at",
> ++          "endianness", G_TYPE_INT, G_BYTE_ORDER,
> ++          "width", G_TYPE_INT, bpp, NULL);
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++    GST_LOG ("caps for sample_fmt=3D%d: %" GST_PTR_FORMAT, sample_fmt, =
caps);
> ++  } else {
> ++    GST_LOG ("No caps found for sample_fmt=3D%d", sample_fmt);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_audio_caps (AVCodecContext * context,
> ++    enum CodecID codec_id, gboolean encode, AVCodec * codec)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  GST_DEBUG ("context:%p, codec_id:%d, encode:%d, codec:%p",
> ++      context, codec_id, encode, codec);
> ++  if (codec)
> ++    GST_DEBUG ("sample_fmts:%p, samplerates:%p",
> ++        codec->sample_fmts, codec->supported_samplerates);
> ++
> ++  if (context) {
> ++    /* Specific codec context */
> ++    caps =3D gst_ffmpeg_smpfmt_to_caps (context->sample_fmt, context, c=
odec_id);
> ++  } else if (codec && codec->sample_fmts) {
> ++    GstCaps *temp;
> ++    int i;
> ++
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; codec->sample_fmts[i] !=3D -1; i++) {
> ++      temp =3D
> ++          gst_ffmpeg_smpfmt_to_caps (codec->sample_fmts[i], context, co=
dec_id);
> ++      if (temp !=3D NULL)
> ++        gst_caps_append (caps, temp);
> ++    }
> ++  } else {
> ++    GstCaps *temp;
> ++    enum AVSampleFormat i;
> ++    AVCodecContext ctx =3D { 0, };
> ++
> ++    ctx.channels =3D -1;
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; i <=3D AV_SAMPLE_FMT_DBL; i++) {
> ++      temp =3D gst_ffmpeg_smpfmt_to_caps (i, encode ? &ctx : NULL, code=
c_id);
> ++      if (temp !=3D NULL) {
> ++        gst_caps_append (caps, temp);
> ++      }
> ++    }
> ++  }
> ++  return caps;
> ++}
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_video_caps (AVCodecContext * context,
> ++    enum CodecID codec_id, gboolean encode, AVCodec * codec)
> ++{
> ++  GstCaps *caps;
> ++
> ++  GST_LOG ("context:%p, codec_id:%d, encode:%d, codec:%p",
> ++      context, codec_id, encode, codec);
> ++
> ++  if (context) {
> ++    caps =3D gst_ffmpeg_pixfmt_to_caps (context->pix_fmt, context, code=
c_id);
> ++  } else {
> ++    GstCaps *temp;
> ++    enum PixelFormat i;
> ++    AVCodecContext ctx =3D { 0, };
> ++
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; i < PIX_FMT_NB; i++) {
> ++      ctx.width =3D -1;
> ++      ctx.pix_fmt =3D i;
> ++      temp =3D gst_ffmpeg_pixfmt_to_caps (i, encode ? &ctx : NULL, code=
c_id);
> ++      if (temp !=3D NULL) {
> ++        gst_caps_append (caps, temp);
> ++      }
> ++    }
> ++  }
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG codec Type and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * AVMediaType is primarily meant for uncompressed data GstCaps!
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_caps (enum AVMediaType codec_type,
> ++    AVCodecContext * context, enum CodecID codec_id, gboolean encode)
> ++{
> ++  GstCaps *caps;
> ++
> ++  switch (codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_video_caps (context, codec_id, encode=
, NULL);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_audio_caps (context, codec_id, encode=
, NULL);
> ++      break;
> ++    default:
> ++      caps =3D NULL;
> ++      break;
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a GstCaps (audio/raw) to a FFMPEG SampleFmt
> ++ * and other audio properties in a AVCodecContext.
> ++ *
> ++ * For usefullness, see below
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_caps_to_smpfmt (const GstCaps * caps,
> ++    AVCodecContext * context, gboolean raw)
> ++{
> ++  GstStructure *structure;
> ++  gint depth =3D 0, width =3D 0, endianness =3D 0;
> ++  gboolean signedness =3D FALSE;
> ++  const gchar *name;
> ++
> ++  g_return_if_fail (gst_caps_get_size (caps) =3D=3D 1);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  gst_structure_get_int (structure, "channels", &context->channels);
> ++  gst_structure_get_int (structure, "rate", &context->sample_rate);
> ++  gst_structure_get_int (structure, "block_align", &context->block_alig=
n);
> ++  gst_structure_get_int (structure, "bitrate", &context->bit_rate);
> ++
> ++  if (!raw)
> ++    return;
> ++
> ++  name =3D gst_structure_get_name (structure);
> ++
> ++  if (!strcmp (name, "audio/x-raw-float")) {
> ++    /* FLOAT */
> ++    if (gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "endianness", &endianness)) {
> ++      if (endianness =3D=3D G_BYTE_ORDER) {
> ++        if (width =3D=3D 32)
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_FLT;
> ++        else if (width =3D=3D 64)
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_DBL;
> ++      }
> ++    }
> ++  } else {
> ++    /* INT */
> ++    if (gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "depth", &depth) &&
> ++        gst_structure_get_boolean (structure, "signed", &signedness) &&
> ++        gst_structure_get_int (structure, "endianness", &endianness)) {
> ++      if ((endianness =3D=3D G_BYTE_ORDER) && (signedness =3D=3D TRUE))=
 {
> ++        if ((width =3D=3D 16) && (depth =3D=3D 16))
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S16;
> ++        else if ((width =3D=3D 32) && (depth =3D=3D 32))
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S32;
> ++      }
> ++    }
> ++  }
> ++}
> ++
> ++
> ++/* Convert a GstCaps (video/raw) to a FFMPEG PixFmt
> ++ * and other video properties in a AVCodecContext.
> ++ *
> ++ * For usefullness, see below
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_caps_to_pixfmt (const GstCaps * caps,
> ++    AVCodecContext * context, gboolean raw)
> ++{
> ++  GstStructure *structure;
> ++  const GValue *fps;
> ++  const GValue *par =3D NULL;
> ++
> ++  GST_DEBUG ("converting caps %" GST_PTR_FORMAT, caps);
> ++  g_return_if_fail (gst_caps_get_size (caps) =3D=3D 1);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  gst_structure_get_int (structure, "width", &context->width);
> ++  gst_structure_get_int (structure, "height", &context->height);
> ++  gst_structure_get_int (structure, "bpp", &context->bits_per_coded_sam=
ple);
> ++
> ++  fps =3D gst_structure_get_value (structure, "framerate");
> ++  if (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION (fps)) {
> ++
> ++    /* somehow these seem mixed up.. */
> ++    context->time_base.den =3D gst_value_get_fraction_numerator (fps);
> ++    context->time_base.num =3D gst_value_get_fraction_denominator (fps);
> ++    context->ticks_per_frame =3D 1;
> ++
> ++    GST_DEBUG ("setting framerate %d/%d =3D %lf",
> ++        context->time_base.den, context->time_base.num,
> ++        1. * context->time_base.den / context->time_base.num);
> ++  }
> ++
> ++  par =3D gst_structure_get_value (structure, "pixel-aspect-ratio");
> ++  if (par && GST_VALUE_HOLDS_FRACTION (par)) {
> ++
> ++    context->sample_aspect_ratio.num =3D gst_value_get_fraction_numerat=
or (par);
> ++    context->sample_aspect_ratio.den =3D gst_value_get_fraction_denomin=
ator (par);
> ++
> ++    GST_DEBUG ("setting pixel-aspect-ratio %d/%d =3D %lf",
> ++        context->sample_aspect_ratio.den, context->sample_aspect_ratio.=
num,
> ++        1. * context->sample_aspect_ratio.den /
> ++        context->sample_aspect_ratio.num);
> ++  }
> ++
> ++  if (!raw)
> ++    return;
> ++
> ++  g_return_if_fail (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION (fps));
> ++
> ++  if (strcmp (gst_structure_get_name (structure), "video/x-raw-yuv") =
=3D=3D 0) {
> ++    guint32 fourcc;
> ++
> ++    if (gst_structure_get_fourcc (structure, "format", &fourcc)) {
> ++      switch (fourcc) {
> ++        case GST_MAKE_FOURCC ('Y', 'U', 'Y', '2'):
> ++          context->pix_fmt =3D PIX_FMT_YUYV422;
> ++          break;
> ++        case GST_MAKE_FOURCC ('I', '4', '2', '0'):
> ++          context->pix_fmt =3D PIX_FMT_YUV420P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('A', '4', '2', '0'):
> ++          context->pix_fmt =3D PIX_FMT_YUVA420P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', '4', '1', 'B'):
> ++          context->pix_fmt =3D PIX_FMT_YUV411P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', '4', '2', 'B'):
> ++          context->pix_fmt =3D PIX_FMT_YUV422P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', 'U', 'V', '9'):
> ++          context->pix_fmt =3D PIX_FMT_YUV410P;
> ++          break;
> ++#if 0
> ++        case FIXME:
> ++          context->pix_fmt =3D PIX_FMT_YUV444P;
> ++          break;
> ++#endif
> ++      }
> ++    }
> ++  } else if (strcmp (gst_structure_get_name (structure),
> ++          "video/x-raw-rgb") =3D=3D 0) {
> ++    gint bpp =3D 0, rmask =3D 0, endianness =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "bpp", &bpp) &&
> ++        gst_structure_get_int (structure, "endianness", &endianness)) {
> ++      if (gst_structure_get_int (structure, "red_mask", &rmask)) {
> ++        switch (bpp) {
> ++          case 32:
> ++#if (G_BYTE_ORDER =3D=3D G_BIG_ENDIAN)
> ++            if (rmask =3D=3D 0x00ff0000)
> ++#else
> ++            if (rmask =3D=3D 0x0000ff00)
> ++#endif
> ++              context->pix_fmt =3D PIX_FMT_RGB32;
> ++            break;
> ++          case 24:
> ++            if (rmask =3D=3D 0x0000FF)
> ++              context->pix_fmt =3D PIX_FMT_BGR24;
> ++            else
> ++              context->pix_fmt =3D PIX_FMT_RGB24;
> ++            break;
> ++          case 16:
> ++            if (endianness =3D=3D G_BYTE_ORDER)
> ++              context->pix_fmt =3D PIX_FMT_RGB565;
> ++            break;
> ++          case 15:
> ++            if (endianness =3D=3D G_BYTE_ORDER)
> ++              context->pix_fmt =3D PIX_FMT_RGB555;
> ++            break;
> ++          default:
> ++            /* nothing */
> ++            break;
> ++        }
> ++      } else {
> ++        if (bpp =3D=3D 8) {
> ++          context->pix_fmt =3D PIX_FMT_PAL8;
> ++          gst_ffmpeg_get_palette (caps, context);
> ++        }
> ++      }
> ++    }
> ++  } else if (strcmp (gst_structure_get_name (structure),
> ++          "video/x-raw-gray") =3D=3D 0) {
> ++    gint bpp =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "bpp", &bpp)) {
> ++      switch (bpp) {
> ++        case 8:
> ++          context->pix_fmt =3D PIX_FMT_GRAY8;
> ++          break;
> ++      }
> ++    }
> ++  }
> ++}
> ++
> ++/* Convert a GstCaps and a FFMPEG codec Type to a
> ++ * AVCodecContext. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the context
> ++ *
> ++ * AVMediaType is primarily meant for uncompressed data GstCaps!
> ++ */
> ++
> ++void
> ++gst_ffmpeg_caps_with_codectype (enum AVMediaType type,
> ++    const GstCaps * caps, AVCodecContext * context)
> ++{
> ++  if (context =3D=3D NULL)
> ++    return;
> ++
> ++  switch (type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      gst_ffmpeg_caps_to_pixfmt (caps, context, TRUE);
> ++      break;
> ++
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      gst_ffmpeg_caps_to_smpfmt (caps, context, TRUE);
> ++      break;
> ++
> ++    default:
> ++      /* unknown */
> ++      break;
> ++  }
> ++}
> ++
> ++#if 0
> ++static void
> ++nal_escape (guint8 * dst, guint8 * src, guint size, guint * destsize)
> ++{
> ++  guint8 *dstp =3D dst;
> ++  guint8 *srcp =3D src;
> ++  guint8 *end =3D src + size;
> ++  gint count =3D 0;
> ++
> ++  while (srcp < end) {
> ++    if (count =3D=3D 2 && *srcp <=3D 0x03) {
> ++      GST_DEBUG ("added escape code");
> ++      *dstp++ =3D 0x03;
> ++      count =3D 0;
> ++    }
> ++    if (*srcp =3D=3D 0)
> ++      count++;
> ++    else
> ++      count =3D 0;
> ++
> ++    GST_DEBUG ("copy %02x, count %d", *srcp, count);
> ++    *dstp++ =3D *srcp++;
> ++  }
> ++  *destsize =3D dstp - dst;
> ++}
> ++
> ++/* copy the config, escaping NAL units as we iterate them, if something=
 fails we
> ++ * copy everything and hope for the best. */
> ++static void
> ++copy_config (guint8 * dst, guint8 * src, guint size, guint * destsize)
> ++{
> ++  guint8 *dstp =3D dst;
> ++  guint8 *srcp =3D src;
> ++  gint cnt, i;
> ++  guint nalsize, esize;
> ++
> ++  /* check size */
> ++  if (size < 7)
> ++    goto full_copy;
> ++
> ++  /* check version */
> ++  if (*srcp !=3D 1)
> ++    goto full_copy;
> ++
> ++  cnt =3D *(srcp + 5) & 0x1f;     /* Number of sps */
> ++
> ++  GST_DEBUG ("num SPS %d", cnt);
> ++
> ++  memcpy (dstp, srcp, 6);
> ++  srcp +=3D 6;
> ++  dstp +=3D 6;
> ++
> ++  for (i =3D 0; i < cnt; i++) {
> ++    GST_DEBUG ("copy SPS %d", i);
> ++    nalsize =3D (srcp[0] << 8) | srcp[1];
> ++    nal_escape (dstp + 2, srcp + 2, nalsize, &esize);
> ++    dstp[0] =3D esize >> 8;
> ++    dstp[1] =3D esize & 0xff;
> ++    dstp +=3D esize + 2;
> ++    srcp +=3D nalsize + 2;
> ++  }
> ++
> ++  cnt =3D *(dstp++) =3D *(srcp++);  /* Number of pps */
> ++
> ++  GST_DEBUG ("num PPS %d", cnt);
> ++
> ++  for (i =3D 0; i < cnt; i++) {
> ++    GST_DEBUG ("copy PPS %d", i);
> ++    nalsize =3D (srcp[0] << 8) | srcp[1];
> ++    nal_escape (dstp + 2, srcp + 2, nalsize, &esize);
> ++    dstp[0] =3D esize >> 8;
> ++    dstp[1] =3D esize & 0xff;
> ++    dstp +=3D esize + 2;
> ++    srcp +=3D nalsize + 2;
> ++  }
> ++  *destsize =3D dstp - dst;
> ++
> ++  return;
> ++
> ++full_copy:
> ++  {
> ++    GST_DEBUG ("something unexpected, doing full copy");
> ++    memcpy (dst, src, size);
> ++    *destsize =3D size;
> ++    return;
> ++  }
> ++}
> ++#endif
> ++
> ++/*
> ++ * caps_with_codecid () transforms a GstCaps for a known codec
> ++ * ID into a filled-in context.
> ++ * codec_data from caps will override possible extradata already in the=
 context
> ++ */
> ++
> ++void
> ++gst_ffmpeg_caps_with_codecid (enum CodecID codec_id,
> ++    enum AVMediaType codec_type, const GstCaps * caps, AVCodecContext *=
 context)
> ++{
> ++  GstStructure *str;
> ++  const GValue *value;
> ++  const GstBuffer *buf;
> ++
> ++  GST_LOG ("codec_id:%d, codec_type:%d, caps:%" GST_PTR_FORMAT " contex=
t:%p",
> ++      codec_id, codec_type, caps, context);
> ++
> ++  if (!context || !gst_caps_get_size (caps))
> ++    return;
> ++
> ++  str =3D gst_caps_get_structure (caps, 0);
> ++
> ++  /* extradata parsing (esds [mpeg4], wma/wmv, msmpeg4v1/2/3, etc.) */
> ++  if ((value =3D gst_structure_get_value (str, "codec_data"))) {
> ++    guint size;
> ++    guint8 *data;
> ++
> ++    buf =3D GST_BUFFER_CAST (gst_value_get_mini_object (value));
> ++    size =3D GST_BUFFER_SIZE (buf);
> ++    data =3D GST_BUFFER_DATA (buf);
> ++
> ++    /* free the old one if it is there */
> ++    if (context->extradata)
> ++      av_free (context->extradata);
> ++
> ++#if 0
> ++    if (codec_id =3D=3D CODEC_ID_H264) {
> ++      guint extrasize;
> ++
> ++      GST_DEBUG ("copy, escaping codec_data %d", size);
> ++      /* ffmpeg h264 expects the codec_data to be escaped, there is no =
real
> ++       * reason for this but let's just escape it for now. Start by all=
ocating
> ++       * enough space, x2 is more than enough.
> ++       *
> ++       * FIXME, we disabled escaping because some file already contain =
escaped
> ++       * codec_data and then we escape twice and fail. It's better to l=
eave it
> ++       * as is, as that is what most players do. */
> ++      context->extradata =3D
> ++          av_mallocz (GST_ROUND_UP_16 (size * 2 +
> ++              FF_INPUT_BUFFER_PADDING_SIZE));
> ++      copy_config (context->extradata, data, size, &extrasize);
> ++      GST_DEBUG ("escaped size: %d", extrasize);
> ++      context->extradata_size =3D extrasize;
> ++    } else
> ++#endif
> ++    {
> ++      /* allocate with enough padding */
> ++      GST_DEBUG ("copy codec_data");
> ++      context->extradata =3D
> ++          av_mallocz (GST_ROUND_UP_16 (size + FF_INPUT_BUFFER_PADDING_S=
IZE));
> ++      memcpy (context->extradata, data, size);
> ++      context->extradata_size =3D size;
> ++    }
> ++
> ++    /* Hack for VC1. Sometimes the first (length) byte is 0 for some fi=
les */
> ++    if (codec_id =3D=3D CODEC_ID_VC1 && size > 0 && data[0] =3D=3D 0) {
> ++      context->extradata[0] =3D (guint8) size;
> ++    }
> ++
> ++    GST_DEBUG ("have codec data of size %d", size);
> ++  } else if (context->extradata =3D=3D NULL && codec_id !=3D CODEC_ID_A=
AC_LATM &&
> ++      codec_id !=3D CODEC_ID_FLAC) {
> ++    /* no extradata, alloc dummy with 0 sized, some codecs insist on re=
ading
> ++     * extradata anyway which makes then segfault. */
> ++    context->extradata =3D
> ++        av_mallocz (GST_ROUND_UP_16 (FF_INPUT_BUFFER_PADDING_SIZE));
> ++    context->extradata_size =3D 0;
> ++    GST_DEBUG ("no codec data");
> ++  }
> ++
> ++  switch (codec_id) {
> ++    case CODEC_ID_MPEG4:
> ++    {
> ++      const gchar *mime =3D gst_structure_get_name (str);
> ++
> ++      if (!strcmp (mime, "video/x-divx"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('D', 'I', 'V', 'X');
> ++      else if (!strcmp (mime, "video/x-xvid"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('X', 'V', 'I', 'D');
> ++      else if (!strcmp (mime, "video/x-3ivx"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('3', 'I', 'V', '1');
> ++      else if (!strcmp (mime, "video/mpeg"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('m', 'p', '4', 'v');
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_SVQ3:
> ++      /* FIXME: this is a workaround for older gst-plugins releases
> ++       * (<=3D 0.8.9). This should be removed at some point, because
> ++       * it causes wrong decoded frame order. */
> ++      if (!context->extradata) {
> ++        gint halfpel_flag, thirdpel_flag, low_delay, unknown_svq3_flag;
> ++        guint16 flags;
> ++
> ++        if (gst_structure_get_int (str, "halfpel_flag", &halfpel_flag) =
||
> ++            gst_structure_get_int (str, "thirdpel_flag", &thirdpel_flag=
) ||
> ++            gst_structure_get_int (str, "low_delay", &low_delay) ||
> ++            gst_structure_get_int (str, "unknown_svq3_flag",
> ++                &unknown_svq3_flag)) {
> ++          context->extradata =3D (guint8 *) av_mallocz (0x64);
> ++          g_stpcpy ((gchar *) context->extradata, "SVQ3");
> ++          flags =3D 1 << 3;
> ++          flags |=3D low_delay;
> ++          flags =3D flags << 2;
> ++          flags |=3D unknown_svq3_flag;
> ++          flags =3D flags << 6;
> ++          flags |=3D halfpel_flag;
> ++          flags =3D flags << 1;
> ++          flags |=3D thirdpel_flag;
> ++          flags =3D flags << 3;
> ++
> ++          flags =3D GUINT16_FROM_LE (flags);
> ++
> ++          memcpy ((gchar *) context->extradata + 0x62, &flags, 2);
> ++          context->extradata_size =3D 0x64;
> ++        }
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MSRLE:
> ++    case CODEC_ID_QTRLE:
> ++    case CODEC_ID_TSCC:
> ++    case CODEC_ID_CSCD:
> ++    case CODEC_ID_APE:
> ++    {
> ++      gint depth;
> ++
> ++      if (gst_structure_get_int (str, "depth", &depth)) {
> ++        context->bits_per_coded_sample =3D depth;
> ++      } else {
> ++        GST_WARNING ("No depth field in caps %" GST_PTR_FORMAT, caps);
> ++      }
> ++
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV40:
> ++    {
> ++      gint format;
> ++
> ++      if (gst_structure_get_int (str, "format", &format))
> ++        context->sub_id =3D format;
> ++
> ++      break;
> ++    }
> ++    case CODEC_ID_COOK:
> ++    case CODEC_ID_RA_288:
> ++    case CODEC_ID_RA_144:
> ++    case CODEC_ID_SIPR:
> ++    {
> ++      gint leaf_size;
> ++      gint bitrate;
> ++
> ++      if (gst_structure_get_int (str, "leaf_size", &leaf_size))
> ++        context->block_align =3D leaf_size;
> ++      if (gst_structure_get_int (str, "bitrate", &bitrate))
> ++        context->bit_rate =3D bitrate;
> ++    }
> ++    case CODEC_ID_ALAC:
> ++      gst_structure_get_int (str, "samplesize",
> ++          &context->bits_per_coded_sample);
> ++      break;
> ++
> ++    case CODEC_ID_DVVIDEO:
> ++    {
> ++      guint32 fourcc;
> ++
> ++      if (gst_structure_get_fourcc (str, "format", &fourcc))
> ++        switch (fourcc) {
> ++          case GST_MAKE_FOURCC ('Y', 'U', 'Y', '2'):
> ++            context->pix_fmt =3D PIX_FMT_YUYV422;
> ++            break;
> ++          case GST_MAKE_FOURCC ('I', '4', '2', '0'):
> ++            context->pix_fmt =3D PIX_FMT_YUV420P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('A', '4', '2', '0'):
> ++            context->pix_fmt =3D PIX_FMT_YUVA420P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', '4', '1', 'B'):
> ++            context->pix_fmt =3D PIX_FMT_YUV411P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', '4', '2', 'B'):
> ++            context->pix_fmt =3D PIX_FMT_YUV422P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', 'U', 'V', '9'):
> ++            context->pix_fmt =3D PIX_FMT_YUV410P;
> ++            break;
> ++          default:
> ++            GST_WARNING ("couldn't convert fourcc %" GST_FOURCC_FORMAT
> ++                " to a pixel format", GST_FOURCC_ARGS (fourcc));
> ++            break;
> ++        }
> ++      break;
> ++    }
> ++    case CODEC_ID_H263P:
> ++    {
> ++      gboolean val;
> ++
> ++      if (!gst_structure_get_boolean (str, "annex-f", &val) || val)
> ++        context->flags |=3D CODEC_FLAG_4MV;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_4MV;
> ++      if ((!gst_structure_get_boolean (str, "annex-i", &val) || val) &&
> ++          (!gst_structure_get_boolean (str, "annex-t", &val) || val))
> ++        context->flags |=3D CODEC_FLAG_AC_PRED;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_AC_PRED;
> ++      if (!gst_structure_get_boolean (str, "annex-j", &val) || val)
> ++        context->flags |=3D CODEC_FLAG_LOOP_FILTER;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_LOOP_FILTER;
> ++      break;
> ++    }
> ++    case CODEC_ID_ADPCM_G726:
> ++    {
> ++      const gchar *layout;
> ++
> ++      if ((layout =3D gst_structure_get_string (str, "layout"))) {
> ++        if (!strcmp (layout, "g721")) {
> ++          context->sample_rate =3D 8000;
> ++          context->channels =3D 1;
> ++          context->bit_rate =3D 32000;
> ++        }
> ++      }
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  if (!gst_caps_is_fixed (caps))
> ++    return;
> ++
> ++  /* common properties (width, height, fps) */
> ++  switch (codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      gst_ffmpeg_caps_to_pixfmt (caps, context, codec_id =3D=3D CODEC_I=
D_RAWVIDEO);
> ++      gst_ffmpeg_get_palette (caps, context);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      gst_ffmpeg_caps_to_smpfmt (caps, context, FALSE);
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* fixup of default settings */
> ++  switch (codec_id) {
> ++    case CODEC_ID_QCELP:
> ++      /* QCELP is always mono, no matter what the caps say */
> ++      context->channels =3D 1;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++}
> ++
> ++/* _formatid_to_caps () is meant for muxers/demuxers, it
> ++ * transforms a name (ffmpeg way of ID'ing these, why don't
> ++ * they have unique numerical IDs?) to the corresponding
> ++ * caps belonging to that mux-format
> ++ *
> ++ * Note: we don't need any additional info because the caps
> ++ * isn't supposed to contain any useful info besides the
> ++ * media type anyway
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_formatid_to_caps (const gchar * format_name)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  if (!strcmp (format_name, "mpeg")) {
> ++    caps =3D gst_caps_new_simple ("video/mpeg",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "mpegts")) {
> ++    caps =3D gst_caps_new_simple ("video/mpegts",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "rm")) {
> ++    caps =3D gst_caps_new_simple ("application/x-pn-realmedia",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "asf")) {
> ++    caps =3D gst_caps_new_simple ("video/x-ms-asf", NULL);
> ++  } else if (!strcmp (format_name, "avi")) {
> ++    caps =3D gst_caps_new_simple ("video/x-msvideo", NULL);
> ++  } else if (!strcmp (format_name, "wav")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-wav", NULL);
> ++  } else if (!strcmp (format_name, "ape")) {
> ++    caps =3D gst_caps_new_simple ("application/x-ape", NULL);
> ++  } else if (!strcmp (format_name, "swf")) {
> ++    caps =3D gst_caps_new_simple ("application/x-shockwave-flash", NULL=
);
> ++  } else if (!strcmp (format_name, "au")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-au", NULL);
> ++  } else if (!strcmp (format_name, "dv")) {
> ++    caps =3D gst_caps_new_simple ("video/x-dv",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "4xm")) {
> ++    caps =3D gst_caps_new_simple ("video/x-4xm", NULL);
> ++  } else if (!strcmp (format_name, "matroska")) {
> ++    caps =3D gst_caps_new_simple ("video/x-matroska", NULL);
> ++  } else if (!strcmp (format_name, "mp3")) {
> ++    caps =3D gst_caps_new_simple ("application/x-id3", NULL);
> ++  } else if (!strcmp (format_name, "flic")) {
> ++    caps =3D gst_caps_new_simple ("video/x-fli", NULL);
> ++  } else if (!strcmp (format_name, "flv")) {
> ++    caps =3D gst_caps_new_simple ("video/x-flv", NULL);
> ++  } else if (!strcmp (format_name, "tta")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-ttafile", NULL);
> ++  } else if (!strcmp (format_name, "aiff")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-aiff", NULL);
> ++  } else if (!strcmp (format_name, "mov_mp4_m4a_3gp_3g2")) {
> ++    caps =3D
> ++        gst_caps_from_string
> ++        ("application/x-3gp; video/quicktime; audio/x-m4a");
> ++  } else if (!strcmp (format_name, "mov")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)a=
pple");
> ++  } else if (!strcmp (format_name, "mp4")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)i=
so");
> ++  } else if (!strcmp (format_name, "3gp")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)3=
gpp");
> ++  } else if (!strcmp (format_name, "3g2")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)3=
g2");
> ++  } else if (!strcmp (format_name, "psp")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)p=
sp");
> ++  } else if (!strcmp (format_name, "ipod")) {
> ++    caps =3D gst_caps_from_string ("video/quicktime,variant=3D(string)i=
pod");
> ++  } else if (!strcmp (format_name, "aac")) {
> ++    caps =3D gst_caps_new_simple ("audio/mpeg",
> ++        "mpegversion", G_TYPE_INT, 4, NULL);
> ++  } else if (!strcmp (format_name, "gif")) {
> ++    caps =3D gst_caps_from_string ("image/gif");
> ++  } else if (!strcmp (format_name, "ogg")) {
> ++    caps =3D gst_caps_from_string ("application/ogg");
> ++  } else if (!strcmp (format_name, "mxf") || !strcmp (format_name, "mxf=
_d10")) {
> ++    caps =3D gst_caps_from_string ("application/mxf");
> ++  } else if (!strcmp (format_name, "gxf")) {
> ++    caps =3D gst_caps_from_string ("application/gxf");
> ++  } else if (!strcmp (format_name, "yuv4mpegpipe")) {
> ++    caps =3D gst_caps_new_simple ("application/x-yuv4mpeg",
> ++        "y4mversion", G_TYPE_INT, 2, NULL);
> ++  } else if (!strcmp (format_name, "mpc")) {
> ++    caps =3D gst_caps_from_string ("audio/x-musepack, streamversion =3D=
 (int) 7");
> ++  } else if (!strcmp (format_name, "vqf")) {
> ++    caps =3D gst_caps_from_string ("audio/x-vqf");
> ++  } else if (!strcmp (format_name, "nsv")) {
> ++    caps =3D gst_caps_from_string ("video/x-nsv");
> ++  } else if (!strcmp (format_name, "amr")) {
> ++    caps =3D gst_caps_from_string ("audio/x-amr-nb-sh");
> ++  } else if (!strcmp (format_name, "webm")) {
> ++    caps =3D gst_caps_from_string ("video/webm");
> ++  } else {
> ++    gchar *name;
> ++
> ++    GST_LOG ("Could not create stream format caps for %s", format_name);
> ++    name =3D g_strdup_printf ("application/x-gst_ff-%s", format_name);
> ++    caps =3D gst_caps_new_simple (name, NULL);
> ++    g_free (name);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++gboolean
> ++gst_ffmpeg_formatid_get_codecids (const gchar * format_name,
> ++    enum CodecID ** video_codec_list, enum CodecID ** audio_codec_list,
> ++    AVOutputFormat * plugin)
> ++{
> ++  static enum CodecID tmp_vlist[] =3D {
> ++    CODEC_ID_NONE,
> ++    CODEC_ID_NONE
> ++  };
> ++  static enum CodecID tmp_alist[] =3D {
> ++    CODEC_ID_NONE,
> ++    CODEC_ID_NONE
> ++  };
> ++
> ++  GST_LOG ("format_name : %s", format_name);
> ++
> ++  if (!strcmp (format_name, "mp4")) {
> ++    static enum CodecID mp4_video_list[] =3D {
> ++      CODEC_ID_MPEG4, CODEC_ID_H264,
> ++      CODEC_ID_MJPEG,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mp4_audio_list[] =3D {
> ++      CODEC_ID_AAC, CODEC_ID_MP3,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mp4_video_list;
> ++    *audio_codec_list =3D mp4_audio_list;
> ++  } else if (!strcmp (format_name, "mpeg")) {
> ++    static enum CodecID mpeg_video_list[] =3D { CODEC_ID_MPEG1VIDEO,
> ++      CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpeg_audio_list[] =3D { CODEC_ID_MP1,
> ++      CODEC_ID_MP2,
> ++      CODEC_ID_MP3,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpeg_video_list;
> ++    *audio_codec_list =3D mpeg_audio_list;
> ++  } else if (!strcmp (format_name, "dvd")) {
> ++    static enum CodecID mpeg_video_list[] =3D { CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpeg_audio_list[] =3D { CODEC_ID_MP2,
> ++      CODEC_ID_AC3,
> ++      CODEC_ID_DTS,
> ++      CODEC_ID_PCM_S16BE,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpeg_video_list;
> ++    *audio_codec_list =3D mpeg_audio_list;
> ++  } else if (!strcmp (format_name, "mpegts")) {
> ++    static enum CodecID mpegts_video_list[] =3D { CODEC_ID_MPEG1VIDEO,
> ++      CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpegts_audio_list[] =3D { CODEC_ID_MP2,
> ++      CODEC_ID_MP3,
> ++      CODEC_ID_AC3,
> ++      CODEC_ID_DTS,
> ++      CODEC_ID_AAC,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpegts_video_list;
> ++    *audio_codec_list =3D mpegts_audio_list;
> ++  } else if (!strcmp (format_name, "vob")) {
> ++    static enum CodecID vob_video_list[] =3D
> ++        { CODEC_ID_MPEG2VIDEO, CODEC_ID_NONE };
> ++    static enum CodecID vob_audio_list[] =3D { CODEC_ID_MP2, CODEC_ID_A=
C3,
> ++      CODEC_ID_DTS, CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D vob_video_list;
> ++    *audio_codec_list =3D vob_audio_list;
> ++  } else if (!strcmp (format_name, "flv")) {
> ++    static enum CodecID flv_video_list[] =3D { CODEC_ID_FLV1, CODEC_ID_=
NONE };
> ++    static enum CodecID flv_audio_list[] =3D { CODEC_ID_MP3, CODEC_ID_N=
ONE };
> ++
> ++    *video_codec_list =3D flv_video_list;
> ++    *audio_codec_list =3D flv_audio_list;
> ++  } else if (!strcmp (format_name, "asf")) {
> ++    static enum CodecID asf_video_list[] =3D
> ++        { CODEC_ID_WMV1, CODEC_ID_WMV2, CODEC_ID_MSMPEG4V3, CODEC_ID_NO=
NE };
> ++    static enum CodecID asf_audio_list[] =3D
> ++        { CODEC_ID_WMAV1, CODEC_ID_WMAV2, CODEC_ID_MP3, CODEC_ID_NONE };
> ++
> ++    *video_codec_list =3D asf_video_list;
> ++    *audio_codec_list =3D asf_audio_list;
> ++  } else if (!strcmp (format_name, "dv")) {
> ++    static enum CodecID dv_video_list[] =3D { CODEC_ID_DVVIDEO, CODEC_I=
D_NONE };
> ++    static enum CodecID dv_audio_list[] =3D { CODEC_ID_PCM_S16LE, CODEC=
_ID_NONE };
> ++
> ++    *video_codec_list =3D dv_video_list;
> ++    *audio_codec_list =3D dv_audio_list;
> ++  } else if (!strcmp (format_name, "mov")) {
> ++    static enum CodecID mov_video_list[] =3D {
> ++      CODEC_ID_SVQ1, CODEC_ID_SVQ3, CODEC_ID_MPEG4,
> ++      CODEC_ID_H263, CODEC_ID_H263P,
> ++      CODEC_ID_H264, CODEC_ID_DVVIDEO,
> ++      CODEC_ID_MJPEG,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mov_audio_list[] =3D {
> ++      CODEC_ID_PCM_MULAW, CODEC_ID_PCM_ALAW, CODEC_ID_ADPCM_IMA_QT,
> ++      CODEC_ID_MACE3, CODEC_ID_MACE6, CODEC_ID_AAC,
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_PCM_S16BE, CODEC_ID_PCM_S16LE,
> ++      CODEC_ID_MP3, CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mov_video_list;
> ++    *audio_codec_list =3D mov_audio_list;
> ++  } else if ((!strcmp (format_name, "3gp") || !strcmp (format_name, "3g=
2"))) {
> ++    static enum CodecID tgp_video_list[] =3D {
> ++      CODEC_ID_MPEG4, CODEC_ID_H263, CODEC_ID_H263P, CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID tgp_audio_list[] =3D {
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_AAC,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D tgp_video_list;
> ++    *audio_codec_list =3D tgp_audio_list;
> ++  } else if (!strcmp (format_name, "mmf")) {
> ++    static enum CodecID mmf_audio_list[] =3D {
> ++      CODEC_ID_ADPCM_YAMAHA, CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D NULL;
> ++    *audio_codec_list =3D mmf_audio_list;
> ++  } else if (!strcmp (format_name, "amr")) {
> ++    static enum CodecID amr_audio_list[] =3D {
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D NULL;
> ++    *audio_codec_list =3D amr_audio_list;
> ++  } else if (!strcmp (format_name, "gif")) {
> ++    static enum CodecID gif_image_list[] =3D {
> ++      CODEC_ID_RAWVIDEO, CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D gif_image_list;
> ++    *audio_codec_list =3D NULL;
> ++  } else if ((plugin->audio_codec !=3D CODEC_ID_NONE) ||
> ++      (plugin->video_codec !=3D CODEC_ID_NONE)) {
> ++    tmp_vlist[0] =3D plugin->video_codec;
> ++    tmp_alist[0] =3D plugin->audio_codec;
> ++
> ++    *video_codec_list =3D tmp_vlist;
> ++    *audio_codec_list =3D tmp_alist;
> ++  } else {
> ++    GST_LOG ("Format %s not found", format_name);
> ++    return FALSE;
> ++  }
> ++
> ++  return TRUE;
> ++}
> ++
> ++/* Convert a GstCaps to a FFMPEG codec ID. Size et all
> ++ * are omitted, that can be queried by the user itself,
> ++ * we're not eating the GstCaps or anything
> ++ * A pointer to an allocated context is also needed for
> ++ * optional extra info
> ++ */
> ++
> ++enum CodecID
> ++gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * cont=
ext)
> ++{
> ++  enum CodecID id =3D CODEC_ID_NONE;
> ++  const gchar *mimetype;
> ++  const GstStructure *structure;
> ++  gboolean video =3D FALSE, audio =3D FALSE;        /* we want to be su=
re! */
> ++
> ++  g_return_val_if_fail (caps !=3D NULL, CODEC_ID_NONE);
> ++  g_return_val_if_fail (gst_caps_get_size (caps) =3D=3D 1, CODEC_ID_NON=
E);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  mimetype =3D gst_structure_get_name (structure);
> ++
> ++  if (!strcmp (mimetype, "video/x-raw-rgb") ||
> ++      !strcmp (mimetype, "video/x-raw-yuv")) {
> ++    id =3D CODEC_ID_RAWVIDEO;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-raw-int")) {
> ++    gint depth, width, endianness;
> ++    gboolean signedness;
> ++
> ++    if (gst_structure_get_int (structure, "endianness", &endianness) &&
> ++        gst_structure_get_boolean (structure, "signed", &signedness) &&
> ++        gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "depth", &depth) && depth =3D=
=3D width) {
> ++      switch (depth) {
> ++        case 8:
> ++          if (signedness) {
> ++            id =3D CODEC_ID_PCM_S8;
> ++          } else {
> ++            id =3D CODEC_ID_PCM_U8;
> ++          }
> ++          break;
> ++        case 16:
> ++          switch (endianness) {
> ++            case G_BIG_ENDIAN:
> ++              if (signedness) {
> ++                id =3D CODEC_ID_PCM_S16BE;
> ++              } else {
> ++                id =3D CODEC_ID_PCM_U16BE;
> ++              }
> ++              break;
> ++            case G_LITTLE_ENDIAN:
> ++              if (signedness) {
> ++                id =3D CODEC_ID_PCM_S16LE;
> ++              } else {
> ++                id =3D CODEC_ID_PCM_U16LE;
> ++              }
> ++              break;
> ++          }
> ++          break;
> ++      }
> ++      if (id !=3D CODEC_ID_NONE)
> ++        audio =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-mulaw")) {
> ++    id =3D CODEC_ID_PCM_MULAW;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-alaw")) {
> ++    id =3D CODEC_ID_PCM_ALAW;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-dv")) {
> ++    gboolean sys_strm;
> ++
> ++    if (gst_structure_get_boolean (structure, "systemstream", &sys_strm=
) &&
> ++        !sys_strm) {
> ++      id =3D CODEC_ID_DVVIDEO;
> ++      video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-dv")) {        /* ??? */
> ++    id =3D CODEC_ID_DVAUDIO;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h263")) {
> ++    const gchar *h263version =3D
> ++        gst_structure_get_string (structure, "h263version");
> ++    if (h263version && !strcmp (h263version, "h263p"))
> ++      id =3D CODEC_ID_H263P;
> ++    else
> ++      id =3D CODEC_ID_H263;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-intel-h263")) {
> ++    id =3D CODEC_ID_H263I;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h261")) {
> ++    id =3D CODEC_ID_H261;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/mpeg")) {
> ++    gboolean sys_strm;
> ++    gint mpegversion;
> ++
> ++    if (gst_structure_get_boolean (structure, "systemstream", &sys_strm=
) &&
> ++        gst_structure_get_int (structure, "mpegversion", &mpegversion) =
&&
> ++        !sys_strm) {
> ++      switch (mpegversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_MPEG1VIDEO;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_MPEG2VIDEO;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_MPEG4;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "image/jpeg")) {
> ++    id =3D CODEC_ID_MJPEG;        /* A... B... */
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-jpeg-b")) {
> ++    id =3D CODEC_ID_MJPEGB;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-wmv")) {
> ++    gint wmvversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "wmvversion", &wmvversion)) {
> ++      switch (wmvversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_WMV1;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_WMV2;
> ++          break;
> ++        case 3:
> ++        {
> ++          guint32 fourcc;
> ++
> ++          /* WMV3 unless the fourcc exists and says otherwise */
> ++          id =3D CODEC_ID_WMV3;
> ++
> ++          if (gst_structure_get_fourcc (structure, "format", &fourcc)) {
> ++            if ((fourcc =3D=3D GST_MAKE_FOURCC ('W', 'V', 'C', '1')) ||
> ++                (fourcc =3D=3D GST_MAKE_FOURCC ('W', 'M', 'V', 'A'))) {
> ++              id =3D CODEC_ID_VC1;
> ++            }
> ++          }
> ++        }
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-vorbis")) {
> ++    id =3D CODEC_ID_VORBIS;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-qdm2")) {
> ++    id =3D CODEC_ID_QDM2;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/mpeg")) {
> ++    gint layer =3D 0;
> ++    gint mpegversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "mpegversion", &mpegversion))=
 {
> ++      switch (mpegversion) {
> ++        case 2:                /* ffmpeg uses faad for both... */
> ++        case 4:
> ++          id =3D CODEC_ID_AAC;
> ++          break;
> ++        case 1:
> ++          if (gst_structure_get_int (structure, "layer", &layer)) {
> ++            switch (layer) {
> ++              case 1:
> ++                id =3D CODEC_ID_MP1;
> ++                break;
> ++              case 2:
> ++                id =3D CODEC_ID_MP2;
> ++                break;
> ++              case 3:
> ++                id =3D CODEC_ID_MP3;
> ++                break;
> ++            }
> ++          }
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-musepack")) {
> ++    gint streamversion =3D -1;
> ++
> ++    if (gst_structure_get_int (structure, "streamversion", &streamversi=
on)) {
> ++      if (streamversion =3D=3D 7)
> ++        id =3D CODEC_ID_MUSEPACK7;
> ++    } else {
> ++      id =3D CODEC_ID_MUSEPACK7;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-wma")) {
> ++    gint wmaversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "wmaversion", &wmaversion)) {
> ++      switch (wmaversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_WMAV1;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_WMAV2;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_WMAPRO;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-wms")) {
> ++    id =3D CODEC_ID_WMAVOICE;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-ac3")) {
> ++    id =3D CODEC_ID_AC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-eac3")) {
> ++    id =3D CODEC_ID_EAC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-vnd.sony.atrac3") ||
> ++      !strcmp (mimetype, "audio/atrac3")) {
> ++    id =3D CODEC_ID_ATRAC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-dts")) {
> ++    id =3D CODEC_ID_DTS;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "application/x-ape")) {
> ++    id =3D CODEC_ID_APE;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-msmpeg")) {
> ++    gint msmpegversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "msmpegversion", &msmpegversi=
on)) {
> ++      switch (msmpegversion) {
> ++        case 41:
> ++          id =3D CODEC_ID_MSMPEG4V1;
> ++          break;
> ++        case 42:
> ++          id =3D CODEC_ID_MSMPEG4V2;
> ++          break;
> ++        case 43:
> ++          id =3D CODEC_ID_MSMPEG4V3;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-svq")) {
> ++    gint svqversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "svqversion", &svqversion)) {
> ++      switch (svqversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_SVQ1;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_SVQ3;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-huffyuv")) {
> ++    id =3D CODEC_ID_HUFFYUV;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-mace")) {
> ++    gint maceversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "maceversion", &maceversion))=
 {
> ++      switch (maceversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_MACE3;
> ++          break;
> ++        case 6:
> ++          id =3D CODEC_ID_MACE6;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-theora")) {
> ++    id =3D CODEC_ID_THEORA;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp3")) {
> ++    id =3D CODEC_ID_VP3;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp5")) {
> ++    id =3D CODEC_ID_VP5;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6")) {
> ++    id =3D CODEC_ID_VP6;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6-flash")) {
> ++    id =3D CODEC_ID_VP6F;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6-alpha")) {
> ++    id =3D CODEC_ID_VP6A;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp8")) {
> ++    id =3D CODEC_ID_VP8;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-flash-screen")) {
> ++    id =3D CODEC_ID_FLASHSV;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-indeo")) {
> ++    gint indeoversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "indeoversion", &indeoversion=
)) {
> ++      switch (indeoversion) {
> ++        case 5:
> ++          id =3D CODEC_ID_INDEO5;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_INDEO3;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_INDEO2;
> ++          break;
> ++      }
> ++      if (id !=3D CODEC_ID_NONE)
> ++        video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "video/x-divx")) {
> ++    gint divxversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "divxversion", &divxversion))=
 {
> ++      switch (divxversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_MSMPEG4V3;
> ++          break;
> ++        case 4:
> ++        case 5:
> ++          id =3D CODEC_ID_MPEG4;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-3ivx")) {
> ++    id =3D CODEC_ID_MPEG4;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-xvid")) {
> ++    id =3D CODEC_ID_MPEG4;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-ffv")) {
> ++    gint ffvversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "ffvversion", &ffvversion) &&
> ++        ffvversion =3D=3D 1) {
> ++      id =3D CODEC_ID_FFV1;
> ++      video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-adpcm")) {
> ++    const gchar *layout;
> ++
> ++    layout =3D gst_structure_get_string (structure, "layout");
> ++    if (layout =3D=3D NULL) {
> ++      /* break */
> ++    } else if (!strcmp (layout, "quicktime")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_QT;
> ++    } else if (!strcmp (layout, "microsoft")) {
> ++      id =3D CODEC_ID_ADPCM_MS;
> ++    } else if (!strcmp (layout, "dvi")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_WAV;
> ++    } else if (!strcmp (layout, "4xm")) {
> ++      id =3D CODEC_ID_ADPCM_4XM;
> ++    } else if (!strcmp (layout, "smjpeg")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_SMJPEG;
> ++    } else if (!strcmp (layout, "dk3")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_DK3;
> ++    } else if (!strcmp (layout, "dk4")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_DK4;
> ++    } else if (!strcmp (layout, "westwood")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_WS;
> ++    } else if (!strcmp (layout, "iss")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_ISS;
> ++    } else if (!strcmp (layout, "xa")) {
> ++      id =3D CODEC_ID_ADPCM_XA;
> ++    } else if (!strcmp (layout, "adx")) {
> ++      id =3D CODEC_ID_ADPCM_ADX;
> ++    } else if (!strcmp (layout, "ea")) {
> ++      id =3D CODEC_ID_ADPCM_EA;
> ++    } else if (!strcmp (layout, "g726")) {
> ++      id =3D CODEC_ID_ADPCM_G726;
> ++    } else if (!strcmp (layout, "g721")) {
> ++      id =3D CODEC_ID_ADPCM_G726;
> ++    } else if (!strcmp (layout, "ct")) {
> ++      id =3D CODEC_ID_ADPCM_CT;
> ++    } else if (!strcmp (layout, "swf")) {
> ++      id =3D CODEC_ID_ADPCM_SWF;
> ++    } else if (!strcmp (layout, "yamaha")) {
> ++      id =3D CODEC_ID_ADPCM_YAMAHA;
> ++    } else if (!strcmp (layout, "sbpro2")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_2;
> ++    } else if (!strcmp (layout, "sbpro3")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_3;
> ++    } else if (!strcmp (layout, "sbpro4")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_4;
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-4xm")) {
> ++    id =3D CODEC_ID_4XM;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-dpcm")) {
> ++    const gchar *layout;
> ++
> ++    layout =3D gst_structure_get_string (structure, "layout");
> ++    if (!layout) {
> ++      /* .. */
> ++    } else if (!strcmp (layout, "roq")) {
> ++      id =3D CODEC_ID_ROQ_DPCM;
> ++    } else if (!strcmp (layout, "interplay")) {
> ++      id =3D CODEC_ID_INTERPLAY_DPCM;
> ++    } else if (!strcmp (layout, "xan")) {
> ++      id =3D CODEC_ID_XAN_DPCM;
> ++    } else if (!strcmp (layout, "sol")) {
> ++      id =3D CODEC_ID_SOL_DPCM;
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-flac")) {
> ++    id =3D CODEC_ID_FLAC;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-shorten")) {
> ++    id =3D CODEC_ID_SHORTEN;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-alac")) {
> ++    id =3D CODEC_ID_ALAC;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-cinepak")) {
> ++    id =3D CODEC_ID_CINEPAK;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-pn-realvideo")) {
> ++    gint rmversion;
> ++
> ++    if (gst_structure_get_int (structure, "rmversion", &rmversion)) {
> ++      switch (rmversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_RV10;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_RV20;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_RV30;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_RV40;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-sipro")) {
> ++    id =3D CODEC_ID_SIPR;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-pn-realaudio")) {
> ++    gint raversion;
> ++
> ++    if (gst_structure_get_int (structure, "raversion", &raversion)) {
> ++      switch (raversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_RA_144;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_RA_288;
> ++          break;
> ++        case 8:
> ++          id =3D CODEC_ID_COOK;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-rle")) {
> ++    const gchar *layout;
> ++
> ++    if ((layout =3D gst_structure_get_string (structure, "layout"))) {
> ++      if (!strcmp (layout, "microsoft")) {
> ++        id =3D CODEC_ID_MSRLE;
> ++        video =3D TRUE;
> ++      }
> ++    }
> ++  } else if (!strcmp (mimetype, "video/x-xan")) {
> ++    gint wcversion =3D 0;
> ++
> ++    if ((gst_structure_get_int (structure, "wcversion", &wcversion))) {
> ++      switch (wcversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_XAN_WC3;
> ++          video =3D TRUE;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_XAN_WC4;
> ++          video =3D TRUE;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/AMR")) {
> ++    audio =3D TRUE;
> ++    id =3D CODEC_ID_AMR_NB;
> ++  } else if (!strcmp (mimetype, "audio/AMR-WB")) {
> ++    id =3D CODEC_ID_AMR_WB;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/qcelp")) {
> ++    id =3D CODEC_ID_QCELP;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h264")) {
> ++    id =3D CODEC_ID_H264;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-flash-video")) {
> ++    gint flvversion =3D 0;
> ++
> ++    if ((gst_structure_get_int (structure, "flvversion", &flvversion)))=
 {
> ++      switch (flvversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_FLV1;
> ++          video =3D TRUE;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++
> ++  } else if (!strcmp (mimetype, "audio/x-nellymoser")) {
> ++    id =3D CODEC_ID_NELLYMOSER;
> ++    audio =3D TRUE;
> ++  } else if (!strncmp (mimetype, "audio/x-gst_ff-", 15)) {
> ++    gchar ext[16];
> ++    AVCodec *codec;
> ++
> ++    if (strlen (mimetype) <=3D 30 &&
> ++        sscanf (mimetype, "audio/x-gst_ff-%s", ext) =3D=3D 1) {
> ++      if ((codec =3D avcodec_find_decoder_by_name (ext)) ||
> ++          (codec =3D avcodec_find_encoder_by_name (ext))) {
> ++        id =3D codec->id;
> ++        audio =3D TRUE;
> ++      }
> ++    }
> ++  } else if (!strncmp (mimetype, "video/x-gst_ff-", 15)) {
> ++    gchar ext[16];
> ++    AVCodec *codec;
> ++
> ++    if (strlen (mimetype) <=3D 30 &&
> ++        sscanf (mimetype, "video/x-gst_ff-%s", ext) =3D=3D 1) {
> ++      if ((codec =3D avcodec_find_decoder_by_name (ext)) ||
> ++          (codec =3D avcodec_find_encoder_by_name (ext))) {
> ++        id =3D codec->id;
> ++        video =3D TRUE;
> ++      }
> ++    }
> ++  }
> ++
> ++  if (context !=3D NULL) {
> ++    if (video =3D=3D TRUE) {
> ++      context->codec_type =3D AVMEDIA_TYPE_VIDEO;
> ++    } else if (audio =3D=3D TRUE) {
> ++      context->codec_type =3D AVMEDIA_TYPE_AUDIO;
> ++    } else {
> ++      context->codec_type =3D AVMEDIA_TYPE_UNKNOWN;
> ++    }
> ++    context->codec_id =3D id;
> ++    gst_ffmpeg_caps_with_codecid (id, context->codec_type, caps, contex=
t);
> ++  }
> ++
> ++  if (id !=3D CODEC_ID_NONE) {
> ++    GST_DEBUG ("The id=3D%d belongs to the caps %" GST_PTR_FORMAT, id, =
caps);
> ++  } else {
> ++    GST_WARNING ("Couldn't figure out the id for caps %" GST_PTR_FORMAT=
, caps);
> ++  }
> ++
> ++  return id;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.rej gst=
-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.rej
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.rej	1970-01-0=
1 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.rej	2014-08-08 15:=
31:06.055868246 +0200
> +@@ -0,0 +1,12 @@
> ++--- ext/ffmpeg/gstffmpegcodecmap.c
> +++++ ext/ffmpeg/gstffmpegcodecmap.c
> ++@@ -1884,9 +1842,6 @@
> ++             gst_ff_vid_caps_new (context, codec_id, encode, "video/x-r=
aw-rgb",
> ++             "bpp", G_TYPE_INT, bpp, "depth", G_TYPE_INT, depth, "endia=
nness",
> ++             G_TYPE_INT, endianness, NULL);
> ++-        if (caps && context) {
> ++-          gst_ffmpeg_set_palette (caps, context);
> ++-        }
> ++       }
> ++     } else if (fmt) {
> ++       caps =3D gst_ff_vid_caps_new (context, codec_id, encode, "video/=
x-raw-yuv",
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c gst-ffmpeg-0=
=2E10.13/ext/ffmpeg/gstffmpegdec.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c	2014-08-08 14:46:3=
1.462772351 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c	2014-08-08 15:32:18.608=
870847 +0200
> +@@ -88,7 +88,6 @@
> +       gint depth;
> +     } audio;
> +   } format;
> +-  gboolean waiting_for_key;
> +   gboolean discont;
> +   gboolean clear_ts;
> +=20
> +@@ -438,7 +437,6 @@
> +   ffmpegdec->pcache =3D NULL;
> +   ffmpegdec->par =3D NULL;
> +   ffmpegdec->opened =3D FALSE;
> +-  ffmpegdec->waiting_for_key =3D TRUE;
> +   ffmpegdec->skip_frame =3D ffmpegdec->lowres =3D 0;
> +   ffmpegdec->direct_rendering =3D DEFAULT_DIRECT_RENDERING;
> +   ffmpegdec->do_padding =3D DEFAULT_DO_PADDING;
> +@@ -608,11 +606,6 @@
> +     gst_ffmpeg_avcodec_close (ffmpegdec->context);
> +   ffmpegdec->opened =3D FALSE;
> +=20
> +-  if (ffmpegdec->context->palctrl) {
> +-    av_free (ffmpegdec->context->palctrl);
> +-    ffmpegdec->context->palctrl =3D NULL;
> +-  }
> +-
> +   if (ffmpegdec->context->extradata) {
> +     av_free (ffmpegdec->context->extradata);
> +     ffmpegdec->context->extradata =3D NULL;
> +@@ -864,7 +857,7 @@
> +=20
> +   /* workaround encoder bugs */
> +   ffmpegdec->context->workaround_bugs |=3D FF_BUG_AUTODETECT;
> +-  ffmpegdec->context->error_recognition =3D 1;
> ++  ffmpegdec->context->err_recognition =3D 1;
> +=20
> +   /* for slow cpus */
> +   ffmpegdec->context->lowres =3D ffmpegdec->lowres;
> +@@ -944,7 +937,7 @@
> +   fsize =3D gst_ffmpeg_avpicture_get_size (ffmpegdec->context->pix_fmt,
> +       width, height);
> +=20
> +-  if (!ffmpegdec->context->palctrl && ffmpegdec->can_allocate_aligned) {
> ++  if (ffmpegdec->can_allocate_aligned) {
> +     GST_LOG_OBJECT (ffmpegdec, "calling pad_alloc");
> +     /* no pallete, we can use the buffer size to alloc */
> +     ret =3D gst_pad_alloc_buffer_and_set_caps (ffmpegdec->srcpad,
> +@@ -1083,7 +1076,6 @@
> +   /* tell ffmpeg we own this buffer, tranfer the ref we have on the buf=
fer to
> +    * the opaque data. */
> +   picture->type =3D FF_BUFFER_TYPE_USER;
> +-  picture->age =3D 256 * 256 * 256 * 64;
> +   picture->opaque =3D buf;
> +=20
> + #ifdef EXTRA_REF
> +@@ -1414,10 +1406,6 @@
> +   } else {
> +     if (diff >=3D 0) {
> +       /* we're too slow, try to speed up */
> +-      if (ffmpegdec->waiting_for_key) {
> +-        /* we were waiting for a keyframe, that's ok */
> +-        goto skipping;
> +-      }
> +       /* switch to skip_frame mode */
> +       goto skip_frame;
> +     }
> +@@ -1427,11 +1415,6 @@
> +   ffmpegdec->processed++;
> +   return TRUE;
> +=20
> +-skipping:
> +-  {
> +-    res =3D FALSE;
> +-    goto drop_qos;
> +-  }
> + normal_mode:
> +   {
> +     if (ffmpegdec->context->skip_frame !=3D AVDISCARD_DEFAULT) {
> +@@ -1528,43 +1511,6 @@
> + }
> +=20
> +=20
> +-/* figure out if the current picture is a keyframe, return TRUE if that=
 is
> +- * the case. */
> +-static gboolean
> +-check_keyframe (GstFFMpegDec * ffmpegdec)
> +-{
> +-  GstFFMpegDecClass *oclass;
> +-  gboolean is_itype =3D FALSE;
> +-  gboolean is_reference =3D FALSE;
> +-  gboolean iskeyframe;
> +-
> +-  /* figure out if we are dealing with a keyframe */
> +-  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> +-
> +-  /* remember that we have B frames, we need this for the DTS -> PTS co=
nversion
> +-   * code */
> +-  if (!ffmpegdec->has_b_frames && ffmpegdec->picture->pict_type =3D=3D =
FF_B_TYPE) {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "we have B frames");
> +-    ffmpegdec->has_b_frames =3D TRUE;
> +-  }
> +-
> +-  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D FF_I_TYPE);
> +-  is_reference =3D (ffmpegdec->picture->reference =3D=3D 1);
> +-
> +-  iskeyframe =3D (is_itype || is_reference || ffmpegdec->picture->key_f=
rame)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_INDEO3)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_MSZH)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_ZLIB)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_VP3)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_HUFFYUV);
> +-
> +-  GST_LOG_OBJECT (ffmpegdec,
> +-      "current picture: type: %d, is_keyframe:%d, is_itype:%d, is_refer=
ence:%d",
> +-      ffmpegdec->picture->pict_type, iskeyframe, is_itype, is_reference=
);
> +-
> +-  return iskeyframe;
> +-}
> +-
> + /* get an outbuf buffer with the current picture */
> + static GstFlowReturn
> + get_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf)
> +@@ -1694,7 +1640,6 @@
> + {
> +   gint len =3D -1;
> +   gint have_data;
> +-  gboolean iskeyframe;
> +   gboolean mode_switch;
> +   gboolean decode;
> +   gint skip_frame =3D AVDISCARD_DEFAULT;
> +@@ -1809,7 +1754,6 @@
> +     gst_ffmpegdec_negotiate (ffmpegdec, TRUE);
> +   }
> +=20
> +-
> +   /* Whether a frame is interlaced or not is unknown at the time of
> +      buffer allocation, so caps on the buffer in opaque will have
> +      the previous frame's interlaced flag set. So if interlacedness
> +@@ -1831,10 +1775,6 @@
> +     }
> +   }
> +=20
> +-  /* check if we are dealing with a keyframe here, this will also check=
 if we
> +-   * are dealing with B frames. */
> +-  iskeyframe =3D check_keyframe (ffmpegdec);
> +-
> +   /* check that the timestamps go upwards */
> +   if (ffmpegdec->last_out !=3D -1 && ffmpegdec->last_out > out_pts) {
> +     /* timestamps go backwards, this means frames were reordered and we=
 must
> +@@ -1865,7 +1805,7 @@
> +    * timestamps */
> +   if (!ffmpegdec->reordered_in && ffmpegdec->reordered_out) {
> +     /* PTS and DTS are the same for keyframes */
> +-    if (!iskeyframe && ffmpegdec->next_out !=3D -1) {
> ++    if (ffmpegdec->next_out !=3D -1) {
> +       /* interpolate all timestamps except for keyframes, FIXME, this is
> +        * wrong when QoS is active. */
> +       GST_DEBUG_OBJECT (ffmpegdec, "interpolate timestamps");
> +@@ -1874,16 +1814,6 @@
> +     }
> +   }
> +=20
> +-  /* when we're waiting for a keyframe, see if we have one or drop the =
current
> +-   * non-keyframe */
> +-  if (G_UNLIKELY (ffmpegdec->waiting_for_key)) {
> +-    if (G_LIKELY (!iskeyframe))
> +-      goto drop_non_keyframe;
> +-
> +-    /* we have a keyframe, we can stop waiting for one */
> +-    ffmpegdec->waiting_for_key =3D FALSE;
> +-  }
> +-
> +   /* get a handle to the output buffer */
> +   *ret =3D get_output_buffer (ffmpegdec, outbuf);
> +   if (G_UNLIKELY (*ret !=3D GST_FLOW_OK))
> +@@ -2000,20 +1930,11 @@
> +   else
> +     ffmpegdec->next_out =3D -1;
> +=20
> +-  /* palette is not part of raw video frame in gst and the size
> +-   * of the outgoing buffer needs to be adjusted accordingly */
> +-  if (ffmpegdec->context->palctrl !=3D NULL)
> +-    GST_BUFFER_SIZE (*outbuf) -=3D AVPALETTE_SIZE;
> +-
> +   /* now see if we need to clip the buffer against the segment boundari=
es. */
> +   if (G_UNLIKELY (!clip_video_buffer (ffmpegdec, *outbuf, out_timestamp,
> +               out_duration)))
> +     goto clipped;
> +=20
> +-  /* mark as keyframe or delta unit */
> +-  if (!iskeyframe)
> +-    GST_BUFFER_FLAG_SET (*outbuf, GST_BUFFER_FLAG_DELTA_UNIT);
> +-
> +   if (ffmpegdec->picture->top_field_first)
> +     GST_BUFFER_FLAG_SET (*outbuf, GST_VIDEO_BUFFER_TFF);
> +=20
> +@@ -2024,11 +1945,6 @@
> +   return len;
> +=20
> +   /* special cases */
> +-drop_non_keyframe:
> +-  {
> +-    GST_WARNING_OBJECT (ffmpegdec, "Dropping non-keyframe (seek/init)");
> +-    goto beach;
> +-  }
> + no_output:
> +   {
> +     GST_DEBUG_OBJECT (ffmpegdec, "no output buffer");
> +@@ -2422,7 +2338,6 @@
> +       gst_ffmpegdec_reset_ts (ffmpegdec);
> +       gst_ffmpegdec_reset_qos (ffmpegdec);
> +       gst_ffmpegdec_flush_pcache (ffmpegdec);
> +-      ffmpegdec->waiting_for_key =3D TRUE;
> +       gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> +       clear_queued (ffmpegdec);
> +       break;
> +@@ -2560,17 +2475,6 @@
> +=20
> +   oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> +=20
> +-  /* do early keyframe check pretty bad to rely on the keyframe flag in=
 the
> +-   * source for this as it might not even be parsed (UDP/file/..).  */
> +-  if (G_UNLIKELY (ffmpegdec->waiting_for_key)) {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "waiting for keyframe");
> +-    if (GST_BUFFER_FLAG_IS_SET (inbuf, GST_BUFFER_FLAG_DELTA_UNIT) &&
> +-        oclass->in_plugin->type !=3D AVMEDIA_TYPE_AUDIO)
> +-      goto skip_keyframe;
> +-
> +-    GST_DEBUG_OBJECT (ffmpegdec, "got keyframe");
> +-    ffmpegdec->waiting_for_key =3D FALSE;
> +-  }
> +   /* parse cache joining. If there is cached data */
> +   if (ffmpegdec->pcache) {
> +     /* join with previous data */
> +@@ -2805,12 +2709,6 @@
> +     gst_buffer_unref (inbuf);
> +     return GST_FLOW_NOT_NEGOTIATED;
> +   }
> +-skip_keyframe:
> +-  {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "skipping non keyframe");
> +-    gst_buffer_unref (inbuf);
> +-    return GST_FLOW_OK;
> +-  }
> + }
> +=20
> + static GstStateChangeReturn
> +@@ -2936,7 +2834,7 @@
> +     gchar *plugin_name;
> +=20
> +     /* only decoders */
> +-    if (!in_plugin->decode) {
> ++    if (!av_codec_is_decoder (in_plugin)) {
> +       goto next;
> +     }
> +=20
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.orig gst-ffm=
peg-0.10.13/ext/ffmpeg/gstffmpegdec.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.orig	1970-01-01 01=
:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.orig	2014-08-08 15:31:0=
6.057868246 +0200
> +@@ -0,0 +1,2973 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <assert.h>
> ++#include <string.h>
> ++
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#endif
> ++
> ++#include <gst/gst.h>
> ++#include <gst/video/video.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++#include "gstffmpegutils.h"
> ++
> ++/* define to enable alternative buffer refcounting algorithm */
> ++#undef EXTRA_REF
> ++
> ++typedef struct _GstFFMpegDec GstFFMpegDec;
> ++
> ++#define MAX_TS_MASK 0xff
> ++
> ++/* for each incomming buffer we keep all timing info in a structure lik=
e this.
> ++ * We keep a circular array of these structures around to store the tim=
ing info.
> ++ * The index in the array is what we pass as opaque data (to pictures) =
and
> ++ * pts (to parsers) so that ffmpeg can remember them for us. */
> ++typedef struct
> ++{
> ++  gint idx;
> ++  GstClockTime timestamp;
> ++  GstClockTime duration;
> ++  gint64 offset;
> ++} GstTSInfo;
> ++
> ++struct _GstFFMpegDec
> ++{
> ++  GstElement element;
> ++
> ++  /* We need to keep track of our pads, so we do so here. */
> ++  GstPad *srcpad;
> ++  GstPad *sinkpad;
> ++
> ++  /* decoding */
> ++  AVCodecContext *context;
> ++  AVFrame *picture;
> ++  gboolean opened;
> ++  union
> ++  {
> ++    struct
> ++    {
> ++      gint width, height;
> ++      gint clip_width, clip_height;
> ++      gint par_n, par_d;
> ++      gint fps_n, fps_d;
> ++      gint old_fps_n, old_fps_d;
> ++      gboolean interlaced;
> ++
> ++      enum PixelFormat pix_fmt;
> ++    } video;
> ++    struct
> ++    {
> ++      gint channels;
> ++      gint samplerate;
> ++      gint depth;
> ++    } audio;
> ++  } format;
> ++  gboolean discont;
> ++  gboolean clear_ts;
> ++
> ++  /* for tracking DTS/PTS */
> ++  gboolean has_b_frames;
> ++  gboolean reordered_in;
> ++  GstClockTime last_in;
> ++  GstClockTime last_diff;
> ++  guint last_frames;
> ++  gboolean reordered_out;
> ++  GstClockTime last_out;
> ++  GstClockTime next_out;
> ++
> ++  /* parsing */
> ++  gboolean turnoff_parser;      /* used for turning off aac raw parsing
> ++                                 * See bug #566250 */
> ++  AVCodecParserContext *pctx;
> ++  GstBuffer *pcache;
> ++  guint8 *padded;
> ++  guint padded_size;
> ++
> ++  GValue *par;                  /* pixel aspect ratio of incoming data =
*/
> ++  gboolean current_dr;          /* if direct rendering is enabled */
> ++  gboolean extra_ref;           /* keep extra ref around in get/release=
 */
> ++
> ++  /* some properties */
> ++  enum AVDiscard skip_frame;
> ++  gint lowres;
> ++  gboolean direct_rendering;
> ++  gboolean do_padding;
> ++  gboolean debug_mv;
> ++  gboolean crop;
> ++  int max_threads;
> ++
> ++  /* QoS stuff *//* with LOCK */
> ++  gdouble proportion;
> ++  GstClockTime earliest_time;
> ++  gint64 processed;
> ++  gint64 dropped;
> ++
> ++  /* clipping segment */
> ++  GstSegment segment;
> ++
> ++  gboolean is_realvideo;
> ++
> ++  GstTSInfo ts_info[MAX_TS_MASK + 1];
> ++  gint ts_idx;
> ++
> ++  /* reverse playback queue */
> ++  GList *queued;
> ++
> ++  /* Can downstream allocate 16bytes aligned data. */
> ++  gboolean can_allocate_aligned;
> ++};
> ++
> ++typedef struct _GstFFMpegDecClass GstFFMpegDecClass;
> ++
> ++struct _GstFFMpegDecClass
> ++{
> ++  GstElementClass parent_class;
> ++
> ++  AVCodec *in_plugin;
> ++  GstPadTemplate *srctempl, *sinktempl;
> ++};
> ++
> ++#define GST_TS_INFO_NONE &ts_info_none
> ++static const GstTSInfo ts_info_none =3D { -1, -1, -1, -1 };
> ++
> ++static const GstTSInfo *
> ++gst_ts_info_store (GstFFMpegDec * dec, GstClockTime timestamp,
> ++    GstClockTime duration, gint64 offset)
> ++{
> ++  gint idx =3D dec->ts_idx;
> ++  dec->ts_info[idx].idx =3D idx;
> ++  dec->ts_info[idx].timestamp =3D timestamp;
> ++  dec->ts_info[idx].duration =3D duration;
> ++  dec->ts_info[idx].offset =3D offset;
> ++  dec->ts_idx =3D (idx + 1) & MAX_TS_MASK;
> ++
> ++  return &dec->ts_info[idx];
> ++}
> ++
> ++static const GstTSInfo *
> ++gst_ts_info_get (GstFFMpegDec * dec, gint idx)
> ++{
> ++  if (G_UNLIKELY (idx < 0 || idx > MAX_TS_MASK))
> ++    return GST_TS_INFO_NONE;
> ++
> ++  return &dec->ts_info[idx];
> ++}
> ++
> ++#define GST_TYPE_FFMPEGDEC \
> ++  (gst_ffmpegdec_get_type())
> ++#define GST_FFMPEGDEC(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_FFMPEGDEC,GstFFMpegDec))
> ++#define GST_FFMPEGDEC_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_FFMPEGDEC,GstFFMpegDecClass=
))
> ++#define GST_IS_FFMPEGDEC(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_FFMPEGDEC))
> ++#define GST_IS_FFMPEGDEC_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_FFMPEGDEC))
> ++
> ++#define DEFAULT_LOWRES			0
> ++#define DEFAULT_SKIPFRAME		0
> ++#define DEFAULT_DIRECT_RENDERING	TRUE
> ++#define DEFAULT_DO_PADDING		TRUE
> ++#define DEFAULT_DEBUG_MV		FALSE
> ++#define DEFAULT_CROP			TRUE
> ++#define DEFAULT_MAX_THREADS		1
> ++
> ++enum
> ++{
> ++  PROP_0,
> ++  PROP_LOWRES,
> ++  PROP_SKIPFRAME,
> ++  PROP_DIRECT_RENDERING,
> ++  PROP_DO_PADDING,
> ++  PROP_DEBUG_MV,
> ++  PROP_CROP,
> ++  PROP_MAX_THREADS,
> ++  PROP_LAST
> ++};
> ++
> ++/* A number of function prototypes are given so we can refer to them la=
ter. */
> ++static void gst_ffmpegdec_base_init (GstFFMpegDecClass * klass);
> ++static void gst_ffmpegdec_class_init (GstFFMpegDecClass * klass);
> ++static void gst_ffmpegdec_init (GstFFMpegDec * ffmpegdec);
> ++static void gst_ffmpegdec_finalize (GObject * object);
> ++
> ++static gboolean gst_ffmpegdec_query (GstPad * pad, GstQuery * query);
> ++static gboolean gst_ffmpegdec_src_event (GstPad * pad, GstEvent * event=
);
> ++
> ++static gboolean gst_ffmpegdec_setcaps (GstPad * pad, GstCaps * caps);
> ++static gboolean gst_ffmpegdec_sink_event (GstPad * pad, GstEvent * even=
t);
> ++static GstFlowReturn gst_ffmpegdec_chain (GstPad * pad, GstBuffer * buf=
);
> ++
> ++static GstStateChangeReturn gst_ffmpegdec_change_state (GstElement * el=
ement,
> ++    GstStateChange transition);
> ++
> ++static void gst_ffmpegdec_set_property (GObject * object,
> ++    guint prop_id, const GValue * value, GParamSpec * pspec);
> ++static void gst_ffmpegdec_get_property (GObject * object,
> ++    guint prop_id, GValue * value, GParamSpec * pspec);
> ++
> ++static gboolean gst_ffmpegdec_negotiate (GstFFMpegDec * ffmpegdec,
> ++    gboolean force);
> ++
> ++/* some sort of bufferpool handling, but different */
> ++static int gst_ffmpegdec_get_buffer (AVCodecContext * context,
> ++    AVFrame * picture);
> ++static void gst_ffmpegdec_release_buffer (AVCodecContext * context,
> ++    AVFrame * picture);
> ++
> ++static void gst_ffmpegdec_drain (GstFFMpegDec * ffmpegdec);
> ++
> ++#define GST_FFDEC_PARAMS_QDATA g_quark_from_static_string("ffdec-params=
")
> ++
> ++static GstElementClass *parent_class =3D NULL;
> ++
> ++#define GST_FFMPEGDEC_TYPE_LOWRES (gst_ffmpegdec_lowres_get_type())
> ++static GType
> ++gst_ffmpegdec_lowres_get_type (void)
> ++{
> ++  static GType ffmpegdec_lowres_type =3D 0;
> ++
> ++  if (!ffmpegdec_lowres_type) {
> ++    static const GEnumValue ffmpegdec_lowres[] =3D {
> ++      {0, "0", "full"},
> ++      {1, "1", "1/2-size"},
> ++      {2, "2", "1/4-size"},
> ++      {0, NULL, NULL},
> ++    };
> ++
> ++    ffmpegdec_lowres_type =3D
> ++        g_enum_register_static ("GstFFMpegDecLowres", ffmpegdec_lowres);
> ++  }
> ++
> ++  return ffmpegdec_lowres_type;
> ++}
> ++
> ++#define GST_FFMPEGDEC_TYPE_SKIPFRAME (gst_ffmpegdec_skipframe_get_type(=
))
> ++static GType
> ++gst_ffmpegdec_skipframe_get_type (void)
> ++{
> ++  static GType ffmpegdec_skipframe_type =3D 0;
> ++
> ++  if (!ffmpegdec_skipframe_type) {
> ++    static const GEnumValue ffmpegdec_skipframe[] =3D {
> ++      {0, "0", "Skip nothing"},
> ++      {1, "1", "Skip B-frames"},
> ++      {2, "2", "Skip IDCT/Dequantization"},
> ++      {5, "5", "Skip everything"},
> ++      {0, NULL, NULL},
> ++    };
> ++
> ++    ffmpegdec_skipframe_type =3D
> ++        g_enum_register_static ("GstFFMpegDecSkipFrame", ffmpegdec_skip=
frame);
> ++  }
> ++
> ++  return ffmpegdec_skipframe_type;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_base_init (GstFFMpegDecClass * klass)
> ++{
> ++  GstElementClass *element_class =3D GST_ELEMENT_CLASS (klass);
> ++  GstPadTemplate *sinktempl, *srctempl;
> ++  GstCaps *sinkcaps, *srccaps;
> ++  AVCodec *in_plugin;
> ++  gchar *longname, *classification, *description;
> ++
> ++  in_plugin =3D
> ++      (AVCodec *) g_type_get_qdata (G_OBJECT_CLASS_TYPE (klass),
> ++      GST_FFDEC_PARAMS_QDATA);
> ++  g_assert (in_plugin !=3D NULL);
> ++
> ++  /* construct the element details struct */
> ++  longname =3D g_strdup_printf ("FFmpeg %s decoder", in_plugin->long_na=
me);
> ++  classification =3D g_strdup_printf ("Codec/Decoder/%s",
> ++      (in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) ? "Video" : "Audio");
> ++  description =3D g_strdup_printf ("FFmpeg %s decoder", in_plugin->name=
);
> ++  gst_element_class_set_details_simple (element_class, longname, classi=
fication,
> ++      description,
> ++      "Wim Taymans <wim.taymans@gmail.com>, "
> ++      "Ronald Bultje <rbultje@ronald.bitfreak.net>, "
> ++      "Edward Hervey <bilboed@bilboed.com>");
> ++  g_free (longname);
> ++  g_free (classification);
> ++  g_free (description);
> ++
> ++  /* get the caps */
> ++  sinkcaps =3D gst_ffmpeg_codecid_to_caps (in_plugin->id, NULL, FALSE);
> ++  if (!sinkcaps) {
> ++    GST_DEBUG ("Couldn't get sink caps for decoder '%s'", in_plugin->na=
me);
> ++    sinkcaps =3D gst_caps_from_string ("unknown/unknown");
> ++  }
> ++  if (in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) {
> ++    srccaps =3D gst_caps_from_string ("video/x-raw-rgb; video/x-raw-yuv=
");
> ++  } else {
> ++    srccaps =3D gst_ffmpeg_codectype_to_audio_caps (NULL,
> ++        in_plugin->id, FALSE, in_plugin);
> ++  }
> ++  if (!srccaps) {
> ++    GST_DEBUG ("Couldn't get source caps for decoder '%s'", in_plugin->=
name);
> ++    srccaps =3D gst_caps_from_string ("unknown/unknown");
> ++  }
> ++
> ++  /* pad templates */
> ++  sinktempl =3D gst_pad_template_new ("sink", GST_PAD_SINK,
> ++      GST_PAD_ALWAYS, sinkcaps);
> ++  srctempl =3D gst_pad_template_new ("src", GST_PAD_SRC, GST_PAD_ALWAYS=
, srccaps);
> ++
> ++  gst_element_class_add_pad_template (element_class, srctempl);
> ++  gst_element_class_add_pad_template (element_class, sinktempl);
> ++
> ++  klass->in_plugin =3D in_plugin;
> ++  klass->srctempl =3D srctempl;
> ++  klass->sinktempl =3D sinktempl;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_class_init (GstFFMpegDecClass * klass)
> ++{
> ++  GObjectClass *gobject_class =3D G_OBJECT_CLASS (klass);
> ++  GstElementClass *gstelement_class =3D GST_ELEMENT_CLASS (klass);
> ++
> ++  parent_class =3D g_type_class_peek_parent (klass);
> ++
> ++  gobject_class->finalize =3D gst_ffmpegdec_finalize;
> ++
> ++  gobject_class->set_property =3D gst_ffmpegdec_set_property;
> ++  gobject_class->get_property =3D gst_ffmpegdec_get_property;
> ++
> ++  if (klass->in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) {
> ++    int caps;
> ++
> ++    g_object_class_install_property (gobject_class, PROP_SKIPFRAME,
> ++        g_param_spec_enum ("skip-frame", "Skip frames",
> ++            "Which types of frames to skip during decoding",
> ++            GST_FFMPEGDEC_TYPE_SKIPFRAME, 0,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_LOWRES,
> ++        g_param_spec_enum ("lowres", "Low resolution",
> ++            "At which resolution to decode images", GST_FFMPEGDEC_TYPE_=
LOWRES,
> ++            0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_DIRECT_RENDERI=
NG,
> ++        g_param_spec_boolean ("direct-rendering", "Direct Rendering",
> ++            "Enable direct rendering", DEFAULT_DIRECT_RENDERING,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_DO_PADDING,
> ++        g_param_spec_boolean ("do-padding", "Do Padding",
> ++            "Add 0 padding before decoding data", DEFAULT_DO_PADDING,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_DEBUG_MV,
> ++        g_param_spec_boolean ("debug-mv", "Debug motion vectors",
> ++            "Whether ffmpeg should print motion vectors on top of the i=
mage",
> ++            DEFAULT_DEBUG_MV, G_PARAM_READWRITE | G_PARAM_STATIC_STRING=
S));
> ++#if 0
> ++    g_object_class_install_property (gobject_class, PROP_CROP,
> ++        g_param_spec_boolean ("crop", "Crop",
> ++            "Crop images to the display region",
> ++            DEFAULT_CROP, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++#endif
> ++
> ++    caps =3D klass->in_plugin->capabilities;
> ++    if (caps & (CODEC_CAP_FRAME_THREADS | CODEC_CAP_SLICE_THREADS)) {
> ++      g_object_class_install_property (G_OBJECT_CLASS (klass), PROP_MAX=
_THREADS,
> ++          g_param_spec_int ("max-threads", "Maximum decode threads",
> ++              "Maximum number of worker threads to spawn. (0 =3D auto)",
> ++              0, G_MAXINT, DEFAULT_MAX_THREADS,
> ++              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    }
> ++  }
> ++
> ++  gstelement_class->change_state =3D gst_ffmpegdec_change_state;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_init (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  /* setup pads */
> ++  ffmpegdec->sinkpad =3D gst_pad_new_from_template (oclass->sinktempl, =
"sink");
> ++  gst_pad_set_setcaps_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_setcaps));
> ++  gst_pad_set_event_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_sink_event));
> ++  gst_pad_set_chain_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_chain));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegdec), ffmpegdec->sinkpad);
> ++
> ++  ffmpegdec->srcpad =3D gst_pad_new_from_template (oclass->srctempl, "s=
rc");
> ++  gst_pad_use_fixed_caps (ffmpegdec->srcpad);
> ++  gst_pad_set_event_function (ffmpegdec->srcpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_src_event));
> ++  gst_pad_set_query_function (ffmpegdec->srcpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_query));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegdec), ffmpegdec->srcpad);
> ++
> ++  /* some ffmpeg data */
> ++  ffmpegdec->context =3D avcodec_alloc_context ();
> ++  ffmpegdec->picture =3D avcodec_alloc_frame ();
> ++  ffmpegdec->pctx =3D NULL;
> ++  ffmpegdec->pcache =3D NULL;
> ++  ffmpegdec->par =3D NULL;
> ++  ffmpegdec->opened =3D FALSE;
> ++  ffmpegdec->skip_frame =3D ffmpegdec->lowres =3D 0;
> ++  ffmpegdec->direct_rendering =3D DEFAULT_DIRECT_RENDERING;
> ++  ffmpegdec->do_padding =3D DEFAULT_DO_PADDING;
> ++  ffmpegdec->debug_mv =3D DEFAULT_DEBUG_MV;
> ++  ffmpegdec->crop =3D DEFAULT_CROP;
> ++  ffmpegdec->max_threads =3D DEFAULT_MAX_THREADS;
> ++
> ++  ffmpegdec->format.video.par_n =3D -1;
> ++  ffmpegdec->format.video.fps_n =3D -1;
> ++  ffmpegdec->format.video.old_fps_n =3D -1;
> ++  gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> ++
> ++  /* We initially assume downstream can allocate 16 bytes aligned buffe=
rs */
> ++  ffmpegdec->can_allocate_aligned =3D TRUE;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_finalize (GObject * object)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  if (ffmpegdec->context !=3D NULL) {
> ++    av_free (ffmpegdec->context);
> ++    ffmpegdec->context =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->picture !=3D NULL) {
> ++    av_free (ffmpegdec->picture);
> ++    ffmpegdec->picture =3D NULL;
> ++  }
> ++
> ++  G_OBJECT_CLASS (parent_class)->finalize (object);
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_query (GstPad * pad, GstQuery * query)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstPad *peer;
> ++  gboolean res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  res =3D FALSE;
> ++
> ++  if ((peer =3D gst_pad_get_peer (ffmpegdec->sinkpad))) {
> ++    /* just forward to peer */
> ++    res =3D gst_pad_query (peer, query);
> ++    gst_object_unref (peer);
> ++  }
> ++#if 0
> ++  {
> ++    GstFormat bfmt;
> ++
> ++    bfmt =3D GST_FORMAT_BYTES;
> ++
> ++    /* ok, do bitrate calc... */
> ++    if ((type !=3D GST_QUERY_POSITION && type !=3D GST_QUERY_TOTAL) ||
> ++        *fmt !=3D GST_FORMAT_TIME || ffmpegdec->context->bit_rate =3D=
=3D 0 ||
> ++        !gst_pad_query (peer, type, &bfmt, value))
> ++      return FALSE;
> ++
> ++    if (ffmpegdec->pcache && type =3D=3D GST_QUERY_POSITION)
> ++      *value -=3D GST_BUFFER_SIZE (ffmpegdec->pcache);
> ++    *value *=3D GST_SECOND / ffmpegdec->context->bit_rate;
> ++  }
> ++#endif
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return res;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_reset_ts (GstFFMpegDec * ffmpegdec)
> ++{
> ++  ffmpegdec->last_in =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->last_diff =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->last_frames =3D 0;
> ++  ffmpegdec->last_out =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->next_out =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->reordered_in =3D FALSE;
> ++  ffmpegdec->reordered_out =3D FALSE;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_update_qos (GstFFMpegDec * ffmpegdec, gdouble proportion,
> ++    GstClockTime timestamp)
> ++{
> ++  GST_LOG_OBJECT (ffmpegdec, "update QOS: %f, %" GST_TIME_FORMAT,
> ++      proportion, GST_TIME_ARGS (timestamp));
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++  ffmpegdec->proportion =3D proportion;
> ++  ffmpegdec->earliest_time =3D timestamp;
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_reset_qos (GstFFMpegDec * ffmpegdec)
> ++{
> ++  gst_ffmpegdec_update_qos (ffmpegdec, 0.5, GST_CLOCK_TIME_NONE);
> ++  ffmpegdec->processed =3D 0;
> ++  ffmpegdec->dropped =3D 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_read_qos (GstFFMpegDec * ffmpegdec, gdouble * proportion,
> ++    GstClockTime * timestamp)
> ++{
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++  *proportion =3D ffmpegdec->proportion;
> ++  *timestamp =3D ffmpegdec->earliest_time;
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_src_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  gboolean res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_QOS:
> ++    {
> ++      gdouble proportion;
> ++      GstClockTimeDiff diff;
> ++      GstClockTime timestamp;
> ++
> ++      gst_event_parse_qos (event, &proportion, &diff, &timestamp);
> ++
> ++      /* update our QoS values */
> ++      gst_ffmpegdec_update_qos (ffmpegdec, proportion, timestamp + diff=
);
> ++
> ++      /* forward upstream */
> ++      res =3D gst_pad_push_event (ffmpegdec->sinkpad, event);
> ++      break;
> ++    }
> ++    default:
> ++      /* forward upstream */
> ++      res =3D gst_pad_push_event (ffmpegdec->sinkpad, event);
> ++      break;
> ++  }
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return res;
> ++}
> ++
> ++/* with LOCK */
> ++static void
> ++gst_ffmpegdec_close (GstFFMpegDec * ffmpegdec)
> ++{
> ++  if (!ffmpegdec->opened)
> ++    return;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "closing ffmpeg codec");
> ++
> ++  if (ffmpegdec->par) {
> ++    g_free (ffmpegdec->par);
> ++    ffmpegdec->par =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->context->priv_data)
> ++    gst_ffmpeg_avcodec_close (ffmpegdec->context);
> ++  ffmpegdec->opened =3D FALSE;
> ++
> ++  if (ffmpegdec->context->extradata) {
> ++    av_free (ffmpegdec->context->extradata);
> ++    ffmpegdec->context->extradata =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->pctx) {
> ++    if (ffmpegdec->pcache) {
> ++      gst_buffer_unref (ffmpegdec->pcache);
> ++      ffmpegdec->pcache =3D NULL;
> ++    }
> ++    av_parser_close (ffmpegdec->pctx);
> ++    ffmpegdec->pctx =3D NULL;
> ++  }
> ++
> ++  ffmpegdec->format.video.par_n =3D -1;
> ++  ffmpegdec->format.video.fps_n =3D -1;
> ++  ffmpegdec->format.video.old_fps_n =3D -1;
> ++  ffmpegdec->format.video.interlaced =3D FALSE;
> ++}
> ++
> ++/* with LOCK */
> ++static gboolean
> ++gst_ffmpegdec_open (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  if (gst_ffmpeg_avcodec_open (ffmpegdec->context, oclass->in_plugin) <=
 0)
> ++    goto could_not_open;
> ++
> ++  ffmpegdec->opened =3D TRUE;
> ++  ffmpegdec->is_realvideo =3D FALSE;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "Opened ffmpeg codec %s, id %d",
> ++      oclass->in_plugin->name, oclass->in_plugin->id);
> ++
> ++  /* open a parser if we can */
> ++  switch (oclass->in_plugin->id) {
> ++    case CODEC_ID_MPEG4:
> ++    case CODEC_ID_MJPEG:
> ++    case CODEC_ID_VC1:
> ++      GST_LOG_OBJECT (ffmpegdec, "not using parser, blacklisted codec");
> ++      ffmpegdec->pctx =3D NULL;
> ++      break;
> ++    case CODEC_ID_H264:
> ++      /* For H264, only use a parser if there is no context data, if th=
ere is,=20
> ++       * we're talking AVC */
> ++      if (ffmpegdec->context->extradata_size =3D=3D 0) {
> ++        GST_LOG_OBJECT (ffmpegdec, "H264 with no extradata, creating pa=
rser");
> ++        ffmpegdec->pctx =3D av_parser_init (oclass->in_plugin->id);
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec,
> ++            "H264 with extradata implies framed data - not using parser=
");
> ++        ffmpegdec->pctx =3D NULL;
> ++      }
> ++      break;
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV40:
> ++      ffmpegdec->is_realvideo =3D TRUE;
> ++      break;
> ++    default:
> ++      if (!ffmpegdec->turnoff_parser) {
> ++        ffmpegdec->pctx =3D av_parser_init (oclass->in_plugin->id);
> ++        if (ffmpegdec->pctx)
> ++          GST_LOG_OBJECT (ffmpegdec, "Using parser %p", ffmpegdec->pctx=
);
> ++        else
> ++          GST_LOG_OBJECT (ffmpegdec, "No parser for codec");
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec, "Parser deactivated for format");
> ++      }
> ++      break;
> ++  }
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      ffmpegdec->format.video.width =3D 0;
> ++      ffmpegdec->format.video.height =3D 0;
> ++      ffmpegdec->format.video.clip_width =3D -1;
> ++      ffmpegdec->format.video.clip_height =3D -1;
> ++      ffmpegdec->format.video.pix_fmt =3D PIX_FMT_NB;
> ++      ffmpegdec->format.video.interlaced =3D FALSE;
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      ffmpegdec->format.audio.samplerate =3D 0;
> ++      ffmpegdec->format.audio.channels =3D 0;
> ++      ffmpegdec->format.audio.depth =3D 0;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  gst_ffmpegdec_reset_ts (ffmpegdec);
> ++  /* FIXME, reset_qos holds the LOCK */
> ++  ffmpegdec->proportion =3D 0.0;
> ++  ffmpegdec->earliest_time =3D -1;
> ++
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++could_not_open:
> ++  {
> ++    gst_ffmpegdec_close (ffmpegdec);
> ++    GST_DEBUG_OBJECT (ffmpegdec, "ffdec_%s: Failed to open FFMPEG codec=
",
> ++        oclass->in_plugin->name);
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_setcaps (GstPad * pad, GstCaps * caps)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstFFMpegDecClass *oclass;
> ++  GstStructure *structure;
> ++  const GValue *par;
> ++  const GValue *fps;
> ++  gboolean ret =3D TRUE;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) (gst_pad_get_parent (pad));
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  GST_DEBUG_OBJECT (pad, "setcaps called");
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++
> ++  /* stupid check for VC1 */
> ++  if ((oclass->in_plugin->id =3D=3D CODEC_ID_WMV3) ||
> ++      (oclass->in_plugin->id =3D=3D CODEC_ID_VC1))
> ++    oclass->in_plugin->id =3D gst_ffmpeg_caps_to_codecid (caps, NULL);
> ++
> ++  /* close old session */
> ++  if (ffmpegdec->opened) {
> ++    GST_OBJECT_UNLOCK (ffmpegdec);
> ++    gst_ffmpegdec_drain (ffmpegdec);
> ++    GST_OBJECT_LOCK (ffmpegdec);
> ++    gst_ffmpegdec_close (ffmpegdec);
> ++
> ++    /* and reset the defaults that were set when a context is created */
> ++    avcodec_get_context_defaults (ffmpegdec->context);
> ++  }
> ++
> ++  /* set buffer functions */
> ++  ffmpegdec->context->get_buffer =3D gst_ffmpegdec_get_buffer;
> ++  ffmpegdec->context->release_buffer =3D gst_ffmpegdec_release_buffer;
> ++  ffmpegdec->context->draw_horiz_band =3D NULL;
> ++
> ++  /* default is to let format decide if it needs a parser */
> ++  ffmpegdec->turnoff_parser =3D FALSE;
> ++
> ++  ffmpegdec->has_b_frames =3D FALSE;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "size %dx%d", ffmpegdec->context->width,
> ++      ffmpegdec->context->height);
> ++
> ++  /* get size and so */
> ++  gst_ffmpeg_caps_with_codecid (oclass->in_plugin->id,
> ++      oclass->in_plugin->type, caps, ffmpegdec->context);
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "size after %dx%d", ffmpegdec->context->wi=
dth,
> ++      ffmpegdec->context->height);
> ++
> ++  if (!ffmpegdec->context->time_base.den || !ffmpegdec->context->time_b=
ase.num) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "forcing 25/1 framerate");
> ++    ffmpegdec->context->time_base.num =3D 1;
> ++    ffmpegdec->context->time_base.den =3D 25;
> ++  }
> ++
> ++  /* get pixel aspect ratio if it's set */
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  par =3D gst_structure_get_value (structure, "pixel-aspect-ratio");
> ++  if (par) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "sink caps have pixel-aspect-ratio of =
%d:%d",
> ++        gst_value_get_fraction_numerator (par),
> ++        gst_value_get_fraction_denominator (par));
> ++    /* should be NULL */
> ++    if (ffmpegdec->par)
> ++      g_free (ffmpegdec->par);
> ++    ffmpegdec->par =3D g_new0 (GValue, 1);
> ++    gst_value_init_and_copy (ffmpegdec->par, par);
> ++  }
> ++
> ++  /* get the framerate from incoming caps. fps_n is set to -1 when
> ++   * there is no valid framerate */
> ++  fps =3D gst_structure_get_value (structure, "framerate");
> ++  if (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION (fps)) {
> ++    ffmpegdec->format.video.fps_n =3D gst_value_get_fraction_numerator =
(fps);
> ++    ffmpegdec->format.video.fps_d =3D gst_value_get_fraction_denominato=
r (fps);
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Using framerate %d/%d from incoming c=
aps",
> ++        ffmpegdec->format.video.fps_n, ffmpegdec->format.video.fps_d);
> ++  } else {
> ++    ffmpegdec->format.video.fps_n =3D -1;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Using framerate from codec");
> ++  }
> ++
> ++  /* figure out if we can use direct rendering */
> ++  ffmpegdec->current_dr =3D FALSE;
> ++  ffmpegdec->extra_ref =3D FALSE;
> ++  if (ffmpegdec->direct_rendering) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "trying to enable direct rendering");
> ++    if (oclass->in_plugin->capabilities & CODEC_CAP_DR1) {
> ++      if (oclass->in_plugin->id =3D=3D CODEC_ID_H264) {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "disable direct rendering setup fo=
r H264");
> ++        /* does not work, many stuff reads outside of the planes */
> ++        ffmpegdec->current_dr =3D FALSE;
> ++        ffmpegdec->extra_ref =3D TRUE;
> ++      } else if ((oclass->in_plugin->id =3D=3D CODEC_ID_SVQ1) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP5) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6F) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6A)) {
> ++        GST_DEBUG_OBJECT (ffmpegdec,
> ++            "disable direct rendering setup for broken stride support");
> ++        /* does not work, uses a incompatible stride. See #610613 */
> ++        ffmpegdec->current_dr =3D FALSE;
> ++        ffmpegdec->extra_ref =3D TRUE;
> ++      } else {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "enabled direct rendering");
> ++        ffmpegdec->current_dr =3D TRUE;
> ++      }
> ++    } else {
> ++      GST_DEBUG_OBJECT (ffmpegdec, "direct rendering not supported");
> ++    }
> ++  }
> ++  if (ffmpegdec->current_dr) {
> ++    /* do *not* draw edges when in direct rendering, for some reason it=
 draws
> ++     * outside of the memory. */
> ++    ffmpegdec->context->flags |=3D CODEC_FLAG_EMU_EDGE;
> ++  }
> ++
> ++  /* for AAC we only use av_parse if not on stream-format=3D=3Draw or =
=3D=3Dloas */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_AAC
> ++      || oclass->in_plugin->id =3D=3D CODEC_ID_AAC_LATM) {
> ++    const gchar *format =3D gst_structure_get_string (structure, "strea=
m-format");
> ++
> ++    if (format =3D=3D NULL || strcmp (format, "raw") =3D=3D 0) {
> ++      ffmpegdec->turnoff_parser =3D TRUE;
> ++    }
> ++  }
> ++
> ++  /* for FLAC, don't parse if it's already parsed */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_FLAC) {
> ++    if (gst_structure_has_field (structure, "streamheader"))
> ++      ffmpegdec->turnoff_parser =3D TRUE;
> ++  }
> ++
> ++  /* workaround encoder bugs */
> ++  ffmpegdec->context->workaround_bugs |=3D FF_BUG_AUTODETECT;
> ++  ffmpegdec->context->err_recognition =3D 1;
> ++
> ++  /* for slow cpus */
> ++  ffmpegdec->context->lowres =3D ffmpegdec->lowres;
> ++  ffmpegdec->context->skip_frame =3D ffmpegdec->skip_frame;
> ++
> ++  /* ffmpeg can draw motion vectors on top of the image (not every deco=
der
> ++   * supports it) */
> ++  ffmpegdec->context->debug_mv =3D ffmpegdec->debug_mv;
> ++
> ++  if (ffmpegdec->max_threads =3D=3D 0)
> ++    ffmpegdec->context->thread_count =3D gst_ffmpeg_auto_max_threads ();
> ++  else
> ++    ffmpegdec->context->thread_count =3D ffmpegdec->max_threads;
> ++
> ++  /* open codec - we don't select an output pix_fmt yet,
> ++   * simply because we don't know! We only get it
> ++   * during playback... */
> ++  if (!gst_ffmpegdec_open (ffmpegdec))
> ++    goto open_failed;
> ++
> ++  /* clipping region */
> ++  gst_structure_get_int (structure, "width",
> ++      &ffmpegdec->format.video.clip_width);
> ++  gst_structure_get_int (structure, "height",
> ++      &ffmpegdec->format.video.clip_height);
> ++
> ++  GST_DEBUG_OBJECT (pad, "clipping to %dx%d",
> ++      ffmpegdec->format.video.clip_width, ffmpegdec->format.video.clip_=
height);
> ++
> ++  /* take into account the lowres property */
> ++  if (ffmpegdec->format.video.clip_width !=3D -1)
> ++    ffmpegdec->format.video.clip_width >>=3D ffmpegdec->lowres;
> ++  if (ffmpegdec->format.video.clip_height !=3D -1)
> ++    ffmpegdec->format.video.clip_height >>=3D ffmpegdec->lowres;
> ++
> ++  GST_DEBUG_OBJECT (pad, "final clipping to %dx%d",
> ++      ffmpegdec->format.video.clip_width, ffmpegdec->format.video.clip_=
height);
> ++
> ++done:
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++open_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Failed to open");
> ++    if (ffmpegdec->par) {
> ++      g_free (ffmpegdec->par);
> ++      ffmpegdec->par =3D NULL;
> ++    }
> ++    ret =3D FALSE;
> ++    goto done;
> ++  }
> ++}
> ++
> ++static GstFlowReturn
> ++alloc_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf,
> ++    gint width, gint height)
> ++{
> ++  GstFlowReturn ret;
> ++  gint fsize;
> ++
> ++  ret =3D GST_FLOW_ERROR;
> ++  *outbuf =3D NULL;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "alloc output buffer");
> ++
> ++  /* see if we need renegotiation */
> ++  if (G_UNLIKELY (!gst_ffmpegdec_negotiate (ffmpegdec, FALSE)))
> ++    goto negotiate_failed;
> ++
> ++  /* get the size of the gstreamer output buffer given a
> ++   * width/height/format */
> ++  fsize =3D gst_ffmpeg_avpicture_get_size (ffmpegdec->context->pix_fmt,
> ++      width, height);
> ++
> ++  if (ffmpegdec->can_allocate_aligned) {
> ++    GST_LOG_OBJECT (ffmpegdec, "calling pad_alloc");
> ++    /* no pallete, we can use the buffer size to alloc */
> ++    ret =3D gst_pad_alloc_buffer_and_set_caps (ffmpegdec->srcpad,
> ++        GST_BUFFER_OFFSET_NONE, fsize,
> ++        GST_PAD_CAPS (ffmpegdec->srcpad), outbuf);
> ++    if (G_UNLIKELY (ret !=3D GST_FLOW_OK))
> ++      goto alloc_failed;
> ++
> ++    /* If buffer isn't 128-bit aligned, create a memaligned one ourselv=
es */
> ++    if (((uintptr_t) GST_BUFFER_DATA (*outbuf)) % 16) {
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Downstream can't allocate aligned buffers.");
> ++      ffmpegdec->can_allocate_aligned =3D FALSE;
> ++      gst_buffer_unref (*outbuf);
> ++      *outbuf =3D new_aligned_buffer (fsize, GST_PAD_CAPS (ffmpegdec->s=
rcpad));
> ++    }
> ++  } else {
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "not calling pad_alloc, we have a pallete or downstream can't g=
ive 16 byte aligned buffers.");
> ++    /* for paletted data we can't use pad_alloc_buffer(), because
> ++     * fsize contains the size of the palette, so the overall size
> ++     * is bigger than ffmpegcolorspace's unit size, which will
> ++     * prompt GstBaseTransform to complain endlessly ... */
> ++    *outbuf =3D new_aligned_buffer (fsize, GST_PAD_CAPS (ffmpegdec->src=
pad));
> ++    ret =3D GST_FLOW_OK;
> ++  }
> ++  /* set caps, we do this here because the buffer is still writable her=
e and we
> ++   * are sure to be negotiated */
> ++  gst_buffer_set_caps (*outbuf, GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++  return ret;
> ++
> ++  /* special cases */
> ++negotiate_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "negotiate failed");
> ++    return GST_FLOW_NOT_NEGOTIATED;
> ++  }
> ++alloc_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "pad_alloc failed %d (%s)", ret,
> ++        gst_flow_get_name (ret));
> ++    return ret;
> ++  }
> ++}
> ++
> ++static int
> ++gst_ffmpegdec_get_buffer (AVCodecContext * context, AVFrame * picture)
> ++{
> ++  GstBuffer *buf =3D NULL;
> ++  GstFFMpegDec *ffmpegdec;
> ++  gint width, height;
> ++  gint coded_width, coded_height;
> ++  gint res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) context->opaque;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "getting buffer");
> ++
> ++  /* apply the last info we have seen to this picture, when we get the
> ++   * picture back from ffmpeg we can use this to correctly timestamp th=
e output
> ++   * buffer */
> ++  picture->reordered_opaque =3D context->reordered_opaque;
> ++  /* make sure we don't free the buffer when it's not ours */
> ++  picture->opaque =3D NULL;
> ++
> ++  /* take width and height before clipping */
> ++  width =3D context->width;
> ++  height =3D context->height;
> ++  coded_width =3D context->coded_width;
> ++  coded_height =3D context->coded_height;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "dimension %dx%d, coded %dx%d", width, hei=
ght,
> ++      coded_width, coded_height);
> ++  if (!ffmpegdec->current_dr) {
> ++    GST_LOG_OBJECT (ffmpegdec, "direct rendering disabled, fallback all=
oc");
> ++    res =3D avcodec_default_get_buffer (context, picture);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "linsize %d %d %d", picture->linesize[0],
> ++        picture->linesize[1], picture->linesize[2]);
> ++    GST_LOG_OBJECT (ffmpegdec, "data %u %u %u", 0,
> ++        (guint) (picture->data[1] - picture->data[0]),
> ++        (guint) (picture->data[2] - picture->data[0]));
> ++    return res;
> ++  }
> ++
> ++  switch (context->codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      /* some ffmpeg video plugins don't see the point in setting codec=
_type ... */
> ++    case AVMEDIA_TYPE_UNKNOWN:
> ++    {
> ++      GstFlowReturn ret;
> ++      gint clip_width, clip_height;
> ++
> ++      /* take final clipped output size */
> ++      if ((clip_width =3D ffmpegdec->format.video.clip_width) =3D=3D -1)
> ++        clip_width =3D width;
> ++      if ((clip_height =3D ffmpegdec->format.video.clip_height) =3D=3D =
-1)
> ++        clip_height =3D height;
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "raw outsize %d/%d", width, height);
> ++
> ++      /* this is the size ffmpeg needs for the buffer */
> ++      avcodec_align_dimensions (context, &width, &height);
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "aligned outsize %d/%d, clip %d/%d",
> ++          width, height, clip_width, clip_height);
> ++
> ++      if (width !=3D clip_width || height !=3D clip_height) {
> ++        /* We can't alloc if we need to clip the output buffer later */
> ++        GST_LOG_OBJECT (ffmpegdec, "we need clipping, fallback alloc");
> ++        return avcodec_default_get_buffer (context, picture);
> ++      }
> ++
> ++      /* alloc with aligned dimensions for ffmpeg */
> ++      ret =3D alloc_output_buffer (ffmpegdec, &buf, width, height);
> ++      if (G_UNLIKELY (ret !=3D GST_FLOW_OK)) {
> ++        /* alloc default buffer when we can't get one from downstream */
> ++        GST_LOG_OBJECT (ffmpegdec, "alloc failed, fallback alloc");
> ++        return avcodec_default_get_buffer (context, picture);
> ++      }
> ++
> ++      /* copy the right pointers and strides in the picture object */
> ++      gst_ffmpeg_avpicture_fill ((AVPicture *) picture,
> ++          GST_BUFFER_DATA (buf), context->pix_fmt, width, height);
> ++      break;
> ++    }
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    default:
> ++      GST_ERROR_OBJECT (ffmpegdec,
> ++          "_get_buffer() should never get called for non-video buffers =
!");
> ++      g_assert_not_reached ();
> ++      break;
> ++  }
> ++
> ++  /* tell ffmpeg we own this buffer, tranfer the ref we have on the buf=
fer to
> ++   * the opaque data. */
> ++  picture->type =3D FF_BUFFER_TYPE_USER;
> ++  picture->opaque =3D buf;
> ++
> ++#ifdef EXTRA_REF
> ++  if (picture->reference !=3D 0 || ffmpegdec->extra_ref) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "adding extra ref");
> ++    gst_buffer_ref (buf);
> ++  }
> ++#endif
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "returned buffer %p", buf);
> ++
> ++  return 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_release_buffer (AVCodecContext * context, AVFrame * pictu=
re)
> ++{
> ++  gint i;
> ++  GstBuffer *buf;
> ++  GstFFMpegDec *ffmpegdec;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) context->opaque;
> ++
> ++  /* check if it was our buffer */
> ++  if (picture->opaque =3D=3D NULL) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "default release buffer");
> ++    avcodec_default_release_buffer (context, picture);
> ++    return;
> ++  }
> ++
> ++  /* we remove the opaque data now */
> ++  buf =3D GST_BUFFER_CAST (picture->opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "release buffer %p", buf);
> ++  picture->opaque =3D NULL;
> ++
> ++#ifdef EXTRA_REF
> ++  if (picture->reference !=3D 0 || ffmpegdec->extra_ref) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "remove extra ref");
> ++    gst_buffer_unref (buf);
> ++  }
> ++#else
> ++  gst_buffer_unref (buf);
> ++#endif
> ++
> ++  /* zero out the reference in ffmpeg */
> ++  for (i =3D 0; i < 4; i++) {
> ++    picture->data[i] =3D NULL;
> ++    picture->linesize[i] =3D 0;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_add_pixel_aspect_ratio (GstFFMpegDec * ffmpegdec,
> ++    GstStructure * s)
> ++{
> ++  gboolean demuxer_par_set =3D FALSE;
> ++  gboolean decoder_par_set =3D FALSE;
> ++  gint demuxer_num =3D 1, demuxer_denom =3D 1;
> ++  gint decoder_num =3D 1, decoder_denom =3D 1;
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++
> ++  if (ffmpegdec->par) {
> ++    demuxer_num =3D gst_value_get_fraction_numerator (ffmpegdec->par);
> ++    demuxer_denom =3D gst_value_get_fraction_denominator (ffmpegdec->pa=
r);
> ++    demuxer_par_set =3D TRUE;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Demuxer PAR: %d:%d", demuxer_num,
> ++        demuxer_denom);
> ++  }
> ++
> ++  if (ffmpegdec->context->sample_aspect_ratio.num &&
> ++      ffmpegdec->context->sample_aspect_ratio.den) {
> ++    decoder_num =3D ffmpegdec->context->sample_aspect_ratio.num;
> ++    decoder_denom =3D ffmpegdec->context->sample_aspect_ratio.den;
> ++    decoder_par_set =3D TRUE;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Decoder PAR: %d:%d", decoder_num,
> ++        decoder_denom);
> ++  }
> ++
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++
> ++  if (!demuxer_par_set && !decoder_par_set)
> ++    goto no_par;
> ++
> ++  if (demuxer_par_set && !decoder_par_set)
> ++    goto use_demuxer_par;
> ++
> ++  if (decoder_par_set && !demuxer_par_set)
> ++    goto use_decoder_par;
> ++
> ++  /* Both the demuxer and the decoder provide a PAR. If one of
> ++   * the two PARs is 1:1 and the other one is not, use the one
> ++   * that is not 1:1. */
> ++  if (demuxer_num =3D=3D demuxer_denom && decoder_num !=3D decoder_deno=
m)
> ++    goto use_decoder_par;
> ++
> ++  if (decoder_num =3D=3D decoder_denom && demuxer_num !=3D demuxer_deno=
m)
> ++    goto use_demuxer_par;
> ++
> ++  /* Both PARs are non-1:1, so use the PAR provided by the demuxer */
> ++  goto use_demuxer_par;
> ++
> ++use_decoder_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Setting decoder provided pixel-aspect-ratio of %u:%u", decoder=
_num,
> ++        decoder_denom);
> ++    gst_structure_set (s, "pixel-aspect-ratio", GST_TYPE_FRACTION, deco=
der_num,
> ++        decoder_denom, NULL);
> ++    return;
> ++  }
> ++
> ++use_demuxer_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Setting demuxer provided pixel-aspect-ratio of %u:%u", demuxer=
_num,
> ++        demuxer_denom);
> ++    gst_structure_set (s, "pixel-aspect-ratio", GST_TYPE_FRACTION, demu=
xer_num,
> ++        demuxer_denom, NULL);
> ++    return;
> ++  }
> ++no_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Neither demuxer nor codec provide a pixel-aspect-ratio");
> ++    return;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_negotiate (GstFFMpegDec * ffmpegdec, gboolean force)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++  GstCaps *caps;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      if (!force && ffmpegdec->format.video.width =3D=3D ffmpegdec->con=
text->width
> ++          && ffmpegdec->format.video.height =3D=3D ffmpegdec->context->=
height
> ++          && ffmpegdec->format.video.fps_n =3D=3D ffmpegdec->format.vid=
eo.old_fps_n
> ++          && ffmpegdec->format.video.fps_d =3D=3D ffmpegdec->format.vid=
eo.old_fps_d
> ++          && ffmpegdec->format.video.pix_fmt =3D=3D ffmpegdec->context-=
>pix_fmt
> ++          && ffmpegdec->format.video.par_n =3D=3D
> ++          ffmpegdec->context->sample_aspect_ratio.num
> ++          && ffmpegdec->format.video.par_d =3D=3D
> ++          ffmpegdec->context->sample_aspect_ratio.den)
> ++        return TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Renegotiating video from %dx%d@ %d:%d PAR %d/%d fps to %dx%d=
@ %d:%d PAR %d/%d fps",
> ++          ffmpegdec->format.video.width, ffmpegdec->format.video.height,
> ++          ffmpegdec->format.video.par_n, ffmpegdec->format.video.par_d,
> ++          ffmpegdec->format.video.old_fps_n, ffmpegdec->format.video.ol=
d_fps_n,
> ++          ffmpegdec->context->width, ffmpegdec->context->height,
> ++          ffmpegdec->context->sample_aspect_ratio.num,
> ++          ffmpegdec->context->sample_aspect_ratio.den,
> ++          ffmpegdec->format.video.fps_n, ffmpegdec->format.video.fps_d);
> ++      ffmpegdec->format.video.width =3D ffmpegdec->context->width;
> ++      ffmpegdec->format.video.height =3D ffmpegdec->context->height;
> ++      ffmpegdec->format.video.old_fps_n =3D ffmpegdec->format.video.fps=
_n;
> ++      ffmpegdec->format.video.old_fps_d =3D ffmpegdec->format.video.fps=
_d;
> ++      ffmpegdec->format.video.pix_fmt =3D ffmpegdec->context->pix_fmt;
> ++      ffmpegdec->format.video.par_n =3D
> ++          ffmpegdec->context->sample_aspect_ratio.num;
> ++      ffmpegdec->format.video.par_d =3D
> ++          ffmpegdec->context->sample_aspect_ratio.den;
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    {
> ++      gint depth =3D av_smp_format_depth (ffmpegdec->context->sample_fm=
t);
> ++      if (!force && ffmpegdec->format.audio.samplerate =3D=3D
> ++          ffmpegdec->context->sample_rate &&
> ++          ffmpegdec->format.audio.channels =3D=3D ffmpegdec->context->c=
hannels &&
> ++          ffmpegdec->format.audio.depth =3D=3D depth)
> ++        return TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Renegotiating audio from %dHz@%dchannels (%d) to %dHz@%dchan=
nels (%d)",
> ++          ffmpegdec->format.audio.samplerate, ffmpegdec->format.audio.c=
hannels,
> ++          ffmpegdec->format.audio.depth,
> ++          ffmpegdec->context->sample_rate, ffmpegdec->context->channels=
, depth);
> ++      ffmpegdec->format.audio.samplerate =3D ffmpegdec->context->sample=
_rate;
> ++      ffmpegdec->format.audio.channels =3D ffmpegdec->context->channels;
> ++      ffmpegdec->format.audio.depth =3D depth;
> ++    }
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  caps =3D gst_ffmpeg_codectype_to_caps (oclass->in_plugin->type,
> ++      ffmpegdec->context, oclass->in_plugin->id, FALSE);
> ++
> ++  if (caps =3D=3D NULL)
> ++    goto no_caps;
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++    {
> ++      gint width, height;
> ++      gboolean interlaced;
> ++
> ++      width =3D ffmpegdec->format.video.clip_width;
> ++      height =3D ffmpegdec->format.video.clip_height;
> ++      interlaced =3D ffmpegdec->format.video.interlaced;
> ++
> ++      if (width !=3D -1 && height !=3D -1) {
> ++        /* overwrite the output size with the dimension of the
> ++         * clipping region but only if they are smaller. */
> ++        if (width < ffmpegdec->context->width)
> ++          gst_caps_set_simple (caps, "width", G_TYPE_INT, width, NULL);
> ++        if (height < ffmpegdec->context->height)
> ++          gst_caps_set_simple (caps, "height", G_TYPE_INT, height, NULL=
);
> ++      }
> ++      gst_caps_set_simple (caps, "interlaced", G_TYPE_BOOLEAN, interlac=
ed,
> ++          NULL);
> ++
> ++      /* If a demuxer provided a framerate then use it (#313970) */
> ++      if (ffmpegdec->format.video.fps_n !=3D -1) {
> ++        gst_caps_set_simple (caps, "framerate",
> ++            GST_TYPE_FRACTION, ffmpegdec->format.video.fps_n,
> ++            ffmpegdec->format.video.fps_d, NULL);
> ++      }
> ++      gst_ffmpegdec_add_pixel_aspect_ratio (ffmpegdec,
> ++          gst_caps_get_structure (caps, 0));
> ++      break;
> ++    }
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    {
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  if (!gst_pad_set_caps (ffmpegdec->srcpad, caps))
> ++    goto caps_failed;
> ++
> ++  gst_caps_unref (caps);
> ++
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++no_caps:
> ++  {
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++    /* using internal ffmpeg snapshot */
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION,
> ++        ("Could not find GStreamer caps mapping for FFmpeg codec '%s'.",
> ++            oclass->in_plugin->name), (NULL));
> ++#else
> ++    /* using external ffmpeg */
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION,
> ++        ("Could not find GStreamer caps mapping for FFmpeg codec '%s', =
and "
> ++            "you are using an external libavcodec. This is most likely =
due to "
> ++            "a packaging problem and/or libavcodec having been upgraded=
 to a "
> ++            "version that is not compatible with this version of "
> ++            "gstreamer-ffmpeg. Make sure your gstreamer-ffmpeg and liba=
vcodec "
> ++            "packages come from the same source/repository.",
> ++            oclass->in_plugin->name), (NULL));
> ++#endif
> ++    return FALSE;
> ++  }
> ++caps_failed:
> ++  {
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION, (NULL),
> ++        ("Could not set caps for ffmpeg decoder (%s), not fixed?",
> ++            oclass->in_plugin->name));
> ++    gst_caps_unref (caps);
> ++
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++/* perform qos calculations before decoding the next frame.
> ++ *
> ++ * Sets the skip_frame flag and if things are really bad, skips to the =
next
> ++ * keyframe.
> ++ *=20
> ++ * Returns TRUE if the frame should be decoded, FALSE if the frame can =
be dropped
> ++ * entirely.
> ++ */
> ++static gboolean
> ++gst_ffmpegdec_do_qos (GstFFMpegDec * ffmpegdec, GstClockTime timestamp,
> ++    gboolean * mode_switch)
> ++{
> ++  GstClockTimeDiff diff;
> ++  gdouble proportion;
> ++  GstClockTime qostime, earliest_time;
> ++  gboolean res =3D TRUE;
> ++
> ++  *mode_switch =3D FALSE;
> ++
> ++  /* no timestamp, can't do QoS */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (timestamp)))
> ++    goto no_qos;
> ++
> ++  /* get latest QoS observation values */
> ++  gst_ffmpegdec_read_qos (ffmpegdec, &proportion, &earliest_time);
> ++
> ++  /* skip qos if we have no observation (yet) */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (earliest_time))) {
> ++    /* no skip_frame initialy */
> ++    ffmpegdec->context->skip_frame =3D AVDISCARD_DEFAULT;
> ++    goto no_qos;
> ++  }
> ++
> ++  /* qos is done on running time of the timestamp */
> ++  qostime =3D gst_segment_to_running_time (&ffmpegdec->segment, GST_FOR=
MAT_TIME,
> ++      timestamp);
> ++
> ++  /* timestamp can be out of segment, then we don't do QoS */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (qostime)))
> ++    goto no_qos;
> ++
> ++  /* see how our next timestamp relates to the latest qos timestamp. ne=
gative
> ++   * values mean we are early, positive values mean we are too late. */
> ++  diff =3D GST_CLOCK_DIFF (qostime, earliest_time);
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "QOS: qostime %" GST_TIME_FORMAT
> ++      ", earliest %" GST_TIME_FORMAT, GST_TIME_ARGS (qostime),
> ++      GST_TIME_ARGS (earliest_time));
> ++
> ++  /* if we using less than 40% of the available time, we can try to
> ++   * speed up again when we were slow. */
> ++  if (proportion < 0.4 && diff < 0) {
> ++    goto normal_mode;
> ++  } else {
> ++    if (diff >=3D 0) {
> ++      /* we're too slow, try to speed up */
> ++      /* switch to skip_frame mode */
> ++      goto skip_frame;
> ++    }
> ++  }
> ++
> ++no_qos:
> ++  ffmpegdec->processed++;
> ++  return TRUE;
> ++
> ++normal_mode:
> ++  {
> ++    if (ffmpegdec->context->skip_frame !=3D AVDISCARD_DEFAULT) {
> ++      ffmpegdec->context->skip_frame =3D AVDISCARD_DEFAULT;
> ++      *mode_switch =3D TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec, "QOS: normal mode %g < 0.4", proport=
ion);
> ++    }
> ++    ffmpegdec->processed++;
> ++    return TRUE;
> ++  }
> ++skip_frame:
> ++  {
> ++    if (ffmpegdec->context->skip_frame !=3D AVDISCARD_NONREF) {
> ++      ffmpegdec->context->skip_frame =3D AVDISCARD_NONREF;
> ++      *mode_switch =3D TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "QOS: hurry up, diff %" G_GINT64_FORMAT " >=3D 0", diff);
> ++    }
> ++    goto drop_qos;
> ++  }
> ++drop_qos:
> ++  {
> ++    GstClockTime stream_time, jitter;
> ++    GstMessage *qos_msg;
> ++
> ++    ffmpegdec->dropped++;
> ++    stream_time =3D
> ++        gst_segment_to_stream_time (&ffmpegdec->segment, GST_FORMAT_TIM=
E,
> ++        timestamp);
> ++    jitter =3D GST_CLOCK_DIFF (qostime, earliest_time);
> ++    qos_msg =3D
> ++        gst_message_new_qos (GST_OBJECT_CAST (ffmpegdec), FALSE, qostim=
e,
> ++        stream_time, timestamp, GST_CLOCK_TIME_NONE);
> ++    gst_message_set_qos_values (qos_msg, jitter, proportion, 1000000);
> ++    gst_message_set_qos_stats (qos_msg, GST_FORMAT_BUFFERS,
> ++        ffmpegdec->processed, ffmpegdec->dropped);
> ++    gst_element_post_message (GST_ELEMENT_CAST (ffmpegdec), qos_msg);
> ++
> ++    return res;
> ++  }
> ++}
> ++
> ++/* returns TRUE if buffer is within segment, else FALSE.
> ++ * if Buffer is on segment border, it's timestamp and duration will be =
clipped */
> ++static gboolean
> ++clip_video_buffer (GstFFMpegDec * dec, GstBuffer * buf, GstClockTime in=
_ts,
> ++    GstClockTime in_dur)
> ++{
> ++  gboolean res =3D TRUE;
> ++  gint64 cstart, cstop;
> ++  GstClockTime stop;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "timestamp:%" GST_TIME_FORMAT " , duration:%" GST_TIME_FORMAT,
> ++      GST_TIME_ARGS (in_ts), GST_TIME_ARGS (in_dur));
> ++
> ++  /* can't clip without TIME segment */
> ++  if (G_UNLIKELY (dec->segment.format !=3D GST_FORMAT_TIME))
> ++    goto beach;
> ++
> ++  /* we need a start time */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (in_ts)))
> ++    goto beach;
> ++
> ++  /* generate valid stop, if duration unknown, we have unknown stop */
> ++  stop =3D
> ++      GST_CLOCK_TIME_IS_VALID (in_dur) ? (in_ts + in_dur) : GST_CLOCK_T=
IME_NONE;
> ++
> ++  /* now clip */
> ++  res =3D
> ++      gst_segment_clip (&dec->segment, GST_FORMAT_TIME, in_ts, stop, &c=
start,
> ++      &cstop);
> ++  if (G_UNLIKELY (!res))
> ++    goto beach;
> ++
> ++  /* we're pretty sure the duration of this buffer is not till the end =
of this
> ++   * segment (which _clip will assume when the stop is -1) */
> ++  if (stop =3D=3D GST_CLOCK_TIME_NONE)
> ++    cstop =3D GST_CLOCK_TIME_NONE;
> ++
> ++  /* update timestamp and possibly duration if the clipped stop time is
> ++   * valid */
> ++  GST_BUFFER_TIMESTAMP (buf) =3D cstart;
> ++  if (GST_CLOCK_TIME_IS_VALID (cstop))
> ++    GST_BUFFER_DURATION (buf) =3D cstop - cstart;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "clipped timestamp:%" GST_TIME_FORMAT " , duration:%" GST_TIME_FO=
RMAT,
> ++      GST_TIME_ARGS (cstart), GST_TIME_ARGS (GST_BUFFER_DURATION (buf))=
);
> ++
> ++beach:
> ++  GST_LOG_OBJECT (dec, "%sdropping", (res ? "not " : ""));
> ++  return res;
> ++}
> ++
> ++
> ++/* get an outbuf buffer with the current picture */
> ++static GstFlowReturn
> ++get_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf)
> ++{
> ++  GstFlowReturn ret;
> ++
> ++  ret =3D GST_FLOW_OK;
> ++  *outbuf =3D NULL;
> ++
> ++  if (ffmpegdec->picture->opaque !=3D NULL) {
> ++    /* we allocated a picture already for ffmpeg to decode into, let's =
pick it
> ++     * up and use it now. */
> ++    *outbuf =3D (GstBuffer *) ffmpegdec->picture->opaque;
> ++    GST_LOG_OBJECT (ffmpegdec, "using opaque buffer %p", *outbuf);
> ++#ifndef EXTRA_REF
> ++    gst_buffer_ref (*outbuf);
> ++#endif
> ++  } else {
> ++    AVPicture pic, *outpic;
> ++    gint width, height;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "get output buffer");
> ++
> ++    /* figure out size of output buffer, this is the clipped output siz=
e because
> ++     * we will copy the picture into it but only when the clipping regi=
on is
> ++     * smaller than the actual picture size. */
> ++    if ((width =3D ffmpegdec->format.video.clip_width) =3D=3D -1)
> ++      width =3D ffmpegdec->context->width;
> ++    else if (width > ffmpegdec->context->width)
> ++      width =3D ffmpegdec->context->width;
> ++
> ++    if ((height =3D ffmpegdec->format.video.clip_height) =3D=3D -1)
> ++      height =3D ffmpegdec->context->height;
> ++    else if (height > ffmpegdec->context->height)
> ++      height =3D ffmpegdec->context->height;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "clip width %d/height %d", width, height=
);
> ++
> ++    ret =3D alloc_output_buffer (ffmpegdec, outbuf, width, height);
> ++    if (G_UNLIKELY (ret !=3D GST_FLOW_OK))
> ++      goto alloc_failed;
> ++
> ++    /* original ffmpeg code does not handle odd sizes correctly.
> ++     * This patched up version does */
> ++    gst_ffmpeg_avpicture_fill (&pic, GST_BUFFER_DATA (*outbuf),
> ++        ffmpegdec->context->pix_fmt, width, height);
> ++
> ++    outpic =3D (AVPicture *) ffmpegdec->picture;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "linsize %d %d %d", outpic->linesize[0],
> ++        outpic->linesize[1], outpic->linesize[2]);
> ++    GST_LOG_OBJECT (ffmpegdec, "data %u %u %u", 0,
> ++        (guint) (outpic->data[1] - outpic->data[0]),
> ++        (guint) (outpic->data[2] - outpic->data[0]));
> ++
> ++    av_picture_copy (&pic, outpic, ffmpegdec->context->pix_fmt, width, =
height);
> ++  }
> ++  ffmpegdec->picture->reordered_opaque =3D -1;
> ++
> ++  return ret;
> ++
> ++  /* special cases */
> ++alloc_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "pad_alloc failed");
> ++    return ret;
> ++  }
> ++}
> ++
> ++static void
> ++clear_queued (GstFFMpegDec * ffmpegdec)
> ++{
> ++  g_list_foreach (ffmpegdec->queued, (GFunc) gst_mini_object_unref, NUL=
L);
> ++  g_list_free (ffmpegdec->queued);
> ++  ffmpegdec->queued =3D NULL;
> ++}
> ++
> ++static GstFlowReturn
> ++flush_queued (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFlowReturn res =3D GST_FLOW_OK;
> ++
> ++  while (ffmpegdec->queued) {
> ++    GstBuffer *buf =3D GST_BUFFER_CAST (ffmpegdec->queued->data);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "pushing buffer %p, offset %"
> ++        G_GUINT64_FORMAT ", timestamp %"
> ++        GST_TIME_FORMAT ", duration %" GST_TIME_FORMAT, buf,
> ++        GST_BUFFER_OFFSET (buf),
> ++        GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)),
> ++        GST_TIME_ARGS (GST_BUFFER_DURATION (buf)));
> ++
> ++    /* iterate ouput queue an push downstream */
> ++    res =3D gst_pad_push (ffmpegdec->srcpad, buf);
> ++
> ++    ffmpegdec->queued =3D
> ++        g_list_delete_link (ffmpegdec->queued, ffmpegdec->queued);
> ++  }
> ++  return res;
> ++}
> ++
> ++static void
> ++gst_avpacket_init (AVPacket * packet, guint8 * data, guint size)
> ++{
> ++  memset (packet, 0, sizeof (AVPacket));
> ++  packet->data =3D data;
> ++  packet->size =3D size;
> ++}
> ++
> ++/* gst_ffmpegdec_[video|audio]_frame:
> ++ * ffmpegdec:
> ++ * data: pointer to the data to decode
> ++ * size: size of data in bytes
> ++ * in_timestamp: incoming timestamp.
> ++ * in_duration: incoming duration.
> ++ * in_offset: incoming offset (frame number).
> ++ * outbuf: outgoing buffer. Different from NULL ONLY if it contains dec=
oded data.
> ++ * ret: Return flow.
> ++ *
> ++ * Returns: number of bytes used in decoding. The check for successful =
decode is
> ++ *   outbuf being non-NULL.
> ++ */
> ++static gint
> ++gst_ffmpegdec_video_frame (GstFFMpegDec * ffmpegdec,
> ++    guint8 * data, guint size,
> ++    const GstTSInfo * dec_info, GstBuffer ** outbuf, GstFlowReturn * re=
t)
> ++{
> ++  gint len =3D -1;
> ++  gint have_data;
> ++  gboolean mode_switch;
> ++  gboolean decode;
> ++  gint skip_frame =3D AVDISCARD_DEFAULT;
> ++  GstClockTime out_timestamp, out_duration, out_pts;
> ++  gint64 out_offset;
> ++  const GstTSInfo *out_info;
> ++  AVPacket packet;
> ++
> ++  *ret =3D GST_FLOW_OK;
> ++  *outbuf =3D NULL;
> ++
> ++  ffmpegdec->context->opaque =3D ffmpegdec;
> ++
> ++  /* in case we skip frames */
> ++  ffmpegdec->picture->pict_type =3D -1;
> ++
> ++  /* run QoS code, we don't stop decoding the frame when we are late be=
cause
> ++   * else we might skip a reference frame */
> ++  decode =3D gst_ffmpegdec_do_qos (ffmpegdec, dec_info->timestamp, &mod=
e_switch);
> ++
> ++  if (ffmpegdec->is_realvideo && data !=3D NULL) {
> ++    gint slice_count;
> ++    gint i;
> ++
> ++    /* setup the slice table for realvideo */
> ++    if (ffmpegdec->context->slice_offset =3D=3D NULL)
> ++      ffmpegdec->context->slice_offset =3D g_malloc (sizeof (guint32) *=
 1000);
> ++
> ++    slice_count =3D (*data++) + 1;
> ++    ffmpegdec->context->slice_count =3D slice_count;
> ++
> ++    for (i =3D 0; i < slice_count; i++) {
> ++      data +=3D 4;
> ++      ffmpegdec->context->slice_offset[i] =3D GST_READ_UINT32_LE (data);
> ++      data +=3D 4;
> ++    }
> ++  }
> ++
> ++  if (!decode) {
> ++    /* no decoding needed, save previous skip_frame value and brutely s=
kip
> ++     * decoding everything */
> ++    skip_frame =3D ffmpegdec->context->skip_frame;
> ++    ffmpegdec->context->skip_frame =3D AVDISCARD_NONREF;
> ++  }
> ++
> ++  /* save reference to the timing info */
> ++  ffmpegdec->context->reordered_opaque =3D (gint64) dec_info->idx;
> ++  ffmpegdec->picture->reordered_opaque =3D (gint64) dec_info->idx;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "stored opaque values idx %d", dec_info-=
>idx);
> ++
> ++  /* now decode the frame */
> ++  gst_avpacket_init (&packet, data, size);
> ++  len =3D avcodec_decode_video2 (ffmpegdec->context,
> ++      ffmpegdec->picture, &have_data, &packet);
> ++
> ++  /* restore previous state */
> ++  if (!decode)
> ++    ffmpegdec->context->skip_frame =3D skip_frame;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "after decode: len %d, have_data %d",
> ++      len, have_data);
> ++
> ++  /* when we are in skip_frame mode, don't complain when ffmpeg returned
> ++   * no data because we told it to skip stuff. */
> ++  if (len < 0 && (mode_switch || ffmpegdec->context->skip_frame))
> ++    len =3D 0;
> ++
> ++  if (len > 0 && have_data <=3D 0 && (mode_switch
> ++          || ffmpegdec->context->skip_frame)) {
> ++    /* we consumed some bytes but nothing decoded and we are skipping f=
rames,
> ++     * disable the interpollation of DTS timestamps */
> ++    ffmpegdec->last_out =3D -1;
> ++  }
> ++
> ++  /* no data, we're done */
> ++  if (len < 0 || have_data <=3D 0)
> ++    goto beach;
> ++
> ++  /* get the output picture timing info again */
> ++  out_info =3D gst_ts_info_get (ffmpegdec, ffmpegdec->picture->reordere=
d_opaque);
> ++  out_pts =3D out_info->timestamp;
> ++  out_duration =3D out_info->duration;
> ++  out_offset =3D out_info->offset;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "pts %" G_GUINT64_FORMAT " duration %" G_GUINT64_FORMAT " offset =
%"
> ++      G_GINT64_FORMAT, out_pts, out_duration, out_offset);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: pts %" G_GUINT64_FORMAT,
> ++      (guint64) ffmpegdec->picture->pts);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: num %d",
> ++      ffmpegdec->picture->coded_picture_number);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: ref %d",
> ++      ffmpegdec->picture->reference);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: display %d",
> ++      ffmpegdec->picture->display_picture_number);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: opaque %p",
> ++      ffmpegdec->picture->opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: reordered opaque %" G_GUINT64_=
FORMAT,
> ++      (guint64) ffmpegdec->picture->reordered_opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "repeat_pict:%d",
> ++      ffmpegdec->picture->repeat_pict);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "interlaced_frame:%d",
> ++      ffmpegdec->picture->interlaced_frame);
> ++
> ++  if (G_UNLIKELY (ffmpegdec->picture->interlaced_frame !=3D
> ++          ffmpegdec->format.video.interlaced)) {
> ++    GST_WARNING ("Change in interlacing ! picture:%d, recorded:%d",
> ++        ffmpegdec->picture->interlaced_frame,
> ++        ffmpegdec->format.video.interlaced);
> ++    ffmpegdec->format.video.interlaced =3D ffmpegdec->picture->interlac=
ed_frame;
> ++    gst_ffmpegdec_negotiate (ffmpegdec, TRUE);
> ++  }
> ++
> ++  /* Whether a frame is interlaced or not is unknown at the time of
> ++     buffer allocation, so caps on the buffer in opaque will have
> ++     the previous frame's interlaced flag set. So if interlacedness
> ++     has changed since allocation, we update the buffer (if any)
> ++     caps now with the correct interlaced flag. */
> ++  if (ffmpegdec->picture->opaque !=3D NULL) {
> ++    GstBuffer *buffer =3D ffmpegdec->picture->opaque;
> ++    if (GST_BUFFER_CAPS (buffer) && GST_PAD_CAPS (ffmpegdec->srcpad)) {
> ++      GstStructure *s =3D gst_caps_get_structure (GST_BUFFER_CAPS (buff=
er), 0);
> ++      gboolean interlaced;
> ++      gboolean found =3D gst_structure_get_boolean (s, "interlaced", &i=
nterlaced);
> ++      if (!found || (!!interlaced !=3D !!ffmpegdec->format.video.interl=
aced)) {
> ++        GST_DEBUG_OBJECT (ffmpegdec,
> ++            "Buffer interlacing does not match pad, updating");
> ++        buffer =3D gst_buffer_make_metadata_writable (buffer);
> ++        gst_buffer_set_caps (buffer, GST_PAD_CAPS (ffmpegdec->srcpad));
> ++        ffmpegdec->picture->opaque =3D buffer;
> ++      }
> ++    }
> ++  }
> ++
> ++  /* check that the timestamps go upwards */
> ++  if (ffmpegdec->last_out !=3D -1 && ffmpegdec->last_out > out_pts) {
> ++    /* timestamps go backwards, this means frames were reordered and we=
 must
> ++     * be dealing with DTS as the buffer timestamps */
> ++    if (!ffmpegdec->reordered_out) {
> ++      GST_DEBUG_OBJECT (ffmpegdec, "detected reordered out timestamps");
> ++      ffmpegdec->reordered_out =3D TRUE;
> ++    }
> ++    if (ffmpegdec->reordered_in) {
> ++      /* we reset the input reordering here because we want to recover =
=66rom an
> ++       * occasionally wrong reordered input timestamp */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "assuming DTS input timestamps");
> ++      ffmpegdec->reordered_in =3D FALSE;
> ++    }
> ++  }
> ++
> ++  if (out_pts =3D=3D 0 && out_pts =3D=3D ffmpegdec->last_out) {
> ++    GST_LOG_OBJECT (ffmpegdec, "ffmpeg returns 0 timestamps, ignoring");
> ++    /* some codecs only output 0 timestamps, when that happens, make us=
 select an
> ++     * output timestamp based on the input timestamp. We do this by mak=
ing the
> ++     * ffmpeg timestamp and the interpollated next timestamp invalid. */
> ++    out_pts =3D -1;
> ++    ffmpegdec->next_out =3D -1;
> ++  } else
> ++    ffmpegdec->last_out =3D out_pts;
> ++
> ++  /* we assume DTS as input timestamps unless we see reordered input
> ++   * timestamps */
> ++  if (!ffmpegdec->reordered_in && ffmpegdec->reordered_out) {
> ++    /* PTS and DTS are the same for keyframes */
> ++    if (ffmpegdec->next_out !=3D -1) {
> ++      /* interpolate all timestamps except for keyframes, FIXME, this is
> ++       * wrong when QoS is active. */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "interpolate timestamps");
> ++      out_pts =3D -1;
> ++      out_offset =3D -1;
> ++    }
> ++  }
> ++
> ++  /* get a handle to the output buffer */
> ++  *ret =3D get_output_buffer (ffmpegdec, outbuf);
> ++  if (G_UNLIKELY (*ret !=3D GST_FLOW_OK))
> ++    goto no_output;
> ++
> ++  /*
> ++   * Timestamps:
> ++   *
> ++   *  1) Copy picture timestamp if valid
> ++   *  2) else interpolate from previous output timestamp
> ++   *  3) else copy input timestamp
> ++   */
> ++  out_timestamp =3D -1;
> ++  if (out_pts !=3D -1) {
> ++    /* Get (interpolated) timestamp from FFMPEG */
> ++    out_timestamp =3D (GstClockTime) out_pts;
> ++    GST_LOG_OBJECT (ffmpegdec, "using timestamp %" GST_TIME_FORMAT
> ++        " returned by ffmpeg", GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  if (!GST_CLOCK_TIME_IS_VALID (out_timestamp) && ffmpegdec->next_out !=
=3D -1) {
> ++    out_timestamp =3D ffmpegdec->next_out;
> ++    GST_LOG_OBJECT (ffmpegdec, "using next timestamp %" GST_TIME_FORMAT,
> ++        GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  if (!GST_CLOCK_TIME_IS_VALID (out_timestamp)) {
> ++    out_timestamp =3D dec_info->timestamp;
> ++    GST_LOG_OBJECT (ffmpegdec, "using in timestamp %" GST_TIME_FORMAT,
> ++        GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  GST_BUFFER_TIMESTAMP (*outbuf) =3D out_timestamp;
> ++
> ++  /*
> ++   * Offset:
> ++   *  0) Use stored input offset (from opaque)
> ++   *  1) Use value converted from timestamp if valid
> ++   *  2) Use input offset if valid
> ++   */
> ++  if (out_offset !=3D GST_BUFFER_OFFSET_NONE) {
> ++    /* out_offset already contains the offset from ts_info */
> ++    GST_LOG_OBJECT (ffmpegdec, "Using offset returned by ffmpeg");
> ++  } else if (out_timestamp !=3D GST_CLOCK_TIME_NONE) {
> ++    GstFormat out_fmt =3D GST_FORMAT_DEFAULT;
> ++    GST_LOG_OBJECT (ffmpegdec, "Using offset converted from timestamp");
> ++    /* FIXME, we should really remove this as it's not nice at all to do
> ++     * upstream queries for each frame to get the frame offset. We also=
 can't
> ++     * really remove this because it is the only way of setting frame o=
ffsets
> ++     * on outgoing buffers. We should have metadata so that the upstrea=
m peer
> ++     * can set a frame number on the encoded data. */
> ++    gst_pad_query_peer_convert (ffmpegdec->sinkpad,
> ++        GST_FORMAT_TIME, out_timestamp, &out_fmt, &out_offset);
> ++  } else if (dec_info->offset !=3D GST_BUFFER_OFFSET_NONE) {
> ++    /* FIXME, the input offset is input media specific and might not
> ++     * be the same for the output media. (byte offset as input, frame n=
umber
> ++     * as output, for example) */
> ++    GST_LOG_OBJECT (ffmpegdec, "using in_offset %" G_GINT64_FORMAT,
> ++        dec_info->offset);
> ++    out_offset =3D dec_info->offset;
> ++  } else {
> ++    GST_LOG_OBJECT (ffmpegdec, "no valid offset found");
> ++    out_offset =3D GST_BUFFER_OFFSET_NONE;
> ++  }
> ++  GST_BUFFER_OFFSET (*outbuf) =3D out_offset;
> ++
> ++  /*
> ++   * Duration:
> ++   *
> ++   *  1) Use reordered input duration if valid
> ++   *  2) Else use input duration
> ++   *  3) else use input framerate
> ++   *  4) else use ffmpeg framerate
> ++   */
> ++  if (GST_CLOCK_TIME_IS_VALID (out_duration)) {
> ++    /* We have a valid (reordered) duration */
> ++    GST_LOG_OBJECT (ffmpegdec, "Using duration returned by ffmpeg");
> ++  } else if (GST_CLOCK_TIME_IS_VALID (dec_info->duration)) {
> ++    GST_LOG_OBJECT (ffmpegdec, "using in_duration");
> ++    out_duration =3D dec_info->duration;
> ++  } else if (GST_CLOCK_TIME_IS_VALID (ffmpegdec->last_diff)) {
> ++    GST_LOG_OBJECT (ffmpegdec, "using last-diff");
> ++    out_duration =3D ffmpegdec->last_diff;
> ++  } else {
> ++    /* if we have an input framerate, use that */
> ++    if (ffmpegdec->format.video.fps_n !=3D -1 &&
> ++        (ffmpegdec->format.video.fps_n !=3D 1000 &&
> ++            ffmpegdec->format.video.fps_d !=3D 1)) {
> ++      GST_LOG_OBJECT (ffmpegdec, "using input framerate for duration");
> ++      out_duration =3D gst_util_uint64_scale_int (GST_SECOND,
> ++          ffmpegdec->format.video.fps_d, ffmpegdec->format.video.fps_n);
> ++    } else {
> ++      /* don't try to use the decoder's framerate when it seems a bit a=
bnormal,
> ++       * which we assume when den >=3D 1000... */
> ++      if (ffmpegdec->context->time_base.num !=3D 0 &&
> ++          (ffmpegdec->context->time_base.den > 0 &&
> ++              ffmpegdec->context->time_base.den < 1000)) {
> ++        GST_LOG_OBJECT (ffmpegdec, "using decoder's framerate for durat=
ion");
> ++        out_duration =3D gst_util_uint64_scale_int (GST_SECOND,
> ++            ffmpegdec->context->time_base.num *
> ++            ffmpegdec->context->ticks_per_frame,
> ++            ffmpegdec->context->time_base.den);
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec, "no valid duration found");
> ++      }
> ++    }
> ++  }
> ++
> ++  /* Take repeat_pict into account */
> ++  if (GST_CLOCK_TIME_IS_VALID (out_duration)) {
> ++    out_duration +=3D out_duration * ffmpegdec->picture->repeat_pict / =
2;
> ++  }
> ++  GST_BUFFER_DURATION (*outbuf) =3D out_duration;
> ++
> ++  if (out_timestamp !=3D -1 && out_duration !=3D -1 && out_duration !=
=3D 0)
> ++    ffmpegdec->next_out =3D out_timestamp + out_duration;
> ++  else
> ++    ffmpegdec->next_out =3D -1;
> ++
> ++  /* now see if we need to clip the buffer against the segment boundari=
es. */
> ++  if (G_UNLIKELY (!clip_video_buffer (ffmpegdec, *outbuf, out_timestamp,
> ++              out_duration)))
> ++    goto clipped;
> ++
> ++  if (ffmpegdec->picture->top_field_first)
> ++    GST_BUFFER_FLAG_SET (*outbuf, GST_VIDEO_BUFFER_TFF);
> ++
> ++
> ++beach:
> ++  GST_DEBUG_OBJECT (ffmpegdec, "return flow %d, out %p, len %d",
> ++      *ret, *outbuf, len);
> ++  return len;
> ++
> ++  /* special cases */
> ++no_output:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "no output buffer");
> ++    len =3D -1;
> ++    goto beach;
> ++  }
> ++clipped:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "buffer clipped");
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++    goto beach;
> ++  }
> ++}
> ++
> ++/* returns TRUE if buffer is within segment, else FALSE.
> ++ * if Buffer is on segment border, it's timestamp and duration will be =
clipped */
> ++static gboolean
> ++clip_audio_buffer (GstFFMpegDec * dec, GstBuffer * buf, GstClockTime in=
_ts,
> ++    GstClockTime in_dur)
> ++{
> ++  GstClockTime stop;
> ++  gint64 diff, ctime, cstop;
> ++  gboolean res =3D TRUE;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "timestamp:%" GST_TIME_FORMAT ", duration:%" GST_TIME_FORMAT
> ++      ", size %u", GST_TIME_ARGS (in_ts), GST_TIME_ARGS (in_dur),
> ++      GST_BUFFER_SIZE (buf));
> ++
> ++  /* can't clip without TIME segment */
> ++  if (G_UNLIKELY (dec->segment.format !=3D GST_FORMAT_TIME))
> ++    goto beach;
> ++
> ++  /* we need a start time */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (in_ts)))
> ++    goto beach;
> ++
> ++  /* trust duration */
> ++  stop =3D in_ts + in_dur;
> ++
> ++  res =3D gst_segment_clip (&dec->segment, GST_FORMAT_TIME, in_ts, stop=
, &ctime,
> ++      &cstop);
> ++  if (G_UNLIKELY (!res))
> ++    goto out_of_segment;
> ++
> ++  /* see if some clipping happened */
> ++  if (G_UNLIKELY ((diff =3D ctime - in_ts) > 0)) {
> ++    /* bring clipped time to bytes */
> ++    diff =3D
> ++        gst_util_uint64_scale_int (diff, dec->format.audio.samplerate,
> ++        GST_SECOND) * (dec->format.audio.depth * dec->format.audio.chan=
nels);
> ++
> ++    GST_DEBUG_OBJECT (dec, "clipping start to %" GST_TIME_FORMAT " %"
> ++        G_GINT64_FORMAT " bytes", GST_TIME_ARGS (ctime), diff);
> ++
> ++    GST_BUFFER_SIZE (buf) -=3D diff;
> ++    GST_BUFFER_DATA (buf) +=3D diff;
> ++  }
> ++  if (G_UNLIKELY ((diff =3D stop - cstop) > 0)) {
> ++    /* bring clipped time to bytes */
> ++    diff =3D
> ++        gst_util_uint64_scale_int (diff, dec->format.audio.samplerate,
> ++        GST_SECOND) * (dec->format.audio.depth * dec->format.audio.chan=
nels);
> ++
> ++    GST_DEBUG_OBJECT (dec, "clipping stop to %" GST_TIME_FORMAT " %"
> ++        G_GINT64_FORMAT " bytes", GST_TIME_ARGS (cstop), diff);
> ++
> ++    GST_BUFFER_SIZE (buf) -=3D diff;
> ++  }
> ++  GST_BUFFER_TIMESTAMP (buf) =3D ctime;
> ++  GST_BUFFER_DURATION (buf) =3D cstop - ctime;
> ++
> ++beach:
> ++  GST_LOG_OBJECT (dec, "%sdropping", (res ? "not " : ""));
> ++  return res;
> ++
> ++  /* ERRORS */
> ++out_of_segment:
> ++  {
> ++    GST_LOG_OBJECT (dec, "out of segment");
> ++    goto beach;
> ++  }
> ++}
> ++
> ++static gint
> ++gst_ffmpegdec_audio_frame (GstFFMpegDec * ffmpegdec,
> ++    AVCodec * in_plugin, guint8 * data, guint size,
> ++    const GstTSInfo * dec_info, GstBuffer ** outbuf, GstFlowReturn * re=
t)
> ++{
> ++  gint len =3D -1;
> ++  gint have_data =3D AVCODEC_MAX_AUDIO_FRAME_SIZE;
> ++  GstClockTime out_timestamp, out_duration;
> ++  gint64 out_offset;
> ++  AVPacket packet;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "size:%d, offset:%" G_GINT64_FORMAT ", ts:%" GST_TIME_FORMAT ", d=
ur:%"
> ++      GST_TIME_FORMAT ", ffmpegdec->next_out:%" GST_TIME_FORMAT, size,
> ++      dec_info->offset, GST_TIME_ARGS (dec_info->timestamp),
> ++      GST_TIME_ARGS (dec_info->duration), GST_TIME_ARGS (ffmpegdec->nex=
t_out));
> ++
> ++  *outbuf =3D
> ++      new_aligned_buffer (AVCODEC_MAX_AUDIO_FRAME_SIZE,
> ++      GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++  gst_avpacket_init (&packet, data, size);
> ++  len =3D avcodec_decode_audio3 (ffmpegdec->context,
> ++      (int16_t *) GST_BUFFER_DATA (*outbuf), &have_data, &packet);
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "Decode audio: len=3D%d, have_data=3D%d", len, have_data);
> ++
> ++  if (len >=3D 0 && have_data > 0) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Creating output buffer");
> ++    if (!gst_ffmpegdec_negotiate (ffmpegdec, FALSE)) {
> ++      gst_buffer_unref (*outbuf);
> ++      *outbuf =3D NULL;
> ++      len =3D -1;
> ++      goto beach;
> ++    }
> ++
> ++    /* Buffer size */
> ++    GST_BUFFER_SIZE (*outbuf) =3D have_data;
> ++
> ++    /*
> ++     * Timestamps:
> ++     *
> ++     *  1) Copy input timestamp if valid
> ++     *  2) else interpolate from previous input timestamp
> ++     */
> ++    /* always take timestamps from the input buffer if any */
> ++    if (GST_CLOCK_TIME_IS_VALID (dec_info->timestamp)) {
> ++      out_timestamp =3D dec_info->timestamp;
> ++    } else {
> ++      out_timestamp =3D ffmpegdec->next_out;
> ++    }
> ++
> ++    /*
> ++     * Duration:
> ++     *
> ++     *  1) calculate based on number of samples
> ++     */
> ++    out_duration =3D gst_util_uint64_scale (have_data, GST_SECOND,
> ++        ffmpegdec->format.audio.depth * ffmpegdec->format.audio.channel=
s *
> ++        ffmpegdec->format.audio.samplerate);
> ++
> ++    /* offset:
> ++     *
> ++     * Just copy
> ++     */
> ++    out_offset =3D dec_info->offset;
> ++
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Buffer created. Size:%d , timestamp:%" GST_TIME_FORMAT " , dur=
ation:%"
> ++        GST_TIME_FORMAT, have_data,
> ++        GST_TIME_ARGS (out_timestamp), GST_TIME_ARGS (out_duration));
> ++
> ++    GST_BUFFER_TIMESTAMP (*outbuf) =3D out_timestamp;
> ++    GST_BUFFER_DURATION (*outbuf) =3D out_duration;
> ++    GST_BUFFER_OFFSET (*outbuf) =3D out_offset;
> ++    gst_buffer_set_caps (*outbuf, GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++    /* the next timestamp we'll use when interpolating */
> ++    if (GST_CLOCK_TIME_IS_VALID (out_timestamp))
> ++      ffmpegdec->next_out =3D out_timestamp + out_duration;
> ++
> ++    /* now see if we need to clip the buffer against the segment bounda=
ries. */
> ++    if (G_UNLIKELY (!clip_audio_buffer (ffmpegdec, *outbuf, out_timesta=
mp,
> ++                out_duration)))
> ++      goto clipped;
> ++
> ++  } else {
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++  }
> ++
> ++  /* If we don't error out after the first failed read with the AAC dec=
oder,
> ++   * we must *not* carry on pushing data, else we'll cause segfaults...=
 */
> ++  if (len =3D=3D -1 && (in_plugin->id =3D=3D CODEC_ID_AAC
> ++          || in_plugin->id =3D=3D CODEC_ID_AAC_LATM)) {
> ++    GST_ELEMENT_ERROR (ffmpegdec, STREAM, DECODE, (NULL),
> ++        ("Decoding of AAC stream by FFMPEG failed."));
> ++    *ret =3D GST_FLOW_ERROR;
> ++  }
> ++
> ++beach:
> ++  GST_DEBUG_OBJECT (ffmpegdec, "return flow %d, out %p, len %d",
> ++      *ret, *outbuf, len);
> ++  return len;
> ++
> ++  /* ERRORS */
> ++clipped:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "buffer clipped");
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++    goto beach;
> ++  }
> ++}
> ++
> ++/* gst_ffmpegdec_frame:
> ++ * ffmpegdec:
> ++ * data: pointer to the data to decode
> ++ * size: size of data in bytes
> ++ * got_data: 0 if no data was decoded, !=3D 0 otherwise.
> ++ * in_time: timestamp of data
> ++ * in_duration: duration of data
> ++ * ret: GstFlowReturn to return in the chain function
> ++ *
> ++ * Decode the given frame and pushes it downstream.
> ++ *
> ++ * Returns: Number of bytes used in decoding, -1 on error/failure.
> ++ */
> ++
> ++static gint
> ++gst_ffmpegdec_frame (GstFFMpegDec * ffmpegdec,
> ++    guint8 * data, guint size, gint * got_data, const GstTSInfo * dec_i=
nfo,
> ++    GstFlowReturn * ret)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++  GstBuffer *outbuf =3D NULL;
> ++  gint have_data =3D 0, len =3D 0;
> ++
> ++  if (G_UNLIKELY (ffmpegdec->context->codec =3D=3D NULL))
> ++    goto no_codec;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "data:%p, size:%d, id:%d", data, size,
> ++      dec_info->idx);
> ++
> ++  *ret =3D GST_FLOW_OK;
> ++  ffmpegdec->context->frame_number++;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      len =3D
> ++          gst_ffmpegdec_video_frame (ffmpegdec, data, size, dec_info, &=
outbuf,
> ++          ret);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      len =3D
> ++          gst_ffmpegdec_audio_frame (ffmpegdec, oclass->in_plugin, data=
, size,
> ++          dec_info, &outbuf, ret);
> ++
> ++      /* if we did not get an output buffer and we have a pending disco=
nt, don't
> ++       * clear the input timestamps, we will put them on the next buffe=
r because
> ++       * else we might create the first buffer with a very big timestam=
p gap. */
> ++      if (outbuf =3D=3D NULL && ffmpegdec->discont) {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "no buffer but keeping timestamp");
> ++        ffmpegdec->clear_ts =3D FALSE;
> ++      }
> ++      break;
> ++    default:
> ++      GST_ERROR_OBJECT (ffmpegdec, "Asked to decode non-audio/video fra=
me !");
> ++      g_assert_not_reached ();
> ++      break;
> ++  }
> ++
> ++  if (outbuf)
> ++    have_data =3D 1;
> ++
> ++  if (len < 0 || have_data < 0) {
> ++    GST_WARNING_OBJECT (ffmpegdec,
> ++        "ffdec_%s: decoding error (len: %d, have_data: %d)",
> ++        oclass->in_plugin->name, len, have_data);
> ++    *got_data =3D 0;
> ++    goto beach;
> ++  } else if (len =3D=3D 0 && have_data =3D=3D 0) {
> ++    *got_data =3D 0;
> ++    goto beach;
> ++  } else {
> ++    /* this is where I lost my last clue on ffmpeg... */
> ++    *got_data =3D 1;
> ++  }
> ++
> ++  if (outbuf) {
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "Decoded data, now pushing buffer %p with offset %" G_GINT64_FO=
RMAT
> ++        ", timestamp %" GST_TIME_FORMAT " and duration %" GST_TIME_FORM=
AT,
> ++        outbuf, GST_BUFFER_OFFSET (outbuf),
> ++        GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (outbuf)),
> ++        GST_TIME_ARGS (GST_BUFFER_DURATION (outbuf)));
> ++
> ++    /* mark pending discont */
> ++    if (ffmpegdec->discont) {
> ++      GST_BUFFER_FLAG_SET (outbuf, GST_BUFFER_FLAG_DISCONT);
> ++      ffmpegdec->discont =3D FALSE;
> ++    }
> ++
> ++    if (ffmpegdec->segment.rate > 0.0) {
> ++      /* and off we go */
> ++      *ret =3D gst_pad_push (ffmpegdec->srcpad, outbuf);
> ++    } else {
> ++      /* reverse playback, queue frame till later when we get a discont=
=2E */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "queued frame");
> ++      ffmpegdec->queued =3D g_list_prepend (ffmpegdec->queued, outbuf);
> ++      *ret =3D GST_FLOW_OK;
> ++    }
> ++  } else {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "We didn't get a decoded buffer");
> ++  }
> ++
> ++beach:
> ++  return len;
> ++
> ++  /* ERRORS */
> ++no_codec:
> ++  {
> ++    GST_ERROR_OBJECT (ffmpegdec, "no codec context");
> ++    return -1;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_drain (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  if (oclass->in_plugin->capabilities & CODEC_CAP_DELAY) {
> ++    gint have_data, len, try =3D 0;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "codec has delay capabilities, calling until ffmpeg has drained=
 everything");
> ++
> ++    do {
> ++      GstFlowReturn ret;
> ++
> ++      len =3D
> ++          gst_ffmpegdec_frame (ffmpegdec, NULL, 0, &have_data, &ts_info=
_none,
> ++          &ret);
> ++      if (len < 0 || have_data =3D=3D 0)
> ++        break;
> ++    } while (try++ < 10);
> ++  }
> ++  if (ffmpegdec->segment.rate < 0.0) {
> ++    /* if we have some queued frames for reverse playback, flush them n=
ow */
> ++    flush_queued (ffmpegdec);
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_flush_pcache (GstFFMpegDec * ffmpegdec)
> ++{
> ++  if (ffmpegdec->pctx) {
> ++    gint size, bsize;
> ++    guint8 *data;
> ++    guint8 bdata[FF_INPUT_BUFFER_PADDING_SIZE];
> ++
> ++    bsize =3D FF_INPUT_BUFFER_PADDING_SIZE;
> ++    memset (bdata, 0, bsize);
> ++
> ++    /* parse some dummy data to work around some ffmpeg weirdness where=
 it keeps
> ++     * the previous pts around */
> ++    av_parser_parse2 (ffmpegdec->pctx, ffmpegdec->context,
> ++        &data, &size, bdata, bsize, -1, -1, -1);
> ++    ffmpegdec->pctx->pts =3D -1;
> ++    ffmpegdec->pctx->dts =3D -1;
> ++  }
> ++
> ++  if (ffmpegdec->pcache) {
> ++    gst_buffer_unref (ffmpegdec->pcache);
> ++    ffmpegdec->pcache =3D NULL;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_sink_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  gboolean ret =3D FALSE;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "Handling %s event",
> ++      GST_EVENT_TYPE_NAME (event));
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_EOS:
> ++    {
> ++      gst_ffmpegdec_drain (ffmpegdec);
> ++      break;
> ++    }
> ++    case GST_EVENT_FLUSH_STOP:
> ++    {
> ++      if (ffmpegdec->opened) {
> ++        avcodec_flush_buffers (ffmpegdec->context);
> ++      }
> ++      gst_ffmpegdec_reset_ts (ffmpegdec);
> ++      gst_ffmpegdec_reset_qos (ffmpegdec);
> ++      gst_ffmpegdec_flush_pcache (ffmpegdec);
> ++      gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> ++      clear_queued (ffmpegdec);
> ++      break;
> ++    }
> ++    case GST_EVENT_NEWSEGMENT:
> ++    {
> ++      gboolean update;
> ++      GstFormat fmt;
> ++      gint64 start, stop, time;
> ++      gdouble rate, arate;
> ++
> ++      gst_event_parse_new_segment_full (event, &update, &rate, &arate, =
&fmt,
> ++          &start, &stop, &time);
> ++
> ++      switch (fmt) {
> ++        case GST_FORMAT_TIME:
> ++          /* fine, our native segment format */
> ++          break;
> ++        case GST_FORMAT_BYTES:
> ++        {
> ++          gint bit_rate;
> ++
> ++          bit_rate =3D ffmpegdec->context->bit_rate;
> ++
> ++          /* convert to time or fail */
> ++          if (!bit_rate)
> ++            goto no_bitrate;
> ++
> ++          GST_DEBUG_OBJECT (ffmpegdec, "bitrate: %d", bit_rate);
> ++
> ++          /* convert values to TIME */
> ++          if (start !=3D -1)
> ++            start =3D gst_util_uint64_scale_int (start, GST_SECOND, bit=
_rate);
> ++          if (stop !=3D -1)
> ++            stop =3D gst_util_uint64_scale_int (stop, GST_SECOND, bit_r=
ate);
> ++          if (time !=3D -1)
> ++            time =3D gst_util_uint64_scale_int (time, GST_SECOND, bit_r=
ate);
> ++
> ++          /* unref old event */
> ++          gst_event_unref (event);
> ++
> ++          /* create new converted time segment */
> ++          fmt =3D GST_FORMAT_TIME;
> ++          /* FIXME, bitrate is not good enough too find a good stop, le=
t's
> ++           * hope start and time were 0... meh. */
> ++          stop =3D -1;
> ++          event =3D gst_event_new_new_segment (update, rate, fmt,
> ++              start, stop, time);
> ++          break;
> ++        }
> ++        default:
> ++          /* invalid format */
> ++          goto invalid_format;
> ++      }
> ++
> ++      /* drain pending frames before trying to use the new segment, que=
ued
> ++       * buffers belonged to the previous segment. */
> ++      if (ffmpegdec->context->codec)
> ++        gst_ffmpegdec_drain (ffmpegdec);
> ++
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "NEWSEGMENT in time start %" GST_TIME_FORMAT " -- stop %"
> ++          GST_TIME_FORMAT, GST_TIME_ARGS (start), GST_TIME_ARGS (stop));
> ++
> ++      /* and store the values */
> ++      gst_segment_set_newsegment_full (&ffmpegdec->segment, update,
> ++          rate, arate, fmt, start, stop, time);
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* and push segment downstream */
> ++  ret =3D gst_pad_push_event (ffmpegdec->srcpad, event);
> ++
> ++done:
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++no_bitrate:
> ++  {
> ++    GST_WARNING_OBJECT (ffmpegdec, "no bitrate to convert BYTES to TIME=
");
> ++    gst_event_unref (event);
> ++    goto done;
> ++  }
> ++invalid_format:
> ++  {
> ++    GST_WARNING_OBJECT (ffmpegdec, "unknown format received in NEWSEGME=
NT");
> ++    gst_event_unref (event);
> ++    goto done;
> ++  }
> ++}
> ++
> ++static GstFlowReturn
> ++gst_ffmpegdec_chain (GstPad * pad, GstBuffer * inbuf)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstFFMpegDecClass *oclass;
> ++  guint8 *data, *bdata;
> ++  gint size, bsize, len, have_data;
> ++  GstFlowReturn ret =3D GST_FLOW_OK;
> ++  GstClockTime in_timestamp;
> ++  GstClockTime in_duration;
> ++  gboolean discont;
> ++  gint64 in_offset;
> ++  const GstTSInfo *in_info;
> ++  const GstTSInfo *dec_info;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) (GST_PAD_PARENT (pad));
> ++
> ++  if (G_UNLIKELY (!ffmpegdec->opened))
> ++    goto not_negotiated;
> ++
> ++  discont =3D GST_BUFFER_IS_DISCONT (inbuf);
> ++
> ++  /* The discont flags marks a buffer that is not continuous with the p=
revious
> ++   * buffer. This means we need to clear whatever data we currently hav=
e. We
> ++   * currently also wait for a new keyframe, which might be suboptimal =
in the
> ++   * case of a network error, better show the errors than to drop all d=
ata.. */
> ++  if (G_UNLIKELY (discont)) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "received DISCONT");
> ++    /* drain what we have queued */
> ++    gst_ffmpegdec_drain (ffmpegdec);
> ++    gst_ffmpegdec_flush_pcache (ffmpegdec);
> ++    avcodec_flush_buffers (ffmpegdec->context);
> ++    ffmpegdec->discont =3D TRUE;
> ++    gst_ffmpegdec_reset_ts (ffmpegdec);
> ++  }
> ++  /* by default we clear the input timestamp after decoding each frame =
so that
> ++   * interpollation can work. */
> ++  ffmpegdec->clear_ts =3D TRUE;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  /* parse cache joining. If there is cached data */
> ++  if (ffmpegdec->pcache) {
> ++    /* join with previous data */
> ++    GST_LOG_OBJECT (ffmpegdec, "join parse cache");
> ++    inbuf =3D gst_buffer_join (ffmpegdec->pcache, inbuf);
> ++    /* no more cached data, we assume we can consume the complete cache=
 */
> ++    ffmpegdec->pcache =3D NULL;
> ++  }
> ++
> ++  in_timestamp =3D GST_BUFFER_TIMESTAMP (inbuf);
> ++  in_duration =3D GST_BUFFER_DURATION (inbuf);
> ++  in_offset =3D GST_BUFFER_OFFSET (inbuf);
> ++
> ++  /* get handle to timestamp info, we can pass this around to ffmpeg */
> ++  in_info =3D gst_ts_info_store (ffmpegdec, in_timestamp, in_duration, =
in_offset);
> ++
> ++  if (in_timestamp !=3D -1) {
> ++    /* check for increasing timestamps if they are jumping backwards, we
> ++     * probably are dealing with PTS as timestamps */
> ++    if (!ffmpegdec->reordered_in && ffmpegdec->last_in !=3D -1) {
> ++      if (in_timestamp < ffmpegdec->last_in) {
> ++        GST_LOG_OBJECT (ffmpegdec, "detected reordered input timestamps=
");
> ++        ffmpegdec->reordered_in =3D TRUE;
> ++        ffmpegdec->last_diff =3D GST_CLOCK_TIME_NONE;
> ++      } else if (in_timestamp > ffmpegdec->last_in) {
> ++        GstClockTime diff;
> ++        /* keep track of timestamp diff to estimate duration */
> ++        diff =3D in_timestamp - ffmpegdec->last_in;
> ++        /* need to scale with amount of frames in the interval */
> ++        if (ffmpegdec->last_frames)
> ++          diff /=3D ffmpegdec->last_frames;
> ++
> ++        GST_LOG_OBJECT (ffmpegdec, "estimated duration %" GST_TIME_FORM=
AT " %u",
> ++            GST_TIME_ARGS (diff), ffmpegdec->last_frames);
> ++
> ++        ffmpegdec->last_diff =3D diff;
> ++      }
> ++    }
> ++    ffmpegdec->last_in =3D in_timestamp;
> ++    ffmpegdec->last_frames =3D 0;
> ++  }
> ++
> ++  GST_LOG_OBJECT (ffmpegdec,
> ++      "Received new data of size %u, offset:%" G_GUINT64_FORMAT ", ts:%"
> ++      GST_TIME_FORMAT ", dur:%" GST_TIME_FORMAT ", info %d",
> ++      GST_BUFFER_SIZE (inbuf), GST_BUFFER_OFFSET (inbuf),
> ++      GST_TIME_ARGS (in_timestamp), GST_TIME_ARGS (in_duration), in_inf=
o->idx);
> ++
> ++  /* workarounds, functions write to buffers:
> ++   *  libavcodec/svq1.c:svq1_decode_frame writes to the given buffer.
> ++   *  libavcodec/svq3.c:svq3_decode_slice_header too.
> ++   * ffmpeg devs know about it and will fix it (they said). */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_SVQ1 ||
> ++      oclass->in_plugin->id =3D=3D CODEC_ID_SVQ3) {
> ++    inbuf =3D gst_buffer_make_writable (inbuf);
> ++  }
> ++
> ++  bdata =3D GST_BUFFER_DATA (inbuf);
> ++  bsize =3D GST_BUFFER_SIZE (inbuf);
> ++
> ++  if (ffmpegdec->do_padding) {
> ++    /* add padding */
> ++    if (ffmpegdec->padded_size < bsize + FF_INPUT_BUFFER_PADDING_SIZE) {
> ++      ffmpegdec->padded_size =3D bsize + FF_INPUT_BUFFER_PADDING_SIZE;
> ++      ffmpegdec->padded =3D g_realloc (ffmpegdec->padded, ffmpegdec->pa=
dded_size);
> ++      GST_LOG_OBJECT (ffmpegdec, "resized padding buffer to %d",
> ++          ffmpegdec->padded_size);
> ++    }
> ++    memcpy (ffmpegdec->padded, bdata, bsize);
> ++    memset (ffmpegdec->padded + bsize, 0, FF_INPUT_BUFFER_PADDING_SIZE);
> ++
> ++    bdata =3D ffmpegdec->padded;
> ++  }
> ++
> ++  do {
> ++    guint8 tmp_padding[FF_INPUT_BUFFER_PADDING_SIZE];
> ++
> ++    /* parse, if at all possible */
> ++    if (ffmpegdec->pctx) {
> ++      gint res;
> ++
> ++      GST_LOG_OBJECT (ffmpegdec,
> ++          "Calling av_parser_parse2 with offset %" G_GINT64_FORMAT ", t=
s:%"
> ++          GST_TIME_FORMAT " size %d", in_offset, GST_TIME_ARGS (in_time=
stamp),
> ++          bsize);
> ++
> ++      /* feed the parser. We pass the timestamp info so that we can rec=
over all
> ++       * info again later */
> ++      res =3D av_parser_parse2 (ffmpegdec->pctx, ffmpegdec->context,
> ++          &data, &size, bdata, bsize, in_info->idx, in_info->idx, in_of=
fset);
> ++
> ++      GST_LOG_OBJECT (ffmpegdec,
> ++          "parser returned res %d and size %d, id %" G_GINT64_FORMAT, r=
es, size,
> ++          ffmpegdec->pctx->pts);
> ++
> ++      /* store pts for decoding */
> ++      if (ffmpegdec->pctx->pts !=3D AV_NOPTS_VALUE && ffmpegdec->pctx->=
pts !=3D -1)
> ++        dec_info =3D gst_ts_info_get (ffmpegdec, ffmpegdec->pctx->pts);
> ++      else {
> ++        /* ffmpeg sometimes loses track after a flush, help it by feedi=
ng a
> ++         * valid start time */
> ++        ffmpegdec->pctx->pts =3D in_info->idx;
> ++        ffmpegdec->pctx->dts =3D in_info->idx;
> ++        dec_info =3D in_info;
> ++      }
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "consuming %d bytes. id %d", size,
> ++          dec_info->idx);
> ++
> ++      if (res) {
> ++        /* there is output, set pointers for next round. */
> ++        bsize -=3D res;
> ++        bdata +=3D res;
> ++      } else {
> ++        /* Parser did not consume any data, make sure we don't clear the
> ++         * timestamp for the next round */
> ++        ffmpegdec->clear_ts =3D FALSE;
> ++      }
> ++
> ++      /* if there is no output, we must break and wait for more data. a=
lso the
> ++       * timestamp in the context is not updated. */
> ++      if (size =3D=3D 0) {
> ++        if (bsize > 0)
> ++          continue;
> ++        else
> ++          break;
> ++      }
> ++    } else {
> ++      data =3D bdata;
> ++      size =3D bsize;
> ++
> ++      dec_info =3D in_info;
> ++    }
> ++
> ++    if (ffmpegdec->do_padding) {
> ++      /* add temporary padding */
> ++      memcpy (tmp_padding, data + size, FF_INPUT_BUFFER_PADDING_SIZE);
> ++      memset (data + size, 0, FF_INPUT_BUFFER_PADDING_SIZE);
> ++    }
> ++
> ++    /* decode a frame of audio/video now */
> ++    len =3D
> ++        gst_ffmpegdec_frame (ffmpegdec, data, size, &have_data, dec_inf=
o, &ret);
> ++
> ++    if (ffmpegdec->do_padding) {
> ++      memcpy (data + size, tmp_padding, FF_INPUT_BUFFER_PADDING_SIZE);
> ++    }
> ++
> ++    if (ret !=3D GST_FLOW_OK) {
> ++      GST_LOG_OBJECT (ffmpegdec, "breaking because of flow ret %s",
> ++          gst_flow_get_name (ret));
> ++      /* bad flow retun, make sure we discard all data and exit */
> ++      bsize =3D 0;
> ++      break;
> ++    }
> ++    if (!ffmpegdec->pctx) {
> ++      if (len =3D=3D 0 && !have_data) {
> ++        /* nothing was decoded, this could be because no data was avail=
able or
> ++         * because we were skipping frames.
> ++         * If we have no context we must exit and wait for more data, w=
e keep the
> ++         * data we tried. */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding didn't return any data, br=
eaking");
> ++        break;
> ++      } else if (len < 0) {
> ++        /* a decoding error happened, we must break and try again with =
next data. */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding error, breaking");
> ++        bsize =3D 0;
> ++        break;
> ++      }
> ++      /* prepare for the next round, for codecs with a context we did t=
his
> ++       * already when using the parser. */
> ++      bsize -=3D len;
> ++      bdata +=3D len;
> ++    } else {
> ++      if (len =3D=3D 0) {
> ++        /* nothing was decoded, this could be because no data was avail=
able or
> ++         * because we were skipping frames. Since we have a parser we c=
an
> ++         * continue with the next frame */
> ++        GST_LOG_OBJECT (ffmpegdec,
> ++            "Decoding didn't return any data, trying next");
> ++      } else if (len < 0) {
> ++        /* we have a context that will bring us to the next frame */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding error, trying next");
> ++      }
> ++    }
> ++
> ++    /* make sure we don't use the same old timestamp for the next frame=
 and let
> ++     * the interpollation take care of it. */
> ++    if (ffmpegdec->clear_ts) {
> ++      in_timestamp =3D GST_CLOCK_TIME_NONE;
> ++      in_duration =3D GST_CLOCK_TIME_NONE;
> ++      in_offset =3D GST_BUFFER_OFFSET_NONE;
> ++      in_info =3D GST_TS_INFO_NONE;
> ++    } else {
> ++      ffmpegdec->clear_ts =3D TRUE;
> ++    }
> ++    ffmpegdec->last_frames++;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "Before (while bsize>0).  bsize:%d , bda=
ta:%p",
> ++        bsize, bdata);
> ++  } while (bsize > 0);
> ++
> ++  /* keep left-over */
> ++  if (ffmpegdec->pctx && bsize > 0) {
> ++    in_timestamp =3D GST_BUFFER_TIMESTAMP (inbuf);
> ++    in_offset =3D GST_BUFFER_OFFSET (inbuf);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "Keeping %d bytes of data with offset %" G_GINT64_FORMAT ", tim=
estamp %"
> ++        GST_TIME_FORMAT, bsize, in_offset, GST_TIME_ARGS (in_timestamp)=
);
> ++
> ++    ffmpegdec->pcache =3D gst_buffer_create_sub (inbuf,
> ++        GST_BUFFER_SIZE (inbuf) - bsize, bsize);
> ++    /* we keep timestamp, even though all we really know is that the co=
rrect
> ++     * timestamp is not below the one from inbuf */
> ++    GST_BUFFER_TIMESTAMP (ffmpegdec->pcache) =3D in_timestamp;
> ++    GST_BUFFER_OFFSET (ffmpegdec->pcache) =3D in_offset;
> ++  } else if (bsize > 0) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Dropping %d bytes of data", bsize);
> ++  }
> ++  gst_buffer_unref (inbuf);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++not_negotiated:
> ++  {
> ++    oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION, (NULL),
> ++        ("ffdec_%s: input format was not set before data start",
> ++            oclass->in_plugin->name));
> ++    gst_buffer_unref (inbuf);
> ++    return GST_FLOW_NOT_NEGOTIATED;
> ++  }
> ++}
> ++
> ++static GstStateChangeReturn
> ++gst_ffmpegdec_change_state (GstElement * element, GstStateChange transi=
tion)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) element;
> ++  GstStateChangeReturn ret;
> ++
> ++  ret =3D GST_ELEMENT_CLASS (parent_class)->change_state (element, tran=
sition);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      GST_OBJECT_LOCK (ffmpegdec);
> ++      gst_ffmpegdec_close (ffmpegdec);
> ++      GST_OBJECT_UNLOCK (ffmpegdec);
> ++      clear_queued (ffmpegdec);
> ++      g_free (ffmpegdec->padded);
> ++      ffmpegdec->padded =3D NULL;
> ++      ffmpegdec->padded_size =3D 0;
> ++      ffmpegdec->can_allocate_aligned =3D TRUE;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  return ret;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_set_property (GObject * object,
> ++    guint prop_id, const GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_LOWRES:
> ++      ffmpegdec->lowres =3D ffmpegdec->context->lowres =3D g_value_get_=
enum (value);
> ++      break;
> ++    case PROP_SKIPFRAME:
> ++      ffmpegdec->skip_frame =3D ffmpegdec->context->skip_frame =3D
> ++          g_value_get_enum (value);
> ++      break;
> ++    case PROP_DIRECT_RENDERING:
> ++      ffmpegdec->direct_rendering =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_DO_PADDING:
> ++      ffmpegdec->do_padding =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_DEBUG_MV:
> ++      ffmpegdec->debug_mv =3D ffmpegdec->context->debug_mv =3D
> ++          g_value_get_boolean (value);
> ++      break;
> ++    case PROP_CROP:
> ++      ffmpegdec->crop =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_MAX_THREADS:
> ++      ffmpegdec->max_threads =3D g_value_get_int (value);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_get_property (GObject * object,
> ++    guint prop_id, GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_LOWRES:
> ++      g_value_set_enum (value, ffmpegdec->context->lowres);
> ++      break;
> ++    case PROP_SKIPFRAME:
> ++      g_value_set_enum (value, ffmpegdec->context->skip_frame);
> ++      break;
> ++    case PROP_DIRECT_RENDERING:
> ++      g_value_set_boolean (value, ffmpegdec->direct_rendering);
> ++      break;
> ++    case PROP_DO_PADDING:
> ++      g_value_set_boolean (value, ffmpegdec->do_padding);
> ++      break;
> ++    case PROP_DEBUG_MV:
> ++      g_value_set_boolean (value, ffmpegdec->context->debug_mv);
> ++      break;
> ++    case PROP_CROP:
> ++      g_value_set_boolean (value, ffmpegdec->crop);
> ++      break;
> ++    case PROP_MAX_THREADS:
> ++      g_value_set_int (value, ffmpegdec->max_threads);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++gboolean
> ++gst_ffmpegdec_register (GstPlugin * plugin)
> ++{
> ++  GTypeInfo typeinfo =3D {
> ++    sizeof (GstFFMpegDecClass),
> ++    (GBaseInitFunc) gst_ffmpegdec_base_init,
> ++    NULL,
> ++    (GClassInitFunc) gst_ffmpegdec_class_init,
> ++    NULL,
> ++    NULL,
> ++    sizeof (GstFFMpegDec),
> ++    0,
> ++    (GInstanceInitFunc) gst_ffmpegdec_init,
> ++  };
> ++  GType type;
> ++  AVCodec *in_plugin;
> ++  gint rank;
> ++
> ++  in_plugin =3D av_codec_next (NULL);
> ++
> ++  GST_LOG ("Registering decoders");
> ++
> ++  while (in_plugin) {
> ++    gchar *type_name;
> ++    gchar *plugin_name;
> ++
> ++    /* only decoders */
> ++    if (!in_plugin->decode) {
> ++      goto next;
> ++    }
> ++
> ++    /* no quasi-codecs, please */
> ++    if (in_plugin->id =3D=3D CODEC_ID_RAWVIDEO ||
> ++        in_plugin->id =3D=3D CODEC_ID_V210 ||
> ++        in_plugin->id =3D=3D CODEC_ID_V210X ||
> ++        in_plugin->id =3D=3D CODEC_ID_R210 ||
> ++        (in_plugin->id >=3D CODEC_ID_PCM_S16LE &&
> ++            in_plugin->id <=3D CODEC_ID_PCM_BLURAY)) {
> ++      goto next;
> ++    }
> ++
> ++    /* No decoders depending on external libraries (we don't build them=
, but
> ++     * people who build against an external ffmpeg might have them.
> ++     * We have native gstreamer plugins for all of those libraries anyw=
ay. */
> ++    if (!strncmp (in_plugin->name, "lib", 3)) {
> ++      GST_DEBUG
> ++          ("Not using external library decoder %s. Use the gstreamer-na=
tive ones instead.",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    /* No vdpau plugins until we can figure out how to properly use them
> ++     * outside of ffmpeg. */
> ++    if (g_str_has_suffix (in_plugin->name, "_vdpau")) {
> ++      GST_DEBUG
> ++          ("Ignoring VDPAU decoder %s. We can't handle this outside of =
ffmpeg",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if (g_str_has_suffix (in_plugin->name, "_xvmc")) {
> ++      GST_DEBUG
> ++          ("Ignoring XVMC decoder %s. We can't handle this outside of f=
fmpeg",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    GST_DEBUG ("Trying plugin %s [%s]", in_plugin->name, in_plugin->lon=
g_name);
> ++
> ++    /* no codecs for which we're GUARANTEED to have better alternatives=
 */
> ++    /* MPEG1VIDEO : the mpeg2video decoder is preferred */
> ++    /* MP1 : Use MP3 for decoding */
> ++    /* MP2 : Use MP3 for decoding */
> ++    /* Theora: Use libtheora based theoradec */
> ++    if (!strcmp (in_plugin->name, "gif") ||
> ++        !strcmp (in_plugin->name, "vorbis") ||
> ++        !strcmp (in_plugin->name, "theora") ||
> ++        !strcmp (in_plugin->name, "mpeg1video") ||
> ++        !strcmp (in_plugin->name, "wavpack") ||
> ++        !strcmp (in_plugin->name, "mp1") ||
> ++        !strcmp (in_plugin->name, "mp2") ||
> ++        !strcmp (in_plugin->name, "libfaad") ||
> ++        !strcmp (in_plugin->name, "mpeg4aac") ||
> ++        !strcmp (in_plugin->name, "ass") ||
> ++        !strcmp (in_plugin->name, "srt") ||
> ++        !strcmp (in_plugin->name, "pgssub") ||
> ++        !strcmp (in_plugin->name, "dvdsub") ||
> ++        !strcmp (in_plugin->name, "dvbsub")) {
> ++      GST_LOG ("Ignoring decoder %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    /* construct the type */
> ++    plugin_name =3D g_strdup ((gchar *) in_plugin->name);
> ++    g_strdelimit (plugin_name, NULL, '_');
> ++    type_name =3D g_strdup_printf ("ffdec_%s", plugin_name);
> ++    g_free (plugin_name);
> ++
> ++    type =3D g_type_from_name (type_name);
> ++
> ++    if (!type) {
> ++      /* create the gtype now */
> ++      type =3D g_type_register_static (GST_TYPE_ELEMENT, type_name, &ty=
peinfo, 0);
> ++      g_type_set_qdata (type, GST_FFDEC_PARAMS_QDATA, (gpointer) in_plu=
gin);
> ++    }
> ++
> ++    /* (Ronald) MPEG-4 gets a higher priority because it has been well-
> ++     * tested and by far outperforms divxdec/xviddec - so we prefer it.
> ++     * msmpeg4v3 same, as it outperforms divxdec for divx3 playback.
> ++     * VC1/WMV3 are not working and thus unpreferred for now. */
> ++    switch (in_plugin->id) {
> ++      case CODEC_ID_MPEG4:
> ++      case CODEC_ID_MSMPEG4V3:
> ++      case CODEC_ID_H264:
> ++      case CODEC_ID_RA_144:
> ++      case CODEC_ID_RA_288:
> ++      case CODEC_ID_RV10:
> ++      case CODEC_ID_RV20:
> ++      case CODEC_ID_RV30:
> ++      case CODEC_ID_RV40:
> ++      case CODEC_ID_COOK:
> ++        rank =3D GST_RANK_SECONDARY;
> ++        break;
> ++        /* DVVIDEO: we have a good dv decoder, fast on both ppc as well=
 as x86.
> ++         * They say libdv's quality is better though. leave as secondar=
y.
> ++         * note: if you change this, see the code in gstdv.c in good/ex=
t/dv.
> ++         *
> ++         * SIPR: decoder should have a higher rank than realaudiodec.
> ++         */
> ++      case CODEC_ID_DVVIDEO:
> ++      case CODEC_ID_SIPR:
> ++        rank =3D GST_RANK_SECONDARY;
> ++        break;
> ++      case CODEC_ID_MP3:
> ++        rank =3D GST_RANK_NONE;
> ++        break;
> ++        /* TEMPORARILY DISABLING AC3/EAC3/DTS for 0.10.12 release
> ++         * due to downmixing failure.
> ++         * See Bug #608892 for more details */
> ++      case CODEC_ID_EAC3:
> ++      case CODEC_ID_AC3:
> ++      case CODEC_ID_DTS:
> ++        rank =3D GST_RANK_NONE;
> ++        break;
> ++      default:
> ++        rank =3D GST_RANK_MARGINAL;
> ++        break;
> ++    }
> ++    if (!gst_element_register (plugin, type_name, rank, type)) {
> ++      g_warning ("Failed to register %s", type_name);
> ++      g_free (type_name);
> ++      return FALSE;
> ++    }
> ++
> ++    g_free (type_name);
> ++
> ++  next:
> ++    in_plugin =3D av_codec_next (in_plugin);
> ++  }
> ++
> ++  GST_LOG ("Finished Registering decoders");
> ++
> ++  return TRUE;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.rej gst-ffmp=
eg-0.10.13/ext/ffmpeg/gstffmpegdec.c.rej
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.rej	1970-01-01 01:=
00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.rej	2014-08-08 15:26:38=
=2E471858652 +0200
> +@@ -0,0 +1,11 @@
> ++--- ext/ffmpeg/gstffmpegdec.c
> +++++ ext/ffmpeg/gstffmpegdec.c
> ++@@ -1565,7 +1564,7 @@
> ++         gst_message_new_latency (GST_OBJECT_CAST (ffmpegdec)));
> ++   }
> ++=20
> ++-  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D FF_I_TYPE);
> +++  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D AV_PICTURE_TYPE_I=
);
> ++   is_reference =3D (ffmpegdec->picture->reference =3D=3D 1);
> ++=20
> ++   iskeyframe =3D (is_itype || is_reference || ffmpegdec->picture->key_=
frame)
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdemux.c gst-ffmpeg=
-0.10.13/ext/ffmpeg/gstffmpegdemux.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdemux.c	2011-07-13 11:07=
:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdemux.c	2014-08-08 15:26:07.8=
74857555 +0200
> +@@ -343,8 +343,11 @@
> +   demux->audiopads =3D 0;
> +=20
> +   /* close demuxer context from ffmpeg */
> +-  av_close_input_file (demux->context);
> +-  demux->context =3D NULL;
> ++  if (demux->seekable)
> ++    gst_ffmpegdata_close (demux->context->pb);
> ++  else
> ++    gst_ffmpeg_pipe_close (demux->context->pb);
> ++  avformat_close_input (&demux->context);
> +=20
> +   GST_OBJECT_LOCK (demux);
> +   demux->opened =3D FALSE;
> +@@ -1146,9 +1149,9 @@
> + static gboolean
> + gst_ffmpegdemux_open (GstFFMpegDemux * demux)
> + {
> ++  AVIOContext *iocontext =3D NULL;
> +   GstFFMpegDemuxClass *oclass =3D
> +       (GstFFMpegDemuxClass *) G_OBJECT_GET_CLASS (demux);
> +-  gchar *location;
> +   gint res, n_streams, i;
> + #if 0
> +   /* Re-enable once converted to new AVMetaData API
> +@@ -1164,15 +1167,14 @@
> +=20
> +   /* open via our input protocol hack */
> +   if (demux->seekable)
> +-    location =3D g_strdup_printf ("gstreamer://%p", demux->sinkpad);
> ++    res =3D gst_ffmpegdata_open (demux->sinkpad, AVIO_FLAG_READ, &iocon=
text);
> +   else
> +-    location =3D g_strdup_printf ("gstpipe://%p", &demux->ffpipe);
> +-  GST_DEBUG_OBJECT (demux, "about to call av_open_input_file %s", locat=
ion);
> ++    res =3D gst_ffmpeg_pipe_open (&demux->ffpipe, AVIO_FLAG_READ, &ioco=
ntext);
> +=20
> +-  res =3D av_open_input_file (&demux->context, location,
> +-      oclass->in_plugin, 0, NULL);
> ++  demux->context =3D avformat_alloc_context ();
> ++  demux->context->pb =3D iocontext;
> ++  res =3D avformat_open_input (&demux->context, NULL, oclass->in_plugin=
, NULL);
> +=20
> +-  g_free (location);
> +   GST_DEBUG_OBJECT (demux, "av_open_input returned %d", res);
> +   if (res < 0)
> +     goto open_failed;
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegenc.c gst-ffmpeg-0=
=2E10.13/ext/ffmpeg/gstffmpegenc.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegenc.c	2011-10-31 11:14:0=
3.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegenc.c	2014-08-08 15:32:18.608=
870847 +0200
> +@@ -770,7 +770,7 @@
> +   GST_OBJECT_UNLOCK (ffmpegenc);
> +=20
> +   if (force_keyframe)
> +-    ffmpegenc->picture->pict_type =3D FF_I_TYPE;
> ++    ffmpegenc->picture->pict_type =3D AV_PICTURE_TYPE_I;
> +=20
> +   frame_size =3D gst_ffmpeg_avpicture_fill ((AVPicture *) ffmpegenc->pi=
cture,
> +       GST_BUFFER_DATA (inbuf),
> +@@ -1136,7 +1136,7 @@
> +       const GstStructure *s;
> +       s =3D gst_event_get_structure (event);
> +       if (gst_structure_has_name (s, "GstForceKeyUnit")) {
> +-        ffmpegenc->picture->pict_type =3D FF_I_TYPE;
> ++        ffmpegenc->picture->pict_type =3D AV_PICTURE_TYPE_I;
> +       }
> +       break;
> +     }
> +@@ -1339,7 +1339,7 @@
> +     }
> +=20
> +     /* only encoders */
> +-    if (!in_plugin->encode) {
> ++    if (!av_codec_is_encoder (in_plugin)) {
> +       goto next;
> +     }
> +=20
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c gst-ffmpeg-0=
=2E10.13/ext/ffmpeg/gstffmpegmux.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c	2011-07-13 11:07:2=
8.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c	2014-08-08 15:26:07.874=
857555 +0200
> +@@ -24,8 +24,10 @@
> + #include <string.h>
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avformat.h>
> ++#include <opt.h>
> + #else
> + #include <libavformat/avformat.h>
> ++#include <libavutil/opt.h>
> + #endif
> +=20
> + #include <gst/gst.h>
> +@@ -336,9 +338,6 @@
> +   ffmpegmux->context =3D g_new0 (AVFormatContext, 1);
> +   ffmpegmux->context->oformat =3D oclass->in_plugin;
> +   ffmpegmux->context->nb_streams =3D 0;
> +-  g_snprintf (ffmpegmux->context->filename,
> +-      sizeof (ffmpegmux->context->filename),
> +-      "gstreamer://%p", ffmpegmux->srcpad);
> +   ffmpegmux->opened =3D FALSE;
> +=20
> +   ffmpegmux->videopads =3D 0;
> +@@ -450,10 +449,10 @@
> +   gst_element_add_pad (element, pad);
> +=20
> +   /* AVStream needs to be created */
> +-  st =3D av_new_stream (ffmpegmux->context, collect_pad->padnum);
> ++  st =3D avformat_new_stream (ffmpegmux->context, NULL);
> ++  st->id =3D collect_pad->padnum;
> +   st->codec->codec_type =3D type;
> +   st->codec->codec_id =3D CODEC_ID_NONE;  /* this is a check afterwards=
 */
> +-  st->stream_copy =3D 1;          /* we're not the actual encoder */
> +   st->codec->bit_rate =3D bitrate;
> +   st->codec->frame_size =3D framesize;
> +   /* we fill in codec during capsnego */
> +@@ -485,7 +484,7 @@
> +   collect_pad =3D (GstFFMpegMuxPad *) gst_pad_get_element_private (pad);
> +=20
> +   st =3D ffmpegmux->context->streams[collect_pad->padnum];
> +-  ffmpegmux->context->preload =3D ffmpegmux->preload;
> ++  av_opt_set_int (&ffmpegmux->context, "preload", ffmpegmux->preload, 0=
);
> +   ffmpegmux->context->max_delay =3D ffmpegmux->max_delay;
> +=20
> +   /* for the format-specific guesses, we'll go to
> +@@ -552,7 +551,7 @@
> +=20
> +   /* open "file" (gstreamer protocol to next element) */
> +   if (!ffmpegmux->opened) {
> +-    int open_flags =3D URL_WRONLY;
> ++    int open_flags =3D AVIO_FLAG_WRITE;
> +=20
> +     /* we do need all streams to have started capsnego,
> +      * or things will go horribly wrong */
> +@@ -646,19 +645,13 @@
> +       open_flags |=3D GST_FFMPEG_URL_STREAMHEADER;
> +     }
> +=20
> +-    if (url_fopen (&ffmpegmux->context->pb,
> +-            ffmpegmux->context->filename, open_flags) < 0) {
> ++    if (gst_ffmpegdata_open (ffmpegmux->srcpad, open_flags,
> ++            &ffmpegmux->context->pb) < 0) {
> +       GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, TOO_LAZY, (NULL),
> +           ("Failed to open stream context in ffmux"));
> +       return GST_FLOW_ERROR;
> +     }
> +=20
> +-    if (av_set_parameters (ffmpegmux->context, NULL) < 0) {
> +-      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, INIT, (NULL),
> +-          ("Failed to initialize muxer"));
> +-      return GST_FLOW_ERROR;
> +-    }
> +-
> +     /* now open the mux format */
> +     if (av_write_header (ffmpegmux->context) < 0) {
> +       GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, SETTINGS, (NULL),
> +@@ -670,7 +663,7 @@
> +     ffmpegmux->opened =3D TRUE;
> +=20
> +     /* flush the header so it will be used as streamheader */
> +-    put_flush_packet (ffmpegmux->context->pb);
> ++    avio_flush (ffmpegmux->context->pb);
> +   }
> +=20
> +   /* take the one with earliest timestamp,
> +@@ -770,8 +763,8 @@
> +     /* close down */
> +     av_write_trailer (ffmpegmux->context);
> +     ffmpegmux->opened =3D FALSE;
> +-    put_flush_packet (ffmpegmux->context->pb);
> +-    url_fclose (ffmpegmux->context->pb);
> ++    avio_flush (ffmpegmux->context->pb);
> ++    gst_ffmpegdata_close (ffmpegmux->context->pb);
> +     gst_pad_push_event (ffmpegmux->srcpad, gst_event_new_eos ());
> +     return GST_FLOW_UNEXPECTED;
> +   }
> +@@ -795,6 +788,10 @@
> +       break;
> +     case GST_STATE_CHANGE_PAUSED_TO_READY:
> +       gst_collect_pads_stop (ffmpegmux->collect);
> ++      if (ffmpegmux->opened) {
> ++        ffmpegmux->opened =3D FALSE;
> ++        gst_ffmpegdata_close (ffmpegmux->context->pb);
> ++      }
> +       break;
> +     default:
> +       break;
> +@@ -809,7 +806,7 @@
> +       gst_tag_setter_reset_tags (GST_TAG_SETTER (ffmpegmux));
> +       if (ffmpegmux->opened) {
> +         ffmpegmux->opened =3D FALSE;
> +-        url_fclose (ffmpegmux->context->pb);
> ++        avio_close (ffmpegmux->context->pb);
> +       }
> +       break;
> +     case GST_STATE_CHANGE_READY_TO_NULL:
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c.orig gst-ffm=
peg-0.10.13/ext/ffmpeg/gstffmpegmux.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c.orig	1970-01-01 01=
:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c.orig	2011-07-13 11:07:2=
8.000000000 +0200
> +@@ -0,0 +1,970 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <string.h>
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avformat.h>
> ++#else
> ++#include <libavformat/avformat.h>
> ++#endif
> ++
> ++#include <gst/gst.h>
> ++#include <gst/base/gstcollectpads.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++#include "gstffmpegutils.h"
> ++
> ++typedef struct _GstFFMpegMux GstFFMpegMux;
> ++typedef struct _GstFFMpegMuxPad GstFFMpegMuxPad;
> ++
> ++struct _GstFFMpegMuxPad
> ++{
> ++  GstCollectData collect;       /* we extend the CollectData */
> ++
> ++  gint padnum;
> ++};
> ++
> ++struct _GstFFMpegMux
> ++{
> ++  GstElement element;
> ++
> ++  GstCollectPads *collect;
> ++  /* We need to keep track of our pads, so we do so here. */
> ++  GstPad *srcpad;
> ++
> ++  AVFormatContext *context;
> ++  gboolean opened;
> ++
> ++  gint videopads, audiopads;
> ++
> ++  /*< private > */
> ++  /* event_function is the collectpads default eventfunction */
> ++  GstPadEventFunction event_function;
> ++  int preload;
> ++  int max_delay;
> ++};
> ++
> ++typedef struct _GstFFMpegMuxClass GstFFMpegMuxClass;
> ++
> ++struct _GstFFMpegMuxClass
> ++{
> ++  GstElementClass parent_class;
> ++
> ++  AVOutputFormat *in_plugin;
> ++};
> ++
> ++#define GST_TYPE_FFMPEGMUX \
> ++  (gst_ffmpegdec_get_type())
> ++#define GST_FFMPEGMUX(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_FFMPEGMUX,GstFFMpegMux))
> ++#define GST_FFMPEGMUX_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_FFMPEGMUX,GstFFMpegMuxClass=
))
> ++#define GST_IS_FFMPEGMUX(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_FFMPEGMUX))
> ++#define GST_IS_FFMPEGMUX_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_FFMPEGMUX))
> ++
> ++enum
> ++{
> ++  /* FILL ME */
> ++  LAST_SIGNAL
> ++};
> ++
> ++enum
> ++{
> ++  ARG_0,
> ++  /* FILL ME */
> ++};
> ++
> ++enum
> ++{
> ++  PROP_0,
> ++  PROP_PRELOAD,
> ++  PROP_MAXDELAY
> ++};
> ++
> ++/* A number of function prototypes are given so we can refer to them la=
ter. */
> ++static void gst_ffmpegmux_class_init (GstFFMpegMuxClass * klass);
> ++static void gst_ffmpegmux_base_init (gpointer g_class);
> ++static void gst_ffmpegmux_init (GstFFMpegMux * ffmpegmux,
> ++    GstFFMpegMuxClass * g_class);
> ++static void gst_ffmpegmux_finalize (GObject * object);
> ++
> ++static gboolean gst_ffmpegmux_setcaps (GstPad * pad, GstCaps * caps);
> ++static GstPad *gst_ffmpegmux_request_new_pad (GstElement * element,
> ++    GstPadTemplate * templ, const gchar * name);
> ++static GstFlowReturn gst_ffmpegmux_collected (GstCollectPads * pads,
> ++    gpointer user_data);
> ++
> ++static gboolean gst_ffmpegmux_sink_event (GstPad * pad, GstEvent * even=
t);
> ++
> ++static GstStateChangeReturn gst_ffmpegmux_change_state (GstElement * el=
ement,
> ++    GstStateChange transition);
> ++
> ++static void gst_ffmpegmux_set_property (GObject * object, guint prop_id,
> ++    const GValue * value, GParamSpec * pspec);
> ++static void gst_ffmpegmux_get_property (GObject * object, guint prop_id,
> ++    GValue * value, GParamSpec * pspec);
> ++
> ++static GstCaps *gst_ffmpegmux_get_id_caps (enum CodecID *id_list);
> ++static void gst_ffmpeg_mux_simple_caps_set_int_list (GstCaps * caps,
> ++    const gchar * field, guint num, const gint * values);
> ++
> ++#define GST_FFMUX_PARAMS_QDATA g_quark_from_static_string("ffmux-params=
")
> ++
> ++static GstElementClass *parent_class =3D NULL;
> ++
> ++/*static guint gst_ffmpegmux_signals[LAST_SIGNAL] =3D { 0 }; */
> ++
> ++typedef struct
> ++{
> ++  const char *name;
> ++  const char *replacement;
> ++} GstFFMpegMuxReplacement;
> ++
> ++static const char *
> ++gst_ffmpegmux_get_replacement (const char *name)
> ++{
> ++  static const GstFFMpegMuxReplacement blacklist[] =3D {
> ++    {"avi", "avimux"},
> ++    {"matroska", "matroskamux"},
> ++    {"mov", "qtmux"},
> ++    {"mpegts", "mpegtsmux"},
> ++    {"mp4", "mp4mux"},
> ++    {"mpjpeg", "multipartmux"},
> ++    {"ogg", "oggmux"},
> ++    {"wav", "wavenc"},
> ++    {"webm", "webmmux"},
> ++    {"mxf", "mxfmux"},
> ++    {"3gp", "gppmux"},
> ++    {"yuv4mpegpipe", "y4menc"},
> ++    {"aiff", "aiffmux"},
> ++    {"adts", "aacparse"},
> ++    {"asf", "asfmux"},
> ++    {"asf_stream", "asfmux"},
> ++    {"flv", "flvmux"},
> ++    {"mp3", "id3v2mux"},
> ++    {"mp2", "id3v2mux"}
> ++  };
> ++  int i;
> ++
> ++  for (i =3D 0; i < sizeof (blacklist) / sizeof (blacklist[0]); i++) {
> ++    if (strcmp (blacklist[i].name, name) =3D=3D 0) {
> ++      return blacklist[i].replacement;
> ++    }
> ++  }
> ++
> ++  return NULL;
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegmux_is_formatter (const char *name)
> ++{
> ++  static const char *replace[] =3D {
> ++    "mp2", "mp3", NULL
> ++  };
> ++  int i;
> ++
> ++  for (i =3D 0; replace[i]; i++)
> ++    if (strcmp (replace[i], name) =3D=3D 0)
> ++      return TRUE;
> ++  return FALSE;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_base_init (gpointer g_class)
> ++{
> ++  GstFFMpegMuxClass *klass =3D (GstFFMpegMuxClass *) g_class;
> ++  GstElementClass *element_class =3D GST_ELEMENT_CLASS (g_class);
> ++  GstPadTemplate *videosinktempl, *audiosinktempl, *srctempl;
> ++  AVOutputFormat *in_plugin;
> ++  GstCaps *srccaps, *audiosinkcaps, *videosinkcaps;
> ++  enum CodecID *video_ids =3D NULL, *audio_ids =3D NULL;
> ++  gchar *longname, *description;
> ++  const char *replacement;
> ++  gboolean is_formatter;
> ++
> ++  in_plugin =3D
> ++      (AVOutputFormat *) g_type_get_qdata (G_OBJECT_CLASS_TYPE (klass),
> ++      GST_FFMUX_PARAMS_QDATA);
> ++  g_assert (in_plugin !=3D NULL);
> ++
> ++  /* construct the element details struct */
> ++  replacement =3D gst_ffmpegmux_get_replacement (in_plugin->name);
> ++  is_formatter =3D gst_ffmpegmux_is_formatter (in_plugin->name);
> ++  if (replacement !=3D NULL) {
> ++    longname =3D
> ++        g_strdup_printf ("FFmpeg %s %s (not recommended, use %s instead=
)",
> ++        in_plugin->long_name, is_formatter ? "formatter" : "muxer",
> ++        replacement);
> ++    description =3D
> ++        g_strdup_printf ("FFmpeg %s %s (not recommended, use %s instead=
)",
> ++        in_plugin->long_name, is_formatter ? "formatter" : "muxer",
> ++        replacement);
> ++  } else {
> ++    longname =3D g_strdup_printf ("FFmpeg %s %s", in_plugin->long_name,
> ++        is_formatter ? "formatter" : "muxer");
> ++    description =3D g_strdup_printf ("FFmpeg %s %s", in_plugin->long_na=
me,
> ++        is_formatter ? "formatter" : "muxer");
> ++  }
> ++  gst_element_class_set_details_simple (element_class, longname,
> ++      is_formatter ? "Formatter/Metadata" : "Codec/Muxer", description,
> ++      "Wim Taymans <wim.taymans@chello.be>, "
> ++      "Ronald Bultje <rbultje@ronald.bitfreak.net>");
> ++  g_free (longname);
> ++  g_free (description);
> ++
> ++  /* Try to find the caps that belongs here */
> ++  srccaps =3D gst_ffmpeg_formatid_to_caps (in_plugin->name);
> ++  if (!srccaps) {
> ++    GST_DEBUG ("Couldn't get source caps for muxer '%s', skipping forma=
t",
> ++        in_plugin->name);
> ++    goto beach;
> ++  }
> ++
> ++  if (!gst_ffmpeg_formatid_get_codecids (in_plugin->name,
> ++          &video_ids, &audio_ids, in_plugin)) {
> ++    gst_caps_unref (srccaps);
> ++    GST_DEBUG
> ++        ("Couldn't get sink caps for muxer '%s'. Most likely because no=
 input format mapping exists.",
> ++        in_plugin->name);
> ++    goto beach;
> ++  }
> ++
> ++  videosinkcaps =3D video_ids ? gst_ffmpegmux_get_id_caps (video_ids) :=
 NULL;
> ++  audiosinkcaps =3D audio_ids ? gst_ffmpegmux_get_id_caps (audio_ids) :=
 NULL;
> ++
> ++  /* fix up allowed caps for some muxers */
> ++  /* FIXME : This should be in gstffmpegcodecmap.c ! */
> ++  if (strcmp (in_plugin->name, "flv") =3D=3D 0) {
> ++    const gint rates[] =3D { 44100, 22050, 11025 };
> ++
> ++    gst_ffmpeg_mux_simple_caps_set_int_list (audiosinkcaps, "rate", 3, =
rates);
> ++  } else if (strcmp (in_plugin->name, "gif") =3D=3D 0) {
> ++    if (videosinkcaps)
> ++      gst_caps_unref (videosinkcaps);
> ++
> ++    videosinkcaps =3D
> ++        gst_caps_from_string ("video/x-raw-rgb, bpp=3D(int)24, depth=3D=
(int)24");
> ++  }
> ++
> ++  /* pad templates */
> ++  srctempl =3D gst_pad_template_new ("src", GST_PAD_SRC, GST_PAD_ALWAYS=
, srccaps);
> ++  gst_element_class_add_pad_template (element_class, srctempl);
> ++
> ++  if (audiosinkcaps) {
> ++    audiosinktempl =3D gst_pad_template_new ("audio_%d",
> ++        GST_PAD_SINK, GST_PAD_REQUEST, audiosinkcaps);
> ++    gst_element_class_add_pad_template (element_class, audiosinktempl);
> ++  }
> ++
> ++  if (videosinkcaps) {
> ++    videosinktempl =3D gst_pad_template_new ("video_%d",
> ++        GST_PAD_SINK, GST_PAD_REQUEST, videosinkcaps);
> ++    gst_element_class_add_pad_template (element_class, videosinktempl);
> ++  }
> ++
> ++beach:
> ++  klass->in_plugin =3D in_plugin;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_class_init (GstFFMpegMuxClass * klass)
> ++{
> ++  GObjectClass *gobject_class;
> ++  GstElementClass *gstelement_class;
> ++
> ++  gobject_class =3D (GObjectClass *) klass;
> ++  gstelement_class =3D (GstElementClass *) klass;
> ++
> ++  parent_class =3D g_type_class_peek_parent (klass);
> ++
> ++  gobject_class->set_property =3D GST_DEBUG_FUNCPTR (gst_ffmpegmux_set_=
property);
> ++  gobject_class->get_property =3D GST_DEBUG_FUNCPTR (gst_ffmpegmux_get_=
property);
> ++
> ++  g_object_class_install_property (gobject_class, PROP_PRELOAD,
> ++      g_param_spec_int ("preload", "preload",
> ++          "Set the initial demux-decode delay (in microseconds)", 0, G_=
MAXINT,
> ++          0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  g_object_class_install_property (gobject_class, PROP_MAXDELAY,
> ++      g_param_spec_int ("maxdelay", "maxdelay",
> ++          "Set the maximum demux-decode delay (in microseconds)", 0, G_=
MAXINT,
> ++          0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  gstelement_class->request_new_pad =3D gst_ffmpegmux_request_new_pad;
> ++  gstelement_class->change_state =3D gst_ffmpegmux_change_state;
> ++  gobject_class->finalize =3D gst_ffmpegmux_finalize;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_init (GstFFMpegMux * ffmpegmux, GstFFMpegMuxClass * g_cla=
ss)
> ++{
> ++  GstElementClass *klass =3D GST_ELEMENT_CLASS (g_class);
> ++  GstFFMpegMuxClass *oclass =3D (GstFFMpegMuxClass *) klass;
> ++  GstPadTemplate *templ =3D gst_element_class_get_pad_template (klass, =
"src");
> ++
> ++  ffmpegmux->srcpad =3D gst_pad_new_from_template (templ, "src");
> ++  gst_pad_set_caps (ffmpegmux->srcpad, gst_pad_template_get_caps (templ=
));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegmux), ffmpegmux->srcpad);
> ++
> ++  ffmpegmux->collect =3D gst_collect_pads_new ();
> ++  gst_collect_pads_set_function (ffmpegmux->collect,
> ++      (GstCollectPadsFunction) gst_ffmpegmux_collected, ffmpegmux);
> ++
> ++  ffmpegmux->context =3D g_new0 (AVFormatContext, 1);
> ++  ffmpegmux->context->oformat =3D oclass->in_plugin;
> ++  ffmpegmux->context->nb_streams =3D 0;
> ++  g_snprintf (ffmpegmux->context->filename,
> ++      sizeof (ffmpegmux->context->filename),
> ++      "gstreamer://%p", ffmpegmux->srcpad);
> ++  ffmpegmux->opened =3D FALSE;
> ++
> ++  ffmpegmux->videopads =3D 0;
> ++  ffmpegmux->audiopads =3D 0;
> ++  ffmpegmux->preload =3D 0;
> ++  ffmpegmux->max_delay =3D 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_set_property (GObject * object, guint prop_id,
> ++    const GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegMux *src;
> ++
> ++  src =3D (GstFFMpegMux *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_PRELOAD:
> ++      src->preload =3D g_value_get_int (value);
> ++      break;
> ++    case PROP_MAXDELAY:
> ++      src->max_delay =3D g_value_get_int (value);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_get_property (GObject * object, guint prop_id, GValue * v=
alue,
> ++    GParamSpec * pspec)
> ++{
> ++  GstFFMpegMux *src;
> ++
> ++  src =3D (GstFFMpegMux *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_PRELOAD:
> ++      g_value_set_int (value, src->preload);
> ++      break;
> ++    case PROP_MAXDELAY:
> ++      g_value_set_int (value, src->max_delay);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++
> ++static void
> ++gst_ffmpegmux_finalize (GObject * object)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) object;
> ++
> ++  g_free (ffmpegmux->context);
> ++  gst_object_unref (ffmpegmux->collect);
> ++
> ++  if (G_OBJECT_CLASS (parent_class)->finalize)
> ++    G_OBJECT_CLASS (parent_class)->finalize (object);
> ++}
> ++
> ++static GstPad *
> ++gst_ffmpegmux_request_new_pad (GstElement * element,
> ++    GstPadTemplate * templ, const gchar * name)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) element;
> ++  GstElementClass *klass =3D GST_ELEMENT_GET_CLASS (element);
> ++  GstFFMpegMuxPad *collect_pad;
> ++  gchar *padname;
> ++  GstPad *pad;
> ++  AVStream *st;
> ++  enum AVMediaType type;
> ++  gint bitrate =3D 0, framesize =3D 0;
> ++
> ++  g_return_val_if_fail (templ !=3D NULL, NULL);
> ++  g_return_val_if_fail (templ->direction =3D=3D GST_PAD_SINK, NULL);
> ++  g_return_val_if_fail (ffmpegmux->opened =3D=3D FALSE, NULL);
> ++
> ++  /* figure out a name that *we* like */
> ++  if (templ =3D=3D gst_element_class_get_pad_template (klass, "video_%d=
")) {
> ++    padname =3D g_strdup_printf ("video_%d", ffmpegmux->videopads++);
> ++    type =3D AVMEDIA_TYPE_VIDEO;
> ++    bitrate =3D 64 * 1024;
> ++    framesize =3D 1152;
> ++  } else if (templ =3D=3D gst_element_class_get_pad_template (klass, "a=
udio_%d")) {
> ++    padname =3D g_strdup_printf ("audio_%d", ffmpegmux->audiopads++);
> ++    type =3D AVMEDIA_TYPE_AUDIO;
> ++    bitrate =3D 285 * 1024;
> ++  } else {
> ++    g_warning ("ffmux: unknown pad template!");
> ++    return NULL;
> ++  }
> ++
> ++  /* create pad */
> ++  pad =3D gst_pad_new_from_template (templ, padname);
> ++  collect_pad =3D (GstFFMpegMuxPad *)
> ++      gst_collect_pads_add_pad (ffmpegmux->collect, pad,
> ++      sizeof (GstFFMpegMuxPad));
> ++  collect_pad->padnum =3D ffmpegmux->context->nb_streams;
> ++
> ++  /* small hack to put our own event pad function and chain up to colle=
ct pad */
> ++  ffmpegmux->event_function =3D GST_PAD_EVENTFUNC (pad);
> ++  gst_pad_set_event_function (pad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegmux_sink_event));
> ++
> ++  gst_pad_set_setcaps_function (pad, GST_DEBUG_FUNCPTR (gst_ffmpegmux_s=
etcaps));
> ++  gst_element_add_pad (element, pad);
> ++
> ++  /* AVStream needs to be created */
> ++  st =3D av_new_stream (ffmpegmux->context, collect_pad->padnum);
> ++  st->codec->codec_type =3D type;
> ++  st->codec->codec_id =3D CODEC_ID_NONE;  /* this is a check afterwards=
 */
> ++  st->stream_copy =3D 1;          /* we're not the actual encoder */
> ++  st->codec->bit_rate =3D bitrate;
> ++  st->codec->frame_size =3D framesize;
> ++  /* we fill in codec during capsnego */
> ++
> ++  /* we love debug output (c) (tm) (r) */
> ++  GST_DEBUG ("Created %s pad for ffmux_%s element",
> ++      padname, ((GstFFMpegMuxClass *) klass)->in_plugin->name);
> ++  g_free (padname);
> ++
> ++  return pad;
> ++}
> ++
> ++/**
> ++ * gst_ffmpegmux_setcaps
> ++ * @pad: #GstPad
> ++ * @caps: New caps.
> ++ *
> ++ * Set caps to pad.
> ++ *
> ++ * Returns: #TRUE on success.
> ++ */
> ++static gboolean
> ++gst_ffmpegmux_setcaps (GstPad * pad, GstCaps * caps)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) (gst_pad_get_parent (pad=
));
> ++  GstFFMpegMuxPad *collect_pad;
> ++  AVStream *st;
> ++
> ++  collect_pad =3D (GstFFMpegMuxPad *) gst_pad_get_element_private (pad);
> ++
> ++  st =3D ffmpegmux->context->streams[collect_pad->padnum];
> ++  ffmpegmux->context->preload =3D ffmpegmux->preload;
> ++  ffmpegmux->context->max_delay =3D ffmpegmux->max_delay;
> ++
> ++  /* for the format-specific guesses, we'll go to
> ++   * our famous codec mapper */
> ++  if (gst_ffmpeg_caps_to_codecid (caps, st->codec) =3D=3D CODEC_ID_NONE)
> ++    goto not_accepted;
> ++
> ++  /* copy over the aspect ratios, ffmpeg expects the stream aspect to m=
atch the
> ++   * codec aspect. */
> ++  st->sample_aspect_ratio =3D st->codec->sample_aspect_ratio;
> ++
> ++  GST_LOG_OBJECT (pad, "accepted caps %" GST_PTR_FORMAT, caps);
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++not_accepted:
> ++  {
> ++    GST_LOG_OBJECT (pad, "rejecting caps %" GST_PTR_FORMAT, caps);
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++
> ++static gboolean
> ++gst_ffmpegmux_sink_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) gst_pad_get_parent (pad);
> ++  gboolean res =3D TRUE;
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_TAG:{
> ++      GstTagList *taglist;
> ++      GstTagSetter *setter =3D GST_TAG_SETTER (ffmpegmux);
> ++      const GstTagMergeMode mode =3D gst_tag_setter_get_tag_merge_mode =
(setter);
> ++
> ++      gst_event_parse_tag (event, &taglist);
> ++      gst_tag_setter_merge_tags (setter, taglist, mode);
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* chaining up to collectpads default event function */
> ++  res =3D ffmpegmux->event_function (pad, event);
> ++
> ++  gst_object_unref (ffmpegmux);
> ++  return res;
> ++}
> ++
> ++static GstFlowReturn
> ++gst_ffmpegmux_collected (GstCollectPads * pads, gpointer user_data)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) user_data;
> ++  GSList *collected;
> ++  GstFFMpegMuxPad *best_pad;
> ++  GstClockTime best_time;
> ++#if 0
> ++  /* Re-enable once converted to new AVMetaData API
> ++   * See #566605
> ++   */
> ++  const GstTagList *tags;
> ++#endif
> ++
> ++  /* open "file" (gstreamer protocol to next element) */
> ++  if (!ffmpegmux->opened) {
> ++    int open_flags =3D URL_WRONLY;
> ++
> ++    /* we do need all streams to have started capsnego,
> ++     * or things will go horribly wrong */
> ++    for (collected =3D ffmpegmux->collect->data; collected;
> ++        collected =3D g_slist_next (collected)) {
> ++      GstFFMpegMuxPad *collect_pad =3D (GstFFMpegMuxPad *) collected->d=
ata;
> ++      AVStream *st =3D ffmpegmux->context->streams[collect_pad->padnum];
> ++
> ++      /* check whether the pad has successfully completed capsnego */
> ++      if (st->codec->codec_id =3D=3D CODEC_ID_NONE) {
> ++        GST_ELEMENT_ERROR (ffmpegmux, CORE, NEGOTIATION, (NULL),
> ++            ("no caps set on stream %d (%s)", collect_pad->padnum,
> ++                (st->codec->codec_type =3D=3D AVMEDIA_TYPE_VIDEO) ?
> ++                "video" : "audio"));
> ++        return GST_FLOW_ERROR;
> ++      }
> ++      /* set framerate for audio */
> ++      if (st->codec->codec_type =3D=3D AVMEDIA_TYPE_AUDIO) {
> ++        switch (st->codec->codec_id) {
> ++          case CODEC_ID_PCM_S16LE:
> ++          case CODEC_ID_PCM_S16BE:
> ++          case CODEC_ID_PCM_U16LE:
> ++          case CODEC_ID_PCM_U16BE:
> ++          case CODEC_ID_PCM_S8:
> ++          case CODEC_ID_PCM_U8:
> ++            st->codec->frame_size =3D 1;
> ++            break;
> ++          default:
> ++          {
> ++            GstBuffer *buffer;
> ++
> ++            /* FIXME : This doesn't work for RAW AUDIO...
> ++             * in fact I'm wondering if it even works for any kind of a=
udio... */
> ++            buffer =3D gst_collect_pads_peek (ffmpegmux->collect,
> ++                (GstCollectData *) collect_pad);
> ++            if (buffer) {
> ++              st->codec->frame_size =3D
> ++                  st->codec->sample_rate *
> ++                  GST_BUFFER_DURATION (buffer) / GST_SECOND;
> ++              gst_buffer_unref (buffer);
> ++            }
> ++          }
> ++        }
> ++      }
> ++    }
> ++
> ++#if 0
> ++    /* Re-enable once converted to new AVMetaData API
> ++     * See #566605
> ++     */
> ++
> ++    /* tags */
> ++    tags =3D gst_tag_setter_get_tag_list (GST_TAG_SETTER (ffmpegmux));
> ++    if (tags) {
> ++      gint i;
> ++      gchar *s;
> ++
> ++      /* get the interesting ones */
> ++      if (gst_tag_list_get_string (tags, GST_TAG_TITLE, &s)) {
> ++        strncpy (ffmpegmux->context->title, s,
> ++            sizeof (ffmpegmux->context->title));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_ARTIST, &s)) {
> ++        strncpy (ffmpegmux->context->author, s,
> ++            sizeof (ffmpegmux->context->author));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_COPYRIGHT, &s)) {
> ++        strncpy (ffmpegmux->context->copyright, s,
> ++            sizeof (ffmpegmux->context->copyright));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_COMMENT, &s)) {
> ++        strncpy (ffmpegmux->context->comment, s,
> ++            sizeof (ffmpegmux->context->comment));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_ALBUM, &s)) {
> ++        strncpy (ffmpegmux->context->album, s,
> ++            sizeof (ffmpegmux->context->album));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_GENRE, &s)) {
> ++        strncpy (ffmpegmux->context->genre, s,
> ++            sizeof (ffmpegmux->context->genre));
> ++      }
> ++      if (gst_tag_list_get_int (tags, GST_TAG_TRACK_NUMBER, &i)) {
> ++        ffmpegmux->context->track =3D i;
> ++      }
> ++    }
> ++#endif
> ++
> ++    /* set the streamheader flag for gstffmpegprotocol if codec support=
s it */
> ++    if (!strcmp (ffmpegmux->context->oformat->name, "flv")) {
> ++      open_flags |=3D GST_FFMPEG_URL_STREAMHEADER;
> ++    }
> ++
> ++    if (url_fopen (&ffmpegmux->context->pb,
> ++            ffmpegmux->context->filename, open_flags) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, TOO_LAZY, (NULL),
> ++          ("Failed to open stream context in ffmux"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    if (av_set_parameters (ffmpegmux->context, NULL) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, INIT, (NULL),
> ++          ("Failed to initialize muxer"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    /* now open the mux format */
> ++    if (av_write_header (ffmpegmux->context) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, SETTINGS, (NULL),
> ++          ("Failed to write file header - check codec settings"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    /* we're now opened */
> ++    ffmpegmux->opened =3D TRUE;
> ++
> ++    /* flush the header so it will be used as streamheader */
> ++    put_flush_packet (ffmpegmux->context->pb);
> ++  }
> ++
> ++  /* take the one with earliest timestamp,
> ++   * and push it forward */
> ++  best_pad =3D NULL;
> ++  best_time =3D GST_CLOCK_TIME_NONE;
> ++  for (collected =3D ffmpegmux->collect->data; collected;
> ++      collected =3D g_slist_next (collected)) {
> ++    GstFFMpegMuxPad *collect_pad =3D (GstFFMpegMuxPad *) collected->dat=
a;
> ++    GstBuffer *buffer =3D gst_collect_pads_peek (ffmpegmux->collect,
> ++        (GstCollectData *) collect_pad);
> ++
> ++    /* if there's no buffer, just continue */
> ++    if (buffer =3D=3D NULL) {
> ++      continue;
> ++    }
> ++
> ++    /* if we have no buffer yet, just use the first one */
> ++    if (best_pad =3D=3D NULL) {
> ++      best_pad =3D collect_pad;
> ++      best_time =3D GST_BUFFER_TIMESTAMP (buffer);
> ++      goto next_pad;
> ++    }
> ++
> ++    /* if we do have one, only use this one if it's older */
> ++    if (GST_BUFFER_TIMESTAMP (buffer) < best_time) {
> ++      best_time =3D GST_BUFFER_TIMESTAMP (buffer);
> ++      best_pad =3D collect_pad;
> ++    }
> ++
> ++  next_pad:
> ++    gst_buffer_unref (buffer);
> ++
> ++    /* Mux buffers with invalid timestamp first */
> ++    if (!GST_CLOCK_TIME_IS_VALID (best_time))
> ++      break;
> ++  }
> ++
> ++  /* now handle the buffer, or signal EOS if we have
> ++   * no buffers left */
> ++  if (best_pad !=3D NULL) {
> ++    GstBuffer *buf;
> ++    AVPacket pkt;
> ++    gboolean need_free =3D FALSE;
> ++
> ++    /* push out current buffer */
> ++    buf =3D gst_collect_pads_pop (ffmpegmux->collect,
> ++        (GstCollectData *) best_pad);
> ++
> ++    ffmpegmux->context->streams[best_pad->padnum]->codec->frame_number+=
+;
> ++
> ++    /* set time */
> ++    pkt.pts =3D gst_ffmpeg_time_gst_to_ff (GST_BUFFER_TIMESTAMP (buf),
> ++        ffmpegmux->context->streams[best_pad->padnum]->time_base);
> ++    pkt.dts =3D pkt.pts;
> ++
> ++    if (strcmp (ffmpegmux->context->oformat->name, "gif") =3D=3D 0) {
> ++      AVStream *st =3D ffmpegmux->context->streams[best_pad->padnum];
> ++      AVPicture src, dst;
> ++
> ++      need_free =3D TRUE;
> ++      pkt.size =3D st->codec->width * st->codec->height * 3;
> ++      pkt.data =3D g_malloc (pkt.size);
> ++
> ++      dst.data[0] =3D pkt.data;
> ++      dst.data[1] =3D NULL;
> ++      dst.data[2] =3D NULL;
> ++      dst.linesize[0] =3D st->codec->width * 3;
> ++
> ++      gst_ffmpeg_avpicture_fill (&src, GST_BUFFER_DATA (buf),
> ++          PIX_FMT_RGB24, st->codec->width, st->codec->height);
> ++
> ++      av_picture_copy (&dst, &src, PIX_FMT_RGB24,
> ++          st->codec->width, st->codec->height);
> ++    } else {
> ++      pkt.data =3D GST_BUFFER_DATA (buf);
> ++      pkt.size =3D GST_BUFFER_SIZE (buf);
> ++    }
> ++
> ++    pkt.stream_index =3D best_pad->padnum;
> ++    pkt.flags =3D 0;
> ++
> ++    if (!GST_BUFFER_FLAG_IS_SET (buf, GST_BUFFER_FLAG_DELTA_UNIT))
> ++      pkt.flags |=3D AV_PKT_FLAG_KEY;
> ++
> ++    if (GST_BUFFER_DURATION_IS_VALID (buf))
> ++      pkt.duration =3D
> ++          gst_ffmpeg_time_gst_to_ff (GST_BUFFER_DURATION (buf),
> ++          ffmpegmux->context->streams[best_pad->padnum]->time_base);
> ++    else
> ++      pkt.duration =3D 0;
> ++    av_write_frame (ffmpegmux->context, &pkt);
> ++    gst_buffer_unref (buf);
> ++    if (need_free)
> ++      g_free (pkt.data);
> ++  } else {
> ++    /* close down */
> ++    av_write_trailer (ffmpegmux->context);
> ++    ffmpegmux->opened =3D FALSE;
> ++    put_flush_packet (ffmpegmux->context->pb);
> ++    url_fclose (ffmpegmux->context->pb);
> ++    gst_pad_push_event (ffmpegmux->srcpad, gst_event_new_eos ());
> ++    return GST_FLOW_UNEXPECTED;
> ++  }
> ++
> ++  return GST_FLOW_OK;
> ++}
> ++
> ++static GstStateChangeReturn
> ++gst_ffmpegmux_change_state (GstElement * element, GstStateChange transi=
tion)
> ++{
> ++  GstFlowReturn ret;
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) (element);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_NULL_TO_READY:
> ++      break;
> ++    case GST_STATE_CHANGE_READY_TO_PAUSED:
> ++      gst_collect_pads_start (ffmpegmux->collect);
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_PLAYING:
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      gst_collect_pads_stop (ffmpegmux->collect);
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  ret =3D GST_ELEMENT_CLASS (parent_class)->change_state (element, tran=
sition);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      gst_tag_setter_reset_tags (GST_TAG_SETTER (ffmpegmux));
> ++      if (ffmpegmux->opened) {
> ++        ffmpegmux->opened =3D FALSE;
> ++        url_fclose (ffmpegmux->context->pb);
> ++      }
> ++      break;
> ++    case GST_STATE_CHANGE_READY_TO_NULL:
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  return ret;
> ++}
> ++
> ++static GstCaps *
> ++gst_ffmpegmux_get_id_caps (enum CodecID *id_list)
> ++{
> ++  GstCaps *caps, *t;
> ++  gint i;
> ++
> ++  caps =3D gst_caps_new_empty ();
> ++  for (i =3D 0; id_list[i] !=3D CODEC_ID_NONE; i++) {
> ++    if ((t =3D gst_ffmpeg_codecid_to_caps (id_list[i], NULL, TRUE)))
> ++      gst_caps_append (caps, t);
> ++  }
> ++  if (gst_caps_is_empty (caps)) {
> ++    gst_caps_unref (caps);
> ++    return NULL;
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* set a list of integer values on the caps, e.g. for sample rates */
> ++static void
> ++gst_ffmpeg_mux_simple_caps_set_int_list (GstCaps * caps, const gchar * =
field,
> ++    guint num, const gint * values)
> ++{
> ++  GValue list =3D { 0, };
> ++  GValue val =3D { 0, };
> ++  gint i;
> ++
> ++  g_return_if_fail (GST_CAPS_IS_SIMPLE (caps));
> ++
> ++  g_value_init (&list, GST_TYPE_LIST);
> ++  g_value_init (&val, G_TYPE_INT);
> ++
> ++  for (i =3D 0; i < num; ++i) {
> ++    g_value_set_int (&val, values[i]);
> ++    gst_value_list_append_value (&list, &val);
> ++  }
> ++
> ++  gst_structure_set_value (gst_caps_get_structure (caps, 0), field, &li=
st);
> ++
> ++  g_value_unset (&val);
> ++  g_value_unset (&list);
> ++}
> ++
> ++gboolean
> ++gst_ffmpegmux_register (GstPlugin * plugin)
> ++{
> ++  GTypeInfo typeinfo =3D {
> ++    sizeof (GstFFMpegMuxClass),
> ++    (GBaseInitFunc) gst_ffmpegmux_base_init,
> ++    NULL,
> ++    (GClassInitFunc) gst_ffmpegmux_class_init,
> ++    NULL,
> ++    NULL,
> ++    sizeof (GstFFMpegMux),
> ++    0,
> ++    (GInstanceInitFunc) gst_ffmpegmux_init,
> ++  };
> ++  static const GInterfaceInfo tag_setter_info =3D {
> ++    NULL, NULL, NULL
> ++  };
> ++  GType type;
> ++  AVOutputFormat *in_plugin;
> ++
> ++  in_plugin =3D av_oformat_next (NULL);
> ++
> ++  GST_LOG ("Registering muxers");
> ++
> ++  while (in_plugin) {
> ++    gchar *type_name;
> ++    gchar *p;
> ++    GstRank rank =3D GST_RANK_MARGINAL;
> ++
> ++    if ((!strncmp (in_plugin->name, "u16", 3)) ||
> ++        (!strncmp (in_plugin->name, "s16", 3)) ||
> ++        (!strncmp (in_plugin->name, "u24", 3)) ||
> ++        (!strncmp (in_plugin->name, "s24", 3)) ||
> ++        (!strncmp (in_plugin->name, "u8", 2)) ||
> ++        (!strncmp (in_plugin->name, "s8", 2)) ||
> ++        (!strncmp (in_plugin->name, "u32", 3)) ||
> ++        (!strncmp (in_plugin->name, "s32", 3)) ||
> ++        (!strncmp (in_plugin->name, "f32", 3)) ||
> ++        (!strncmp (in_plugin->name, "f64", 3)) ||
> ++        (!strncmp (in_plugin->name, "raw", 3)) ||
> ++        (!strncmp (in_plugin->name, "crc", 3)) ||
> ++        (!strncmp (in_plugin->name, "null", 4)) ||
> ++        (!strncmp (in_plugin->name, "gif", 3)) ||
> ++        (!strncmp (in_plugin->name, "frame", 5)) ||
> ++        (!strncmp (in_plugin->name, "image", 5)) ||
> ++        (!strncmp (in_plugin->name, "mulaw", 5)) ||
> ++        (!strncmp (in_plugin->name, "alaw", 4)) ||
> ++        (!strncmp (in_plugin->name, "h26", 3)) ||
> ++        (!strncmp (in_plugin->name, "rtp", 3)) ||
> ++        (!strncmp (in_plugin->name, "ass", 3)) ||
> ++        (!strncmp (in_plugin->name, "ffmetadata", 10)) ||
> ++        (!strncmp (in_plugin->name, "srt", 3))
> ++        ) {
> ++      GST_LOG ("Ignoring muxer %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if ((!strncmp (in_plugin->long_name, "raw ", 4))) {
> ++      GST_LOG ("Ignoring raw muxer %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if (gst_ffmpegmux_get_replacement (in_plugin->name))
> ++      rank =3D GST_RANK_NONE;
> ++
> ++    /* FIXME : We need a fast way to know whether we have mappings for =
this
> ++     * muxer type. */
> ++
> ++    /* construct the type */
> ++    type_name =3D g_strdup_printf ("ffmux_%s", in_plugin->name);
> ++
> ++    p =3D type_name;
> ++
> ++    while (*p) {
> ++      if (*p =3D=3D '.')
> ++        *p =3D '_';
> ++      p++;
> ++    }
> ++
> ++    type =3D g_type_from_name (type_name);
> ++
> ++    if (!type) {
> ++      /* create the type now */
> ++      type =3D g_type_register_static (GST_TYPE_ELEMENT, type_name, &ty=
peinfo, 0);
> ++      g_type_set_qdata (type, GST_FFMUX_PARAMS_QDATA, (gpointer) in_plu=
gin);
> ++      g_type_add_interface_static (type, GST_TYPE_TAG_SETTER, &tag_sett=
er_info);
> ++    }
> ++
> ++    if (!gst_element_register (plugin, type_name, rank, type)) {
> ++      g_free (type_name);
> ++      return FALSE;
> ++    }
> ++
> ++    g_free (type_name);
> ++
> ++  next:
> ++    in_plugin =3D av_oformat_next (in_plugin);
> ++  }
> ++
> ++  GST_LOG ("Finished registering muxers");
> ++
> ++  return TRUE;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegprotocol.c gst-ffm=
peg-0.10.13/ext/ffmpeg/gstffmpegprotocol.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegprotocol.c	2011-07-12 16=
:35:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegprotocol.c	2014-08-08 15:26:0=
7.875857555 +0200
> +@@ -46,63 +46,14 @@
> + };
> +=20
> + static int
> +-gst_ffmpegdata_open (URLContext * h, const char *filename, int flags)
> +-{
> +-  GstProtocolInfo *info;
> +-  GstPad *pad;
> +-
> +-  GST_LOG ("Opening %s", filename);
> +-
> +-  info =3D g_new0 (GstProtocolInfo, 1);
> +-
> +-  info->set_streamheader =3D flags & GST_FFMPEG_URL_STREAMHEADER;
> +-  flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +-  h->flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +-
> +-  /* we don't support R/W together */
> +-  if (flags !=3D URL_RDONLY && flags !=3D URL_WRONLY) {
> +-    GST_WARNING ("Only read-only or write-only are supported");
> +-    return -EINVAL;
> +-  }
> +-
> +-  if (sscanf (&filename[12], "%p", &pad) !=3D 1) {
> +-    GST_WARNING ("could not decode pad from %s", filename);
> +-    return -EIO;
> +-  }
> +-
> +-  /* make sure we're a pad and that we're of the right type */
> +-  g_return_val_if_fail (GST_IS_PAD (pad), -EINVAL);
> +-
> +-  switch (flags) {
> +-    case URL_RDONLY:
> +-      g_return_val_if_fail (GST_PAD_IS_SINK (pad), -EINVAL);
> +-      break;
> +-    case URL_WRONLY:
> +-      g_return_val_if_fail (GST_PAD_IS_SRC (pad), -EINVAL);
> +-      break;
> +-  }
> +-
> +-  info->eos =3D FALSE;
> +-  info->pad =3D pad;
> +-  info->offset =3D 0;
> +-
> +-  h->priv_data =3D (void *) info;
> +-  h->is_streamed =3D FALSE;
> +-  h->max_packet_size =3D 0;
> +-
> +-  return 0;
> +-}
> +-
> +-static int
> +-gst_ffmpegdata_peek (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpegdata_peek (void *priv_data, unsigned char *buf, int size)
> + {
> +   GstProtocolInfo *info;
> +   GstBuffer *inbuf =3D NULL;
> +   GstFlowReturn ret;
> +   int total =3D 0;
> +=20
> +-  g_return_val_if_fail (h->flags =3D=3D URL_RDONLY, AVERROR (EIO));
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +=20
> +   GST_DEBUG ("Pulling %d bytes at position %" G_GUINT64_FORMAT, size,
> +       info->offset);
> +@@ -134,17 +85,17 @@
> + }
> +=20
> + static int
> +-gst_ffmpegdata_read (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpegdata_read (void *priv_data, unsigned char *buf, int size)
> + {
> +   gint res;
> +   GstProtocolInfo *info;
> +=20
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +=20
> +   GST_DEBUG ("Reading %d bytes of data at position %" G_GUINT64_FORMAT,=
 size,
> +       info->offset);
> +=20
> +-  res =3D gst_ffmpegdata_peek (h, buf, size);
> ++  res =3D gst_ffmpegdata_peek (priv_data, buf, size);
> +   if (res >=3D 0)
> +     info->offset +=3D res;
> +=20
> +@@ -154,15 +105,13 @@
> + }
> +=20
> + static int
> +-gst_ffmpegdata_write (URLContext * h, const unsigned char *buf, int siz=
e)
> ++gst_ffmpegdata_write (void *priv_data, const unsigned char *buf, int si=
ze)
> + {
> +   GstProtocolInfo *info;
> +   GstBuffer *outbuf;
> +=20
> +   GST_DEBUG ("Writing %d bytes", size);
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> +-
> +-  g_return_val_if_fail (h->flags !=3D URL_RDONLY, -EIO);
> ++  info =3D (GstProtocolInfo *) priv_data;
> +=20
> +   /* create buffer and push data further */
> +   if (gst_pad_alloc_buffer_and_set_caps (info->pad,
> +@@ -179,7 +128,7 @@
> + }
> +=20
> + static int64_t
> +-gst_ffmpegdata_seek (URLContext * h, int64_t pos, int whence)
> ++gst_ffmpegdata_seek (void *priv_data, int64_t pos, int whence)
> + {
> +   GstProtocolInfo *info;
> +   guint64 newpos =3D 0;
> +@@ -187,70 +136,62 @@
> +   GST_DEBUG ("Seeking to %" G_GINT64_FORMAT ", whence=3D%d",
> +       (gint64) pos, whence);
> +=20
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +=20
> +   /* TODO : if we are push-based, we need to return sensible info */
> +=20
> +-  switch (h->flags) {
> +-    case URL_RDONLY:
> +-    {
> +-      /* sinkpad */
> +-      switch (whence) {
> +-        case SEEK_SET:
> +-          newpos =3D (guint64) pos;
> +-          break;
> +-        case SEEK_CUR:
> +-          newpos =3D info->offset + pos;
> +-          break;
> +-        case SEEK_END:
> +-        case AVSEEK_SIZE:
> +-          /* ffmpeg wants to know the current end position in bytes ! */
> +-        {
> +-          GstFormat format =3D GST_FORMAT_BYTES;
> +-          gint64 duration;
> +-
> +-          GST_DEBUG ("Seek end");
> +-
> +-          if (gst_pad_is_linked (info->pad))
> +-            if (gst_pad_query_duration (GST_PAD_PEER (info->pad), &form=
at,
> +-                    &duration))
> +-              newpos =3D ((guint64) duration) + pos;
> +-        }
> +-          break;
> +-        default:
> +-          g_assert (0);
> +-          break;
> ++  if (GST_PAD_IS_SINK (info->pad)) {
> ++    /* sinkpad */
> ++    switch (whence) {
> ++      case SEEK_SET:
> ++        newpos =3D (guint64) pos;
> ++        break;
> ++      case SEEK_CUR:
> ++        newpos =3D info->offset + pos;
> ++        break;
> ++      case SEEK_END:
> ++      case AVSEEK_SIZE:
> ++        /* ffmpeg wants to know the current end position in bytes ! */
> ++      {
> ++        GstFormat format =3D GST_FORMAT_BYTES;
> ++        gint64 duration;
> ++
> ++        GST_DEBUG ("Seek end");
> ++
> ++        if (gst_pad_is_linked (info->pad))
> ++          if (gst_pad_query_duration (GST_PAD_PEER (info->pad), &format,
> ++                  &duration))
> ++            newpos =3D ((guint64) duration) + pos;
> +       }
> +-      /* FIXME : implement case for push-based behaviour */
> +-      if (whence !=3D AVSEEK_SIZE)
> +-        info->offset =3D newpos;
> ++        break;
> ++      default:
> ++        g_assert (0);
> ++        break;
> +     }
> +-      break;
> +-    case URL_WRONLY:
> +-    {
> +-      /* srcpad */
> +-      switch (whence) {
> +-        case SEEK_SET:
> +-          info->offset =3D (guint64) pos;
> +-          gst_pad_push_event (info->pad, gst_event_new_new_segment
> +-              (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> +-                  GST_CLOCK_TIME_NONE, info->offset));
> +-          break;
> +-        case SEEK_CUR:
> +-          info->offset +=3D pos;
> +-          gst_pad_push_event (info->pad, gst_event_new_new_segment
> +-              (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> +-                  GST_CLOCK_TIME_NONE, info->offset));
> +-          break;
> +-        default:
> +-          break;
> +-      }
> +-      newpos =3D info->offset;
> ++    /* FIXME : implement case for push-based behaviour */
> ++    if (whence !=3D AVSEEK_SIZE)
> ++      info->offset =3D newpos;
> ++  } else if (GST_PAD_IS_SRC (info->pad)) {
> ++    /* srcpad */
> ++    switch (whence) {
> ++      case SEEK_SET:
> ++        info->offset =3D (guint64) pos;
> ++        gst_pad_push_event (info->pad, gst_event_new_new_segment
> ++            (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> ++                GST_CLOCK_TIME_NONE, info->offset));
> ++        break;
> ++      case SEEK_CUR:
> ++        info->offset +=3D pos;
> ++        gst_pad_push_event (info->pad, gst_event_new_new_segment
> ++            (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> ++                GST_CLOCK_TIME_NONE, info->offset));
> ++        break;
> ++      default:
> ++        break;
> +     }
> +-      break;
> +-    default:
> +-      g_assert (0);
> +-      break;
> ++    newpos =3D info->offset;
> ++  } else {
> ++    g_assert_not_reached ();
> +   }
> +=20
> +   GST_DEBUG ("Now at offset %" G_GUINT64_FORMAT " (returning %" G_GUINT=
64_FORMAT
> +@@ -258,85 +199,91 @@
> +   return newpos;
> + }
> +=20
> +-static int
> +-gst_ffmpegdata_close (URLContext * h)
> ++int
> ++gst_ffmpegdata_close (AVIOContext * h)
> + {
> +   GstProtocolInfo *info;
> +=20
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) h->opaque;
> +   if (info =3D=3D NULL)
> +     return 0;
> +=20
> +   GST_LOG ("Closing file");
> +=20
> +-  switch (h->flags) {
> +-    case URL_WRONLY:
> +-    {
> +-      /* send EOS - that closes down the stream */
> +-      gst_pad_push_event (info->pad, gst_event_new_eos ());
> +-      break;
> +-    }
> +-    default:
> +-      break;
> ++  if (GST_PAD_IS_SRC (info->pad)) {
> ++    /* send EOS - that closes down the stream */
> ++    gst_pad_push_event (info->pad, gst_event_new_eos ());
> +   }
> +=20
> +   /* clean up data */
> +   g_free (info);
> +-  h->priv_data =3D NULL;
> ++  h->opaque =3D NULL;
> ++
> ++  av_freep (&h->buffer);
> ++  av_free (h);
> +=20
> +   return 0;
> + }
> +=20
> ++int
> ++gst_ffmpegdata_open (GstPad * pad, int flags, AVIOContext ** context)
> ++{
> ++  GstProtocolInfo *info;
> ++  static const int buffer_size =3D 4096;
> ++  unsigned char *buffer =3D NULL;
> +=20
> +-URLProtocol gstreamer_protocol =3D {
> +-  /*.name =3D */ "gstreamer",
> +-  /*.url_open =3D */ gst_ffmpegdata_open,
> +-  /*.url_read =3D */ gst_ffmpegdata_read,
> +-  /*.url_write =3D */ gst_ffmpegdata_write,
> +-  /*.url_seek =3D */ gst_ffmpegdata_seek,
> +-  /*.url_close =3D */ gst_ffmpegdata_close,
> +-};
> ++  info =3D g_new0 (GstProtocolInfo, 1);
> +=20
> ++  info->set_streamheader =3D flags & GST_FFMPEG_URL_STREAMHEADER;
> ++  flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +=20
> +-/* specialized protocol for cross-thread pushing,
> +- * based on ffmpeg's pipe protocol */
> ++  /* we don't support R/W together */
> ++  if ((flags & AVIO_FLAG_WRITE) && (flags & AVIO_FLAG_READ)) {
> ++    GST_WARNING ("Only read-only or write-only are supported");
> ++    return -EINVAL;
> ++  }
> +=20
> +-static int
> +-gst_ffmpeg_pipe_open (URLContext * h, const char *filename, int flags)
> +-{
> +-  GstFFMpegPipe *ffpipe;
> ++  /* make sure we're a pad and that we're of the right type */
> ++  g_return_val_if_fail (GST_IS_PAD (pad), -EINVAL);
> +=20
> +-  GST_LOG ("Opening %s", filename);
> ++  if ((flags & AVIO_FLAG_READ))
> ++    g_return_val_if_fail (GST_PAD_IS_SINK (pad), -EINVAL);
> ++  if ((flags & AVIO_FLAG_WRITE))
> ++    g_return_val_if_fail (GST_PAD_IS_SRC (pad), -EINVAL);
> +=20
> +-  /* we don't support W together */
> +-  if (flags !=3D URL_RDONLY) {
> +-    GST_WARNING ("Only read-only is supported");
> +-    return -EINVAL;
> +-  }
> ++  info->eos =3D FALSE;
> ++  info->pad =3D pad;
> ++  info->offset =3D 0;
> +=20
> +-  if (sscanf (&filename[10], "%p", &ffpipe) !=3D 1) {
> +-    GST_WARNING ("could not decode pipe info from %s", filename);
> +-    return -EIO;
> ++  buffer =3D av_malloc (buffer_size);
> ++  if (buffer =3D=3D NULL) {
> ++    GST_WARNING ("Failed to allocate buffer");
> ++    return -ENOMEM;
> +   }
> +=20
> +-  /* sanity check */
> +-  g_return_val_if_fail (GST_IS_ADAPTER (ffpipe->adapter), -EINVAL);
> +-
> +-  h->priv_data =3D (void *) ffpipe;
> +-  h->is_streamed =3D TRUE;
> +-  h->max_packet_size =3D 0;
> ++  *context =3D
> ++      avio_alloc_context (buffer, buffer_size, flags, (void *) info,
> ++      gst_ffmpegdata_read, gst_ffmpegdata_write, gst_ffmpegdata_seek);
> ++  (*context)->seekable =3D AVIO_SEEKABLE_NORMAL;
> ++  if (!(flags & AVIO_FLAG_WRITE)) {
> ++    (*context)->buf_ptr =3D (*context)->buf_end;
> ++    (*context)->write_flag =3D 0;
> ++  }
> +=20
> +   return 0;
> + }
> +=20
> ++/* specialized protocol for cross-thread pushing,
> ++ * based on ffmpeg's pipe protocol */
> ++
> + static int
> +-gst_ffmpeg_pipe_read (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpeg_pipe_read (void *priv_data, unsigned char *buf, int size)
> + {
> +   GstFFMpegPipe *ffpipe;
> +   const guint8 *data;
> +   guint available;
> +=20
> +-  ffpipe =3D (GstFFMpegPipe *) h->priv_data;
> ++  ffpipe =3D (GstFFMpegPipe *) priv_data;
> +=20
> +   GST_LOG ("requested size %d", size);
> +=20
> +@@ -367,21 +314,38 @@
> +   return size;
> + }
> +=20
> +-static int
> +-gst_ffmpeg_pipe_close (URLContext * h)
> ++int
> ++gst_ffmpeg_pipe_close (AVIOContext * h)
> + {
> +   GST_LOG ("Closing pipe");
> +=20
> +-  h->priv_data =3D NULL;
> ++  h->opaque =3D NULL;
> ++  av_freep (&h->buffer);
> ++  av_free (h);
> +=20
> +   return 0;
> + }
> +=20
> +-URLProtocol gstpipe_protocol =3D {
> +-  "gstpipe",
> +-  gst_ffmpeg_pipe_open,
> +-  gst_ffmpeg_pipe_read,
> +-  NULL,
> +-  NULL,
> +-  gst_ffmpeg_pipe_close,
> +-};
> ++int
> ++gst_ffmpeg_pipe_open (GstFFMpegPipe * ffpipe, int flags, AVIOContext **=
 context)
> ++{
> ++  static const int buffer_size =3D 4096;
> ++  unsigned char *buffer =3D NULL;
> ++
> ++  /* sanity check */
> ++  g_return_val_if_fail (GST_IS_ADAPTER (ffpipe->adapter), -EINVAL);
> ++
> ++  buffer =3D av_malloc (buffer_size);
> ++  if (buffer =3D=3D NULL) {
> ++    GST_WARNING ("Failed to allocate buffer");
> ++    return -ENOMEM;
> ++  }
> ++
> ++  *context =3D
> ++      avio_alloc_context (buffer, buffer_size, 0, (void *) ffpipe,
> ++      gst_ffmpeg_pipe_read, NULL, NULL);
> ++  (*context)->seekable =3D 0;
> ++  (*context)->buf_ptr =3D (*context)->buf_end;
> ++
> ++  return 0;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c gst-ffmpeg=
-0.10.13/ext/ffmpeg/gstffmpegutils.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c	2011-07-13 11:07=
:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c	2014-08-08 15:34:04.0=
07874626 +0200
> +@@ -25,6 +25,11 @@
> + #ifdef __APPLE__
> + #include <sys/sysctl.h>
> + #endif
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avformat.h>
> ++#else
> ++#include <libavformat/avformat.h>
> ++#endif
> +=20
> + G_CONST_RETURN gchar *
> + gst_ffmpeg_get_codecid_longname (enum CodecID codec_id)
> +@@ -39,21 +44,21 @@
> + }
> +=20
> + gint
> +-av_smp_format_depth (enum SampleFormat smp_fmt)
> ++av_smp_format_depth (enum AVSampleFormat smp_fmt)
> + {
> +   gint depth =3D -1;
> +   switch (smp_fmt) {
> +-    case SAMPLE_FMT_U8:
> ++    case AV_SAMPLE_FMT_U8:
> +       depth =3D 1;
> +       break;
> +-    case SAMPLE_FMT_S16:
> ++    case AV_SAMPLE_FMT_S16:
> +       depth =3D 2;
> +       break;
> +-    case SAMPLE_FMT_S32:
> +-    case SAMPLE_FMT_FLT:
> ++    case AV_SAMPLE_FMT_S32:
> ++    case AV_SAMPLE_FMT_FLT:
> +       depth =3D 4;
> +       break;
> +-    case SAMPLE_FMT_DBL:
> ++    case AV_SAMPLE_FMT_DBL:
> +       depth =3D 8;
> +       break;
> +     default:
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c.orig gst-f=
fmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c.orig	1970-01-01 =
01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c.orig	2011-07-13 11:07=
:28.000000000 +0200
> +@@ -0,0 +1,483 @@
> ++/* GStreamer
> ++ * Copyright (c) 2009 Edward Hervey <bilboed@bilboed.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++#include "gstffmpegutils.h"
> ++#include <unistd.h>
> ++#ifdef __APPLE__
> ++#include <sys/sysctl.h>
> ++#endif
> ++
> ++G_CONST_RETURN gchar *
> ++gst_ffmpeg_get_codecid_longname (enum CodecID codec_id)
> ++{
> ++  AVCodec *codec;
> ++  /* Let's use what ffmpeg can provide us */
> ++
> ++  if ((codec =3D avcodec_find_decoder (codec_id)) ||
> ++      (codec =3D avcodec_find_encoder (codec_id)))
> ++    return codec->long_name;
> ++  return NULL;
> ++}
> ++
> ++gint
> ++av_smp_format_depth (enum SampleFormat smp_fmt)
> ++{
> ++  gint depth =3D -1;
> ++  switch (smp_fmt) {
> ++    case SAMPLE_FMT_U8:
> ++      depth =3D 1;
> ++      break;
> ++    case SAMPLE_FMT_S16:
> ++      depth =3D 2;
> ++      break;
> ++    case SAMPLE_FMT_S32:
> ++    case SAMPLE_FMT_FLT:
> ++      depth =3D 4;
> ++      break;
> ++    case SAMPLE_FMT_DBL:
> ++      depth =3D 8;
> ++      break;
> ++    default:
> ++      GST_ERROR ("UNHANDLED SAMPLE FORMAT !");
> ++      break;
> ++  }
> ++  return depth;
> ++}
> ++
> ++
> ++/*
> ++ * Fill in pointers to memory in a AVPicture, where
> ++ * everything is aligned by 4 (as required by X).
> ++ * This is mostly a copy from imgconvert.c with some
> ++ * small changes.
> ++ */
> ++
> ++#define FF_COLOR_RGB      0     /* RGB color space */
> ++#define FF_COLOR_GRAY     1     /* gray color space */
> ++#define FF_COLOR_YUV      2     /* YUV color space. 16 <=3D Y <=3D 235,=
 16 <=3D U, V <=3D 240 */
> ++#define FF_COLOR_YUV_JPEG 3     /* YUV color space. 0 <=3D Y <=3D 255, =
0 <=3D U, V <=3D 255 */
> ++
> ++#define FF_PIXEL_PLANAR   0     /* each channel has one component in AV=
Picture */
> ++#define FF_PIXEL_PACKED   1     /* only one components containing all t=
he channels */
> ++#define FF_PIXEL_PALETTE  2     /* one components containing indexes fo=
r a palette */
> ++
> ++typedef struct PixFmtInfo
> ++{
> ++  const char *name;
> ++  uint8_t nb_channels;          /* number of channels (including alpha)=
 */
> ++  uint8_t color_type;           /* color type (see FF_COLOR_xxx constan=
ts) */
> ++  uint8_t pixel_type;           /* pixel storage type (see FF_PIXEL_xxx=
 constants) */
> ++  uint8_t is_alpha:1;           /* true if alpha can be specified */
> ++  uint8_t x_chroma_shift;       /* X chroma subsampling factor is 2 ^ s=
hift */
> ++  uint8_t y_chroma_shift;       /* Y chroma subsampling factor is 2 ^ s=
hift */
> ++  uint8_t depth;                /* bit depth of the color components */
> ++} PixFmtInfo;
> ++
> ++
> ++/* this table gives more information about formats */
> ++static PixFmtInfo pix_fmt_info[PIX_FMT_NB];
> ++void
> ++gst_ffmpeg_init_pix_fmt_info (void)
> ++{
> ++  /* YUV formats */
> ++  pix_fmt_info[PIX_FMT_YUV420P].name =3D g_strdup ("yuv420p");
> ++  pix_fmt_info[PIX_FMT_YUV420P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV420P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV420P].depth =3D 8,
> ++      pix_fmt_info[PIX_FMT_YUV420P].x_chroma_shift =3D 1,
> ++      pix_fmt_info[PIX_FMT_YUV420P].y_chroma_shift =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV422P].name =3D g_strdup ("yuv422p");
> ++  pix_fmt_info[PIX_FMT_YUV422P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV422P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV422P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV422P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV422P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUV422P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV444P].name =3D g_strdup ("yuv444p");
> ++  pix_fmt_info[PIX_FMT_YUV444P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV444P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV444P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV444P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV444P].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_YUV444P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUYV422].name =3D g_strdup ("yuv422");
> ++  pix_fmt_info[PIX_FMT_YUYV422].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUYV422].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUYV422].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_YUYV422].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUYV422].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUYV422].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV410P].name =3D g_strdup ("yuv410p");
> ++  pix_fmt_info[PIX_FMT_YUV410P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV410P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV410P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV410P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV410P].x_chroma_shift =3D 2;
> ++  pix_fmt_info[PIX_FMT_YUV410P].y_chroma_shift =3D 2;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV411P].name =3D g_strdup ("yuv411p");
> ++  pix_fmt_info[PIX_FMT_YUV411P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV411P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV411P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV411P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV411P].x_chroma_shift =3D 2;
> ++  pix_fmt_info[PIX_FMT_YUV411P].y_chroma_shift =3D 0;
> ++
> ++  /* JPEG YUV */
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].name =3D g_strdup ("yuvj420p");
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].y_chroma_shift =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].name =3D g_strdup ("yuvj422p");
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].name =3D g_strdup ("yuvj444p");
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].y_chroma_shift =3D 0;
> ++
> ++  /* RGB formats */
> ++  pix_fmt_info[PIX_FMT_RGB24].name =3D g_strdup ("rgb24");
> ++  pix_fmt_info[PIX_FMT_RGB24].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_RGB24].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB24].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB24].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_RGB24].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB24].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_BGR24].name =3D g_strdup ("bgr24");
> ++  pix_fmt_info[PIX_FMT_BGR24].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_BGR24].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_BGR24].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_BGR24].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_BGR24].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_BGR24].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB32].name =3D g_strdup ("rgba32");
> ++  pix_fmt_info[PIX_FMT_RGB32].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_RGB32].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_RGB32].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB32].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB32].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_RGB32].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB32].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB565].name =3D g_strdup ("rgb565");
> ++  pix_fmt_info[PIX_FMT_RGB565].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_RGB565].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB565].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB565].depth =3D 5;
> ++  pix_fmt_info[PIX_FMT_RGB565].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB565].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB555].name =3D g_strdup ("rgb555");
> ++  pix_fmt_info[PIX_FMT_RGB555].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_RGB555].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_RGB555].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB555].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB555].depth =3D 5;
> ++  pix_fmt_info[PIX_FMT_RGB555].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB555].y_chroma_shift =3D 0;
> ++
> ++  /* gray / mono formats */
> ++  pix_fmt_info[PIX_FMT_GRAY8].name =3D g_strdup ("gray");
> ++  pix_fmt_info[PIX_FMT_GRAY8].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_GRAY8].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_GRAY8].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_GRAY8].depth =3D 8;
> ++
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].name =3D g_strdup ("monow");
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].depth =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].name =3D g_strdup ("monob");
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].depth =3D 1;
> ++
> ++  /* paletted formats */
> ++  pix_fmt_info[PIX_FMT_PAL8].name =3D g_strdup ("pal8");
> ++  pix_fmt_info[PIX_FMT_PAL8].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_PAL8].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_PAL8].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_PAL8].pixel_type =3D FF_PIXEL_PALETTE;
> ++  pix_fmt_info[PIX_FMT_PAL8].depth =3D 8;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVA420P].name =3D g_strdup ("yuva420p");
> ++  pix_fmt_info[PIX_FMT_YUVA420P].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].depth =3D 8,
> ++      pix_fmt_info[PIX_FMT_YUVA420P].x_chroma_shift =3D 1,
> ++      pix_fmt_info[PIX_FMT_YUVA420P].y_chroma_shift =3D 1;
> ++};
> ++
> ++int
> ++gst_ffmpeg_avpicture_get_size (int pix_fmt, int width, int height)
> ++{
> ++  AVPicture dummy_pict;
> ++
> ++  return gst_ffmpeg_avpicture_fill (&dummy_pict, NULL, pix_fmt, width, =
height);
> ++}
> ++
> ++#define GEN_MASK(x) ((1<<(x))-1)
> ++#define ROUND_UP_X(v,x) (((v) + GEN_MASK(x)) & ~GEN_MASK(x))
> ++#define ROUND_UP_2(x) ROUND_UP_X (x, 1)
> ++#define ROUND_UP_4(x) ROUND_UP_X (x, 2)
> ++#define ROUND_UP_8(x) ROUND_UP_X (x, 3)
> ++#define DIV_ROUND_UP_X(v,x) (((v) + GEN_MASK(x)) >> (x))
> ++
> ++int
> ++gst_ffmpeg_avpicture_fill (AVPicture * picture,
> ++    uint8_t * ptr, enum PixelFormat pix_fmt, int width, int height)
> ++{
> ++  int size, w2, h2, size2;
> ++  int stride, stride2;
> ++  PixFmtInfo *pinfo;
> ++
> ++  pinfo =3D &pix_fmt_info[pix_fmt];
> ++
> ++  switch (pix_fmt) {
> ++    case PIX_FMT_YUV420P:
> ++    case PIX_FMT_YUV422P:
> ++    case PIX_FMT_YUV444P:
> ++    case PIX_FMT_YUV410P:
> ++    case PIX_FMT_YUV411P:
> ++    case PIX_FMT_YUVJ420P:
> ++    case PIX_FMT_YUVJ422P:
> ++    case PIX_FMT_YUVJ444P:
> ++      stride =3D ROUND_UP_4 (width);
> ++      h2 =3D ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size =3D stride * h2;
> ++      w2 =3D DIV_ROUND_UP_X (width, pinfo->x_chroma_shift);
> ++      stride2 =3D ROUND_UP_4 (w2);
> ++      h2 =3D DIV_ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size2 =3D stride2 * h2;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D picture->data[0] + size;
> ++      picture->data[2] =3D picture->data[1] + size2;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D stride2;
> ++      picture->linesize[2] =3D stride2;
> ++      picture->linesize[3] =3D 0;
> ++      GST_DEBUG ("planes %d %d %d", 0, size, size + size2);
> ++      GST_DEBUG ("strides %d %d %d", stride, stride2, stride2);
> ++      return size + 2 * size2;
> ++    case PIX_FMT_YUVA420P:
> ++      stride =3D ROUND_UP_4 (width);
> ++      h2 =3D ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size =3D stride * h2;
> ++      w2 =3D DIV_ROUND_UP_X (width, pinfo->x_chroma_shift);
> ++      stride2 =3D ROUND_UP_4 (w2);
> ++      h2 =3D DIV_ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size2 =3D stride2 * h2;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D picture->data[0] + size;
> ++      picture->data[2] =3D picture->data[1] + size2;
> ++      picture->data[3] =3D picture->data[2] + size2;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D stride2;
> ++      picture->linesize[2] =3D stride2;
> ++      picture->linesize[3] =3D stride;
> ++      GST_DEBUG ("planes %d %d %d %d", 0, size, size + size2, size + 2 =
* size2);
> ++      GST_DEBUG ("strides %d %d %d %d", stride, stride2, stride2, strid=
e);
> ++      return 2 * size + 2 * size2;
> ++    case PIX_FMT_RGB24:
> ++    case PIX_FMT_BGR24:
> ++      stride =3D ROUND_UP_4 (width * 3);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++      /*case PIX_FMT_AYUV4444:
> ++         case PIX_FMT_BGR32:
> ++         case PIX_FMT_BGRA32:
> ++         case PIX_FMT_RGB32: */
> ++    case PIX_FMT_RGB32:
> ++      stride =3D width * 4;
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_RGB555:
> ++    case PIX_FMT_RGB565:
> ++    case PIX_FMT_YUYV422:
> ++    case PIX_FMT_UYVY422:
> ++      stride =3D ROUND_UP_4 (width * 2);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_UYYVYY411:
> ++      /* FIXME, probably not the right stride */
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D width + width / 2;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size + size / 2;
> ++    case PIX_FMT_GRAY8:
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_MONOWHITE:
> ++    case PIX_FMT_MONOBLACK:
> ++      stride =3D ROUND_UP_4 ((width + 7) >> 3);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_PAL8:
> ++      /* already forced to be with stride, so same result as other func=
tion */
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D ptr + size;    /* palette is stored here as =
256 32 bit words */
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 4;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size + 256 * 4;
> ++    default:
> ++      picture->data[0] =3D NULL;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      return -1;
> ++  }
> ++
> ++  return 0;
> ++}
> ++
> ++/* Create a GstBuffer of the requested size and caps.
> ++ * The memory will be allocated by ffmpeg, making sure it's properly al=
igned
> ++ * for any processing. */
> ++
> ++GstBuffer *
> ++new_aligned_buffer (gint size, GstCaps * caps)
> ++{
> ++  GstBuffer *buf;
> ++
> ++  buf =3D gst_buffer_new ();
> ++  GST_BUFFER_DATA (buf) =3D GST_BUFFER_MALLOCDATA (buf) =3D av_malloc (=
size);
> ++  GST_BUFFER_SIZE (buf) =3D size;
> ++  GST_BUFFER_FREE_FUNC (buf) =3D av_free;
> ++  if (caps)
> ++    gst_buffer_set_caps (buf, caps);
> ++
> ++  return buf;
> ++}
> ++
> ++int
> ++gst_ffmpeg_auto_max_threads (void)
> ++{
> ++  static gsize n_threads =3D 0;
> ++  if (g_once_init_enter (&n_threads)) {
> ++    int n =3D 1;
> ++#if defined(_WIN32)
> ++    {
> ++      const char *s =3D getenv ("NUMBER_OF_PROCESSORS");
> ++      if (s) {
> ++        n =3D atoi (s);
> ++      }
> ++    }
> ++#elif defined(__APPLE__)
> ++    {
> ++      int mib[] =3D { CTL_HW, HW_NCPU };
> ++      size_t dataSize =3D sizeof (int);
> ++
> ++      if (sysctl (mib, 2, &n_threads, &dataSize, NULL, 0)) {
> ++        n =3D 1;
> ++      }
> ++    }
> ++#else
> ++    n =3D sysconf (_SC_NPROCESSORS_CONF);
> ++#endif
> ++    if (n < 1)
> ++      n =3D 1;
> ++
> ++    g_once_init_leave (&n_threads, n);
> ++  }
> ++
> ++  return (int) (n_threads);
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h gst-ffmpeg=
-0.10.13/ext/ffmpeg/gstffmpegutils.h
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h	2011-11-02 14:04=
:05.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h	2014-08-08 15:34:04.0=
07874626 +0200
> +@@ -23,6 +23,7 @@
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avcodec.h>
> + #else
> ++#include <libavutil/mathematics.h>
> + #include <libavcodec/avcodec.h>
> + #endif
> + #include <gst/gst.h>
> +@@ -87,7 +88,7 @@
> + gst_ffmpeg_get_codecid_longname (enum CodecID codec_id);
> +=20
> + gint
> +-av_smp_format_depth(enum SampleFormat smp_fmt);
> ++av_smp_format_depth(enum AVSampleFormat smp_fmt);
> +=20
> + GstBuffer *
> + new_aligned_buffer (gint size, GstCaps * caps);
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h.orig gst-f=
fmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h.orig	1970-01-01 =
01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h.orig	2014-08-08 15:26=
:38.473858652 +0200
> +@@ -0,0 +1,95 @@
> ++/* GStreamer
> ++ * Copyright (C) <2009> Edward Hervey <bilboed@bilboed.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifndef __GST_FFMPEG_UTILS_H__
> ++#define __GST_FFMPEG_UTILS_H__
> ++
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#endif
> ++#include <gst/gst.h>
> ++
> ++/*
> ++ *Get the size of an picture
> ++ */
> ++int
> ++gst_ffmpeg_avpicture_get_size (int pix_fmt, int width, int height);
> ++
> ++/*
> ++ * Fill in pointers in an AVPicture, aligned by 4 (required by X).
> ++ */
> ++
> ++int
> ++gst_ffmpeg_avpicture_fill (AVPicture * picture,
> ++                           uint8_t *   ptr,
> ++                           enum PixelFormat pix_fmt,
> ++                           int         width,
> ++                           int         height);
> ++
> ++/*
> ++ * Convert from/to a GStreamer <-> FFMpeg timestamp.
> ++ */
> ++static inline guint64
> ++gst_ffmpeg_time_ff_to_gst (gint64 pts, AVRational base)
> ++{
> ++  guint64 out;
> ++
> ++  if (pts =3D=3D AV_NOPTS_VALUE){
> ++    out =3D GST_CLOCK_TIME_NONE;
> ++  } else {
> ++    AVRational bq =3D { 1, GST_SECOND };
> ++    out =3D av_rescale_q (pts, base, bq);
> ++  }
> ++
> ++  return out;
> ++}
> ++
> ++static inline gint64
> ++gst_ffmpeg_time_gst_to_ff (guint64 time, AVRational base)
> ++{
> ++  gint64 out;
> ++
> ++  if (!GST_CLOCK_TIME_IS_VALID (time) || base.num =3D=3D 0) {
> ++    out =3D AV_NOPTS_VALUE;
> ++  } else {
> ++    AVRational bq =3D { 1, GST_SECOND };
> ++    out =3D av_rescale_q (time, bq, base);
> ++  }
> ++
> ++  return out;
> ++}
> ++
> ++void=20
> ++gst_ffmpeg_init_pix_fmt_info(void);
> ++
> ++int
> ++gst_ffmpeg_auto_max_threads(void);
> ++
> ++G_CONST_RETURN gchar *
> ++gst_ffmpeg_get_codecid_longname (enum CodecID codec_id);
> ++
> ++gint
> ++av_smp_format_depth(enum AVSampleFormat smp_fmt);
> ++
> ++GstBuffer *
> ++new_aligned_buffer (gint size, GstCaps * caps);
> ++
> ++#endif /* __GST_FFMPEG_UTILS_H__ */
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/me=
ta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index 748157a..bd7b8ce 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -53,6 +53,7 @@ SRC_URI =3D "http://gstreamer.freedesktop.org/src/${BPN=
}/${BPN}-${PV}.tar.bz2 \
>             file://0001-qdm2-check-array-index-before-use-fix-out-of-arra=
y-a.patch \
>             file://0001-lavf-compute-probe-buffer-size-more-reliably.patc=
h \
>             file://0001-ffserver-set-oformat.patch \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav=
-9.patch', '', d)} \=20
>  "
> =20
>  SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
> @@ -79,6 +80,7 @@ EXTRA_OECONF =3D "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
>  PACKAGECONFIG ??=3D "external-libav"
>  PACKAGECONFIG[external-libav] =3D "--with-system-ffmpeg,,libav"
>  PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> +PACKAGECONFIG[libav9] =3D ",,,"
> =20
>  FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
>  FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvoboACgkQN1Ujt2V2gBxWUgCgoWTOrWfl34LYJFcUTSGASOZs
wxAAoJZeBP+rnk3n4KkYysyLvhRCqb35
=ShVP
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
