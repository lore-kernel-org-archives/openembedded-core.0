Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EE8EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 10:05:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.183856.1692266711721500411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 03:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Sv5MSLvI;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf092a16c9so7326595ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692266711; x=1692871511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Us7SsgunHPsvXsOsVI3Tc4MbUIAjBpsluOuceI/BMXY=;
        b=Sv5MSLvI7u2+wmHATaTCFfLWvihscQ0t6Mu5PHmawUrMzNhum8mKPpL400FvUnvVIg
         pTBZ41/iK74xDHK971aZIBDJG/T8CXMKDdZVnCxOAOR9C5lVR/yAzsA9EhSbNbcEaK05
         Hq5PBTlvhaRtBqYzclcTeL6xk3Pf8TvJKrYBTZFr9AzhYIiZ58QLgZGd2clJ2FK4DCct
         z00PruhJKKa5Q/ZvImXY/SYteT54Nco20BQWEu+xAdCn0xvRyu9Z3spJyYscP6N2/2lt
         4PDkg9IXDZJ7WHUizTCrssxVThQT6sp/+MaetE8QBVm30KZUihKMQPG0Xl/JoxaOiL9Z
         hbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692266711; x=1692871511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Us7SsgunHPsvXsOsVI3Tc4MbUIAjBpsluOuceI/BMXY=;
        b=VFNcO/A2SOlacrwnOjQb9QWNJuAYgy5Xu25yRlBjUjnLDzJj/Ncu6KhAoEKXWRooDN
         CkxCGcMT2J0P40aE/eOxt7MUKbUpLiBCqgrRcoGvRyIQ67vAsE3SUCXUYqCsKBDtzxG9
         GbfaKzxp5bdxjwJZ118MJPGiFWo8U4DEAAiGe0QQpGh/HGtYXfphAqXJVDCI/D2zaqM6
         7rwoj9gbZ3ccyK4IrQHTvanyR1XpGe8nne3l8Bot0FIeJcLAEN8IIEyWu09OMChCZbIA
         g0zwpU+zQAZ6II2PoE/MvxxxbIRwphvzX8VhNG+qpWasVQ9wcmBq0eL2fVMh8ZR5rCgN
         VlGQ==
X-Gm-Message-State: AOJu0YzMiDEgiP5ffLR1ScfSDRSg0aP1Yu0Wiv2/7unYrU6LbWODO7VL
	FK6WmMV2cFj3VdkyFqZTM2P46lVGCcYc7ayt
X-Google-Smtp-Source: AGHT+IHTqfz+PS6av+Tw/Rf/FVmxtu9F8YfIZOCgqFcojD9jWvbWAnxswzFI/+jrcp2dlneoGsl1Og==
X-Received: by 2002:a17:903:246:b0:1b8:2c6f:3248 with SMTP id j6-20020a170903024600b001b82c6f3248mr5298845plh.39.1692266710800;
        Thu, 17 Aug 2023 03:05:10 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902cec900b001a80ad9c599sm14736355plg.294.2023.08.17.03.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 03:05:10 -0700 (PDT)
From: sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [mickledore][PATCH] glibc: stable 2.37 branch updates
Date: Thu, 17 Aug 2023 15:35:04 +0530
Message-Id: <20230817100504.1679773-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 10:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186303

Below commits on glibc-2.37 stable branch are updated.

58f7431fd7 sparc: Fix la_symbind for bind-now
260d4b742b nptl: Fix tst-cancel30 on sparc64
3f4b4e2cdd elf: _dl_find_object may return 1 during early startup
0930ff8eb3 realloc: Limit chunk reuse to only growing requests
8dcb1a5181 hppa: xfail debug/tst-ssp-1 when have-ssp is yes

Signed-off-by: sanjana <sanjanasanju1608@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 69e637e810..ff2b2ade9d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "3593050c27dcf691f670fd3fa9d347c99351ed2f" 
+SRCREV_glibc ?= "58f7431fd77c0a6dd8df08d50c51ee3e7f09825f" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


