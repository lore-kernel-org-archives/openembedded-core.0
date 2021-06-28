Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.16028.1624907345427797419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n8/ID7ks;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m18so22541453wrv.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IVvLQO0a34Dn6S1fhsZGWsVsEst3ntfJAj7vg+LL6YI=;
        b=n8/ID7ksX9vDMpEcilO7aBCuhA0288jinsxE22J6Z/6Fd7R5dwsl0y6EOSQisW5p2z
         HH7J8CDkbJRPPP8dzdRxIvhdO+bdAv2NnzlOyWOGJwckradSSo+jtzBmEhdj2Z5Pi1B+
         /Aa2MtG2VqxPGTLSASVO8g7WLd66Hywz6bVDIoCqwEjDxkW3lm8YGRikinOw73sGDlZP
         bBnzpSGYFvHpJjQFUvuLoQqXwl1G0Y7vNkIDsCeqgZtj4Xn/aWwcgu9dHuDVJEVgPcY9
         IRpx3X9oifr15cePQMi54jUynNQBTecUAPbeSR1wqepvFZhpM726klNZ/7N8lFdfgGto
         l1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVvLQO0a34Dn6S1fhsZGWsVsEst3ntfJAj7vg+LL6YI=;
        b=sgeB01ZYWpL0tqNP+1HcFFX5dBvHtbE3NsnfnuvjxaKuw1eAPpCbAljnhQ/tACsgOg
         4lIzhHPQYet8QLtlpiyKGftt/Z4qNK1cEydsYuq+8eH5bY83FrwhgVbnq8DtoIJ1VUrp
         DX3flAm2VkkUttXdq3z3P3N5w16FQjaSvchWf13vYwmrrW71HBxpNWSNGDoKl33Q6yV6
         cz9mnb9YOKMnMnrNYQhJ3ec/4sL/soTt5TgxFrjKJ0Xr8LZ5oeZKlAF8717ZNi378LiJ
         UQzimo8RNwByY+obfb+LUzYnvCyNH+KsUedkJ7qUSVAQFlmH+hQ/F0WUDOuEyWmvoLLC
         xpBw==
X-Gm-Message-State: AOAM533G5L6cPWCkI9eodkSxL8Ezgyg2LC9OXgNN2Rz4wwBQdnfmAEQ6
	AEYH6tZ6xp7nsgD3tMEaEGBEDcxUfB0XEw==
X-Google-Smtp-Source: ABdhPJzuCw2c50YoTgEd+0FnBdxufT8ECzaNYgN2snqNEO1cPWtFfc7kSZmIfNKXUxoQDFzwwrY/Mw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr29850922wrm.40.1624907343878;
        Mon, 28 Jun 2021 12:09:03 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id l12sm16009527wro.32.2021.06.28.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 12:09:03 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] shaderc: upgrade 2021.0 -> 2021.1
Date: Mon, 28 Jun 2021 20:08:55 +0100
Message-Id: <20210628190855.821421-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628190855.821421-1-quaresma.jose@gmail.com>
References: <20210628190855.821421-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../shaderc/{shaderc_2021.0.bb => shaderc_2021.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.0.bb => shaderc_2021.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.0.bb b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2021.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.1.bb
index 3d59e0c38c..e15b5794ee 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "1a3e2aaab191f44644e899e29ab7bac50bebdeb8"
+SRCREV = "031a8c9715df5d7c69dcc1ee9d53cbfa35c7b026"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.32.0

