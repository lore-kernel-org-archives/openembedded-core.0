Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.89.1603837779018592221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nYUWQvkt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id g19so389501pji.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+EaSKftK7/M69jvFGnNFZOAY7hnlhm4c4HYv6cxRl+g=;
        b=nYUWQvkttsSD9uh+pN9ItZbxi0TXfBbVcgx5a7mHtB59sE5Xa41PubYvbjJdd5M9eP
         ziqY0g3HVMfD4RA32vRCMBOKBWG8iOX5k7GdxzndR/0JQyVB29i2+apDpV3jdo85hPfm
         1f8mI9algIqkk02XxcP3Gpf6LjWc1tMcXTtLAM5ZAonOoUFojsVQeVToJmwjMrdPh6Sm
         nxu7C6MFUxVZq0B56Lgqofd/7kAiRbfJbZ1bVOtRxZ+ZmgfGzkVQqf4HEqgrNjsFEaKt
         KFJxniCUg0mySbS6AfMRwS6F0PTRgK7Bqd7hF5a2EIevGR25l+qeaMEpYa9D7RaFBsyl
         A9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+EaSKftK7/M69jvFGnNFZOAY7hnlhm4c4HYv6cxRl+g=;
        b=J11xuSISwTE7tVuzfr8/0w8rhiTwufn15FFlfw8QY1wA43PmfsxwD3BBMQxTHtBk/V
         PEeh7H43Bxy1rfncWOwXzphJHjULS2FG+HpJ3Yxol3o6T+13u8quFDbaignxwv8/7WD9
         rbKQiTPrkjr8K7MgTRL+SmxAmjdTsS2eBZTFQCi9eBVcK1Ww26iYaBF4htZ8g4tOKXNN
         mQrVM/RFJZeOAdjpns9YwoMrr3Cg9B6ekg8xQViD2QzUf5OSPedJTs5g6hDDCbwLE20+
         /Et4haqiLs5hSN6lsn68RZgNrCsMQDHPdP2aBuRv9Ugvs+es3RmcfwGIZiaRzlh+hq0p
         ZXCQ==
X-Gm-Message-State: AOAM5322BWe34eQGs+oZE6a2h2vLpZrUf5uIfic4Ssl0iOqNUE+e98pu
	SaMsbRuKEyReegu3MVgD6U2xsm4lKteNzsCk
X-Google-Smtp-Source: ABdhPJxYJWDK9rTL1xRqbmYrYH7DI6cvCBovEw3N2rCg1m337+1sQ7hAZRkEZzy0hvy+/P4d79ZXBQ==
X-Received: by 2002:a17:902:74cc:b029:d6:488:e5f2 with SMTP id f12-20020a17090274ccb02900d60488e5f2mr4413690plt.62.1603837778075;
        Tue, 27 Oct 2020 15:29:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] ffmpeg: fix CVE-2020-12284
Date: Tue, 27 Oct 2020 12:29:07 -1000
Message-Id: <326541919ba0d0e5a0c00cbda7dd6308230ff719.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-12284.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
new file mode 100644
index 0000000000..5fff4754f4
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
@@ -0,0 +1,36 @@
+From 1812352d767ccf5431aa440123e2e260a4db2726 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 7 Mar 2020 15:42:58 +0100
+Subject: [PATCH] avcodec/cbs_jpeg: Check length for SOS
+
+Fixes: out of array access
+Fixes: 19734/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5673507031875584
+Fixes: 19353/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5703944462663680
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1812352d767ccf5431aa440123e2e260a4db2726]
+CVE: CVE-2020-12284
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libavcodec/cbs_jpeg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/cbs_jpeg.c b/libavcodec/cbs_jpeg.c
+index 6bbce5f..89512a2 100644
+--- a/libavcodec/cbs_jpeg.c
++++ b/libavcodec/cbs_jpeg.c
+@@ -197,6 +197,9 @@ static int cbs_jpeg_split_fragment(CodedBitstreamContext *ctx,
+         if (marker == JPEG_MARKER_SOS) {
+             length = AV_RB16(frag->data + start);
+ 
++            if (length > end - start)
++                return AVERROR_INVALIDDATA;
++
+             data_ref = NULL;
+             data     = av_malloc(end - start +
+                                  AV_INPUT_BUFFER_PADDING_SIZE);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index d7b0641054..fddfef9e27 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://CVE-2020-12284.patch \
            "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.17.1

