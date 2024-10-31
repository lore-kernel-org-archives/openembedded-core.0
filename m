Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA7CE68977
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 11:33:16 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.10145.1730374389269269169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 04:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNC2wnE4;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: festevam@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-83a9cd37a11so31049639f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730374388; x=1730979188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhZf+sFyDfRgLyd3xYeX01XA6CAkqRpjh3M01kkHYOU=;
        b=lNC2wnE4Q6c1tdktKBlDi5Ky/lwbnCUbSyBkxVsWIUCfHTmUBHglrWTztJkDLo6J3L
         2IiVDSyEOv7kpshzg4ndNB154/l/i6IrJF2qhIDjxYwdZ18EM4rGsXVwPZrUHbnBkply
         g8ZGvFs0Ie7rxzOTWm/uAhsjiA18HHa4IOd+rNMz/PAyg7cvt9EM2kkiVaXk7mrfHSGg
         MtAoP9ofLOcpc/n3x8tdopVhHb+cCfxx0W6mCT6q+8HcV3cVchVu75kVbI9NxW9gu6ls
         HELDprsdL/bs3EvyMpyb/qU+ZsDzw2jCLhj8KHuam3+YySmLbxy0cY7iwFUxwRHlkUqr
         uSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374388; x=1730979188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhZf+sFyDfRgLyd3xYeX01XA6CAkqRpjh3M01kkHYOU=;
        b=ZglyWyrOal1nMDMEZ5N26u08nMRcxhmnY0g9hxYw0IUStwpHCVeOGSWc5NHTLZYh2i
         CLOpKArqFKMxg/3upWsGz2/5bIYllN63/TwI2csTcWnah+IbYHx5pz2C3TajvJvrsgLA
         +9T9OLEFpMGsWCQxte4aSSjBV5HwL4bNq+Gy7r5sOhgrvfPWIOlR8KtFPavko4vyc3jK
         eh3DRF1Rzj682/E75veZ9rnYkLZ7xMqazGqraTCYIOZDINSquSMi+dZFrX7JkHNCCxlw
         iYlkRhjScquk0FUGWSboOz+92rVncP/Z20GtjSIxU/I8+t2esPkIvjwtHpjWYsNoFGTr
         YKBA==
X-Gm-Message-State: AOJu0YxPDN7532sVlG9UIZBsBeHE/0yOYBv0fHlz4BReMt+nPA1zSXtj
	QiohDwrZlFa2XVOCpaQHb6ti2KFeHijTGSAJ+jRD5fiIc7X1lDolpsKb0w==
X-Google-Smtp-Source: AGHT+IHTwKIRtqO4mGhp5RJjIEpPVMn+IZC8LP5Lanzsf3xZJcYoQVOY6Eku1T4Iac9yODRqQKHqeQ==
X-Received: by 2002:a05:6e02:1d92:b0:3a0:b471:9651 with SMTP id e9e14a558f8ab-3a4ed3011c6mr193601205ab.24.1730374387939;
        Thu, 31 Oct 2024 04:33:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:13f1:c7fd:8955:525e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a9938sm884162a12.36.2024.10.31.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 04:33:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: f_l_k@t-online.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Update Upstream-Status
Date: Thu, 31 Oct 2024 08:32:51 -0300
Message-Id: <20241031113251.712204-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 11:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206577

From: Fabio Estevam <festevam@denx.de>

0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch is now
applied in U-Boot upstream.

Update the Upstream-Status accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...1-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
index 9cd2cee90246..2eeef99b21c6 100644
--- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
@@ -17,7 +17,7 @@ since swig 4.3.0.
 |  5581 |     resultobj = SWIG_Python_AppendOutput(resultobj, val);
 |       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
 
-Upstream-Status: Submitted
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/a63456b9191fae2fe49f4b121e025792022e3950]
 
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
-- 
2.34.1


