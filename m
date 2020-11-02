Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1167.1604335800180884101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sg/O1oAS;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id i19so8794395ejx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GslhXHtKgKDIiBSC3ogVOg1u4iaySDwqhnN3qrmC6Kk=;
        b=Sg/O1oASTd/qjTroIvsfqRxB4vxMkhuY+D5pbgyynK+q5NN0JChmPgV5icYGvAja+S
         5gX1YcAda30kQWeAKBoZSKpzCRPfm6T6zM4ju+R38prWsBDdBrgWdGpRUUWyto+iUxgx
         dVwfkIwj57/L0grbxuHBBbuHhPyiV48ac9CTxH3cwtbm8FV1gcMmsTaKgG2qMBh9zejv
         35REeK4mxg011bNpjMsNxystJNXhxvs9jY84I/WHvAFgVCHOF15yTn7B08YtsJUs1qRc
         nZGEUIzMB5DyYyMg0O7XNY4vFcNqFm6koyLC3wzAwBqaOZ8LreBO3finFS0SYvtfblyy
         ISAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GslhXHtKgKDIiBSC3ogVOg1u4iaySDwqhnN3qrmC6Kk=;
        b=c/8JhL/zj9mL7YOfT9fyA+HgbavWaCWaphD1yYPvkch0aGg475M3znU/uYNVbKCGgo
         ePyJNh2qsqirE0sK5YiNIS+H2jjyCPcvhorDfDdqi/5g2/8PsIFAu7aj8xZKrROHUEFy
         MypuWdToN0+PMYje/wf/64tOMnI967Ms8bcwr8nTCbsaNkPIfEcgyuTP+WZgOx6nqL4n
         yrnbujqeAG9m7TNzDgRV/W9lzXgQwVhkNfTnvg9mOoWk7jsMxirm0AgfftXqPMHKfC77
         qcEjJUKS/7l+gF7mHN1twrsEiof7Z8H5Tuxt3HtdAsCCLWbYG9C7iHoC9mBSooW5Ri+n
         FqEQ==
X-Gm-Message-State: AOAM530V6submd3PK4WBVkSKE/JGiryABvr9ohC9esvni0XaCG/c+XyS
	sCizt5taBnOp8DlIgOBEzVFW0vUpEjP3BA==
X-Google-Smtp-Source: ABdhPJwcvDbhdNMslYbewwt2+ZKpLj/wQkEPRfGWhkgLULhIvJVlyhpPEXFIvwsnfbCgNWp8kzjAKw==
X-Received: by 2002:a17:906:3641:: with SMTP id r1mr17103367ejb.391.1604335798466;
        Mon, 02 Nov 2020 08:49:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/80] u-boot: upgrade 2020.07 -> 2020.10
Date: Mon,  2 Nov 2020 17:48:33 +0100
Message-Id: <20201102164907.27572-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: added MIT license to README; overall license remains as it was
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../{u-boot-tools_2020.07.bb => u-boot-tools_2020.10.bb}      | 1 +
 .../u-boot/{u-boot_2020.07.bb => u-boot_2020.10.bb}           | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.07.bb => u-boot-tools_2020.10.bb} (98%)
 rename meta/recipes-bsp/u-boot/{u-boot_2020.07.bb => u-boot_2020.10.bb} (98%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 9199bbfe0b..cbce408a28 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
+SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
index 7eaf721ca8..ef386f76e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
@@ -1,2 +1,3 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot_2020.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.10.bb
index 02d67c0db2..4f5b3e5dfd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
@@ -2,3 +2,4 @@ require u-boot-common.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native"
+
-- 
2.29.0

