Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.10079.1620227970480009038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KGgDgKgC;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l4so3428061ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adKGyV3xHVZAWn/1FZZ92Ra4/3eNdtoBWEsBinAcaAU=;
        b=KGgDgKgCJfOgFDPuZu0/bDoK2nJL3GFFvKM3i8C3TP0gYDOSmRbh3//1emBz3y0l+K
         kw26XinnzO6X5CGILQBeRZjeJaPev3kJ0cI3BMs+EZitiPUnj3DowgTOg5CG3WZl2gvf
         NOqBx3qHh2GZcygbo5v5+rQVPg0Ec8UGPi0wi4IjElQptKqr86bpVqQ4+slvcArIvCJt
         ij9oKfmpVpQXAWFBsItw8vmSrFnpOL0LDJphBIxDmlbMsqf6zsczZ8XeJIjR2uGTQxnd
         BcrDdDYfDSzZlHAOFIDGzL10y5xdw1Bkch2QV4mJZVjHlobomdhx8DfJPUqrkNVwufle
         bO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adKGyV3xHVZAWn/1FZZ92Ra4/3eNdtoBWEsBinAcaAU=;
        b=ThKePGzXW1ti/z4+Siyiu9YidDxQHujdyc6xtnMMUHsWuVBbs8TbNiTcdWUJnp1gPo
         Qjvq9uXVngETc+SgBJt/LE4ydcN8UVzD6D1RRHSVpxrgV+7+6lIp4e7K1ucaLkkM50m/
         IBE05khGWK9Aqm6cnUmbthAHZfAImaAgSbgaD9QURmR0NEv5laCWBNvZ6YhFAPy+3l/i
         gccuUieH3mnzE+snOhn8ESNNu7JMpiWRMuQcHbEpi6YA9B0k1XS5kr4qx1RCnDBofqnR
         cts6jHb45R1qU8BfbRrKAU7Riu+6eX1Am4l7SoPOfBdGogPgGIpucKPb5Tt/ttjSjlV4
         3jLg==
X-Gm-Message-State: AOAM5302pjy9NylgI0GiilW+7dMm3vt2CblixLloYkEmqhq9xkhgmBqr
	7Fw/Z8P0UhMsB6J6PnAy9vIjwDrpdtBkuw==
X-Google-Smtp-Source: ABdhPJwzMCnAylilwxDaUFRG9fv7uHOzRTa0FLG9JWN2o8X+5oTclP81RxXX0bRfqmpaiPEExmCSvw==
X-Received: by 2002:a17:906:6d57:: with SMTP id a23mr26770498ejt.197.1620227969099;
        Wed, 05 May 2021 08:19:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/61] linux-firmware: upgrade 20210208 -> 20210315
Date: Wed,  5 May 2021 17:18:31 +0200
Message-Id: <20210505151850.660512-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: additional firmware files, version changes

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20210208.bb => linux-firmware_20210315.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index a751b92a2f..892455b039 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
+                    file://WHENCE;md5=e21a8cbddc1612bce56f06fe154a0743 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
+SRC_URI[sha256sum] = "a2348f03492713dca9aef202496c6e58f5e63ee5bec6a7bdfcf8b18ce7155e70"
 
 inherit allarch
 
-- 
2.31.1

