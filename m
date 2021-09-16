Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5026.1631832013668789637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 15:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=t8m+Rmt1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id r21so7074450qtw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yBHxTR438UbChuMzFzitJPT0VxmheoTaaLdX/Iituwk=;
        b=t8m+Rmt1jQRXR7Im/ZLsQAuxrY0V9nJMDR3OfHXKlrsGO4WlIkMEwOiN/QB1xmIWMR
         r9rjrYrenqwcIvtlapMqV3Ogh94rRpyLUyebarSRsuZ4WNZ65b7LeJ0c6xzO+VWtLVLN
         2LPvmg8pl1Ba7Bym6LOVVejDIJTxvsEAsUCgg1ZudeRZbsqo6SYqNkSlbpJuSkQlNDuC
         ZJhPXr7Y4Ipry6AdPDEGgwUHj2bhH4ET8eXI+Ri3FjPcJdeQ7qGfaUpP3+q9zKDIMHO3
         PKPIx5PzWQbs43+eZ3ubLujV7R/SetUpsVYJS1iCqP/kEnm1nQ3911GxUHia5IH52Uo4
         Cs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBHxTR438UbChuMzFzitJPT0VxmheoTaaLdX/Iituwk=;
        b=Z5P/n0KSvcS0noYV0wr/WqA3P2xeyz808OXovUUsRvesmPRQUcXnjk+UVzsv2rncQp
         qjFrdao0FRlx9RUZLkUgT+2Tz32jff1Ttpz9MhfhJe3QAzqGToiPtHKPSbtosxF4Lx+p
         V8BqpxP/DNowfB6p+oX7KhMyyWm2rQ7Zcexz713JV0v25OCRtu9y15vgrwmRZpBDQZH5
         RfgEdn7NYzK/Z4qF7DMXLRDeawbA+mmBhuF8/dvPr0y82UrlOKiu809aSG3jXySzYIU0
         VMkcsVD/xSKpEcH3zp4T06xy5ej7a5DD444Fs7uiIRXQYS5oZb7F5NI6p8iC3/WJHx1w
         jJ+A==
X-Gm-Message-State: AOAM532D/CdvZhExvPsDqfMsULEWxPYf+p3vu+mlltQPCr3Dewgwq2O6
	f4Wq1D+PVZ3GcUm4tqRILf55ISgqjS4GYQ==
X-Google-Smtp-Source: ABdhPJwRVhxmXMdKySqZw91mAjTVIpnfk/hmcojtjM+XbGXGT7bMS/vdkN9tejskSLkTwsNRYjj/xg==
X-Received: by 2002:ac8:7118:: with SMTP id z24mr7598132qto.244.1631832012762;
        Thu, 16 Sep 2021 15:40:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:b85d:4277:577e:3e0a])
        by smtp.gmail.com with ESMTPSA id g12sm3006249qtq.92.2021.09.16.15.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:40:12 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] Update mailing list address
Date: Thu, 16 Sep 2021 18:40:10 -0400
Message-Id: <20210916224010.21213-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916224010.21213-1-jdmason@kudzu.us>
References: <20210916224010.21213-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e560ba39ddc1..8592de5a6682 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -4,7 +4,7 @@
 #
 # Please submit any patches against recipes in meta to the
 # OE-Core mail list (openembedded-core@lists.openembedded.org)
-# For recipes in meta-yocto please use the Poky list (poky@yoctoproject.org)
+# For recipes in meta-yocto please use the Poky list (poky@lists.yoctoproject.org)
 #
 # If you have problems with or questions about a particular recipe, feel
 # free to contact the maintainer directly (cc:ing the appropriate mailing list
diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
index 52986e61c796..d1835c7a108c 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
@@ -400,7 +400,7 @@ Index: ldconfig-native-2.12.1/ldconfig.c
    return 0;
  }
  
-+#define REPORT_BUGS_TO "mailing list : poky@yoctoproject.org"
++#define REPORT_BUGS_TO "mailing list : poky@lists.yoctoproject.org"
  /* Print bug-reporting information in the help message.  */
  static char *
  more_help (int key, const char *text, void *input)
-- 
2.20.1

