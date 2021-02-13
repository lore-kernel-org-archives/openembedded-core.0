Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.690.1613176138656048745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BwSxd6+L;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id z21so713342pgj.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M1gsLOUklccmjzpQKrDAHXAjB74qjaQ/ODOC3WxM7VM=;
        b=BwSxd6+Lh1Mokn2/L4rNXnTXbCWFctVDzoPikIbBI8bOHe6MG8YZ4Er0jOzGjQOBG0
         nSFYyhDqFcILxdeJMvzC8Y3Yl++YRZm/CuZCBKWPGFtx+I1hM/D6Q15ISB+Aj3l6vsLl
         VoaYrH1Y6W0qqxVwsAeD0t6q3E0nRdKu7vmpalbkRIvX472wT/NGD/ppLnOeg/0Rq23c
         ED29L21HfzuecS6+oKS+n12+PpaIvLsTfl4L6DvLN1X0AhwmTnBO130loXc4aei8qPCZ
         MMV0NSg21qPO5P1ri3b5D66tXfWETE6S+AtJQwsR6Jqm5flNl6+rylvMEHpMkP3FxFgv
         RnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M1gsLOUklccmjzpQKrDAHXAjB74qjaQ/ODOC3WxM7VM=;
        b=GSqLwd9yw81Aa4Bh+Ib1DaeNH++kP95Mx/UniLYOxbcY9S/CzCwu4KboWKCyqC+Zaq
         yPziMtxMvJJRTpeLtOpGrXg+1oRtDymoJ04dje1Dc4DXAyfNKQUiqyPNsdlNEaNgPXdp
         14yD3FpY+F5xmt2FgM5vMfHRhE7jwWmxd1PxI5X5OBvp2DGnkP0cbATFrWeKMLofl2fW
         oAmfZghW3HwX/UwHN2QBdIVuP07LuPbjDIDS+JWgwJ4Pzk4z5Jc5uOIux3t+sTexuRlN
         9gneZqUz7RsivWI5moCquEGRB6JdmPnFaOZ5eIFzYE59dIPWRc/pQ4a+uWIzmv1pDw6O
         OgBQ==
X-Gm-Message-State: AOAM532whchnQuFX/eJWQ2CwHyN/pgzENmEU95ADqcgTOrekmUwO6skQ
	xRJRYkkjLY+3V2VK+r3fyiYIUKkn/wGyXA==
X-Google-Smtp-Source: ABdhPJx/pu/tjfXD1ZQuxDiOboD91+UP7SM55ZnLtkBRMmK8r8FG0GdddMxv2GeRYdOnHIJoL1w2qg==
X-Received: by 2002:aa7:9018:0:b029:1d9:55d7:1ffc with SMTP id m24-20020aa790180000b02901d955d71ffcmr5177550pfo.71.1613176137975;
        Fri, 12 Feb 2021 16:28:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:55f8:e3c0:af8d:902c])
        by smtp.gmail.com with ESMTPSA id q18sm10875487pfg.72.2021.02.12.16.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:28:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] connman: update to 1.39
Date: Fri, 12 Feb 2021 16:28:55 -0800
Message-Id: <20210213002855.24536-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210213002855.24536-1-akuster808@gmail.com>
References: <20210213002855.24536-1-akuster808@gmail.com>

From: akuster <akuster808@gmail.com>

Bug fix only and includes two security fixes:

CVE-2021-26675
CVE-2021-26676

Changelog:
- Fix issue with scanning state synchronization and iwd.
- Fix issue with invalid key with 4-way handshake offloading.
- Fix issue with DNS proxy length checks to prevent buffer overflow.
- Fix issue with DHCP leaking stack data via uninitialized variable.

[Yocto #14231]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb20fd47d738f469f7bbeb4b8d85040f9163722b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 1ec530801ae62bddeaa434d792ed9c2640f9eebe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9af..df42e9ffb8 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.17.1

