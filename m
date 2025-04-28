Return-Path: <divyanshurathore2022@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5197DC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 12:26:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.46855.1745843193016800043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 05:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hA5n0Drk;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: divyanshurathore2022@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4213815b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745843192; x=1746447992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdTIngI6JVFxjmdR1c7+O6bB6LZ3BVZZn5iUJKeG3UU=;
        b=hA5n0DrkUITBTvuXwOVRGALq1UjaH8VQXqSXyPPxbeNF3Wy/YnYe5LK5u0FPoHb473
         oZQCFWan6gxaH9XEfEtGoSk53cKKEpj3oZMZpDUbSuPAcc0NdL9qjaloH3ZNdwAPsVYI
         C48U1YVfiOJuH/LnMSo4Ui/WB3w5R+KI6LfPmSpUfiOMnRqZWOOHQGZtxUEY5ladeBWk
         JaD788LMGfkRgEanoeQJtY0Bc237xLmeV98itEE6X1fGzfECjdlVsbpU89IENxkbU4mq
         44r47KYGdUu22l8YphWyuFOCpJV7NgWElKIvND6Doa7L2xDfMvFCmhsocpZ8tH0+dQjV
         NN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843192; x=1746447992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdTIngI6JVFxjmdR1c7+O6bB6LZ3BVZZn5iUJKeG3UU=;
        b=PjywsYi7DhLRZ9pl0tus6igsF6O+/VpvfSIQNWiKQW2+Ed9JiGsXV/5YOYV+0zJbPo
         5MRerekLlvHFzk1RCYnkswT8BW0XgFPEqCCf4x75ekMUZNvAhk26VmMrYCdO09gjEYMd
         0l07N4HIPwUPHwehynMY65ZXMyxO1H4eddvl6XPnOd5o3kNsNStckfRSYtcRrQFT0cNl
         HYBW/TIuFdP5tK7EGIpGqtd6zCPtfgR/xRipHp7hNCBJYjb8mRxvsVNMnCHXeOHBmazO
         0OqTEJNEx9TJuMG5y5O8ImNu3P6H/4YsBjfQHWy59xjyxOadDb8c/OaUmq9sPYTpnCFr
         jFig==
X-Gm-Message-State: AOJu0Yxh8Gj8SUxEapsXY3KFmxIfEYNW0JjKcaKXxwHie6bMYuTXnWTw
	aD/sZ+CLwHiNINAr9+XXa4ol/HQJVUp3Y6KpczsgSmpFNsUuElg++JxF4zpa
X-Gm-Gg: ASbGncu6JMaJE0Mfs1aH9DecCB4nkTcoNPQl3SwJVMDqkNewhXqDZRtrTXISNC/UUVN
	N6BkRXCtg8YsvF3bhNz//MxrBjwXPcXl/WQZdpMUUcQA7bwO98TUb5f/K/Bu48hU/fdP6zwY+hp
	f2A1z7lihbV2Sk6Cmtzss81/h4YnYnZjKS9BL+lx3wCf5f3pTW1mUszMcXmUzaRRTCOGiZi10Md
	7hTPx+fTZphqXXkObnWBYh+4e8TjzL6hEbAVeIWT5D054AKuYceWd1FUrNI/uR8qsAqTt4xa7es
	Iev3E7qxOmAGM/1Zq619xH5foLSjH0vzIzmUJnzGqbufT38XmG1UKgCYiKRTJA==
X-Google-Smtp-Source: AGHT+IEhqJTJ745BRaxbA0mWqXlZYBr/+D8dBO7MW5AVBfnupDltuAk7t+e+R5IZtqTbWGzeOCNgIQ==
X-Received: by 2002:a05:6a00:8c4:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-73fd75c4d62mr15463857b3a.12.1745843191547;
        Mon, 28 Apr 2025 05:26:31 -0700 (PDT)
