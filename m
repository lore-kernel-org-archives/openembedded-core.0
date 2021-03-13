Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.2769.1615661466321598089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FzRWq4Nr;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id y131so27542854oia.8
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/qJN/dkua4RdmpM1yE1l+CdiqkpyM0ctPBG9DUXP/8Y=;
        b=FzRWq4Nrvx+ORpBCRDQdpybgYz7HwdrZTOgtosdUIXGT4kNfxVH92V3WO4hpKyUNG+
         z8QsmpK4FXAYikEwg6VNaM9cBYejsMRStqUQG+QpNXjJn7uzqMD8+CFb2nsaTYcFQgqM
         V+kW1ol/yB1XKfEDbieY/aupWgs1GINbmCVZu5EQck/iSYXPXadmClnZ7gzJxoCTezFa
         rTS9QsUtbwXCnKfpvkpI0uNiIsbfQb7HzNPgkIT4JxiXFEi0ug1b7IAH8VIVEhzDxUrJ
         4FHYKUEIZyC1jk3bvXeTpbpeI2KAWnQ2QbiCzX5yld9i/uEpp5Gqgw2K3RyxjXDsF0SG
         lt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/qJN/dkua4RdmpM1yE1l+CdiqkpyM0ctPBG9DUXP/8Y=;
        b=PBpL0UxezqZqD9vgptp0OnaDglWYbfND+fOQoYe8c+YBUuczEv9P6kNAtfB0/uWDNl
         7Ll812S6JWQl7ddw3BxvHip0MCD6Cte5Z2xrOA1Oml9ayjiF6rFyL1FzTjtxsD0DoDLe
         y5xonqkwZS8BSs41Jf6StjM+9PhZj1P5nrs4M6+NUooBmJ/M0Wuqm2YtKpjEqO//DlD2
         8hNy7d+KjB0w30yBX7/IskIIT2T8kXUAPFwzwH9rkyPjh4yu+tabnqzfic4VhNoyEMzW
         +8WPDvbYFpGL+sIukpMnrTLabiFCLa4eY5E3pCg7kMzR0CdlLmo4IR166fC2VozsVP/E
         EEnw==
X-Gm-Message-State: AOAM533OeG1bSi9yBKGsRp6V+3eiiUIqSUr8bC+4sPnSeCdRdxIWPB5m
	mnbnloFYk87c1QYJGDDN2C1g+yuN5YAKLlRp
X-Google-Smtp-Source: ABdhPJxqsmZyET13y0nLV/grqgYRz2rTcT/PV5B59TXA7WFSvJbX421XieKvX2UMOFDll/SBI9xAGw==
X-Received: by 2002:aca:4c0f:: with SMTP id z15mr13910524oia.44.1615661465223;
        Sat, 13 Mar 2021 10:51:05 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/38] meta/recipes-rt: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:03 -1000
Message-Id: <3bb03e124b956310674845b5e1a4f755a8456ce7.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95a86ac1c12414c1b4983880145aec55bd9a38a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
index dad252b4ed..1db86b5067 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Real-Time preemption testcases"
-HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
+HOMEPAGE = "https://wiki.linuxfoundation.org/realtime/documentation/start"
+DESCRIPTION = "The main aim of the PREEMPT_RT patch is to minimize the amount of kernel code that is non-preemptible Therefore several substitution mechanisms and new mechanisms are implemented."
 SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc"
 LICENSE = "GPLv2 & GPLv2+"
-- 
2.25.1

