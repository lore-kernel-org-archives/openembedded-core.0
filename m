Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D27C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 22:38:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.332.1685745520146077710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 15:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aU1MEiTu;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30adc51b65cso2389851f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 15:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685745518; x=1688337518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOH4m2mlzsROUJFKalKTjTKHB80OZMIj33J27+Hts0M=;
        b=aU1MEiTu1WK0t+GuZH2aUwZxMKJ97xqxOBErOLD7xM0uVbkOYCSiZSw9Z2bjR2zlWU
         +UPypei45jxXDXq0CJ3bYYw+rdzd94Sk9c++OfsKP7vJOPObJKFh8fp/9PKfnerL/clC
         IHdxFVTJyIjk2FBJHxbQHtb5JZ+9d/01Vhl0p2oO/dxblZkASzd5Nd3WYzAHQ6uKlmGh
         AAaSJOYM3/KO3FVLJrLC8jiuWH/YPzDH1JnjOaPC0vg028L9RuYEuGs9loxn8qTISiSN
         63ywEb5UtBKWk0ZzjaZWkLvWNfk0jeIVNl5k+zW8dOoen2V7VYcmYQTtD17r76hupaNv
         YQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685745518; x=1688337518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOH4m2mlzsROUJFKalKTjTKHB80OZMIj33J27+Hts0M=;
        b=T1MafFFMCrMDjEwcnWhpG2xBlzwZDsMXrV8ejWq0Ef3L0zUHy6AOdE716m1QhEbKPn
         CPc+H5tkNwEbPBio2KXGVrVYqhEj7mcWwGoFyQ7aVJL3Qiwv7gdjIZXBB0xiyhYL73JP
         ydgPbiHUl5pzNRHXYrA6DR2GF5C9m7b3wHBvlnT1s8tj0/6Juo7DWAfISd3No29vFour
         8bIBsdvZuYG2p3IzZQdwixtKZ2WbSCDLrVNv2yA/EjdEzIWWKLstpyhq6/WbjA4tQw+M
         G91c7x3Tb3pUuHWwNvr724TUuQ00j2ycNqql5W5ZcISz4dRVNXjkQd1CL3hiize+i1XT
         N97A==
X-Gm-Message-State: AC+VfDxFmWao5/rIuOIYTC13xqE4QxbeaYDANnoeGokHYaaMSfiG4mVw
	rWyFCR8Q7JPP+xPfWEuKHJeKIkk1ruA=
X-Google-Smtp-Source: ACHHUZ6TJpXw0mI3g1deg7UlbZsoh2qrdCA623yHVmgoAxyciwWfadPd0AiWVtiJ31AXSW5Xk8mpsA==
X-Received: by 2002:adf:f687:0:b0:30a:f0f0:1277 with SMTP id v7-20020adff687000000b0030af0f01277mr927757wrp.2.1685745518111;
        Fri, 02 Jun 2023 15:38:38 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe8c9000000b0030644bdefd8sm2728561wrn.52.2023.06.02.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 15:38:37 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] cmake: upgrade to v3.26.4
Date: Fri,  2 Jun 2023 23:38:23 +0100
Message-Id: <20230602223823.24742-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 22:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182344

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../cmake/{cmake-native_3.26.3.bb => cmake-native_3.26.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.26.3.bb => cmake_3.26.4.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.26.3.bb => cmake-native_3.26.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.26.3.bb => cmake_3.26.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.26.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 2b6554690b..7788a5c45a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659"
+SRC_URI[sha256sum] = "313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.26.3.bb b/meta/recipes-devtools/cmake/cmake_3.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.26.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.26.4.bb
-- 
2.30.2


