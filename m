Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.1170.1626993918494812643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cDiR72Jt;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id o3-20020a05600c5103b029024c0f9e1a5fso2177092wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sSKO7CmIF+b191UiKGWnWffZxPeiabkB5PfOdQ1BhnI=;
        b=cDiR72JtZjtFLp7HkT+SFA1U6JAOVBJz3dqtaEsR9FPkkbE/pUZYeRTbJOmbjIs4an
         cHnJ+2nFQ5vhYjLKvoTpjCIuzsjukZh/EB0SKp8G2IlXh8RJM1oMxMVyqsVdnssMmOuw
         NT3Xe8CLb36btrispgg6BmKWrrZ66FSm83CyXilYBLd1aT7pRFUnuToQQW0pg62SKf3Y
         BRQBxsp0ai58eSqwHshxDM40/vadEj4bOnldsQe2/KNN4v9gabehXSfqjGbCk4lirJMY
         zzLbKN+CMJs5woxnUi6O/ZfFFWadUhj5SUl2+9Z9ZCkf61YnfK7FzBpN6Ns11bTzZtPH
         ixcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSKO7CmIF+b191UiKGWnWffZxPeiabkB5PfOdQ1BhnI=;
        b=UzLAsGHRf+vzl2EG4eR0VvDMLy4k6bePdwkJG7VgaXj42Jek5FbeVUFV3Z3SIHhKSn
         7jvL9vo5wTE0SAvx7dItZ+z9mgihq42Y/hcXwEGcNQgjxlyFrax7fFABd6hrJxyiBe8Y
         22C7PPz1nlBzCoYfCKE5Eub3s9APhZh6QBUmxpu6o1+lds1zqP1863xWmMWbOC9V3Wpe
         ZRYXLwOMoghaGG32OU+TUFM/tqUT8wU1Btim8nG090lmJyw7TwF7NrYca1oShfckp1tc
         AFIIAJsFXAYhcmIXcXGuIPBh3UMrtNTRlkaA+lXZrLvFQ2NDx/it0pbXvPiBY4t4tKei
         yOsg==
X-Gm-Message-State: AOAM5305T6Rx4chyV/eA4MdKfqhNbzbf1hCAUHQrMNpo9UkKDLLBDYQe
	dcfEsQhlW69GHAiWhKTOo9xmU/7JxayVpQ==
X-Google-Smtp-Source: ABdhPJy1HzIweeixs04lcJinzEFX15tXoxy5/PGANojXVAIQdFD79gP3g4xJTS7DHP3dJlLA7DKuzg==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr11411544wmq.14.1626993916784;
        Thu, 22 Jul 2021 15:45:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/8] libuv: update 1.41.0 -> 1.42.0
Date: Fri, 23 Jul 2021 00:45:06 +0200
Message-Id: <20210722224508.51967-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libuv/{libuv_1.41.0.bb => libuv_1.42.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.41.0.bb => libuv_1.42.0.bb} (92%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
similarity index 92%
rename from meta/recipes-connectivity/libuv/libuv_1.41.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.42.0.bb
index 4987331dc8..169bd6206b 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.42.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "1dff88e5161cba5c59276d2070d2e304e4dcb242"
+SRCREV = "6ce14710da7079eb248868171f6343bc409ea3a4"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

