Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.5901.1626265578116897115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eUL8Z4FX;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id n4so1466650wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sRpB8shK9s+qlfDfGE4H3Dae+dYW//VnXTortgQjgUc=;
        b=eUL8Z4FXl8Fjdf8qOfZg93RdU+2bhB5iktkijRm4PHAildUvCsTlau1gPIqzRB3Sv9
         cnTMugk2+gOgDn6w10LSOHvFcFKahna+LAAf/rF54gg2UPeR5+hlBbACG2BqD0JfmKlk
         YVpKNVxRRXzhoCk5nWoYTfXDtFVKAbpb4GutL+qlLwu3vjVj9AI5y3C7ckQeYV+rrXfl
         iD5z5yGxfGIYGt3XqZFez27AyEHFT34jeYRpmm0Gdat4G8pjZHhYfc0v7gpmsliLuOrX
         M3pRusAItnp0ljPzMV0qaT2FTbE/EYqRgu9VkWKjj9OOb+s3z7Bl7moQ3WmLeb/rX87K
         apVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sRpB8shK9s+qlfDfGE4H3Dae+dYW//VnXTortgQjgUc=;
        b=uBR7A3dw/h7v8G0s8E1rzW9acRCbpB4qqQzgXM4qgFm03dfJhGU6yco8+kQ6Fglc+y
         qnCEZfcNYcomATeAOfduwsdsh+HaEuKOST0xdEVOA9WYS9PJdju5E5shNsnUvkd6AzyE
         U9yq8EDOc3Gz8fwcAK3Vm6lwEAnFmaWggRZrO0k6PVdW1vJlSSL5P61tewfRCUb69V7+
         kVPq4GfoLK/vKpYUGQ9q+CwMMz0fvngz/AVA+CifY4NITUyTRjsY1mDefPQRk7UG5ohP
         zMEAvk2OT5dp93X7HWglNA03wjMdm6g7FahIqwEgrgX/n1SXztKbhrQQxVwSGD8bGutD
         2w4g==
X-Gm-Message-State: AOAM530bL6zTq1IlBt6pTRjK9LINNBAePuPaFMRu+0Hir7+e8QPi2Pwe
	ezqz7dfckgG7uCFrIpxXxIDFoloCLYY=
X-Google-Smtp-Source: ABdhPJw7bPngqtY/G4fIvgNArw7J3E3B+mHWSwX6gRmPzonKKG2tM95I9O2WMBjC4pQWVNVWJFZIkQ==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr3375828wmq.14.1626265576798;
        Wed, 14 Jul 2021 05:26:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/21] xserver-xorg: update 1.20.11 -> 1.20.12
Date: Wed, 14 Jul 2021 14:25:51 +0200
Message-Id: <20210714122606.605142-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 2 +-
 .../{xserver-xorg_1.20.11.bb => xserver-xorg_1.20.12.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.11.bb => xserver-xorg_1.20.12.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e2fefd9db8..8b0cc27488 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -15,7 +15,7 @@ PROVIDES += "virtual/xserver"
 PE = "2"
 
 XORG_PN = "xorg-server"
-SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
index 1eb2056b8a..8f86bea878 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
+SRC_URI[sha256sum] = "336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.31.1

