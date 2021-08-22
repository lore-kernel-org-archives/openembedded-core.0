Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.9620.1629636698171810541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CSZz5PBa;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id u15so8780597wmj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vQKcVo1RHEZk5oPC/vJ6WZlirXHmJGN7Nkfg8wK6oaI=;
        b=CSZz5PBa8qzoNhNMwer72HtJ/IOQRA/KL9jkB+5/v6BefySCBaRYdRq7HAV0v26uvF
         3DKgOl+q7I8dpRWA9djxF5Rq2+dm0v+6TM46BmSJav9wLRYSWGSmrY5Fn7pLmJq1HSAg
         U4e9WPVEswgwdD8mtD0HoHJ5ZtMPtNTTi2TDa7qarVGDjqrdGLhMj4kF8Ggms5Vvv0AL
         pO2IS5QUpoThD7QO6+aXGbT5b3dj8uANVPBSBoa8OKaRYKy890X5ijV3q5284emv7o7s
         bHhTl4l1vPBNVby4haEW6K3Dj3zN/PF5ob3mD4+nSAjJ77+KeEgLw1bf3JAWZ+b/HEbA
         LM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQKcVo1RHEZk5oPC/vJ6WZlirXHmJGN7Nkfg8wK6oaI=;
        b=hpUwFu9K32OpP+3hnGTcPg+W9ypzfOedBrDZin3v0qcPIfFn+vDlJlk9mqzzhFt1Jy
         GhYvckmTmRvyhAbqYvremGlDMpoFm6uHnwoHmmfLJuppEUrDfBRbcIcnFbaUafIjuKYt
         v/p7OSOondGOT+yUDSelxSyIvGpROE/iCS3rhqa1NCJYWPsWHGaVmzSbpxexmdRh29l7
         aQ5zkvaQixMYdhwGOLA1unuF57Ot0CjIWfgu/g2Hm525KxHL6dPwuCMgsZqQ4GgeWsQc
         1qqDm9H1HdYBNhBAOdnFM/ylHSU9Ou9DRuWTMOUekrkDYcss36gxkZS9XIlU/ldgOJkO
         2LVg==
X-Gm-Message-State: AOAM532tL+Ot7x3f27hu444/UW7DDNJv9q/+X3tTtMicSBYxVCUw0QwC
	LnaRFUwQWqb203Pk1rZng41NNAR5ARPBkw==
X-Google-Smtp-Source: ABdhPJwcC93gu8NnVZvG8gZjn5DpIt18kbp+A46AcoRNinFXmJGwqI1hoh7oHrnISmHN9tTD09opOQ==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr11823007wmj.131.1629636696844;
        Sun, 22 Aug 2021 05:51:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/55] libjpeg-turbo: upgrade 2.1.0 -> 2.1.1
Date: Sun, 22 Aug 2021 14:50:46 +0200
Message-Id: <20210822125103.310416-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../jpeg/{libjpeg-turbo_2.1.0.bb => libjpeg-turbo_2.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.0.bb => libjpeg-turbo_2.1.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb
index 9d0a338532..fbed6eeca7 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "bef89803e506f27715c5627b1e3219c95b80fc31465d4452de2a909d382e4444"
+SRC_URI[sha256sum] = "b76aaedefb71ba882cbad4e9275b30c2ae493e3195be0a099425b5c6b99bd510"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.31.1

