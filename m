Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69E9C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:03:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.72472.1744110225222886285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 04:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=avO1Y4TA;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22548a28d0cso75118335ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744110224; x=1744715024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La9jor1RLy/xb4GlGyrdVQIaDzBzqouQGSJjlk3ugVE=;
        b=avO1Y4TA6wWglWKai/T/RUYIz+ZptUAO6pJNx9AcWHqV+eesUNhPWwu+Ws+R9Cy7y5
         7LSvcXVD7OwrjlXlogpsZJPfVwwRLZ1kcU0OcMfb+cMQeUliuILjIcqoo0x6WJDf/ZcP
         3dmOmoCY9AkSBOh6r54FhU4VoaKZTXIT1UtYaC6ZMwMZdGCUz4TZ0lQKPlzqAmlg+YSs
         JS/6KfDmyYLQTS+Io1DTOinC+T2UFYezw+7JLDs7IJep7FUwB9WEM5CZZmTcG6EKm+2/
         QrJhgMYBEDbeZnaNHK3RDdsCP7fyPBQE2QOPOPDy93wNJFhOOrXUFgQBRnWD7jcnU7UU
         AZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110224; x=1744715024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=La9jor1RLy/xb4GlGyrdVQIaDzBzqouQGSJjlk3ugVE=;
        b=PiZWzRxpBp9+mA54yqLuSp/6UlZ713PjooL1A0dwVRN3MFRg8XmkG1Z0GSHmcHhQ8N
         Nai7ddfcvGJyDf61DoiZbYCminBAJsenzVLJoJtKnWlj/WkyPf0ZJkrwiUUk3nSORxyF
         8smwsvifLJM1u7Cx7I/DxwUlBYm+kSu6OFAKOjRuqhWD4GtYCdTZiZgW4cUFPPR5la/I
         k9uEe6qWOe3tyiPnvdaQKzGZhZ4xZ7bzkcJmocullP8/U1mqa4c2iewv8SUPDNnozrXm
         dIuNpXp3ZhmnIHMr4lVF/I27VFEVYz6ZpbnTznru3G6eq03xo3yxqSe7i5E2yECvHZXG
         s2xw==
X-Gm-Message-State: AOJu0Yzxdk2a2qdrGl8ncE440MY/EycBtyzhPgex1240y9ilVFvUNhiO
	ZczzvuOm9rv6/vUdQ3dxS2beeXod87BrgGHCOB91+Gs+7pfaS1w7JTqGMQ==
X-Gm-Gg: ASbGncuN7QNQUPW2FW7Z999eYmJ1i3BlGdj0jQ59aw6+bF+JAiYP5Z1EmL27DAba4Yr
	dbhoo6RahFONimpHH0XVG6SXY/dxl3toqbAfp35J+OJj1SfTj/FPI8bVFkcQu/u9OvUfGrct+Cz
	JNxTWsPSFI7pIZ2eS2nOL+A2A0mtBF/W8aW8VP2At2fC1jVjOj6blAD0tUhVwo/+JAkull+XlGn
	UQH2vvWqG2EFf1lhDiqkJW40nYaIdVV2847xZa4nfDYyTwhw9ZFwXxwILGsjnbKqif2S5ndt6QF
	wsnJHtdJA3tV8/tX2mE2Z+mFVa5IYUZrOGJHezuBXgvb+Laccsz2zlnmERs=
X-Google-Smtp-Source: AGHT+IEUw32tHwtNGikUs89pBzyHZFkMY5GdfB4gIxWjLvrIWo2XSckt6+BVwTOfxaw4JUpk2/dZFg==
X-Received: by 2002:a17:902:e552:b0:220:c813:dfcc with SMTP id d9443c01a7336-22a8a8b80a3mr225615035ad.40.1744110223654;
        Tue, 08 Apr 2025 04:03:43 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:628c:22a5:477c:7dec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787728cfsm97369255ad.228.2025.04.08.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:03:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] u-boot: upgrade 2025.01 -> 2025.04
Date: Tue,  8 Apr 2025 08:03:33 -0300
Message-Id: <20250408110333.648158-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 11:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214532

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2025.04.

While at it, pass the tag parameter in SRC_URI.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Pass tag parameter. (Alexander)

 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../{u-boot-tools_2025.01.bb => u-boot-tools_2025.04.bb}      | 0
 .../u-boot/{u-boot_2025.01.bb => u-boot_2025.04.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.01.bb => u-boot-tools_2025.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.01.bb => u-boot_2025.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fc860248ed..4444471fa5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
+SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.01.bb b/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.04.bb
-- 
2.40.1


