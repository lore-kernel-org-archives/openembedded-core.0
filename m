Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.410.1611866725269719993
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dr6uxa1+;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: voa.aquino@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id w11so3461569qvz.12
        for <Openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yJwru5uNJaXSJCgrCXuIMNMFGTJPBbavNaTyenBBps=;
        b=Dr6uxa1+td6QzOcD3GfWCVvZG4c/EdUn0fAuH65JUHqyM9SC6gXpBm2Ikw4hzXTnkW
         jeFMiXG69ZTyK3cYcd1Z5lkYNOzNYywcOWHtcd+A6Tg/VV6AUtK8SlXHUtLMWpQv+wiC
         +rVDjllnEb0G7kiKq9qZleQT068aEa/XNHTY4tM6tbzub77GubzlKTBxye5fSZVZ1fN8
         tv1mPozObn4HzVfQFeOf7i2SBoyyL9Zq02XYpzFavWC2nKfoZSKlZqmfz6VB6Mzz7mus
         jrcKtNgWPYxjvakIfo+1PRMuGfIbzE8WuSbI/LEYA/EXRuK4msUCVpYIlMWAguHSiqm5
         Mi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yJwru5uNJaXSJCgrCXuIMNMFGTJPBbavNaTyenBBps=;
        b=W+0RgmenuOGB+pHe78UVormnBNYyTJ5Y95//wwlg5N4/BlIxAPCI9+4/bukdCQ3GeI
         DnHzJ2reAqAkv/0T2uAUtUONy7ntk0ZFd9xL3dY0VxldI7LeO1afs2nu+laTNwgaQN02
         xeSh7pwFETSqKzg21zPVuTfzrABWc6Mca1tWOCOcIjOFtUqdXkv7wMah3CuFycFyXtUd
         skj1g07q7NMIogZbO1lVfqzCJz0qzkau5xNw4nU5fCcGRBOVHx4Dsty78fbX3sk8J1ED
         cVB0fo+J3HQ7pipJxEvHXwqY5NjLfEO1HuaMn0sj2nOvbI7vpsN9WmOYn5t52sAKGKQJ
         VgaA==
X-Gm-Message-State: AOAM533GJOmOhdusvREd+NKxto7wsiYrS1risD1WVMlP7DSV2ucn5FMe
	Hn5xUh6op3zq7jkIZnbpaiR1yookolXLZA==
X-Google-Smtp-Source: ABdhPJxDOKKsRlMqDqvwvfsKBs3fW5WpJ+jyxv5bRu299FkkzQKuSAyJc3+Hk5SYWqWSxOMqIDdWEw==
X-Received: by 2002:a05:6214:522:: with SMTP id x2mr1064753qvw.13.1611866724147;
        Thu, 28 Jan 2021 12:45:24 -0800 (PST)
Return-Path: <voa.aquino@gmail.com>
Received: from monster.lab.ossystems (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id c81sm4102270qkb.88.2021.01.28.12.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 12:45:23 -0800 (PST)
From: voa.aquino@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Vin=C3=ADcius=20Ossanes=20Aquino?= <voa.aquino@gmail.com>
Subject: [PATCH] cmake: Upgrade 3.19.2 -> 3.19.3
Date: Thu, 28 Jan 2021 20:43:42 +0000
Message-Id: <20210128204342.586225-1-voa.aquino@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Vinícius Ossanes Aquino <voa.aquino@gmail.com>
---
 .../cmake/{cmake-native_3.19.2.bb => cmake-native_3.19.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.19.2.bb => cmake_3.19.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.19.2.bb => cmake-native_3.19.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.19.2.bb => cmake_3.19.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.19.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.19.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.19.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index db03819b66..a79b3922bc 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch \
 "
 
-SRC_URI[sha256sum] = "e3e0fd3b23b7fb13e1a856581078e0776ffa2df4e9d3164039c36d3315e0c7f0"
+SRC_URI[sha256sum] = "3faca7c131494a1e34d66e9f8972ff5369e48d419ea8ceaa3dc15b4c11367732"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.19.2.bb b/meta/recipes-devtools/cmake/cmake_3.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.19.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.19.3.bb
-- 
2.25.1

