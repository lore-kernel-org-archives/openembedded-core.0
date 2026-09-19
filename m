Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6157C982DD
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 05:43:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7449.1789796596980405349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 22:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rp9hBHo6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lsULDAM4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0b830b77c-168c7702-4b91-4a2c-9a65-90ebb6d65629-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789796596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FgbpzPS+1qLLhJmwkwG2AwjJNgHEvQl6YZYG/Cm6hek=;
	b=rp9hBHo6/+RkYIlaj6O0DT4t77aBsY+iSrCzSxAcbI6yxUeoN7bxCR2kp4Rjfobi
	8/R7sHIqvp4NX0Y3PiA7nYMJpd45yZyXIzk7rjH3GRixmlFiP6iGwBT6jEqc3NaVLZI
	HrdaJbFHfyO4j8LK2rBlcFQ4U8dj+2MCFuR4pFHc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789796596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FgbpzPS+1qLLhJmwkwG2AwjJNgHEvQl6YZYG/Cm6hek=;
	b=lsULDAM4meldfiivKRcpM3YN6oEBeJ7spO42yXKFkwJu3/4jLLTyCUxazGUq8lhI
	R8yx/ci07hZWmlOOVJaKPz8/AwhqZOmXXkNJyX+e0PZ2yXZMkXBsrlz7GczpaeNxoW9
	0XtD4anj8ztNY4wLs0Rr26HzmBZlalqOZEershT0=
Content-Type: multipart/mixed; boundary="===============1567025873025495143=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 9.0.2 SUCCEEDED
Message-ID: <010101a0b830b77c-168c7702-4b91-4a2c-9a65-90ebb6d65629-000000@us-west-2.amazonses.com>
Date: Sat, 19 Sep 2026 05:43:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.19-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 05:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246231

--===============1567025873025495143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *9.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-9.0.1-9.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 699115f85b1a7e74db1b0e34ad168fe305cc0d53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 19 Sep 2026 05:40:36 +0000
Subject: [PATCH] ffmpeg: upgrade 9.0.1 -> 9.0.2

Source: Changelog

version 9.0.2:
 Update for 9.0.2
 avcodec/ppc/vp8dsp: store the 16 pixel wide rows at any alignment
 avfilter/vf_decimate: reject blocks smaller than one chroma sample
 avformat/genh: check for unsupported interlaved size 1 typ1 THP
 lavc/vvc: Prevent OOB write in sh_entry_points
 avcodec/vulkan_hevc: bound the per category reference counts in vk_hevc_start_frame
 avcodec/vulkan_hevc: bound the reference count in vk_hevc_start_frame
 avformat/pdvenc: add the AVClass pointer to PDVMuxContext
 avcodec/fflcms2: fix memory leak after cmsDeleteContext(NULL)
 avcodec/cbs_h266_syntax_template: fix ph_recovery_poc_cnt range
 avformat/http: free cookie parameters on parse failure
 avutil/opt: fix av_opt_is_set_to_default() on default-NAN options
 fftools: reject negative -t durations
 avcodec/hevc: don't error out on remaining slices of a skipped picture
 avcodec/vvc: Skip over the current picture in find_ref_idx
 avcodec/mips/vc1dsp_msa: Fix mspel functions
 avcodec/mips/hevcpred_msa: Fix compilation
 avcodec/vc1_block: don't drop the last macroblock when 1 bit remains
 avcodec/dovi_rpudec: strip zero padding
 avformat/dashdec: check fragment_timescale before division in refresh_manifest
 avutil/encryption_info: reject init info with zero-sized key IDs
 avformat/genh: check thp extradata read and allocation
 avformat/oggdec: check for integer overflow in buf_realloc
 vulkan_av1: fix out-of-bounds write of tile_sizes
 avcodec/cfhd: reject header tags after the frame buffer was allocated
 avcodec/cfhd: check the channel number after every tag
 avcodec/cfhd: reset the allocated band sizes when freeing the buffers
 avcodec/cook: require the channel mask to cover every subpacket channel
 avcodec/dvdsubenc: account for the byte alignment of each RLE line
 avfilter/vf_colorconstancy: free only allocated buffers on setup failure
 avcodec/hap: do not hide the failure of the chunk table allocation
 avformat/mov: Allocate the array without clearing before read
 avformat/mov: do not zero a key string before reading it
 avformat/mov: bound the keys atom entry count by the atom size
 avcodec/vvc/dec: compare the CTU area in ibc_tl_init()
 avcodec/vvc/dec: free the tabs when pic_arrays_init() fails
 avcodec/vvc/thread: clear fc->ft when the frame thread is freed
 avfilter/vf_uspp: Fix qpcount
 avcodec/codec_internal: clarify docs for FF_CODEC_CAP_SKIP_FRAME_FILL_PARAM
 avfilter/f_metadata: avoid overread on long formatted output
 avformat/tls_mbedtls: set the expected hostname for numeric hosts
 libswscale/ppc/yuv2rgb_altivec: Fix heap buffer overflow in yuv2packedX
 swscale/ops_dispatch: account for the vertical filter taps in the tail copy
 swscale/ops_dispatch: pass the line strides to copy_lines() as ptrdiff_t
 swscale/uops: pad the horizontal filter weights to whole blocks
 avcodec/apac: reset bitstream_index unconditionally to avoid integer overflow
 avcodec/vorbisenc: dont assert on non finite input
 avcodec/rv34: do not copy an unused referen

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...ak-ensure-target-directories-are-cre.patch |  2 +-
 .../ffmpeg/ffmpeg/makerace.patch              | 20 ++++++++++++-------
 .../{ffmpeg_9.0.1.bb => ffmpeg_9.0.2.bb}      |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_9.0.1.bb => ffmpeg_9.0.2.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index 3f523ddb01..a9c54971e4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -1,4 +1,4 @@
