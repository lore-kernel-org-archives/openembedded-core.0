Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.56.1619200986339007572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ieZrGHBW;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g5so68374932ejx.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4nnYBC9VoNO4r7XUEyVBDQ9sh474PG9DjY46inZAlw=;
        b=ieZrGHBWX+m+Pn7Lh3ofARLjgIWIyu3h6OQXE8AxBvVvJv/UVhkb/nX+PZjM0tlUtp
         YE0AHdteR9r/R+F7P6QhN4Ef+YBl3bFuaW6Xkx4KI/79Yr7uEaXTis9WVDVJt7RtRQeG
         U72Tikl/Y0DY9WzTEvkOGkAJchaizeAvTXjIBsmMQ9jmnZKJge45poZYN5SzDIT7XNrw
         8UdiR7QpJ3s/87SoOb05u73szL9UTNlDwk3UFzWJU2nW7Rc6rvl5ZGzz0Ow+OWjV3PZx
         U+mcxY3aDGMTPpPvfFEdsziydM7roxahYn+C1dXg1TI1i5rMTXrBadkVVh5WohR9iTlx
         3Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4nnYBC9VoNO4r7XUEyVBDQ9sh474PG9DjY46inZAlw=;
        b=QTHG+K6Zrw0tehkXbDtDugu3A9D+YzO+0GpqyUvXTvzb7Z/qJeGl6m33vitW05Inyo
         ulW6ghfq1SkBLII3wWE+3ayMVXfNFfIGrMkXNklLLhFfgjwjpiCCzTycizckm7NdpHWY
         4j9eA0BU/phbrxAMGeEhZi/p19CvAa+wGDnYQ8Ko8xpz8tddtPVUd4TVBVZopPKtSv35
         ylTt+tO9nYoNHDWHxnz01FY05w4g33+xg5H0H8TgA/KQH+mpnhjsuENuC5EJV2LD5A9D
         cDKWilqUedHUYvzzJHEwQFyRMh6KBi5m4KlIq5enKvM39EWM5v/bxFAFnbCwzauoRXOh
         bELw==
X-Gm-Message-State: AOAM532ttG5Flurkfm1MZK+k9Jof05eOBgqKrKin+ZiFJQpdCB1n+/ls
	Jt0wO9U0Odr1I+rFE2uoiA1VG1NK3tGwJg==
X-Google-Smtp-Source: ABdhPJx6F+O1KrrRzMo1bh5FXoqkwaWJXaT/46LjaPtnjjndtFjVPZ7yv3PUa1jNPC/7oIGqohmGOA==
X-Received: by 2002:a17:906:2c19:: with SMTP id e25mr5527486ejh.483.1619200985022;
        Fri, 23 Apr 2021 11:03:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 7/7] poky.conf: remove wayland/opengl from distro features, as it is now oe-core default
Date: Fri, 23 Apr 2021 20:02:54 +0200
Message-Id: <20210423180254.706537-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 522cc92f74..f65241f71e 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -13,7 +13,7 @@ TARGET_VENDOR = "-poky"
 LOCALCONF_VERSION = "1"
 
 # Override these in poky based distros
-POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl ptest multiarch wayland vulkan"
+POKY_DEFAULT_DISTRO_FEATURES = "largefile ptest multiarch vulkan"
 POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
-- 
2.30.2

