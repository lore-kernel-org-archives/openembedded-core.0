Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.181007.1598214095880929953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9gwF5+x;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w2so6243505edv.7
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVvZWGHPg6lfr3JNq1aOi4lX2Pe115svzfdySQBOkmU=;
        b=G9gwF5+xJJm6UQw5QdyLZA0Z219yQfOKKsfGGEUasFGX0+FmZ5W2N82UzR/O2levIe
         MteHyDpFdOjzNgy0zekTZn1wNSZmk42h+M73nEv9OfJ0ZcrHwh1QLOatroWt5eoCrZ4g
         Wv64eMy0VQkO/jP/t1vXn7iwY7phh9aGoHJ2zA/JgesBbTTNGmik/Asu0cru7VeEMt+I
         FCeYG4xrBOZ6dV8dEEb9/e5H+4CahuWbCuk5WZvxr3Vy4sPXJICuC1BnnHIcpIchuNv3
         xOTpQAF11Qso0rIdMddUwrMJWALXLJit128OToaSmnYfn4YkPrCmcOW7q6TtQD1JCwCI
         e2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVvZWGHPg6lfr3JNq1aOi4lX2Pe115svzfdySQBOkmU=;
        b=DkPXqVX9KZ9M4FpcvotkamAvYVXCDDV8hVAe+l8UznT6bcRKhZfE5YpoeFdEk7Cvds
         wgpa7ueoY2alkjGSj+MNDunIjtrT5WRPnbkdpCSJDL1qsrr47HXVxgo4zBbqmcyOH6g2
         8odq6iVVJTtANw78w+B/rTRJsgjXAHGZqHBYqMVtbZsXjlfetlS1Y6+r6BHvnUPMK8mp
         qcYzuViuW0h9rT/5rGJHEBfOTj/cIOhao4d7lJzCq1feSR2t+zfo0l4+0NbKYPjIO4KS
         oByjzOSyNWm57iHlylGG5bJ0KqFeatjaHY2qG7ONPC53YHtfwW3J+kWnebLu4ms/eQwm
         QQjQ==
X-Gm-Message-State: AOAM531TDYl9VrbxFxck/1Mfg1EP1oOuMVUo3oTsGQJIUAYxvVAFTKOf
	K4Czq5VDV1PnjBdwV55mFLRDrxH4SiM=
X-Google-Smtp-Source: ABdhPJy4xgslq54ey7nXGOvL21+B90GoLyyWt+YJcqVagYKY04f56QP92mdIsKEWRDY8C004gVDHiw==
X-Received: by 2002:a50:e109:: with SMTP id h9mr2622879edl.47.1598214094105;
        Sun, 23 Aug 2020 13:21:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/37] wpebackend-fdo: update 1.6.1 -> 1.7.1
Date: Sun, 23 Aug 2020 22:20:25 +0200
Message-Id: <20200823202031.24686-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{wpebackend-fdo_1.6.1.bb => wpebackend-fdo_1.7.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.6.1.bb => wpebackend-fdo_1.7.1.bb} (69%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
similarity index 69%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
index 2fdab42c38..519762d125 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
@@ -4,14 +4,14 @@ BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
-DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
+DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe libepoxy"
 
 DEPENDS_append_class-target = " wayland-native"
 
-inherit cmake features_check
+inherit meson features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "740eee3327acfb462b8460519a219e30dc0a870326e88e2ddc4fe2c8de20b1c9"
+SRC_URI[sha256sum] = "9b980a73ea4e3762266c48f81ded56d9dcad4acf32bad9bd05d0dffdd454c6f5"
 
-- 
2.28.0

