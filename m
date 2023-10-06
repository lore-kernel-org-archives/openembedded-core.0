Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC7EE81E02
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 14:38:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14455.1696603123423218849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 07:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dpwat4wz;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so2104586f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696603121; x=1697207921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnc1+dptD6xjpoDzIRoby/wqjZ88ZbOs1PxL2HSW18I=;
        b=Dpwat4wzaTbyS3YAGF4n3kOBJE+6LuNaONabYelUBNEHVLHZ5Fm8W2W2S9FM/msqv7
         jNR4KxxO/o3Vf+ncZeOAOLVpRqBH/LFeJyLqxioBoWJu+VD98ZCK8Ac5ZxUBtBOZ8Tpw
         U2/+pzODh1I2rLJEw7DzAJWf+w75C3sfHyPl/k9s1AQ/NPHWO817VfP+L1Kg6fBvYYcy
         BU9QqyOtdG03RSfg5jaj/zC9Cx7EZq1YlQTSUCk3x79Q5UGcbN4yrrFDIDcqheg2J5Cz
         FviF7OxFoK+j2edxrtLmoW/bJKG/lb3kUtdRfzDRqa6lU+Np9GTjjQKUuFjrm1Ro2R4e
         uIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603121; x=1697207921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnc1+dptD6xjpoDzIRoby/wqjZ88ZbOs1PxL2HSW18I=;
        b=wScSn9vVCI0oGbSibSb7HJLLo0vHfr9+JmZhDGv1Jtfc812uBMZwTThNWmcgV5R7Jf
         V5G+DXktpB3rc9eHmpRYLJsmNB2/r+AEkMgxDcuyQKcr9ANTbwasxaOmmquF9Btbfq2V
         KtRbpHYaOaRSYRzX4ztw5qc2JbRTkktcpWE2SoFCGTur+XR6e1HKhZ2kGgyDkarGqsJg
         +RBKlDPKZtkapD9GvhzDummukouSrM3V8jlxCHcZkGH6H0mKEi/G85rtLVYRJuwUlOis
         XEq18LjBgu8oKJywDLaefI6KebOjKdHQf/ktDThFA5pOOcebT2Gg+gV2Il3K2RHS5VXb
         Hdfg==
X-Gm-Message-State: AOJu0YyD1u7OTQ8BIScKP+iMqQ9PnKgII1ieqgwkbVhRJgS28Rqv09Ga
	VCfVgnaF6qq5pOh/hQMKTc7h9AifM9Xy3w==
X-Google-Smtp-Source: AGHT+IHCcfRofZ408uiDSn+0x4gXQy+6sDdWFzBkjXOId9aN1JdFWugSmAmCU2kCcc+qUduO7i95yg==
X-Received: by 2002:a05:6000:10c9:b0:320:fc:97bc with SMTP id b9-20020a05600010c900b0032000fc97bcmr7587368wrx.1.1696603121248;
        Fri, 06 Oct 2023 07:38:41 -0700 (PDT)
Received: from localhost ([165.225.20.92])
        by smtp.gmail.com with ESMTPSA id q8-20020adff508000000b003200c918c81sm1789797wro.112.2023.10.06.07.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 07:38:40 -0700 (PDT)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
Subject: [PATCH] zstd: fix LICENSE statement
Date: Fri,  6 Oct 2023 16:38:27 +0200
Message-ID: <20231006143827.1293689-1-massimiliano.minella@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 14:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188772

From: Massimiliano Minella <massimiliano.minella@se.com>

zstd is dual-licensed under BSD _OR_ GPLv2. License wording in the
README for v1.5.5 is misleading, but license headers in the code clearly
state that there is a choice between the two licenses.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 meta/recipes-extended/zstd/zstd_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
index 5c5fb5e734..2d72af50a4 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
-- 
2.42.0


