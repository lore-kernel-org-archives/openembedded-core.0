Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.6324.1604890630598729145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y+Ku0N2d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id w14so4073293pfd.7
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nnvdsGjAtie/YtYdBSKys1F0b27TKSO64rAoTa/GpJs=;
        b=y+Ku0N2dn2kjWZLiIUi7VqQGxFra0/0hBkMNhQbfp1jGllfpVj03aba0UJPmUz/aAA
         iA9Qy1miNue21ve0E6fCyTQKpkq2rJV6+LjmM+ChRJMNgFuCqBaXQFwqReDX1OIPVNeg
         pBb8x6/J5uLd0VbEeW6C8cxxf/Cw5aEzf5xLOV7EcGj+IHmewR6XBx+4N20Oe4S8FLRz
         07EDzRzfnzAEWZcE9Y3cLcjfw0NJNsQVRJ7MhhZtk9WdyylJ6mnoy0yffFAC5zAXTpU3
         vq4PGRlEZxEgkC6CEUWCJCXekJJ0u/GPVEwiBbo6YKhlOzQVjfRdbMBwn2Y1Y207nhs5
         eF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nnvdsGjAtie/YtYdBSKys1F0b27TKSO64rAoTa/GpJs=;
        b=Z+TYRLswwXtxHRKknfUB0Ey2PjWfqBW6O0uH8czf9oOGH5Fh+Ol4y6iM3HSg9p3i+J
         sH5jZ1mIxMA5jBBfP9NUjUhHO8P5azo/IDM8kdGGYiLpIzMDDHuD4jlfXMfA1rZLMSW8
         zBc7hTPJxMKyyxwXJQB9tpF2r37xjU5+WJnrfoPGg47xmv8Sk5o7cOEv4OoPV6j210OD
         swRtN/UrID8olE9vU9/qUC6u+djyjZuiN3BYSwDy4oaPfhC8NWw/GnF62oLbez8uHNpO
         zSyyTT+oBnD+PdV2j8jIh4t4+l7MYsqs8Clluc5O1qtGVLZM7D0ARM86E6ft715/xWOR
         LYlw==
X-Gm-Message-State: AOAM531NHIVFwyDSKpDjTbDIXXVjvT8zEszuUf+5JoqL3kjvpN+0KSBv
	QliXYINA9YDtzQ6S+YTAQfYY10Eiidz53Rvy
X-Google-Smtp-Source: ABdhPJzeXLMNy9XzIJ/RM5TPpKDjRQNWQBTRwinWkSUWoGzedk0X71ivIGGQ455Ll71DOcqY7iS5yQ==
X-Received: by 2002:a62:8f82:0:b029:18b:2db7:41d9 with SMTP id n124-20020a628f820000b029018b2db741d9mr11971131pfd.66.1604890629743;
        Sun, 08 Nov 2020 18:57:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] linux-firmware: upgrade 20200817 -> 20201022
Date: Sun,  8 Nov 2020 16:56:14 -1000
Message-Id: <6d53fe9a67f3d6736e66ef00a01be80aa18b1612.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: WHENCE file names updates
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bca259699d79bb16a6f07afa80f2768f9c62ceec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20200817.bb => linux-firmware_20201022.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200817.bb => linux-firmware_20201022.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
index 0abd28c9fa..045f2647e0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4d229f79f8770b5b2c4aac655b9fabef \
+                    file://WHENCE;md5=daf28db5d6353de0a886f08106cffa22 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "76d05d5f1eff268d3b80675245fa596f557bd55ee2e16ddd54d18ffeae943887"
+SRC_URI[sha256sum] = "bf586e0beb4c65f22bf0a79811f259aa0a5a7cc9f70eebecb260525b6914cef7"
 
 inherit allarch
 
-- 
2.17.1

