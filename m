Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.1192.1626993916240817995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YIzOHB8W;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id l11-20020a7bc34b0000b029021f84fcaf75so2448931wmj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nucUN/dfu8YOjmjzgoy3FMTNIbgQlCBuyuCWMkuWuRE=;
        b=YIzOHB8WgAW9AFCKT4yP4tZi2YhTuozMAx7mMRyE+PD8r6XVZngqpcdp2qQLJW2dvu
         aARR6ggs9x3JADjKQOHEknRXyDF//3AH71oWB5py5dSrC87pL/INl+qxZNEaW4q7aqk8
         y3NnpVwN5rnKFrxrJp0ItjaIY/MhwZtfigo+gri6NTkjvLq5EWFm0mq912h28Nl24j3I
         egjDxB+WSNCDB1WuIP0y+GdPsLZHLVFi1lqemormxZr15YNrHDDfIOuTcZktoK8Sm035
         I+DkYzbUz0cK54g6bnVZneyiv/pnOcv5RWOPp8IZ+/VPmbX/mCZo6q5OWZ0CykSUH4ZZ
         MPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nucUN/dfu8YOjmjzgoy3FMTNIbgQlCBuyuCWMkuWuRE=;
        b=gM/oxAqeypX1dRo1Foc5Xvuy+nudOFAu1I50rpqB135IvEGKuG006C0wQskDk3NENz
         7amziDgy7DzWGsy3oKGLtSPWnMpqQB9x0emHkqbCL6onVyP5N7Q/lLg6VlkvPH+9CeME
         AzhfltXAQM4RSWIFKQwet9xdbHHxGtY8N+vZV6Sm22nQCfvdLI3yooB84/SPZfPmUvvh
         cN0CjMsmTp11Trnd7b3jVQ3y1eZer3lVchNpMHp3hGTYEJk5oUqBBSyQk9JnuPLQgSYr
         lUb8rBzvjY0/N4ESAIm8FP08s6NH8leXtis/4ikSpbLCjMzk/p8bQfgN2Coy2IccZqQa
         /w2A==
X-Gm-Message-State: AOAM532DUmQWZ4Vl6/rFT7YiZTLQSH9WFH++apWKu+3RPkIOzeFtQgNT
	OCFG6A1yB/ny/P40CjQGUkYUmkql+pNmFw==
X-Google-Smtp-Source: ABdhPJyOOPNlBoX2RKoDHPB9kcdChtMsPrUYy14WJT/wM5c3YJ9vXWO8GTE1SYabR7dhzmtZcBZwSg==
X-Received: by 2002:a7b:ca59:: with SMTP id m25mr11185883wml.74.1626993914924;
        Thu, 22 Jul 2021 15:45:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/8] cmake: update 3.20.5 -> 3.21.0
Date: Fri, 23 Jul 2021 00:45:03 +0200
Message-Id: <20210722224508.51967-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.20.5.bb => cmake-native_3.21.0.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.5.bb => cmake_3.21.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.5.bb => cmake-native_3.21.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.5.bb => cmake_3.21.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.21.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index c557a55527..358f284279 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0"
+SRC_URI[sha256sum] = "4a42d56449a51f4d3809ab4d3b61fd4a96a469e56266e896ce1009b5768bd2ab"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.5.bb b/meta/recipes-devtools/cmake/cmake_3.21.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.0.bb
-- 
2.31.1

