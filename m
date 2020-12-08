Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.10824.1607444017877805592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kTklrDeQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id l9so7657241wrt.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KWEHbw+LjRH01KTYaRtNmDtqQGnD/a9cdRZzPibr8AQ=;
        b=kTklrDeQv7cLZPtC2Ce3GInO5jd0LyFfh5db0dP5p4aHikn06gV0kf2w/Owh53qOvZ
         M/dkJ1dZS/NV+TMAZ4UsoVpU9sdBX2QCCc/PYpVCZezwJpVPlXVx55WhIkKeuKN46MfJ
         fM8q1RONcP39NH5zSCORDlOCXWKDgMKNOzg2F2Gp3IXpTJkADX8unVmfMucHR39OpsF8
         TYn4VJbCGYmJSlXv8d+MXcSuyrIfx9YYVlTz8jCy4sWx0XUUmOhtPQksyZwhjgI65x2c
         pCMY9C1m8jb5FQ9l1lCabNWddX1Il74Mr5Tiru6Ni2CV5nz/WNDTcf4rAhmzkjxDeR7u
         D/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KWEHbw+LjRH01KTYaRtNmDtqQGnD/a9cdRZzPibr8AQ=;
        b=EvvLL0dKfDLOhGCAIoiC1dP9v3MYkpoBT2NcECLlsCYTcKMT1uFGFpzMSxTY5ZXGna
         /bPvT5Eyezo+N05NhVcqrNIh+0whA+tawZNCqd+jawcScQfN3vd/QsO49lTn4WMJExOy
         I70GepUngn2EfRCPfIfgGTHgcZRNKxulAliN6kW+CVQ15MJl3Z4U9CncqOQ651CYNII3
         p2FTAuIygVJGg/U5j5B9dB7JkAy+cZSEubtwIE9z6CDj7qJCVPxPirIOUP7AdluJi+7V
         3OPvP+1vyhYkf03oyImSqUtTwIcF2J/sTiy2N8////h7MfUdPRVYfqe96Hw+1vCpoJlg
         kjnA==
X-Gm-Message-State: AOAM530Z/mAU4KiVnXpDw1UNjsAzjczRh/SaysO9tiNDDyfwhf5uEboq
	ZaA9zCtlvxCmUIILsdlz/5KdstLjyCM=
X-Google-Smtp-Source: ABdhPJwK42QmQqdAjJCT1wmP37xEvN/BKxZ9c054YfGmZYxc42ZNWyKn1oDamG5Vbbkx6OQVo3Hxlg==
X-Received: by 2002:adf:b194:: with SMTP id q20mr14269335wra.199.1607444016312;
        Tue, 08 Dec 2020 08:13:36 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:35 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 3/8] gstreamer1.0-plugins-bad: add support for x265 plugin
Date: Tue,  8 Dec 2020 16:12:52 +0000
Message-Id: <20201208161257.949716-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 9de99f60e6..7016f73c92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -83,13 +83,14 @@ PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
+PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
 #   androidmedia applemedia bs2b chromaprint d3dvideosink
 #   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
 #   mplex musepack nvdec nvenc ofa openexr openni2 opensles
 #   soundtouch spandsp teletext wasapi wildmidi winks
-#   winscreencap wpe x265
+#   winscreencap wpe
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
@@ -137,7 +138,6 @@ EXTRA_OEMESON += " \
     -Dwinks=disabled \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
-    -Dx265=disabled \
     -Dzxing=disabled \
 "
 
-- 
2.29.2

