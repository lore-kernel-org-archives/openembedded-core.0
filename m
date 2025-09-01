Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3807CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:05:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.46134.1756713948239351601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WobKIalX;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: dpmin7@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77251d7cca6so720451b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756713947; x=1757318747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr8o17dYU1DPJmtrJNHpP1nCGRuxcSZWRFDSJjYJkgk=;
        b=WobKIalXNs3AYeppmIShnnDNSeljbiCbUehUqTGLXaJJuwtw66Bpnm5fo6zIJ/kg99
         T6gDPBuDq33cFTdYhCijBDiwAQ1VyR1qR/ZVuax+a6Wlxmw7F10ollPhW0tzAe7Zg6bR
         zHHUjMDcGlJsLZMqHoZ9tvtgK6LCPdxtRd97vJOHwEMpVM9bSWfNX5Bc1MdXOYYn/VLc
         Fw9XnpQFXNrR0LriHu+0PhV7nDLjn+eZ326Zk0Of0sIqB5WIZa76gzdqzQ75PTr6dPa2
         z16BzmpxSaWZOFCE0pbLFvIyy6RrN3rJ2a6E9k3Qwu96Q6hDZajfhWDt8yFyhNNn+BfZ
         oLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713947; x=1757318747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr8o17dYU1DPJmtrJNHpP1nCGRuxcSZWRFDSJjYJkgk=;
        b=AzqujbEuEQqm6wwZbGkkP+agO8i1HQc6bwS00T6h3DrBbMuRFG+jI5DHR7l3ISigIr
         1vo+n7gl1QImUVf2lgW+uXl8Xtism5ZfES4+R4yp/K0SJCtAJcjfBTMKmHQ/2LE4iiom
         D2BIHLBR4TPicWoGYaIwkDngt/eyga4C22mjWZGHlkBo/PKN8dab6/eRRhqCNTEndIsb
         a6OESjtKnOfciT5LxaDWrtfBgAyIl9szftQmnAS8gsCjABeedKEsKYcnkwctaov5u5kZ
         DJl3YSNT51O8H356FJCaHbCWAsozA7z5+3cDdiZsMhnAyUvfZLiZIN1rzkUh44Xqo7mX
         qzJg==
X-Gm-Message-State: AOJu0Yw/CiTg69pkzUIYN1KhSJROwabEKqk11V5sxBKybzMtt+F0NvoG
	QIerFUamP1Czrc3YhFdHhTT96OrJOZrjTgyhsFTG2akt/51u71eEX4MA2gsF9Q==
X-Gm-Gg: ASbGncvrvP1xDf0gUYMhtiVzfwhdmj2kfKQMdgedimNFPKLE5xX5KQZGBn71/0xr0Zr
	LYF/4PlsNctMWGxfQnrgXX+pt4S2fDy6Bm76iL2f17KwZgbygpFfe70cQn1bNws156Vk23tT+nK
	zrnL89zzhDVM/MIIBHOTSHtxuqA8erg4TpGMYwE+kR9jNvZwi2VCiyY6V6hcgt/1o9nzLdVNv4i
	zCYPJoGlEGXOPRcoydvjYMnwsL3reFuBHNmtVJyncsDtKR76e298VK/hnQjBRax3jE4qIwcpRIL
	f66zq5dTN6whslhKzeClJQRKgZckW/7qOlEgsEQbdEsIYUhHjZnd5nhRJp2htR77/r6WU+YO1bU
	lk3ve6dMPl5wrpjSrSQ4xEQ==
X-Google-Smtp-Source: AGHT+IGzj+ENvbkmxJt6oTd3+CaH2enMCxIxa3m5OsIPAvROayKFTNL8sy/W8ONre7EwfpiGO+fACQ==
X-Received: by 2002:a05:6a00:2d13:b0:772:2fad:ff64 with SMTP id d2e1a72fcca58-7723e257daamr7704835b3a.8.1756713947001;
        Mon, 01 Sep 2025 01:05:47 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bcd09sm9563814b3a.49.2025.09.01.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:05:46 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [kirkstone][PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 17:05:41 +0900
Message-Id: <20250901080541.895041-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222645

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-atlas-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 61d5bb00ba..7b9d245c07 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