Received: from localhost.localdomain ([103.197.74.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6abcdsm7803354b3a.116.2025.04.28.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:26:31 -0700 (PDT)
From: Divyanshu Rathore <divyanshurathore2022@gmail.com>
X-Google-Original-From: Divyanshu Rathore <Divyanshu.Rathore@kpit.com>
To: openembedded-core@lists.openembedded.org,
	Divyanshu.Rathore@kpit.com
Cc: Akash.Hadke@kpit.com,
	Divyanshu Rathore <divyanshurathore2022@gmail.com>
Subject: [OE-core][scarthgap][PATCH] ffmpeg: upgrade 6.1.1 -> 6.1.2
Date: Mon, 28 Apr 2025 17:56:24 +0530
Message-Id: <20250428122624.108701-1-Divyanshu.Rathore@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 12:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215597

From: Divyanshu Rathore <divyanshurathore2022@gmail.com>

ffmpeg_6.1.2 is stable. It brings many fixes.
check the changelog mention below for information about fixes.
changelog: https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n6.1.2

This upgrade also fixes CVE's hence remove those patches.
Refresh vulkan_av1_stable_API.patch as per new codebase.

Signed-off-by: Divyanshu Rathore <divyanshurathore2022@gmail.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        | 30 -------
 .../ffmpeg/ffmpeg/CVE-2023-49528.patch        | 58 --------------
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 -------------------
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 37 ---------
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 36 ---------
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        | 62 ---------------
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 35 ---------
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        | 47 -----------
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 41 ----------
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 37 ---------
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 37 ---------
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 ---------
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 36 ---------
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 ---------
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 ---------
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 ---------
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 --------
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        | 39 ----------
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 --------
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 ---------
 .../ffmpeg/ffmpeg/vulkan_av1_stable_API.patch | 40 +++++-----
 .../{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb}      | 22 +-----
 22 files changed, 21 insertions(+), 863 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb} (92%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
deleted file mode 100644
index 80d542952a..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4adb93dff05dd947878c67784d98c9a4e13b57a7 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Thu, 23 Nov 2023 14:58:35 +0100
-Subject: [PATCH] avfilter/asrc_afirsrc: fix by one smaller allocation of
- buffer
-
-CVE: CVE-2023-49501
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/4adb93dff05dd947878c67784d98c9a4e13b57a7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/asrc_afirsrc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavfilter/asrc_afirsrc.c b/libavfilter/asrc_afirsrc.c
-index e2359c1..ea04c35 100644
---- a/libavfilter/asrc_afirsrc.c
-+++ b/libavfilter/asrc_afirsrc.c
-@@ -480,7 +480,7 @@ static av_cold int config_eq_output(AVFilterLink *outlink)
-         if (ret < 0)
-             return ret;
-
--        s->magnitude = av_calloc(s->nb_magnitude, sizeof(*s->magnitude));
-+        s->magnitude = av_calloc(s->nb_magnitude + 1, sizeof(*s->magnitude));
-         if (!s->magnitude)
-             return AVERROR(ENOMEM);
-         memcpy(s->magnitude, eq_presets[s->preset].gains, sizeof(*s->magnitude) * s->nb_magnitude);
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
deleted file mode 100644
index 37e1ab61d1..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 2d9ed64859c9887d0504cd71dbd5b2c15e14251a Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Sat, 25 Nov 2023 12:54:28 +0100
-Subject: [PATCH 3/3] avfilter/af_dialoguenhance: fix overreads
-
-CVE: CVE-2023-49528
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/2d9ed64859c9887d0504cd71dbd5b2c15e14251a]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/af_dialoguenhance.c | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/libavfilter/af_dialoguenhance.c b/libavfilter/af_dialoguenhance.c
-index 1762ea7..29c8ab1 100644
---- a/libavfilter/af_dialoguenhance.c
-+++ b/libavfilter/af_dialoguenhance.c
-@@ -96,12 +96,12 @@ static int config_input(AVFilterLink *inlink)
-     if (!s->window)
-         return AVERROR(ENOMEM);
-
--    s->in_frame       = ff_get_audio_buffer(inlink, s->fft_size * 4);
--    s->center_frame   = ff_get_audio_buffer(inlink, s->fft_size * 4);
--    s->out_dist_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
--    s->windowed_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
--    s->windowed_out   = ff_get_audio_buffer(inlink, s->fft_size * 4);
--    s->windowed_prev  = ff_get_audio_buffer(inlink, s->fft_size * 4);
-+    s->in_frame       = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-+    s->center_frame   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-+    s->out_dist_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-+    s->windowed_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-+    s->windowed_out   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-+    s->windowed_prev  = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
-     if (!s->in_frame || !s->windowed_out || !s->windowed_prev ||
-         !s->out_dist_frame || !s->windowed_frame || !s->center_frame)
-         return AVERROR(ENOMEM);
-@@ -250,6 +250,7 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
-     float *right_osamples  = (float *)out->extended_data[1];
-     float *center_osamples = (float *)out->extended_data[2];
-     const int offset = s->fft_size - s->overlap;
-+    const int nb_samples = FFMIN(s->overlap, s->in->nb_samples);
-     float vad;
-
-     // shift in/out buffers
-@@ -258,8 +259,8 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
-     memmove(left_out, &left_out[s->overlap], offset * sizeof(float));
-     memmove(right_out, &right_out[s->overlap], offset * sizeof(float));
-
--    memcpy(&left_in[offset], left_samples, s->overlap * sizeof(float));
--    memcpy(&right_in[offset], right_samples, s->overlap * sizeof(float));
-+    memcpy(&left_in[offset], left_samples, nb_samples * sizeof(float));
-+    memcpy(&right_in[offset], right_samples, nb_samples * sizeof(float));
-     memset(&left_out[offset], 0, s->overlap * sizeof(float));
-     memset(&right_out[offset], 0, s->overlap * sizeof(float));
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
deleted file mode 100644
index d86e39707e..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From b1942734c7cbcdc9034034373abcc9ecb9644c47 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Mon, 27 Nov 2023 11:45:34 +0100
-Subject: [PATCH 2/3] avfilter/af_afwtdn: fix crash with EOF handling
-
-CVE: CVE-2023-50007
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/af_afwtdn.c | 34 +++++++++++++++++++---------------
- 1 file changed, 19 insertions(+), 15 deletions(-)
-
-diff --git a/libavfilter/af_afwtdn.c b/libavfilter/af_afwtdn.c
-index 0fcfa77..63b7f5f 100644
---- a/libavfilter/af_afwtdn.c
-+++ b/libavfilter/af_afwtdn.c
-@@ -408,6 +408,7 @@ typedef struct AudioFWTDNContext {
-
-     uint64_t sn;
-     int64_t eof_pts;
-+    int eof;
-
-     int wavelet_type;
-     int channels;
-@@ -1069,7 +1070,7 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
-         s->drop_samples = 0;
-     } else {
-         if (s->padd_samples < 0 && eof) {
--            out->nb_samples += s->padd_samples;
-+            out->nb_samples = FFMAX(0, out->nb_samples + s->padd_samples);
-             s->padd_samples = 0;
-         }
-         if (!eof)
-@@ -1208,23 +1209,26 @@ static int activate(AVFilterContext *ctx)
-
-     FF_FILTER_FORWARD_STATUS_BACK(outlink, inlink);
-
--    ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
--    if (ret < 0)
--        return ret;
--    if (ret > 0)
--        return filter_frame(inlink, in);
-+    if (!s->eof) {
-+        ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
-+        if (ret < 0)
-+            return ret;
-+        if (ret > 0)
-+            return filter_frame(inlink, in);
-+    }
-
-     if (ff_inlink_acknowledge_status(inlink, &status, &pts)) {
--        if (status == AVERROR_EOF) {
--            while (s->padd_samples != 0) {
--                ret = filter_frame(inlink, NULL);
--                if (ret < 0)
--                    return ret;
--            }
--            ff_outlink_set_status(outlink, status, pts);
--            return ret;
--        }
-+        if (status == AVERROR_EOF)
-+            s->eof = 1;
-     }
-+
-+    if (s->eof && s->padd_samples != 0) {
-+        return filter_frame(inlink, NULL);
-+    } else if (s->eof) {
-+        ff_outlink_set_status(outlink, AVERROR_EOF, s->eof_pts);
-+        return 0;
-+    }
-+
-     FF_FILTER_FORWARD_WANTED(outlink, inlink);
-
-     return FFERROR_NOT_READY;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
deleted file mode 100644
index b42badb567..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 66b50445cb36cf6adb49c2397362509aedb42c71 Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Fri, 16 Feb 2024 11:17:13 -0300
-Subject: [PATCH 1/3] avcodec/speexdec: check for sane frame_size values
-
-Regression since ab39cc36c72bb73318bb911acb66873de850a107.
-
-Fixes heap buffer overflows
-Fixes ticket #10866
-
-Reported-by: sploitem <sploitem@gmail.com>
-Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2024-28661
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/66b50445cb36cf6adb49c2397362509aedb42c71]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/speexdec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
-index 08c7e77..23b8605 100644
---- a/libavcodec/speexdec.c
-+++ b/libavcodec/speexdec.c
-@@ -1422,6 +1422,7 @@ static int parse_speex_extradata(AVCodecContext *avctx,
-     s->frame_size = bytestream_get_le32(&buf);
-     if (s->frame_size < NB_FRAME_SIZE << s->mode)
-         return AVERROR_INVALIDDATA;
-+    s->frame_size *= 1 + (s->mode > 0);
-     s->vbr = bytestream_get_le32(&buf);
-     s->frames_per_packet = bytestream_get_le32(&buf);
-     if (s->frames_per_packet <= 0 ||
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
deleted file mode 100644
index 0f30c9ecf5..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Mon, 8 Apr 2024 18:38:42 +0200
-Subject: [PATCH]  avcodec/mpegvideo_enc: Fix 1 line and one column images
-
-Fixes: Ticket10952
-Fixes: poc21ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-32230
-
-Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/mpegvideo_enc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/mpegvideo_enc.c b/libavcodec/mpegvideo_enc.c
-index e460ca4..fb4aaa2 100644
---- a/libavcodec/mpegvideo_enc.c
-+++ b/libavcodec/mpegvideo_enc.c
-@@ -1198,8 +1198,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
-                 int dst_stride = i ? s->uvlinesize : s->linesize;
-                 int h_shift = i ? s->chroma_x_shift : 0;
-                 int v_shift = i ? s->chroma_y_shift : 0;
--                int w = s->width  >> h_shift;
--                int h = s->height >> v_shift;
-+                int w = AV_CEIL_RSHIFT(s->width , h_shift);
-+                int h = AV_CEIL_RSHIFT(s->height, v_shift);
-                 const uint8_t *src = pic_arg->data[i];
-                 uint8_t *dst = pic->f->data[i];
-                 int vpad = 16;
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
deleted file mode 100644
index 2b5646e07c..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Mon, 25 Mar 2024 16:54:25 +0100
-Subject: [PATCH] fftools/ffmpeg_mux_init: Fix double-free on error
-
-MATCH_PER_STREAM_OPT iterates over all options of a given
-OptionDef and tests whether they apply to the current stream;
-if so, they are set to ost->apad, otherwise, the code errors
-out. If no error happens, ost->apad is av_strdup'ed in order
-to take ownership of this pointer.
-
-But this means that setting it originally was premature,
-as it leads to double-frees when an error happens lateron.
-This can simply be reproduced with
-ffmpeg -filter_complex anullsrc  -apad bar -apad:n baz -f null -
-This is a regression since 83ace80bfd80fcdba2c65fa1d554923ea931d5bd.
-
-Fix this by using a temporary variable instead of directly
-setting ost->apad. Also only strdup the string if it actually
-is != NULL.
-
-Reviewed-by: Marth64 <marth64@proxyid.net>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35365
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- fftools/ffmpeg_mux_init.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/fftools/ffmpeg_mux_init.c b/fftools/ffmpeg_mux_init.c
-index 63a25a3..685c064 100644
---- a/fftools/ffmpeg_mux_init.c
-+++ b/fftools/ffmpeg_mux_init.c
-@@ -845,6 +845,7 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
-         int channels = 0;
-         char *layout = NULL;
-         char *sample_fmt = NULL;
-+        const char *apad = NULL;
-
-         MATCH_PER_STREAM_OPT(audio_channels, i, channels, oc, st);
-         if (channels) {
-@@ -882,8 +883,12 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
-
-         MATCH_PER_STREAM_OPT(audio_sample_rate, i, audio_enc->sample_rate, oc, st);
-
--        MATCH_PER_STREAM_OPT(apad, str, ost->apad, oc, st);
--        ost->apad = av_strdup(ost->apad);
-+        MATCH_PER_STREAM_OPT(apad, str, apad, oc, st);
-+        if (apad) {
-+            ost->apad = av_strdup(apad);
-+            if (!ost->apad)
-+                return AVERROR(ENOMEM);
-+        }
-
- #if FFMPEG_OPT_MAP_CHANNEL
-         /* check for channel mapping for this audio stream */
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
deleted file mode 100644
index f7f16a5b92..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0bed22d597b78999151e3bde0768b7fe763fc2a6 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 26 Mar 2024 00:39:49 +0100
-Subject: [PATCH] avformat/sbgdec: Check for negative duration
-
-Fixes: signed integer overflow: 9223372036854775807 - -8000000 cannot be represented in type 'long'
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_SBG_fuzzer-5133181743136768
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-35366
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0bed22d597b78999151e3bde0768b7fe763fc2a6]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/sbgdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/sbgdec.c b/libavformat/sbgdec.c
-index b2662ea..281fe62 100644
---- a/libavformat/sbgdec.c
-+++ b/libavformat/sbgdec.c
-@@ -386,7 +386,7 @@ static int parse_options(struct sbg_parser *p)
-                 case 'L':
-                     FORWARD_ERROR(parse_optarg(p, opt, &oarg));
-                     r = str_to_time(oarg.s, &p->scs.opt_duration);
--                    if (oarg.e != oarg.s + r) {
-+                    if (oarg.e != oarg.s + r || p->scs.opt_duration < 0) {
-                         snprintf(p->err_msg, sizeof(p->err_msg),
-                                  "syntax error for option -L");
-                         return AVERROR_INVALIDDATA;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
deleted file mode 100644
index a1bec43c66..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 09e6840cf7a3ee07a73c3ae88a020bf27ca1a667 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Wed, 13 Mar 2024 02:10:26 +0100
-Subject: [PATCH] avcodec/ppc/vp8dsp_altivec: Fix out-of-bounds access
-
-h_subpel_filters_inner[i] and h_subpel_filters_outer[i / 2]
-belong together and the former allows the range 0..6,
-so the latter needs to support 0..3. But it has only three
-elements. Add another one.
-The value for the last element has been guesstimated
-from subpel_filters in libavcodec/vp8dsp.c.
-
-This is also intended to fix FATE-failures with UBSan here:
-https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
-
-Tested-by: Sean McGovern <gseanmcg@gmail.com>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35367
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/ppc/vp8dsp_altivec.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libavcodec/ppc/vp8dsp_altivec.c b/libavcodec/ppc/vp8dsp_altivec.c
-index 12dac8b..061914f 100644
---- a/libavcodec/ppc/vp8dsp_altivec.c
-+++ b/libavcodec/ppc/vp8dsp_altivec.c
-@@ -50,11 +50,12 @@ static const vec_s8 h_subpel_filters_inner[7] =
- // for 6tap filters, these are the outer two taps
- // The zeros mask off pixels 4-7 when filtering 0-3
- // and vice-versa
--static const vec_s8 h_subpel_filters_outer[3] =
-+static const vec_s8 h_subpel_filters_outer[4] =
- {
-     REPT4(0, 0, 2, 1),
-     REPT4(0, 0, 3, 3),
-     REPT4(0, 0, 1, 2),
-+    REPT4(0, 0, 0, 0),
- };
-
- #define LOAD_H_SUBPEL_FILTER(i) \
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
deleted file mode 100644
index 7b802762eb..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4513300989502090c4fd6560544dce399a8cd53c Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Sun, 24 Sep 2023 13:15:48 +0200
-Subject: [PATCH] avcodec/rkmppdec: Fix double-free on error
-
-After having created the AVBuffer that is put into frame->buf[0],
-ownership of several objects (namely an AVDRMFrameDescriptor,
-an MppFrame and some AVBufferRefs framecontextref and decoder_ref)
-has passed to the AVBuffer and therefore to the frame.
-Yet it has nevertheless been freed manually on error
-afterwards, which would lead to a double-free as soon
-as the AVFrame is unreferenced.
-
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35368
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/4513300989502090c4fd6560544dce399a8cd53c]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/rkmppdec.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/rkmppdec.c b/libavcodec/rkmppdec.c
-index 5768568..2ca368e 100644
---- a/libavcodec/rkmppdec.c
-+++ b/libavcodec/rkmppdec.c
-@@ -462,8 +462,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
-
-             frame->hw_frames_ctx = av_buffer_ref(decoder->frames_ref);
-             if (!frame->hw_frames_ctx) {
--                ret = AVERROR(ENOMEM);
--                goto fail;
-+                av_frame_unref(frame);
-+                return AVERROR(ENOMEM);
-             }
-
-             return 0;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
deleted file mode 100644
index 72dc8d14a7..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Sat, 17 Feb 2024 09:45:57 -0300
-Subject: [PATCH] avcodec/speexdec: further check for sane frame_size values
-
-Prevent potential integer overflows.
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2024-35369
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/speexdec.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
-index 23b8605..a034009 100644
---- a/libavcodec/speexdec.c
-+++ b/libavcodec/speexdec.c
-@@ -1420,9 +1420,10 @@ static int parse_speex_extradata(AVCodecContext *avctx,
-         return AVERROR_INVALIDDATA;
-     s->bitrate = bytestream_get_le32(&buf);
-     s->frame_size = bytestream_get_le32(&buf);
--    if (s->frame_size < NB_FRAME_SIZE << s->mode)
-+    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0) ||
-+        s->frame_size >     INT32_MAX >> (s->mode > 0))
-         return AVERROR_INVALIDDATA;
--    s->frame_size *= 1 + (s->mode > 0);
-+    s->frame_size <<= (s->mode > 0);
-     s->vbr = bytestream_get_le32(&buf);
-     s->frames_per_packet = bytestream_get_le32(&buf);
-     if (s->frames_per_packet <= 0 ||
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
deleted file mode 100644
index 0061b7ad98..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 50d8e4f27398fd5778485a827d7a2817921f8540 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 30 Sep 2023 00:51:29 +0200
-Subject: [PATCH] avformat/dxa: Adjust order of operations around block align
-
-Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
-Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-(cherry picked from commit 50d8e4f27398fd5778485a827d7a2817921f8540)
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36613
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/50d8e4f27398fd5778485a827d7a2817921f8540]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/dxa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/dxa.c b/libavformat/dxa.c
-index 474b852..b4d9d00 100644
---- a/libavformat/dxa.c
-+++ b/libavformat/dxa.c
-@@ -122,7 +122,7 @@ static int dxa_read_header(AVFormatContext *s)
-         if(ast->codecpar->block_align) {
-             if (c->bpc > INT_MAX - ast->codecpar->block_align + 1)
-                 return AVERROR_INVALIDDATA;
--            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
-+            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
-         }
-         c->bytes_left = fsize;
-         c->wavpos = avio_tell(pb);
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
deleted file mode 100644
index 3f02c45b33..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 86f73277bf014e2ce36dd2594f1e0fb8b3bd6661 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 26 Mar 2024 01:00:13 +0100
-Subject: [PATCH] avformat/westwood_vqa: Fix 2g packets
-
-Fixes: signed integer overflow: 2147483424 * 2 cannot be represented in type 'int'
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_WSVQA_fuzzer-4576211411795968
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36616
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/86f73277bf014e2ce36dd2594f1e0fb8b3bd6661]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/westwood_vqa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/westwood_vqa.c b/libavformat/westwood_vqa.c
-index 03b2d9e..024f5d3 100644
---- a/libavformat/westwood_vqa.c
-+++ b/libavformat/westwood_vqa.c
-@@ -262,7 +262,7 @@ static int wsvqa_read_packet(AVFormatContext *s,
-                     break;
-                 case SND2_TAG:
-                     /* 2 samples/byte, 1 or 2 samples per frame depending on stereo */
--                    pkt->duration = (chunk_size * 2) / wsvqa->channels;
-+                    pkt->duration = (chunk_size * 2LL) / wsvqa->channels;
-                     break;
-                 }
-                 break;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
deleted file mode 100644
index 5d751213e3..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d973fcbcc2f944752ff10e6a76b0b2d9329937a7 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 30 Sep 2023 00:38:17 +0200
-Subject: [PATCH] avformat/cafdec: dont seek beyond 64bit
-
-Fixes: signed integer overflow: 64 + 9223372036854775807 cannot be represented in type 'long long'
-Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
-Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_CAF_fuzzer-6418242730328064
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36617
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/d973fcbcc2f944752ff10e6a76b0b2d9329937a7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/cafdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/cafdec.c b/libavformat/cafdec.c
-index f5ba0f4..e92e327 100644
---- a/libavformat/cafdec.c
-+++ b/libavformat/cafdec.c
-@@ -271,7 +271,7 @@ static int read_pakt_chunk(AVFormatContext *s, int64_t size)
-         }
-     }
-
--    if (avio_tell(pb) - ccount > size) {
-+    if (avio_tell(pb) - ccount > size || size > INT64_MAX - ccount) {
-         av_log(s, AV_LOG_ERROR, "error reading packet table\n");
-         return AVERROR_INVALIDDATA;
-     }
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
deleted file mode 100644
index 5caca2da7c..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7a089ed8e049e3bfcb22de1250b86f2106060857 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Tue, 12 Mar 2024 23:23:17 +0100
-Subject: [PATCH] avformat/avidec: Fix integer overflow iff ULONG_MAX <
- INT64_MAX
-
-Affects many FATE-tests, see
-https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
-
-Reviewed-by: James Almer <jamrial@gmail.com>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-36618
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/avidec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/avidec.c b/libavformat/avidec.c
-index 00bd7a9..bc95466 100644
---- a/libavformat/avidec.c
-+++ b/libavformat/avidec.c
-@@ -1696,7 +1696,7 @@ static int check_stream_max_drift(AVFormatContext *s)
-     int *idx = av_calloc(s->nb_streams, sizeof(*idx));
-     if (!idx)
-         return AVERROR(ENOMEM);
--    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1LU) {
-+    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1ULL) {
-         int64_t max_dts = INT64_MIN / 2;
-         int64_t min_dts = INT64_MAX / 2;
-         int64_t max_buffer = 0;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
deleted file mode 100644
index 63d08eabcc..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 28c7094b25b689185155a6833caf2747b94774a4 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Thu, 4 Apr 2024 00:15:27 +0200
-Subject: [PATCH] avcodec/wavarc: fix signed integer overflow in block type
- 6/19
-
-Fixes: signed integer overflow: -2088796289 + -91276551 cannot be represented in type 'int'
-Fixes: 67772/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_WAVARC_fuzzer-6533568953122816
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-36619
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/28c7094b25b689185155a6833caf2747b94774a4]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/wavarc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/wavarc.c b/libavcodec/wavarc.c
-index 09ed4d4..51d91a4 100644
---- a/libavcodec/wavarc.c
-+++ b/libavcodec/wavarc.c
-@@ -648,7 +648,7 @@ static int decode_5elp(AVCodecContext *avctx,
-                 for (int o = 0; o < order; o++)
-                     sum += s->filter[ch][o] * (unsigned)samples[n + 70 - o - 1];
-
--                samples[n + 70] += ac_out[n] + (sum >> 4);
-+                samples[n + 70] += ac_out[n] + (unsigned)(sum >> 4);
-             }
-
-             for (int n = 0; n < 70; n++)
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
deleted file mode 100644
index afd857ceac..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 587acd0d4020859e67d1f07aeff2c885797ebcce Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Thu, 18 Jul 2024 21:12:54 +0200
-Subject: [PATCH] avcodec/pnmdec: Use 64bit for input size check
-
-Fixes: out of array read
-Fixes: poc3
-
-Reported-by: VulDB CNA Team
-Found-by: CookedMelon
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-(cherry picked from commit 3faadbe2a27e74ff5bb5f7904ec27bb1f5287dc8)
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2024-7055
-
-Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=587acd0d4020859e67d1f07aeff2c885797ebcce]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/pnmdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
-index acd77ea..40cc2ae 100644
---- a/libavcodec/pnmdec.c
-+++ b/libavcodec/pnmdec.c
-@@ -264,7 +264,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, AVFrame *p,
-         break;
-     case AV_PIX_FMT_GBRPF32:
-         if (!s->half) {
--            if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
-+            if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
-                 return AVERROR_INVALIDDATA;
-             scale = 1.f / s->scale;
-             if (s->endian) {
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
deleted file mode 100644
index d3e02bebe6..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Mon, 6 Jan 2025 22:01:39 +0100
-Subject: [PATCH] avfilter/af_pan: Fix sscanf() use
-
-Fixes: Memory Data Leak
-
-Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2025-0518
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/af_pan.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
-index cfed9f1..ffcd214 100644
---- a/libavfilter/af_pan.c
-+++ b/libavfilter/af_pan.c
-@@ -165,7 +165,7 @@ static av_cold int init(AVFilterContext *ctx)
-         sign = 1;
-         while (1) {
-             gain = 1;
--            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
-+            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
-                 arg += len;
-             if (parse_channel_name(&arg, &in_ch_id, &named)){
-                 av_log(ctx, AV_LOG_ERROR,
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
deleted file mode 100644
index f895576de3..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1446e37d3d032e1452844778b3e6ba2c20f0c322 Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Mon, 30 Dec 2024 00:25:41 -0300
-Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
-
-A sample rate <= 0 is invalid.
-
-Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
-Fixes ticket #11385.
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2025-22919
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1446e37d3d032e1452844778b3e6ba2c20f0c322]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/buffersrc.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
-index 453fc0f..f49aa91 100644
---- a/libavfilter/buffersrc.c
-+++ b/libavfilter/buffersrc.c
-@@ -401,6 +401,11 @@ FF_ENABLE_DEPRECATION_WARNINGS
-         av_channel_layout_describe(&s->ch_layout, buf, sizeof(buf));
-     }
-
-+    if (s->sample_rate <= 0) {
-+        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
-+        return AVERROR(EINVAL);
-+    }
-+
-     if (!s->time_base.num)
-         s->time_base = (AVRational){1, s->sample_rate};
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
deleted file mode 100644
index 20fac68d01..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7f9c7f9849a2155224711f0ff57ecdac6e4bfb57 Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Wed, 1 Jan 2025 23:58:39 -0300
-Subject: [PATCH] avcodec/jpeg2000dec: clear array length when freeing it
-
-Fixes NULL pointer dereferences.
-Fixes ticket #11393.
-
-Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2025-22921
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/7f9c7f9849a2155224711f0ff57ecdac6e4bfb57]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/jpeg2000dec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libavcodec/jpeg2000dec.c b/libavcodec/jpeg2000dec.c
-index 691cfbd..b56902c 100644
---- a/libavcodec/jpeg2000dec.c
-+++ b/libavcodec/jpeg2000dec.c
-@@ -1223,6 +1223,7 @@ static int jpeg2000_decode_packet(Jpeg2000DecoderContext *s, Jpeg2000Tile *tile,
-                 }
-             }
-             av_freep(&cblk->lengthinc);
-+            cblk->nb_lengthinc = 0;
-         }
-     }
-     // Save state of stream
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
deleted file mode 100644
index ea619025d1..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c08d300481b8ebb846cd43a473988fdbc6793d1b Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Fri, 17 Jan 2025 00:05:31 -0300
-Subject: [PATCH] avformat/avformat: also clear FFFormatContext packet queue
- when closing a muxer
-
-packet_buffer is used in mux.c, and if a muxing process fails at a point where
-packets remained in said queue, they will leak.
-
-Fixes ticket #11419
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2025-25473
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/c08d300481b8ebb846cd43a473988fdbc6793d1b]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/avformat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libavformat/avformat.c b/libavformat/avformat.c
-index 5b8bb78..73f31cd 100644
---- a/libavformat/avformat.c
-+++ b/libavformat/avformat.c
-@@ -138,6 +138,7 @@ void avformat_free_context(AVFormatContext *s)
-     av_dict_free(&si->id3v2_meta);
-     av_packet_free(&si->pkt);
-     av_packet_free(&si->parse_pkt);
-+    avpriv_packet_list_free(&si->packet_buffer);
-     av_freep(&s->streams);
-     ff_flush_packet_queue(s);
-     av_freep(&s->url);
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
index 74db148b3b..dd69549156 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_av1_stable_API.patch
@@ -6,6 +6,9 @@ Subject: [PATCH] vulkan_av1: port to the new stable API
 Co-Authored-by: Dave Airlie <airlied@redhat.com>
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/ecdc94b97f809d5f2b88640842fd0541951ad295]
+
+Comment: Patch is refreshed as per codebase of 6.1.2
+Signed-off-by: Divyanshu Rathore <divyanshurathore2022@gmail.com>
 ---
  configure                                     |   4 +-
  libavcodec/Makefile                           |   5 +-
