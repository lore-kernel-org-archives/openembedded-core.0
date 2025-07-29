Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA1FC83F17
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 01:49:22 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2917.1753753755547670197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 18:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HUaoxt38;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748fe69a7baso4518234b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753753755; x=1754358555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5smEheDane4vzTX7hXwMOUowUYnN4J/RdV6Kgv1/A0=;
        b=HUaoxt38lw1zxVy+D5y8aclU7YB7bFIeRJIdMKE7tqByaA4IcfkdmDdmToC0B6Yhet
         P2NWowNlNUvzEpdYbYYIg2x7GCylNovVlN0qeguqA66Osp2fLPtVGHHQHkiNjes2hDxf
         RFYuXSJYRyaStEVT6yc0k5mzbaL4CzdE19NVhtw1P/PeFfJPbCH35xVfakk2IK/6Hird
         sI0R+j1OFKNfmIuLWaCpuD1RGTkNVc3cVUjq9mBXMb/lSg+TPJfG0ZoY6pqVtvJgYaNl
         mxy4+xZTdzguOkbIiyBCGw9JFjvuvcJKR0iWne9RL8YgTiq4D+gvZOOqVMJ3kPh53EIC
         gN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753753755; x=1754358555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5smEheDane4vzTX7hXwMOUowUYnN4J/RdV6Kgv1/A0=;
        b=Fi2AAu2qwuwJq/zhQRLLngj7xiI3h4+QRMOMiFwcMjBjoepQFq7rXU9kkWkj7md1K1
         cOcJWXyZQFwkinHMrNWwyWG8Sn/su3gmM0ceq5APd17XkeZsyPH1ij3mPrisuByyne7J
         ckNwlmgD8xl828L0PqSKFvdrEQu0rXYFujay38h3Hy9Pc3gJdVxgIr0dK5BTttqttaOr
         OP7iO+e57cOI3FWAzU8VoNrHv3tJ3Q9VANKp4CIfNlgREXSTpFfBr672P/qqiczV+iCJ
         I++zyuIg1v3gzgjgsQWHHUtG5Mi5NMlIA/BIVi8uHXJQS7FV8Y0QEYFti4f9oHTKvulZ
         5rIQ==
X-Gm-Message-State: AOJu0YxTq9L+vS0gZ2wcdgsiHesh7h58oc/wHtOrDB4d+vL/RMi4DW/V
	arFEcBLbkqBx/XBiWT5td/nxHvm1evAonk36IecRpOcpWGupbuGFZ4OF4KBqQKqnTb8=
X-Gm-Gg: ASbGncsmu2cYpFPUhYlWCo2eqDn0Tzzla0Ftpn1ff+EB04STqAvjASPj4YusmhtCMm/
	3/4r5vWQP7u5UixMKTMRIPth72Cl621m2KNpeKvqsk4rl3X+5W9Pfu04ai3BhJHj+VtfXSazxvI
	WgutTOqR+0jtY8eVfTkMZZtbyPnTNyp4VJazPiR9EyEQRpbxn/afFiARLMQPOnBPM852S1Ms6dJ
	XP8ri1wb/LN4CMhiYVABCZZQlRi1c8HWEFjuO7gBzCVxpfzlh58uMKOs/nQ1U+gagf4zzuAXGCT
	vmLWumsXCB8BDC5vvoHWrekTJCVOfBGi8L8ypRhEgwY8EATYMQrpVroG0Rya+/tnAiil5jjpRr6
	HK43TjpNAsfDCmA==
X-Google-Smtp-Source: AGHT+IEfvNmKRijkpvw17GIZrjh8hzbx9kozJsr1ajxCnzAuH03MaaC7S7Q+4WoOng3WQxUlfG3zIA==
X-Received: by 2002:a05:6a00:3cd6:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-763343da348mr20702926b3a.12.1753753754527;
        Mon, 28 Jul 2025 18:49:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b4c8695sm6099585b3a.116.2025.07.28.18.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:49:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] tune-octeonx2: Do not use -mcpu=octeontx2 with clang
Date: Mon, 28 Jul 2025 18:49:11 -0700
Message-ID: <20250729014911.2621250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221026

-mcpu=octeontx2 is not implemented in clang, therefore
replace it with -march option denoting underlying
armv8 architecture revision.

 Fixes:

    |   error: unsupported argument 'octeontx2+crypto' to option '-mcpu='
    |   error: unknown target CPU 'octeontx2'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use CPU_TUNE_OCTEONTX2 instead of CPU_TUNE_ARG for uniqueness
 
 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
index e9d7a59c511..5eed3e5d15f 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -1,7 +1,9 @@
 DEFAULTTUNE ?= "octeontx2"
 
 TUNEVALID[octeontx2] = "Enable Marvell octeontx2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' -mcpu=octeontx2', '', d)}"
+CPU_TUNE_OCTEONTX2 ?= "-mcpu=octeontx2"
+CPU_TUNE_OCTEONTX2:toolchain-clang = "-march=armv8.2-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' ${CPU_TUNE_OCTEONTX2}', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 

