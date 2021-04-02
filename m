Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.22386.1617396406344893466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qhHE4f/s;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id r12so8856119ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9F87XpiBHREs42QWMBnCjFbC0zs4sfSH6IOe4ptDC4=;
        b=qhHE4f/sAEmPrdveV2dSX6+wpezFDGT9tU3o5bwaJpe5EKyIVe0KZpj2nIgHw6Gv1K
         mCGdzmZeczps1WdKb14rrWVJHEbsAJKp17NRBEIF1z12NIFomryJ9Fudbno9bu5Ejf0e
         99peoPmUwcYqjsOLwtn28m0z1JBlQLJcZ6891L0RfhKkQYBe2cRYXf/4D2hhHDwfeWap
         7kYURAAAt/LICdAcEKMGk40bVHsVzv+ydpQCh26K9b/Tqu1l9VSv9XPfKa8oYzJwvrLJ
         ObllzM0uxZB7Gb21cCAquUX4XUa2rLWEgn/woAkdaiqnn5i3JBDyMSwQ+6x/URO/XhFg
         lqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9F87XpiBHREs42QWMBnCjFbC0zs4sfSH6IOe4ptDC4=;
        b=thSXampvLsmzYNaH+Uyzr8g07T+401inrKM+zMaEKOEoQYADG4T1MwGzXv7yb+VPwy
         Soc6d3Q4LnJ4DFJ3Ti0lAA+gRukoHk0YdcRHMr+KQkA9toxKDaOQN2+aw2jNL7qf7YTW
         zdWCshuEEhvyV9MEBUEbqXz3ORkbau+x/+hIWa/EsFvyL5XsyJtkTmnEAdGOQYalrihf
         y+8IBiZRtAUAlKtQ+c0O5s70geAHPwP664E1m2YrTVJMcxTIWmZF263hWRFHwhpEMMeC
         CzdgWWp3SXzTimyr/5Z275SoG76hMlx0ovKBPJX+wOVMZSIB6isfEjgfWHENF02IcNj0
         vbMg==
X-Gm-Message-State: AOAM532tYF+tjd0IpiSmnpE9CaPbQg12G+yG2dsNUnPIAblnzMYvgsKJ
	PzVlDohGGMMI6UUmJ8IWtZsok2z9zfk=
X-Google-Smtp-Source: ABdhPJwux1Y+hWC1LR2hVN4keAxeeP2exGxerI37Gr6SYOmSvaOvxS9I6eIZ8NPmUf0T8OHr35XGvg==
X-Received: by 2002:a17:906:af97:: with SMTP id mj23mr16310781ejb.419.1617396404756;
        Fri, 02 Apr 2021 13:46:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/6] mesa: update 21.0.0 -> 21.0.1
Date: Fri,  2 Apr 2021 22:46:23 +0200
Message-Id: <20210402204627.207068-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402204627.207068-1-alex.kanavin@gmail.com>
References: <20210402204627.207068-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67b0835d9f..862e4fa9b8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
+SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
-- 
2.29.2