@@ -26,7 +29,7 @@ diff --git a/configure b/configure
 index e853deb51d..9fa639fca6 100755
 --- a/configure
 +++ b/configure
-@@ -7300,8 +7300,8 @@ enabled vdpau &&
+@@ -7160,8 +7160,8 @@ enabled crystalhd && check_lib crystalhd
           "in maintaining it."
  
  if enabled vulkan; then
@@ -41,21 +44,19 @@ diff --git a/libavcodec/Makefile b/libavcodec/Makefile
 index 7ef2e03ca6..9ce6d445c1 100644
 --- a/libavcodec/Makefile
 +++ b/libavcodec/Makefile
-@@ -1258,8 +1258,7 @@ SKIPHEADERS                            += %_tablegen.h                  \
+@@ -1284,7 +1284,6 @@ SKIPHEADERS                            +
                                            aacenc_quantization.h         \
                                            aacenc_quantization_misc.h    \
                                            bitstream_template.h          \
--                                          vulkan_video_codec_av1std.h   \
--                                          $(ARCH)/vpx_arith.h          \
-+                                          $(ARCH)/vpx_arith.h           \
+-                                          vulkan_video_codec_av1std_mesa.h \
+                                           $(ARCH)/vpx_arith.h          \
  
  SKIPHEADERS-$(CONFIG_AMF)              += amfenc.h
