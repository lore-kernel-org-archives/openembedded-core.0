Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.10875.1607444016775068393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVmj28VZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id x6so12872277wro.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzMeH0jPgn5h2kwtQe5kW3nJQJ85va1qM5Din74Sw5Q=;
        b=FVmj28VZIYZa4Q9rJCD2CBnjOVunEkXDq1W5p3ASHIcRWSQKHn3FdFKT8G3+G7V543
         P2t2CTHkSVbg/Oup7pasM0971PSX/h4X994G84eQUTRhRGpaCS5T19FnmmNxf0zcm5aS
         0pUN1WvUoauZhPZCD38KPYAhumiEJe9YNo8v3Jj/G/ZHkgHeyoLOEHOuCVYUQsRmPJcL
         rsG0TietyRNH8qNTvtW15uAP5SeORtlY8+nLgSDIWzvLeA6ov0tT8qGtPRpiRmTIixy9
         uK8XtQ+Hrujidn2ukD38UARS+pFaIMpG1KArev1vqi8GOlQ3qH9rMzCxfNK7rEnReiH6
         yq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzMeH0jPgn5h2kwtQe5kW3nJQJ85va1qM5Din74Sw5Q=;
        b=FFWx5SVG0MnqbSzrz2sldY7Fr47BrByNmGZL144dN82Wa7bOBKQHT+FfcKYGLSGd9G
         Y0jl8rr4VWoq+6tOF1uSg6o7kEKltPquNyA/qx9V4tlKZwgTJ+snQEQNJvF1R+3gY48o
         vh5TgFbUjb7Fxr83096U+G5g4JzIYr5tX62KK/yUGuImOIoaaoq7RcY1zRH78cKZImDz
         Z0n7JbQUWnL7BVWDnk3XLktWBcsjph66YsX5KweGOuxzwS3N+1ovGRb9/R7/fTGpDSWb
         1NKhMRa4BwWY0m9GYEyCV4/h8z0TPlJyxvBPJ3bUeVCv35KyAPm7yzvMBEBChPhvCBVH
         NpAg==
X-Gm-Message-State: AOAM531hdENTJ2ADAyi9DP9vxzah+TZYiPqPCTUR29G7ujCJcprxULqM
	2Cd54GBJpaQUxlavAGGVzfo4TslIvlU=
X-Google-Smtp-Source: ABdhPJwfFTjhQh9RWAa+4yc1N+P+mkKfa7Jb+6y5fw+IrTIu1mADH5h15HQP3gAABaRtljjEoVxg5Q==
X-Received: by 2002:adf:ba46:: with SMTP id t6mr1103781wrg.168.1607444015070;
        Tue, 08 Dec 2020 08:13:35 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:34 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 2/8] gstreamer1.0-plugins-bad: add support for aom plugin
Date: Tue,  8 Dec 2020 16:12:51 +0000
Message-Id: <20201208161257.949716-2-quaresma.jose@gmail.com>
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
index f2b8a21abc..9de99f60e6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG ??= " \
     ttml uvch264 webp \
 "
 
+PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
 PACKAGECONFIG[bluez]           = "-Dbluez=enabled,-Dbluez=disabled,bluez5"
 PACKAGECONFIG[bz2]             = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
@@ -84,7 +85,7 @@ PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrt
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
-#   aom androidmedia applemedia bs2b chromaprint d3dvideosink
+#   androidmedia applemedia bs2b chromaprint d3dvideosink
 #   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
 #   mplex musepack nvdec nvenc ofa openexr openni2 opensles
 #   soundtouch spandsp teletext wasapi wildmidi winks
@@ -98,7 +99,6 @@ EXTRA_OEMESON += " \
     -Dipcpipeline=enabled \
     -Dnetsim=enabled \
     -Dshm=enabled \
-    -Daom=disabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Davtp=disabled \
-- 
2.29.2

