Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D532CC56206
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:48 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.317.1771602098942945497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFxrSD37;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6774d63d2e0so756294eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602098; x=1772206898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5QtV7toOjX4X7PhiVmNafm1JRuuyH0IL5mD6F1+cmy4=;
        b=MFxrSD37jLiSeR2QI6gWtmKuyx9B7aRzaOKantffKtCbZb0YKbZSUVvuQ/mRUy3Bth
         2MpAdD5iJox1UxN3SPRRostnKJ3PfVtRJ05YGNwj19MYt2xyNmpIRTfget4r96BgI2tk
         CcOarwJzRUFxlylXcPibC4dx6ysyWK2hiQyqeyPFYvSqpl/rBoDNMzOzKZ2s3JUUIpJU
         OqWaEAoVkt0U6t5lmMP1w9yIyT6WQJivgfxyN0XY7BwHNY8cO0BkWzpYwP/GFD+zKV43
         ef9sgXTQlBuMHMNNParRqi1SaD5ykEHdXt+O6EDRo48qmsmkcg+HpG217jt0RTfV81aV
         +HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602098; x=1772206898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QtV7toOjX4X7PhiVmNafm1JRuuyH0IL5mD6F1+cmy4=;
        b=ugv60jf5OCsl+siiadBP3HrGc+35Pl8yhEVFA3NV9X+LBshdkNxBMy9JJTkAAP7RQd
         uZ0Wg7avLbrPw0bFyLzknn9OJup65c9NaTDA3XVBaqKtRkXOw6uAqO7bLr2BrZC364OZ
         B9rHpEOBCKM0hn/JAOfLhnleO/GbmV8ne119fMjFno/OrhCZJ3K9JefyktyuVMydSzX+
         1YfvM77nlNcm29vH4ShnpEzZlH4LiGJMcYNBuyM85waAn1SW/LuLcMWTw5FX4/7XHDqM
         pcRqFWWyLcdosSaUHa5nICnXurcHZ7W2QB5gi2ioc/sphvRBFuaaS4hBTLNp2MeB6Tav
         qlTg==
X-Gm-Message-State: AOJu0YxYj8uFLW0e/ym6iCSuBOCsf7x3oyY2dDHVIB2mIyrf9Qux1MGX
	HwAkwpz7rYIWgWD2d1TvdTTPh8Rv0xhbuRghyTKWNVRSitIMiGyRq2dCkaqDfA==
X-Gm-Gg: AZuq6aJUWDJDhQWlWBPmt064CJv0vmjpSXcktpMbfw5IAO2JALfkXIgzxxYeKjc08kI
	VHJc3TNTKzxSgigblouL9YBfmF8HmWNDGG1myQ0x12d2ZO4o8x8cVniDHp6fEuMgMrFE71ywQ3Z
	sQLr6S4maDOWfVx/PjXl4ViZcUnR+4XvG7E2N4N+u/cz++cvkt1/1lEgkyL93+3TTse0kOZuJJg
	bCqzDqKRwXMdWh0Yq5Y6EWhb5Y8+DLGRA2X/7ss3U5Dzw3YjCjqaiLPp4UbQ3VzO3YGv1wyQous
	ayPg1grDxEOEfqrBhOEFP1wt6Lt72m0F4O9DszyAsjovbN3hkCMF4rUNo8Q0Aty83lhHCP+spDM
	RWuSOcj4rUpHkVltksozolNd9pvSE3Cg0+xw//aP/dLj6tMoJG4Oq3mu4wcqtqmh49p65uKEKDs
	7lSANZMrkSxICOhrg5opjo
X-Received: by 2002:a4a:edc9:0:b0:662:fda3:5547 with SMTP id 006d021491bc7-679c4278d43mr174660eaf.23.1771602097923;
        Fri, 20 Feb 2026 07:41:37 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/9] Add SPDX 3 Recipe Information
Date: Fri, 20 Feb 2026 08:40:35 -0700
Message-ID: <20260220154123.376880-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231519

Changes the SPDX 3 output to include a "recipe" package that describe
static information available at parse time (without building). This is
primarily useful for gathering SPDX 3 VEX information about some or all
recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
vex.bbclass.

Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
helping work through this.

Joshua Watt (9):
  llvm-project-source: Use allarch.bbclass
  gcc-source: Use allarch.bbclass
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx: Ignore ASSUME_PROVIDED recipes
  spdx_common: Check for dependent task in task flags

 meta/classes-global/sstate.bbclass            |   4 +-
 meta/classes-global/staging.bbclass           |   2 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  12 +-
 meta/classes/create-spdx-3.0.bbclass          |  77 ++-
 meta/classes/spdx-common.bbclass              |  14 +-
 meta/lib/oe/sbom30.py                         | 192 ++++---
 meta/lib/oe/spdx30.py                         |   2 +-
 meta/lib/oe/spdx30_tasks.py                   | 487 +++++++++++++-----
 meta/lib/oe/spdx_common.py                    |  16 +-
 .../meta/meta-world-recipe-sbom.bb            |  26 +
 .../clang/llvm-project-source.inc             |   8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
 16 files changed, 620 insertions(+), 247 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


