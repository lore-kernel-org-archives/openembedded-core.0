Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A987D16247
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:36:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.52770.1728905757287600064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHPop7TW;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20bb39d97d1so34834725ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728905756; x=1729510556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTeiVx1UKDe4fyv6BMKEW1qdRScldnlcYTmzCUoaPpY=;
        b=DHPop7TWSjP0MsPuDkFmlreyWTDZvo/vmrcaIuisFKKtohPfu1PLDEZy+PMhxbAZk9
         jsTxQfJh3jp9jFORRwkgR0nVqCKoBRdU+xRJl2HSNyjG2vzJgsP28YnLnV5TqRSrmE+N
         WIfd8l6CUZMPG1oRynmEULcgS7tZazFsXtIXGBjdRHIEqT5t2eVPCmovWkZfMKbCURKa
         VOGnQg24gItp7Cs345zoW9ouIt0qHLmU2dSJk19MORvW4Fx8jKzU9VL/Ctd+NSJw6Lpb
         gIl4pZ1qRMK1LoQsLCwUjf2Q2tGRwkeo4MIAUqsaKX76ty4fCDPh7NVi+wgVrtGEu/f+
         dMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905756; x=1729510556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTeiVx1UKDe4fyv6BMKEW1qdRScldnlcYTmzCUoaPpY=;
        b=rRxvB5/K7mviW+/XyURnMoXuNwNmr1ZUSCDM3frgSDclrFvNJ7jjdf7PwOAcyWJpyt
         uK8roSg1TuYt3Kx8VHIRxezKb+H4ZdR4Xwmz5r/bTTeKnA9pHAZga2uuipDsC/P4I7uc
         uhkFdjB35WNyPuM9yRvn+ANqxbmsJtJfBcYFL1IAOmURymwNXnJnEb4dEyRhNQBTwS4u
         IDqXrKPdK3+uXZkhg5c5llqvfXbovoGXjFtx4XMC3GoNL45vwJ9XkZg9S0dLj6ZjBWn5
         ptorgUy6DwCxvj25MfNIdWCc6gYev2fZaVfjNeDiLmkB2Ox5qVyZbJ9pQxgTcGV5XDxd
         djyw==
X-Gm-Message-State: AOJu0YzBncbCS/fmudfrbJHaSlzHdV15AC6E6WCjDswSw9zzx+/nK8yA
	zCj2VOBiHubS48NE3IrwqqvXDCvnP5AYtmYk/siI4PZKuyU8Ee0azwEjDw==
X-Google-Smtp-Source: AGHT+IEf5HPnzYDsBrFFiJJ5+puavB12LtsvS29Qy1oXUnj8v1hlpi9Ylim/DtT6slzpRqC3GvxOpw==
X-Received: by 2002:a17:903:2a8f:b0:20b:b794:b3a8 with SMTP id d9443c01a7336-20ca16ca9edmr136854305ad.47.1728905756158;
        Mon, 14 Oct 2024 04:35:56 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:94ba:d0e:3595:51d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc0d34bsm64323735ad.97.2024.10.14.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:35:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
Date: Mon, 14 Oct 2024 08:35:49 -0300
Message-Id: <20241014113549.1594444-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205757

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2024.10.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.07.bb => u-boot-tools_2024.10.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2024.07.bb => u-boot_2024.10.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.07.bb => u-boot-tools_2024.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.07.bb => u-boot_2024.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1b5382a6ad..113f215cf6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
+SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.07.bb b/meta/recipes-bsp/u-boot/u-boot_2024.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.10.bb
-- 
2.37.3


