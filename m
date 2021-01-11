Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.27254.1610326010562921660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=myz0y2WM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id c79so9974075pfc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dOJBeFHykCJEPKOfHuS3tTwGPAJFqEn4BOybhE40O9M=;
        b=myz0y2WMHIk1ozz0/8bL4qyyyNkGn32amADqy5nyV94LA/zTfwj+kEaYTbwaZ9cemL
         1KTW5vTBEcSEuyWzGDYrUr8tu4CmcRLrPoR97xCwSrdhfMTml3Z1HC1jWKvsuAvQoeSb
         fV9kCkCaGJ3G7LPAyXWfKcXRkm4tQMLiBEH6S9nYWtJ+LpjkWzAR+LGhK9ICTCSn8516
         utao3KXWoR2rs3Ya34St8+W3WpwrUrsPTtUZwlpv0cjKKoSRHIML19v6dEU41ZZ4Aa6y
         qUHsVvJkt/jFY6SAb7NARDAb5AvJTfccz/X21Epl4RHLEXFKSXYQLtj90va/9ZtLOQc3
         4xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dOJBeFHykCJEPKOfHuS3tTwGPAJFqEn4BOybhE40O9M=;
        b=C0rC/Hc+egIrEm0l+kKiz/PEn5wAoX2PiuBzzcWqdzv7qps+rvbP32Igugm6Yg7ZR8
         fQZ4nwRFcxF6adM/xd7aVIus4eR6f53m4+I9ZH8N1/leEG/Eeb9g1U1mtoCYvfTMh0Vk
         7pbFktQJ5Jm7hrs64boFHqOFqGhwIa+JdFePdEkuxcNYXisqEyWrnPTVm8ZaAbYv/osY
         Gj9Fd1M4VpWLt9n2VdeMKaCiGwKSnNJmPVTv57ZBmsdNBn0PP1p3eGPokNo8h7T4G7MI
         ZwrohL6R5aSUN1EV2+0t0as+9Fk4pDZ/4QydqQ9dmvGxcPfOg5txhmWYl9blE8Uj0tn+
         HqXg==
X-Gm-Message-State: AOAM5319ahzim0F36fO9qlBOWP2ylreJg3o6yxrkYaX2Kt9TVlU2Noyc
	R/pYDxucXB5v3nUkcLmlvCbYvUsnt4+FH3BGXpU=
X-Google-Smtp-Source: ABdhPJzvnBadd7ht+mPzvbgPGx1DOU6JLox7wjIvCAZMqUFhMl/rWWdrgN59ZXOniSTIkx55/Qey1g==
X-Received: by 2002:a62:5b07:0:b029:1ae:177d:69e1 with SMTP id p7-20020a625b070000b02901ae177d69e1mr14028893pfb.25.1610326009455;
        Sun, 10 Jan 2021 16:46:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] mobile-broadband-provider-info: upgrade 20190618 ->20201225
Date: Sun, 10 Jan 2021 14:45:53 -1000
Message-Id: <72431ee8de5e3a53d259cebf420a7713ac9e1f14.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 812eb3121e0aabe4e3de9a8c61b1e62c87f55aa4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 0b0bbab168..7dccc15e03 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProvider
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "22b49d86fb7aded2c195a9d49e5924da696b3228"
-PV = "20190618"
+SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
+PV = "20201225"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
-- 
2.17.1

