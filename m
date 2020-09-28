Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.27489.1601258547926239888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Qn3E+71q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id q63so8742669qkf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=Qn3E+71qCdELLmUIpEZ9tVnJwpFW+TBHgPH9NWa1M00nQy0fWPHQFa50MKAZ2ourfG
         vaWCvYu52KwBoRq/F+gC67mG7zOUCK2tfyaEHoBvoqno6xB0jbaeWtj85yv/8so51fCa
         eupUFlatyebtSTYHbHmX6xHwBYVanYzbBjyU1Vz1BEfeVgper9YswBNJjoWjXUq5F8DH
         18SOKI0odFj2oHfc7x7+lf99TtCJ31JbvlYaSnDxtmv0lwzNXi8ndtlj5BVWKivzUbjG
         NhdV3BfLd9JR8l0eVnmYFTGd/ByIoTeiwUQspZSUirf55UL2ONf2HvAzmROLPgeVZjsn
         G0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=ac8p4+qnzT6rBPCRgR5RXfma1kQYk20KN1ctHIo4f0qjqq80c7Q1wJFhAiOpeTw4en
         5evNcTGlFap159V6HOwRu/grbDyQdfrnShTpMtJFfoVHlAWBTJYSsBucj3SM7WIRAQO3
         KrgSM93tpFu3B3LoiXSVZHmcVL08uHlHrpFaOZrmYkAQ1UK9D24lS/8yw1hn+6dfUxxx
         8yT2l61DYrNR5NeOrqSK1r1IfKKX+V4vYVgBK1dl66dM8dwLaxgcIk4fO/joGv5JzCo8
         ciWOw8w74TzS5DxocyvTzBUTeWnm+Vx7S1jV93fTNMlBbFTUOCBV6CUJsKxO+gK4iOC8
         4e9A==
X-Gm-Message-State: AOAM532bxHRHpgGB0Q/HaPwo1ODpAC2+55zUQjnyDieXbEPcChZ48n+O
	DLJmmQGMpO3HmyLW+tavZhw6c6f5GPc7eKG+
X-Google-Smtp-Source: ABdhPJxuhiPnt1CceLZNs6Zlzo+bBkks+E2JfBn1UUebSVzfnAJbjRfT99h3g8DCc1eY1rmdKaywOg==
X-Received: by 2002:ae9:c310:: with SMTP id n16mr10231425qkg.318.1601258546735;
        Sun, 27 Sep 2020 19:02:26 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 206sm8058970qkk.27.2020.09.27.19.02.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:02:26 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v3 6/6] tunes/armv8: move to a new location
Date: Sun, 27 Sep 2020 22:01:42 -0400
Message-Id: <20200928020142.5706-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928020142.5706-1-jon.mason@arm.com>
References: <20200928020142.5706-1-jon.mason@arm.com>
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

