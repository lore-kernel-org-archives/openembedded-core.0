Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAADEC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 22:20:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.1725.1646691613463585433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eO6WnM6B;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id z16so15651371pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qhg7jwIs7J81I8N0HAHuBbLgMJXNMLx5J/lfSviuhHc=;
        b=eO6WnM6B4ich64FAaBmhLtN/e0mMDKFuDjIbb372dDReyrQ1zGgqOmBgEUVgYVJUyK
         BcQZou3n+5IXXvL24YGYQWMe1h9+Rl+XmfLZ/WzPTqB/OLR4B8ljOPUnt5BxJCoz88dN
         IT12nTkfa1l4V96siAtPigGFvjUqvkMCRcPU7aqTkl9220FBr7HDNWtAB/mXGOSqg4wJ
         dVPs/3fmXmD+RI/VHktJ0Vzdbk0RfgkRU/ePBL1/jgTtI66smA/D7dIJhJAR1s5PXJ6C
         e/7+YLUmG9tfEc7wBPbaJRhG6bU5F2SygkO02+ZnsHctVNLWGHponWMBGKhO8G/RsnwN
         0bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qhg7jwIs7J81I8N0HAHuBbLgMJXNMLx5J/lfSviuhHc=;
        b=QrzmLLE97dWQamKF//KMlfspPO6k1a5rksbpD94RGDdq4Z4oih/DHCndY5j6VugOD2
         xN46t7hEMNxdlYrHEtgusXYtDmZ1+2Vn82ZMAQqo13YOTJKoyLln07AnYABtA7NvURna
         Z3FZrBzXwOZ6PmTlUVEvsOM/vUZQRBi5+DyOV6zlXSnWt2JGwBiWRNeFFrgJPFLaAqcC
         WcOOII9/+G3nEJhQ+bRATtlC50t7q4BL9HVbxFDTnzzb+ejf+NpuGStHXfYK8ijRC5ty
         smZKVzobtPYPbEL+rOQI+ETyPaqzRmiwDEoorOYAhxgA8iqEVhwhnpSisHRwgPu5+bqm
         CHaA==
X-Gm-Message-State: AOAM532S9FHDHKRnfMKKUUxofCxcZp1UZLdu6zYiBa29sSPC8k56h72y
	IQ+SoJ/K3tRFsOECNohJ7HiFh2XXYhZGoA==
X-Google-Smtp-Source: 
 ABdhPJwDHUQPBv2ZDsTjtwLkZ8YO33tbS8jCgAPKm05brqrd2TB4u3Q1Njryad8Hd0B3aD7qekCFzA==
X-Received: by 2002:a05:6a00:1806:b0:4f6:f3e8:b3a0 with SMTP id
 y6-20020a056a00180600b004f6f3e8b3a0mr8802765pfa.43.1646691612599;
        Mon, 07 Mar 2022 14:20:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a656382000000b00370648d902csm12667530pgv.4.2022.03.07.14.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:20:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] virglrenderer: Depend on virtual/egl
Date: Mon,  7 Mar 2022 14:20:09 -0800
Message-Id: <20220307222009.3359861-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 22:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162868

depending on EGL means it does not have to worry if implementation
provides GL/GLES/OpenVG interfaces or not.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index c18018759bc..9ddf6cbe78e 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://virgil3d.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
-DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
+DEPENDS = "libdrm virtual/egl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-- 
2.35.1


