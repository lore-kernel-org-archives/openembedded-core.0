Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.19491.1608974892077947005
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pd/CtMze;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id g20so8348937ejb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQI2kp0/wyLug2MHmVyR/OlNDO4IrPLpJAmPxksRmYw=;
        b=pd/CtMzeK7RTcJS+Cl6fP1+yrmSpkpkhSo4RUspaRbPdPS3KIH7dJqf47SiWgQ+yZl
         iR2pJGCvqeJIqMMRPIUa11e3byk9IgEiO/+J06HUWGDwWuImQgGqJPjI0+9liv2/Nx+2
         TyIGYxZ51aq4El+HKSI5EPO6r2+LCzUwQaMAYD1Zkhk49p55jol2evryd1nOtlsbCk1S
         c7P1jSdmbU4IA6Gm+tTdpowJLGbgWlsoAtCK5hIVHGPqUXsfjRnZ8PyeG1HqIhPbF3Yy
         QnjIM+ISRLIovc1rl9O5EMQos0h2YYlg/a/MJCWXKIuUD2xdun+j34WhOC+eoy1fMRob
         Nxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQI2kp0/wyLug2MHmVyR/OlNDO4IrPLpJAmPxksRmYw=;
        b=nzgp989pQuuZvdPNXYUntLRbFLkXfWeDn3/DAihB4Xsn/hOA761H2F9CR5HuWNx7/Q
         m8Cqxo2xp2HoOUc+NOtRB/DMAz3t2ICOtev+kGWEIpYIAiRZA3AoTr68IElLd6/Jk26/
         EDdxGEdJvEM+Qn8a28WwGrpax5vKplRa3ivzeapARwoQd3xN4H9fjNO0+kEEvQcDeanG
         QaD9VlbZZSgTKIHmJvgw9WkbQ48jozEhx8gGeAfvUboZtECkuvg8Hv+9MRvjzsS1NYUA
         f1WkngkuMafE96VwfAx6mDKQbvLNFucQrcfRQyY2dz5YY8virN+p/5H+RqEG+6/QcNNm
         MAVQ==
X-Gm-Message-State: AOAM533zrPgA9xPQ26Xid5qg4seFb3qxBZIHBMjTHmouECb2HVRonzN7
	HvLmxW7Vnso15Dg5TIaswDRWo6NNqAI=
X-Google-Smtp-Source: ABdhPJyNLEmYk9Yd3UeeuqLjn/yMr7BpYmmRMGv7AMeKTmAPSi0kJY0bc3sFygAeO8zdySqGvdj0eA==
X-Received: by 2002:a17:906:451:: with SMTP id e17mr33311458eja.228.1608974890738;
        Sat, 26 Dec 2020 01:28:10 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:10 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
Date: Sat, 26 Dec 2020 10:27:20 +0100
Message-Id: <20201226092732.52323-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../glib-2.0/{glib-2.0_2.66.2.bb => glib-2.0_2.66.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.66.2.bb => glib-2.0_2.66.4.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
index 01ed54d06a..70e8aa8785 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
@@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "ec390bed4e8dd0f89e918f385e8d4cfd7470b1ef7c1ce93ec5c4fc6e3c6a17c4"
+SRC_URI[sha256sum] = "97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.29.2

