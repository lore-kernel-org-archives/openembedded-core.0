Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.15615.1631124100854357273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y81altFs;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m9so4578635wrb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VyHJfShv+18OhWTYffTpLNgzPYCT4S64y0iKdze0wGU=;
        b=Y81altFsGxleHeO+oRvLEDakHWWGfGwSWeiX/OfIuDc925IwnSnVYxM1j46rCn/XQX
         Z+MBQStERHzH/wO/LURPQeLxOGfMhLGCsszjd7xOn7Br8mMnC/kfNXaL0q+LALs59OZQ
         5aHZvgzzFtEpDHzuakSfl5UvTfFcyJvmon3aHu7VcwOc9wIW6ySWDFpK+YFPYSTQhVdW
         HU52tgOHVvkJSUsQAMZxqaXTJyTICv5ZrMWoB7km2oXk6o4+msd1JlXgbG5slzk2fwKE
         7l/+CKR5mzX8T4nMwLkGfDiG/BOgtEN+4NbykLo4lR/UNgkxmqVIGO89CRYSVhgWpFf2
         6xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VyHJfShv+18OhWTYffTpLNgzPYCT4S64y0iKdze0wGU=;
        b=5+u6w98xrWuXxAzFDQG0RbPWofX6paWJHqeBFPw8rNgAxFKAi1R45tbv978BPrpSjo
         WppM2iZ+A4lSVi7vhmMBiBWVTnxyjtREeBg5ZSGxNvX89+wamX1yd+ZMAKHMtuTMy5/r
         KHMUJGulzxbRdMlyJkYPO8jpIM+vpfJZYr24ApGMI+9cUSWeI+RasrOjS40yubm6Or/b
         +uPORRyKAqHgdXiiuY5zPVdRW3sAO3SAxUcKA8x3y5/Z5YxRQbiUTP+NKpwhYGtNHDTu
         tJuGBJ7jfn69bExbPVLoi2vfXGcoo69K7LfLANEFEIgx1AM5bTeECifGJQkHWq7zmQHP
         Okbw==
X-Gm-Message-State: AOAM532GdqhiTpMtzvZF8+jfEQHnAg856vJghmJFUFe3MgAJ9HYPfmSn
	tqVI+EQMdDOIkKlUt2p2kyZB9OFnLyU=
X-Google-Smtp-Source: ABdhPJyZqOhmsh6ccuNfedRCC7+D6Q9Osmf8B3YluC/iXHiNzJ/ISEW1kBIijRl84ILS+9+6/jBHyQ==
X-Received: by 2002:adf:de09:: with SMTP id b9mr5451000wrm.114.1631124099536;
        Wed, 08 Sep 2021 11:01:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/26] shaderc: update 2021.1 -> 2021.2
Date: Wed,  8 Sep 2021 20:01:15 +0200
Message-Id: <20210908180125.103473-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../shaderc/{shaderc_2021.1.bb => shaderc_2021.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.1.bb => shaderc_2021.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.1.bb b/meta/recipes-graphics/shaderc/shaderc_2021.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2021.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.2.bb
index e15b5794ee..5d70b6a087 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "031a8c9715df5d7c69dcc1ee9d53cbfa35c7b026"
+SRCREV = "2c5ef1b8f8b1fdcbe1b22764e82d5caaa1d04ef9"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.31.1

