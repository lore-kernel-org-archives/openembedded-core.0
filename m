Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.1172.1617290966250163649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B6Bcmtd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id n140so2132362oig.9
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SGFGAT3k093mRxkbrF4VFj/g0Zag9GtFH+H8MEXr+N0=;
        b=B6Bcmtd2USzr2O3YkYlEKhmNCjC3+VDV/yTjxODkYld2s6QnKjoosgOlTK/j56H1HC
         +YsQul7BVWvan2uAcN3PtvGhgOjTsfNliYtnOvMzQRidLfhM0lSdoaaG8DEe1lPxv2Bj
         CIgXXTw7Xsr1MmdMmYd0+7avSG0dUvklW3XzrPfS4Mr/YrGXy7vquX/zZ3RTSt11IZSm
         NmRbrWvirVN38SFOg+g1lUSFJ69Ht3kFQwxW7dYqbiAfFZoNWdnn4K+ReVGQuU2PmQGH
         YmCqx/OCkg5GLaJmSFVtCFra1J8DkfH+YeYgBwLjZw6UoDiwXOrdUxcND7H1FDua9ov2
         XgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SGFGAT3k093mRxkbrF4VFj/g0Zag9GtFH+H8MEXr+N0=;
        b=cExLUiCDIPUCRiAU50K7jAukUHNyPxG8fpnT/ElfIH/iSssi2ic25I74EOoAsxa6Uz
         IE4INlRF2lvc9CIMcaOATfYz2ZkmNuu71SAiOlcrBEpNtnlfRfVs1wqHoG4A1bZV54YD
         zcNwb5hfFGXg/QioEhnTr8JGvfcavajv79Ce09gjzgTgUOej0kVSWWJagqHZkSTY3RIT
         Q4cv5MFK5mwhuGuNMCjWRnE0OirTXmqLSkFtCQjegVaTC5cSlG4N4+7Wl9pjloVPuMjF
         XerF5M45UWvsb2j8Sz5p6+YPmDuW9XZVWm9HCbu4TOisZFYffLGCDPOjqppk4LryyDkz
         Pkyg==
X-Gm-Message-State: AOAM533olz2YqCy9JvxIv2Ik1iPPU5lNdoZq5aElYf2l/+KD8SgcguHi
	24yAPvJ8+i2vTm8Kb8IiDBIi8tjamjooFSSWAm4=
X-Google-Smtp-Source: ABdhPJw9tgGtIWJM9TV5RWGsfY6xTW5tOhWi5sDExRhc/XMdoRoSEEV7yEg5cGSJVN15F1Wz8sUEhw==
X-Received: by 2002:a05:6808:8e4:: with SMTP id d4mr6540988oic.114.1617290965132;
        Thu, 01 Apr 2021 08:29:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/15] packagegroups: delete useless "PROVIDES" lines
Date: Thu,  1 Apr 2021 05:27:42 -1000
Message-Id: <cd4f70f47c82377d65c51a7c9a9759188dfbb5b1.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

There is apparently no functional value to "PROVIDES" lines anymore in
packagegroup recipe files, so remove the lonely couple of examples
left.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6f2c9602bc5fc6794b852ec20f40ea62a55ada1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb     | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1f802da09b..c32664917f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
             packagegroup-base \
             packagegroup-base-extended \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index b345e314ad..20fe6fc092 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -7,7 +7,6 @@ PR = "r2"
 
 inherit packagegroup
 
-PROVIDES = "${PACKAGES}"
 PACKAGES = "${PN}-server ${PN}-client"
 
 SUMMARY_${PN}-client = "NFS client"
-- 
2.25.1

