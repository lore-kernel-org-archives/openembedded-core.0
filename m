Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web12.36689.1598811556808076695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cBSKF2hV;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id m23so3809087iol.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gvvoPOBfVWkykAqyUtky1NyUi4HfTicdIiRWwyYPhrc=;
        b=cBSKF2hVYrF0HZxuKqBLRwAWPwsLPFlxzDyifHVTkuHJhfZ1o56Lp83BuaADA9LZhp
         cr0h3lXgGmjusi+eYc58HcQ3tnpD6uDZ3aknx/KvGxP+GEDofBPVDTjsLz+e8F/nvUpX
         XtUn8440PCpG4v+LZ5/QJb542zAh28Hc37Eo5HsAvHN8wRZ9Oy5BEyB4Eg/pkqZhzeoQ
         LeKiMtGLRXZoVhrphX7756w5KVWi51WnTXfLLrawLJsM0oZtijsWy0S4gweEMzdf3eWk
         9CeL4K/omSlB+2cBrp57F0R0E+8VasPI/Bl561tr9uQxtO2mYEaJAatjmmaWcEfhzMsP
         zdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gvvoPOBfVWkykAqyUtky1NyUi4HfTicdIiRWwyYPhrc=;
        b=A8KdUR+kF3q57wsxU0imBr501NDQhDjL7pGqSTtK/kGR69kSOsFcR/Rv8wauzgBK5S
         HrgF8Fs/1C2df4Q1TgzDadnyAR7dBqozpIuXncEG5w9WEMrQGu5ZQNHEMCrTKRgn8gxq
         4z16mxwBCmQZfvKAAkldNXSqm4PVT3oxhopDG8oBUXm9cIW+H1MuTMRI4RVS6gwIblLc
         AHzifLXO4fsX/1KFb8gwzIjtFUql/neTV+8bchQbEu8nlmhihj/Ae0F1GNpOwEVTmf4M
         NXRurfuVML1l2zjz1ls7u6rfiJUmBzKgnC/ZxnQw4S2jsdhvJuQN74r4kFNPmkDJo26U
         C9+Q==
X-Gm-Message-State: AOAM532YEpG9DhH3Zh7hXGESfhhMmBfMhysMIOzThpZ88aFe/HHKOav0
	rgjzGsPdaAsEOZneAIlQon5oCGN+JulPCi3+Nhg=
X-Google-Smtp-Source: ABdhPJw47oRqHTNklJdRjSn/Sg+gRs6SMe/ECuNuC83iWyhQv8CBMrAwIR5J2ZAk5FNhxx4Bb1GsRA==
X-Received: by 2002:a02:3003:: with SMTP id q3mr8892403jaq.4.1598811555544;
        Sun, 30 Aug 2020 11:19:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.19.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:19:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/25] linux-firmware: update 20200721 -> 20200817
Date: Sun, 30 Aug 2020 08:16:19 -1000
Message-Id: <af9564a49b12e8c7bc4fc4d1fa6c7a0df76e4c04.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16f2e190ef55e349512b8f70fe437b46ef1dc142)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20200721.bb => linux-firmware_20200817.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200721.bb => linux-firmware_20200817.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 659534521e..22e71059d8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=7627a0ba9a78e7e556afcf15b0971016 \
+                    file://WHENCE;md5=4d229f79f8770b5b2c4aac655b9fabef \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "898c334b0da7de6ea173899beb696fad647dce0c06960d7368ba4d4e802fb860"
+SRC_URI[sha256sum] = "76d05d5f1eff268d3b80675245fa596f557bd55ee2e16ddd54d18ffeae943887"
 
 inherit allarch
 
-- 
2.17.1

