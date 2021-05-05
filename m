Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.9802.1620227983100687713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=swy6x3CF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y26so2507349eds.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TOcWO/07/RriJa70H+saZ0wedLQAxiwp/kS17KWBMFg=;
        b=swy6x3CFcmiOZ/SuWHsAQ5wWUmEBAu/lvAl1qXKoMX6QQRthip5Y+prd1SprQpEyz7
         DgfF5ernEoiRMx9rTKj0cg/rIUe3LUX8Bfrl9S6u9zgz21QXAEnS67Sx3/MJXLTgF/wW
         MkjlpY+ybaNxdUnRudzUbglvzNF6nKbrdhZTZnAwnL29nz/r/Na+Dr/HJxH1G+lVCJ/y
         yOM5wqiue8xRLe0qqG+3l/xwFvxRmHwSOKQCT52UFErLNaQoGosC+Zt+FUHvXvi5bOaA
         ljOU5uMwQENNW7ZjgiSbLCzaEGrC153GMlvHMZVP3SuA7l2K5yh4EmFa1mW9hDwrgT+A
         njKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOcWO/07/RriJa70H+saZ0wedLQAxiwp/kS17KWBMFg=;
        b=Cm1Gdlfg9H05zE7SouRHUPlMI3D7g2RDDbL0oQcfrkDzqLewzRHtgOsR+Kc+To48UN
         EQdiHJmvq1qp6+Cj95Nl9+Ig3tT1wTFOZMRKaAAEjBjeQfnfpy7ih2piQGIcWvQQQqLY
         NmA9J7w1kkKR3n2I5gd+5bMw/1t4xsrIcDiotDgzc5qqdZIXxPjyXi2MZnkJfD3J3OYj
         g7+WvwSrzEuRVz6nf+VCg/vqJbJ6VDeb1I74ZsNInITdchKjjEc27UB05QvUVphuSXCw
         /5uaBEROPc3+J1Vfx1dWbYDy+jTw+7x0KZ7DrvLi1sKCO0CFyfYJ2UP8dVPNPgryHEzh
         Da+w==
X-Gm-Message-State: AOAM533NcIRO6xk2ow4eRL0tF0hIUwzbGAgWp+MMLoLYkDS37Sl4cBPf
	j0XBQU0GzEI9u1eLpK9CPzAyRsFo2f5b4g==
X-Google-Smtp-Source: ABdhPJxvLYA4Lwyn2yPh6iFC5y2mABKMV95q0lK4h4DgPNZ56/ruFDlyVSlYJH5tmNIAzhyL6qYh/w==
X-Received: by 2002:a50:c004:: with SMTP id r4mr31989755edb.192.1620227981727;
        Wed, 05 May 2021 08:19:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 56/61] xserver-xorg: upgrade 1.20.10 -> 1.20.11
Date: Wed,  5 May 2021 17:18:45 +0200
Message-Id: <20210505151850.660512-56-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xserver-xorg/CVE-2021-3472.patch          | 43 -------------------
 ...org_1.20.10.bb => xserver-xorg_1.20.11.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.10.bb => xserver-xorg_1.20.11.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
deleted file mode 100644
index 5480f71871..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7aaf54a1884f71dc363f0b884e57bcb67407a6cd Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Sun, 21 Mar 2021 18:38:57 +0100
-Subject: [PATCH] Fix XChangeFeedbackControl() request underflow
-
-CVE-2021-3472 / ZDI-CAN-1259
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-CVE: CVE-2021-3472
-
-Reference to upstream patch:
-[https://gitlab.freedesktop.org/xorg/xserver/-/commit/7aaf54a1884f71dc363f0b884e57bcb67407a6cd]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- Xi/chgfctl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Xi/chgfctl.c b/Xi/chgfctl.c
-index 1de4da9..7a597e4 100644
---- a/Xi/chgfctl.c
-+++ b/Xi/chgfctl.c
-@@ -464,8 +464,11 @@ ProcXChangeFeedbackControl(ClientPtr client)
-         break;
-     case StringFeedbackClass:
-     {
--        xStringFeedbackCtl *f = ((xStringFeedbackCtl *) &stuff[1]);
-+        xStringFeedbackCtl *f;
- 
-+        REQUEST_AT_LEAST_EXTRA_SIZE(xChangeFeedbackControlReq,
-+                                    sizeof(xStringFeedbackCtl));
-+        f = ((xStringFeedbackCtl *) &stuff[1]);
-         if (client->swapped) {
-             if (len < bytes_to_int32(sizeof(xStringFeedbackCtl)))
-                 return BadLength;
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
index 755a762a73..1eb2056b8a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
@@ -7,9 +7,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
-           file://CVE-2021-3472.patch \
            "
-SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
+SRC_URI[sha256sum] = "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.31.1

