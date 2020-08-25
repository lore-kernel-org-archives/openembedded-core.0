Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.909.1598378887030519027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lHvyPh/4;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a21so1803076ejp.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrJURVwO4K7jumnV5eHngzi8BsED7dmrUaL7yhEu2vE=;
        b=lHvyPh/4ALctYNnzmQi5MaPhJ3dObtY1SLomkM6uVERdrFanrKLgL5kMmvmaAk6mOM
         O6MoSNnDVLJAeqOfYyyUlFP6kM1BUvP9/F1Iq3l8EJjva8s6/UimclaFJDvgZ1QmBmhz
         xiYi6GLUAWsPrqKJyguzXthtN9hMPH1dScI85k4UHfOkhAThdb1hu4rwNnw/VQSpg3Xy
         SVuOx3zI6MTXd68bJne/PIVRpKbu4iFkidqdbHehlS6jeRiDWeYQMAvQaXZtefjX2u/+
         Wm4be8wfMIuNojDKUWAWFXB6Zu7DRVZAcFv77z2PQto+aq2rOoTfW+ONPBFgOxVG7ZYl
         x2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrJURVwO4K7jumnV5eHngzi8BsED7dmrUaL7yhEu2vE=;
        b=l/VhhLmSNS2FtvP+KO6+PHQwn4rFPZim84KcwuYjfppXrmO/a803KrA5j/kv2YijMs
         B5aZndR8qGgBsKLiNiJ7Ytbwh6b3kTKFjlrRKO5zsbpbrplTDvDGYjq86usO17Ua9DiO
         wvHOJaNmEPjMxdKT16Xbktn5TKuTg63fBG+TY+2nwNzYu8BzhlImsh+7Q3inwx7cfNZe
         esVTIPejzTOWmlsjerOfv8E49Fwdd7g7EQz2LTcdRi5Qkl0tQYp7ylcXAdw84NY1Oc5K
         L59baocCm6Dtv2OzqgObIMbroqT+SG6RDe22SmVM2tvNEYCPKRP1gBRQbuPYUeEQTMFP
         gH1Q==
X-Gm-Message-State: AOAM532RaxOy3he0VSRrG8IjycGf/tcLWEz0GzVCPHofHm/le40RtH37
	C36mvu0PYBhr3XQPuPStxrZLtcGaS9nGCg==
X-Google-Smtp-Source: ABdhPJyV87du7re8rqwb6X/TayGgBri2biTYL2d/lUhHdRgo4iIUIxkHL+Bt7xDYQ6+fKidX0JiIFA==
X-Received: by 2002:a17:906:a1d7:: with SMTP id bx23mr12092339ejb.273.1598378885197;
        Tue, 25 Aug 2020 11:08:05 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id r26sm12875089ejb.102.2020.08.25.11.08.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 11:08:04 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] libubootenv: inherit uboot-config
Date: Tue, 25 Aug 2020 20:08:01 +0200
Message-Id: <20200825180801.2470-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

This mainly aims to involve in the sanity check of UBOOT_CONFIG and
UBOOT_MACHINE, it will throw a error message at recipe parsing time if
neither of them is set, and libubootenv would be skipped.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index 47e64f9114..07711484ac 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
@@ -15,7 +15,7 @@ SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
 
 S = "${WORKDIR}/git"
 
-inherit cmake lib_package
+inherit uboot-config cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
-- 
2.28.0

