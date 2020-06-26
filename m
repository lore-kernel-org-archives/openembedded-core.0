Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.2887.1593155960235593659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q/o9AelT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p20so8324572ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qoippNKWg/suOhPBfamV9i61oipTrZy7w4ElQ6xC8gI=;
        b=Q/o9AelTOGPk+xd/emkX56n8G1vLGSYvei1GIUX1wF4UK87bn/Eq5C/t0JtlHlj30F
         2nT+IePRFGO+1UTvGDkHgIRzPAziIzZWHuv2obMtK24ycktAbe3Kh/dP8swFeL2Ue4UT
         dPyit/DptDL8mWxka4JpbJ0Y8NIR9ub7n7fVHnNz/2wI6u7jQguANDO9AIjEdnZRHd+e
         JIejsr+lMdUOXWcs77QRRqZeTPl/C+Imu1aY/1EjX3e1koGN7dgDr3FxCUr+HAvrVVod
         k24GCTHauJAcEzCUIM3BSJxvYAaQod2pisce32Y+IMiqdPY36zjrZqPJWrNjHuaoHvtX
         RIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoippNKWg/suOhPBfamV9i61oipTrZy7w4ElQ6xC8gI=;
        b=K9YSOgqFkGfbUfGXL0PBHfnPkZf1Ne09OTPC7E2cY/ncP3R3MYNyxqbvZ7ELHayAS8
         OjoCIWjk6em3WKI9/P3oNn0y/GMXbt3uZrZiZgb77J55bp/JPoBV50b0Grom+gmPwhym
         Cy5dwH+EFhd9IuScUT4p50KhPhXaHclrwxw5muE0clW0kzB/MO6+h1usiUZeLOTOqhtF
         9li9HORAMDvEgIOI6+io9soOUD8GTY2pqw3qDZT34O4T2vvsRd+ic41+q7mCrwQepL69
         B8/iw6uuNTYDAP3Ak7Y2S/aAgqCdV9POBcpefvNrV2H+W+9D6KBkRJNNVyF3oBpznQLX
         L3mg==
X-Gm-Message-State: AOAM5320arQTuTXQ7LfBkJPDkG/NTeg0pHybxNdamxLIMJMLxwmAEZjU
	8+wLlF8n+uNgy1RSsu/oo1NtemGMxVU=
X-Google-Smtp-Source: ABdhPJzYPjQwb2Wwg0XN7V23h2EPqN2WYrkZzNs9QZF/2rz9lvV0OVWeW+WR5oK9VvGGyQprPVcYEA==
X-Received: by 2002:a17:906:7e04:: with SMTP id e4mr1343675ejr.502.1593155958569;
        Fri, 26 Jun 2020 00:19:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/30] alsa-lib: upgrade 1.2.2 -> 1.2.3.1
Date: Fri, 26 Jun 2020 09:18:31 +0200
Message-Id: <20200626071844.29134-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-lib_1.2.2.bb => alsa-lib_1.2.3.1.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.2.bb => alsa-lib_1.2.3.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb
index 9a4082ff94..1eb56f4053 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.1.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "82cdc23a5233d5ed319d2cbc89af5ca5"
-SRC_URI[sha256sum] = "d8e853d8805574777bbe40937812ad1419c9ea7210e176f0def3e6ed255ab3ec"
+SRC_URI[sha256sum] = "1244585515fbebce7d0e53656c1fb614f99accb8413115ce3efb9a9309c4c892"
 
 inherit autotools pkgconfig
 
-- 
2.27.0