-From cb0f8bf74b53130ceedb97af317840f76ddfce31 Mon Sep 17 00:00:00 2001
+From 01b4d2e905e79a6858078927c111ce96bd03b314 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 11 Dec 2025 19:55:46 +0100
 Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
index c2f87b25fb..1788e8b98f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
@@ -1,4 +1,7 @@
-An easy to reproduce make race:
+From 6d288ad39ceec639779b58d5a585ead599fe2997 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 11 Sep 2026 09:04:05 +0100
+Subject: [PATCH] An easy to reproduce make race:
 
 $ make libswscale/x86/uops_macros.gen.asm
 HOSTCC	libswscale/x86/uops_macros.gen.asm
@@ -8,18 +11,21 @@ It needs the missing directory creation dependency adding.
 
 Upstream-Status: Submitted [Sent to https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/ 2026/9/11]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
- 
-Index: ffmpeg-9.0.1/libswscale/x86/Makefile
-===================================================================
---- ffmpeg-9.0.1.orig/libswscale/x86/Makefile
-+++ ffmpeg-9.0.1/libswscale/x86/Makefile
+---
+ libswscale/x86/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libswscale/x86/Makefile b/libswscale/x86/Makefile
+index 0f7a3db..f56a5a4 100644
+--- a/libswscale/x86/Makefile
++++ b/libswscale/x86/Makefile
 @@ -1,3 +1,5 @@
 +OUTDIRS += $(SUBDIR)x86
 +
  OBJS                            += x86/rgb2rgb.o                        \
                                     x86/swscale.o                        \
                                     x86/yuv2rgb.o                        \
-@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/
+@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/ops_int.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/ops_float.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/uops_macros.gen.asm: $(SRC_PATH)/libswscale/x86/uops_macros.asm.h \
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
index 07eff2a4e5..4942e873ce 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://makerace.patch \
            "
 
-SRC_URI[sha256sum] = "cf38e0e28c7e5605942c4a77755349b0145804a397af37eb1fb4c77cb237f635"
+SRC_URI[sha256sum] = "8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.47.1


--===============1567025873025495143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ffmpeg-changelog.txt"

Changelog for ffmpeg: 9.0.1 -> 9.0.2
Source: Changelog

