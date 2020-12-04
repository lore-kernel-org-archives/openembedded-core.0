Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.20410.1607112479070284819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nsag9a19;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id dk8so4237653edb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8VP9YLydoSYvmj52Dni+KiM4tVBs/8c7cOMhIj7xm14=;
        b=Nsag9a196gyLP2Uv0HZ+QLxxOScd2vbpWgAmYcX7+Lz67PGEXrQYsp9I3CZ2PSkvJL
         2kgsFeyINJ9HS5q8l+oXK+GxZ+OZFRgFJSzt+UDbwxZCK1IDgokImdN7y2j9c45oWily
         gOxUN4xLULHRKo6Ne61DnjAvDhKqAh+LUQY9uVKGoxdfCx2dq+IRuPDa/mcDNiXG3a7K
         KNGmCztaZN5FMaxmxxqS9HqsNh/CJEPzXXYZPdHdUcsjSqGvYsYaoZMEnoC2l8mzkF7+
         mvJ1z6mZcpQH74nkWKYetd4T+VnwLB0rFHdTEeu+Z7a5XLC46TB+HJzkIF38mSSBHaDC
         X/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8VP9YLydoSYvmj52Dni+KiM4tVBs/8c7cOMhIj7xm14=;
        b=Pt8qPKQOW4Xg1pG6Eqmi738JAHscxXOGDVIck2/UHu+ge1VrLBR4g9eUJnqhKdDEdN
         A7QMy/m2KB/cnS3yI/9WPn1csK9BVmlvcQeWFPA64hbmCHaHROwqVbPqQbI78UsX43qQ
         mrkO4HdPSGIMvEi713FAQKkvq8aB8D8hohwNeOdSLb7eGGKcfb0+mbMBB3rj8Wsve+ZT
         RgpHp4t4RkFERwGiIoPtT27dbvrtGesR2vYpgDRaR9XOgMP5ARSwU/YwaxxIIwbNi1SU
         4KNGcDbzu922dBQKYRS35A6MFpaXjT4/7OyDU3OA8sWSTU/dMwOLcda0+bdRirh6gJjc
         CfUA==
X-Gm-Message-State: AOAM531kf0Y2gj1RwO/GXDk8W9u+0wcDBEGQ426Ucl1CGQgThXVcywLe
	lupNk7ptdyyyRAquoI6Ug4M+5kJm6Vuc5g==
X-Google-Smtp-Source: ABdhPJzbR/YH+9rpwjoC/0ra9BRhh4fUnCW6du6TkeZDg2iLK0SN9iBTV+vFJ3l1ijKseUGB662jAA==
X-Received: by 2002:a05:6402:1c96:: with SMTP id cy22mr9124427edb.339.1607112477467;
        Fri, 04 Dec 2020 12:07:57 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/23] man-pages: upgrade 5.08 -> 5.09
Date: Fri,  4 Dec 2020 21:07:27 +0100
Message-Id: <20201204200737.7072-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.08.bb => man-pages_5.09.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.08.bb => man-pages_5.09.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.08.bb b/meta/recipes-extended/man-pages/man-pages_5.09.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_5.08.bb
rename to meta/recipes-extended/man-pages/man-pages_5.09.bb
index caf9320a67..00d6eb5c2e 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.08.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.09.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "6e0b8ae23ee9467cee701f23dea908257a93e5fffa9e261b19a23efbd27e84a2"
+SRC_URI[sha256sum] = "3bd9029b94520c730fe1a1fb78ed7d8d878236da0f725ca86ee71c1969de6c4f"
 
 inherit manpages
 
-- 
2.29.2

