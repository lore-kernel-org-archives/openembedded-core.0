Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.980.1603478633466513229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSfcpWL4;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id q5so2996611wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S97kLqVWoOSpqM9aru+ppV5b0meoufTUucuXG2H+qJQ=;
        b=eSfcpWL4hK7jcVg4I4RpXdQMQzTAXXMIc5GMTcDUEQ8AN6bXvOQT/suqbmPWtfNrLv
         Cjs1Ehld5ytIm8cQ4KrujhC+IkAAyXpPwd5ifIjXxPb8tj+FULogqX+y9wZ7OTveUoC+
         ysoXjpZBm4kzKCrDS6RfnJbEwCvMgIOGl9XGqyhTBykSUS3vgiSTmROcrb0ObKJVk979
         jCxeYU9MXyYWp0vsSYUztYr65LqYEEt9XqhmB1RAT+YoSFx9eWKl6NgJBr1v/b6YWMPB
         I+6L7kUh7u+8RfWViIqOF/lGLldFaNAgTkH27DAlbpLiQcqoWd37e4BnYP12gfLb/akY
         Cf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S97kLqVWoOSpqM9aru+ppV5b0meoufTUucuXG2H+qJQ=;
        b=i2I6sMdmcL3hS1Ebnhn4UEyOAjzYF7UOzTC09gXretJDP+VAOqM0COXZd1YHtig2kc
         wa87pQmAkz/gy3OFkRFVa909+d9B8KujDiUhlyNfNPGpmmVdSS/v8IdnTdwpX96+yIav
         O61SB2aiPfLlyEIUivwd5WMwl+IBWb+YI2hGVXQ5ldawnsb32JBMwA6SXm4dc/YCeC/8
         BOc5p4oJ9cxZ7iFMacVOOqUH00YN4KILf/7d05pGposyVopYMl/01or3MS03d8HaxX//
         uM7n5RJb65mjCGuEW8K0blf+FMJ547edPzjAnTWRx9IEhZyDntQlrhWQWOtMmOsninK1
         LzgA==
X-Gm-Message-State: AOAM532ZNBdcE+3OVTOH/eeT2JPlr/QcoEZPaDDDlXmGosLezfehKzzP
	xMCkc8O73J9h2RRJLWk47AnE3i2ZEf7BKg==
X-Google-Smtp-Source: ABdhPJzA8UoANUiMSwy/CEGFsE/9JflpJ3gUyfynBP4FCJGQnW6yubYpTeBzCAXuvXptFDP2WENPEw==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr3656377wmj.88.1603478631880;
        Fri, 23 Oct 2020 11:43:51 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:51 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 10/21] gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
Date: Fri, 23 Oct 2020 19:41:21 +0100
Message-Id: <20201023184132.3208737-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 903ca920f2..8f9036b8ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -73,6 +73,7 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
@@ -81,6 +82,7 @@ PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
+PACKAGECONFIG[v4l2codecs]      = "-D-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
-- 
2.29.0

