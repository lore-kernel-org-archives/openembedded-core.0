Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.9275.1605376766184131208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 09:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iSxZ0wrR;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id w24so19525131wmi.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 09:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9pgdW8P4K8qOYblzKT+UFm45QiSTWFcSNr3NegNdA90=;
        b=iSxZ0wrRL3BEAY3mR9QxKSblBHbO5bQ8S2taUo9ynsZNEbtKJke5xrpslKLlxGy95L
         hyGWQOKzcmEtm2UPKDdSM6LjEvBLt9H9rhVO/1mkOfPQB1QxEDgLIAUvWPoEk4UQMN9E
         c/NCO7zKNAay9fXmUANDwbRRWgBNfCCgjgTYE5ZJ8SpZUc3Q2SwJaDxleaHoIIVarNeW
         B8UHdUuZjZUYVfTe51kkYNVwRNXLGFLHN+hsBi034fEggimqaggDGHRHWg3/ee16FeC/
         tF0Nd12rwfouvqr71kvgbab0UK8EFEh7BfsIp2XwnNH5bKioNfc1eRPrajtZFPbKAm+o
         fkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9pgdW8P4K8qOYblzKT+UFm45QiSTWFcSNr3NegNdA90=;
        b=jG8724YeVrEpvBVj4u1804TF+WGeQaaF7TUZqxdL0ZCNTYUNqpukRqECBEW0W/gW6O
         nwEIEep0psnrTCK6TPaAiwGZlViZq5ocFEl5DFiL1ZhibaXj7jOKT84T4+ZrSWO1Am9E
         RXYROLOJwdxbt92Woo1dcrYZggQ1+V/3gonKnbVpgw5oMhktUmcXMC87v47dVMWgU1pl
         EcbBArlSArG7ETi5Fs/kdrQE8AWzFihtXfOWTVoKXqB6eOdaD4WQA+81EYyag7ltSE19
         w/gou/PIQnmA+NHbhI/4AF+ei3tbewz4EuauKzoxQjFLHTa3m9t+BBzz8LYZ8GcvwICq
         E2Jw==
X-Gm-Message-State: AOAM530GZefEllt61kszfRMBccRRWPRavY658YLOwDn18Pil3at6aSsK
	RRa4DfenYCVUhGa9JiND4vwWc1DzZuyjTg==
X-Google-Smtp-Source: ABdhPJxqQAh7GC2EgohIwSZFCqPrKXkrTFxDrWCQ/pNw35Czu2dtFDtylAEle8Q877jKUYm4I3Riqw==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr7886025wmd.135.1605376764369;
        Sat, 14 Nov 2020 09:59:24 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n23sm14083802wmk.24.2020.11.14.09.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 09:59:23 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] ffmpeg: add srt package config knob
Date: Sat, 14 Nov 2020 17:45:02 +0000
Message-Id: <20201114174502.2899787-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114174502.2899787-1-quaresma.jose@gmail.com>
References: <20201114174502.2899787-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
      Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...uild-fail-when-used-the-libsrt-1.4.1.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  2 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
