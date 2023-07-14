Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFB8EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 18:05:26 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.2122.1689357922622497682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 11:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MZSZO13C;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1b06d1f3868so435699fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689357921; x=1691949921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwcHJlWBinTPOSDc8cjuw4IOcjSvjrshnFnYDooqG0s=;
        b=MZSZO13Cf5DcuutmdhNyWLFyNIICKgTnW/Cp6RJCyp9hcaga79V2RVANzIlNjrhDVF
         kx7ULz+wCeGMXtqUwSqrospHays66T4nyZprNI5nih78YvHRGGcJNjnZMH6LD8z9SlCv
         grhqL9UOkliuTSZ8FObABKmTmauFQdCYoiY4Wf/4KoS82Ib2oQe5lIodkfN6gt1FunKq
         t5iOminamtqkCVpuhbI1VEBJtYDyYUj19X5sTzorozoY4+AwZpwQG/0GhLvoxOJp8bfc
         Zl2JHPVkYlQUAyuFdueWXTA+L9HRTMMNWCJtO/LOegVRwwANmbaIgqWqzNnUG517nMso
         xCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357921; x=1691949921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwcHJlWBinTPOSDc8cjuw4IOcjSvjrshnFnYDooqG0s=;
        b=KbKYG2TCRL9ZbhcMZ7o28cTD11+2cVlXraDPPtc47NANyeOJeVn9q5yvnOrUujR3c0
         t352jfrp8GiX5oQh8TVPlby5V64ujYC0GjAbxdLstqGMmzfLwvZrVJY1sUDLIvki4AnR
         R8Hw6t0O5opDmL0frNgxG2g8ysxfurZWVr0gv8zTa9Pbb1q+GbSn1YGeyQxA7HK7FWyj
         9mMw4VCwEW/XX+0yyDoHA5SyrnM2YpdloLIZAFn2Djm9peEPTHOPeBrXIvBGqvg4wAhP
         XhboOM7Fms67+ZIEffx+qLK8xCyte1GfRyLDcGXPC3UXtTgmRVHufPcstZbThOytSmj9
         N1gw==
X-Gm-Message-State: ABy/qLasf9c8PSdSivlZ4Q2qb5Vtz8vgYEkMiHC3m50F6SEqVq+YkqGC
	81+NnhZ+SUxSWjO5jaGANRhRW9xhcxZ8FQ==
X-Google-Smtp-Source: APBJJlGTJr6ay4+zJH1CjruJLKbqD5KStQi73/lytlZG34jeF9eoONzboFlYXN0RTccO/+NhAhQeRA==
X-Received: by 2002:a05:6870:c1d4:b0:1b3:935b:165e with SMTP id i20-20020a056870c1d400b001b3935b165emr5573235oad.4.1689357921544;
        Fri, 14 Jul 2023 11:05:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:313d:de97:6253:5730])
        by smtp.gmail.com with ESMTPSA id k5-20020a056870350500b001acfd23ca84sm4239951oah.6.2023.07.14.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 11:05:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	alex.kanavin@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] u-boot: Upgrade to 2023.07.02
Date: Fri, 14 Jul 2023 15:05:14 -0300
Message-Id: <20230714180514.36423-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 18:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184280

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.07.02.

The U-Boot 2023.07.02 tag is not in the master branch, so switch the branch
from master to u-boot-2023.07.y.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Do not use nobranch and squash the two changes (Alexander).

 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../{u-boot-tools_2023.07.bb => u-boot-tools_2023.07.02.bb}   | 0
 .../u-boot/{u-boot_2023.07.bb => u-boot_2023.07.02.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2023.07.bb => u-boot-tools_2023.07.02.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2023.07.bb => u-boot_2023.07.02.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 56f9be0107..111914827d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "05aa6516c6bb419d01d69fac457c0de563bfd694"
+SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=u-boot-2023.07.y"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2023.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.07.bb b/meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
-- 
2.37.3


