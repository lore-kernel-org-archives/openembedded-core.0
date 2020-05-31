Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.17850.1590941280704207596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 09:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LoZcN6ES;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id k8so5442637edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HHeJkluf6FP3i36S3LinDRCDzIHZyNouAMdqPV4byrE=;
        b=LoZcN6ESdR9ExV5QAMStH/darctZj9cPYPr/eKSfQ8ue64VhPgI/5NcXOoDE9+AI1u
         0Kh6tzse2nFD/cwVRnVZXNAadeig2e+LkHmjul8fAJJiz57/LM3Dk0kievHWtcm2eZ4e
         gjk2ey3VJNkNLwEN68ZDjRogU0KpOf7/qop7a/lhhwQ4fj5B54hQN+bcsiDSxJkAps5y
         QOq1C9XJSzoMYZdEPw6zQmP17YCDZy9jQnfAPxTBa1aEWHr4sa/BILHMtRLIdgEqy7E/
         G4vgfvwSDHrlTJjWn3q0MnmC3h6QUrgNgA7jK98rdTN9mpxNxTNVQq/qQZSnWEnITvZ7
         Ktxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HHeJkluf6FP3i36S3LinDRCDzIHZyNouAMdqPV4byrE=;
        b=A63aifIh6NjOsJxaIu2f57fefZobw8tuVOikIbBkB+wvFWZPt0qZyT8ORBUV9iaQPg
         6eICPmw2WmJaVEi92T8PC0eQruWbMCAVXX9luuHLxe1J2FrBTI0n09XPOTykohX1J4v7
         M5v66TclOznA00OCQgkNZBuB6kfdA+kAytb3ChjF/AxU0e0w95sChNCln1XtrIBijIYd
         bI6DUBjTbSgUR2ULGPUyjopmpGuzdCI/OylN6apo2UNsxiYZSPXmWk2CpsffGXGGCckM
         5PS87D56t3ob/8hSx19PCAImGbuQAiEWQGCegWpkbfsOm4WOnLb2tXQw13TDh24I7YtS
         TppA==
X-Gm-Message-State: AOAM530gAXD4fg1eB8KH5lRJmUvNB1c8R5d8M8Nnemy7Ok99FPbqWK+n
	2Z4Mwbq4VVZLhqmkxOHt02iLsU5U
X-Google-Smtp-Source: ABdhPJw7vk0B16AsWlgvObrePPuB3Dh3Jlygsl7Jya4/PIxrLaW6MlExIniqPY8XiUQ+820m80yP5A==
X-Received: by 2002:a05:6402:c0e:: with SMTP id co14mr17288287edb.177.1590941278913;
        Sun, 31 May 2020 09:07:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dm1sm1579561ejc.99.2020.05.31.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:07:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] apt: correct Upstream-Status
Date: Sun, 31 May 2020 18:07:52 +0200
Message-Id: <20200531160752.11031-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../apt/0001-Do-not-configure-packages-on-installation.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
index 41831abe42..2322bd8e78 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Do not configure packages on installation
 
 This is done separately in do_rootfs().
 
-Upstream-Status: Inappropirate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.26.2

