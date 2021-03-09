Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.7295.1615289805568253057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QmZ8FvJX;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so5725867wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cWWX15FFYK6ScWWIyKTfqKYCn1iq+2LJlAShAf820yc=;
        b=QmZ8FvJXq0yg8AELZixCWMlw7/u0zvD+fxfsQgkWT3aqhDR4HTowAXYrU2VLIiW5jC
         qMWueDhUk7LoogngWImVEmCst1stpTH4cEJOSQp6n/T5un+C2Ji+WnL0F9Spf2iEr4iT
         bRtaJVMfEx6kJuC7d5FcqneafYW2W39yIlRU9mXf0BYZLDEUPVj2B2pXfYyo/wsjiSMD
         QWcpGCE8UKlaHsLC+PvVPDTR3BFcSoA2s5zKJMLIHhFGvluoePNO0uiLCwZk5jTA/r4D
         eoLnGYe3BbiDrvZ9yRaHKlDYliVv94az0iJlFEYTOHV7mfWrfPCo/DHt6P3K8u5ccdsk
         vYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cWWX15FFYK6ScWWIyKTfqKYCn1iq+2LJlAShAf820yc=;
        b=mRhbAnNGvUOom3kDOQ7niKNtR4GFkyWwrwiANZ5mYOSXrJ10mjG+1WCFdPDXnS2S/u
         NOs5AZ4N4UnoyVvbXJwydF5u1yg94O5H9wcODGsISir3NvE9E3htiMszkzqJ/Of/bz+3
         QWtvx+UVLLtSfcD5AW9scv+zmqk4viuVFRrFcpbiinb4cDVgu+MnoEh0sxWrsA/4kSIZ
         +8AG1B5QzU9sqMZNR1o3LGqNhUowTxaPGZzOzkWtPA1bVNWxzyokUHaxgLO38lK8y9OR
         SjgD8gjmxRnz48r96HTNvw+yO6yjIm4qqcJYwq3UPtgFaPufj4cHA4DN6W8r5qbJ9Nul
         x/Hw==
X-Gm-Message-State: AOAM5334hZPW3FUVA3dct03/1MNwJ3V9cZLD8KW76omZ/7T4tzBCU8KR
	7o1MF2XuGhEAkBoOzPBhdk5KwKKpjECakA==
X-Google-Smtp-Source: ABdhPJxoWBuz2RUFIhikrvOwe93qTazu8pzVyrHgistlEgGWHFVBHlspjWlfbgMPbOAQe9cJMT3F6Q==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr3576551wmf.165.1615289803978;
        Tue, 09 Mar 2021 03:36:43 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.166])
        by smtp.gmail.com with ESMTPSA id x11sm3804289wme.9.2021.03.09.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:36:43 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 5/5] meta/recipes-graphics: Add HOMEPAGE / DESCRIPTION
Date: Tue,  9 Mar 2021 12:35:51 +0100
Message-Id: <20210309113551.13691-5-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309113551.13691-1-dorindabassey@gmail.com>
References: <20210309113551.13691-1-dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 50c79b3bf0..5226e84266 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -1,4 +1,5 @@
 SUMMARY = "The Bitstream Vera fonts - TTF Edition"
+HOMEPAGE = "https://www.gnome.org/fonts/"
 DESCRIPTION = "The Bitstream Vera fonts include four monospace and sans \
 faces (normal, oblique, bold, bold oblique) and two serif faces (normal \
 and bold).  In addition Fontconfig/Xft2 can artificially oblique the \
-- 
2.17.1

