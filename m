Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16257.1590337478916304396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 09:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cd/Q1IAY;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id q2so18224043ljm.10
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+dKHmkR4G++OYuVAI2gPEGP3kmxPTMWUdG2/0wpoqU=;
        b=cd/Q1IAYNriuZIsK/8e9xMwN/3SwTbWY54qw5rbo8g3WmuIWKOuTLw1jfKvNBxAHIg
         zOTq283FMrHVACabNF9SIO0QkZMYhjuHT11l2JL5bsOecv75dlrtYGSsC1nl0YZJau3d
         QgcqQZo6em5Mxl8QgP/wOzCvDGBKgVd+akoVjgeqYDVLB+Fg/KpTJ8Yy4tgnYWyMWyt5
         hb4gs9XOj5Uzaj383kNOuiL329OEbxwuLKJlPYlfuXyGDAiVGzj7bTHtVKeQ1xu26C2W
         rJdPzudI3wS4VL/SswpJrn3EWnZkuBujllG7CPrxOuTFzUlqIRlRCFigBz9h+gmt99ci
         6cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+dKHmkR4G++OYuVAI2gPEGP3kmxPTMWUdG2/0wpoqU=;
        b=ChLAZiOzVhtuZdYaAGvFNDvpFMsXw3YYkjVCsGetnBZ5AOCvozYDRrwpvThqmC590n
         pkoykm7m6gMzZA2I3SEc1T2BT0n5fJeaBosUC80DbTmojlLxi4AjTtf4qGe/InXyf2sk
         OiXGCS+U3CQ5ap56BkgDiceebtBF2sZR0V7g96vWFEq2KTiWRrQ7Tw336kek+V5W4cj9
         8Vuh2X08F4/0Cp/EoMVASIKKKbHgYo5dDVF3UjvCYcbOQHTR55zOjp13bBbnkIO16Ypi
         iVkgpw16z+Rl2NTewrPUnqah+mpCb1/icfbMDjxSHt/BX1/7LTz0MJsDUzY6G7MFGfAE
         0Agw==
X-Gm-Message-State: AOAM530WW+Ol95Jzj1cucmImM0F+1aoyJzQlkdIU2BWmqSdnrE6RtcuM
	oVQ3PP6SviG2wkFkGYUhIRhqj4Id
X-Google-Smtp-Source: ABdhPJzU2SWDO9zIQi0Oq+Vyv78IZMp8ab9xC18vvi2UvUrWrDry4YHJ4PZMgrI/AzGyQ/m/JTClmQ==
X-Received: by 2002:a2e:9dd5:: with SMTP id x21mr10523992ljj.426.1590337477108;
        Sun, 24 May 2020 09:24:37 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id c69sm3983490lfg.23.2020.05.24.09.24.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 09:24:36 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH] at-spi2-atk: dont inherit features_check
Date: Sun, 24 May 2020 18:25:28 +0200
Message-Id: <20200524162528.23693-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

In commit be18dabd:
[ at-spi2: Make X11 support truly optional ]

REQUIRED_DISTRO_FEATURES was dropped, so it does not have to inherit
features_check.bbclass.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.34.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
index 107d312d14..02a4d4712c 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.sha256sum] = "901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216f
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase features_check upstream-version-is-even
+inherit gnomebase upstream-version-is-even
 
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
-- 
2.26.2

