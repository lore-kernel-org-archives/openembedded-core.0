Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.5735.1601062121516997247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EdveM3TH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id db4so1970526qvb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=EdveM3THrIrG7MdMRwA2Zrudi9NQAFg3S2ww1kxBWFU/418Ot48ZJOHJLUqXwUgPKD
         JfqRIzbOTQla7kpD8oY6FFc2yZunWNlnka+SDDdrE3UUzcY8psgZ5b7cGe94H7dW9dyk
         FC8JB1eK0yu9g0pLok87QYPhN5ibGS72j7qCr2BlxIKO3gWs0/uuaYKfWc99jliaR9Rv
         /CO8LjtXkSD7+hoXpaQZkvHmKhYWafF7AUaQPryX+OxTJwBpwuFr5ANP800LMJ0UIPh+
         yFzrap6xthgYpseu02sGMv60AQZQjydSkRcfC+6qS/oFhxd+kEiJu3fUq47KFZAPoJ9E
         aubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KoN6bMkszI6OB+8+m2a/CYY5YudDvZMGBSU3I9riCY=;
        b=GxEUfaepc8P3ueyAYNcKpIU1GqEslbxaRcL3grgCq7JYNM+kptLxzgdAHIjq/3ywMk
         oe2107WGhlqzWtRM35EqMCW60hSGc1LpYiqK4UfqWYtZzxUQkoE+6YmGrOcG3GiGS30E
         YjhXonJw6pxad/jJCIXyh3ud+7bSZvi5zX0PDma6hzU97jHZANVNZdf90utk307vlD51
         0RG3NAmM+60V40+WH2N/yq4C5V4Fz9tMzcu8l2JCmRwDUOTIjTnlW916wuepssG8rxte
         BVXQyamMadXzsTU/P/xbYG2cpcN8/mclsyqMqn/z3S9ii/+MUtIS5tfirm5FnU+XO6cZ
         JiAg==
X-Gm-Message-State: AOAM532nPlBrYWHTcI0wB8n4LuaugH4xwCjMHH6tiYXQYJcWv3Q1E2tT
	OVhzfdvdryiGygjcKKytpx2QbZsDzfypsWsg
X-Google-Smtp-Source: ABdhPJzQoCyvXm/3Emo4kvSKeHJypoJU1/V7mHerIxvTLOBmXA9BMwn2jO/Ji23xrbn9Z1+7VmUeog==
X-Received: by 2002:ad4:4f24:: with SMTP id fc4mr124105qvb.35.1601062120274;
        Fri, 25 Sep 2020 12:28:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id x3sm2533091qta.53.2020.09.25.12.28.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:39 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 6/6] tunes/armv8: move to a new location
Date: Fri, 25 Sep 2020 15:28:10 -0400
Message-Id: <20200925192810.1372-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925192810.1372-1-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
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

