Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.439.1588286201813365616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CayPVw+t;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.45, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f45.google.com with SMTP id a5so5286669vsm.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VlaiKTqWZarQPlOmRHm3HOtgUMpsOGoEg2E8xSWT1ck=;
        b=CayPVw+tS/LL7hxydPcCBLFF+Ig2dFfh8loZYd0WQaVMeQo4BdMYIwXH+YRyat6csP
         ryOwmmn0tSez+pzInsAtu4uD5cQ7Q4SC6iNJuIFBt3fZ+HhwuyBS1YKBw9VZ1YyBNeTO
         XDe/7cqs5mfY/cz/xjPz0XBQuhRQrFEKF2q8qoJCwj4tCRxniJKzAAqfWHfc0J8tSHEf
         xS9W+9v9KQ44Q/qfRftJQW4lW4pj6k3+Hm27TUIccpyMJCAi70ecGuPlyZlyfflqjd7G
         mNZDat2kIrPOP97zYv3RYCHXcp/q4rpLeY4BDf0w53/6pEQdgXYMuAtSXCdlPpojEoP3
         aZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VlaiKTqWZarQPlOmRHm3HOtgUMpsOGoEg2E8xSWT1ck=;
        b=BtHzp3AgnunEoO1gI2/NkrD8oj/CZrMEILL1UOQdkj1bdizS4Szmj+T4EQoZ6XK8Mc
         HV1789xOmSqCIDET+1YIA6Prk4/YQBuHz6/Ifv7C6lI/YqLvA+ZRc9L7YVeH+LdrFBQ2
         zvgEuNhRmFJJyKaOM4YgQTM0hVXxKA0QHuVr5RjGvzg6CwweJrW03k/ONAXx7VrcVR1A
         szKagvr0HhqaXmjSUqXNV70drShbie6B7e/p0a6FwMTxiC2TkX2PZd81sXoA7XjjlLcf
         AZNpqfr0ItWqiNCceH/kgbE/uOA9ULAhWWQl9Vzizy2oLkK8zGeXFWcy19qG5jKvEjNz
         4ezw==
X-Gm-Message-State: AGi0PubnC+OJ4uDxZwc2+91xc33/cmcsKXCrjk/lVTCyC2XisgPn/gVJ
	xX/qVYFGbReF5FWfbk+xt/kecCBuVQoI+Q==
X-Google-Smtp-Source: APiQypLWfghhYOaCBPJAZzTZIWIe0B32z1rXfL8m0F+z/GBhtwePmxPv+HDOnYRtJu8tDWkRoQxkJA==
X-Received: by 2002:a17:902:c38b:: with SMTP id g11mr1286742plg.295.1588285861163;
        Thu, 30 Apr 2020 15:31:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.30.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 03/14] qemu-system-native: Fix commented out PACKAGECONFIG
Date: Thu, 30 Apr 2020 12:30:08 -1000
Message-Id: <2797779cb8b821d8bec8df999c6ebb86384c9686.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f17a046fca..7a1ccf2115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -180,7 +180,7 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
-#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.17.1

