Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8803DCD3427
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 18:11:06 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21414.1777918258221403957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 11:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hNKwRJmA;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: festevam@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c19d23b19so6316023c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777918257; x=1778523057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlrIAJQCl6SjofJNpePwqEwWp1RY66hSAc+g0A4a2RY=;
        b=hNKwRJmAmcUl0RNnY2B4Sn0Eggmk55g8cpSr2Og3LIxaIuF4NMPT8lDJGqg1r/C8/R
         TO5/81T90WZN7WWC0RGjbztGeSFoqQSHlVFTihHFQTJwxIIyJnuw4/LTeY3EnsxHDZWD
         qxOfhjoZKaA/XLg3N83cupay5MBwVnI64ZWEn5fM47ozL/93i9vN76WbFdDhTYgz4khF
         biaR20TQqJ4/VuzC8BEzn1L7qJoUTbq1s5o4RpUuOOX+AYd5g/d7hA1PqufQSX/wVKBX
         3/qac28W1i3BLuI8gJTJRM1Hafbhp6CMzyU7XLFnA9ayYlyWFYUAlzAXBggRrMv4BfdG
         ckoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777918257; x=1778523057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlrIAJQCl6SjofJNpePwqEwWp1RY66hSAc+g0A4a2RY=;
        b=qZthKvM/Oqulp+rA+Wn0OwPzqu35vd70qmMRXfioOrU44yRL1/VXOMpa2qfb0uJO6b
         bkyk6p0oTHeacMpBHTSQac5mRoF/y5/BtI6rKYKesSntZfim56+PmgjS77AvCAapPksn
         ECkw7F2fxEU63s3AmspkeDv7k5/Taewlo0lXdFjAxetVFuoQZ0bVQ2vJEIz1GltwiJNd
         +WITFMDLSAOxJt08qpOS3Q41sgMbxOI261k9c70SCBF2qtMR+szCsgN+VAMp7mMnnY+8
         DdQsQOa/+8FcerSG9znDZRv+aaIhru/oeIQdhZmc6e8QsJ4EY5Z2SA7vq+i4ekypo7gc
         1LxQ==
X-Gm-Message-State: AOJu0YxlHirPa6Q3k2YgNASzlMzQcOWYgrYgOeKVWQI2lZNwGd7vHll5
	WSMU6GJaF2nwhpRveRIvpasX8nCK22ttvQgtj7LaZYVX13/7DfOlGAKN0s5ENw==
X-Gm-Gg: AeBDietB0xHXB1QX2vYVVq1LqoeDISe8yHOyoRwRv0jaTj8ubYw6gVdIFAyTZaEfasf
	AZbJ2KL5kuK5VO+nXdsQUTiIngLzoqlA6zrhvFFvrY5Pkia58fMz07uKUG8tr6qSBuNGafRM7Q7
	VSk8nI/1TMTho9pqHCVJW3U1djeew9pkism2GvhYAIwQ3lHJ4uwHQ2ku5cQ2DHYbCRk6ONo5P4D
	4mlJzk4IBiAxDK0FtNsa+QVM326RjP56K3DINrmnQiwp4eMyUchMGgMumuQMbJy4Foc7wgcbnBS
	LraPrzyZYBL4U1BMBxBLA0rUCkZ/DyL67JXHmM/hPjpQkV3L20PrZANYvY6Ce3HcxiMie1TCfiO
	LWHwfTJIhuatMV2CamopCNHW17MzzyjmZPTUKfIukziCq2M9KXoj9V8W51NsEW/5zBOzK2V87mh
	ykzRV0wU1j6rkm5+09W+fWi0oACD4ADzK+OL5jrOuA8mj7b1rDiFWMiJPpZarp0jEVtvMC80WkJ
	UPaj94l
X-Received: by 2002:a05:7022:512:b0:12d:de3e:be89 with SMTP id a92af1059eb24-12dfd846d9bmr4762439c88.37.1777918256888;
        Mon, 04 May 2026 11:10:56 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:7659:44cc:3677:2183:22d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm19282491c88.10.2026.05.04.11.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:10:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: joaomarcos.costa@bootlin.com,
	marek.vasut@mailbox.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot-tools: Update Upstream-Status
Date: Mon,  4 May 2026 15:10:48 -0300
Message-ID: <20260504181050.3525410-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 18:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236451

The 0001-scripts-dtc-drop-yaml-in-DT-validation.patch submission has
been applied in U-Boot mainline.

Update the Upstream-Status line accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
index 4913366102ec..9c1adc8faf01 100644
--- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
@@ -23,7 +23,7 @@ libyaml-native from u-boot-tools's dependencies.
 
 Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
 
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429144615.142350-1-joaomarcos.costa@bootlin.com/]
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8ef8dee4f3a2b2021decfefd853dbd2a1632b77f]
 ---
  scripts/Makefile.lib             | 6 ------
  scripts/dtc/Makefile             | 8 --------
-- 
2.43.0


