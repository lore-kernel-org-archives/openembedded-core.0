Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.9782.1607440128795826222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UlczJ4WR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t16so1273757wra.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KWEHbw+LjRH01KTYaRtNmDtqQGnD/a9cdRZzPibr8AQ=;
        b=UlczJ4WRHe+rFcvJJtxrxLSq2IbTkFIWrhh83pbxkchKqfa2LjSZVors0RvQhYpRGb
         lPwTSIB6XPeiRAD9MZFqJxI9JSjO5FpGQpzLKLwvNwemeT4cR7reF6g9jkAdFdQWJN5q
         nXU53agYFmI3c6dUlzjIDLIThoIjzQ4hX8dal3RDU7b/rlrj/+v9ukeq/lwQdLT+0XLa
         yFI6TkjTCJ6rF+fJ4V/gImoqxLcgHWhE5RltzO7QaYWrJOkd1WcIlRnA51i83d8AUI2Y
         EcXfWH0B7brXXkFnKCADyLJ31Uue5GlggPTDduB/3+UWJl0dx2kKUkj2eZa8Gq3A5oaR
         jBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KWEHbw+LjRH01KTYaRtNmDtqQGnD/a9cdRZzPibr8AQ=;
        b=VVN5VWCbEGD9TwsZehsJ1aBkEPlUGOcTQAyUxXyl0pfueUfPRihFBxged5utSQcKAa
         P4/4PZtOM9E8Ph/yB/uMIIxkzCm8x0B7dzvr3evDIlomqpUwgl7aPvWnXYm7pG9hnikj
         H8sl/S56f3WQlQ6hxdIhGz/7PFUOouQ/gJiRvHNgEuEyItiWbOrjnnCOoteCPIAchioQ
         2ONtVuMNwyhdjsqF8w8ZwclfgJ7wOUJ4JYioS0Y6QmulcpLEUUtDrajERRg022hotIHr
         Y24QbaHhcKeB7J/3aeTR0sclUaM2s6uNWOpBCJJmziUGSr9axeOx1JT0PndOGKr+JCpR
         ra4g==
X-Gm-Message-State: AOAM533ZUfyrU3dgM/mLCR2Tnuz3iQyLDLDs+vLiojQn2gCeNpLJB/Eo
	RF2G11YUOcsKpo9voYT2nGzNFfxGIig=
X-Google-Smtp-Source: ABdhPJwi40y5nooYUJmim4afgngkA9u8xRMLw/bVj2aIH5k2MBqsvU0De3nYkMjhn+m766foYEuxCQ==
X-Received: by 2002:adf:f98b:: with SMTP id f11mr26246570wrr.235.1607440126686;
        Tue, 08 Dec 2020 07:08:46 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:45 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/8] gstreamer1.0-plugins-bad: add support for x265 plugin
Date: Tue,  8 Dec 2020 15:08:11 +0000
Message-Id: <20201208150816.744752-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
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

