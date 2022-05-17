Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D22C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:07 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.1173.1652811906112008958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nt/W3wpn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so3308947pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wmLYAlXrDFhsF1bmMuCTHxx6oLc5V0Vqfg52G/30HWk=;
        b=Nt/W3wpnc/XohwHGAAi+OHa3FemWBka+QJjPmhvH8Ck2JGEs/YSCQQELE/AchJw77+
         inbc1B1eFLS5hPpeS1xmjfDeLBhSEVK5jaFQXAFKH8c4KKrAZaSSNXmhFvxjV3Z94l5C
         +nNzsaxAafRtASUDkU5ZM0Tzej3bxdm1YZbkgdZAfnXXxavOjWmoKsqLCGlRKVZV2YCc
         XBJBJJhRvQ/pIjwNyhwQkGDQHsv7g/hvmqBEd/y0NH1JWHw9w34CVDfNhKaym+5JCvuA
         wxeD4uWzZ3R1EailGois3KdND0DFjzOKOf1/bzWFKSUVJtDew+K9bk7hukwhVKvRIAbE
         yChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmLYAlXrDFhsF1bmMuCTHxx6oLc5V0Vqfg52G/30HWk=;
        b=RfMmR1Ps4pjnzh4T3wlhvs+6LyoBErimKUIXLWm38TG2K4SwvRfzrBqv9UlipZrIVs
         g37P+UKTWpnjANafOgCndjqnVcgwSD4iO4GFSSVr4eGqvYHSL4aM8sT4J+2z0dJy5lUF
         RoZ4HTSg6+G+qhHaKZx4SchxezRg2ZOqMYInRrONI4ZgrT0RoR72f6GVuF+jNQfRGXTR
         Qkcx9NB7Pluep/WZ30Y7eZIMxdm5lEwEKUeJBFfu1EjUrlnaFtZkNg2LqDn+xMvttYIR
         aeLXvV9E725Rt/0lWieNYsxIjpiWgKrxOGvpDW3Se0BXV/3o+AsjGljpDiW7A4x0hEYR
         Iqvg==
X-Gm-Message-State: AOAM530EgCpasDrCYQuHYrCHH9Dgls1m4WTm1AsWCe7IbFLXghWuaInS
	nUDB6sM0e1sP7FAMYRJFNjPu6UAkuSvvHPqk
X-Google-Smtp-Source: 
 ABdhPJzzldWEg4b22ueLCxENrJCs6iIltlczBrsvc/pMMqsb3vk6kDQY6kNdwHuIqp3BE8t6TQ/tlA==
X-Received: by 2002:a17:902:f70c:b0:14e:f1a4:d894 with SMTP id
 h12-20020a170902f70c00b0014ef1a4d894mr23883064plo.65.1652811904722;
        Tue, 17 May 2022 11:25:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/31] ffmpeg: upgrade 5.0 -> 5.0.1
Date: Tue, 17 May 2022 08:23:58 -1000
Message-Id: 
 <ccb87ec2f13b72c1f43a2ad96cd446533da4a666.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165757

From: Alexander Kanavin <alex.kanavin@gmail.com>

version 5.0.1:
- avcodec/exr: Avoid signed overflow in displayWindow
- avcodec/diracdec: avoid signed integer overflow in global mv
- avcodec/takdsp: Fix integer overflow in decorrelate_sf()
- avcodec/apedec: fix a integer overflow in long_filter_high_3800()
- avdevice/dshow: fix regression
- avfilter/vf_subtitles: pass storage size to libass
- avcodec/vp9_superframe_split_bsf: Don't read inexistent data
- avcodec/vp9_superframe_split_bsf: Discard invalid zero-sized frames
- avcodec/vp9_superframe_bsf: Check for existence of data before reading it
- avcodec/vp9_raw_reorder_bsf: Check for existence of data before reading it
- avformat/imf: fix packet pts, dts and muxing
- avformat/imf: open resources only when first needed
- avformat/imf: cosmetics
- avformat/imf_cpl: do not use filesize when reading XML file
- avformat/imfdec: Use proper logcontext
- avformat/imfdec: do not use filesize when reading XML file
- doc/utils: add missing 22.2 layout entry
- avcodec/av1: only set the private context pix_fmt field if get_pixel_format() succeeds
- avformat/aqtitledec: Skip unrepresentable durations
- avformat/cafdec: Do not store empty keys in read_info_chunk()
- avformat/mxfdec: Do not clear array in mxf_read_strong_ref_array() before writing
- avformat/mxfdec: Check for avio_read() failure in mxf_read_strong_ref_array()
- avformat/mxfdec: Check count in mxf_read_strong_ref_array()
- avformat/hls: Check target_duration
- avcodec/pixlet: Avoid signed integer overflow in scaling in filterfn()
- avformat/matroskadec: Check pre_ns
- avcodec/sonic: Use unsigned for predictor_k to avoid undefined behavior
- avcodec/libuavs3d: Check ff_set_dimensions() for failure
- avcodec/speexdec: Align some comments
- avcodec/speexdec: Use correct doxygen comments
- avcodec/mjpegbdec: Set buf_size
- avformat/matroskadec: Use rounded down duration in get_cue_desc() check
- avcodec/argo: Check packet size
- avcodec/g729_parser: Check channels
- avformat/avidec: Check height
- avformat/rmdec: Better duplicate tags check
- avformat/mov: Disallow empty sidx
- avformat/argo_cvg:: Fix order of operations in error check in argo_cvg_write_trailer()
- avformat/argo_asf: Fix order of operations in error check in argo_asf_write_trailer()
- avcodec/movtextdec: add () to CMP() macro to avoid unexpected behavior
- avformat/matroskadec: Check duration
- avformat/mov: Corner case encryption error cleanup in mov_read_senc()
- avcodec/jpeglsdec: Fix if( code style
- avcodec/jpeglsdec: Check get_ur_golomb_jpegls() for error
- avcodec/motion_est: fix indention of ff_get_best_fcode()
- avcodec/motion_est: Fix xy indexing on range violation in ff_get_best_fcode()
- avformat/hls: Use unsigned for iv computation
- avcodec/jpeglsdec: Increase range for N in ls_get_code_runterm() by using unsigned
- avformat/matroskadec: Check desc_bytes
- avformat/utils: Fix invalid NULL pointer operation in ff_parse_key_value()
- avformat/matroskadec: Fix infinite loop with bz decompression
- avformat/utils: keep chapter monotonicity on chapter updates
- avformat/mov: Check size before subtraction
- avcodec/cfhd: Avoid signed integer overflow in coeff
- avcodec/libdav1d: free the Dav1dData packet on dav1d_send_data() failure
- avcodec/h264_parser: don't alter decoder private data
- configure: link to libatomic when it's present
- fate/ffmpeg: add missing samples dependency to fate-shortest

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90f35ceb209a51dfe0cd29e1d8646fcc501b7269)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 96eef5e0fe..dd14f8df6f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
+SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.25.1


