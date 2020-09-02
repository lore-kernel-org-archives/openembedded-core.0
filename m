Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.952.1599081242582066034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6QbrO5i;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p9so699628ejf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lp/Zi0X4AbTVH2syjUtpDcaO3M/1XlbycOqsc4Z0SU=;
        b=f6QbrO5iK+3SSv3EbTYUpD/0uOH/BNghsnfVZBWYKlTtuWh2LPHgZdPAjHGG82LUpU
         Y5SyZnJiDttWcxRiARqcCA2TJwn0I05lEr5bbr+02yrnp3xCXD2IUGFdG2hrDb1xoVi2
         jQhxZJ4kYATgN1yhSPbLiCpdmtK5OM1mUX3eQPKrJVhbCq9OqckPHhEXhNQaYK3a3x58
         /o/rJYyl5OQtRUmCwOcZ9rIKZAmgcvBzAmNJksA/O/xipeqzIGnmO+k3PhsiFxUNjCjp
         RMH0yyWmoDY6AHNJLC9HsvqmfFg2ze9SjtlqwsjOASU7Z2j4f7h8B4tejLEWhU59OwKW
         PJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lp/Zi0X4AbTVH2syjUtpDcaO3M/1XlbycOqsc4Z0SU=;
        b=A1xMGN+w92lrcpZT1/tAP5VTQ7b3rPi42ogMmF7kAbV3LSdZHhZTSw6Gvysdbihhg+
         c1r022KeaSyAB5jURVXWkkZAMjSQ/BctHWTLzHJfqE8YaGVd7dNy6FRzDKVMCqQOrt+I
         DNTLR4wWbqWaiSdPREdSLlKXC3dDMUKZ8eYKrqQnGqMO4N7U07nPB4Fjrh1BQg9pOiwl
         aeW1EbiXLu5lC5lm/J4obCk0JLTMaUF4KGNneOevMUZqjeZl0CXVIlHS2roCGkxilNFR
         xj43qDtrNqpcmgfkZofz70t+fq2vGfm4xzUhgDy3mDsutli1vIrXNEAQh8Gw9+RBfcF0
         7U3Q==
X-Gm-Message-State: AOAM533wI1sJZx8es0IjazibpK5kkdqVJ0IOxjVYPN9PHoF815mcHjpy
	qTCTv/NIo3+ogz9CfcYutV0cF+bQOvQ=
X-Google-Smtp-Source: ABdhPJxXTKytSL6mNapc0JCdhukV1foOqrKoHJUp/TyngVtnwqpk3Z3nqDf5btaR6iGDIjww/35DAA==
X-Received: by 2002:a17:906:2a0d:: with SMTP id j13mr53339eje.474.1599081240790;
        Wed, 02 Sep 2020 14:14:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/23] enchant2: upgrade 2.2.8 -> 2.2.9
Date: Wed,  2 Sep 2020 23:13:12 +0200
Message-Id: <20200902211330.4853-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../enchant/{enchant2_2.2.8.bb => enchant2_2.2.9.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.8.bb => enchant2_2.2.9.bb} (85%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.8.bb b/meta/recipes-support/enchant/enchant2_2.2.9.bb
similarity index 85%
rename from meta/recipes-support/enchant/enchant2_2.2.8.bb
rename to meta/recipes-support/enchant/enchant2_2.2.9.bb
index 4ddbe55da5..784fd14ee1 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.8.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.9.bb
@@ -9,8 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[md5sum] = "c7b9d6a392ecb8758e499f783e8dc883"
-SRC_URI[sha256sum] = "c7b5e2853f0dd0b1aafea2f9e071941affeec3a76df8e3f6d67a718c89293555"
+SRC_URI[sha256sum] = "b29a3d2273f5edcbdbbb565e94bfd8ea3f9526886fcb6327b4b0f72f0d722f3c"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.28.0

