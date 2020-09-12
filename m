Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.21390.1599929306510077373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 09:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=DQbmPEb5;
 spf=pass (domain: emacinc.com, ip: 209.85.166.67, mailfrom: mgloff@emacinc.com)
Received: by mail-io1-f67.google.com with SMTP id g7so4494115iov.13
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBzRJes6Eo9f/Ml9t5xwUpXyYlTO525dZcNo0OdjEVc=;
        b=DQbmPEb5r2fm6NXZNc3iuAjAXoA0wcbZHGeM1GzPQD2wqBWF1vT8cnu70gVaPOtvoW
         gy/AF7llN/r+2SygxL2QJkJHY/fkuNVNrJ/yF854ZJ7NXN8TpT7Ql0Nedonw36D1Jr5w
         s1dnSFvhEEBmyO7ck5iiZHBAyOcw5xtwAzu28DuBFttycf2o1ID1Grp5b/NjY3VRQC2P
         1lOT/qJva+Ipp9bjXfdNyghugzIkbWA5kXyGS7XLUam9HzYD6pT2V+RvG1CzK3/eght7
         qhgfBhWOrHLrsjOf9ZNwSCIHP+4EGC5QyreDHZBCSvpvaln2S6rNeDVvCzBeKb/N1DnB
         Oq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBzRJes6Eo9f/Ml9t5xwUpXyYlTO525dZcNo0OdjEVc=;
        b=i6h2AxsRPxd0dmnmiQPlPkWHbc7TobGGMCnCSQWX2DnfRzGqyhg4gPhrHlvCxy7tTR
         M8VN+ebl3QWhkpn1CLeDlpBItWbYZdqDeeHJzcdRyVOWmj5xE51L3opEbJsabO4TPv8P
         Pg4FhX1FZ4PdV/FnbEfFGkK2IC8cB9ldyE6c6eeB+xqtPgmN9OfknLM9dd/JlJI8yjIa
         y7kcKkatEM2uaWFumjI52na8ssNaAC5Rro6rLY8CMmgnKN4/c3T0S7aOfpy84+WuaZkR
         yT3Eu+fftCjItswimojxKDFWJaqhMYSw/QOFKH5kcCgDtnV4AQI/S03P1F8+Z8mtAisk
         pulQ==
X-Gm-Message-State: AOAM533lUWmnJaLrQ1z1d8U46khTpZwq1goe4DhzniMNDMU1aLeDvLXL
	83HLAsk4N0WJ+JcYVwkaJCMGHWCkK9xlpYPt
X-Google-Smtp-Source: ABdhPJyAqMl9woEi1PdDdEggFNQWP8j9l/LW07ZyOECUCkeHjvVpIl6V77xthPX6QnxK/djBNU9Mdg==
X-Received: by 2002:a02:9f0d:: with SMTP id z13mr6701169jal.60.1599929305475;
        Sat, 12 Sep 2020 09:48:25 -0700 (PDT)
Return-Path: <mgloff@emacinc.com>
Received: from Shuttle.mediacom.info ([2604:2d80:9f80:9700:dbc1:b947:539f:e0])
        by smtp.gmail.com with ESMTPSA id l14sm3324245ili.84.2020.09.12.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 09:48:24 -0700 (PDT)
From: "Michael Gloff" <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Gloff <mgloff@emacinc.com>
Subject: [OE-core][PATCH] sysvinit: Remove ${B} assignment
Date: Sat, 12 Sep 2020 11:48:11 -0500
Message-Id: <20200912164811.978100-1-mgloff@emacinc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order for the VERSION variable to be set, the
top level Makefile should be used, which only
builds the code in /src anyway.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
index 80ab9d70e7..98916f7f19 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -24,7 +24,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
 SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
 
 S = "${WORKDIR}/sysvinit-${PV}"
-B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
-- 
2.28.0

