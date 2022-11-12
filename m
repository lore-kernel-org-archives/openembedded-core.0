Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69987C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 09:13:58 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by mx.groups.io with SMTP id smtpd.web08.1106.1668244429742687054
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 01:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.132, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VUaSrX4_1668244419;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VUaSrX4_1668244419)
          by smtp.aliyun-inc.com;
          Sat, 12 Nov 2022 17:13:47 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH 1/2] Support for building on RISCV
Date: Sat, 12 Nov 2022 17:12:17 +0800
Message-Id: <20221112091217.1025-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 09:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173147

From: Chen Pei <cp0613@linux.alibaba.com>

I try to use yocto on RISCV platform.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 meta/conf/machine-sdk/riscv64.conf | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/conf/machine-sdk/riscv64.conf

diff --git a/meta/conf/machine-sdk/riscv64.conf b/meta/conf/machine-sdk/riscv64.conf
new file mode 100644
index 0000000000..155c195d7d
--- /dev/null
+++ b/meta/conf/machine-sdk/riscv64.conf
@@ -0,0 +1,3 @@
+SDK_ARCH = "riscv64"
+ABIEXTENSION:class-nativesdk = ""
+
-- 
2.25.1