- SKIPHEADERS-$(CONFIG_D3D11VA)          += d3d11va.h dxva2_internal.h
-@@ -1280,7 +1279,7 @@ SKIPHEADERS-$(CONFIG_QSVENC)           += qsvenc.h
+@@ -1306,7 +1305,7 @@ SKIPHEADERS-$(CONFIG_XVMC)             +
  SKIPHEADERS-$(CONFIG_VAAPI)            += vaapi_decode.h vaapi_hevc.h vaapi_encode.h
  SKIPHEADERS-$(CONFIG_VDPAU)            += vdpau.h vdpau_internal.h
  SKIPHEADERS-$(CONFIG_VIDEOTOOLBOX)     += videotoolbox.h vt_internal.h
--SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h vulkan_video_codec_av1std_decode.h
+-SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h vulkan_video_codec_av1std_decode_mesa.h
 +SKIPHEADERS-$(CONFIG_VULKAN)           += vulkan.h vulkan_video.h vulkan_decode.h
  SKIPHEADERS-$(CONFIG_V4L2_M2M)         += v4l2_buffers.h v4l2_context.h v4l2_m2m.h
  SKIPHEADERS-$(CONFIG_ZLIB)             += zlib_wrapper.h
@@ -866,19 +867,19 @@ diff --git a/libavcodec/vulkan_video.h b/libavcodec/vulkan_video.h
 index bb69e920bb..01a1de7d9d 100644
 --- a/libavcodec/vulkan_video.h
 +++ b/libavcodec/vulkan_video.h
