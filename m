Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.6012.1626265585187641285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H8yPHN9I;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id k32so1454596wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9J3wQf32TbWydFEDj+ULD1OBIDwgXwUcrzJCyEdlgY=;
        b=H8yPHN9I9q6G6lZn/sPsmDqxrjVUPGDOasyTGjv2FiDqcQ+KlTHvnoeEYsjlZ6JuCh
         0ygu0DP5OEi2YskVhTWeOjNFE4C800kY9+bytVfjBxfjiXo7a9wvoptTiK7iJzGozseO
         icoFmSqEnJj7wkCnuHrrFb2ffRRN5HCRjTguYXll+EuvsCdAUnm4kmdddMMrQCXH5WGD
         v53xEHZLFXgUjR/rNUqQICzH4JtxOo1HPNNTcgYFCs4o8a1UcfX5QmTSUxpFy4mGts6E
         /0A5wN/Yd8ee41ibzVVmSsBL4Z2YMGHtDdT38kYdi3T2OO7Kj6lHJhiJIIrWE3j+c9bY
         PxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9J3wQf32TbWydFEDj+ULD1OBIDwgXwUcrzJCyEdlgY=;
        b=Sezo++msihlXBhBDI+GjtgzcOXTBmhrrg4oTgPKSARiZEFo1tFWbFkIkYCfxbis5nh
         dEy3WfEmF0uMyiFCSre6/6a/DSxs5WulfNNV4JG4tKZ2IGL/3v9HLf3hXyKRawZo+ffi
         OEukn3WcaVYjeu1ZwQQugzPCirnZtuEe8l23evQABsTdqFraiqCBBqnnp6gB2HIzV6+f
         DCxfxESuJxjq96KeEvTgvi6hWYuVBj1Uqb7fHoOx65pg09xDUPffCGqvh/wHP2/cvp7p
         C+kWb/w5p7BHRycwD+Fqv/9p32Z3nXBrAr/TipeK7sjSXDisF2RrQu3qZYJJjpZp9BJG
         sXJg==
X-Gm-Message-State: AOAM531PUV0GdOaIgPdAGizrOA92ivUeCCBm8ph+itONmbAINykud7pq
	bXW5hMsBt+I4vpzpDgtmJgWCZGOcdP8=
X-Google-Smtp-Source: ABdhPJyTVMqCADu3ffcuuR3NrzYabjtWE6lPvBdXAwJqpLAb+hEHvBPTl9Jvv+2qS75bRppNY48o1A==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr3738104wmh.181.1626265583868;
        Wed, 14 Jul 2021 05:26:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/21] ruby: upgrade 3.0.1 -> 3.0.2
Date: Wed, 14 Jul 2021 14:26:02 +0200
Message-Id: <20210714122606.605142-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.0.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.2.bb
index 944cb81c1d..f88e874c7b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
+SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.31.1

