Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A720C87FCF
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:20:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.73317.1753672850158959854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDGzcheY;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7682560a2f2so326631b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753672849; x=1754277649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SohxOaCd6AUVtHn4RbhPRwEEQZ3ipUclwpSoH3qCco=;
        b=mDGzcheYMxL6N2L82o1UU/aAopJxzD6nqKyZ9WaIC2MDz7M3Jhe6JMPk1aXjMgXTCA
         pARurD6HPWqPqHghKvbBreAKJR0mRGyzarRsPi8TLEUqvrUT30Z/+av5jmsNNQ9ElOnq
         q+l9M/KRlAKwBVbUofcTdnEQL41Aqse9+XCQ3sJ45AJSag1ARKbH7RuuDLWp1r7U+v6E
         VaKUtXrphprJuRowXyh4/PznSWQGHQc0zFgLStmOc0SqH87yJf60eNZ1KX8Zb6yNDTmu
         UL32C8eB/miCYzdMiQ1wLyhZeS8omMooE6Fuyk5lfAhvt3NhiXbeU9SANHggJLjk6d8L
         LNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753672849; x=1754277649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SohxOaCd6AUVtHn4RbhPRwEEQZ3ipUclwpSoH3qCco=;
        b=tsrTi10JlpBPOTSrfFOyVT+qOP19foLQBoKQDccXl0MIyxS2pAfIfyTroKZt18XTwH
         zLeiJZIYaz3GR+Hia9d+AdD3N00L0C8mfXd8rP+ruvrEtEhFp0w4eWH0tJUwONzKgnIi
         bGF7L2TQwn044FHzbsBn1bBv4oAnN7UwQDrsL0/KWFGPhSy2acSrFS9wG0vULUMPo6uI
         c9VTYDwtcX+sySSVmLd8cwe5L+bMygzhxLNBkZ8mibCZrRaTId/6DU7GwfIWwKfExVdI
         HKE/HlbgC+IlrJtCLgfHYUdzr3FyyxlYLaQ9APBK17JN1X072Fy7lfQ7VS97AxW2c3mE
         DMkg==
X-Gm-Message-State: AOJu0Yy2kWMKMjYP7QiUUOkq1/EdQtfd7tUQgqMtfUhkAvyDlTU578I6
	roxpPOSwrGsf/WUPoyOqURVfpwEOv61WvuOPHC4cq4SE3s9DOiNbru397dePoUovqiI=
X-Gm-Gg: ASbGncvNMJ2E8i1OvZ4aKN2dUUwCzN5w4Tp2r4vazvv48TO7csE28pFQUoH6Fs/S0iZ
	pHrv9wbvpIma3fW3Evqn1psxTeS3TztLDwzMLbyQmrsDR5B+rJccgPJtePFDYjVW49LDVQQ5a3K
	YTKdO5DmO3GfMeCYolhNvHuYNAGcmBEfSWxpIjVf7muN33/cYyxZkFPtn53IVRobLGEkghTDqRC
	cAg/G/ZA+UOar5EMrwPRBF2x9/dmHuXbbZsquaT7wBC8Ziv7+kWWTxbVw7am4B92EqbQMpows4y
	UbgxO+v1LVTtIe1FNiuQsCbenEEJho8TFanQfoFmTglIFJsVQFrN+t+oCl4jXZ+E1ZDEka6ZREe
	/J+bvAm1jV5IKfg==
X-Google-Smtp-Source: AGHT+IGoaUunSmjsu/uUiF7ALyoq3zFPFz/aq6OacWusNgDHGgPxPkXkHc0OxxSOBpU5nBWuJZybfQ==
X-Received: by 2002:a05:6a00:1a08:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-761ee65d556mr16232280b3a.2.1753672848946;
        Sun, 27 Jul 2025 20:20:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm4359785b3a.33.2025.07.27.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 20:20:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to 1.4.321.0 release
Date: Sun, 27 Jul 2025 20:20:39 -0700
Message-ID: <20250728032045.2783514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220984

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} | 4 ++--
 .../{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb}    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} (84%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
similarity index 84%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
index a551814689c..1da2e74f93b 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
+SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 4594a1a9426..319b25b7f43 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
+SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"

