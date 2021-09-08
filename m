Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.15611.1631124100274030218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ebFByutW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t18so4640620wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0yImUWiwmjzPZcvRE93vMZ8CyeV7E62s+MC2Ga2xck=;
        b=ebFByutW/RTLZeCYDS46GeXWNUVuujLs1i9j2s2ZBaABL/xD57uSwG5A1ZjJk/Ewio
         5cq7+nm54WOlvzsgBmfqBVfNgZYgIFPLjA9fbaj+SLJEA28UywNlJhyy5fi5KqwqAjsi
         2BNYgK+YuoubNvtAaMH+5vXh0kyYI79yNsL6A/eyPAUrY75bsxJQJjThfZODP+glk/zG
         z4o+7TsIksvj9ApX+xvjq7ynqAVYQOEXWSBuy/wZDWo5wIDn0gCuCquRXK1wxw6X4dNi
         U6recUhEMJGLn+i58hhJPXab5nFkLyTgYQPXZ4I+925TcQQ8gHY/rXfUiH8p14o6J51a
         zyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0yImUWiwmjzPZcvRE93vMZ8CyeV7E62s+MC2Ga2xck=;
        b=AOekAIc8JVA+brjgFcwVUf4Y3h9TMHAY0aGnE+GdFEFJhmwv9B27j28xNiKjR7R35L
         +At25buCX8z7fNw3+gOIHawPA48DXOXU/5RZlY464LElTdsffZCI1bkLnPNAXl3N5Vyv
         3B5txag9vj3j3z+l4X7Bx/bXm3pD9Lpx1D9P3FepPL/ALazFoyulCdvR9hG8wirLTrSx
         qge2lwzNgUSCoREx+KAel/BnV2YnQ4Gc0Xbb5+w8kvzJ2UP0n2H88X3BCCw/o0ZHDea+
         24fc4ZF6zYFNW9twRA+lyN7yOGJFiswC3AnAQOZ9l6yNr9jMV+FHI6Ji9/AmoRUsxWzW
         gGPQ==
X-Gm-Message-State: AOAM532c0yp7DWkqHYCZZLYUaHsLtrJA0Pf6ZfKevzoXCjIZdrX/utA7
	02GoMu1Vy6JMcHyFWsWzVMvM9xB2Nok=
X-Google-Smtp-Source: ABdhPJy8usBUQ9rK9fQOqtCvCwZxONmXWlvesxLjFoHdKumb7zoo6JT1+sYPyUC2QSmJMbWiv1zPEQ==
X-Received: by 2002:adf:c391:: with SMTP id p17mr5623629wrf.145.1631124098875;
        Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/26] glslang: update 11.5.0 -> 11.6.0
Date: Wed,  8 Sep 2021 20:01:14 +0200
Message-Id: <20210908180125.103473-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_11.5.0.bb => glslang_11.6.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.5.0.bb => glslang_11.6.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.5.0.bb b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.5.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.6.0.bb
index 2f076e5684..c39be55d5f 100644
--- a/meta/recipes-graphics/glslang/glslang_11.5.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "ae2a562936cc8504c9ef2757cceaff163147834f"
+SRCREV = "2fb89a0072ae7316af1c856f22663fde4928128a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.31.1

