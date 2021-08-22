Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9674.1629636680277276119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L2z9Jzzu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so12165225wme.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8ydd//lfFLfPVzdnWGXla6vvBK4yXSJOm+5X+ks16Q=;
        b=L2z9JzzumrhRAO1FFBoGRnBhkhFnkuEZwgxknWkNJ9cIKN7/g/lQjLaBLuTnYqyxCA
         2asOpsRSbCLTX2vyj91n8BvbSnwWWT37HmM1NzGop53aPZwdA3l9imRfQUsk/8BwLacx
         ADu3a5Dwoi+CFVriB0A+C94i9iRH0Sgi7OnAKJeYYb/UtDR1e+1vV1EhRhM1BIDawdCv
         H8o9WDxyWXPMZN7ukR2TXnNSHCQY6Z+vduzKSKmlXdgqb2KvAwKgmq+50+9y0DX3ZeJP
         BjHsdQy5g2jgXnZy6PfYP0ykc9gUN7c7IHlYxYQCAsuDifkM5MmI1+8D5++e52gA/cQe
         qUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8ydd//lfFLfPVzdnWGXla6vvBK4yXSJOm+5X+ks16Q=;
        b=ExMEIMUyl24Ia9KL2DMd85xPcUR7NIrmEIVS8My8B054azTDusrvbNNCpHG/8EsFQm
         h3BXDvP5BboUERTdC43fbH9OIFFqiyGqQ1TWad1B4i7qDGE1K/FZAt8DdXgdvktVD72+
         NoChUzLXopbqxl55A3d5SlnGWFM/f+eIuFDC8M+9oz8KLaGrhK43gUCydxWdunsiRkad
         6pazialHlx6wiLD0s8MjE3AKamDt145H1Uso5pQQMwmXKMtgdfS0wGZVM725l7xsQ4Ip
         z+crA/JplQ7Ugl60/d5+AN6WPYg1oMkOwPIJx5wbUZ7zbrxFgCtTATA5v7fvQ3mxN/Lc
         zx5w==
X-Gm-Message-State: AOAM5328yJjShQRw9DxbpURGYCqZzSrSB7W5tVwnUEYBQ5NcvEcxJHM7
	Co9J9kZkleFn3eBBBaKpcKiI+fVGXiQT8w==
X-Google-Smtp-Source: ABdhPJw4QEh96XITEMbFaS4SqAATge66TSETVd7ugLdobol0mn344YX1uWwe9hg8BwaqxvW4oeY+Cg==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr11727866wmh.56.1629636678940;
        Sun, 22 Aug 2021 05:51:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/55] libsdl2: update 2.0.14 -> 2.0.16
Date: Sun, 22 Aug 2021 14:50:20 +0200
Message-Id: <20210822125103.310416-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsdl2/{libsdl2_2.0.14.bb => libsdl2_2.0.16.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.14.bb => libsdl2_2.0.16.bb} (95%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
similarity index 95%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
index 86b2fc1b7b..bd7dea275e 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=2d4af6adb4d89aad0cdedbcc18c9a32f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=095c2687a3c3908e26984eaa8ec2d770"
 
 # arm-neon adds MIT license
 LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& MIT', '', d)}"
@@ -22,7 +22,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc"
+SRC_URI[sha256sum] = "65be9ff6004034b5b2ce9927b5a4db1814930f169c4b2dae0a1e4697075f287b"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
-- 
2.31.1

