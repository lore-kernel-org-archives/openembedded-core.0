Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.181960.1598214087056596896
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RlXB3ghw;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id j25so106838ejk.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U+xX71/kcZ+EvXwPIhLDNeK/vih/MuoidHBs02o7MWA=;
        b=RlXB3ghwmpnHULr344zTW3oD6fDq8R7ZlW5usqLDh2DCDzWedCJYeI64mA72kzkhEz
         /KypX4RvhPkG3e1TH4nY2Q7LsvGDOoG3Xgg6KTZdJPr9sXfuQIYP2oGmetNg+vKJ9IN3
         YzMAcWghaFaJdhaeaPgPGRYERJUkCumR/hLY5YC+TaodDBhkzTVTzYZst2hwvCNWQ7Df
         9uIaa/DBsdq8X32tbChAl4ff9jRIuxUGFqhoxivbX643dvD47+ANzKkOcVMtaYByvxJ4
         XqXs4C6v7b8mypQ7VGLB5iCla55gIpiytsJCQaPCMi7ktvA2TPOZ5KTQwQEv6uzpRZSy
         Uovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U+xX71/kcZ+EvXwPIhLDNeK/vih/MuoidHBs02o7MWA=;
        b=J/SMi2IvwmQrzkU7pKx3LjKWhmEhIpQdgxIDWP3+enEL7mL8CK9wIAzcrNLEGYxycP
         sOYLgbfo/3vCwmR1ZBeuAAza0inIj5Pf6S23mgsxdFoBq7KC0TJo/y6v62sF5oByRabs
         NdfekGh600gnBEm2lnIdxwFTIsTDe+w+wLh5x1DGoVPbRf/XjlYBDM73MkPvZxoNcfWF
         ExvxCZaJBFsZQMv2ktHdDreB7wL8YdZYKvDVx7jTEFReSedtoktf2jP9lUYsHsFD7088
         0vFt8t0VWSwFpiNcOlbgm1Ah9ROu3RkmY99yKSJ2280HnqQ/vFbAqp/86qhhqf6UL//I
         V3+A==
X-Gm-Message-State: AOAM533kyXPMpIO4gd1u/ZOPZXh7MysyK4ksZH92BrhThFQlb4qnjwfI
	dVXW9KhilMpiY2FR0Ql3LeLbqoOuWxc=
X-Google-Smtp-Source: ABdhPJxscOv6+okD5UlubZI3cUoJCtPjr9JqzgdZa6nWlKliBRo3/iKH/QnXm8PDSGbHHrBZXj2X/g==
X-Received: by 2002:a17:906:52da:: with SMTP id w26mr2729410ejn.493.1598214085255;
        Sun, 23 Aug 2020 13:21:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/37] mesa: upgrade 20.1.4 -> 20.1.5
Date: Sun, 23 Aug 2020 22:20:15 +0200
Message-Id: <20200823202031.24686-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_20.1.4.bb => mesa-gl_20.1.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.1.4.bb => mesa_20.1.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.1.4.bb => mesa-gl_20.1.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.1.4.bb => mesa_20.1.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.1.4.bb b/meta/recipes-graphics/mesa/mesa-gl_20.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.1.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.1.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8d8e5288a9..547a3a0b4f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "6800271c2be2a0447510eb4e9b67edd9521859a4d565310617c4b359eb6799fe"
+SRC_URI[sha256sum] = "fac1861e6e0bf1aec893f8d86dbfb9d8a0f426ff06b05256df10e3ad7e02c69b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.1.4.bb b/meta/recipes-graphics/mesa/mesa_20.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.1.4.bb
rename to meta/recipes-graphics/mesa/mesa_20.1.5.bb
-- 
2.28.0

