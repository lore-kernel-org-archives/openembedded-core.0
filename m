Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6EDD1F9C5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 19:05:21 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.5157.1729019113168197703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 12:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgryhETk;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7180120a78dso526354a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729019111; x=1729623911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ah6nlINnljFejbDHqW3HipSlRRnwnrYHZGsRRCsNRak=;
        b=bgryhETkZz0Xq0/gr9HG3jQ4Bqp/ZSN+dpmSPg9viXEUjEtIp9lF4juieokeJZj/6M
         TTOryvJPy5ZHJdceN4//cZSS/oAvzzGGEaj4L5W0es/uqwdYwBLl09eL5ZtiguK2DiHQ
         QOrgOjj0hoAB627L12MDEEYsxOKRAziR6oHK/MoKNPRtA3HGvcVwRVTXsKeSY6twJO/H
         QJzuOS5+KTYBi6PoAj3q+GQrs9RNBpa3hhI1OtmjQPaA+HmQhg3ydr9+HGzb5nUFuRO8
         SdxSEXe9oGCqM17oN6rqBPCDCz3WJVujDCH412ug54IBPllAzp5FFIDW6Yz6urlOmb+4
         dq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729019111; x=1729623911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ah6nlINnljFejbDHqW3HipSlRRnwnrYHZGsRRCsNRak=;
        b=YLNRszoC+wW1Ygg2BrtczEGCDIv3CutSB4BOC44pPSE4GVQzh2mmcKHM2GN9lhHGTQ
         9398sXyIhnxidVJsS5XFtKoUIeZbFszg/dRXlqxAAlG+IopyCAyaOmjsRyblP2CqWrC0
         fGxx9INpSoCAwCUKec+LoZXdVYd0uM625hn6Nf3UVqEQUOb5GABCQ/KaFr/sDEFOKb7k
         Fu5sqp6fLenRUER8RybQB9RFVeIzpfdyy95p5SuOR1ZaPvsInkPb5KkHDcRkEJBmYR1F
         5fL9S8/SxKhmkDNmnC8DVKbeyn1WTx0b4lHikPeVraYbOJbZwojrJGO4Z+9nNvHs/DmG
         iPJw==
X-Gm-Message-State: AOJu0Yz75oEy+FCca2ez8D54eVrK+H2RbrhLCAd6HwvUkzfQycH00JR0
	MZ7LVFFRkQw06PiqELI9o48ZVXNWxhW8K4+nRChOBRN634D9MC6mmZpzuw==
X-Google-Smtp-Source: AGHT+IH/2UnUgY/FJhJPrZhlCs61eDY0PRY6zYuyfEOn8EVlZC8JEyMpUKdx0+s3r0mkaCvtkFtazA==
X-Received: by 2002:a05:6358:5285:b0:1ac:625f:9d4d with SMTP id e5c5f4694b2df-1c32bd009e2mr827833655d.23.1729019111358;
        Tue, 15 Oct 2024 12:05:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:35ac:5a3c:300f:a7b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba319sm1527094a12.2.2024.10.15.12.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:05:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	quentin.schulz@cherry.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] u-boot: upgrade 2024.07 -> 2024.10
Date: Tue, 15 Oct 2024 16:04:52 -0300
Message-Id: <20241015190452.1926300-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 19:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205944

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2024.10.

Add the gnutls-native dependency because now U-Boot needs it installed
on the host machine to handle the CONFIG_TOOLS_MKEFICAPSULE option.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Add gnutls-native dependency to avoid build error.

 meta/recipes-bsp/u-boot/u-boot-common.inc                    | 2 +-
 .../{u-boot-tools_2024.07.bb => u-boot-tools_2024.10.bb}     | 0
 meta/recipes-bsp/u-boot/u-boot_2024.07.bb                    | 5 -----
 meta/recipes-bsp/u-boot/u-boot_2024.10.bb                    | 4 ++++
 4 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.07.bb => u-boot-tools_2024.10.bb} (100%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2024.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2024.10.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1b5382a6ad68..113f215cf61d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
+SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.07.bb b/meta/recipes-bsp/u-boot/u-boot_2024.07.bb
deleted file mode 100644
index b15bcaa818fc..000000000000
--- a/meta/recipes-bsp/u-boot/u-boot_2024.07.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require u-boot-common.inc
-require u-boot.inc
-
-DEPENDS += "bc-native dtc-native python3-pyelftools-native"
-
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.10.bb b/meta/recipes-bsp/u-boot/u-boot_2024.10.bb
new file mode 100644
index 000000000000..db8b2d58b468
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.10.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
-- 
2.34.1