version 9.0.2:
 Update for 9.0.2
 avcodec/ppc/vp8dsp: store the 16 pixel wide rows at any alignment
 avfilter/vf_decimate: reject blocks smaller than one chroma sample
 avformat/genh: check for unsupported interlaved size 1 typ1 THP
 lavc/vvc: Prevent OOB write in sh_entry_points
 avcodec/vulkan_hevc: bound the per category reference counts in vk_hevc_start_frame
 avcodec/vulkan_hevc: bound the reference count in vk_hevc_start_frame
 avformat/pdvenc: add the AVClass pointer to PDVMuxContext
 avcodec/fflcms2: fix memory leak after cmsDeleteContext(NULL)
 avcodec/cbs_h266_syntax_template: fix ph_recovery_poc_cnt range
 avformat/http: free cookie parameters on parse failure
 avutil/opt: fix av_opt_is_set_to_default() on default-NAN options
 fftools: reject negative -t durations
 avcodec/hevc: don't error out on remaining slices of a skipped picture
 avcodec/vvc: Skip over the current picture in find_ref_idx
 avcodec/mips/vc1dsp_msa: Fix mspel functions
 avcodec/mips/hevcpred_msa: Fix compilation
 avcodec/vc1_block: don't drop the last macroblock when 1 bit remains
 avcodec/dovi_rpudec: strip zero padding
 avformat/dashdec: check fragment_timescale before division in refresh_manifest
 avutil/encryption_info: reject init info with zero-sized key IDs
 avformat/genh: check thp extradata read and allocation
 avformat/oggdec: check for integer overflow in buf_realloc
 vulkan_av1: fix out-of-bounds write of tile_sizes
 avcodec/cfhd: reject header tags after the frame buffer was allocated
 avcodec/cfhd: check the channel number after every tag
 avcodec/cfhd: reset the allocated band sizes when freeing the buffers
 avcodec/cook: require the channel mask to cover every subpacket channel
 avcodec/dvdsubenc: account for the byte alignment of each RLE line
 avfilter/vf_colorconstancy: free only allocated buffers on setup failure
 avcodec/hap: do not hide the failure of the chunk table allocation
 avformat/mov: Allocate the array without clearing before read
 avformat/mov: do not zero a key string before reading it
 avformat/mov: bound the keys atom entry count by the atom size
 avcodec/vvc/dec: compare the CTU area in ibc_tl_init()
 avcodec/vvc/dec: free the tabs when pic_arrays_init() fails
 avcodec/vvc/thread: clear fc->ft when the frame thread is freed
 avfilter/vf_uspp: Fix qpcount
 avcodec/codec_internal: clarify docs for FF_CODEC_CAP_SKIP_FRAME_FILL_PARAM
 avfilter/f_metadata: avoid overread on long formatted output
 avformat/tls_mbedtls: set the expected hostname for numeric hosts
 libswscale/ppc/yuv2rgb_altivec: Fix heap buffer overflow in yuv2packedX
 swscale/ops_dispatch: account for the vertical filter taps in the tail copy
 swscale/ops_dispatch: pass the line strides to copy_lines() as ptrdiff_t
 swscale/uops: pad the horizontal filter weights to whole blocks
 avcodec/apac: reset bitstream_index unconditionally to avoid integer overflow
 avcodec/vorbisenc: dont assert on non finite input
 avcodec/rv34: do not copy an unused reference line in the edge emulation
 avcodec/rv34: do not await a negative reference-frame row
 avcodec/vp9: unref next_refs in vp9_decode_flush
 avcodec/vp8: do not await a negative reference-frame row
 avformat/vpk: Check the channel count before dividing in the last block
 avformat: Restore the container channel layout after a failed decoder open
 avcodec/dcadec: ignore reserved speaker positions in coded channel order
 avformat/matroskaenc: reserve space for BlockAdditionMapping even if Matroska muxer isn't enabled
 (fforge/pr/24457) ffmpeg: fix matching of non-apic stream specifiers
 avformat/cbs: move AV1 feature definition to their own header
 (fforge/pr/24399) avcodec/bsf/dca_core: clear profile value on init()
 avformat/sierravmd: require a 6bit palette in the probe
 libswscale: use unaligned read/write macros in planarCopyWrapper
 avformat/binka: reject truncated packet reads
 avfilter/acrossover: reject non-finite parameters
 avfilter/aiir: reject non-finite parameters
 avfilter/firequalizer: reject overflowing delays
 avcodec/wavpackenc: handle INT32_MIN samples
 avfilter/aecho: reject non-finite delays and decays
 libswresample/aarch64: Fix sign extension in audio conversion
 avcodec/audiotoolbox: use 64-bit channel masks
 avfilter/aarch64/vf_bwdif_init: Fix stride bound check
 avformat/dashenc: free http options on avio_open_dyn_buf failure
 avcodec/bmp: fix misaligned read in 16-bit decoding
 avcodec/huffyuv: seed the median predictor endian independently
 avformat/wvdec: convert flags to defines
 (fforge/pr/24299) avformat/iamf_writer: don't discard skip samples signaled through side data for Opus
 (fforge/pr/24295) avformat/movenc: fix crash when flushing a fragment with no data
 swscale/loongarch: fix buffer underflow in yuv2plane1_8_lsx/lasx
 (fforge/pr/24279) avcodec/h264_direct: do not read the other field's rows of colocated mb_type
 avcodec/h264_slice: clear the ER picture when starting a second field
 Revert "fftools/ffmpeg_sched: allow throttling decoder outputs"
 avcodec/libdav1d: fix leak of frames on failure
 avcodec/mips/cabac: Fix building on OpenBSD/mips64
 avcodec/pthread_frame: sync decoded side data to all worker threads
 (fforge/pr/24146) avcodec/h264_direct: await both fields of a colocated field pair
 avcodec/h264_direct: move check before loading things

--===============1567025873025495143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: FILELIST: removed "/usr/lib/libavcodec.so.63.1.101", added "/usr/lib/libavcodec.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: FILELIST: removed "/usr/lib/libavdevice.so.63.1.101", added "/usr/lib/libavdevice.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: FILELIST: removed "/usr/lib/libavfilter.so.12.1.101", added "/usr/lib/libavfilter.so.12.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: FILELIST: removed "/usr/lib/libavformat.so.63.1.101", added "/usr/lib/libavformat.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: FILELIST: removed "/usr/lib/libavutil.so.61.1.101", added "/usr/lib/libavutil.so.61.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: FILELIST: removed "/usr/lib/libswresample.so.7.1.101", added "/usr/lib/libswresample.so.7.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: FILELIST: removed "/usr/lib/libswscale.so.10.1.101", added "/usr/lib/libswscale.so.10.1.102"
Changes to packages/x86-64-v3-poky-linux/ffmpeg (sysroot):
  /usr/lib/libavcodec.so.63 changed symlink target from libavcodec.so.63.1.101 to libavcodec.so.63.1.102
  /usr/lib/libavcodec.so changed symlink target from libavcodec.so.63.1.101 to libavcodec.so.63.1.102
  /usr/lib/libavdevice.so.63 changed symlink target from libavdevice.so.63.1.101 to libavdevice.so.63.1.102
  /usr/lib/libavdevice.so changed symlink target from libavdevice.so.63.1.101 to libavdevice.so.63.1.102
  /usr/lib/libavfilter.so.12 changed symlink target from libavfilter.so.12.1.101 to libavfilter.so.12.1.102
  /usr/lib/libavfilter.so changed symlink target from libavfilter.so.12.1.101 to libavfilter.so.12.1.102
  /usr/lib/libavformat.so.63 changed symlink target from libavformat.so.63.1.101 to libavformat.so.63.1.102
  /usr/lib/libavformat.so changed symlink target from libavformat.so.63.1.101 to libavformat.so.63.1.102
  /usr/lib/libavutil.so.61 changed symlink target from libavutil.so.61.1.101 to libavutil.so.61.1.102
  /usr/lib/libavutil.so changed symlink target from libavutil.so.61.1.101 to libavutil.so.61.1.102
  /usr/lib/libswresample.so.7 changed symlink target from libswresample.so.7.1.101 to libswresample.so.7.1.102
  /usr/lib/libswresample.so changed symlink target from libswresample.so.7.1.101 to libswresample.so.7.1.102
  /usr/lib/libswscale.so.10 changed symlink target from libswscale.so.10.1.101 to libswscale.so.10.1.102
  /usr/lib/libswscale.so changed symlink target from libswscale.so.10.1.101 to libswscale.so.10.1.102
  /usr/lib/libavcodec.so.63.1.101 moved to /usr/lib/libavcodec.so.63.1.102
  /usr/lib/libavdevice.so.63.1.101 moved to /usr/lib/libavdevice.so.63.1.102
  /usr/lib/libavfilter.so.12.1.101 moved to /usr/lib/libavfilter.so.12.1.102
  /usr/lib/libavformat.so.63.1.101 moved to /usr/lib/libavformat.so.63.1.102
  /usr/lib/libavutil.so.61.1.101 moved to /usr/lib/libavutil.so.61.1.102
  /usr/lib/libswresample.so.7.1.101 moved to /usr/lib/libswresample.so.7.1.102
  /usr/lib/libswscale.so.10.1.101 moved to /usr/lib/libswscale.so.10.1.102

