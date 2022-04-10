Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3F9C47080
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.20024.1649614046788654404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 11:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZz1B8E1;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t6so5697043plg.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiEPBFOC4kMbf5q7Nce+MAVN3htJVOunDN5l/1eNcAo=;
        b=VZz1B8E1FHoPXXjq5l9U5Z4U331PSlBqS/AlEzpl1aUrI8v7Ws5AuWAfAqWj7V1fVJ
         LgMfGwdKhrGpvWRV3dQ1Em6qUDLdwJPJuzzFwiXPA3BJMiMrFycFn8SQOD+9pG9CvANz
         vGUpk4bUXycUdwtc9dTb2R+RYjCbrtifSrEnpnU2/G7tV/sDkx2Wm6IP0NoLaLZp8okD
         YlUEXIrN04FuqfVXzHqWOlV/+z9U6RC+65c2SyebyXKHl2eM3hBXedHkkG/AqGyTFrNR
         UDKAdwn1zBh4bpkBjvJYNLpZYi5qx2dy9MXI4u3eSQ43lFcGPxNmvPjsAeN2ZHjpwEu5
         ABiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiEPBFOC4kMbf5q7Nce+MAVN3htJVOunDN5l/1eNcAo=;
        b=UH2gM10ugkNGcyak+DBQbLrbHUgNHMmApKyT5dFJ8Qpemezuj6EZdlFZFdp2gyWvEi
         NxWoxfDz2hu8gZFI6Jts9nPbUaw4482AEeCYRk5cHTWLY+lN81fpSIMsAwpEaO6bI3qr
         usuMQceWzsfUUEV+GvicxHvImBR9wutY30r9XUB91MVFRIUSN5DxifHCYwcFxLayJDKh
         TEygqkGT09JDQsw1rKFvP7+NQEpRGWKE6cWkEOk828U406kxy39gaf8wM5IbCTakYXLR
         9aniGpzvzUvYVfYVtSOY913w+P1XQm8bF6Cb/EMAzYAwmTKSYcs9L5lIax02CKfb8oOS
         ZTdQ==
X-Gm-Message-State: AOAM533TFgb8CDYq3jvzOYhFLWaCRv0n5+EnlZOorGoMsh+/58VRNs4Q
	rIe7nVOLE6zsJGGf3fJ/1HgzZIIGly1iYA==
X-Google-Smtp-Source: 
 ABdhPJyZqaVZ83E0EVbgir0/1dFLVsRGimX18ldHmISC9XtPVh/FviYHnrZQ7RoL68qmI9uC6ZK9fQ==
X-Received: by 2002:a17:902:e889:b0:157:dd6:4621 with SMTP id
 w9-20020a170902e88900b001570dd64621mr16928456plg.17.1649614046011;
        Sun, 10 Apr 2022 11:07:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a17090a31cf00b001cb7c80616esm2823386pjf.57.2022.04.10.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 11:07:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] pango: Upgrade to 1.50.6
Date: Sun, 10 Apr 2022 11:07:21 -0700
Message-Id: <20220410180721.1101347-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410180721.1101347-1-raj.khem@gmail.com>
References: <20220410180721.1101347-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164206

Changes in this release [1]

[1] https://github.com/GNOME/pango/commit/37a427018c92a2bc679ef104097e07a619609c9c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.4.bb
rename to meta/recipes-graphics/pango/pango_1.50.6.bb
index 0ea621bf670..b1b9054234d 100644
--- a/meta/recipes-graphics/pango/pango_1.50.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
+SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.35.1


