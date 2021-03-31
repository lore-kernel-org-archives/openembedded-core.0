Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.5847.1617193384057402669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bYbGUmxP;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ce10so29776944ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0+H9WlK7Sp7wyCrRKsRbViUSSIaV9LYZZcqIvWn+g0=;
        b=bYbGUmxP5H+hELLJSktNxIBNZR+WwgMLJt+xHlWOcMa5ms+1TI3WV2YnqJow9IyAGt
         wvx6dWKFXEjgYxj7HPg4GQ7AWEFS3H2I93HVe5XiMrxkqv/yd8yos78IeFXHqI3QdTwt
         t13U0J/sZ+a58WgR0jag0qNtXbfb9/KESNy25NqNHh2GQylgttghv0c19JKjUsSyZi11
         otEp8vaGro6RNsZraQMwO5QzpV8Yx19Fdtp1/trMQN5t5mbbpCf13qgr5pFh+fRu59hv
         wgnLF3lM+m7zKqSEDNl2U+IVdRwINxHDP6RMk30IW0Amx57JkN0PCNNKIfocYiPKrNfL
         BnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0+H9WlK7Sp7wyCrRKsRbViUSSIaV9LYZZcqIvWn+g0=;
        b=fDw1H1IxUWxtDsoPgyCdjT20C1vARqAq7vBeJKoZQoW2Qh0MoSP+k1/QT7AQATxM0E
         +77niBZQSZzbJCQiqSRBY43IqYaKm++e7efg4Hn4NW7xd8qMPTEGkP1ceFwFDNSw6hAl
         B8BGm19Ph8566VLwObpV9M6BiCfdvKjsLXMV1XS8dYk8zzAmCFhzrPv6/DKM237EkfNZ
         oCgblGY2UsvfphONCJzLZbMe0WFWaTwyJKH0tLlTr3Uolwh7LavC+2x15OegqdJg22pY
         as1+G0Xr3iYtatlhxb/x/Jptar0Q7Y6Fho3d9cqFuDTJ13KWWPzYIWu0YolkOuz2HdWH
         ZW5A==
X-Gm-Message-State: AOAM530RfhLEDL+3p1Q/S+tjWAgBTOC9weFVhpSlDDmhm2AArlhuMiR9
	fQkMV0XlPsRI/mj/XTU1abAytHKJmhAVsA==
X-Google-Smtp-Source: ABdhPJyKFeR9RpFKyZko5/6fHbOg44EHBZigBbeOKsjPNk4NsQfmRuMWPkLKcFVubsEbMs4GTvUu6w==
X-Received: by 2002:a17:906:39cf:: with SMTP id i15mr3252417eje.534.1617193382465;
        Wed, 31 Mar 2021 05:23:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id l10sm1497979edr.87.2021.03.31.05.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:23:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
Date: Wed, 31 Mar 2021 14:22:53 +0200
Message-Id: <20210331122254.121192-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e9b72ce063..a40dad2b81 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
+SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
-- 
2.29.2

