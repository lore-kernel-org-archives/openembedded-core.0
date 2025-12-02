Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2055CCFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:23:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2645.1764660230499697330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 23:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id AC39737B34
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Dec 2025 08:23:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.196]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vQKiz-3L1ctl0; Tue, 2 Dec 2025 08:23:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ffmpeg: update 8.0 -> 8.0.1
Date: Tue,  2 Dec 2025 08:22:47 +0100
Message-ID: <20251202072247.238756-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1764660181-36FF5615-4FB64C14/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ff7a7a9-cc44-4829-bda6-b07584994346
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227148

version 8.0.1:
 avutil/common: cast GET_BYTE/GET_16BIT returned value
 avfilter/vf_drawtext: fix call GET_UTF8 with invalid argument
 avfilter/vf_drawtext: fix incorrect text length
 Update for 8.0.1
 avfilter/vf_drawtext: Account for bbox text seperator
 avcodec/mediacodecdec_common: Check that the input to mediacodec_wrap_sw=
_audio_buffer() contains channel * sample_size
 avcodec/rv60dec: Clear blk_info
 avformat/whip: Fix rtp_ctx->streams access
 avcodec/utvideodec: Set B for the width=3D 1 case in restore_median_plan=
ar_il()
 avcodec/osq: Fix 32bit sample overflow
 avformat/rtpdec_rfc4175: Only change PayloadContext on success
 avformat/rtpdec_rfc4175: Check dimensions
 avformat/rtpdec_rfc4175: Fix memleak of sampling
 avformat/http: Fix off by 1 error
 avcodec/exr: spelling
 avcodec/rv60dec: add upper bound check for qp
 avcodec/exr: use tile dimensions in pxr24 UINT case
 avcodec/exr: Simple check for available channels
 avformat/sctp: Check size in sctp_write()
 avformat/rtmpproto: consider command line argument lengths
 avformat/rtmpproto_ Check tcurl and flashver length
 avcodec/g723_1enc: Make min_err 64bit
 avcodec/vlc: Clear val8/16 in vlc_multi_gen() by av_mallocz()
 avformat/rtpenc_h264_hevc: Check space for nal_length_size in ff_rtp_sen=
d_h264_hevc()
 avcodec/ffv1enc: Consider variation in slice sizes
 libavcodec/cbs_apv_syntax_template: limit tile to 2gb
 swscale/output: Fix unsigned cast position in  yuv2*
 swscale/output: Fix integer overflow in yuv2ya16_X_c_template()
 avcodec/exr: Check that DWA has 3 channels
 avcodec/exr: check ac_size
 avcodec/exr: Round dc_w/h up
 avcodec/mjpegdec: Explain buf_size/width/height check
 configure: strip non numeric trailer from gcc version
 avformat/dhav: Fix off by length of read element error
 avformat/aviobuf: Keep checksum_ptr consistent in avio_seek()
 doc/examples/vaapi_encode: fix invalid check on fwrite
 avcodec/librsvgdec: fix compilation with librsvg 2.50.3
 avcodec/mfenc: fix memory leak with D3D11 input surfaces
 swscale/graph: fix double-free when legacy pass fails initializing
 libavformat/udp: Fix call to recvfrom(2)
 avfilter/f_ebur128: Fix incorrect ebur128 peak calculation.
 avformat/udp: fix warning about unused varible
 avdevice/lavfi: stop setting deprecated buffersink options
 configure: unbreak glslang build
 swscale/range_convert: fix truncation bias in range conversion
 lavc/aarch64: Fix addp overflow in ff_pred16x16_plane_neon_10
 avcodec/mlpdec: don't depend on context channel layout when setting subs=
tream masks
 avformat/demux: pass new extradata to the parser
 avfilter/af_whisper: fix srt index
 avfilter/af_whisper: fix int64 printf format
 avfilter/af_whisper: fix srt file format
 avfilter/whisper: correct option formatting
 avfilter/af_whisper: fix broken output for multibyte character
 avformat/rtsp: fix leading space in RTSP reason
 avformat/rtsp: do not log invalid values
 avformat/http: Handle IPv6 Zone ID in hostname
 avformat/dump: fix log level passed to av_log when printing stream group=
 side data
 avcodec/hevc/sei: don't attempt to use stale values in HEVCSEITDRDI
 avcodec/hevc/sei: prevent storing a potentially bogus num_ref_displays v=
alue in HEVCSEITDRDI
 avcodec/hevc/refs: don't unconditionally discard non-IRAP frames if no I=
RAP frame was seen before
 libavutil/arm: Rename the HWCAP defines
 libavutil/arm: Make use of elf_aux_info() on FreeBSD/OpenBSD
 fftools/ffmpeg: fix gracefully shutdown
 avcodec/decode: sync initial_pict_type and intra_only_flag with thread w=
orker's avctx
 avcodec/x86/pngdsp: add missing emms at the end of add_png_paeth_predict=
ion
 avcodec/videotoolboxenc: ensure bitrate is set in low_delay mode
 avcodec/videotoolboxenc: allow low latency RC with HEVC
 avcodec/videotoolboxenc: support global_quality without qscale
 avcodec/videotoolboxenc: fix the loss of precision when calculating qual=
ity
 fftools/ffmpeg_demux: ensure the display_rotation option is honored
 avcodec/mjpegdec: use ff_frame_new_side_data() to export display matrix
 avutil/tests/aes_ctr: extend the test to cover payloads smaller than a b=
lock
 avutil/aes_ctr: reintroduce the block offset state
 avfilter/vf_lcevc: support LCEVCdec version 4
 avcodec/lcevcdec: support LCEVCdec version 4
 movenc: ensure chapters track extradata is not null and populated

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../ffmpeg/{ffmpeg_8.0.bb =3D> ffmpeg_8.0.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.0.bb =3D> ffmpeg_8.0.1.b=
b} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_8.0.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index ecaced7690..76be2b04f8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
=20
 SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa=
0be2d60273d27b8e"
+SRC_URI[sha256sum] =3D "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe=
3794f487229e5a41"
=20
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.51.0


