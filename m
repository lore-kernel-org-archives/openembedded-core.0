Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.13804.1629891508519783171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fKSoqzOe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso4091021wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UkDx/8D+tPaet6cWGt/w4+bP/MmytlbJ73AhB1l/3YY=;
        b=fKSoqzOe2x+fDBmNKyQ+A7jT9Uxw/tJDxh+PSd1k53WabR8DC/KwhOld/F0R+LAK/m
         ZDbNFZvNCYl8zFLLk3bBI9siHpoweTwrWXcZNKGEbpaKxYzn04rHctZu3bH+xQbmuBrs
         NQBznnirnyoyJESmLe7kB+carTm0mpXBRyQGCgP72r3W7I+KDlTlMJXa8ImKP/Tp6gVU
         Xn4QpK//gzUt7xD7Sh00WjLRT5lH7BFRujrte8XveRwWuMVahjGTXAD6dfTHKLt3hRqe
         GcySj2zWfj9quPwqVa8QgwRRp0T1a1w4la1bCUEGp3xqf0IM91qUQ7Bzkt3SQGhS0LU7
         SpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UkDx/8D+tPaet6cWGt/w4+bP/MmytlbJ73AhB1l/3YY=;
        b=VN7FnFHaEupfHhIDKeQ4tTtkIC2ROm8teowK0vSyztA1Lzp/005hM2ERll7fVnJKqu
         hYDl7ETv4aSqxa5KT1b1HuUMm4a3X31BSYpud7AsOztVMmaiDPol7ibNu3AiQoMjjxhQ
         seM8l/Oel8BJaUulQEUjfG62cxZ2Cf+z0VhDHSd5k9QcUlRT/CDOVCepWHquyASehyGO
         d1fXgcz7hEpUtwUgb79w1Ir/fOCwmnFCg406ni6HqAFczs0Dbf5C5Siv305v9Anz53EN
         +JmE1Ormdrh4IJbySSxO3Y/nGVZQzRQctcvHRTeDjXsDvCY60GJHoYs42FV6322eFzQY
         d9jg==
X-Gm-Message-State: AOAM530Fz3I9ejLUzUSxMxQjkqPshC2NZA/xVn7Qm2g3iCYO/n9loXY0
	MWZokkL8CefwptNvNh47rZ/TwjY7FrKwGA==
X-Google-Smtp-Source: ABdhPJzufjYhW5IQIOjPOYl9eyRBVzjxyTPxZx7ZawII0uaHriLmJh/LTIoRL8TrxHrHxeV+sucojw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr8815858wmq.101.1629891507080;
        Wed, 25 Aug 2021 04:38:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/16] ccache: upgrade 4.3 -> 4.4
Date: Wed, 25 Aug 2021 13:37:53 +0200
Message-Id: <20210825113804.779395-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/ccache/{ccache_4.3.bb => ccache_4.4.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.3.bb => ccache_4.4.bb} (73%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.3.bb b/meta/recipes-devtools/ccache/ccache_4.4.bb
similarity index 73%
rename from meta/recipes-devtools/ccache/ccache_4.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.4.bb
index 53a0bcf7ae..203be8c92d 100644
--- a/meta/recipes-devtools/ccache/ccache_4.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.4.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73963d63171ecbdf2d25274de67c68c5"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "b9789c42e52c73e99428f311a34def9ffec3462736439afd12dbacc7987c1533"
+SRC_URI[sha256sum] = "61a993d62216aff35722a8d0e8ffef9b677fc3f6accd8944ffc2a6db98fb3142"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
@@ -23,3 +23,4 @@ PATCHTOOL = "patch"
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
+PACKAGECONFIG[redis] = "-DREDIS_STORAGE_BACKEND=ON,-DREDIS_STORAGE_BACKEND=OFF,hiredis"
-- 
2.31.1

