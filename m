Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100C6D172CA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 04:08:25 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45548.1770005296906446196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 20:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmDd+mU7;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c551edc745eso1832020a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 20:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770005296; x=1770610096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBpVrn5v9oiydm+/ctI/3yi+its4yedkJPNGOVo2Iwc=;
        b=FmDd+mU7zus+j5A2lA1Ou6rg87AfQ0rG4sjrBEw4UGb6f4qXxkGVkJVl9y6qp6Mwvp
         9Owim86GYVZdj2B6vS6ScogTBTgNomc733U0ZS8o5zIGcDiPnEfOTLKIn36MGbdzCvzU
         ioP4zsdx7jXtPz6E5O+GbCCV4r2qshdH+ZHGP3qIBf58usilONfdshQmE1gEXd/udA9y
         9+lifkbQK6Poqun5k9DDF8207yTwqF5HNY2wD1krc+sLzYnTOytwZa3BFfglFkpN9uJ4
         4lD0psHYj/WjhCi0kwBidRUAfmXcPr8KcOAWbYtzfz9++cRbycjG4QIJk48zDjPDvKUm
         Z/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770005296; x=1770610096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBpVrn5v9oiydm+/ctI/3yi+its4yedkJPNGOVo2Iwc=;
        b=QiT/jaOofaDYdksy/4QQ5MSl4vM6jk5u4ja0HkjUhY0mhrsdVWAh0gwekAINNCm0bB
         gog7SIevd4LhX9/VMF/sSUN8Tws0MGXjN+ij7PMxGT85OBpBkaaCfnJF3eTod0GbtylH
         vdCpuKda4A/mz/nvD7RPqdRiaZyuszpJbY9Vv5uYR5BXJoLn2Rn9sZMx7P8q1T1oQ6Cw
         +zalJ3P/vcx2YUr5K7v26VNFqCA9aWvmd4VIT1SBapvDbjVah0f4y0/4ZIZsldQn96R0
         cAgYOPkBqkG/YhctvF/dXtaxxacnaBrhYINyTPhl7uGzFclW+bhMi42sxJa0qUDGifa3
         PSjw==
X-Gm-Message-State: AOJu0YyOZhZ7zG38TqB52k+0c/gpMlAQOeO4gcvcVSMoSxoBrRL3YQRh
	H+/zTZNjcDWt9ZVgao7bVST+6nO5Ke1kxD3vesNBox1y1o1ZW1scev/rPSEvew==
X-Gm-Gg: AZuq6aKAKoX2kfg2fV91H3ADdgSvKQMTYHb1/OBnONTsKgtlHa7x9hAYB5WV9jBiOZq
	3ngIbawZqM+I+LS4HXoiRKywvh0PuXVNjFk83z+SWJSgPlUhJyFxb53Z0HpIPJPj8YjDiR1mQeV
	arEVNmr6C8GZ2mQq0+JW0s0JGkqETj5zAnV7OmfxnnnOttxUCAr0oQdfABtC9dGIwhPZBcDhnGS
	SzppsqFirXujLrm5BiBgUn/7PiuAux3BXebzs01/yi6fP9bIuoMuB2/Y/ddf97ZjQnT2+uvTZ5r
	GIeyufux6XRHbF0PlXzi9Z38oMWZgmAy+9X+Y2b4MnMxq1o6KjNFbO+hPl6c7Cz/kCxGJZi9F5j
	0BMsRAwJTXsbJC6pMZxHqPj0WFQyp2n3wgFceEDYrKRKnQ30+/waidiSGcoeWGWXhDS5O53rRbH
	z5dkPLeZgHosaKyt1cOUJ8rhg=
X-Received: by 2002:a17:90b:1808:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3543b2f8d01mr8731010a91.5.1770005295745;
        Sun, 01 Feb 2026 20:08:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543babe4aasm4926588a91.0.2026.02.01.20.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 20:08:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/3] ffmpeg: upgrade 6.1.3 -> 6.1.4
Date: Mon,  2 Feb 2026 17:08:03 +1300
Message-ID: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 04:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230342

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of the upstream version.

