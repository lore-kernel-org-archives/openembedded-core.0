Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB17C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:01:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.38662.1683651688571982749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r9CuWl2u;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64115e652eeso44094136b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683651687; x=1686243687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DgKUvaP+VLVEViyibX78WmJr8yG4wQpt5aQ8NioYhg=;
        b=r9CuWl2uZFj/H0xpFpIVnuZmj2Gfb25aFVCO8R4FrMc++LNY7f6EQtL0mrPRCyFN3U
         Xoxv6UAiH/CTl927+KK4pXNrH37TzYh8wHd3ONwuZCv3kinOEqmLjotRwmz5mbf3v+P0
         NzCgbZGnzm1vT9WYSmSdnWhWP+kAj3WDph92x2hbHP7Cf8cBED+0+iwJquwpt8oBbjC1
         p/rl+Pw4u4sHTBDitv7IY3WR15jBF8c8TgdVIcCBvF4Z84gEnfpjgpY9YZwhCBIeHcAY
         wiuxEV8hsPNVZioePFpQzftOaKBORlJc6Hp/dAoufkzZACuJth6U4FtcYBqU2YcCegue
         Nqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683651687; x=1686243687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DgKUvaP+VLVEViyibX78WmJr8yG4wQpt5aQ8NioYhg=;
        b=ZAUqpMIC6cmgg0nLEo2uPdz23EeDu3ePraSWzDQxu49MRPcJu/9lmTBWqTBF14hRwQ
         xhc3UrZrEyUzzNaULvhAnrGEnLlE6YX9a07BkgTSkpye7K8lWvj76aFY56Wepx406zca
         gAtE7xewZTDD16JzD6oW+rIdVpCNbNqB7bpllNmILOWwCIYW6B1xXFDhxaUePA670e7P
         A8ZfuSMT0JSIpHySEyM+u6OEvM3N8/SCAi/GmBMtqyNVQTtZNWwMZflyjQQxC4ysQFlv
         mxcFYcJvsymbtgdDEPr8d5nXU27t2j3fzsMkKtqGNgpAnCF60maMz1xp1HNwhb61UXZW
         FjSg==
X-Gm-Message-State: AC+VfDxWBTVWWC95MFXTXr8Mh2sE8aRdy/rw6syjnR+5Mr1Qzs1wPjeC
	Vex71fywhDFmCcTzeTULsWS+9UrtIcf5hw==
X-Google-Smtp-Source: ACHHUZ7TGaE0DDr2fZp2s5G+1atAwzb9JFhxyTYAvThKpYweZGP8FaxUya4JZfgK0t+GqucfOQupEg==
X-Received: by 2002:a17:903:2343:b0:1ac:85b0:1bd8 with SMTP id c3-20020a170903234300b001ac85b01bd8mr5819678plh.34.1683651687391;
        Tue, 09 May 2023 10:01:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ac2c3e54adsm1837002pls.118.2023.05.09.10.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:01:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-requests: Upgrade to 2.30.0
Date: Tue,  9 May 2023 10:01:24 -0700
Message-Id: <20230509170124.3943753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181053

Adds supports for urllib3 2.0 and might break urllib3 1.x [1]

[1] https://github.com/psf/requests/releases/tag/v2.30.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-requests_2.28.2.bb => python3-requests_2.30.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.28.2.bb => python3-requests_2.30.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.2.bb b/meta/recipes-devtools/python/python3-requests_2.30.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-requests_2.28.2.bb
rename to meta/recipes-devtools/python/python3-requests_2.30.0.bb
index 8ab1ec0121..1286eba786 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.30.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
+SRC_URI[sha256sum] = "239d7d4458afcb28a692cdd298d87542235f4ca8d36d03a15bfc128a6559a2f4"
 
 inherit pypi setuptools3
 
-- 
2.40.1


