Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B09CCA485
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.4032.1657773412107405489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UmLxgYWV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso5206195pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C+TC2/EESrq6Uv3Ks0uwJJzehLHQyiaRKrIFfH1GbmM=;
        b=UmLxgYWVfvAlOFDc/xRse97c4RpndmKBQUJC9ZmLnVLzvuXeVpGll0RerTaoV6Jv5+
         kYYnLz1kzs4ulTxaUjJaaF5PaJuy9x2LzR/SgpttgcuoRounST3/JKYeFPKJdkEnLiPr
         IprEQApvGrUNF2m4E8Q4JFjuLwlsdq2dIPfzyu5EmG7TgRdOryfTMT6Blt0hhyN/VFWZ
         RNeA6FacPA4XvBHxCRATFtXlt0iaabk/tX02LRYvxNqPKw+VUr0oRrw38tfLsIFAuhYk
         96l5lzs/eyf4O83kcZ2efaIBIkJmE8+5RfjKktDFMx3vpGpve/fTKZo2VoPkmvhwQEDD
         s0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+TC2/EESrq6Uv3Ks0uwJJzehLHQyiaRKrIFfH1GbmM=;
        b=dxXrHJ6VeCn2hM3RdUBzbiaWntiEtA+G1Jf9Lt0UUOlJenRYp1jm0O43o2ibuMxYVd
         iiaXASJ75KYP88IyHFlN9kJX5QxFQTKUMOpb+T2xqG6X0nE17TceWeX4P4gP5/RYJMRd
         YEb1GyTuDPG5NxbqOrA4n4hGAAf6q2MGc27o4PRD5hdwbnrxLp6O7Q1lnO2aV/FyDDao
         Vsz2v+FuiXYKZy2JT6XtJw/K6T/dWC/XU1LlG3IArDwTgIPi7HJEcT28q16BM+nhc3PS
         nC0PyG75fD0kGZ6emZfMwiCJjJkDY10DtzesREFUU3YjdSDqE22fMiArVZnyF0p0xXpZ
         JVwA==
X-Gm-Message-State: AJIora+YgQhhOLueBFFVKM6n2VfYrVxaR9qk6a2BWDh1GYn0ncI2KFsO
	m05z4Q/IhZQw6AuuucmySRNipoY8zmEse2UN
X-Google-Smtp-Source: 
 AGRyM1sVesHtHmvM4iJo3WNkOrrFiYL2Be4+w5G/DgrZ89IvN7ckD8XeRBUuqxVLJRFY9MFBKlCfgw==
X-Received: by 2002:a17:903:1111:b0:16a:acf4:e951 with SMTP id
 n17-20020a170903111100b0016aacf4e951mr6864112plh.72.1657773411070;
        Wed, 13 Jul 2022 21:36:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/27] gstreamer1.0-plugins-bad: upgrade 1.20.2
 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:37 -1000
Message-Id: 
 <0ead6c03c2594158200ee2c490ec683570310036.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168014

From: wangmy <wangmy@fujitsu.com>

Changes from version 1.20.2:

androidmedia: Add H.265 encoder mapping
avfvideosrc: fix wrong framerate selected for caps
d3d11decoder: Fix for alternate interlacing signalling
d3d11decoder: Do not preallocate texture using downstream d3d11 buffer pool
d3d11decoder: Copy HDR10 related caps field manually
d3d11decoder: Work around Intel DXVA driver crash
d3d11screencapture: Set viewport when drawing mouse cursor
d3d11screencapture: Fix missing/outdated cursor shape
d3d11screencapturesrc: Fix crash when d3d11 device is different from owned one
h264decoder: Fix for unhandled low-delay decoding case
matroskademux, qtdemux: Fix integer overflows in zlib/bz2/etc decompression code (Security fix)
mpegtsmux: Make sure to set srcpad caps under all conditions before outputting the first buffer
mpegtsmux: sends segment before caps
mxfdemux: Handle files produced by legacy FFmpeg
nvh264dec,nvh265dec: Don't realloc bitstream buffer per slice
nvcodec: cuda-converter: fix nvrtc compilation on non-English locale systems
opencv: Allow building against 4.6.x
pcapparse: Set timestamp in DTS, not PTS
rtmp2: fix allocation of GstRtmpMeta which caused crashes on 32-bit platforms
rtmp2sink crash on Android arm 32 - cerbero 1.20.2.0
sdpdemux: Release request pads from rtpbin when freeing a stream
va: Add O_CLOEXEC flag at opening drm device (so subprocesses won't have access to it)
webrtcbin: Reject answers that don't contain the same number of m-line as offer
webrtc: datachannel: Notify low buffered amount according to spec

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 200c8b77e86e6bd23954c3b4e48d4d069cb16f37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plugins-bad_1.20.2.bb => gstreamer1.0-plugins-bad_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.2.bb => gstreamer1.0-plugins-bad_1.20.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
index bb33e3822e..05de217c34 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "4adc4c05f41051f8136b80cda99b0d049a34e777832f9fea7c5a70347658745b"
+SRC_URI[sha256sum] = "7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.25.1


