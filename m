Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.9686.1603981713494766474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OAG3Dll7;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p22so52370wmg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyIVU2Z69UUkH8LYb7gp44hD4qz/cz6QvTqoo0pw3Wc=;
        b=OAG3Dll7/OBcU4jol1oZkBqifJPaIRP6k49O3QVlAB79/MZIs1bp0OAgZlx8LiVgCP
         HIPLBJPpljpWgiMa7veUMWhOrSMEfFjCCaB6QOx/+HBbBS+xaVuT/4XnTb60x5kw0+v2
         +r4JJ0gtJUximCBGcgT75fnMZo9APDMZ26t95PNxk9uawtumqLzFdDEormhkpnX17TJX
         YzDC/7l2yKJT/gEbQIbhLearTBTgFiFNgWHc88oUQx4dmnYoX9tBf/HcQxcrqntgO8Yq
         ZFACxXjAFGW9wJ3SylPOPs2KzCZr2rSnTqzWVW1xUMM8HPmMFljm86fPHTzZTw6nN6mt
         IAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tyIVU2Z69UUkH8LYb7gp44hD4qz/cz6QvTqoo0pw3Wc=;
        b=tQcHiO3V5tHFI6G+ZiTT+AJbIcQL2NmILK7/d0+QDGbcXAk7w5Ib+s0YzaZ1Avtpx+
         VWPvWEorFmicm1IxlE22SX9g9EQHMWcePVmZ0ZW20CWAvc1vYcXHSGWUrh1CXZCKMOHg
         3MLkLmXpeageeCz9Mo/+74zr+0Jx2rfc3mn8qEtnxAYNixsR4jelncYcw+Wj74KMx51p
         hR49xX02TPCcxnCY/Ov/2+jW1Ugf401Ij3ydfpRrcb3ZCreEflbdUVJHROHxKZsvhGOG
         kAxtxhcFCfJPdrYgzEAeFuUIXlVTMVV8hgDueREJgk7uX/9Wtk+5lHanWKEZtuVaMe0I
         PBOQ==
X-Gm-Message-State: AOAM530ZJwEmb8Izy12ZNTp0ZGR9W6oZkrK3L6pCkYBBRj7+OobDX9aZ
	S5N9/o9sD2zv/e6HYAmC9w/A+UY5me+ERA==
X-Google-Smtp-Source: ABdhPJwu2jTV4aGcH+7rU02LkTUSVhBUH7ZDrham06126U+YQVGA3jqQzuklPHtCxxeL4XccoVwtgw==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr72999wmk.65.1603981711569;
        Thu, 29 Oct 2020 07:28:31 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:31 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 20/22] orc: Upgrade 0.4.31 -> 0.4.32
Date: Thu, 29 Oct 2020 14:28:04 +0000
Message-Id: <20201029142806.1830504-21-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.31.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
similarity index 86%
rename from meta/recipes-devtools/orc/orc_0.4.31.bb
rename to meta/recipes-devtools/orc/orc_0.4.32.bb
index cd4dc31d70..a55b43b8ef 100644
--- a/meta/recipes-devtools/orc/orc_0.4.31.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
-SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
+SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.29.1

