Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.5892.1626265580745824322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BnOD/o58;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so3792186wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WluqkUazhrWzoCgMeNnlC0TSQa0VmrnBG+qDmeoIpgs=;
        b=BnOD/o58oPuWfKHhsYkPaFvP9XVRi4uc6bem26f26HGBBYhI1d3kUDdI3h659OFdBQ
         G3PHzd7N0UFThPdlDhUHo4KEvHwTm6DzYSxxPR7adEeBpNI+JluIUtJRjrULZqo2M9CE
         tI4Xg/7f5KujuT+mNrPnQqUEKtegBzqRhf43f8OsRWO6pZMmWee1hCcmluAE7HeuXzaj
         KLDRcAk7H7+XXwRAgz+lA6JPp+9eXrw83YPBv2tEvBsyG9tZaEUhg+WIvWsy4YornhlC
         znFlJLnkchmZ2vjYfy1BlShCrzhDTA9Ikd6V/f2JClFIjbiYfuRiKCR2OX/G1EgybhX6
         FGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WluqkUazhrWzoCgMeNnlC0TSQa0VmrnBG+qDmeoIpgs=;
        b=cLB4nJ7bQLKc7kK0gSGnpV72f2Be2ykvx/QmiyTrRMEZdhyUxLOyoIIYdLJptXKhDs
         0MO6D0gGY/gO3cAFT0DhdUWminBe22ZysY7w2MqHjAYZJyLEWVJRfKAizigkvfjB6mCV
         Y42t5lyJBIj3+y8wCLWyYFD/4SNLD/b0zTvqE322gKxUiFHfQ8ftga9S+nc2rpWJGoO/
         WUJU19rU6VdnRsRP+crUMeQpJfNP+CjlqXtJTQ0FDxfDY+K6jPMC0jIuSbS5InHno0BS
         dOkUalYMp2eYjoWIX578XSPnNcvX3tlo7srUMF5W7r74dd+TOhOaej6zSQiwK6nheUVx
         PQJA==
X-Gm-Message-State: AOAM532u36dEM6cgvLoPQCQV2+hAbVKsUcgBonNXT/dYE7GqtpCOssJZ
	C57Ft4Vj8zG2NSKkAQNh7RdiHKRJ+y8=
X-Google-Smtp-Source: ABdhPJygzTo0V7obk8Jviu+GtOXgavWYj/WxF5K/IyPMyr0qBBF8owlmlq/P2LeEHjUYboLPXYM48w==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr3848742wmq.150.1626265579369;
        Wed, 14 Jul 2021 05:26:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/21] ethtool: upgrade 5.12 -> 5.13
Date: Wed, 14 Jul 2021 14:25:55 +0200
Message-Id: <20210714122606.605142-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.12.bb => ethtool_5.13.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.12.bb => ethtool_5.13.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index b3f3de4a16..3b639ebb67 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
+From e652ccd8965895087887c270fc0d380b61f96b11 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13c2bc0..0b6ca1d 100644
+index 6b620bf..ff62b2a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.12, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.13, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.12.bb b/meta/recipes-extended/ethtool/ethtool_5.13.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.12.bb
rename to meta/recipes-extended/ethtool/ethtool_5.13.bb
index df7dd47748..8f6a7904a2 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.12.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "7ca623cc1dd25ba66531573da6a11f1ecde9b62b00742d9ba54f9ba983439bfa"
+SRC_URI[sha256sum] = "e66ab0d74d2a888fd64a0053290dbea66ddc9b75b3d21d117b7edd9576b9db60"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.31.1

