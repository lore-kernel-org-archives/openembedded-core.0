Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.9778.1629636702560192832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hmF4/UXX;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so8987993wma.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpgCOJE6WMz1nC/EGzhsN+36jlVx5HB6qK6asDi0bPE=;
        b=hmF4/UXXcCX+VFM434d7rUUhOryOoDn8l1oMJnGMkhvSQwxW73EXbwFjN0HMaJiCOJ
         GUykmAa7uiMnEJVLYDE/okiini5mJ0ASj5L5+Xbbu4LWjcSTUfwf4cssQFbGiR/x0A3I
         SIBd9/UdBgpwY+JcSiMM6VGO8kZWLLrF2s37A1Nq63fob4ZxEUjrOCIrXplBQD6Z51VA
         JbkQQNkkt6iM3lUT3b66lF5nLUSl5M/FIyGLkeewiu5akoOTJdAhEP5eZy0eFQ8IB0OE
         2tDMoPQW8wsX8Xmb6EDmw70TG8i4TJdHiO4L1/YW0E+1B3CZ2JL2p4UNxti56455wQLr
         ycTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpgCOJE6WMz1nC/EGzhsN+36jlVx5HB6qK6asDi0bPE=;
        b=kwreG+bTm6R4HaVGogH9DYA7+3objAZD7punJX2oL6C/1wYN+BoWpQy+PSiUFnkRiU
         YYIqt4c0j0jKZ5YvVCmZhA0eK3OqpNN1dr3ib0MJH729KHDM/DLVJprzpzF10DVDEMEm
         lERwicRT471C/2W5W3jdl4hOKS8VJzQD7+i5ais3dgNjQeauZy5pccgtA/Hb2vGvazlf
         UVIBd6OUoBp1YDo2Ref/xbTtQRE+u7iufCx6aHiB9yUNsEuWjCkwLdH1+eP0dLLgCIW7
         GuPIC15Cezn/Q0kJrKuTioyu6WW65D95kXKZ5aDvokof8RgPHQbmXcxGd6Qe3QRxyyDS
         LstQ==
X-Gm-Message-State: AOAM530ETEdMXTosRmcXM7wSGPOSWSrGX1Q7y2ptXY7rC6kEeMKIk7zA
	zyVQKLZelLuwP7XLqxqvke0lK4+w1EC8vQ==
X-Google-Smtp-Source: ABdhPJycHwcnIgRHVJhTSfzzVOnwtqKCttLOxaqPOrSem0mlS0W+GAlKODFhL/czTK8OoPxwc2IlLg==
X-Received: by 2002:a05:600c:358c:: with SMTP id p12mr11662486wmq.173.1629636701231;
        Sun, 22 Aug 2021 05:51:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/55] libxft: upgrade 2.3.3 -> 2.3.4
Date: Sun, 22 Aug 2021 14:50:52 +0200
Message-Id: <20210822125103.310416-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxft_2.3.3.bb => libxft_2.3.4.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.3.bb => libxft_2.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb
index 9695afd625..12636914dd 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb
@@ -20,8 +20,7 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[md5sum] = "4a433c24627b4ff60a4dd403a0990796"
-SRC_URI[sha256sum] = "225c68e616dd29dbb27809e45e9eadf18e4d74c50be43020ef20015274529216"
+SRC_URI[sha256sum] = "57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd"
 
 XORG_PN = "libXft"
 
-- 
2.31.1

