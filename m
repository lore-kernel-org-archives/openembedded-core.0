Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7542.1624360900288815799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hDn0uZay;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s6so23081116edu.10
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHNQjeVOp+AxQd4CjeoEQl4hmc33vbkiUlKnpfpmsDQ=;
        b=hDn0uZayv+JTUkUT/5OO7J0UuNfkolkJiQQ/WuZ5bi7lhltIZ7f2Qx0B2HuCIILZZU
         mHQj1rwM038xhZp8sPsVDQh8zWJJnR21366tbbrUGPBn0GjWMow0Tvn7hsmFOlX8Wyc+
         CesfwxSZehf6FlN4WdpovxGUWgS4c0NmQSSYjIdWihlmaBJmald/y/JN2hD0h/xnULZp
         B/bLN/E9buIp61Vl7K2XHJ6XV7DIMKiqnedrSJybM12Ywy1kgllXm5wrOLGEQGH7CgXo
         qW+z/0/yF7LqOWnxua0JkhQG4lh/cZk+0DsR/uhO2RMujRH7Z4Hhn46npVywiRwnZBKd
         YgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHNQjeVOp+AxQd4CjeoEQl4hmc33vbkiUlKnpfpmsDQ=;
        b=UyX/PBK83hAesC5Hy36MtkpTzmCglwGMiezLKOTFX/M4utrp600oQdN0zfZxa9xKNR
         3PqqycIONQs907X9uzFJwftT44WC/Kt+T6S3mbrJQ54LLThbH7gzzNJNw4QskFqqTCaV
         tC2qv0u5QiYtlVyBS9c8fWzTjKeFNByXFEnmQwJPrW02Qfj2ly6VdHGlVdmfv0RVCVj7
         NLuGfA4PuIVqSsXn90criZ3+pxmaib9TqN+J9UVvATfnJyFSzKooOeplluL4BQ8RF5Et
         9YzqyE/CrUO0rdsB9PEDVWyEWWNbsgckZUPoMeYlKCFYXRc8si/cBoW2Ktpq38Vpx45L
         aTGg==
X-Gm-Message-State: AOAM531uVukHaRy8scvVtxsBfjLIlBxmhFh9HhILspv3T7l8ZmjfTF6l
	LIWKSG23BJmv3O/m/HCq9tDluPA8rvfetQ==
X-Google-Smtp-Source: ABdhPJx9PlI28RzU9jxH+oN0eIuykvbJQGYfmG8qM73tvKgLOOQd481rTfDScbvBWEcJuVSV744TAg==
X-Received: by 2002:a05:6402:1911:: with SMTP id e17mr631965edz.36.1624360898902;
        Tue, 22 Jun 2021 04:21:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/19] libxi: upgrade 1.7.10 -> 1.7.99.2
Date: Tue, 22 Jun 2021 13:21:20 +0200
Message-Id: <20210622112126.2026646-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
index 5a08e07362..8afa9aa527 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
@@ -17,7 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "62c4af0839072024b4b1c8cbe84216c7"
-SRC_URI[sha256sum] = "36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061"
+SRC_URI[sha256sum] = "2ce90ebcb7fa0c3ed671924f1268b8f4c500fff62e1284699fc413e182a7896b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

