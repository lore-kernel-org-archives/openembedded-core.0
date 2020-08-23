Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.181000.1598214082965010019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VrOkFi/f;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k25so6233563edj.13
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEZinS7+svdxExxMkBnZ03wJidul4nky1aDCKlgfcPs=;
        b=VrOkFi/fXKZb/8UBFqCydFWfe2SkVvoyMXtS+HB6B03+WJe6fH0rYGogav+PslS/2C
         cW8EX3a5qpdsI1Q2jg9/5nAAMBlsS8y0+PDxWMgDTNF6nmmyGB/GH1c6Vdnv/XRq05Bs
         03EEXUiL2ZlgiFN7aexkd74NGqjkV5I0C7TPxPQ1YcOvC5eYOatKgQq0SY3fRvMd2tE3
         BE+Kq/ze2gzYlxV1WS3HLunCoxeHmUTqZ51ZzxwRpjEb7dYI3qbv1fsPviaeM46GCOk0
         5YSKwDc1mIEi0N0rvfQhphD7Yx5W0CjkypUsZon7Xdry3d+DqCA5nZUOI9+EDfnhtlYw
         v2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEZinS7+svdxExxMkBnZ03wJidul4nky1aDCKlgfcPs=;
        b=uQ6dvziEsXTR2lOeNc8Wp3wF54AAbdpmD7asHvBvXF5yeBHH8LyOOf4xlO9s14u5uH
         L7L752YWwcA2kR60cEmpjfyJNunYXbyIiohEHXFJ/EkWGUrS/6it1raLSg1Itfs1dqW0
         1yKpCJEKXDktKOlGofLC9Y7XxHOnYnOYfFIBRt2Ei3AjAxc800jun6Ta90AFVpGXDmhP
         5z+102JgmIdDPt4dOZA8hLRBTrUqdNSshSllw0HznuIBKFga66ET21Edmk4F5exHxa6l
         Zaf6uZGxBkn1CN8RETC0VdYkxPyAFftrkghEfRdtNLHvH61BCm+7YchMpmte2HX4mSHw
         ZGqw==
X-Gm-Message-State: AOAM530I8GfoO0d+x4JUNzjyqvty5g3hTh8vzTIpXWEDEWo1spsA6bIq
	lFdzgQ9huaovemO2cV6KIT+RKiFvhrE=
X-Google-Smtp-Source: ABdhPJwXff7PcTGAvQsdy6yFUzMXyrYOq3blJI5XkhnuomkGLiqe3LHGmPdoBuNgU7RlItZRzKuf4w==
X-Received: by 2002:a50:fd83:: with SMTP id o3mr2543533edt.281.1598214081251;
        Sun, 23 Aug 2020 13:21:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/37] libx11: upgrade 1.6.9 -> 1.6.11
Date: Sun, 23 Aug 2020 22:20:11 +0200
Message-Id: <20200823202031.24686-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libx11_1.6.9.bb => libx11_1.6.11.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.9.bb => libx11_1.6.11.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
index ff60a4240c..da47a6d9ec 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
@@ -14,8 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
             file://libx11-whitespace.patch"
 
-SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-SRC_URI[sha256sum] = "9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1"
+SRC_URI[sha256sum] = "b1cc4b802058be7e3fb438ee2490f66fcc52ac3b2a14f47a22cbf77638e33606"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.28.0

