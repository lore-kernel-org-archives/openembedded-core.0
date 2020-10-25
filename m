Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.27365.1603635838641929793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGuYe8jZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b8so9634941wrn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCFWdMsG+JY1vzNoJkICxJ8wa7FQvz6if2WP/YtyJHw=;
        b=VGuYe8jZiAy+k9UjHozc/Ub5X2PX0n+FzTWu/NkDq0GPXu8jU/22GMStcHJiu7TZ61
         u3wgS/af5Qym3XffDWtNh+HUaKz/0+BnrsUMPdJAkiKSYQWcK/4I4E7ymW0gG79CEy9V
         ceMAg5zpb5qHpDiP/srmBePnVni8rP7K8f3FTrPePmN2kHhQiFo8ffFBY6d4jKf1ckAw
         +rhJZJTfPTBac9pmV2Xz1OWO9dRiokSPsKF92xOog7reyGhy1H3P/jllDEk+ywG8h8DY
         sDQjWQlGsMjLJPknSpCwcWaJGpss1JY3PcpqMCzpvecrNfaDREUOd+5CuYxlRh/+O1QW
         RsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCFWdMsG+JY1vzNoJkICxJ8wa7FQvz6if2WP/YtyJHw=;
        b=TE6X8xEjEaySr5fxLX5OD+1pO31HfaktN9BoPMRDcaxb7IK927T4vxOu3/iVornj+b
         GkUyyjLZoA6NqfMQNRhEkqPXmTQhY/GtbmLk/m+mepFj0L3phXctkU1fEWm0YRK0J30n
         GnnVgkEGBWB7zxpzyXbtBxCZuD/X4+wp+mutuoGrrYI+NBgRuffPW8wn/7UTJp77eEoW
         zAJ9NkP5tUIBOKdsSngs3UhJXQ+jjBdXAtHY/YAvx2CAUeUbVuzCJEr2NmLx80xDI2eD
         Epk5xYsPXlWvvjCLCYuxhu6WNlm3J0pdamWQfYlnwLpUTwZVIQ+vh7iYFr5s75VRT+zE
         hkfA==
X-Gm-Message-State: AOAM530L4Se5EvYUq3fWFJt8CS1dOvcd71hAyu7wM4skuGt+TrlG9NTF
	wiiynDL4/JcvDy6Y0c3hJwokL6VtPS7bMg==
X-Google-Smtp-Source: ABdhPJwW8RnNT87KiusPAZj5nYqOBsnkbHjzHKYoEYR7deuWQhOprcCfsKBy2zgH9b9+6shzDsbgnA==
X-Received: by 2002:adf:df91:: with SMTP id z17mr12562131wrl.379.1603635836973;
        Sun, 25 Oct 2020 07:23:56 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:56 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 03/12] gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:44 +0000
Message-Id: <20201025142353.1929717-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.29.0

