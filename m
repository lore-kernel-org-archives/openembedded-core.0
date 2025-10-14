Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E993CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 18:03:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.2140.1760462942083630443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m08I5PcQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781997d195aso4037979b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760462941; x=1761067741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v13oCm9mnL+AjWLvx9H1OmjWPYCsK7mcHCUxEb9EaAI=;
        b=m08I5PcQaYLwBuKMfUHpuoz65BXTuBICURZR6Zscn8U6jksIqA4IgGDAGDp7sHC5IB
         GHv3Yf6iA6K/zjwckwIWokotHAx30pi1NWJbf1M3srgD/bOQ8XojBYn1WvOR760bB0ex
         kWGRIRcJmk6NeZvXkBGoACGMnrUuRQjWXzjk2jkktW9f07fNM3pfW3A0ELf255nx1WFY
         0BH/SPTf+rSQcWy2y8OEzBB++XmtdVDciRmFyh6C1mMeaG8yZnHwPo30JaSFRhQ75oIz
         s4YKhoBEEMeaDqbMDgJIQ5uT6sbeShQ7LHBLtJiDqo08NB8CFQLMLCgkRXwQjve6nTVO
         UkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760462941; x=1761067741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v13oCm9mnL+AjWLvx9H1OmjWPYCsK7mcHCUxEb9EaAI=;
        b=ckFVI+X3J19g1ZeENYJDl7O1WqGk+HRqMxcLm4oy3T9sSSM9VC5tqqQtJ/SncOOgPs
         oqM6A0LP9h3dlrCS2SCU3/5k1sT1UX/ylGzYpc2tW9hJoEV3rxFCr+Wn3dJhkD1NpxkB
         yzposIfptZtl1bB3g6bnULvRk/y2lXKXx6UqP8B1r9iTeIKqMMwGuHq5F4zEe/CJtUb6
         oe9wC+wP2SCmCn8F/pJWd89zKGff19aIHge2poPnqoykA0fq44gaU8iRbnS3z2OrXnIk
         wxmxsav4h8DAWmWeBak1YY65KY+veOWPBEGuDdVMtHk9VfekEAioE2dEaoyb5DWV2lXr
         c8OA==
X-Gm-Message-State: AOJu0Ywn1nQ6P9aVG4GuqbbM5zWS427rhAY/ONI2Hr93/mHMQDKqC+Qc
	8yecJ1leWvdTkU/bHJ3zPvYZsXygiKSHSuFAmC8fNEkYZznSlkWiJubEVDptVw==
X-Gm-Gg: ASbGncuZFOPjd3IHdSqBjaDHkNgUiYsZfdTHmPXnKaS33ZIjM9kK32NHECZQjDawo8X
	DqZE4u8yNduD8mQkz8bDtbrkvmLftGN0nZQk1s2w15DuFbtLStxEROLn5sty15bXFN0p78ImTSX
	+I6UXLAFPLS1HRg0AL4TXOzvEcvMwbZ/jb0PK80QUeyePZVx3W1p1Z+ko7o15YN1r8VV7fnpmzt
	zmteczsmDJGJpcJEFoGmcGM336uoqcxWNy+mbvhuUmma05jBn9v4oWS3Psl1yi5yYzJfN03Sxa0
	D4gGUTAE/Ubsb7DnHRFAiRCcyyTh7mArlN60iTDbRdn2XAmxKAiqDWYF9AU2pPDR3VQ/65mCkGt
	SnJbdTV+/cfFVL4nEofyHsaBUUauBsm1eDMEbKNf+QQ==
X-Google-Smtp-Source: AGHT+IHpXO/aTGyEjyTmqOPCQ02APQa237EI/HOc/Lo+ZdswbtZR1edgujuteUhLlTFBe2WjTZoLbA==
X-Received: by 2002:a05:6a20:6a29:b0:304:4f7c:df90 with SMTP id adf61e73a8af0-32da845fb34mr33690209637.50.1760462940765;
        Tue, 14 Oct 2025 10:29:00 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm15803682b3a.53.2025.10.14.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:29:00 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>,
	Gunda Swetha <swetha12g@gmail.com>
Subject: [[openembedded-core,kirkstone] musl: backport fix for CVE-2025-26519 to LTS branches] [openembedded-core,kirkstone] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 22:58:45 +0530
Message-Id: <20251014172845.11698-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 18:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224846

Fixes [YOCTO #15932]

The musl libc code in LTS (kirkstone) is missing
the fix addressing CVE-2025-26519.  This patch backports the upstream
changes (or applies the required fix) so that LTS builds include it.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Upstream-Status:
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=e5adcd97b5196e29991b524237381a0202a60659]
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=c47ad25ea3b484e10326f933e927c0bc8cded3da]

(From OE-Core rev: 0d11c9103f072841baf39166efc133f2a20fc4dc)

Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Signed-off-by: Gunda Swetha <swetha12g@gmail.com>

Reported-by: Cristian Morales Vega
---
 ...1-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch b/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
index 3faacf9145..5db50c27d9 100644
--- a/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
+++ b/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
@@ -1,7 +1,7 @@
 From ae865075dc7e1acd0cb7ee9417758c8e060800ed Mon Sep 17 00:00:00 2001
 From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
 Date: Tue, 14 Oct 2025 20:36:36 +0530
-Subject: [kirkstone] musl: backport fix for CVE-2025-26519 to LTS
+Subject: [openembedded-core,kirkstone] musl: backport fix for CVE-2025-26519 to LTS
  branches
 
 Fixes [YOCTO #15932]
-- 
2.34.1


