Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.9848.1620227963435496191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DwPZ1TWc;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id c22so2495131edn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RnH2DDDNtuYhadhDXm+FJVdnLmUP0BWJXFQKEYxi9yY=;
        b=DwPZ1TWcdzbr03gz9l2adA5vZewZ/2QEs/JQDlL+YV/SQ5lqNZsGkdN3Y6Blz/WKZs
         eMtgLDBxzgv9tSW03N9PoD61RqYdIl2FYwRzKDaSl4cK7f01oy0dF42xL5/CxMvAcxpH
         y/hiSh7S8wuXATszUWTLBLULp32z9LC/+Vmo/RzwJrXD1N89/ZTgQq5QvRHaegS8i8iQ
         OxDpB/bRKlLr3GGDMAE4lITgVrLktGI6wPaX3ABz5EzrZxPAH7pH4jwp2XdIhRvNn8Nc
         o0XZhlnNJIVa/m0QIFdzTgxSaYinGIHGaI/mLULZOXKlE+i1yMEm5DLvmcnKihtjdp12
         j0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RnH2DDDNtuYhadhDXm+FJVdnLmUP0BWJXFQKEYxi9yY=;
        b=o4OWQ7guTRcZRalIuII+frfnPzpqQkWcc0JBLVUPrdJGAVAN0fChTxwkceubtry7oe
         Zem1aw2gPzIBuw5BS9iaAiZt63Toh0Qk5dlu2DrT0STMqgCPNeRlP+ZgY347TiW5gBD/
         EF/4gAbgA1M9mxSO7LoBKIeHBzhRGAh1JuaRmWsZThVOj38O7EEydf8qRBBn90fAHfu2
         czeWswL1dQKfgvI1i2mdy2MbFufWIdD55mMJb2l/nW89Q8Au39rQGNbiAVIUdkcHGgUa
         mKgMB4aG+pE5yQfHqBJa8RoR4ueZp+9MfLwXeHNtpYQ6G6pD3zDRUCMjv/nfttw1waHY
         qOjA==
X-Gm-Message-State: AOAM533OnTjXqtB9+2YKKb4CrEiz8PVGx7/rVvhi0XiBPlVP5OAyWHgf
	hHd8KLURJmwuWrE8aMPDh44YEQdnhY9KDw==
X-Google-Smtp-Source: ABdhPJwkzeDBT6/Bbpg6C8WQplXIji79s6eTLEnaVAcp8SwoSp6OhtmTj38xDJZpPM6F7QSGaUBfFQ==
X-Received: by 2002:aa7:c957:: with SMTP id h23mr32307671edt.301.1620227962027;
        Wed, 05 May 2021 08:19:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/61] gnu-efi: upgrade 3.0.12 -> 3.0.13
Date: Wed,  5 May 2021 17:18:21 +0200
Message-Id: <20210505151850.660512-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
index d27126603f..fa9886037c 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
@@ -19,8 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[md5sum] = "926763ff37bc9db3a9035cec41eb2f45"
-SRC_URI[sha256sum] = "0196f2e1fd3c334b66e610a608a0e59233474c7a01bec7bc53989639aa327669"
+SRC_URI[sha256sum] = "2fccf715279c46ee69c4859186af8150d07a13f4d19876e5459cd65be82d3b7d"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.31.1

