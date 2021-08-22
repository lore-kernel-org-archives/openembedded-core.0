Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.9616.1629636691625999303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4F8QUQ9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id n5so9435303wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOXS9lXMYNOdzbSNIhdHa63d+MWZlZsG86WPVd0O8KU=;
        b=U4F8QUQ9eCe0zXykQVMN2rpIlAcNYduPNjxTWl4RNt8BLWjxNuVaQwoD5HyH9fP0Fr
         pKKOLKa44e1xbBW5C9UaCiyaVei4OOMnsz6qxqobvJGu8Huhc5+MQc+Ia2iH+4T17131
         b7Ln5C4rthLaTB4ho6bEEJea7W+V4FXecW8VhFZyYmsHSdM2OlHDj8p/F58/HjoX1Zoq
         UGGCFXCNt17Kf9MLGMsvJZq8F1U4NTzeGvCzItnkWa/v57HU99uWIqHiHzdlW8Ef6tF3
         3FP6nQXaP0UZT7z/PajuD83wGwXSHg7YHrfF7W0DxEjVqAKF4m8ItmaSVQ/jGo6vSg8Z
         8Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOXS9lXMYNOdzbSNIhdHa63d+MWZlZsG86WPVd0O8KU=;
        b=HWcOMUf6j0rr5Hwc+77pGVB26T7oVpnRWfizMyX9tIMFHlcld1GelWSPE/sCcjsbto
         +Sd1LKTKSvUKNIZg9fglA5hnTCsbawpBENY9JlEpeDOrPT2UFUM2dG08V1FT3ZErSUyP
         74t9DW7zkQWuEvKp19t/74sBRSP+Qtg0Lwa+iF62flGSEmY3TKf/CN5yxfYqeSg6Hszk
         upM8Sd226AAUdFN5ZBM1B9Uo+BOVGVJySw/4rw0X5GBt3lXOVa97869Akmdmu+MPDjQN
         Htgq6nc6AT5rIzGVP+dkl/X2eFfwEBsuW14iODMbr4R0s+c9IHIo68pXix/m+3EJVF37
         /1+Q==
X-Gm-Message-State: AOAM530Y6iJINRrzQ8yWG11eT8v3pVHvVsHJuMQX116i+GhCeqBezjNr
	NehVTcyRf/tmxsgmgL08XEjXbRTOLdbWkA==
X-Google-Smtp-Source: ABdhPJzi/icnFEJqCuf+vsyvMrLGQ9VW0fNdo3I450kkbyty5gFmqVs0xyOWqj4OtbXcx9lisoAB3g==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr8549889wru.261.1629636690296;
        Sun, 22 Aug 2021 05:51:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/55] python3-pip: upgrade 21.2.1 -> 21.2.4
Date: Sun, 22 Aug 2021 14:50:36 +0200
Message-Id: <20210822125103.310416-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_21.2.1.bb => python3-pip_21.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_21.2.1.bb => python3-pip_21.2.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.2.1.bb b/meta/recipes-devtools/python/python3-pip_21.2.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_21.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_21.2.4.bb
index f16f1e2a03..1f0f707f4b 100644
--- a/meta/recipes-devtools/python/python3-pip_21.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.2.4.bb
@@ -10,7 +10,7 @@ inherit pypi distutils3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "303a82aaa24cdc01f7ebbd1afc7d1b871a4aa0a88bb5bedef1fa86a3ee44ca0a"
+SRC_URI[sha256sum] = "0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.31.1

