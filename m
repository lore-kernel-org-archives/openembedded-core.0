Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.13810.1629891515291103413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K5im5x1D;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso4055237wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqrY+k/Qr14rsd71j2uGa2O5OxihEV0MP+PEYH7Ijh8=;
        b=K5im5x1DZKbFR7EjF7SwuV0FzWruHb9GWkxQjY/aU5UjFzJGg5RC6CSQ5kFFLqyThB
         0vfFo5UHYe0F7aAB63CwU0hyY5qNG9SvSrljU6UOtiUa5+EyxrU02yx1Gzwml25yPT2C
         714u5tiH7DN6AxIKFYEmeBbSuhR1tncXGo/NqryGbo7kXlqhtXhL8M4IokIWho0yGw6W
         xBTBaPDqT2qi376nEV2IlVPATpyawQtyGyDc+7ERQiBVpDU/RxO/ui4Q1yfXa8B52+bl
         LS//6OpB7F0umzKYpEPD5YgEo90gQpf7T8DppjmCwnFo28ODfwzRkAYXQRUNLjxbPxhM
         9P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqrY+k/Qr14rsd71j2uGa2O5OxihEV0MP+PEYH7Ijh8=;
        b=j3RiYOX/tBRfaoMXAZhN7jdvP69lvUmsbl6f+NNEKFfAKZzXQfmRRYxfFsLWQ2pVCC
         6v0CNQMDrC8TjnKuKARayEHQeBhd2phzGqaLrITR1UPY0n5wDFpEQ6aj2PghajLjSneo
         LqYcn0+Ilbuzkp30CDwW0favivisUSYhMjUhS+XKf60eylN8RipbRs1JIDMZdOfmvYo2
         B+LJAAHzFo3wicP0EhXFYU7yzv562qF2BNx8tgxUG6b/+DDTvykQXnqbcTVO1Ld1phxP
         jfvD2NBbmEQJkmX2QGQNXZGQEQq3vBFtFrQTPxAoHcJue77dczc05btsHgTjqbQ/NF8u
         UXgg==
X-Gm-Message-State: AOAM533QSubRP2KgjTZAK/wQaGeyqLpA+PHo2eYhINoRsCIH2m3oNdl+
	6j0Mdu89m/yrH0OpHgBEDIxC+Cz+ulYQyA==
X-Google-Smtp-Source: ABdhPJxhDaVPbqx2coo9gsVi6ZV7o7QpBW3IwWZ5DOifq7kkxq1UTp9zgFWMgjKCd0cXVk02T0++5A==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr8674376wmb.86.1629891513919;
        Wed, 25 Aug 2021 04:38:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/16] gi-docgen: upgrade 2021.6 -> 2021.7
Date: Wed, 25 Aug 2021 13:38:02 +0200
Message-Id: <20210825113804.779395-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 8f33bec8da..f319f96b0e 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2021.6"
-SRCREV = "cb76996ba9ef7a1634ab9bde30c77c3bbb47c8db"
+PV = "2021.7"
+SRCREV = "8401357079fdd2f61bff0e110d7379635b73ead8"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