-@@ -22,8 +22,6 @@
+@@ -23,8 +23,6 @@
  #include "vulkan.h"
  
  #include <vk_video/vulkan_video_codecs_common.h>
--#include "vulkan_video_codec_av1std.h"
--#include "vulkan_video_codec_av1std_decode.h"
+-#include "vulkan_video_codec_av1std_mesa.h"
+-#include "vulkan_video_codec_av1std_decode_mesa.h"
  
  #define CODEC_VER_MAJ(ver) (ver >> 22)
  #define CODEC_VER_MIN(ver) ((ver >> 12) & ((1 << 10) - 1))
-diff --git a/libavcodec/vulkan_video_codec_av1std_decode.h b/libavcodec/vulkan_video_codec_av1std_decode.h
+diff --git a/libavcodec/vulkan_video_codec_av1std_decode_mesa.h b/libavcodec/vulkan_video_codec_av1std_decode_mesa.h
 deleted file mode 100644
 index e2f37b4e6e..0000000000
---- a/libavcodec/vulkan_video_codec_av1std_decode.h
+--- a/libavcodec/vulkan_video_codec_av1std_decode_mesa.h
 +++ /dev/null
 @@ -1,36 +0,0 @@
 -/* Copyright 2023 Lynne
@@ -897,8 +898,8 @@ index e2f37b4e6e..0000000000
 - * limitations under the License.
 - */
 -
