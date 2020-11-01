Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.8586.1604191469906737381
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fs24PnL1;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l24so10505719edj.8
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K9MC6GWUCYYX1nSgWAhcsAr3PpUCzY0QT3TkkdNF900=;
        b=Fs24PnL1BS1m5R6kFsD2EIXUDl/JrTN1J1kttgCIlkLQc33YueF3hbQnotkJktIf1c
         EXQePSLXY2WOd6zRu7ZUdGo6zUOMaP38aOMDlHczl0lItj3XtZBwaDmOAfyc3JW/mst3
         c1XWC7FHf2/MQfjI/UZS2XFtj+GE/+9y9AskeQnVissCr4sQQdutv38326/OTkeBLQuj
         PxSmK25AtnrTPVbQpA5PvSn7KLMx2gL4d2veKfbI2usxgbPOxpsnugd3MFZ/GEHrnbHB
         OcZTMQT65Zf48laaw3d+gKd5xqs71b0p4CPo4kn+9+Zk8AxkYB2rqEY8L1pLe8SkROQH
         Z17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9MC6GWUCYYX1nSgWAhcsAr3PpUCzY0QT3TkkdNF900=;
        b=ONLpehQz+ZYm2dc307x9ykPmEtF0mInaOb26zGy3r7ntbkgUNKhqeEsvGRrBP3YfKP
         /IUfSPzorbQf/yCSZqBBJsm+GBWlAbj0AKHRqCjAkFcLUttUutlzKXt4/mC/GAFSyr0k
         U7s8sK7k/i2FH16p65gnZJP3X10m41zoHNlZN/qxZGuKNLFx5iyJjkbAPXLzZ4/iHRmA
         OM0wCwaF4ci3lEmnEDvydF+0hUOOAo2Lt7JGz6gndpVLDHcuSg8hRWzCWtdruT6n6L4Z
         FGOicBDQzN9PfPwRr4lfqmMrLucrla5Rja0V6yLsiihEaotndt8ILJ2tu55AZmlpo5zN
         wa8A==
X-Gm-Message-State: AOAM530oWpgvx9mHGOPnW76S4Q41xqNK9biiTtwbdyVTKCMDAVM79/2x
	AYlBWmnm7mB1jzIwRp7/RYMHAzWiYFo=
X-Google-Smtp-Source: ABdhPJzxgfKLpsM9+nYlbC/ajTx4sjO3/dFMft7BwJNim2kBb9hD+ZUZAVv8ItZIrPU85s67RdKPJw==
X-Received: by 2002:aa7:d892:: with SMTP id u18mr10108504edq.305.1604191468349;
        Sat, 31 Oct 2020 17:44:28 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i23sm2697479ejh.118.2020.10.31.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:27 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 03/12] gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:31 +0100
Message-Id: <20201101004340.4019257-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index 6563b6f738..a4f4772c1c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
             file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
             "
-SRC_URI[md5sum] = "3fdb32823535799a748c1fc14f978e2c"
-SRC_URI[sha256sum] = "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a"
+SRC_URI[md5sum] = "e3ddb1bae9fb510b49a295f212f1e6e4"
+SRC_URI[sha256sum] = "9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.27.0

