Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.9606.1629636677369551523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nCOF8p1w;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id q10so21818014wro.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QisHeu3UlgsILdFab58JG7Q5xvg2GT1AwyWJX6aZyok=;
        b=nCOF8p1wgL027aePKPK9Z4LCcsBONoBwGmgAot18fI76biCssthLwaMa9Yz6Pjq224
         +RUQAuIi/5jpqu5DkJe2bXHOTK+LI4rcnpqQ5xYHoB7mKN/Zi8Gh0/hx+JB45VOvKTcs
         cQtxJnxc3ZgWTqAzJaxQnam4lkbQUQVM4D63YP3BkvX7NCELxtc+ySLUvj5a5X+VvBx+
         oY3E844e6a1mlgmuDlO7EKWdlKFYEeZLhI2Cj1YT18pOCbhNjuHnvhqhEgvrwe8lwTAL
         EDD0Kf1GQeG/X6TaYDQex1HPsHxB+PNEyifCx/JYq4+kEaPR/hqsJRrguCImTqIHoCQT
         5IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QisHeu3UlgsILdFab58JG7Q5xvg2GT1AwyWJX6aZyok=;
        b=r+bKrKK/aKd0p6Dr6rWDvrKo2qu9nlBQO7YuTRB/BrE7ew09V9zb1sOHX7q+lb28MB
         HJbgRqqn7uLB60rZ4FErvUjsqhbaP5IKk519kQbxZKEjjg+CC/xGX+d3Tytj6jutSng3
         g5AcmBjYJ5AiwW4bgcF0lmWa+rEF6FuTgA17ruqC1CYgLRuTEqFfankQBWsgTaEnk4+o
         4dnZ/y9myrpQ7uydrvCAZltTZ5HgKmcCPahQWunL6Lx7cv+8OFT6I65L9hUsCpaZHDVF
         JLMQnHdyczWgG03+z666+AoC4rxfNXL5N2qHRrOXsMIitwaNwbheuy62QbT1WE8WpZHm
         KATg==
X-Gm-Message-State: AOAM530ZS6N/7/OMxruaRQCSwXAHQOXUrzyVtVMzYJXZT2VD878CiJ6I
	QuBn019/yzKsVcwzftrzCfu/Wnv1PGKoYw==
X-Google-Smtp-Source: ABdhPJywxN9pvytIGNgjWF36diYY8qzBh9RwKntyW6dffj0vnN4eaGIsvs5DD/Rl0WUeIXiqJANAHw==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr8638555wrm.173.1629636676040;
        Sun, 22 Aug 2021 05:51:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/55] xeyes: upgrade 1.1.2 -> 1.2.0
Date: Sun, 22 Aug 2021 14:50:16 +0200
Message-Id: <20210822125103.310416-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxi is a new requirement.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/{xeyes_1.1.2.bb => xeyes_1.2.0.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.1.2.bb => xeyes_1.2.0.bb} (62%)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb b/meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb
similarity index 62%
rename from meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb
index 06885f8f53..73d09f058d 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.2.0.bb
@@ -8,7 +8,6 @@ PE = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 
-SRC_URI[md5sum] = "6f0543ec84283df5743eeafc173bea4a"
-SRC_URI[sha256sum] = "57bcec0d2d167af9e5d44d0dbd74c6d7c0f0591cd0608952b23c749fdd910553"
+SRC_URI[sha256sum] = "f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db"
 
-DEPENDS += "libxau libxt libxext libxmu libxrender"
+DEPENDS += "libxau libxt libxext libxmu libxrender libxi"
-- 
2.31.1

