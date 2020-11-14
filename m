Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9476.1605376763402575506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 09:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Du0HwJfi;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id 33so13890253wrl.7
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 09:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDAyMD8L/MwvOEkKvcHhA4lmxxFElL9yXbJHTvW6dHo=;
        b=Du0HwJfiqJGES/SWqwjUHwgkUYvwx7LnEkFUF2GVcL6mt+DbYo5HNy6BEOGcBZvFy1
         sr1+ibNjWdZpwA94YxzU+8vC97g1BosGxHkGqWG8RValea+BQLa4L5Ynn/R9NrQ+nGvL
         kdcf71ldE8+yz5q+Gn/+K6DgrqEggTVRSbX7wytjeFqco6EJSGHKHRedocjYcFhjNEe/
         KNSBluROd+4NwyMcwba4OizWl/cSO4PiTChf/R6vs9EM50mI0navC/U24pekq0aFuoya
         tuTSnA2Ww9LUeJ21SlVcs9pGLVnh/xBV31mU5MWxca+zenVjRRQEB70w5T19tAWR4EK8
         CDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDAyMD8L/MwvOEkKvcHhA4lmxxFElL9yXbJHTvW6dHo=;
        b=YuzFSYM8ZZu5n8GIKVNAPyP64xijA8vlKugoyiKM6STq4yR8rw+opcmzJO77JXDaiz
         uUNs7oVu8Vxp3b2emVPeHkAN4ihRGebwePFPyU+8EOQPXJSQf1h6vtmqLjTII0b/PSpv
         LvpgAJlgSf+xz9ZCEz45+QeWdd9GyCJ4cKWqqLVQj+Ms9lS4c35tvuYxKPMhqD2w9xUp
         jXN4qLwmCLhNzobKc/RLahbxIR71j7BeUkCX69dKfLAG/3O9MIfvWadvtF62dVn8tiOh
         G+I2MzbNVjIF6yC1XjfjAxyQeCtV6KaF3FZtiyPHHDzTkW++2Fqz/ZXGJHHO4b1T+z0m
         +NlA==
X-Gm-Message-State: AOAM532putIjHr5o/0rS1gHbLD3O0aZ66AOD0ZNY/9iAOVSBfrdGteJE
	gGeQiDcgKRu3qIKE/n4xF3svVyrMMMazxg==
X-Google-Smtp-Source: ABdhPJwOLD9Q0yFqTI+8SVqKvI924z8SDdOUAnjdRT9SLneZM3z+u8b9vA/PmRHEZsN91yVctEaW9A==
X-Received: by 2002:adf:f40a:: with SMTP id g10mr11289056wro.58.1605376761686;
        Sat, 14 Nov 2020 09:59:21 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n23sm14083802wmk.24.2020.11.14.09.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 09:59:21 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] gstreamer1.0-plugins-bad: add srt package config knob
Date: Sat, 14 Nov 2020 17:45:01 +0000
Message-Id: <20201114174502.2899787-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
index 100875dfb7..ebd8c5a27d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
 PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled,usrsctp"
 PACKAGECONFIG[smoothstreaming] = "-Dsmoothstreaming=enabled,-Dsmoothstreaming=disabled,libxml2"
 PACKAGECONFIG[sndfile]         = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
+PACKAGECONFIG[srt]             = "-Dsrt=enabled,-Dsrt=disabled,srt"
 PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
@@ -86,7 +87,7 @@ PACKAGECONFIG[v4l2codecs]      = "-D-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,l
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
 #   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
 #   mplex musepack nvdec nvenc ofa openexr openni2 opensles
-#   soundtouch spandsp srt teletext wasapi wildmidi winks
+#   soundtouch spandsp teletext wasapi wildmidi winks
 #   winscreencap wpe x265
 
 EXTRA_OEMESON += " \
@@ -128,7 +129,6 @@ EXTRA_OEMESON += " \
     -Dopensles=disabled \
     -Dsoundtouch=disabled \
     -Dspandsp=disabled \
-    -Dsrt=disabled \
     -Dsvthevcenc=disabled \
     -Dteletext=disabled \
     -Dwasapi=disabled \
-- 
2.29.2

