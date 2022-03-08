Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAB7C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:52:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.9747.1646754777034643744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nu5MVIIM;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m2so11463846pll.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rJRPMdw5r8OsIdmST8SlntRhKc3YAQPkF9dqhy6zJ2M=;
        b=Nu5MVIIM8sSDL7BCSrZTI/b9KUaX4fnCBVqhzg4aN3rA1TN2M5hUDFD1N6VfxJAtLy
         YTxwcCZHgB/OjP7w8Et064H4asaTcqrk6BnV+ricYCZgxsl7raNPcyFCRYkKIveNT2Zd
         wTS4XsUyX4euqBBt3ctvNvy0C2sHECf5XCELuTkc1DvRkwvzXmNCCg9G++vUz1bi52jT
         euS75MjAmsV4IXb0cM82Ym0yduk84ufnYsfWEXl7eTrDqZnQCYtaHBMEX+ZHU5ZtK5bw
         D6yTMRLOBN3HkmyRW2KwiPadM4+osFPySHTRiebTentVvosgmyBx/mD06PKi55d5fDdB
         VNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rJRPMdw5r8OsIdmST8SlntRhKc3YAQPkF9dqhy6zJ2M=;
        b=7zuSS7zT19DNsUKvqgvKjK3MDuOvRr8J3ca5BAuxic4dd7uzoH9gubmcXFFdgem2AS
         EB948hgeSWuQiS6DmyxWpaux/G8Xmj5uDHiiot7Ydl8tWeaZxIEuOZV6TLNFDAktz3+4
         Ewro/WJcQqVvf6T8UweM3mNmjYc+GDCpO9Q9NSij+KxRh+SlQvmed0NzDIzxtVuLo53R
         HLYjncR6WOplSWiqqqPvmomsBpDHrmkrgQFuEW/fWiODACaksRaCISrJiZGyI++wXGea
         3yIJcFtrpm+Z1Y4A7y2pMxDkfjSh+Jt14HXAQtys9Tl9FwmFz2B+FxYv8azKSF663e+A
         ueIw==
X-Gm-Message-State: AOAM533ucx1TmYtLZYcPxVNlvKly7VB2poJ2YnsFNezcoFMuq4ysCo/6
	SBfKqzwEWF8oD3O/KaVvFy2/+bQaJn9FYA==
X-Google-Smtp-Source: 
 ABdhPJwJ8dzPRjTutGMEJjyOwk/zyRpaUAh33xQ01IcWiXBg4xpKG3IwsxSpLU+KBhNCJu6rAgHYVA==
X-Received: by 2002:a17:902:7595:b0:151:7b0b:11c4 with SMTP id
 j21-20020a170902759500b001517b0b11c4mr18588794pll.126.1646754776227;
        Tue, 08 Mar 2022 07:52:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm6559106pgn.35.2022.03.08.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:52:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] libsdl2: Depend on virtual/egl
Date: Tue,  8 Mar 2022 07:52:49 -0800
Message-Id: <20220308155252.2454464-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308155252.2454464-1-raj.khem@gmail.com>
References: <20220308155252.2454464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 15:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162930

virtual/libgl may not be implemented by some non-mesa graphics in
embedded space, this ensures that libsdl2 can build on such stacks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index 90724ab8b79..58bc94cc86b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -67,7 +67,7 @@ PACKAGECONFIG[directfb]   = "-DSDL_DIRECTFB=ON,-DSDL_DIRECTFB=OFF,directfb,direc
 PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
 PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
 PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
-PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/libgl"
+PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/egl"
 PACKAGECONFIG[pulseaudio] = "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio"
 PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
-- 
2.35.1


