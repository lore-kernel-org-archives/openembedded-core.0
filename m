Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2823.1593155958211856403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RZgkCkiC;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id dp18so8355613ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlN5kVY2YhX/ZXrV126u0rmOCuAXCCuy5HBEH5BZcEY=;
        b=RZgkCkiC8/tXl5eoGbXb4tXpC+fBB7KJgFuc+OnlJm/2nauChyTromqHjk0byyb4TO
         FLfRRkshsHKyO8zn9IihLy2JOkrTW71mMmJ/bM+U0u2B7TlJlrNOT36jEOrb6OrjxpF/
         BLY1LMTg7HI7WlCSlOhetUAlDF9V/jSQ0Zbqnk952JX6CjK7lKwPmMSSxLoMwFkIvJp3
         GJczgNFU6k6K6iKVDgmoYrLRoQMU2PJgsuSaxpnGagnq5lAvNtyZIDvejLBYkHk3f5dR
         ERTSfCxDHCYhZ46o0IOKXL9JbnJPtkkrkT1MXkP98MEYibsjgw29jtvGHGkdd6Sd6gGl
         sDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IlN5kVY2YhX/ZXrV126u0rmOCuAXCCuy5HBEH5BZcEY=;
        b=XhCp1GVcbi03wm0pH9ORYw29DLQQLt733GhOjCghFVi3Fhw5FzKODwwVmHl0S97sDf
         Tn2GUbLP3Ae9P2WoCwe7v49P/u3WNe8TlwYo/fbHkBqigKxbOIvAv2vZI8Ms1XS8PpRA
         TJaKu5LuZg+AKqTn35zmpOfdwcc5h8sorUEgUQw3e2AlZ9MVWAsFkd42iX/I0K3Qhxc1
         ox3IoOeMYxkZa/vhwKgdU0P+gZYo2X1GdMMSNhIzgne0Gi6tS3YEP8DJGEvyLADALx2N
         ofFSsMMuRMBXysAeMjGY7MKVyYRqJ4hWEN2W/Am/KmxKiaFIke5hhogbIB+6BpnY0xWv
         VCRg==
X-Gm-Message-State: AOAM531GUMsVtFJRsQFENb6MD5uQJfO4QKJbGfd25HWu0aT75EqQRfAY
	6R6S3ZxkhMrSHQdgNsvRDs8K6GjhhNg=
X-Google-Smtp-Source: ABdhPJy/Qk9a969Pigm7tER6TL7GWSIWoKbeCvJuXxnoWhyiOPOgQvT7dBbttfXVUO+GaNbEeDnVDw==
X-Received: by 2002:a17:906:4f94:: with SMTP id o20mr1325884eju.113.1593155956573;
        Fri, 26 Jun 2020 00:19:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/30] linux-firmware: upgrade 20200519 -> 20200619
Date: Fri, 26 Jun 2020 09:18:29 +0200
Message-Id: <20200626071844.29134-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: new firmwares, all redistributable
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20200519.bb => linux-firmware_20200619.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 18f44bccae..392e03a10a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=c15cee50b1a59d27106a37c2929d5291 \
+                    file://WHENCE;md5=d373d30188c38dabffec0d3cc87abbfd \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "584c49c58291136b966ceffb0a456a672c23d4d759bab8bf86cbbe28061e415e"
+SRC_URI[sha256sum] = "962d3ae197d226c8259f9cc7746f7ef12a9d23787cd56bd27302021ba6339722"
 
 inherit allarch
 
-- 
2.27.0

