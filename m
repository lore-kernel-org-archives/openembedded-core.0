Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1466.1795801788567680106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CioCxk3g;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso5310210f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801787; x=1796406587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jVwfL0AnLlCyGEnBVtY0ktDMTTh+AmZ8FZRFxRR3zcs=;
        b=CioCxk3gpee7NqbzG1pYbAf3ep5BWflWJDeSv40VB8AjaDPm3PDPa2ST7g26S2EIDd
         hqxkOlxRXCy2GUUw7Z0ByMAxUIctz1kQxoVd4/qMtERhjbiq2YMvfYAWhnZAfrO4c5wj
         DsZkzGULGOljMjxaEdmJ5i7feyxEwJwFVMcHCzKDGwar5WvtHoGXTtiKKxnaYG+bCSsB
         IoepUfzyC4E+OOvUpwRXmhcEzEVDFTCd9M4l1JPzm7x4YFAnmsjwc5MZcOUw81+jLs3R
         F6EmjSyHTNFkfQtYlOzHwDSGxJ0JZRBjRvYt9AjAIi6JlKVPyRGAaHpb084kihPJSJSH
         OQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801787; x=1796406587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jVwfL0AnLlCyGEnBVtY0ktDMTTh+AmZ8FZRFxRR3zcs=;
        b=ce0OzEUvksV3QI8JuP3zTn4mTBcWoC8MYlzZWjrzQG8XBu//UHQqnl7Wxcb6+5BPC+
         Lbzl963KXyQPKnzBi77smf6nMs6XlcV8fM3chabMM9Yr6ssZt+kldR1mbSlKbH4JbZL2
         RX7yJ39FEVU5v5tbMorPdDW5bYmZ8yG4RHOedemPzYxXcF7wyXC7YPxYqEAUGwwA615p
         CIoSXlIIGyOFk5NcTpUcBHe31cc8zzay5NENB1njMhCzSNJSTLZWIMTJY6FQyfvPt1Ku
         arz03Do38ub+G8jm7zzeLFgeO1TD0LaTal1YAfN1vjSoJmC55CKxre9RCQtJ09ycN1Xy
         EUmQ==
X-Gm-Message-State: APuU4Z+IW93h/HLL9UZ9JIM+a8O7NL2MY2UpQ9SUcLB90VukZcE//wPj
	jvT4qZD84r19myCMZ3nCdNmYsNVdv4SSorMsXTlYi4VPEWMOetZoUiw+I/M5WffI9m6xvxqZT7/
	uiDB+WF4=
X-Gm-Gg: AZFdTZf8k9umv9y7lJT/OAR3xQXixXYOCFBH2W9jLEkpqRM7su+b1XXNWwWHBAGOfHa
	1/Nz6EOzsGJhtnq45IFOHUvHYQ8zi9Zh+iiGOQtxz3B3G+v/EuDUJg8vFY6bZy2SeQxKo2Pdcwy
	1CUWdyEplQtuujF3STj8f819vA0tsEoRhQkj8gBPFOdfCgVO6OQQ1JU/q5m8/HpO5jSFzBjihxZ
	Cb7aMeguXS5ZcF2afYS5rF8zp2KD1EHRNVOO7ASX5m6B4aba0WF2Ik5W11lg3NF2ivlzyl4TrkL
	lSgsgKhSdZ/tSmPda63hmBT+dnZbelJf6VaVaMP1BppUzLKTbZD9mkvecU9ZbbOkSBFVYeT4Iez
	hhBKp6LBcKPSSt/bpQWKlDgm0+tHCkESDC7A8lj64pXKmWfx4Sz5dz99dr/0+EoKJNEiQNgY8u7
	BPEAOSSjC0pXT3LshsFqcrHl/eok9F1/d4SjUTvNuVEAg3zCe/Sd/Xy+h2O01bHXnvVgtrHuQAQ
	BiLVvi2CmNrfAhsUBcH4ibzwyx9v0+7zh4EocbBkyBkNeMznScD24fWf+zdNMamukKETFLVd6Xs
	M5giwdGSTWlRx22YU59tAMg9rBhTmR3HXl+6p4rV0lhLGWW43XknApZTy6xnPpyvLJXI+Tenssc
	BEG8AkQGqLmXOFwc8bev17DWRbYle/w==
X-Received: by 2002:a05:6000:4904:b0:4a6:60b2:afed with SMTP id ffacd0b85a97d-4abb3c37a2dmr48316268f8f.11.1795801786759;
        Fri, 27 Nov 2026 09:49:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/37] ffmpeg: Fix CVE-2026-40962
Date: Fri, 27 Nov 2026 18:49:05 +0100
Message-ID: <40f53d038fce9297f7ca0153ee44ccd9c3d1b7f5.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251428
Content-Type: text/plain; charset="utf-8"

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Backports patch for CVE-2026-40962 to ffmpeg 6.1.4.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-40962.patch        | 61 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch
new file mode 100644
index 00000000000..608dc638ed3
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch
@@ -0,0 +1,61 @@
+From 5d272b8c9541fa082dfb064e7e5847de4c4300ba Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 24 Feb 2026 03:47:15 +0100
+Subject: [PATCH] avformat/mov: use 64bit in CENC subsample bounds checks
+
+Found-by: Quang Luong <oss@engineer.ink>
+Found-by: PrymEvol
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit e392fb8c9c3949d975531d2b23c645d2465a7ebc)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-40962
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/78c944bdb170d8dcece166115d92b45379b040f4]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ libavformat/mov.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libavformat/mov.c b/libavformat/mov.c
+index 7a7545c9b5..af103ad24d 100644
+--- a/libavformat/mov.c
++++ b/libavformat/mov.c
+@@ -7178,7 +7178,7 @@ static int cenc_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7233,7 +7233,7 @@ static int cbc1_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7295,7 +7295,7 @@ static int cens_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7360,7 +7360,7 @@ static int cbcs_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+-- 
+2.56.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 849835c8493..44ad063e690 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2026-40962.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
