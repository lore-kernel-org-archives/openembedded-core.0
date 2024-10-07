Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5386BCFB444
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 15:04:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.55422.1728313473566149542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 08:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmsHc3jK;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b6c311f62so39001785ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728313472; x=1728918272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTeiVx1UKDe4fyv6BMKEW1qdRScldnlcYTmzCUoaPpY=;
        b=FmsHc3jKvnX7h3B9yFOyCkTYdTkFbqx1/H+uqp3KTV4/U5l9dWwZ0SVjrF2Xkm8529
         b8PLMhUsup61vrZXkmHcDfhu/E8RhwsfxWZO/7hJKiQN8IZUilj8x0//K4ONke7P1qbn
         YzsLCSiuZqivVM6zGjJ0FiPerO7zF2IPyAXvkMOE4noaFan5H1MBE0UlSdRr0O0uYFcb
         zQkGmkVrFULNUsAu5JEFuBATpAmRgXCoSr1OBoHH9OCNZzz0PLS589q52xxLOMPwuyYs
         kr3bHAOuW7M5UmQOmMCIfeUQB0rzRZ35J5hzJ0g+cdUyzU8EIE9IruL0LKmii5qgxHo5
         Ry2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728313472; x=1728918272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTeiVx1UKDe4fyv6BMKEW1qdRScldnlcYTmzCUoaPpY=;
        b=Y/CV1+a+RsAiqsFfWCjW2uxMZzK5oP4/vI5uYcil3l10hBeLovhuff5IgsXBgkyMNL
         DH7BFd6rK/hex61fGs8SPsqaC1su0TKlA7OyiTIVlbOLMftnVhThSt1u8a+q1LBnbO0t
         71eCDcVccEh8CElAaDcbHhhn+4BEaFRpyEGUB10bMN3JMu3v8copkJhBYXTUBvfE6x0E
         J6XsaEMvrq+ldMvzL9I0QwauQBSROZfbh1k9/rpj5DW5HK7dBrRfHQ1Tv6O7zTEFuCt9
         uKCHcMwF9Dnqv6G4ZNaVq4FqmbqKzfXKDRCnln6500cUPQDxwSjXaidz2PtxTXi2m2na
         N9ZQ==
X-Gm-Message-State: AOJu0Yxwp+nykhmxOKeWdgWS+IrGN47VPIndJp6stqMXKF4irBUNvrz5
	KI86+DHp9eOw1staFbFx6KyOiyjIB/34Z1CNeQXAO+IVlD7Ew5XLRrwvBQ==
X-Google-Smtp-Source: AGHT+IHgIcFsYF9NAy5Cw6iAZmG90OfwnfjKNnNBDjG9TRnZvYx72/vm/Qoneoz2Sm+gMy/RW6cywg==
X-Received: by 2002:a17:902:d4c2:b0:20b:770b:ad3b with SMTP id d9443c01a7336-20bfd9a8db1mr167677775ad.0.1728313470302;
        Mon, 07 Oct 2024 08:04:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9c11:886f:c5a3:8098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm40743725ad.78.2024.10.07.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:04:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: upgrade 2024.07 -> 2024.10
Date: Mon,  7 Oct 2024 12:04:25 -0300
Message-Id: <20241007150425.128050-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 15:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205272

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


