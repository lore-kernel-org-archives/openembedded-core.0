Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844A7E94131
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:48:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6567.1696628872971632256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuiEUGoX;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-323168869daso2499282f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696628871; x=1697233671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOpXwF9Jq3oUC5sH6SSNmfvvY80Bd5H/1Sx/EeEpTCI=;
        b=LuiEUGoXmYKFr4K8uM8U/j0+/77jlaCBp6x/flEMsb6DcyyvUak0Qf2XyRjM0ooPtw
         mjIiez2GevMGReRsoQtRGDe3nE+3oQcBggSLIMywGv70OwMPlCuhnKYK4ZzCwRVJz/Uy
         ZXR+xHXy86oHnCxchLbHmPMDeYDhn1bvOdySPn25WmzZf/cVbO/1gxmW9SoekkiBTowv
         ksMuNQSAv3H9eV30e+BtUmh/ioKoK8W4e/6cIBi90LS53rTn+arRLpSKMRlYJP7pRPV3
         deUOI8InCq0Pv+ZAalYTb5swd3utdVY9SCCeJXBoAKNVCxDcAWNbAyh1xtvzyFgmkQVf
         2GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696628871; x=1697233671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOpXwF9Jq3oUC5sH6SSNmfvvY80Bd5H/1Sx/EeEpTCI=;
        b=rnrp0DEdH1ZZqkEsJbMrw8WiLoCwsQ+97lMW6hH8mV1Fi71EenesUUEjSU9V0cnkmY
         3MtAmmuganXqhA/OuIRqmm+VAHvPIHbAOUs/4MA7Z6tNPEzdAeb/1tPzdrTSRtaEz0HZ
         HBgJbzhJIF2bWbt8DWXN30rijwoJwyhkwFmkTeF/jOHBIAjAp1Wp1OrHn9AzlD+0tIms
         EStbwVl6y5Z030vhTO1+Mkj9KegUVR0zq6+fqlFPr/C6URE+yBP87Cu99w5wDs5okKOe
         cfRKL2qrbAvRvE4H6lSm0WgEEq5+o2kTnB17t8D+akMe8cqDHdJn4UYQQ8dwZRU2y+O7
         d+DA==
X-Gm-Message-State: AOJu0YyDZYWCjWqUxCoPPgDcOX47TbNAU1VNolkjhoOob7J0vtdskGX0
	0E7CbBzK5HvR0U93WMj2MV1+GiIloZA=
X-Google-Smtp-Source: AGHT+IHWx8rvf4KsnoCtqwtGtOT0lbcF+GfaL//EFYL+MmONVY0uW6x8eq1G/8Ejc9lJsv8LBPhvfQ==
X-Received: by 2002:adf:f703:0:b0:317:ddd3:1aed with SMTP id r3-20020adff703000000b00317ddd31aedmr7781278wrp.68.1696628870969;
        Fri, 06 Oct 2023 14:47:50 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4802000000b0031fe0576460sm2500957wrq.11.2023.10.06.14.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 14:47:50 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] cmake: upgrade to v3.27.7
Date: Fri,  6 Oct 2023 22:47:35 +0100
Message-Id: <20231006214735.13635-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188790

Changes:
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1..ecb0e487df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.30.2


