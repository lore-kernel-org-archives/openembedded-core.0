Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.6514.1601503955673614677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EZ11/B7J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id z19so2326865pfn.8
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Z3WQ6bqfg08kL5vd2yjM//iFQ0GcRVWho7vtjdv/ARQ=;
        b=EZ11/B7Jl2YoLrDjX0EoN0QO+5Qk5R68T4HCR/CP9ebBX3WBSUxJhIsnY803r/Xkzk
         MXd4fSfy/7Ltl5joL3Ff+CYTrfvncqGdQOYZ0/t9k+lFVcQZRYsMw4IuuJ27LAA+mx7v
         uGDYY2L4m6HGO8w5DWGoQJx4iqTx5pYK66E3vttvhfIn+di/EFYDNukIxZNnw1/dl3D2
         Xqadk4C7VBylUK9Tb2EoYhosQDqw7+uYs7dX9tVf1toTaFm0C3wJmQ/4KFGcDkFkEIKZ
         8gfGMQjyaMOMFhHfOV/Goh569zaMA9KzwWUoonXZrwI6u9CwqqrG1NUAf9rcQf/5Zipr
         /nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Z3WQ6bqfg08kL5vd2yjM//iFQ0GcRVWho7vtjdv/ARQ=;
        b=LbTbfYsDiy2FbnsaOdRURJjsGvvvUiiHATkcQL2rd2/OC9THuLPeLacgWzLT/CBTNK
         zbe82LIf4hlM+NlKdvjXryTPyN/KIasVeCE8YHs/hxqL6dg/yN/b1YufMIid7KKtjPnd
         CRQqOVCxDYhCwMBXkqEtlUHP3BTGIO5V90ZPJyjuPvWi/1kvOsRuYEE2mGNAqByXk8PB
         D0+oLGehIv4jM0SbfWYDhl6tL4aeGmhOLnp4AFEipGytEIeQ5lWFveHSiv+nD/czwLlW
         /iWPMPgJFuWqmXBt1HeU5B1O1hHqydqTDNBDrODjo7hiyu4yoF9WfJBU5BKwyz2TYSv+
         SP+g==
X-Gm-Message-State: AOAM5311aHymYWWqGr2zwHaeGfxusEU8QB1vQ/SbgW8+K6fzNz1GBr0Q
	6Rll6VphrBiDa26bEmUblCiY/KJWsfTcRbuGDOg=
X-Google-Smtp-Source: ABdhPJxO8Q7oWYDDtFMhUXrmjqmTT5uN+iABkcfA/KmGAqJjFzIyn3CERfKSemVtdeDuhYk3BWhNHg==
X-Received: by 2002:aa7:9850:0:b029:142:2501:34f0 with SMTP id n16-20020aa798500000b0290142250134f0mr4109377pfq.73.1601503954005;
        Wed, 30 Sep 2020 15:12:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/41] sato-screenshot: improve .la removal
Date: Wed, 30 Sep 2020 12:11:15 -1000
Message-Id: <07910054c75a084dcfb10c86c1bf69b68989f587.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Don't assume that the .la files are installed, because some libtool
alternatives don't install these.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e545ae3a7961111ceb4e2a468e9ec53cebfed721)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index f6dac2cf88..2b1f513f1c 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig features_check
 FILES_${PN} += "${libdir}/matchbox-panel/*.so"
 
 do_install_append () {
-	rm ${D}${libdir}/matchbox-panel/*.la
+	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
 
 # The matchbox-panel-2 requires x11 in DISTRO_FEATURES
-- 
2.17.1

