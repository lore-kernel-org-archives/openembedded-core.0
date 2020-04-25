Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.3095.1587803510257375306
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 01:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMuhO5wX;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id s10so14308210wrr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HTSc7FTJ8vSOEnDn/+PGk+R9NhILJ0laUESkihFdPYU=;
        b=IMuhO5wXw2Re0ewj0YFsg/hcDcarvCWjYMoNXdg7T2Sv1WnMXlqdf5GCbp/smdC4Ut
         yRIckNnpWFhQ3zdWClsKwVSgn9kkqlFEcSbUDf2j/axw3EtwWOEm+uO3ipU94dZIRaMg
         0l+WVqSuL/Bq0Z//UEVr0UHCR3ciE9boK73zgpwBejDoLsvajsi8jHtVb2AUDmY4twW+
         YQ5K2Knuos2CJgN8RixntrqNxSHlTGgveiLgYd7uwvgT5A1zfy+F1GXPcS8dkY2Gwc9W
         04vZDKjgq8gzgtm+8DpiqY1DMyV+1cjPOVnn6l4S9zU6MXXlEDvcxVoaVdcb7740h+xJ
         Pgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HTSc7FTJ8vSOEnDn/+PGk+R9NhILJ0laUESkihFdPYU=;
        b=a9e93ma+NTg4HCiSfgs4W6sqRG3bLjboXhoDpWlGwo7Q5XU+GPSYX+1SKz263tvSIv
         pXUiUA8MuX5qBGlYHOgJ4s29FYkCSFNI5XauHMXuI8/PI4Dhgli9UwoigE36gpvwibBj
         GjwhYlwzwP9eL7oNDCUo6YoNE/9bIIU+vlOmUFM29H1cqDMbbDa1QFo+61j00IGYdmgF
         EdaPjUApXkR+ezpzImlfc7jp4GYQCJTx30IyFMRgYFcjmu+gNwa238PAGn4KvIPiCsyd
         Yuh8gfU8Av4wa21hMaP8DWqPckctWHjykCYP/YhL2vLlbxB+YoZC0PEgs00t3pQwl1gP
         o53g==
X-Gm-Message-State: AGi0PubZefb+xGZVA8gmAVlJ7PNRoj49b4voOvBx2qlPSmUjcGjpFzAF
	aJO+jNsUbaNUbhFpyVp+3BPk8YlG
X-Google-Smtp-Source: APiQypKEuwWwwc6cSuIl3g+W1FBkgih7kg6YGcvv2Xa+z9cEkyOftFWLg5YY+ZHvJRG8EDhcoJAuCg==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr17217942wrh.172.1587803508347;
        Sat, 25 Apr 2020 01:31:48 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id o18sm11446964wrp.23.2020.04.25.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 01:31:47 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] u-boot: Upgrade 2020.01 -> 2020.04
Date: Sat, 25 Apr 2020 09:31:42 +0100
Message-Id: <20200425083142.9150-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2020.01.bb => u-boot-tools_2020.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2020.01.bb => u-boot_2020.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.01.bb => u-boot-tools_2020.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2020.01.bb => u-boot_2020.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index edd0004792e6..f4790532b4a4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
+SRCREV = "1079ec0a77c3fda510f07860b2549c47f3a46c21"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot_2020.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2020.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2020.04.bb
-- 
2.17.1

