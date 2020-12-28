Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4054.1609193790280559568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZZ+oFGIx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id hk16so383676pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aD9UnQ/Fa1auddUs5Uq4WxGJ8vyaff8UB2kCE7MsjZk=;
        b=ZZ+oFGIxtxX9lPrZax5EbaQoD3JIOK0C3BDBGPF5z4SwPvLW8Z35WtTjrtsSr0eZl2
         jiDtejsy4Mti5jjWWfvx/di0SsvNWihrzOdFy5vOEpvRFJwOiFV4/1kahdsN+r3ItPCo
         C4RVl9YH3IJORy++H08EjL355XQu64LyHOT3WuqoPAgIx9BLuhGUyxuqODyFuROYC+ii
         SRAzS6kvLT+JCWlMNKriGzna/ywVOctVi4IhkthGs/Qkqg0dLd015h8XSgHdaXw72yvF
         io7/EfxsZBcPy+9Ddd4Z7y861Oar6KL1evpza1PJ9GKyF9CWRwXOzZSz2CbKjJ36+7jD
         at3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aD9UnQ/Fa1auddUs5Uq4WxGJ8vyaff8UB2kCE7MsjZk=;
        b=jxZCsLStWl38H3wMiRT1rQBoQ/42DT8Yc7LVZ1HbVWm2RDIscCy1l4TMXvBcJg3T21
         j1VjsT29ytJouJpUU88KzhsdpeUhXeVxkDxzwyn0eUQriHLOsRFLU3mqiEqWbDUxFIe5
         kJYHkCLZfT3LqoIYPPrApD2XKYAZ/7Or3tQFKBhZi07X87Zk8Eg2Yta1wGfblkygLLey
         G4AG0g64vAAmxp07KplL9KmzXvGHLl+UHrKCU8xciWWHP7+Opv/7e8jKVUUEWjI7cWJr
         6qim+JPiMUHe+nQg4h+m5e2iLUE8SUXCQy9NKSee5VmrsQyFaOMtFGdxV0qSkx3gSudY
         U+eA==
X-Gm-Message-State: AOAM531dHxPhjQQ37L3pm17w1Bnk/7+pY8csMG/aX/FPIqBgxd9ua36S
	lYqiYDKwEfhumxjNBAP2ZCVSN/EokXWlB9RsNtU=
X-Google-Smtp-Source: ABdhPJyCeCmhe3nDQKlAmQ5T0FO6yPlgleDKK+m/TcMK2zsDPd7n0ybKl+RL32bseOj1Iu42/Sw4lg==
X-Received: by 2002:a17:90a:fe8:: with SMTP id 95mr926505pjz.114.1609193789524;
        Mon, 28 Dec 2020 14:16:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/17] linux-firmware: upgrade 20201118 -> 20201218
Date: Mon, 28 Dec 2020 12:15:46 -1000
Message-Id: <64e8870b6bd5e2bb99bf36cdd2c108e66e23a9b1.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c88129ffef320c16722f40426b0d4560274dca4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20201118.bb => linux-firmware_20201218.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201118.bb => linux-firmware_20201218.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
index baac26c510..bc9daa2d4e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ef221e03fc58f4d34a132b801dfa1d68 \
+                    file://WHENCE;md5=03f0fad70b8b557b56084e3090198021 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "863d5a31da725b856a917280d1e3014929b3bc3d4e6e5faecf530c13afb7e2b9"
+SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
 
 inherit allarch
 
-- 
2.17.1

