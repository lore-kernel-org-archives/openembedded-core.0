Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5902.1626265579351664644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h5OTTyZD;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id w13so1453725wmc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/P5qXuPzmcntPZ9+XLXVp0pN68Mb0AQWTXTERihm0xA=;
        b=h5OTTyZDcVamL72OoyxbjNwxjxGnG0XU3vce6XrO0eyNIWcIOG2uSCZNbU3/jgGBgs
         ohfGTPLdttM9NWZ3yIkkn6c1yMEilmz1OiIWAU/Gdy7azg1aYDv6qU8CD1yRtCna3DRx
         SlG1jrHTB4tDC7e+bm0e60LdPfxy3X58g/748cTWNAtX44naw8EdBgZBwwa6l7aYEkJe
         yRBgXHPf4VDQKHujU0C/xAImwPKRTbc0VGbuDuUFEvj0vfhvISGGPvQW9IouNnCyIq6D
         NWdvUd2d+BdWH1/6H4BvO1wkACCdN0jpLU7iusj5bNmjvV8dCnigO2Lesf5Hagj50Lj1
         yLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/P5qXuPzmcntPZ9+XLXVp0pN68Mb0AQWTXTERihm0xA=;
        b=e4RU0joCq8EQb5KZ6GZGOI6eJv5X5uDV6GoBsvnwFT3aWnIq7kzVQn6tQT9GO+YKVd
         3AzyTPx67RtVSCzxm6lJl4G+19X+iayFRHIfMh8vJCvSPVrHnA4VuWKQ1iPv4LKxmIAl
         tdptw07qD5Sp8CcrV72jmI4GNOgZm4rppGaoNNnXeUjpFfY6fmRe085zm7+hKXIbLf3g
         7YcBAoXZsA90cAgvhiD2VhhMNwiVpKufWAx103kdxjw3cOlS9bqUDjl9X+Ps4zIcM+Vz
         6uDeq+nCdwGj9dBoCm2UWTQO9utwiWsSf6FdSuBiv+VitUabasXrma9GqYHS/JkTwbDm
         G4CA==
X-Gm-Message-State: AOAM532xQO1VYW8GfNwz9AhlZHPhTXUeCn/sIlPUeMEKlkfDp3ufTq+2
	o23mVtdW9nuERnlEEUV+J03ni1eQmYg=
X-Google-Smtp-Source: ABdhPJzXKWr9nWSP2iM+S+UjtCVSraAM7O+EsRep3fh8wsPMPiCEJzWf0wqzvUPIN82cOjcRble0NA==
X-Received: by 2002:a05:600c:4c96:: with SMTP id g22mr3694676wmp.70.1626265577992;
        Wed, 14 Jul 2021 05:26:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/21] bluez5: upgrade 5.59 -> 5.60
Date: Wed, 14 Jul 2021 14:25:53 +0200
Message-Id: <20210714122606.605142-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bluez5/{bluez5_5.59.bb => bluez5_5.60.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.59.bb => bluez5_5.60.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.59.bb b/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.59.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.60.bb
index 7842eac76d..defa0c15cd 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "046b95b386d0bfb2a16311fe799d517ee7735045512d89902c4ed701db477316"
+SRC_URI[sha256sum] = "710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.31.1