--===============1567025873025495143==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-9.0.1-9.0.2.patch"

RnJvbSA2OTkxMTVmODViMWE3ZTc0ZGIxYjBlMzRhZDE2OGZlMzA1Y2MwZDUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTkgU2VwIDIwMjYgMDU6NDA6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
Zm1wZWc6IHVwZ3JhZGUgOS4wLjEgLT4gOS4wLjIKClNvdXJjZTogQ2hhbmdlbG9nCgp2ZXJzaW9u
IDkuMC4yOgogVXBkYXRlIGZvciA5LjAuMgogYXZjb2RlYy9wcGMvdnA4ZHNwOiBzdG9yZSB0aGUg
MTYgcGl4ZWwgd2lkZSByb3dzIGF0IGFueSBhbGlnbm1lbnQKIGF2ZmlsdGVyL3ZmX2RlY2ltYXRl
OiByZWplY3QgYmxvY2tzIHNtYWxsZXIgdGhhbiBvbmUgY2hyb21hIHNhbXBsZQogYXZmb3JtYXQv
Z2VuaDogY2hlY2sgZm9yIHVuc3VwcG9ydGVkIGludGVybGF2ZWQgc2l6ZSAxIHR5cDEgVEhQCiBs
YXZjL3Z2YzogUHJldmVudCBPT0Igd3JpdGUgaW4gc2hfZW50cnlfcG9pbnRzCiBhdmNvZGVjL3Z1
bGthbl9oZXZjOiBib3VuZCB0aGUgcGVyIGNhdGVnb3J5IHJlZmVyZW5jZSBjb3VudHMgaW4gdmtf
aGV2Y19zdGFydF9mcmFtZQogYXZjb2RlYy92dWxrYW5faGV2YzogYm91bmQgdGhlIHJlZmVyZW5j
ZSBjb3VudCBpbiB2a19oZXZjX3N0YXJ0X2ZyYW1lCiBhdmZvcm1hdC9wZHZlbmM6IGFkZCB0aGUg
QVZDbGFzcyBwb2ludGVyIHRvIFBEVk11eENvbnRleHQKIGF2Y29kZWMvZmZsY21zMjogZml4IG1l
bW9yeSBsZWFrIGFmdGVyIGNtc0RlbGV0ZUNvbnRleHQoTlVMTCkKIGF2Y29kZWMvY2JzX2gyNjZf
c3ludGF4X3RlbXBsYXRlOiBmaXggcGhfcmVjb3ZlcnlfcG9jX2NudCByYW5nZQogYXZmb3JtYXQv
aHR0cDogZnJlZSBjb29raWUgcGFyYW1ldGVycyBvbiBwYXJzZSBmYWlsdXJlCiBhdnV0aWwvb3B0
OiBmaXggYXZfb3B0X2lzX3NldF90b19kZWZhdWx0KCkgb24gZGVmYXVsdC1OQU4gb3B0aW9ucwog
ZmZ0b29sczogcmVqZWN0IG5lZ2F0aXZlIC10IGR1cmF0aW9ucwogYXZjb2RlYy9oZXZjOiBkb24n
dCBlcnJvciBvdXQgb24gcmVtYWluaW5nIHNsaWNlcyBvZiBhIHNraXBwZWQgcGljdHVyZQogYXZj
b2RlYy92dmM6IFNraXAgb3ZlciB0aGUgY3VycmVudCBwaWN0dXJlIGluIGZpbmRfcmVmX2lkeAog
YXZjb2RlYy9taXBzL3ZjMWRzcF9tc2E6IEZpeCBtc3BlbCBmdW5jdGlvbnMKIGF2Y29kZWMvbWlw
cy9oZXZjcHJlZF9tc2E6IEZpeCBjb21waWxhdGlvbgogYXZjb2RlYy92YzFfYmxvY2s6IGRvbid0
IGRyb3AgdGhlIGxhc3QgbWFjcm9ibG9jayB3aGVuIDEgYml0IHJlbWFpbnMKIGF2Y29kZWMvZG92
aV9ycHVkZWM6IHN0cmlwIHplcm8gcGFkZGluZwogYXZmb3JtYXQvZGFzaGRlYzogY2hlY2sgZnJh
Z21lbnRfdGltZXNjYWxlIGJlZm9yZSBkaXZpc2lvbiBpbiByZWZyZXNoX21hbmlmZXN0CiBhdnV0
aWwvZW5jcnlwdGlvbl9pbmZvOiByZWplY3QgaW5pdCBpbmZvIHdpdGggemVyby1zaXplZCBrZXkg
SURzCiBhdmZvcm1hdC9nZW5oOiBjaGVjayB0aHAgZXh0cmFkYXRhIHJlYWQgYW5kIGFsbG9jYXRp
b24KIGF2Zm9ybWF0L29nZ2RlYzogY2hlY2sgZm9yIGludGVnZXIgb3ZlcmZsb3cgaW4gYnVmX3Jl
YWxsb2MKIHZ1bGthbl9hdjE6IGZpeCBvdXQtb2YtYm91bmRzIHdyaXRlIG9mIHRpbGVfc2l6ZXMK
IGF2Y29kZWMvY2ZoZDogcmVqZWN0IGhlYWRlciB0YWdzIGFmdGVyIHRoZSBmcmFtZSBidWZmZXIg
d2FzIGFsbG9jYXRlZAogYXZjb2RlYy9jZmhkOiBjaGVjayB0aGUgY2hhbm5lbCBudW1iZXIgYWZ0
ZXIgZXZlcnkgdGFnCiBhdmNvZGVjL2NmaGQ6IHJlc2V0IHRoZSBhbGxvY2F0ZWQgYmFuZCBzaXpl
cyB3aGVuIGZyZWVpbmcgdGhlIGJ1ZmZlcnMKIGF2Y29kZWMvY29vazogcmVxdWlyZSB0aGUgY2hh
bm5lbCBtYXNrIHRvIGNvdmVyIGV2ZXJ5IHN1YnBhY2tldCBjaGFubmVsCiBhdmNvZGVjL2R2ZHN1
YmVuYzogYWNjb3VudCBmb3IgdGhlIGJ5dGUgYWxpZ25tZW50IG9mIGVhY2ggUkxFIGxpbmUKIGF2
ZmlsdGVyL3ZmX2NvbG9yY29uc3RhbmN5OiBmcmVlIG9ubHkgYWxsb2NhdGVkIGJ1ZmZlcnMgb24g
c2V0dXAgZmFpbHVyZQogYXZjb2RlYy9oYXA6IGRvIG5vdCBoaWRlIHRoZSBmYWlsdXJlIG9mIHRo
ZSBjaHVuayB0YWJsZSBhbGxvY2F0aW9uCiBhdmZvcm1hdC9tb3Y6IEFsbG9jYXRlIHRoZSBhcnJh
eSB3aXRob3V0IGNsZWFyaW5nIGJlZm9yZSByZWFkCiBhdmZvcm1hdC9tb3Y6IGRvIG5vdCB6ZXJv
IGEga2V5IHN0cmluZyBiZWZvcmUgcmVhZGluZyBpdAogYXZmb3JtYXQvbW92OiBib3VuZCB0aGUg
a2V5cyBhdG9tIGVudHJ5IGNvdW50IGJ5IHRoZSBhdG9tIHNpemUKIGF2Y29kZWMvdnZjL2RlYzog
Y29tcGFyZSB0aGUgQ1RVIGFyZWEgaW4gaWJjX3RsX2luaXQoKQogYXZjb2RlYy92dmMvZGVjOiBm
cmVlIHRoZSB0YWJzIHdoZW4gcGljX2FycmF5c19pbml0KCkgZmFpbHMKIGF2Y29kZWMvdnZjL3Ro
cmVhZDogY2xlYXIgZmMtPmZ0IHdoZW4gdGhlIGZyYW1lIHRocmVhZCBpcyBmcmVlZAogYXZmaWx0
ZXIvdmZfdXNwcDogRml4IHFwY291bnQKIGF2Y29kZWMvY29kZWNfaW50ZXJuYWw6IGNsYXJpZnkg
ZG9jcyBmb3IgRkZfQ09ERUNfQ0FQX1NLSVBfRlJBTUVfRklMTF9QQVJBTQogYXZmaWx0ZXIvZl9t
ZXRhZGF0YTogYXZvaWQgb3ZlcnJlYWQgb24gbG9uZyBmb3JtYXR0ZWQgb3V0cHV0CiBhdmZvcm1h
dC90bHNfbWJlZHRsczogc2V0IHRoZSBleHBlY3RlZCBob3N0bmFtZSBmb3IgbnVtZXJpYyBob3N0
cwogbGlic3dzY2FsZS9wcGMveXV2MnJnYl9hbHRpdmVjOiBGaXggaGVhcCBidWZmZXIgb3ZlcmZs
b3cgaW4geXV2MnBhY2tlZFgKIHN3c2NhbGUvb3BzX2Rpc3BhdGNoOiBhY2NvdW50IGZvciB0aGUg
dmVydGljYWwgZmlsdGVyIHRhcHMgaW4gdGhlIHRhaWwgY29weQogc3dzY2FsZS9vcHNfZGlzcGF0
Y2g6IHBhc3MgdGhlIGxpbmUgc3RyaWRlcyB0byBjb3B5X2xpbmVzKCkgYXMgcHRyZGlmZl90CiBz
d3NjYWxlL3VvcHM6IHBhZCB0aGUgaG9yaXpvbnRhbCBmaWx0ZXIgd2VpZ2h0cyB0byB3aG9sZSBi
bG9ja3MKIGF2Y29kZWMvYXBhYzogcmVzZXQgYml0c3RyZWFtX2luZGV4IHVuY29uZGl0aW9uYWxs
eSB0byBhdm9pZCBpbnRlZ2VyIG92ZXJmbG93CiBhdmNvZGVjL3ZvcmJpc2VuYzogZG9udCBhc3Nl
cnQgb24gbm9uIGZpbml0ZSBpbnB1dAogYXZjb2RlYy9ydjM0OiBkbyBub3QgY29weSBhbiB1bnVz
ZWQgcmVmZXJlbgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLmFrLWVuc3VyZS10YXJnZXQtZGlyZWN0b3JpZXMtYXJl
LWNyZS5wYXRjaCB8ICAyICstCiAuLi4vZmZtcGVnL2ZmbXBlZy9tYWtlcmFjZS5wYXRjaCAgICAg
ICAgICAgICAgfCAyMCArKysrKysrKysrKystLS0tLS0tCiAuLi4ve2ZmbXBlZ185LjAuMS5iYiA9
PiBmZm1wZWdfOS4wLjIuYmJ9ICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2ZmbXBlZy97ZmZtcGVnXzkuMC4xLmJiID0+IGZmbXBlZ185LjAuMi5iYn0gKDk5JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnLzAwMDItZmZidWls
ZC1jb21tb24ubWFrLWVuc3VyZS10YXJnZXQtZGlyZWN0b3JpZXMtYXJlLWNyZS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWcvMDAwMi1mZmJ1aWxkLWNvbW1vbi5t
YWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmllcy1hcmUtY3JlLnBhdGNoCmluZGV4IDNmNTIzZGRi
MDEuLmE5YzU0OTcxZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBl
Zy9mZm1wZWcvMDAwMi1mZmJ1aWxkLWNvbW1vbi5tYWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmll
cy1hcmUtY3JlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1w
ZWcvMDAwMi1mZmJ1aWxkLWNvbW1vbi5tYWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmllcy1hcmUt
Y3JlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjYjBmOGJmNzRiNTMxMzBjZWVkYjk3YWYz
MTc4NDBmNzZkZGZjZTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMWI0ZDJlOTA1
ZTc5YTY4NTgwNzg5MjdjMTExY2U5NmJkMDNiMzE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwg
MTEgRGVjIDIwMjUgMTk6NTU6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZmZidWlsZC9jb21t
b24ubWFrOiBlbnN1cmUgdGFyZ2V0IGRpcmVjdG9yaWVzIGFyZSBjcmVhdGVkCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnL21ha2VyYWNlLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZy9tYWtlcmFjZS5wYXRjaAppbmRl
eCBjMmY4N2IyNWZiLi4xNzg4ZThiOThmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9mZm1wZWcvZmZtcGVnL21ha2VyYWNlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2ZmbXBlZy9mZm1wZWcvbWFrZXJhY2UucGF0Y2gKQEAgLTEsNCArMSw3IEBACi1BbiBl
YXN5IHRvIHJlcHJvZHVjZSBtYWtlIHJhY2U6CitGcm9tIDZkMjg4YWQzOWNlZWM2Mzk3NzliNThk
NWE1ODVlYWQ1OTlmZTI5OTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZyaSwg
MTEgU2VwIDIwMjYgMDk6MDQ6MDUgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gQW4gZWFzeSB0byBy
ZXByb2R1Y2UgbWFrZSByYWNlOgogCiAkIG1ha2UgbGlic3dzY2FsZS94ODYvdW9wc19tYWNyb3Mu
Z2VuLmFzbQogSE9TVENDCWxpYnN3c2NhbGUveDg2L3VvcHNfbWFjcm9zLmdlbi5hc20KQEAgLTgs
MTggKzExLDIxIEBAIEl0IG5lZWRzIHRoZSBtaXNzaW5nIGRpcmVjdG9yeSBjcmVhdGlvbiBkZXBl
bmRlbmN5IGFkZGluZy4KIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW1NlbnQgdG8gaHR0
cHM6Ly9saXN0cy5mZm1wZWcub3JnL2FyY2hpdmVzL2xpc3QvZmZtcGVnLWRldmVsQGZmbXBlZy5v
cmcvIDIwMjYvOS8xMV0KIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgotIAotSW5kZXg6IGZmbXBlZy05LjAuMS9saWJzd3Nj
YWxlL3g4Ni9NYWtlZmlsZQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGZmbXBlZy05LjAuMS5vcmlnL2xpYnN3
c2NhbGUveDg2L01ha2VmaWxlCi0rKysgZmZtcGVnLTkuMC4xL2xpYnN3c2NhbGUveDg2L01ha2Vm
aWxlCistLS0KKyBsaWJzd3NjYWxlL3g4Ni9NYWtlZmlsZSB8IDQgKysrLQorIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2xpYnN3
c2NhbGUveDg2L01ha2VmaWxlIGIvbGlic3dzY2FsZS94ODYvTWFrZWZpbGUKK2luZGV4IDBmN2Ez
ZGIuLmY1NmE1YTQgMTAwNjQ0CistLS0gYS9saWJzd3NjYWxlL3g4Ni9NYWtlZmlsZQorKysrIGIv
bGlic3dzY2FsZS94ODYvTWFrZWZpbGUKIEBAIC0xLDMgKzEsNSBAQAogK09VVERJUlMgKz0gJChT
VUJESVIpeDg2CiArCiAgT0JKUyAgICAgICAgICAgICAgICAgICAgICAgICAgICArPSB4ODYvcmdi
MnJnYi5vICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgeDg2L3N3c2NhbGUubyAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHg4Ni95dXYycmdiLm8gICAgICAgICAgICAg
ICAgICAgICAgICBcCi1AQCAtMzEsNiArMzMsNiBAQCAkKFNVQkRJUil4ODYvb3BzX2NvbW1vbi5v
OiAkKFNVQkRJUil4ODYvCitAQCAtMzEsNiArMzMsNiBAQCAkKFNVQkRJUil4ODYvb3BzX2NvbW1v
bi5vOiAkKFNVQkRJUil4ODYvdW9wc19tYWNyb3MuZ2VuLmFzbQogICQoU1VCRElSKXg4Ni9vcHNf
aW50Lm86ICQoU1VCRElSKXg4Ni91b3BzX21hY3Jvcy5nZW4uYXNtCiAgJChTVUJESVIpeDg2L29w
c19mbG9hdC5vOiAkKFNVQkRJUil4ODYvdW9wc19tYWNyb3MuZ2VuLmFzbQogICQoU1VCRElSKXg4
Ni91b3BzX21hY3Jvcy5nZW4uYXNtOiAkKFNSQ19QQVRIKS9saWJzd3NjYWxlL3g4Ni91b3BzX21h
Y3Jvcy5hc20uaCBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcv
ZmZtcGVnXzkuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ185
LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9mZm1wZWcvZmZtcGVnXzkuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9mZm1wZWcvZmZtcGVnXzkuMC4yLmJiCmluZGV4IDA3ZWZmMmE0ZTUuLjQ5NDJlODcz
Y2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOS4w
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ185LjAuMi5i
YgpAQCAtMjcsNyArMjcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmZmbXBlZy5vcmcvcmVs
ZWFzZXMvJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL21ha2VyYWNlLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2YzOGUwZTI4YzdlNTYwNTk0
MmM0YTc3NzU1MzQ5YjAxNDU4MDRhMzk3YWYzN2ViMWZiNGM3N2NiMjM3ZjYzNSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI4YzM4NTAyODNlYjI1ZmEwMjY0ODIwNzhhMDQwNTFlMGJlMTczNDdiMDll
ZjgxYTA4NDliZWMxNWE5NmUwMDJlIgogCiAjIEJ1aWxkIGZhaWxzIHdoZW4gdGh1bWIgaXMgZW5h
YmxlZDogaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD03
NzE3CiBBUk1fSU5TVFJVQ1RJT05fU0VUOmFybXY0ID0gImFybSIKLS0gCjIuNDcuMQoK

