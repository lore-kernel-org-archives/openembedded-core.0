Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.9621.1629636703899726785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QFSe5Old;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id j14-20020a1c230e000000b002e748b9a48bso587785wmj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JaCf+9+KKn/33bgr95oWlMuJL/NZexwOn34aFxuZj4I=;
        b=QFSe5Olde/YLH7EuodSGUjwXm3wv6PQ/uxbxIYETC4n5v5V9QRe963LmmYk0anaIDf
         kHGFFVoHLGIvC4IGZz+K4Q/gRUH8jJPz25en8lBaOX6RpL0SM+w9hJqJ+zZ2TUQ4RWRR
         pTzWwLzxVzfFEYDM3n9csb4p7Bb1Q+QvKmk11kKJX8AzGk3R2AcBpGam8P/pvVFtEqAn
         p9CDqRdls6zdLpIu/7BnSqcQjQbk3uXO0MNR0+kQrlwZvlU1+C9d9wmaqGqvnbkC3/Ef
         CyVRSTCr1FY/qQLP2dpfd3C7raOqQE0IDWXpn+Xl1A0qSysghsQtTBU9sQRzbvmekyou
         k2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JaCf+9+KKn/33bgr95oWlMuJL/NZexwOn34aFxuZj4I=;
        b=KzoxxfjdWj2QS7HlZITex3Yjs0kZDYMzSbIfMaHCYQoXxajWEfp4V51hdDY36Dglpe
         ixY7GGFYB9uQCC2F82hWuTOQpgXmyQoSND7gYFZe0XX+OfH9aKz/rbJpvRbkHgbPDC0d
         xMS+gh9mE+95QQxinZW4qT7hd6BYsDBn8EbHiV5LFg28LGyGNJjjaasVwMB2gm9nNEq5
         XWs9oSaxPjCTvnZDPL5WetqxNzBOmsYUJ7seonqhuaszomIFKBonnAJMuIdW49T98rnC
         dheKHA0wz7/spO2+Uhupk+/Dc8cacA73S5mES+1QmEM/8KzZjqG9lGUMTdKiFRm7nGI3
         0mpg==
X-Gm-Message-State: AOAM532kCwemGcq597vp9BVJWf5TL858RTgd8vCmWopVyGP+R2PNeOtC
	aktXeiY7Hsiyl5KKwzG1PBZkFve91Eny9w==
X-Google-Smtp-Source: ABdhPJxhgkOUyMYaxQB0LbaMyyw4hWkk1NTkDz021BE2jaZPoPOnKZSg6jqqCw2C4upQdEjviZR/Og==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr12353692wmq.65.1629636702512;
        Sun, 22 Aug 2021 05:51:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/55] linux-firmware: upgrade 20210511 -> 20210818
Date: Sun, 22 Aug 2021 14:50:54 +0200
Message-Id: <20210822125103.310416-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: new firmware files, copyright years, file names
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...inux-firmware_20210511.bb => linux-firmware_20210818.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210818.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
index d91a5562ac..0249332fca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
@@ -97,7 +97,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
-                    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
+                    file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=727d0d4e2d420f41d89d098f6322e779 \
+                    file://WHENCE;md5=15ad289bf2359e8ecf613f3b04f72fab \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417"
+SRC_URI[sha256sum] = "bef3d317c348d962b3a1b95cb4e19ea4f282e18112b2c669cff74f9267ce3893"
 
 inherit allarch
 
-- 
2.31.1

