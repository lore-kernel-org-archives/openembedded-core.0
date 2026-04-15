Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792D0F42113
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:15:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1796.1776276903632023477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DQ+CUu+o;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: mail2szahir@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c794baca11dso1514226a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776276903; x=1776881703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyYSL5wcNzpVS5gyF9WEGXsoGuPGcQLJVZNVYO1mTu8=;
        b=DQ+CUu+oVBlWhuNhShY9LtDQLZSfQQpPgoFd6wcTtACRX+bdVW7/IlANfZO6N6BpKd
         8K1Qb/FJP5SdrErNMr0znKpuV3a+53YnVoub3eBaBIO5iVGCUYDJ0zByxhQiEPzqSnL5
         B/2phedODs9ln4C4S17HkQTR+wavHzc+4Kw84Nn1pzVRW/Ehbu2Ktl6ML9iYQwsXmvrd
         EccTl8NEi8TlHgJbLSA5sGPbnf7qeev3DFWPzfDAkBykzcO3uDXXJwticszbyfPfsUF/
         tKmmdVwmGj9rr63YXKm2Y+bNQ9lAk9yVyVGpwZoSIoyeVvxZtTY550whlZUar9YYT/KM
         9D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776276903; x=1776881703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyYSL5wcNzpVS5gyF9WEGXsoGuPGcQLJVZNVYO1mTu8=;
        b=Rdtr75cZW20v78QlEhNLBFj1y/aIeSpV2j+VfPPPLnDZCelK0ZXLbtpJdC1ra8/6vU
         e1Fn23Pk5cwrOS0WdO1wnJssmkLHvXPUUD+Ltv7HZg+kEgi8+diugMMZPaNAmLXk3bTM
         /6tdQIiRzM9WR95W6feg9JUAva7VeXGgp5tw5Wgkfg3qezRG11MBEqhL43pp0wOtGIXs
         si/vMOBJw8bajY2PV4FvVnttSfOKOPV3qxkR2TOBqsJey78IdpgWqv033rMqd/xPdKRM
         jSByWhV4o2IO91+J+xcupPpMCBiImWLBswsFIYXJcDyW7zhrf14IoB09B4GoVaxzB4Ry
         UK+A==
X-Gm-Message-State: AOJu0YxkKUi/qss+PgLDjeG0b6lmsaIG6aHWUkZEaDUTjCFMeNeh6ZfA
	vx9z1OQjdt12YsHyY4F3u/k/ZwX2hDPzxTDLjWvUBniEN5L1pbG04yeWNMMF2Q==
X-Gm-Gg: AeBDietYupq+Xo0UG2PYdUGeoGLHENeM6UWfZiBSuMBK22/nyBypDgbu1hD8ku+KgpN
	VRi0Q+MV/Txdkta6xHZ/d/i4zqmpL0XAiQ6kmE1c4hM93jDOv9t/v6c5MPSMrk1WKyo+9oN2N+l
	ty7rSZ6krdIciI4gpSPWmURzK7/z/N9dX5nHbQBjskYiVta2IYbsBzKLDAFFGEExWl9o1AgtYGi
	sVi7mQ9SrbJjJC5lEu0HKitidadNG12hesVear+ouvbviF6j0ImyM+HpvUQuABb89/Kd071IXlS
	ilVQQWX7KA6Px8kFRnDLFTjumJfw9wJXB2DA3pw46QstcMyE0J6gt3VkCDwZoDlfBrLQQxFi8AL
	ZaVfSbroKYYoXTyd7UqO+2yhWxDhZzXeioeGOyI+fan8zabk5ODF6jAjoNCjD2MNlmG0HGX1GTS
	bMSRpsIosuwDtX9S9BS8uu+nVjOLhmvM+wPRpf6NZxCsaWlQ==
X-Received: by 2002:a17:903:94d:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b2d5a4992emr227623595ad.30.1776276902725;
        Wed, 15 Apr 2026 11:15:02 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478291a38sm38834725ad.58.2026.04.15.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:15:02 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [OE-core][scarthgap][PATCH] rocksdb: packageconfig knob for set static library option
Date: Wed, 15 Apr 2026 23:43:54 +0530
Message-Id: <20260415181354.1189841-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 18:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235316

From: Zahir Hussain <zahir.basha@kpit.com>

Adding PACKAGECONFIG knob for enable/disable the static library option

It is just a follow-up changes of previous commit
https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=72018ca1b1a471226917e8246e8bbf9a374ccf97
and also this changes are already accepted and integrated in kirkstone branch.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index fae54fdba4..a55a8eb59b 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
+PACKAGECONFIG[rocksdb_static] = "-DROCKSDB_BUILD_STATIC=ON, -DROCKSDB_BUILD_STATIC=OFF"
 
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
@@ -44,7 +45,6 @@ EXTRA_OECMAKE = "\
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
-    -DROCKSDB_BUILD_STATIC=OFF \
 "
 
 CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
-- 
2.34.1


