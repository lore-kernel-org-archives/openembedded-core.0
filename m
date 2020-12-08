Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.9781.1607440125371032181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/uUT9LN;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id g185so2667151wmf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/TPxwt8KtkFlSGuhHGug3Th3Faxm1KfIx6lITSU7HXQ=;
        b=q/uUT9LNzEK4m3O4xigdn7xHRmzex/Wrk2q+YOdUsfU0bEvgMUyX3yUdDSJcWMq958
         HdSyMmdO1wOxSblTWKd619aO+jmdIs4xr40rFr8NNhpVomEbN87BKmi9T/mVyM0YdvFQ
         5/5vLMc0smDoHTAF+jYXP+1/mmWsO05PsqTCTO7efPKkXzQ8HcGvnbTOXkla4FOC86AH
         xK2mYGvL1HPO3UCrn79LRkSYvo83N8RAwCZdsst4mEQpHIke6aNs+pLKcHPye1cK8Exk
         tnY+v1Zc8XiJwwewk0zMmCLy0EONjg+aXZE0H1pAOrO7cc3eOL+FtQs1yNPOSxo4livW
         2vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/TPxwt8KtkFlSGuhHGug3Th3Faxm1KfIx6lITSU7HXQ=;
        b=eHEdhJi+2Af4fApylLYjIlXpYBKDCiKdxiAYb9A8LScrW3jP6Qhs4zLfem75fCRTtV
         GYyi2CiYGT/+8RO/oYpV4SXFW5ttU9u8zq2vW24R7FNnQ3wijx+J6qilV10qHEMJIu/7
         iXkU/2UOpEak8XpulOKzhGsBKx4kIj7gRp6uSdQ7MU6LutaeW52am8UOCp/kUJEr6MFk
         OiCWqOkalW4IB2ZVUPc2Yc+0haH2qAejfC8a5zqSxcYT27vIllhur2f6luhx5aUtLYBk
         oB97+NGDACZbR71e8DFxIydV7N2tcdSAdonzQ1JHoXeQolcKDFKRgVt7bX+fvFKIldxA
         3UBQ==
X-Gm-Message-State: AOAM532yP7GJqrBSUN2CvVqioYtoutvB9XumyC+NHCFjPxpVHb0bjxKL
	qjFTPBdM0/A6AOXAGaBsRP0zYvMWCwA=
X-Google-Smtp-Source: ABdhPJyvnmy2wiqrlX9+B7TJg6nPy71ZFevWKuDpQng4h/aPQbVN5o96MRtVAsB1jSxMR7WjOpKxSw==
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr4238046wmj.160.1607440123545;
        Tue, 08 Dec 2020 07:08:43 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:42 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/8] gstreamer1.0-plugins-bad: v4l2codecs fix typo
Date: Tue,  8 Dec 2020 15:08:09 +0000
Message-Id: <20201208150816.744752-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index f70437ccd3..f2b8a21abc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -72,6 +72,7 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[v4l2codecs]      = "-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
@@ -81,7 +82,6 @@ PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
-PACKAGECONFIG[v4l2codecs]      = "-D-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
-- 
2.29.2

