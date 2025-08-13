Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62448C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 05:14:29 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.93696.1755062067554374105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 22:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VXdxVCPM;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31efc10bb03so5357565a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755062067; x=1755666867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09X3XvHgpEiI59pu+ZMTUq3IDA2Q7+V5hIEvpjJ8ATY=;
        b=VXdxVCPMc8HSxYcJMZeGESi+hSkBfRazuMLLPlNSZCN2Nd7NnXKTGnDdamwKp35vpY
         NuVyA/vh6ZEomHSFP6j1NdPO1TkhIeDZ2v04lK+uv3wVtXIwFgYrxAjlwxCZmunzlLnd
         YEjGbGf/kcUGa6h7qJH+pZenm/2XkKRuku58VAtPRNL5p4QhzRbeZnIgCrHzzYqqHukW
         DzCsfDf3MvUt0rqPFRXpiDMwaAyQHDiDaIcgfL+iHcyXV1+TuWFygu6Vf/j9wUXF+msj
         2aGQTaJiZpKSKSwD0ecnM6mv3EgrpohHHJ2PAkFIxTZrRp8v28THyQiySN6izgkPv5SC
         qSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755062067; x=1755666867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09X3XvHgpEiI59pu+ZMTUq3IDA2Q7+V5hIEvpjJ8ATY=;
        b=d2HtUp9oZiwn2Hk5eIi7tHcGLT+NyNYO3qtmOh0EZo7OEtrwd8Tk9IwPj0ClZKyeCW
         TFDj0b1gYyLn2nPiu9xKONFShbICyTJIv6Qzse76bTyb7a9E3od4G3nj6FPjNliXjhNX
         siwK4F/ZeMgR1Vk1pqyRJtFsb8Zaa5wPZW9TLT1gJVc7OL37nrR3mLv6tHuT5KJ7fejB
         tCZSDzNLZbduBrLCCdsKCAlQX3XnFE+D0iPMRQ7NmqYwlQ5ji3d27t/PMpF81LoRVcI1
         Y06Q5Y1x7PzNm17atte2n8O7+rGIUG3ovC45U7JJ6zUp+M6WQyoJKAkKJuUiLan7EKpL
         jGog==
X-Gm-Message-State: AOJu0Yy44wTbBSnT2Wd+p9SrH2fS6H14IkaMSvxIsLvgP+8kjScNJWWJ
	dXgH/CR8A0MKfQJ0xk6C4ZsgYQ2aG5wcOJw0A/aG3OHfM0irkDRH5W7rFECWkeEhkq4=
X-Gm-Gg: ASbGncui4NMJf3kW3YmnWeZE9+TuBwl5plB3+j0L8tW1OJ8BEFruXoVwGtzawqOWciN
	au0LCKSdhKdNtkmWaFcX8M7EIT6rMqhAgXrmSGPzBwMssj8r45EUe4gRpf+RH0ynpGPKZTCJHlU
	P7Grw2RfaZPubzNiRd6LGOCuU98b5W4cwivZXOOzazPaVHjG6U1slN3EfJYU8k3qPSltLzx5mMz
	vBeo4TB5BWTu+0cE/fvlIqN52DarPaKiFNW/cBMSIQ9hKS+RfrwNbigS16nPIPkMOZYYkH9K4Gk
	BBVo20og9dZkJERe316qyQdeFHyubQ/Uua6oaDj/3ncI9l6n3ZDqlRud2JqHh7YkxRtFt0IyxWt
	DyxK7NCpA92/Nhk+6cfd8v8WwiWaXyho=
X-Google-Smtp-Source: AGHT+IGji5egPfdc0DkU17XK8vb9jskP+L3q2GDikIOsAhqgRXQ2bGWocD5//ps/gfyRWRMUkkaUrA==
X-Received: by 2002:a17:90b:51cd:b0:313:2206:adf1 with SMTP id 98e67ed59e1d1-321d0d68aa5mr2669796a91.4.1755062066415;
        Tue, 12 Aug 2025 22:14:26 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1d78894sm883367a91.6.2025.08.12.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:14:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH] tune-cortexa53: Add nocrypto tune variant
Date: Tue, 12 Aug 2025 22:14:23 -0700
Message-ID: <20250813051423.325405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221787

crypto is optional on armv8a and Broadcom BCM2837 SoC found on
rpi3 does not have hardware acceleration for cryptographic operations.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
index a88575eb156..198eead906a 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
@@ -6,13 +6,17 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa53 cortexa53-crypto"
+AVAILTUNES += "cortexa53 cortexa53-crypto cortexa53-nocrypto"
 ARMPKGARCH:tune-cortexa53             = "cortexa53"
 ARMPKGARCH:tune-cortexa53-crypto      = "cortexa53-crypto"
+ARMPKGARCH:tune-cortexa53-nocrypto    = "cortexa53-nocrypto"
 # We do not want -march since -mcpu is added above to cover for it
 TUNE_FEATURES:tune-cortexa53          = "aarch64 crc cortexa53"
 TUNE_FEATURES:tune-cortexa53-crypto   = "${TUNE_FEATURES:tune-cortexa53} crypto"
+TUNE_FEATURES:tune-cortexa53-nocrypto = "${TUNE_FEATURES:tune-cortexa53} nocrypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS:tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa53-nocrypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa53 cortexa53-nocrypto"
 BASE_LIB:tune-cortexa53               = "lib64"
 BASE_LIB:tune-cortexa53-crypto        = "lib64"
+BASE_LIB:tune-cortexa53-nocrypto      = "lib64"

