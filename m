Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B365CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:52:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88930.1781347923173005528
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MyGwIBKO;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so1279527a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347922; x=1781952722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YXOWrDMQ4N76wkJE9po0rBpUX4Bk0IkNXdyk0+esKM=;
        b=MyGwIBKOOVCHmApHjfU6Qbrjjt0Vf4rPZ2+NOQoGOqJ+06PZLdQS0ee+yqOelUpXYJ
         tgCT583WgGWgcgo1WoEIacq2XYhkNrDsvOIXgl5hvX2/B4LwEL6PFkP8m5yGO6AGWegV
         tBHgMtnQEsBrNl1r3EWLTHZz3lixO8jwdSgyEHyxeL4GUXiIBU/sHoZDu8b/iLH6QnRx
         t5xBwx50Qjmhwpg43lhNcbL3EUflJun3wvLGdO2DGv6MM0+GtQOEzS8vk2JRkiR7Yh61
         DvB04P1z/R/RbyaHff8PP58Idvjzo40ZliC/LwVJncOkRGdWY4TltBH1D0blPJZ1rhz+
         5EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347922; x=1781952722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YXOWrDMQ4N76wkJE9po0rBpUX4Bk0IkNXdyk0+esKM=;
        b=GU5MiKnsZCAdUnWtPKB7G7Mj0KZWTigFA3bbItnyCU36ZqppT6T5GIAExvBds1rHD0
         o9brxgbcF25is4ARQ7aaVwR5v7WAkijj3gx1xtQ3mjXcMuoa7vQD9HpCVgeit0QVIHhL
         hWqpT/tTU91RYK0ZzHaUdDL3PHvtdDMV+uDwar1zidlelMD7ZMPgc5rRi3zhr2L6rBuC
         I4g0u+/busb4rcHBcWliepOKVerNxhuOkCfFBRECtbZEI6L4H/uydIounfOk9WIkjYIQ
         VzC/IF1YGupkaY/FsG4Aai7aKLt+ENfra++qUH1rA89f2FgLPDkHneDOZwcRk8LF6g04
         pOoA==
X-Gm-Message-State: AOJu0Ywk90OD/8eEknkTdT04Wpc6Pxd34ij/yZ7Fc9Xmp8vH+I6kci6l
	Thbf7haj0YI1aEReX8AXyuZkYpz2IlnYcKP9Yao+yg7owJ65z4rBYRjC0HUnPo3M
X-Gm-Gg: Acq92OHwXP+kuvCz4XjvM3lD7vs4/VxSMaOBDNZ3SCxow5/rJJJPE+M0enNle14s4/Q
	dAIksw1RL741gkWi5kMRbZpnLJJDGZVq6KFXmAgv9gwW5Wqj3ju4vLqgVEMiqz9wyxd0iUhOADR
	1S5x7r5mU7syP4Hz+Sg1VepW3B0myn4JFiwDU/7QnLD42XvY4cw+yBCkm25915r7ftCs51NzekF
	NmlveOcfuEE/uMxcJJJcNKPHMXdEay4TFE/nkHe/Azs8v+zAxLrNa9fTJZWWoNbWITo+Iqn1BWS
	XMV25YrPIJYJZadXXKuDEKx8mNmWbIrnENMVs2MFlhrxVjYvlD2H79/+8+Vcj9pJtf7r2ohVfDt
	ZIwNuNpkZtjc8eaEy9vb5Iez2Q9D8GCrBXig2dUG4aksNbQ3FhTSuUxXW3+7uXIollXTXhcOY4r
	bCjcDaSLNAdzvv2mtSwrp25ff/OzUB1mR+hbEgvMj20MAPt90=
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr7348861a91.13.1781347922467;
        Sat, 13 Jun 2026 03:52:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm3222322a91.2.2026.06.13.03.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:52:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 1/3] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
Date: Sat, 13 Jun 2026 22:51:51 +1200
Message-ID: <20260613105153.3895524-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238673

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index 18d7de7102..69dd761ca6 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 

