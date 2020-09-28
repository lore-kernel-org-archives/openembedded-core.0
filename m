Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.36214.1601298383142030158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=wzgKMZh9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id e7so617642qtj.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=wzgKMZh93ld53V0nUxsmLooSSvYCgQj4pTRsW/1mVYb6ltPD3sbZbFrGWPRSg0VOO9
         3K8D9ookr+IPYOsppotUiYlTJ8mkEZGWSJeMzyyuPt8k68ZKSIool79Wgt2OnhUriZ9C
         bqfiCGmJAEAOo9ZeORBgGiIWuuPBRojDQHxydx8iCvwat0cHxHu6L25z7/vanE9bH7fQ
         MZ7lpqRJ5MVsmO76lTQEz/iRtmyWEvTTJRKx21LAgfG0QNiHnWHn8uPL3EXMWd9RjulI
         hOJUT5WvZ6Udo/YuPPOG7i6PjXsJzCVhxfx5p3xp+TGvO+czyeqisOVvDbuHupxjPLv8
         5fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=GnDZMD75SgqNfJa/awdMAx1on/rvrCagjnlBE70dOE3F47l48fR6KbusMrI8JIZHkC
         +ALPb63Swfe4L4HWsr2ZEBI2ii+egiLphgdRiD2jh0ChGv97lVsBcG5yKLMdAdmj3ETt
         yS/hMKUcbE+ghKY6ByEt2e2lHlZgoerqxiCNeolBJcALv+IA1aRHAtIdFzx0CyvAvTEY
         oavWeiZZFehgxllLZP8jKYXCUerC0QdSa7gx6I23gqetHwi9Pm/bfxfzjwAr7rOUi67x
         TvucRM9gZlQy9LahjiB/44Gy4/isGvCQvyaC30448pSaufwn9hKvRYukrpFzAVdABB4f
         awvQ==
X-Gm-Message-State: AOAM533NFnbZRA7+dKHb83phL59L4KrAJp4wA2Wo1/IRnVoFPeVA5Qz+
	IvacuU4qfpEFNj5OMC7/+Oxvhx0C+BjtTam7
X-Google-Smtp-Source: ABdhPJzKtlNqDSKBizC5vgLAHqTSmYElAy2O7yodNM+9fdc1z6hb4HtUXdxxWBDTelC1IAws5ZihcA==
X-Received: by 2002:aed:3825:: with SMTP id j34mr1419062qte.7.1601298381840;
        Mon, 28 Sep 2020 06:06:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e90sm1042468qtd.4.2020.09.28.06.06.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:06:21 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 6/6] tunes/armv8: move to a new location
Date: Mon, 28 Sep 2020 09:05:51 -0400
Message-Id: <20200928130551.21346-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928130551.21346-1-jon.mason@arm.com>
References: <20200928130551.21346-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the ARMv8a tunes into a separate location (per generation).  This
should help reduce the number of tunes in the more generic location.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc | 0
 meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc | 0
 .../machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc     | 0
 .../include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc     | 0
 meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc | 0
 .../include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc     | 0
 meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc | 0
 .../machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc     | 0
 meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc   | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc   | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc   | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc   | 0
 .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc       | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc   | 0
 .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc       | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc   | 0
 .../include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc       | 0
 .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc       | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc   | 0
 meta/conf/machine/qemuarm64.conf                                | 2 +-
 21 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc (100%)

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa55.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
diff --git a/meta/conf/machine/include/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa65.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
diff --git a/meta/conf/machine/include/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa65ae.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
diff --git a/meta/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa75-cortexa55.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
diff --git a/meta/conf/machine/include/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa75.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
diff --git a/meta/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa76-cortexa55.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
diff --git a/meta/conf/machine/include/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa76.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa76ae.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
diff --git a/meta/conf/machine/include/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa77.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa32.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
diff --git a/meta/conf/machine/include/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa34.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa35.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa57-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa57.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa72-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa72.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa73-cortexa35.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa73-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa73.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 2f61eb0aed5f..c4096d0eeea4 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/tune-cortexa57.inc
+require conf/machine/include/arm/armv8a/tune-cortexa57.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.20.1

