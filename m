Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9596.1629636703219367016
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hd73ArTB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id q11so21809631wrr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nN77kCWWiD/u64IUf3AFyl3OF5A6j+Tz2SwnqzejApg=;
        b=hd73ArTB/VcNexozoXkaPkztmMoIkZ96mOow3VzkYsZwNs6k2L6IuzhLu8Em8dQnI4
         y1DC9P+SH6J36bdbf3/ZFwKNZfkLsatZAnUsurxGuvUjjftdblHQ0mvSCOdHZ/Zec0wy
         8e8chyHeOzX+s1S9YBELw95rthNfQ58tn8NzkV27OpOcV93s/8O0vjgeawxa8oL3yVAA
         Q7KgvxeaIfB21n1H3LDTo+sNHENZ8xpsw8hrQUas6z6/NUvDNn6kx8YPYDvL71bumYBr
         IufVPzDWNrXAVQozh27JB2icc+t8PsEkqjv2lVxa6s6bT6FqB8W6Rq4BRy9Ks3NzIBfq
         zUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nN77kCWWiD/u64IUf3AFyl3OF5A6j+Tz2SwnqzejApg=;
        b=p0S3QxJp/sM4NU/sdjiETmkEtReHRaXNK2acbeGF5BX42Cj86a8ScSOjFYx9twa6pT
         GFxlaVrXru3rnjfLiiJv7pGgZt+4bS8qqJenvF8hUZQkfB3+1F6kTI79TJ+nkqgmnfq/
         G28vpjDxAjtCvr+i+QhoqpLu2FSrJd47Vbg3JPLARq+OJnZg94mRDi1NG0CGalXdwUwS
         dxPosqKpRnqghO2vlZQfLUrIfLAyH2h2EoQyYZayNtoOMIyfkMCQeWxNcV9L5uehDx+2
         DxUnB1ZrMfAunAIzWjyl29I+UPPH2E20rYlB4xFG3o7YEPpLgn50x+L+GXgZcywu79yz
         Vfpw==
X-Gm-Message-State: AOAM531E1c7m+2azqzV9EFJHLnx5XZVKNdIkk6Ghsh2zJnbvQnWscZOb
	ia+oKW/8eDzc0Ffz65pzOJSFk0a7EJPnVQ==
X-Google-Smtp-Source: ABdhPJwcOjFUBeZtVeBWh5nAOg6tSeSdzHAoiqtE3uvRBBdwxRoJWlf0I2MC53wdZ+N4mggPcyaW1Q==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr8496828wrm.220.1629636701847;
        Sun, 22 Aug 2021 05:51:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/55] xserver-xorg: upgrade 1.20.12 -> 1.20.13
Date: Sun, 22 Aug 2021 14:50:53 +0200
Message-Id: <20210822125103.310416-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xserver-xorg_1.20.12.bb => xserver-xorg_1.20.13.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.12.bb => xserver-xorg_1.20.13.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
index 01b50b9923..01a54070c7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac"
+SRC_URI[sha256sum] = "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.31.1

