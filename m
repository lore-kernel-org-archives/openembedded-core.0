Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.7847.1610544401790764794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JKb69bK/;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id n8so2536331ljg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 05:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LrPzuYUWndgRkKlusedtgvVuzQOnsaoTD9wkMbrgOOE=;
        b=JKb69bK/9JwjbojiSN5kXrtmVpkbtS8RmeRYsySs126FVM8LDrCh6T+A1t1rWUJxHn
         bSH9QPmm/FBOZEnJxm0ZHsoYNxtoL1sRPlJNyeCmPTAjBujsq02sshM+zfaox2c/RkPQ
         /6ACU/HEUAzJO02qyx6ZP+/GxtcPrpSz8d8Cg/5TNHrfr93140Gn1l2c/+MK4v5VCOUo
         dE/RkE3CDseDeQg4EPEN6dlzrBDoL0xqmqNaeCGtmS5KIgyY+l5GuFKt92FIzR2VwnWa
         wl5FIHexJ6EtkNFlFlRhSx/RJhcDchcFeOupKRwoEwPx+ZxE2BZUBUcZAuim6BLZ6Jch
         9/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LrPzuYUWndgRkKlusedtgvVuzQOnsaoTD9wkMbrgOOE=;
        b=nmVddmzSZ76C5Zd1vDYPDNYrHgwMIfqnXPRvQb3Ck9C+wnw7LmqfdvJilNFOxEXfli
         agCAqAhHpuihx5PtDQdxDkTFKpghRB+meiRyR+gN2tbgcd+vyNwpVrKKvUdaPc+Sa8Kb
         09zxKjc2ilyfcSZ7KjVeuVWUXRfZdQMl82kDdvpRe5eY57u3FG4mi8bVFllNFaF6Pna9
         txEvbi8DuQDCYX/qBOJnR65iG3Qjw7rR4Qi9XUrmpW+284ORy+f9L/GQJkQogXUXLSlh
         6UzMj4y6dVIPoOReRx9XlkRTgruN11jJprVtTckBrE7/jnZkkqcX++Ps/t3XhHwUHifg
         Gq/A==
X-Gm-Message-State: AOAM5329wI396WdYW6SBjzUzo2K7FG9iCo8Joc+eKAp5DjHRk1tUjG72
	0QfZLyuaAPFQTPB6qBYjzaGRHAdAG4dM6A==
X-Google-Smtp-Source: ABdhPJxi5afreg71z33rAsZ8FJ/yh+D8Yzu6Yo3pDe+NluEzSPqwuMNUnIGMeIZq3+s/cbWV5U7p0w==
X-Received: by 2002:a2e:894c:: with SMTP id b12mr934425ljk.401.1610544399142;
        Wed, 13 Jan 2021 05:26:39 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.189])
        by smtp.gmail.com with ESMTPSA id c5sm212944lfh.160.2021.01.13.05.26.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 05:26:38 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa,mesa-gl: upgrade to 20.3.2
Date: Wed, 13 Jan 2021 16:26:36 +0300
Message-Id: <20210113132636.43671-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade mesa and mesa-gl recipes to version 20.3.2.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mesa/{mesa-gl_20.3.1.bb => mesa-gl_20.3.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.3.1.bb => mesa_20.3.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.3.1.bb => mesa-gl_20.3.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.3.1.bb => mesa_20.3.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.3.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.3.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.3.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.3.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 883c244471bf..efb12e573f8a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
-SRC_URI[sha256sum] = "af751b49bb2ab0264d58c31e73d869e80333de02b2d1becc93f1b28c67aa780f"
+SRC_URI[sha256sum] = "cce001b685d23afb976b04138714906abcf7e7f996da6355e6a43e5ca486533d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.3.1.bb b/meta/recipes-graphics/mesa/mesa_20.3.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_20.3.2.bb
-- 
2.29.2

