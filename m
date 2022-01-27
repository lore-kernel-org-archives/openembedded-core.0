Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73179C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 19:11:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.2336.1643310707070886223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JU+oPVXA;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id c23so6569352wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0zgLAJnoqmby3fXrVtjQ2tZ2H+W6dSu4Ub97xk8D8M=;
        b=JU+oPVXA+3KXXwf7hgnSWhEdbnsXPrKx3iNlr2ig1k3IXLcYijcN0lV9ZbvcbTLXm0
         O247OoMpvXG9lCVZ8iDFVna6IcLXJWKX3houA7Gddpr+KXHnJ7OC744KShxhzd7Sw1qX
         /3VA4Zon/B1wFHYZVZ3Za5Y66kGBfKF9vZCqOZ43VkbN0wq1ENNseclnjOCpKiTH/nUJ
         v1jw6G4MPn0MZ986zpT8Ioqe/8DC78/UVmNnjoCUQzJgN8B1vKdrapVqMdgVZTndtWEg
         diPMj7nRvWEu2snjA+2Qy8GPGbm+GdVyI+r5q9TNISOsBFM2OIIqM/FA0UfhqAeCSoGn
         04Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0zgLAJnoqmby3fXrVtjQ2tZ2H+W6dSu4Ub97xk8D8M=;
        b=PrWMlTq8N+hn5xnnQqFYWlVZcoySwDH/vw00lWTcsLCeEVzUQdteb3PEszJVvSlI6t
         W4v+9v8D6rI+H0nKPG7v+qgIuJxnvksA6Ahf6g8fboEu1zXgzq5X2go4jIfBP1C8Kuqo
         yH21c3LSyIvN/PhMCQ8OF1+zgQHiquMDsPdVioLFKLpJoMfjoSitU9r9V5io2BLRc59p
         Yx++I6tmpblYe0IY50Ir/BQMMf2MI9yBqyXSQuhrMub4teEau5vSXQ9XXOXLbuShD5dZ
         7fDawNBBDBjx+LAj3lrG0xkdjfQqJinfDt4poF4QEJDTaW6CO5za8pZa0hXGMVU00muw
         ucGQ==
X-Gm-Message-State: AOAM530V/9qMN0TpJg+UzFnlkkCs65qp6/vsnRptwxr+iANP90nlyIm2
	aZYmczbVzLC+lcAsBH4R+wx/AEKs7zU=
X-Google-Smtp-Source: 
 ABdhPJxcBku0sahOzz45Sngj0ffNrXB6O2yqCwk7TUcoFUL5NAjfLeYQNao9A70FzwQELoO9kmVlKA==
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr4141628wry.494.1643310705191;
        Thu, 27 Jan 2022 11:11:45 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o27sm152154wms.4.2022.01.27.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 11:11:44 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] spirv-tools: upgrade 2021.4 -> 2022.1
Date: Thu, 27 Jan 2022 19:11:31 +0000
Message-Id: <20220127191131.2533049-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220127191131.2533049-1-quaresma.jose@gmail.com>
References: <20220127191131.2533049-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 19:11:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161049

- General
 - Add SPIR-V 1.6 support to wasm build (#4674)
 - Improvements to disassembly within PassManager (#4677)
 - Basic support for SPIR-V 1.6 (#4663)
 - reflect debug (#4662)
 - Fix endianness of string literals (#4622)
- Optimizer
 - spirv-opt: add pass to Spread Volatile semantics (#4667)
 - Fix constant propagation and folding of FClamp instructions (#4651)
 - Manually fold floating point division by zero (#4637)
 - Allow ADCE to remove dead inputs (#4629)
- Linker
 - Linker improvements (#4679)
   * test/linker: Code factorisation and small tweaks
   * linker: Do not fail when going over limits
- Validator
  - val: interface struct with builtins must be Block (#4665)
- Fuzzer
  - Avoid id bound errors during opt fuzzing (#4658)
  - Avoid uninitialised read when parsing hex float (#4646)

https://github.com/KhronosGroup/SPIRV-Tools/blob/b1877de5cd776117050bd42f08d04b52bce16099/CHANGES

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-tools_2021.4.bb => spirv-tools_2022.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2021.4.bb => spirv-tools_2022.1.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.4.bb b/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2021.4.bb
rename to meta/recipes-graphics/spir/spirv-tools_2022.1.bb
index ed56f4668f..24142a4fe0 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.4.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "ab8eb607750208066e2d57eff6a34dbaf05f5ada"
+SRCREV = "b1877de5cd776117050bd42f08d04b52bce16099"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.35.0


