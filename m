Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web12.36686.1598811553310987916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RgFxkr4e;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id w3so4719376ilh.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=l2531QmBodV8X6/kPIVyXQ26OJ/lXU+oiiQ81OQDqBA=;
        b=RgFxkr4eQm/0KWdHfW+V0/OYFUcy4TurR96fTfu3+c8DaePyVlnIUEYD5NohLj2UwY
         ydasvnSYvDSXsTyg66dSKX0ZeUUISWF1P3DceVnbW80aJ7NnuHB1ZS8XSY1c4VuUz7BK
         F8oXBSQ3WkIqOQPcQyJ2bzSRs3daxadX6DsVY0QOuPnZCCcDMYXeHhoxmaZA8BQers0C
         /DbOMSfp5ME3nRffxHLCgxp1J8Ga1UuxNysWMt2mv5KPtDAOq/BOs1IGWPN+W/fvU2LK
         /7aIzMbRBB/8qn1memCxxnlu7GBfLkvj3jgZd6XtQ+EG32b8MFLAb+P/by/kR+iquX8F
         Coeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=l2531QmBodV8X6/kPIVyXQ26OJ/lXU+oiiQ81OQDqBA=;
        b=YXJFORxmzXhHxjINj2NqOfe8KnMetTn9pgmKh65LqNOVrHoavXLmYpoPL8+4uzt10X
         l6LAEvEEJJ1j2DiMzBC/kMSczm2U/aDYVdjCJ8oJbSz7ECc9WQgt5WkSbs+DcaySJQZl
         b5rnP2PKjXEEWMYn8/TbZ62v/+01QUazqFqd9e6/oaCWr3wJgQ7dQ3QC/oJWUTH1KqEr
         5qpL3/s3RzhhZoac7VFzrJRnxszyDb5542HrPP2c4t/w8IHyPk7AAHrn2M16iG0Myneg
         VZPwAqxffIqwgD9VVRI9x36ZTZhixaxNsBH6p4GY9yjZ9K6r4mU1/eSJFUSxoF0RSJPo
         UlYQ==
X-Gm-Message-State: AOAM531pLG1kmILkKiXNIt7rESq3ZZ3KbJlClp/Hf5UXr2jydB72ty4a
	VQdMuMHVeTAsY/DDAvj+3S0PC0C5/UCS6wSRhl8=
X-Google-Smtp-Source: ABdhPJygENeVLrwVQIBSZoyfpwRQ00ki7FnawkfaYZNwVskDm6P4rkgVA2PJKvSg1BB/1Jqlc+IQag==
X-Received: by 2002:a92:4184:: with SMTP id o126mr6717290ila.6.1598811552204;
        Sun, 30 Aug 2020 11:19:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.19.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:19:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/25] linux-firmware: upgrade 20200619 -> 20200721
Date: Sun, 30 Aug 2020 08:16:18 -1000
Message-Id: <c692a358dbdc9f6558e6c4a76c20d32f9486c000.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: firmware versions/filenames
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c1ee3b8a02cd8c5b4219e06c2d71dac1edf4fdf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20200619.bb => linux-firmware_20200721.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200619.bb => linux-firmware_20200721.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
index bf25ff8b70..659534521e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d373d30188c38dabffec0d3cc87abbfd \
+                    file://WHENCE;md5=7627a0ba9a78e7e556afcf15b0971016 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "962d3ae197d226c8259f9cc7746f7ef12a9d23787cd56bd27302021ba6339722"
+SRC_URI[sha256sum] = "898c334b0da7de6ea173899beb696fad647dce0c06960d7368ba4d4e802fb860"
 
 inherit allarch
 
-- 
2.17.1

