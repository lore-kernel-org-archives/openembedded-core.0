Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E723C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:55:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.8736.1685519734536693154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 00:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kdSjGLoI;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-973f78329e3so590784866b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685519733; x=1688111733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dYPR5Ng65ACraUyxodLs4xIhWoAF+4p+PS8Nwzv2Mc=;
        b=kdSjGLoIoDPd5i9C3ht2NESLD842Q2OUIm4xAqBQq8itQIGFL9JmOGbUk0cnITIrND
         r5JBUJOLPhhBd/pH/NUwrI/EDB8ruKxTxXhgB8ODUMk27+DXElNdcH+ZX42BGzls3nQ6
         XcSdJHhRblm51avaqZjzO25IDesXqq0WZAQQdTS+FcgDdvQD6yL8AS144ynLEQcuMd/4
         JQwcI965mkr6wU8t64pqHz0vVS85K6/phmLGqrsOWQqLpeA/HUhN82EwqWYvZ3EhKOC+
         QFSJ9tXQUnuaAo5VX/xLL3mu+FqdlmEaxMmtN9AtFl+t4wX3vqxh9RmEJ7MgswlJ0gHc
         GoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519733; x=1688111733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dYPR5Ng65ACraUyxodLs4xIhWoAF+4p+PS8Nwzv2Mc=;
        b=SUJUdraSPDBAcIt8VLB7xceGz7BmwfMoQuoqoQTjJVu8DxuAYK0Rd31UIjWQlVz5X7
         /q4Fzjg33apcIBYj1dxgYR9k84O0yYpgzTD/yIx4KtX3/KTitHxTccgRz9yrJCuYwFs+
         U2+JY6ZN5N+OPklT7IxJkhHY+jbSGfozSNGg8Cqzyebv7UpKDP+/RtECICxAzrt0Nbtt
         J1GluiFD/UIN8E0BgWWRokKIB60Xzdnk8sy3dpZgJVUiIUnZpNyNSV8M9A6XcfBCGx6W
         WBs/bW7/GYdWsgJcf9ZY3RO5m/UK6LChURL571Y0mYhSRdbLpk0CbYBVB8OYBZeya0Ld
         RkYA==
X-Gm-Message-State: AC+VfDx34JOc5n/XpNnE01s9QBD7dqVOtDFt3jSeDXVJcv36DsTA0cJt
	5AL67EL25xtyEEYZGfrWyfoQ4scWP9VpPw==
X-Google-Smtp-Source: ACHHUZ7+AbUARTL1DHghlVrqwkwgKfybmDy8yQ4+BpF3F52eKVYLKvIRWsTJan8cVEvVFLQ56Hu/Yw==
X-Received: by 2002:a17:907:3e8b:b0:971:5a46:8ab4 with SMTP id hs11-20020a1709073e8b00b009715a468ab4mr5079912ejc.66.1685519732619;
        Wed, 31 May 2023 00:55:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906365400b0094e7d196aa4sm8489062ejb.160.2023.05.31.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 00:55:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] maintaines.inc: unassign Richard Weinberger from erofs-utils entry
Date: Wed, 31 May 2023 09:55:25 +0200
Message-Id: <20230531075526.3894314-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230531075526.3894314-1-alex@linutronix.de>
References: <20230531075526.3894314-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181999

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index aab8f9bb636..3527c6333a0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -164,7 +164,7 @@ RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-erofs-utils = "Richard Weinberger <richard@nod.at>"
+RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-eudev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.30.2


