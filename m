Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.2669.1622059407419858712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nTrpXBag;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id o127so1410897wmo.4
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/F7HK6be3EruL8HD/KdisajRg3DfrEzEYCKAldqc4BU=;
        b=nTrpXBagejY9kYE+VHmJKV7J1JK4Al5R1Lk/w+TmFj6sNe3PzGAee6YBuBFX30PDzK
         OC4nrDbGlJ1Dt9VO2d2l40pN0yyIH++y4pSKyibU5T0nBcmvu8Y7bxpnNHkleUVPDWYD
         95jn+0frviYCAgmrUYD/SNOQPNt8kii5MUbfC77fxp5b9dJu42fsM5VRkA5G2kXX0gFK
         xcrgIU7cM7Uefso4IYx+IiXhspNuv+m6oR8htwJZ071wtPgtuGSnwm7/SdMLv/NpSMYK
         WU+MrclHgQBW9ldKGEM2XZ55Syoh/amo4I5jKxInOTBsbMxNt8ggofZj7RynaSm4mWk4
         jB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/F7HK6be3EruL8HD/KdisajRg3DfrEzEYCKAldqc4BU=;
        b=am0JXlUztB1EIl1ce3cv7LM8JeBTcFYFmmymkDfvEBm2Q9g0pHGQy1TZbndOjyP6pR
         w4TSOCDLL/EQJ33tTnmx1Dx1/3yEasy+9o3gRruyH9ogI6kYbrGcMqB32ddNvFVJ4nee
         L9ZqNDy1IQ+2IGFj3iTmRlBLr+FgQdVWFhHK4QU+7o4wOMXUMEy3u1M1b5FncXmuGRJL
         vtn2yEn6/GPRagDieMfTDRbTRCDGEh3yZpYZPqqnYYDOcJr2wLiEL/HSm0azHw8jjSEy
         zg2r7G/hct2oS2vF/prZ68GBig1Wzz3jifKDc7vGPpAaW4ZROlfK/DYiloZ3DcJnZG0B
         C9rg==
X-Gm-Message-State: AOAM530EGLkIUIbm0kRy6hD7CtZX8M43GhZE+Iq59ma5tsRxJIWGgQEs
	Etcq9ox8kA+KS0xeUPoyvfXR46yS1TevBF3SEQHCm7mN
X-Google-Smtp-Source: ABdhPJx6UOgwW+664v2IUEvJ9i4LWPTXvbBUatLDcsHILXoUbjL8AGxoLylnQBSyAVVZrb5e2LUHKw==
X-Received: by 2002:a05:600c:4fd6:: with SMTP id o22mr89706wmq.83.1622059406019;
        Wed, 26 May 2021 13:03:26 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f3bb0593a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id n2sm116635wmb.32.2021.05.26.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:03:25 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [poky][master][PATCH] squashfs-tools: package squashfs-fs.h
Date: Wed, 26 May 2021 20:03:17 +0000
Message-Id: <20210526200317.31355-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1

Needed to build the latest debian version
of android-tools
Fixes below error while building android-tools libext4_utils.mk
| squashfs_utils/squashfs_utils.c:27:10: fatal error: 'squashfs_fs.h' file not found
| #include "squashfs_fs.h"
|          ^~~~~~~~~~~~~~~
| 1 error generated.
| core2-64-poky-linux/android-tools/10.0.0.r36-r0/git/system/extras/debian/libext4_utils.mk:29: recipe for target 'build' failed
| make: *** [build] Error 1

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 2b1409d78d..137e5097fa 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -32,7 +32,9 @@ do_compile() {
 }
 
 do_install() {
+	install -d "${D}${includedir}"
 	oe_runmake install INSTALL_DIR=${D}${sbindir}
+	install -m 0644 "${S}"/squashfs_fs.h "${D}${includedir}"
 }
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1

