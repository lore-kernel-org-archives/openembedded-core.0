Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B7DCCA482
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3971.1657773416725024620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AIQeDRM4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id p9so1401643pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LrG3gmOZkIlSIcVweMBovoMTz6hHlYRpwnlcTOD//N4=;
        b=AIQeDRM4bMVGV/ZnXqOCJZ5EVZahCrKwZfvEBhBd/NugBBD65jEDyK97TcsbFR3B6a
         IdugMHDjBnkDSa+uPRnx4JlSVhuVlWCcFv/uviK2r/sRvcMi6kBiNqhd4Y+NRJ6gAavM
         Op3jutvI0ulWK0qPvTm66Wjv7sGai6F3BkfKXZ0jkZhtjnwenRsilV1AaZi4q25Trsh/
         EFBuTOwKD7p/1uKGo39VN+9pANxnRn6MB3nu+vv18QLiZ0IA+FHcgujfGjrlbkbmE7mQ
         6SWxdZFpgrNb+10XB07Oe8isM9+Z+LDBK0Bnuu5HhYUBd7JG+i9qihrrb4Ywt4Qf2hC/
         NRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrG3gmOZkIlSIcVweMBovoMTz6hHlYRpwnlcTOD//N4=;
        b=7OAqPwBJlbjJ9Hb4jOBqfYV73sN1fXQOALFbZk8h/KT9ElxxgBOwLVQyJWBfV13DnV
         uYSG9SeMXQm3y3nF6CP5FQgVYoAHs42YvLV6V/G9aUGrwAYSn/eWbumx9ieoF8IesJME
         s+ZPBSiAUeKjSYIZnxceGY/UrLV0tFTejGO8WanQeH6+yZBoH+OZSXIG621Prqc+dABv
         l/m62I1Hwi490+9uHdxzt7eVCU0IAWJf2xF+BkK2VRsKaUhZZyT3Upce/glnqb0ASSxH
         2oXncuLop9eAgmpEnBmdnojw0Qi9mwH0rt+FB6MTTCm7C27u080CDPVt97XNeDzMgoOQ
         kSqg==
X-Gm-Message-State: AJIora+JmIQN84+5NXjJDDSlzmKo+AhuiQaz/h7rIzrV6OAoTIu7Dhig
	6qyDYyWEOosutQVfOc+O+p+a4jDzz+LYqStf
X-Google-Smtp-Source: 
 AGRyM1vfsfUM3SlmantllvICSL9EUiquO72ElEdUuMt2xkwNejwMWAnepw6PIoWlHipU85l0pvIq4Q==
X-Received: by 2002:a17:903:25d6:b0:16b:f6ad:1027 with SMTP id
 jc22-20020a17090325d600b0016bf6ad1027mr6503937plb.25.1657773415655;
        Wed, 13 Jul 2022 21:36:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/27] gstreamer1.0-plugins-good: upgrade 1.20.2
 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:39 -1000
Message-Id: 
 <4aee173335f8d0d0723d629a0dd16a0d1c4ce463.1657772638.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168016

From: wangmy <wangmy@fujitsu.com>

Changes from version 1.20.2

aacparse: Avoid mismatch between src_caps and output_header_type
avidemux: Fix integer overflow resulting in heap corruption in DIB buffer inversion code (Security fix)
deinterlace: Clean up error handling code
flvdemux: Actually make use of the debug category
gtkglsink: Fix double-free when OpenGL can't be initialised
jack: Add support for detecting libjack on Windows
matroskademux: Avoid integer-overflow resulting in heap corruption in WavPack header handling code (Security fix)
matroskademux, qtdemux: Fix integer overflows in zlib/bz2/etc decompression code (Security fix)
qtdemux: Don't use tfdt for parsing subsequent trun boxes
rtpbin: Avoid holding GST_RTP_BIN_LOCK when emitting pad-added signal (to avoid deadlocks)
rtpptdemux: Don't GST_FLOW_ERROR when ignoring invalid packets
smpte: Fix integer overflow with possible heap corruption in GstMask creation. (Security fix)
smpte: integer overflow with possible heap corruption in GstMask creation (Security fix)
soup: fix soup debug category initialisation
soup: Fix plugin/element init
v4l2: Reset transfer in gst_v4l2_object_acquire_format()
vpxenc: fix crash if encoder produces unmatching timestamp
wavparse: ensure that any pending segment is sent before an EOS event is sent

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66ba273c10b7d738f18620b5a2883d735fff3162)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
index 6c52fb35b9..0235935a4a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
+SRC_URI[sha256sum] = "f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.25.1


