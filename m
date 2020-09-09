Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.8184.1599689837894489971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=p+qcCqTV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id c18so3304307qtw.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S/YVbB00L68ioJL/D9oTGP93es0LshhJfO9RnGPbNw0=;
        b=p+qcCqTVpZlD/J3RQ7SbOZiLtyftFsB4uoN4uqXlLYxAvGB7CFsr5SiwmeO4c6mlYw
         n6UhTA+3GbMVaOucutiJGYlbKhJaZ5dF0CwMaZrZGKUUX4EeT5++CgNY47bMlb6panQu
         r1aG9hS5bzBrVgfB2yFPc1PiqBDm2Ssim8DOexrceD4E/u+Djua/E5jdGLYeEQb2y/iu
         9YNdzhHD1NNH3tpFQZ+kCZ4QHjJK/qqArgxFvi3q4Ge2wFPahJ9pZlt7kGgtTfh6iwYX
         o4mHdpkTQphlUphhHote+/EOTQsiX0Gr8dPQiUPXQ+gdFTO8rXRwakIT1mTH4GG7Lba0
         EJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/YVbB00L68ioJL/D9oTGP93es0LshhJfO9RnGPbNw0=;
        b=s6e7klDloerIv6b3TomxlgQUZKixs+jS3YpaRxOyxI6tgh3nC6OVz48gtMJDCv8zKn
         71vSrWTyWmUhlPvfc3MCPf3JE/3jX1a3GhgYgkUX941Hyd/ix9/y8hTbXaFS9wiXQZmT
         hfIqiM9KRLoseL7rUn8/c86TYnFxEcJxonJkGjoMArtkv1b5Saf5VMSKpry45oIfaoVx
         wTKy0ZZmlj5YmmCgBb7iNVSGIKBsa/gU1x2fpNmD8dZroISomevAFUrOrUVySxHiGHzV
         1lihn+xxe53Ba+RtxghA80c8p0FnFj4byttrizKS7nAWyTjLR7hpZPtOuRo/pdVJe/0T
         PmRQ==
X-Gm-Message-State: AOAM53204ApPb6zroaHQEl87E31icI3wp19z4cIAIyZtAUlQxlOiwsAn
	1r7G/0NmSEzGdzJyFLe1FfiB31LAJFAlnrPz
X-Google-Smtp-Source: ABdhPJyFVYKktKeXGGLqZWX8KzRVOCdVRQdIdOtb/O4Cm9VPczRMmUc2gmHgLyxeq+Gbo6eyqK5WXw==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr5539595qtp.111.1599689836867;
        Wed, 09 Sep 2020 15:17:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id g45sm4770569qtb.60.2020.09.09.15.17.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:17:16 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] tune-cortexa57-cortexa53.inc: add CRC and set march
Date: Wed,  9 Sep 2020 18:16:51 -0400
Message-Id: <20200909221652.6750-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909221652.6750-1-jon.mason@arm.com>
References: <20200909221652.6750-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CRC to the default tuning of big.LITTLE Cortex-A57-A53.  This puts
it inline with all other ARMv8a tunings.  Also, reference
PACKAGE_EXTRA_ARCHS_tune-armv8a-crc instead of
PACKAGE_EXTRA_ARCHS_tune-aarch64, which sets the -march to armv8 and
enables the CRC.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index ba4b0738529c..5880bf203231 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -10,6 +10,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
-- 
2.20.1

