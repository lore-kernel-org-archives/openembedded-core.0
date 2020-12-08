Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.10887.1607444015295847240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBKD89cB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t4so16770147wrr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/TPxwt8KtkFlSGuhHGug3Th3Faxm1KfIx6lITSU7HXQ=;
        b=lBKD89cBWyaF9hiiBWNm2vtA5IJie+6O3mpi/bcrZKKPGrKBg2VtEoG5FidAXA93mT
         ti08ajgQg42D24w9Lk5sTyz/R7MWT1iy2isEzV1mj+oPCeBz+Ne6RzaCqV6kMO6h/F9g
         95e2XSPEIKrvCZajBzPLFNkfIF0Kmonis+EMgUm68Hkx5iV/AD2SSdz0mYPVu2GqHtug
         pdwcWlcjYXhSaDEAmu9w/X9RC1+U6mP9jA+W049/+sQSCyITbyiovmIfV8SYyN1SlhkN
         O7+1InYTuXTCNCUjTMCgVCKEd1av7UG94qKc+iVxGw6n4+meocyK5ee5TF84f+Vy0hsj
         x4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/TPxwt8KtkFlSGuhHGug3Th3Faxm1KfIx6lITSU7HXQ=;
        b=WT9ytbfaEKuEA1Ju4KWkaT6plgSWn5g1IypSJMFMvFYgCU6+sHJjlvSRPKd26SReT+
         yuddGhnDymXklrD4P+zLjAJrJHkxU+2BlbzMpvw134gcUuNVebzl2QzjPITZ0a7cjsvq
         qkvMjezVjWd7nXkHpQQjDf9O36Yuy/XeiYkGDsXUq15V9EMe6bch+PsQJ3ajaYoCV+Q5
         pUPbJRFkoAGAxiy9frjVsphfzviQhs9y6bJdC8rSphnRqz2tWjVv96p73U8NBNWouuYj
         fgAq4dIKUubk6tVpbg/gcP3WMjty0uujSXnmecM9uzXo9p4dH2jWi0iVPu3XpHo96RJl
         SxIA==
X-Gm-Message-State: AOAM5308BhH8vX2xFSZ5MbbHR/EURYpfXqANvn32rmzAbaBN4eut8S8w
	y63uc7Q/lyAceiXStHON9bdUhX1a/1Q=
X-Google-Smtp-Source: ABdhPJy3W+hxCguKJiML+0aQTnXuH8H+jeAMI4V18LfaczI38Iwx8Bwt8tlY+zsUAm3q02K4Z9EPGg==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr26459719wrn.340.1607444013521;
        Tue, 08 Dec 2020 08:13:33 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:32 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 1/8] gstreamer1.0-plugins-bad: v4l2codecs fix typo
Date: Tue,  8 Dec 2020 16:12:50 +0000
Message-Id: <20201208161257.949716-1-quaresma.jose@gmail.com>
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

