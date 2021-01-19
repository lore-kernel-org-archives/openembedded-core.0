Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.17899.1611089959610844646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 12:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: aehs29@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id i30so8279567ota.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 12:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqit2SEFDpSLvCNZrXfP8ECnbTwXbde9X6tsxma9HbU=;
        b=I2pCLP9mxSXRipwF9LAIFSR2IfC/8rpWtIivehJSHZsN0uu+Q5AgJI2WMGTlZRjBfz
         RT4+exioqttqodK8RivHLQflvgsdz6QVQo5P4Zq1nYmNxpV+cxOLgDA1paKxWCDyVrto
         NniueL2ny0AxLxUGNG/uSKosyAHCiltkAH9P+0Enj4JbDiMvNtd6ByzvOWjxHr+809Yl
         u1obudpfXRdOZpvZqEmFQmu/hzbHB/tjLpPUgSc4+rl4wqhFn5CNzGw2gwZWNvdZbt/L
         /tTJRpK0/KNRus1w27yPZHX6nBn2x8OdWRQildXDhDlpThp0OZd4UEbytHD5D45LfOiQ
         2/4g==
X-Gm-Message-State: AOAM530p4f4WSDTejQ1CGrmMGce9GYl4l8z+XcMi6+XGHYr+ORVrCLu2
	Qbgq0C5b9V6zugVGP0qT7s9j1Id1grgS/jQm
X-Google-Smtp-Source: ABdhPJw/mClvFXPXqRs8DAjQGJwioV96euv5kw+Z09Ztzr3sFQH6QU5KokJU5J/OTL+xDHRHh/YPTQ==
X-Received: by 2002:a05:6830:1d79:: with SMTP id l25mr4783172oti.17.1611089958561;
        Tue, 19 Jan 2021 12:59:18 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id p28sm4728118ota.14.2021.01.19.12.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 12:59:17 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [OE-core][PATCH] newlib: Upgrade 3.3.0 -> 4.1.0
Date: Tue, 19 Jan 2021 13:59:12 -0700
Message-Id: <20210119205912.2497213-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../newlib/{libgloss_3.3.0.bb => libgloss_4.1.0.bb}             | 0
 meta/recipes-core/newlib/newlib.inc                             | 2 +-
 meta/recipes-core/newlib/{newlib_3.3.0.bb => newlib_4.1.0.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/newlib/{libgloss_3.3.0.bb => libgloss_4.1.0.bb} (100%)
 rename meta/recipes-core/newlib/{newlib_3.3.0.bb => newlib_4.1.0.bb} (100%)

diff --git a/meta/recipes-core/newlib/libgloss_3.3.0.bb b/meta/recipes-core/newlib/libgloss_4.1.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_3.3.0.bb
rename to meta/recipes-core/newlib/libgloss_4.1.0.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 96e230f985..c1d8687380 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 		"
 
 SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
-SRC_URI[sha256sum] = "58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66"
+SRC_URI[sha256sum] = "f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/newlib/newlib_3.3.0.bb b/meta/recipes-core/newlib/newlib_4.1.0.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_3.3.0.bb
rename to meta/recipes-core/newlib/newlib_4.1.0.bb
-- 
2.25.1

