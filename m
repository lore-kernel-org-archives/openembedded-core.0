Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.35528.1607956651872371295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NBRl5T5c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id b5so6665883pjl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yh8nGeanLmMdP/v7w40buSE9qa55449W8co8uvgcbgo=;
        b=NBRl5T5c4m++0AYfu9SpULEhmBfG34mk+FVJcYE/vtAR4Oz0RyYfsIM3WCHzyrKs//
         AD6FkVjf+/dlEOxPye8sMTct/kGPci6jD57CeGpd1WQUbrFcDwle03OuNt/Po5/US0QJ
         TTLqWcb62SrqpxF8DAnDNdHEX0p5YC1qIkGMVU4/wohv3BItKWD8RYj09hopyoS0ZVSH
         j0XixjoFyTR5Y5PrD+dHYAXaPZQjr5D2x/29ajgKEIrP+jioROTKcK6GVoQlnYKNiUjE
         /CEnkmnjrzmp+10qKuHXlHHpzI/kddn8qu981kF0MGbomuLdTcPEFiumbP+S2HBd/Orz
         tWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yh8nGeanLmMdP/v7w40buSE9qa55449W8co8uvgcbgo=;
        b=fq8eZPi69EXPvK25vyNX+5xZ3NlnT2SRknx/lNQjaUxZALTbrOD5QQ2qcHleK+sTA8
         YRWPosn+AUnN1xIFZl+WODa0lkCZ4au15uYncpfGoYFh5MwZx4KR/z8Jjaq72Op/zKWg
         rlnpOnIjQ6Pg2mfY2XnzitMHgevj5tIvqydQKbRUU/pyrewYoqvyQILCuBeZGFVqFcgE
         aeuKfhPobBjEO+DzecBV4IREp+AENvIZ7dK3xVy3Ivnd3k9XYXut1Us40wMlXiMk+Ln1
         HUKJj2gxV6OjTfUQsrPHMtHIXjq/VmBssbGOV/1CykT1VjPxoUV075Wzlj/YP2EKwhpj
         mz0w==
X-Gm-Message-State: AOAM531LymegnBFTym9gZ3m9QgsbT9uVhgU6pvbFMcsyJE1s7iD3tGhb
	3bWwYoaB7xjcejWiLv9SmWWaS8d7ErvO6h6c
X-Google-Smtp-Source: ABdhPJxzavN88PJYFzy+z6aCi9uu9q+bT9OkBf4S+nWmwfnjONj0qLWoiOW6LvhoxzkkwjDc4Qf6Hg==
X-Received: by 2002:a17:90a:e7c9:: with SMTP id kb9mr23004279pjb.32.1607956650874;
        Mon, 14 Dec 2020 06:37:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/25] linux-firmware: upgrade 20201022 -> 20201118
Date: Mon, 14 Dec 2020 04:36:37 -1000
Message-Id: <82cf40805ec75c4e43bde824162564f3d7769095.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8b2f1e058e83e3f6676189fd77fcfad3acd019f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20201022.bb => linux-firmware_20201118.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 93b9d5308a..5de7157f3a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=daf28db5d6353de0a886f08106cffa22 \
+                    file://WHENCE;md5=ef221e03fc58f4d34a132b801dfa1d68 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bf586e0beb4c65f22bf0a79811f259aa0a5a7cc9f70eebecb260525b6914cef7"
+SRC_URI[sha256sum] = "863d5a31da725b856a917280d1e3014929b3bc3d4e6e5faecf530c13afb7e2b9"
 
 inherit allarch
 
-- 
2.17.1

