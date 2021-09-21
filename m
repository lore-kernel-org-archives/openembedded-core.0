Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.5415.1632217125375562006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 02:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8eJoGUS;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id w29so37231032wra.8
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1w8w+5Ob+DVzCZuqEkxjwmuAlVDG9HfNKrfYPtBMFHg=;
        b=H8eJoGUSjpj8kVSIGN9s4plPs5Yukk9lq/DzFFuZt+ElAjzP9vY6nAzrwNl3jhoOrd
         /Hp6AW0O/0sZWZTwEi1uTOYKm8GiyMTbi+fyQXOeoYxxp7zOAMsr/OKgiK/icczHEogp
         9Vh3lPNwcIGZ8dmMj5awkLgPcd4DgaKl53SvO/RrELuuDKIHfmb6UfHqIt0BP9FsAJ11
         i1GuJnDiqTHRK4/1rdkTpAK1C9eGkMG8lywEH59duW5WOlSxKa7z8Fc5Db2Pd1MAqkg0
         WiAGAPIPwioqLcuTxI0wGj40rFkcdHuV/D5jKwcmCjJE605o/hhyej177mb9PO7/1Jg0
         aZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1w8w+5Ob+DVzCZuqEkxjwmuAlVDG9HfNKrfYPtBMFHg=;
        b=qqb2amRIpXcI/5bSRgTZsqqk54rkv7NbqTotrSG6rl6vAFSz4t0p1KK8s4stCDevx7
         Frx114rHrs++TvuLAC1/n/xMEVLxt2jVDnxQS4iuCmNywQFyyEuQu6dT2O87cemIlKN6
         D1ySG+C7GDjPR6RK0RGQxD69CciDc0bhZRhAcARj8yANkTrd8VCk3sfmeStfxVUiYQGZ
         iHyGrjPlcznE23EIu9dlC8cSs05P48O4ltTixawpFwuIlFpUrnpIzzw5Mp/LGlRufWWF
         AKAUWR5R6H4mNhil2moYbkrLuEvrbON79Oaz5Lw+JnFt7s0JWMElIKpwyNuRZZi4yePD
         Pfcw==
X-Gm-Message-State: AOAM53290zt2tk1viy//9Hh4r1YKYkM/06PjKx06TqP6rE8pEKAAecOO
	xYuzJF2H8V/isaITC8YY+iUF41JKuP1UJw==
X-Google-Smtp-Source: ABdhPJwAHe/TML20gUhvcy34ekYCOJRrre451CGgpoyTiWMWwulfSPHX++T0ICmWVeBTTIdPp3rC2Q==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr33915999wrs.121.1632217123609;
        Tue, 21 Sep 2021 02:38:43 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from localhost.localdomain ([2a02:8109:b5bf:e890:1429:5546:9995:f7e5])
        by smtp.gmail.com with ESMTPSA id j7sm23179825wrr.27.2021.09.21.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 02:38:43 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 2/2] ethtool: update to 5.14
Date: Tue, 21 Sep 2021 11:38:01 +0200
Message-Id: <20210921093801.2336-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20210921093801.2336-1-changhyeok.bae@gmail.com>
References: <20210921093801.2336-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.13.bb => ethtool_5.14.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.13.bb => ethtool_5.14.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 3b639ebb67..e4abadb05d 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From e652ccd8965895087887c270fc0d380b61f96b11 Mon Sep 17 00:00:00 2001
+From cd444e576d446b7ccb51a26a02c0e75d6ee2abf2 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6b620bf..ff62b2a 100644
+index 6c9453c..7c0f829 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.13, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.14, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.13.bb b/meta/recipes-extended/ethtool/ethtool_5.14.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.13.bb
rename to meta/recipes-extended/ethtool/ethtool_5.14.bb
index 3c99debc99..28a49f4f8a 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.13.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "e66ab0d74d2a888fd64a0053290dbea66ddc9b75b3d21d117b7edd9576b9db60"
+SRC_URI[sha256sum] = "9868604c913e5483000c00d5dcb2bb3169a05252de47f62174702ff19cf6de7a"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.33.0.windows.2

