Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C1EC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:59 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.1716.1645114198570545258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R2pwtV5J;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id q17so10571161edd.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fvj+Mau3fZm8nhNv37SZYh873XARpkwWVBCS0eHn5U=;
        b=R2pwtV5JX/2JwW2COHM4tS734B4lP1BocvXYnEwReVKL6fP5YCqnIvqmuQJQEI2cJY
         qokziONJlzLIWAX0bTliihguUFpynD0CItVfj6fkENR8kgR0RP7pI2bp/AqEhe/P6tnH
         kkMNvDd0gKM6lg7t+frHFCB3odZIbOR39KGNN8oMB95ffCfKHgKgVNjbHB0zTxxkbiNd
         1V7DIJdnvFE99mXuMwbOMhxhn09w3OuE0hAAYVD6TI0UHPQ0r/cdfN+7aQc4gygJ5zHD
         UIYAZy7HalJ3nRHloM4XhLSHasLvRAGaCHm6axMt6vck64pqy2fOOlyXco59qdALdU0j
         kTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fvj+Mau3fZm8nhNv37SZYh873XARpkwWVBCS0eHn5U=;
        b=O4h8j3OA0bqup2QYlzpnFlFLTybQF6yZrWSNqMv159h1dTkvIW278weWz2ciBQnsnq
         q2xW5CkZ7SUMZTS7IawX6zPJj7e655DpYbyXY/UgM3J2o9RH1rP8iP0EgNwM+T3Tolfd
         FaUAtXRtBGscIR/TIDufjsklxVoReA3uLD0fMU/FAyrZcWyILKqsEm3gB0BEIAr0v/Ji
         LNa1h1iwY2kCcPK2k4rzCz1QeT5LaQo1zolGe+SgWLT036J9efZKyvZkMNLXAW/xHeAD
         dVRawYAQpEswTme4vh5byEUgVerf6m7xhqnU1HV9pLvKe7nHfkPuGs4ajlWHJ6Xpr8Mz
         HCeg==
X-Gm-Message-State: AOAM533WI4jqfDVQ1rtEqS2EJ356oEqqiO9xt3i7nYCgMv0Bsds1Lj1X
	iX55ZbhsQid/QTVoyl7kdVeavdGmBlc=
X-Google-Smtp-Source: 
 ABdhPJzN98+y1xNuhjMtfgLnYF+XOzP0bPtVxbDdFJjYXe/7wK7gZUZp2D87gzAolmrbiiF07eOlYw==
X-Received: by 2002:a05:6402:1681:b0:410:a467:833b with SMTP id
 a1-20020a056402168100b00410a467833bmr3340964edv.412.1645114197137;
        Thu, 17 Feb 2022 08:09:57 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/28] vulkan: update 1.2.198 -> 1.3.204
Date: Thu, 17 Feb 2022 17:09:20 +0100
Message-Id: <20220217160939.1424397-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161826

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ulkan-headers_1.2.198.0.bb => vulkan-headers_1.3.204.0.bb} | 2 +-
 ...{vulkan-loader_1.2.198.1.bb => vulkan-loader_1.3.204.0.bb} | 4 ++--
 .../{vulkan-tools_1.2.198.0.bb => vulkan-tools_1.3.204.0.bb}  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.198.0.bb => vulkan-headers_1.3.204.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.198.1.bb => vulkan-loader_1.3.204.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.198.0.bb => vulkan-tools_1.3.204.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb
index 43c0cdb53d..7397f40fb4 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "8c1c27d5a9b9de8a17f500053bd08c7ca6bba19c"
+SRCREV = "1dace16d8044758d32736eb59802d171970e9448"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
index dcd6e02ba0..23e178588e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.198;protocol=https"
-SRCREV = "0ca96994f92b6f21b37badd6c99b22f61bfec932"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.204;protocol=https"
+SRCREV = "6a2458b649aae2a8bec8259c2485e7c0bd0465ae"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb
index 09f75383c2..ae062f3ee2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.198;protocol=https"
-SRCREV = "8040a7af8919a47346cfeaf1fbc2ebfe09cfea09"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.204;protocol=https"
+SRCREV = "b9a87a24a814e443b1adfc5a6bc2e57243446f6c"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