Changelog:
https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/34277e12e80031c7f89494ba543684bc1dd0be8f:/Changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        |  62 -----------
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        |  36 ------
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 ------------------
 .../{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb}      |   5 +-
 4 files changed, 1 insertion(+), 207 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb} (98%)

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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
deleted file mode 100644
index af71055c02..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From bedfb6eca402037f5cbb115fa767d106b8c14f1c Mon Sep 17 00:00:00 2001
-From: Lynne <dev@lynne.ee>
-Date: Sat, 8 Feb 2025 04:35:31 +0100
-Subject: [PATCH] aacenc_tns: clamp filter direction energy measurement
-
-The issue is that:
-
-float en[2];
-...
-tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
-for (g = 0; g < tns->n_filt[w]; g++) {
-    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
-
-When using the AAC Main profile, n_filt = 3, and slant is by
-default 2 (normal long frames), g can go above 1.
-
-en is the evolution of energy in the frequency domain for every
-band at the given window. E.g. whether the energy is concentrated
-at the top of each band, or the bottom.
-
-For 2-pole filters, its straightforward.
-For 3-pole filters, we need more than 2 measurements.
-
-This commit properly implements support for 3-pole filters, by measuring
-the band energy across three areas.
-
-Do note that even xHE-AAC caps n_filt to 2, and only AAC Main allows
-n_filt == 3.
-
-Fixes https://trac.ffmpeg.org/ticket/11418
-
-CVE: CVE-2025-1594
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/bedfb6eca402037f5cbb115fa767d106b8c14f1c]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/aacenc_tns.c | 33 ++++++++++++++++++++++++---------
- 1 file changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/libavcodec/aacenc_tns.c b/libavcodec/aacenc_tns.c
-index 8dc6dfc..9ea3506 100644
---- a/libavcodec/aacenc_tns.c
-+++ b/libavcodec/aacenc_tns.c
-@@ -172,6 +172,7 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-                       sce->ics.window_sequence[0] == LONG_START_SEQUENCE ? 0 : 2;
-     const int sfb_len = sfb_end - sfb_start;
-     const int coef_len = sce->ics.swb_offset[sfb_end] - sce->ics.swb_offset[sfb_start];
-+    const int n_filt = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
- 
-     if (coef_len <= 0 || sfb_len <= 0) {
-         sce->tns.present = 0;
-@@ -179,16 +180,30 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-     }
- 
-     for (w = 0; w < sce->ics.num_windows; w++) {
--        float en[2] = {0.0f, 0.0f};
-+	float en[4] = {0.0f, 0.0f, 0.0f, 0.0f};
-         int oc_start = 0, os_start = 0;
-         int coef_start = sce->ics.swb_offset[sfb_start];
- 
--        for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
--            FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
--            if (g > sfb_start + (sfb_len/2))
--                en[1] += band->energy;
--            else
--                en[0] += band->energy;
-+	if (n_filt == 2) {
-+            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
-+                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
-+                    if (g > sfb_start + (sfb_len/2))
-+                        en[1] += band->energy; /* End */
-+                    else
-+                        en[0] += band->energy; /* Start */
-+            }
-+            en[2] = en[0];
-+        } else {
-+            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
-+                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
-+                    if (g > sfb_start + (sfb_len/2) + (sfb_len/4))
-+                        en[2] += band->energy; /* End */
-+                    else if (g > sfb_start + (sfb_len/2) - (sfb_len/4))
-+                        en[1] += band->energy; /* Middle */
-+                    else
-+                        en[0] += band->energy; /* Start */
-+            }
-+            en[3] = en[0];
-         }
- 
-         /* LPC */
-@@ -198,9 +213,9 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-         if (!order || !isfinite(gain) || gain < TNS_GAIN_THRESHOLD_LOW || gain > TNS_GAIN_THRESHOLD_HIGH)
-             continue;
- 
--        tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
-+	tns->n_filt[w] = n_filt;
-         for (g = 0; g < tns->n_filt[w]; g++) {
--            tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
-+	    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[g + 1];
-             tns->order[w][g] = g < tns->n_filt[w] ? order/tns->n_filt[w] : order - oc_start;
-             tns->length[w][g] = g < tns->n_filt[w] ? sfb_len/tns->n_filt[w] : sfb_len - os_start;
-             quantize_coefs(&coefs[oc_start], tns->coef_idx[w][g], tns->coef[w][g],
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 38c6d1f2b7..8b0b7cfd6e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -29,15 +29,12 @@ SRC_URI = " \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2024-28661.patch \
     file://CVE-2023-49528.patch \
-    file://CVE-2024-35365.patch \
-    file://CVE-2024-36618.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
-    file://CVE-2025-1594.patch \
 "
 
-SRC_URI[sha256sum] = "bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487"
+SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291

