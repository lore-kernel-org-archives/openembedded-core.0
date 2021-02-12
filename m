Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.690.1613094077158020445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 17:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NHKD6c0q;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id m22so11025365lfg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 17:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BWnmfn6dZDBBaKtcyNv+vrXsNdwhCd/bhNqCe5ZBCOg=;
        b=NHKD6c0qEPWzgoPhZr8urjudJIhliWJWQW33r/eYF0Rgp/T4TSTZ60U7YZyKm0id//
         6Me9zjc3aP12U3GXl/ajevtxX9FJhbHLgKJrrrjY/8GKwyNyQD0hK5BHNMhqPAFaTudt
         qq/BsbQyFTindeXXlZ8xkFpPKvBOXMVw0w8vnYD5Bi4wrr77ujeFMsWm/jkgFWJP3Ium
         qLyzqmkBws6ZT36CXvQN9bTkKc6OqIxNeHb4qrQTGVKkKC8Udv9Y9GmpFiWOHHA1AvCJ
         dGieX365ib5yYMWwQ9BWQUtRHV1jWmbZQgLKdgS/prRYJC5eOc1o8hFVMUMYiaM+iU3P
         acOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BWnmfn6dZDBBaKtcyNv+vrXsNdwhCd/bhNqCe5ZBCOg=;
        b=ODfTcRH62N7gedRCQQH60ukm0UVH5A9hu6sKrngxNpjEQYjI9n+HdqsGo12Fjujf1c
         jTR3uT+G6dZnI6IzSRbJ7PtVPk4R0pgBUg/DB6On7P2zo/+WjMWvu+s+hOMkl4vgpyvR
         jyLa8g9iOWsRIIjWe+nBsUK0KDy9KPMjBZ/xBiROJGrXcqp1uwTW6Tp5KXhYkn0LVAQu
         kA5mTy4W4QNAoAJcVsWmPk3Eqww93ceNDv2G41MzcHloRdJEKVKbm5dQEBenjw6HyeIw
         uK5aInzNa45o+SM7l3Kg57GnJo86CHEtLkMeJ3q7Sspmmg7hC5+jl5MBkjW98SSqSHLV
         zIIA==
X-Gm-Message-State: AOAM5325oQCvdolJRqF5osScE08uGJrmxjg4LcXObhadZ71Yx0KJGcXY
	ZFN4Hjshq70klNZyVBt0oDDjA3OUZBWZGTS0
X-Google-Smtp-Source: ABdhPJxKHmOzYzZ/SPm/STsedndnRTzGY3Dy9R5dH9v7OAy2igFKu7J3IIGND/CvBIduYokS+fnaeQ==
X-Received: by 2002:a19:f20f:: with SMTP id q15mr376557lfh.227.1613094075187;
        Thu, 11 Feb 2021 17:41:15 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t7sm1115183ljc.87.2021.02.11.17.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 17:41:14 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] linux-firmware: update to 20210208
Date: Fri, 12 Feb 2021 02:41:12 +0100
Message-Id: <20210212014112.2356927-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{linux-firmware_20201218.bb => linux-firmware_20210208.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 700a79b118..4a2e30119d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -201,7 +201,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
+SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
 
 inherit allarch
 
-- 
2.25.1

