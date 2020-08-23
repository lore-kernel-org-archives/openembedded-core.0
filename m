Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.181954.1598214080384196189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KBlUP36/;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w14so5769718eds.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRDXN/qw7mBv7EDeidJhIKxRsxUVDvzJgO0+MexWv+c=;
        b=KBlUP36/q/cD3MUnvp86iZoPC5yg6qdLJD3eOmmaijeRq77HyP4l2gD847VT1b3P3p
         RABu4lUPDviMMWQZdt/Akrxu8/kwPfnpjoTlteXiIeIbcZP5lEy4N1EoIB3Sp4s8P256
         9Tr7pJRGChEEgDn6RA61RWvve7TxvOIXduk5I/sEU4KNJPbMeAboq7umZsnZJVeJbhOu
         Gt6wEr+FkXoHJGXFr4+tEsDkfHRwu+TU8sDMsCXqycHtTHezLkYxQvwKwgqEPcS1TvI3
         ciToL4b1WX8psIF47Y8pJXybaKTLuBWu1U1KNZKd8yvFKB7wuu1RVUCbhouHk0DN1oUq
         82TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRDXN/qw7mBv7EDeidJhIKxRsxUVDvzJgO0+MexWv+c=;
        b=D8Bd0EJNk8KA7UmrssJ29nz0KVvtU0UFO3wFL3phCAij29Z4QbLeioS625GuE+6Ybh
         0Laq5lW6YVgR+IXuehKC+jcVrOnEwN7YAOne3hnOXKs56zSpMq9d/5wpWOl4hrs2jzDI
         w3JjSFKeftM+mWYZqXLPko2440JkhIf0IMZrbb+gnZbBW+HHarKa9Tec6ZD/VQLhAFC0
         YU/9cqylR0rONiLx3MvlLGFcDxZP2qJyNQI3KefuVRWtTivlad+tYxJsNBqMwbeAk04y
         7ttZ92x4yzTK8h/BjLNHfL2+XnPGgvIQoaPxPZ1bsFYzCFqI8q2JJRyPU3fpCAx2b6B+
         Cq0w==
X-Gm-Message-State: AOAM533+XirbRq78L2wGfUhNqshkAB3BhtaN6Li2VLvYTy1LM9ygDbpS
	I7pf1VIXEQ+nyIuUZn36zxnezqf7CjI=
X-Google-Smtp-Source: ABdhPJzS+wHVGwMjz8Jot3WE5fTJWaQQQBJaMLpO71QQc71usiMR64apVQlcps+NgkxcGxf4wxL2Mw==
X-Received: by 2002:aa7:d85a:: with SMTP id f26mr2626215eds.363.1598214078641;
        Sun, 23 Aug 2020 13:21:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/37] libcheck: upgrade 0.15.0 -> 0.15.2
Date: Sun, 23 Aug 2020 22:20:08 +0200
Message-Id: <20200823202031.24686-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libcheck/{libcheck_0.15.0.bb => libcheck_0.15.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcheck/{libcheck_0.15.0.bb => libcheck_0.15.2.bb} (89%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.0.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
similarity index 89%
rename from meta/recipes-support/libcheck/libcheck_0.15.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 177c0edc8f..33e07db93c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
-SRC_URI[sha256sum] = "aea2e3c68fa6e1e92378e744b1c0db350ccda4b6bd0d19530d0ae185b3d1ac60"
+SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
-- 
2.28.0

