Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.12785.1614955629215782141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PhMvQ/wL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id t25so1521306pga.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F68hVLFW+RTvwhOdZxXHo189kmDf+ezYNZE8/Tkx0ug=;
        b=PhMvQ/wLqjUSACn4uHXcMx/rhC3RiPVj1e4l+DJKVmznEdOj1wF7YatNICu7dvQGZd
         TDqyNoh6oCGFknTwA9I2eLahnKfYMcrx7+dtKH+IlBwNbXaSP813LBzAk0RO7Pjd/r7W
         PJVnfu0j1cBzGDBeNskuIP2++Wxn0ULd7xRJLyBbMyIfaHTS3ESMAr1TriiOHNti1/PF
         AXuL4PKrsARFVIipUoHwfNmJXO+IBkn2LkR3P/FUHT4qBndPP2rtzVyZUoYGk4KqzRan
         q47AD+gnGru5N4R5UkehU0l+XVXk8tkYbpB9EUAb7gLoSUIUvk8yJW43WL7CHNgFf/h5
         a2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F68hVLFW+RTvwhOdZxXHo189kmDf+ezYNZE8/Tkx0ug=;
        b=mtfo/9FLayUhCidBypEnWJqDaEqE0aBP36cPJGBfYIlvmCLHB81heeSE9YRH4l3bUu
         zdWKseLD6HLbc5ZdWrLALH2uK3kIAEnyzJnh0Mfu+P+/nCKYtKhFWmHBig5V52+DY3vI
         m0DnHs6QrsDQmX5KHMpmeBssLDyIYCmdYyYu79/5raiFrhnkGG8W4gvOYVcLRw/3IUio
         aDE0UIFbjmV0UmOvcNjLn9SP1MTgR9l+rmV68Vc2Lg/CPwLvoCuOrCZNMMLWJLd6DJ5I
         ZpZ4YZQukq9Io2dxMWa65r2/8y50iUOy/4cCzGsuC86QCzNHIO8+zF8QLZT5f2UZULjn
         +aYw==
X-Gm-Message-State: AOAM5335ozblaS+04rnzSyJsi8uakmVgOQg1EmqNgX1ybbukYiu8Bk2O
	b1dPv8PGEOCuXcgyGEXOUGzVN3zfeBi7m8of
X-Google-Smtp-Source: ABdhPJwFPZfujYuK7jxnC2kgqpwYX1l2/pi6J7sgeaogrNwL71jBPMIISI/8p3/YnJTvLFVHTcwwsQ==
X-Received: by 2002:a62:2c85:0:b029:1ed:39f4:ca0f with SMTP id s127-20020a622c850000b02901ed39f4ca0fmr9465361pfs.11.1614955628261;
        Fri, 05 Mar 2021 06:47:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/27] linux-firmware: upgrade 20201218 -> 20210208
Date: Fri,  5 Mar 2021 04:46:11 -1000
Message-Id: <472fc9846305a656d02c83419d8d768507c64696.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License file had a number of new additions for new firmware but no
new licenses that didn't already exist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eab46e65feae24311f0ee0cd05b7ebb2e3b07363)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20201218.bb => linux-firmware_20210208.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 700a79b118..59ce4d5124 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -128,7 +128,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=03f0fad70b8b557b56084e3090198021 \
+                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -201,7 +201,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
+SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
 
 inherit allarch
 
-- 
2.25.1

