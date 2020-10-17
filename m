Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.15097.1602947736892685298
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQ5NHqVL;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id j7so2609219wrt.9
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXrDN+ozoBJz1/lQLef2Smgxj2xD8+hNBp4Y+Z/nXAs=;
        b=UQ5NHqVLrjfWltdxfheio5ncviOJGR5PW+EEruIvOZbs3+5bXarCavWZruKv8OGkvr
         ahM+Fc4jNDT2fRJrKI+6iN9i2TBlo6p2O8dO+2frbEdruRR4Q2OyLeo7q2TEBxxvYaXw
         7RVvBMyz9WtZGswuq9hGUjet823Cpxjr/GvRxlBSPm9E5t0iCj/kLeWTeWXl2hLSLMet
         3QcqhngtJGttmWwHtDiqbmj1i83aXscYKXiZN+XFCs9d+mdJkd+RQ0a6hrbCl7zMAvGA
         TWQAxvaxAWQNpK+7cCOt8+5ce5820rz0Xkexat7hhuQ6LRwiBLN8pjdTC+LPVREufeB1
         YhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXrDN+ozoBJz1/lQLef2Smgxj2xD8+hNBp4Y+Z/nXAs=;
        b=h3BNlXSDhbcB7nJf/LBDzRxrWjbPFK+wQE9yTo0fHP9lAE2FIL8M1VHdPWnn0TAIrQ
         ssB5s4+x6Kmx5uWAmh358TvPprNXhxahC3NrmbXJzI+ONy0Q9f2qtPNJxuYA5OT1n8fe
         qV7bG4l16kFVJ7ftdiR7+NUk0P6wxuISqYszvgz+tunP2hIAbmK3EMbm63EtU/1i9YYT
         woTRMCuqV3CgM6nrlEVwcibVb9yBOP0an0iOAZ47Ia/LkMZnO5qDy64Y18DmrvEJ7neP
         5w8JJACp4UIeEPUz7uUdZEsjZcGTqCNEkmMnOU+uJt2oaG7e5NzMn5ZW/E0KkZv0t1qO
         FOZQ==
X-Gm-Message-State: AOAM530GeS/lFNOMzQlpmZTeZtCEi02m2vVhvPrM74FrgEm7hSKf6OCx
	7g+PKs8vCKqIjTpQyOB+a0W57EzwnPsIoQ==
X-Google-Smtp-Source: ABdhPJzpL03s7by2CGFuEdk5MjGFWXZjmF+F5TDfVdEjY4RLBv9Qrbm4bp1NVZq1+1c5N03KujsCaA==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr10542203wro.393.1602947735195;
        Sat, 17 Oct 2020 08:15:35 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:34 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 13/13] orc: Upgrade 0.4.31 -> 0.4.32
Date: Sat, 17 Oct 2020 16:15:24 +0100
Message-Id: <20201017151524.31550-14-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.31.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
similarity index 86%
rename from meta/recipes-devtools/orc/orc_0.4.31.bb
rename to meta/recipes-devtools/orc/orc_0.4.32.bb
index cd4dc31d70..a55b43b8ef 100644
--- a/meta/recipes-devtools/orc/orc_0.4.31.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
-SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
+SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.28.0

