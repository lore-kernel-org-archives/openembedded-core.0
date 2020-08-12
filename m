Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.4902.1597191223790924798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 17:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Oas1sv4K;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id m22so277285ljj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 17:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Wkm9+3289IQhkyRCBkiq0cP5NIWPfHLFRyLYZl2FKs=;
        b=Oas1sv4KIz1YCYZLmhPwEBZSloLzWXgrdqSo+qiOYwPXSjBtDGTQvrZjGKd3IERA3J
         VdULHOoEtRajq2jo3wXuPEvMcEvd5jk7cf4NyZNHkZUoWuUQqoaT9QBEBNOmS3QdKDJ1
         y1lofn/qLNtzV5w6D9Q+fjEGScGrLLH+npv4vde+3QZVM2vesinjZyZhykNl6+XEjw2m
         Zty8OBPI0C4uzW5MlGrd9Q3w/lVcHMUrlyPLulIC5OeIz8Enw71qKXUHO6xXMRrcKfFV
         Th8Je02k16BgLSHP9oQ4k4TJ0EM9+TcMmWzOeV+i3iGgp/JRKxwZsLIwnpq/Z1prdgee
         /sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Wkm9+3289IQhkyRCBkiq0cP5NIWPfHLFRyLYZl2FKs=;
        b=K7ltCi/dpJ3Dnftk9lF6FF2FtZLL8Ks600tCc2c6zjqCOucNwEey+tkW9CbrWuZgsA
         tf4TJVL0ir1o9dkx6faIUJV4dhU29V6SK33lfM8TJQb4Z91Yi9jd3GiOKnXmZBf35F2q
         xEE59wMHboYa99ViWUuCKOSsGdt1vu2dWGmO0+7EkSwjRT25fCVk0ri1H0mOqQ9Ut23f
         c+RivGT7mzOo1o7Fm3x3BzDeFrpNr1GTIbySMBA010PBUR7vFYrLkjqbvDKtlaHSwOTK
         ENLg84J8P9iIUW1HllHDw39cC9IdR/QnSaWdJKhD4ISzdmf0BkFAsfeMj+pD/hGgxhub
         V3vg==
X-Gm-Message-State: AOAM530o8ezP7DrjvwBNywlDnklobI6jz6xrJSsML77z51ezirnuew4r
	afXGUqdDoj0a4ee6llxuW6TNbGGC5ko=
X-Google-Smtp-Source: ABdhPJwfXKpoc9AfgJubHZA+IhhIJa7gkA5sL3e6jZIwiRemibevPRoktFc0pdh0RD1+5qB6xtMR5w==
X-Received: by 2002:a2e:b81a:: with SMTP id u26mr4340519ljo.241.1597191220779;
        Tue, 11 Aug 2020 17:13:40 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id j6sm67265ljc.18.2020.08.11.17.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 17:13:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ethtool: update to 5.8
Date: Wed, 12 Aug 2020 02:13:38 +0200
Message-Id: <20200812001338.557467-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.7.bb => ethtool_5.8.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.7.bb => ethtool_5.8.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 8ecfde1417..90235e4072 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 1c6c017e56ec536f5cceacdb02092777d390debb Mon Sep 17 00:00:00 2001
+From 5b58e7225ba49d497b23cf11d8c2bef17ef1b978 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1169b7f..ed82524 100644
+index 19223f7..8a58d15 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.7, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.8, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.7.bb b/meta/recipes-extended/ethtool/ethtool_5.8.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.7.bb
rename to meta/recipes-extended/ethtool/ethtool_5.8.bb
index d9fc30cb55..0a6e7a2b1f 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "c2e16f8bf510c5822f8e25061c2533972308a421767c54abcacb1038b08bb782"
+SRC_URI[sha256sum] = "91e8bbda48a7fd5d374efacca542364ceb3a6c1f286f024b64ec40ccc799e125"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1