--#ifndef VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_
--#define VULKAN_VIDEO_CODEC_AV1STD_DECODE_H_ 1
+-#ifndef VULKAN_VIDEO_CODEC_AV1STD_DECODE_MESA_H_
+-#define VULKAN_VIDEO_CODEC_AV1STD_DECODE_MESA_H_ 1
 -
 -/*
 -** This header is NOT YET generated from the Khronos Vulkan XML API Registry.
@@ -917,10 +918,10 @@ index e2f37b4e6e..0000000000
 -#endif
 -
 -#endif
-diff --git a/libavcodec/vulkan_video_codec_av1std.h b/libavcodec/vulkan_video_codec_av1std.h
+diff --git a/libavcodec/vulkan_video_codec_av1std_mesa.h b/libavcodec/vulkan_video_codec_av1std_mesa.h
 deleted file mode 100644
 index c91589eee2..0000000000
---- a/libavcodec/vulkan_video_codec_av1std.h
+--- a/libavcodec/vulkan_video_codec_av1std_mesa.h
 +++ /dev/null
 @@ -1,403 +0,0 @@
 -/* Copyright 2023 Lynne
@@ -939,8 +940,8 @@ index c91589eee2..0000000000
 - * limitations under the License.
 - */
 -
--#ifndef VULKAN_VIDEO_CODEC_AV1STD_H_
--#define VULKAN_VIDEO_CODEC_AV1STD_H_ 1
+-#ifndef VULKAN_VIDEO_CODEC_AV1STD_MESA_H_
+-#define VULKAN_VIDEO_CODEC_AV1STD_MESA_H_ 1
 -
 -/*
 -** This header is NOT YET generated from the Khronos Vulkan XML API Registry.
@@ -1379,4 +1380,3 @@ diff --git a/libavcodec/vulkan_video.c b/libavcodec/vulkan_video.c
  
 -- 
 2.25.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
similarity index 92%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
index 3d766c3fc7..67e0c0cc53 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
@@ -31,29 +31,9 @@ SRC_URI = " \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
-    file://CVE-2024-32230.patch \
-    file://CVE-2023-49501.patch \
-    file://CVE-2024-28661.patch \
-    file://CVE-2023-50007.patch \
-    file://CVE-2023-49528.patch \
-    file://CVE-2024-7055.patch \
-    file://CVE-2024-35366.patch \
-    file://CVE-2024-35367.patch \
-    file://CVE-2024-35368.patch \
-    file://CVE-2024-35365.patch \
-    file://CVE-2024-36613.patch \
-    file://CVE-2024-36616.patch \
-    file://CVE-2024-36617.patch \
-    file://CVE-2024-36618.patch \
-    file://CVE-2024-36619.patch \
-    file://CVE-2024-35369.patch \
-    file://CVE-2025-25473.patch \
-    file://CVE-2025-22919.patch \
-    file://CVE-2025-22921.patch \
-    file://CVE-2025-0518.patch \
 "
 
-SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
+SRC_URI[sha256sum] = "3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.25.1


