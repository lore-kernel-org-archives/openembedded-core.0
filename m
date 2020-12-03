Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web08.10116.1607002531455999229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z64zPbLq;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id j23so2051522iog.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUyDfooA6yI3DfmSi0lXk1lbQo0QRiEPqmWUJeDykgM=;
        b=Z64zPbLq75jr/U69c/4NqaDcfEz7iGAvVbrpb2pRyFxYKP03ztAO9pYUBQSqnWkuWr
         pWmJ5IMpyCSUx36wgezdJjW8G4t0IGfQXGFhV0gm3BoKamDqPHkgJZBjtr7tkR/JcHMG
         HKAKik5qIV+KgBeyRZwpcMYUGRnV1BxIULQxmZ9ANHpZ8RcKW6DSLpxO61VcxfdgDJoQ
         gk3fJNvx6nba3zufqYMx8iiDPe5HRFmVD7+1DFbG+ykPLLmTQSzL0K1W3c2t7BF0TRRr
         luSGpAvmSwicC+G0r+j4zRpT4P8IgQkcUdl4LZVPJdjneBI53VCzw+W1VG4OTULQLlUo
         diRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUyDfooA6yI3DfmSi0lXk1lbQo0QRiEPqmWUJeDykgM=;
        b=SjHJLCCsxUXvSQiIIlTAg/HrEG3INYR2u1itKNRDpy8NeqRM0CjX6DtJykxyvlD5lZ
         mpbW1P/j6y93BtS/gfy9PXyuoDCfm/tigwotf3UvSIBtIopohHhIGIg9NvBjr7RkBSn+
         sJiKENX7Sa2odmFuKKFzRMN4vhgmA/tkGxA3CXZNIXz8qLyKVmPBas9xaP4N/yFXFAkw
         ++k/Qwe6QQ13syESRq9g2YHoslm1QOBPpTnx/9269v2zuIBtbxRaq2Fxpe3Po+1oAZKH
         VE0+noR5PNmAYAMVkvfIoN+EeG7+27/oJk5BkXQ0PqzTFYLfiB07YG5t061sbGPTKoPI
         pmkg==
X-Gm-Message-State: AOAM530/ucQhh1KRlgNak6XCn1cu6mglu8QLC14BowBcVp1fo/wD3s51
	61dMxs+2OSTp2Qvmf75+19qGK7CVqoGFzA==
X-Google-Smtp-Source: ABdhPJzIhy1igM17E3bV4oIdnzV/q6Z7cOomTAhuPMz4MhxF9mKUw8SlsqlZnmp/vc4BK29jl4nOPw==
X-Received: by 2002:a02:9691:: with SMTP id w17mr3382185jai.9.1607002530353;
        Thu, 03 Dec 2020 05:35:30 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id v6sm872513ilo.61.2020.12.03.05.35.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:35:29 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa.inc: add dispmanx support
Date: Thu,  3 Dec 2020 08:35:26 -0500
Message-Id: <20201203133526.2075-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RaspberryPi it is possible to run gles2 applications on top of dispmanx
without the need for x11/wayland/etc.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a6652b0ddb..34cb3c35e2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,7 +51,7 @@ inherit meson pkgconfig python3native gettext features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
-ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan dispmanx"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)} \
-- 
2.28.0.497.g54e85e7af1

