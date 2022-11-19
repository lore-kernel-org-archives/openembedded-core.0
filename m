Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F307BC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 10:11:25 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by mx.groups.io with SMTP id smtpd.web10.17504.1668852684737989945
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 02:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.131, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VV8Pjpe_1668852676;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VV8Pjpe_1668852676)
          by smtp.aliyun-inc.com;
          Sat, 19 Nov 2022 18:11:21 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH] rust-snapshot:add riscv64 toolchains
Date: Sat, 19 Nov 2022 18:11:15 +0800
Message-Id: <20221119101115.319-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 10:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173513

From: Chen Pei <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 2f9cdb9566..491c022a36 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -21,6 +21,10 @@ SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "ef697469b2a3ea8897f49b70e3be
 SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "11630fc51fffe722e52f649357b5948c24b5305cfb61a8114527234e054451c4"
 SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "ba7188b2c7890e61bf58d3aa9e94c323fec375f67cf03841bbcc0f6c800fe6ad"
 
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "284b09a96d4cdbb96827914a318f9c41e2b207c0afeae76b9f0e3830d2ef2d4d"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "5f3e69a185c7246773948ac97c053cf135d81ffdbf926d10a3339de93424f26b"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "b94e262dec82b7cacf3baa77f35601c82d389ad338d118b42da4d23e26240760"
+
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
     https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
-- 
2.25.1