--===============1567025873025495143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: FILELIST: removed "/usr/lib/.debug/libavformat.so.63.1.101 /usr/lib/.debug/libavutil.so.61.1.101 /usr/lib/.debug/libavdevice.so.63.1.101 /usr/lib/.debug/libavcodec.so.63.1.101 /usr/lib/.debug/libswresample.so.7.1.101 /usr/lib/.debug/libavfilter.so.12.1.101 /usr/lib/.debug/libswscale.so.10.1.101", added "/usr/lib/.debug/libavformat.so.63.1.102 /usr/lib/.debug/libavutil.so.61.1.102 /usr/lib/.debug/libavdevice.so.63.1.102 /usr/lib/.debug/libavcodec.so.63.1.102 /usr/lib/.debug/libswresample.so.7.1.102 /usr/lib/.debug/libswscale.so.10.1.102 /usr/lib/.debug/libavfilter.so.12.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 110632632 to 110623968 (-0%)
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-examples: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-examples: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: FILELIST: directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/x86/hevc -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/x86/hevc, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/bsf -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/bsf, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavfilter -> /usr/src/debug/ffmpeg/9.0.2/libavfilter, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavfilter/x86 -> /usr/src/debug/ffmpeg/9.0.2/libavfilter/x86, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/hevc -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/hevc, directory renamed /usr/src/debug/ffmpeg/9.0.1/fftools/graph -> /usr/src/debug/ffmpeg/9.0.2/fftools/graph, directory renamed /usr/src/debug/ffmpeg/9.0.1/fftools/textformat -> /usr/src/debug/ffmpeg/9.0.2/fftools/textformat, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/x86/h26x -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/x86/h26x, directory renamed /usr/src/debug/ffmpeg/9.0.1/libav
 device -> /usr/src/debug/ffmpeg/9.0.2/libavdevice, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec -> /usr/src/debug/ffmpeg/9.0.2/libavcodec, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/opus -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/opus, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavutil/x86 -> /usr/src/debug/ffmpeg/9.0.2/libavutil/x86, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/aac -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/aac, directory renamed /usr/src/debug/ffmpeg/9.0.1/libswresample -> /usr/src/debug/ffmpeg/9.0.2/libswresample, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/x86/vvc -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/x86/vvc, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/vvc -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/vvc, directory renamed /usr/src/debug/ffmpeg/9.0.1/libswscale/x86 -> /usr/src/debug/ffmpeg/9.0.2/libswscale/x86, directory renamed /usr/src/debug/ffmpeg/9.0.1/fftools -> /usr/src/debug/ffmpeg/9.0.2
 /fftools, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/h26x -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/h26x, directory renamed /usr/src/debug/ffmpeg/9.0.1/libswscale -> /usr/src/debug/ffmpeg/9.0.2/libswscale, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavutil -> /usr/src/debug/ffmpeg/9.0.2/libavutil, directory renamed /usr/src/debug/ffmpeg/9.0.1/fftools/resources -> /usr/src/debug/ffmpeg/9.0.2/fftools/resources, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavformat -> /usr/src/debug/ffmpeg/9.0.2/libavformat, directory renamed /usr/src/debug/ffmpeg/9.0.1/libavcodec/x86 -> /usr/src/debug/ffmpeg/9.0.2/libavcodec/x86, directory renamed /usr/src/debug/ffmpeg/9.0.1/libswresample/x86 -> /usr/src/debug/ffmpeg/9.0.2/libswresample/x86
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 49744435 to 49750056 (+0%)
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg: PKGSIZE changed from 711716 to 707620 (-1%)
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-9.0.1.tar.xz file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch file://makerace.patch" to "https://www.ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch file://makerace.patch"
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: FILELIST: removed "/usr/lib/libavcodec.so.63.1.101", added "/usr/lib/libavcodec.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: FILELIST: removed "/usr/lib/libavdevice.so.63.1.101", added "/usr/lib/libavdevice.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: FILELIST: removed "/usr/lib/libavfilter.so.12.1.101", added "/usr/lib/libavfilter.so.12.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: FILELIST: removed "/usr/lib/libavformat.so.63.1.101", added "/usr/lib/libavformat.so.63.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: FILELIST: removed "/usr/lib/libavutil.so.61.1.101", added "/usr/lib/libavutil.so.61.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: FILELIST: removed "/usr/lib/libswresample.so.7.1.101", added "/usr/lib/libswresample.so.7.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: FILELIST: removed "/usr/lib/libswscale.so.10.1.101", added "/usr/lib/libswscale.so.10.1.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: PV changed from "9.0.1" to "9.0.2"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
Changes to packages/x86-64-v3-poky-linux/ffmpeg (sysroot):
  /usr/lib/libavcodec.so.63 changed symlink target from libavcodec.so.63.1.101 to libavcodec.so.63.1.102
  /usr/lib/libavcodec.so changed symlink target from libavcodec.so.63.1.101 to libavcodec.so.63.1.102
  /usr/lib/libavdevice.so.63 changed symlink target from libavdevice.so.63.1.101 to libavdevice.so.63.1.102
  /usr/lib/libavdevice.so changed symlink target from libavdevice.so.63.1.101 to libavdevice.so.63.1.102
  /usr/lib/libavfilter.so.12 changed symlink target from libavfilter.so.12.1.101 to libavfilter.so.12.1.102
  /usr/lib/libavfilter.so changed symlink target from libavfilter.so.12.1.101 to libavfilter.so.12.1.102
  /usr/lib/libavformat.so.63 changed symlink target from libavformat.so.63.1.101 to libavformat.so.63.1.102
  /usr/lib/libavformat.so changed symlink target from libavformat.so.63.1.101 to libavformat.so.63.1.102
  /usr/lib/libavutil.so.61 changed symlink target from libavutil.so.61.1.101 to libavutil.so.61.1.102
  /usr/lib/libavutil.so changed symlink target from libavutil.so.61.1.101 to libavutil.so.61.1.102
  /usr/lib/libswresample.so.7 changed symlink target from libswresample.so.7.1.101 to libswresample.so.7.1.102
  /usr/lib/libswresample.so changed symlink target from libswresample.so.7.1.101 to libswresample.so.7.1.102
  /usr/lib/libswscale.so.10 changed symlink target from libswscale.so.10.1.101 to libswscale.so.10.1.102
  /usr/lib/libswscale.so changed symlink target from libswscale.so.10.1.101 to libswscale.so.10.1.102
  /usr/lib/libavcodec.so.63.1.101 moved to /usr/lib/libavcodec.so.63.1.102
  /usr/lib/libavdevice.so.63.1.101 moved to /usr/lib/libavdevice.so.63.1.102
  /usr/lib/libavfilter.so.12.1.101 moved to /usr/lib/libavfilter.so.12.1.102
  /usr/lib/libavformat.so.63.1.101 moved to /usr/lib/libavformat.so.63.1.102
  /usr/lib/libavutil.so.61.1.101 moved to /usr/lib/libavutil.so.61.1.102
  /usr/lib/libswresample.so.7.1.101 moved to /usr/lib/libswresample.so.7.1.102
  /usr/lib/libswscale.so.10.1.101 moved to /usr/lib/libswscale.so.10.1.102

--===============1567025873025495143==--

