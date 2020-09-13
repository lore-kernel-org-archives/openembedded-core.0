Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.47613.1600033971139894320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 14:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q0nyFrQv;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id gf14so4327259pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QHo/ybEEBIbgFkjjqJ+7BKys/Jy+Ftd7YgLRTQB9Q=;
        b=Q0nyFrQvjUefaeSfk5qB1JCHuWpkEI4OI0k1eUse7AAnkP0zpRHBOHwNP1sgITsMTv
         FhKU3ZztR1K4Fn686b2IOotrRN6q5FauCWT14BJ+ZXz9MVhuzvCgs8KRiPYCuIEn0HQr
         2rlu04YHF9QtuDgiPg0jyxMBYroHPXG6hf71j+ZQZQ2C0xr70ydF65fV49z9w4RWp05s
         kYIHWji+nk2wl54Vdtjmq4ojPl3X1SzPafYfyK28RNGd9gi7TPf4ureQ0sQlXiYxWclX
         lUXTW0GJ6NuGUQjiGOfJqIJ/SMh3gn9N4GhuYWtylRBXbB9CPngs9ETilBFnUA7/GKpz
         bfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QHo/ybEEBIbgFkjjqJ+7BKys/Jy+Ftd7YgLRTQB9Q=;
        b=de14zF6YtxXS4AgSpEGKxNy3ESCUXUSCIiYSMUA2AcKICxEK3p0aS37mvxZxOJaULI
         C/uNErk50eaOKxEqNGpWPoXVJRh6ZUuhQ6xi0A5VOSGdUkoJVIlzlpOLgvVGXmIWF6IF
         zT27R+LLlv+KJtyu/6pE9X4S765hU9mQuwyQJHsCfR6mGm0ElD3Kf+Q5FBh2khHLqvJq
         025ixBqhClPwEDkFWToHNqd7Ey/O6q6fDdxTfjeIyuTBqzHV1+rtSnTuIwFmmMTBMFsu
         v8wzZSOBvzq5Ac7k+4jMGPnaAiBQRe+D7dquItveGpeEHtI0Q2hhT6oSS8k1pnqUr/pg
         Q7GA==
X-Gm-Message-State: AOAM532ejP7Ry4F7evyeR6B0LQXaH12FmSKZkBFrYZ+gVUJkJTg/oK9s
	LncHdXJH3UffPORzNOQ3yZykzuo8+F0G6Q==
X-Google-Smtp-Source: ABdhPJzrq0iRqLoU8vQ3pJzHPaKGR78gpmcrBORA/U/p5sZUkTkVSg4rM4ji7MRZmiqe75fgM6uPVg==
X-Received: by 2002:a17:90a:e517:: with SMTP id t23mr10873031pjy.25.1600033970448;
        Sun, 13 Sep 2020 14:52:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id n7sm7997364pfq.114.2020.09.13.14.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 14:52:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] core-image-weston: Bump qemu memory to 512M
Date: Sun, 13 Sep 2020 14:52:44 -0700
Message-Id: <20200913215244.3825034-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913215244.3825034-1-raj.khem@gmail.com>
References: <20200913215244.3825034-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs openGL and launching two weston instances during weston ptest
needs > 256M ram to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-graphics/images/core-image-weston.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index f5102e1989..fa7e9ef421 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -10,3 +10,5 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
+
+QB_MEM = "-m 512"
-- 
2.28.0

