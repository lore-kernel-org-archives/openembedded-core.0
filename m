Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B64CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:49:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6984.1762073348393192534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBy1AQrN;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29524c38f4fso26461655ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762073348; x=1762678148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rEQhoomvP3sgKCZuzrR/nMJ+TIu4NQikZFjF4bWngk=;
        b=LBy1AQrN+hPOvLmeWtHuMriqZ6UObxNBoSplXWS+ZQD6qiMdgjvCj2rvrMnymSZWqw
         /FHHIpvs/iVi7xfvoka4f7DbI91j9mvloOH4OZXauGOZ9lyEdbCW6Uz1ZJo6ZGIg8Hei
         U3T2M7v9pqGWIUJe5PL6+Zzm/pvxQC5X/fc3VVdmsUMSd9UZ1rap+EAzCrmr939r9q2u
         DE9fF68kWg+hS2finoPOAWOhAJPWqxUJmyaCj0TLkm8PRGfsTh/FU5l2949xs7wXRU9L
         +2FlKjg8pZqJZG89JYKjE4qpZ49FmvFhdqiCjJGSK0PU6fYGTAhQ+uynXLTWN8qbzbeN
         S7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073348; x=1762678148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rEQhoomvP3sgKCZuzrR/nMJ+TIu4NQikZFjF4bWngk=;
        b=tSHFteC5OWfgBsAt7tgTrDBHAxl7/J3NPUbCLieyfgvgbZ7tKlM0KQd+58fwRoHdBo
         GX1nJDZvz5EBaMB/XRE3KIhRXYqGEDYiCb/EgfBsh/xEGbt0TGsEar+8LQrMgm1ZlzWZ
         AgPCXtCtxzJy3AK03TBWjUBGTs0jEyBgOxk6+RHyRjGIbZoL4rZ4yn2z1aBibigt0x2R
         N6UuK0Oik95XYONfXA+BRd6588ZeO34gY/u+9PaecyNuctmMnSCTzO8ztxmwccJwYz/0
         nZ7enbBcEvChgOabJFniF6z9srHjddhkpGexwPyR/+XBuy4JCZ8/l23t1Y32NKTLWJIf
         DNmw==
X-Gm-Message-State: AOJu0YyYQxheqoGZ3fQg7BCEid2PVbk9/1xgxxhA5/LOE2Hm4xb3ItJ4
	NLTfJUspr1QtyqTb2SNxcm8thyxodIjOYqaVMOoqQhmPTa7OKlvVpjjc6JQ2aA==
X-Gm-Gg: ASbGncv5QyCxvV8TARzleW8o2GdZ/mFqlggw9QfXlJnZfkOojiYRRNhOnbBqBe/h5L1
	AJO0L5z9Cm/ijljVeH0oDEm1eZq6cghc2hHvTs342/cx5CEgJKr38QXNweJICyoeGG7qGAwJ9xs
	Fh74paPb73p7oCO8vhm1A4vhWoBlkzPYFlWIvtLGcgzfmfoCqMv8pv4g54nZ2495k3m5axPq0+2
	VF0iYm8RqyS/bkiwi/hV83KGn5es9Y1w20zSDdBvrUiEDWHiFuH0Oxmpqr7uFX1tqPB1EjKZbky
	nMfg+erjZPmyW1JV25AG3sH9M023zAq+sLgyO6O6iSqwnTxpIAMXmq58MH8tYcQOWo8ApA1pwSY
	7FqZKzo4PZA60NrrLP0znrBtoZwQT4C3DWTeXEV0SRTrrwPIP1xikcCTt6pYLFb5LMXhQY6pM7g
	xyMWkFA9o3UMKfoQ==
X-Google-Smtp-Source: AGHT+IHIQ5xVJJ15MRoKFYlBpr/wbzxsCmqzT2//4s3iA5uPPUvDOK/syiXhr33InHV+Ev11BKE3tA==
X-Received: by 2002:a17:903:2348:b0:27d:69de:edd3 with SMTP id d9443c01a7336-2951a3c3298mr121804375ad.20.1762073347417;
        Sun, 02 Nov 2025 01:49:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aaf449e8f1sm113891b3a.11.2025.11.02.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:49:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/5] wireless-regdb: upgrade 2025.07.10 -> 2025.10.07
Date: Sun,  2 Nov 2025 21:48:51 +1300
Message-ID: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 08:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225568

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index decccad05a..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a8340bcdcd1b5db6c79149879d122b170f3bb075381718d4f429ad831a6fa28d"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 

