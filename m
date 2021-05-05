Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.9792.1620227961150624769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HNyXfzzD;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id w3so3462764ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0yDuv/6zmqCA4DvtMGiCc9SjcDUhtWCSk39MCjmI5E=;
        b=HNyXfzzDrlmVDRfX4p0IdbEE3/vTibYaGs10W9rk5f0MDIvJUa16BODtk7dEqnl4E/
         3PnXRsbkseT65E36Um2KQMIzkDDFVSi/Z48CME/FefZt0K90vAvsNc2KDuaXAHJodldE
         u7fyo8Cp2YFsvchMo/pcQ3b/6kHssLV9mh0loagIXO2O6RrVZCLoKJaI2uVOwrsO6e7H
         Dw0B1NPm61MB87PSHq+JPeq0a3ICBZW1MtdZIxLA2yu+ArjuMrLjBsa+9v0LAH0PQnNp
         b6CjVZQQkI1k2ze5VffZWE8NQ/YRPYqKfXQ+cNL9tM7wN3BAiyNdKJK0xwQmNcKw3Xvo
         XAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0yDuv/6zmqCA4DvtMGiCc9SjcDUhtWCSk39MCjmI5E=;
        b=G/MhV/wo0BfJ+F6YWx8KqodVyu2jYmvcfdBBi4qYizwGVAiCKCBSjHylchkmVx0rrM
         K46iyCj3DqqAorBRAwlZOSXFKWG8ijkeOWKotXFl7+HrOkMWKwEGmvRuR2b30X17hWBU
         iRjPRjCcbYXGlq4NzQ2lsk450yKQDrpwVMhTK5N8NpcMtApjK9v0p7z3s8/bHAG+CJcR
         qfeH/ggrcNt4mcGoDyohAsqSsK3jYLZquF3UQ9Td/fGB4JxXD5i0y2zDio6sS/Yizemj
         K2wsrBKCbDsMINxrHdZznLbGGPggrF78Cpx5eH2A8gOYWa1qgCFpeq+L9nvhcuGc7swx
         Ey8A==
X-Gm-Message-State: AOAM533ydHHBlIJZ1uwcG90EoRBHDnoQeZpZb2ERBF/Unl/WFMoydyAa
	RpYTaaYRn/Z8KgmQP3L06tRjYBBAMe7veg==
X-Google-Smtp-Source: ABdhPJwp1hJ8uQVRMhOCwkupGyqDUdli/7nPVFJM31vhxemeFy0bkXL6R3dwhz6Mo4uUM8AifaRQ3A==
X-Received: by 2002:a17:906:82c9:: with SMTP id a9mr29132045ejy.58.1620227959198;
        Wed, 05 May 2021 08:19:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/61] cronie: upgrade 1.5.5 -> 1.5.7
Date: Wed,  5 May 2021 17:18:18 +0200
Message-Id: <20210505151850.660512-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cronie/{cronie_1.5.5.bb => cronie_1.5.7.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.5.bb => cronie_1.5.7.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.5.bb b/meta/recipes-extended/cronie/cronie_1.5.7.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.5.5.bb
rename to meta/recipes-extended/cronie/cronie_1.5.7.bb
index 0def4a187d..d0abdd8398 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.5.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.7.bb
@@ -25,8 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
-SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
+SRC_URI[sha256sum] = "538bcfaf2e986e5ae1edf6d1472a77ea8271d6a9005aee2497a9ed6e13320eb3"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.31.1

