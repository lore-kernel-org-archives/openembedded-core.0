Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.29024.1620636973002923088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ccU9A2XG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so2021436wmq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uX/wgRIWRZURWEwXeJg9Laoudr+6Ava7p10+7DC2ALU=;
        b=ccU9A2XG1kmbNYZquPQGFSBTwnJNxu8coLEY51ivM1hx6xoyg8s+HaybmnU6dmwHzZ
         55R4lBJgn77LzfS/+TGP2ZfEMi2JOTKI50RnU/PDcMSu2U5CxXbHEx13+rEwvQk8oOIL
         LpN4utAJ4G/6E+pP+czs2EvXDqXXXymd2X4hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uX/wgRIWRZURWEwXeJg9Laoudr+6Ava7p10+7DC2ALU=;
        b=RqJ+gb/A8tDEcVIA6A3wNwoXuFAQT0fohRbHBFvDz9UZd57Om2+JbiN6jj099u9Ji+
         KYJxTCxJEsEOASaQ1AOfQrIrKeZ7vk8Zsbi5IFehFvy/RGf3wDphluuOye7jIWQ+CPsr
         CWQV84ACyK9AZxA2IIuKfFWNftAc82DOTvTE6n+zijV5ffrGZK8CwCZUreXXbnqRTuyC
         +JHSEkJEVmD/iEZp5RorxU61rUvy8hUt9q5caMPYauV7DqtBwNn46ZqwlfG75OT6JSlp
         R7vWrkU7zTFWfFDn8nfWzfN/zzLCTkdNuJH0z9FGweY2XkdI15o6BLUILw7hCR1NjiaI
         U9qQ==
X-Gm-Message-State: AOAM5300daRx8KrzrWuiSmSVL4dWDmVdzvsSMXkpgY9yOewZBGJzKWab
	5RA0Ftk8xxjbhkDaH/LI3aRVAkYczO18Xg==
X-Google-Smtp-Source: ABdhPJxP7L6GVHfORcytPwBpzGdx43B0EmOwtQ5AdN+22oomJRwx0WdIxOfzTgW+k1nycYXjWAxYnw==
X-Received: by 2002:a7b:c092:: with SMTP id r18mr21672860wmh.51.1620636971358;
        Mon, 10 May 2021 01:56:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id t23sm12597398wmj.31.2021.05.10.01.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:56:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: Upstream changed to main branch for development
Date: Mon, 10 May 2021 09:56:10 +0100
Message-Id: <20210510085610.2152829-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index f5e49a4ab2f..69c3faadcf9 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=93c2525113e094a4a744cf14d4de07e2"
 # gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
-- 
2.30.2