new file mode 100644
index 0000000000..7635c9196a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
@@ -0,0 +1,52 @@
+From aebb72e025cbfbd4a6765354f6f565ad4ac89789 Mon Sep 17 00:00:00 2001
+From: Jun Zhao <barryjzhao@tencent.com>
+Date: Sun, 12 Jul 2020 05:48:48 +0800
+Subject: [PATCH] lavf/srt: fix build fail when used the libsrt 1.4.1
+
+lavf/srt: fix build fail when used the libsrt 1.4.1
+
+libsrt changed the:
+SRTO_SMOOTHER   -> SRTO_CONGESTION
+SRTO_STRICTENC  -> SRTO_ENFORCEDENCRYPTION
+and removed the front of deprecated options (SRTO_SMOOTHER/SRTO_STRICTENC)
+in the header, it's lead to build fail
+
+fix #8760
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+Signed-off-by: Jun Zhao <barryjzhao@tencent.com>
+---
+ libavformat/libsrt.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libavformat/libsrt.c b/libavformat/libsrt.c
+index 4de575b..4719ce0 100644
+--- a/libavformat/libsrt.c
++++ b/libavformat/libsrt.c
+@@ -313,8 +313,12 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
+         (s->pbkeylen >= 0 && libsrt_setsockopt(h, fd, SRTO_PBKEYLEN, "SRTO_PBKEYLEN", &s->pbkeylen, sizeof(s->pbkeylen)) < 0) ||
+         (s->passphrase && libsrt_setsockopt(h, fd, SRTO_PASSPHRASE, "SRTO_PASSPHRASE", s->passphrase, strlen(s->passphrase)) < 0) ||
+ #if SRT_VERSION_VALUE >= 0x010302
++#if SRT_VERSION_VALUE >= 0x010401
++        (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_ENFORCEDENCRYPTION, "SRTO_ENFORCEDENCRYPTION", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
++#else
+         /* SRTO_STRICTENC == SRTO_ENFORCEDENCRYPTION (53), but for compatibility, we used SRTO_STRICTENC */
+         (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_STRICTENC, "SRTO_STRICTENC", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
++#endif
+         (s->kmrefreshrate >= 0 && libsrt_setsockopt(h, fd, SRTO_KMREFRESHRATE, "SRTO_KMREFRESHRATE", &s->kmrefreshrate, sizeof(s->kmrefreshrate)) < 0) ||
+         (s->kmpreannounce >= 0 && libsrt_setsockopt(h, fd, SRTO_KMPREANNOUNCE, "SRTO_KMPREANNOUNCE", &s->kmpreannounce, sizeof(s->kmpreannounce)) < 0) ||
+ #endif
+@@ -333,7 +337,11 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
+         (s->lossmaxttl >= 0 && libsrt_setsockopt(h, fd, SRTO_LOSSMAXTTL, "SRTO_LOSSMAXTTL", &s->lossmaxttl, sizeof(s->lossmaxttl)) < 0) ||
+         (s->minversion >= 0 && libsrt_setsockopt(h, fd, SRTO_MINVERSION, "SRTO_MINVERSION", &s->minversion, sizeof(s->minversion)) < 0) ||
+         (s->streamid && libsrt_setsockopt(h, fd, SRTO_STREAMID, "SRTO_STREAMID", s->streamid, strlen(s->streamid)) < 0) ||
++#if SRT_VERSION_VALUE >= 0x010401
++        (s->smoother && libsrt_setsockopt(h, fd, SRTO_CONGESTION, "SRTO_CONGESTION", s->smoother, strlen(s->smoother)) < 0) ||
++#else
+         (s->smoother && libsrt_setsockopt(h, fd, SRTO_SMOOTHER, "SRTO_SMOOTHER", s->smoother, strlen(s->smoother)) < 0) ||
++#endif
+         (s->messageapi >= 0 && libsrt_setsockopt(h, fd, SRTO_MESSAGEAPI, "SRTO_MESSAGEAPI", &s->messageapi, sizeof(s->messageapi)) < 0) ||
+         (s->payload_size >= 0 && libsrt_setsockopt(h, fd, SRTO_PAYLOADSIZE, "SRTO_PAYLOADSIZE", &s->payload_size, sizeof(s->payload_size)) < 0) ||
+         ((h->flags & AVIO_FLAG_WRITE) && libsrt_setsockopt(h, fd, SRTO_SENDER, "SRTO_SENDER", &yes, sizeof(yes)) < 0)) {
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 517dac7f05..72c2fe16ec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
@@ -70,6 +71,7 @@ PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
+PACKAGECONFIG[srt] = "--enable-libsrt,--disable-libsrt,srt"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora libogg"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-- 
2.29.2

