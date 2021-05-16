Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.11632.1621204382986433658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V5zn0Fry;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so1072481wmg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5M1RkOQnnmThFH2Q+olguvYRBwvZPwM7y/J9GVG9RSE=;
        b=V5zn0FryvcTuJ6PPW7sVaMJd+O6eEp+w+r6MpKIs+V7CfsdiDVN4TZbYkvc3Gc7SAN
         DbDDAwzZkHXMmqVlUjuz/k/FNcdoNqH8oZSIn9ddPWqPv/7Wlu+tkJLhjbbyzAZD/XHF
         IRGdl5X6bPCkV3ZeEyDdQtOztKCPPF45qhxQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5M1RkOQnnmThFH2Q+olguvYRBwvZPwM7y/J9GVG9RSE=;
        b=OV357HG7fpOTWfjh+gPfQmPVOITBmsfnOubb3jhPWbN4gMru3YSzpqIXi7/7l8Yy61
         AqYE+F00hNJ6Y9iBfcKqjC5py/6yC7b8KARdXcldkC9Oab3fBXUpKP2draf5htAwemKQ
         zil7jWJHgoTKUTiP2zJGGYox4ikA12Iaj+1gfOwdb8aSq1lzEeLU81Ph89WRrN+1FzPB
         E2lSFycWyqkYu12goGHlggg7PrhQPeum3J2ZmqwcEwUPwdjQRhhbZvRNHnyWf16n/F/y
         p4EBYNygb1WKZelbNOpcxMhxz+6nxvHxlU7y19vh3lSuGLp8/5Np2Vp57VsHAitXsS5m
         WJeg==
X-Gm-Message-State: AOAM530JSV5I5HIseCM7KdANZoY3YU0lKk9oxHv4guwRcaZ5tH2t3ikr
	0PY5vq+qfgVwupQTynhbzIxXR2CnMepkkg==
X-Google-Smtp-Source: ABdhPJw8QQcp6oUAbYai7CHkwCrWlivbD1bHtD1n72md5YgfKx88osODWLdpZSHm/d/kacahOLUHNg==
X-Received: by 2002:a05:600c:3596:: with SMTP id p22mr20301550wmq.34.1621204381516;
        Sun, 16 May 2021 15:33:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:33:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/27] wayland-protocols: upgrade 1.20 -> 1.21
Date: Sun, 16 May 2021 23:32:45 +0100
Message-Id: <20210516223247.2401235-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{wayland-protocols_1.20.bb => wayland-protocols_1.21.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.20.bb => wayland-protocols_1.21.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
index 3fb78f658c9..16452f86e69 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "b0836533a3f2dc6585b1dae00341157f"
-SRC_URI[sha256sum] = "9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7"
+SRC_URI[sha256sum] = "b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.30.2

