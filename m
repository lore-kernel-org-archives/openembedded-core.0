Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.5532.1624957242748843490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=do44q3Sh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id n33so1699829wms.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELV+di/Z6pjKjWcDTsXHaR4qCl/RwOalebOQ0h3p3yg=;
        b=do44q3ShnCMO7DnzjxmH/lFKAyQJtfZuhyjkqh0RaY9Gfpooo/+AYzlTLg2Y3NRPiL
         iTK29B7WA/jZ+srg3MjlWb+6koUXElxwUmPs2rz8EAZVY4H2JwFKNF8EODMkZqvKWr7c
         JEE2d7tLsSpiVDGeRUofvO7EuKAUcZckaHOSkTNK5Zed2S/1b4ibjflxyu5cuG0fGhpw
         ESAPbSbyJqOr0Xb92ubD5XnjM4MiwH84pQuPpXAUZ201n/uZ7AbYlshDUG3fwEVL1v+e
         6jATrtacZYz4smG+YD80ee+XqO1GxB+KS5/80AVJJh/mbj1It1O6Hw6idFUKrZ5SeB2t
         L2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELV+di/Z6pjKjWcDTsXHaR4qCl/RwOalebOQ0h3p3yg=;
        b=sKw45epqY/tQeZbtXrnVets95zAkvtPiSEeeskIZ43vOZYZdulGagmmiB/9K15mPMb
         WCAz7dC4N3OL52byYH4TwSXwqzDzc5WbuXzbIbxtwPvrvwUo4En0g4V9J+3n7ReSxhAZ
         dTPz0VF6v3OmhqRe0BICBJDcGEohzgKCEzGrQJWORZMbNi+d7nd/lk/3l0wDu5ON9tj9
         iOEgMsjWwNh+bi64CGHhZYKDjxH1gntLHMHKDZwv4OrjC/iF2hpGSDkB5lY/d8CUYkBZ
         VpwDAX6243CHe8coneu1uAx4sKoHkQ2RnTxJ5iKYMBpwvMnzgTBf9mKAONjVc9McrUwK
         1gDQ==
X-Gm-Message-State: AOAM531w/QPf1cPvekGwX3UOsQBiGA09M0nfReI2p0flIk1qD8DNAMR9
	HSFCqQI/OKN8zHJP7bupfPntvFhNUWbXVw==
X-Google-Smtp-Source: ABdhPJxOwAA/D9esK1/PsFY9sJ+ZNf/ttR/cJ23XhFInaXUFU7uNe2WDEYGZ72OWpEioZjXQexFWqA==
X-Received: by 2002:a1c:c207:: with SMTP id s7mr9994110wmf.156.1624957241005;
        Tue, 29 Jun 2021 02:00:41 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id g10sm16380133wmh.33.2021.06.29.02.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 02:00:40 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] spirv-tools: upgrade 2021.1 -> 2021.2
Date: Tue, 29 Jun 2021 10:00:30 +0100
Message-Id: <20210629090030.125133-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-tools_2021.1.bb => spirv-tools_2021.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2021.1.bb => spirv-tools_2021.2.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.1.bb b/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2021.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_2021.2.bb
index 5795d93e53..6b5ad1ec00 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.2.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "4b3707b788c84449a55f67257ae6aab3ca3552cb"
+SRCREV = "e198c6a785d388db68eb9166b43ac5e5208fd5cc"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
            file://0001-fix-strncpy-bound-error.patch \
           "
-- 
2.32.0

