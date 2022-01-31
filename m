Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD465C4332F
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 22:43:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.40864.1643669027562964888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 14:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLUcGdbT;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ah7so47557821ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 14:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=/IISsivAPCTToAOo3yj1MBRcc14NPUDocL1AO5kN3Nk=;
        b=ZLUcGdbTmkbo4J7IOeE7t+K5rHd1lzSKOX4LvysXtE7YGTFUbZgw+tXaDMieQid/DU
         eKFC5LCap1oM+INEpi1eHEmIcTjogdNHtzfcBcbdEuKNhH42cDKkzEn7oyP72WqjzN3Q
         Qkg0Nym8upvX15hOT7/NA4ePh6aVs3E0BUKlnVcw/z9QDeTdh5RND0GWITh7K4V6KGCH
         +vvq82IuI76oJCWmZH5EQL91XPSLMO3Kea4bOAH+KTAzumWbePVX3FHUrysQnoTnZN8i
         uukqwSnLjp++y7g9OcgBXvGGr7RQbRC1KYcEyWTXRWTbhmvfoVQfKbyWa8/g/04M5sxT
         v6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/IISsivAPCTToAOo3yj1MBRcc14NPUDocL1AO5kN3Nk=;
        b=k5RcQFs9NOHQB5LtPBCzPIme0q5fCwzPYS8Leb0uXTnIYs5U/ZdZVsYc/7lmXMnzq7
         UvXPn0eJgTVZWTxmGqn4PrXHLTVxFGOY4euqjw5IUFZQ+RB4dwdbbKzSBiuQAMOLDCOp
         QaaEO5U2/gTFtyqzUOxTcqFpE3ok5JtVkZw5WlDjUE025Uds6RB3FVj50a8zm5jc9/zI
         FVXogxOsqqDnxi6j6gXj91Qfqr2wxmZAq2ycjX5eBAySuH4c4VgwUK4lYVUpK1rdxdgC
         ggLMdeX2FY21ApgVkmuLgl9xCUUT2/pqyMFRLrR51rLjX70PpNOQ6tGEY502YCAJmTUP
         yeLg==
X-Gm-Message-State: AOAM532gp7lqaxUGD/ESPaeRcugdYnG7a9CPO2tckZvEY1sKct2m2dwL
	tJMzzHi7lwV0R6flZ8NWiEX7PIBWmTGVgw==
X-Google-Smtp-Source: 
 ABdhPJwNpa7Scr7qgMFTrzvUkjoB25cNunn9l1Am8ThQcsf1kHkU2yVqcQI6NHJoy6Tq63zYsmcTqA==
X-Received: by 2002:a17:906:1d14:: with SMTP id
 n20mr18714168ejh.714.1643669025640;
        Mon, 31 Jan 2022 14:43:45 -0800 (PST)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 s12sm13764364ejx.184.2022.01.31.14.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:43:45 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] connman: update 1.40 -> 1.41
Date: Mon, 31 Jan 2022 22:43:39 +0000
Message-Id: <20220131224339.54855-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 22:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161141

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../connman/{connman_1.40.bb => connman_1.41.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/connman/{connman_1.40.bb => connman_1.41.bb} (85%)

diff --git a/meta/recipes-connectivity/connman/connman_1.40.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
similarity index 85%
rename from meta/recipes-connectivity/connman/connman_1.40.bb
rename to meta/recipes-connectivity/connman/connman_1.41.bb
index edb23a1267..736b78eaeb 100644
--- a/meta/recipes-connectivity/connman/connman_1.40.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
+SRC_URI[sha256sum] = "79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.17.1


