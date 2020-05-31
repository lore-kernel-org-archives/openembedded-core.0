Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.17628.1590940457609044197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvTFEosb;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id n24so6894569ejd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yBgdJE7WuvntsInEggUOVP2aV1190hjxR3ZGf3K975U=;
        b=BvTFEosbqowLZNWxb/FJ9VpG7XKZpiZI2kLK8psRuJK9EX8jfH5QTTDSruBV3kB1xw
         dA70j7wbRb0JwSNdYRBJ4rWFF6ZOVVBOR3n9WNv9vNXrE/oUmauGA2oLnIXTjBmdAgV/
         +GAG2nFuoFuyNmcvMxSp3OPxr4CvFc+uWGYvu0dc1N185e2KgRxIJPCCnCIIvOwGyKGk
         HwkKSc3LLX7rF3p9c4i/ihIOm8ZQHOj7HhLSBGRIvt/HLS3kQS7Kf9t1d0tRfjDfliqn
         aEOKtf47qhORX1fRBs87fdWB5FYAVU56qeX9G03yc92SuHtVHe80bBVJhWb9ApWwJI1S
         o8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBgdJE7WuvntsInEggUOVP2aV1190hjxR3ZGf3K975U=;
        b=I8arh4ZR0qlrFbdOTZDJwaEUG27tRL6XRr5CRdFMpxNLLAKtsQB1YmzsXcEkjPtVia
         lHbElAQ37LlWrQymzkH72yCA2qK7e2h1E28po0/wirgXxIErIB57dEQgipf3GIViqZ1h
         m2Xy/5ufjqVik0MvVSzsZGNRAaOJyHCKI0PVyTJm1ncjFN3ABGa7FudWKifEbLoSnUky
         RBsXXB4JcHKHw52Iw+zlcInCwmYvcgcrcPMySSpdus0LqvFCHhMIX+h9R/IRIXOh5jKB
         hBtZztMTwu4bTJHqu66bdYMwZsA50tFFPv1HYdovjeSTm0qJfUyebklJdGeG/4rfVF5q
         t/0g==
X-Gm-Message-State: AOAM531+Fj4ZUqheCVepXFXP204Qq9PANDqGaKAXiiX9OJjs1OsbDitC
	qb+Ew+bdtG/e1IWduYnU8iiGxQPW
X-Google-Smtp-Source: ABdhPJwxebNCNOwr2CqEjleqlfNBm8q4IMzh8MAEvQEZiQFrjHWAMRhv4Ne2VeFMZ8qgBxYgsoa+ww==
X-Received: by 2002:a17:906:aad8:: with SMTP id kt24mr14263899ejb.527.1590940455939;
        Sun, 31 May 2020 08:54:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 55/70] gnu-config: update to latest revision
Date: Sun, 31 May 2020 17:52:39 +0200
Message-Id: <20200531155254.10283-55-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 48b7e6d4a6..9d1874c7bc 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "5256817ace8493502ec88501a19e4051c2e220b0"
-PV = "20200117+git${SRCPV}"
+SRCREV = "e78c96e5288993aaea3ec44e5c6ee755c668da79"
+PV = "20200515+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.26.2

