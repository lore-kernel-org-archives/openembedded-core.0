Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7DBC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 12:05:45 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by mx.groups.io with SMTP id smtpd.web12.4715.1668513936310424515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 04:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.131, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VUtSUnd_1668513926;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VUtSUnd_1668513926)
          by smtp.aliyun-inc.com;
          Tue, 15 Nov 2022 20:05:33 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH V2 1/2] Support bitbake compilation when the host is a RISCV platform
Date: Tue, 15 Nov 2022 20:03:15 +0800
Message-Id: <20221115120314.325-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6D11494A-84C4-446D-A736-49841179EC70@arm.com>
References: <6D11494A-84C4-446D-A736-49841179EC70@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 12:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173269

From: Chen Pei <cp0613@linux.alibaba.com>

I have a RISCV board running Ubuntu, and then clone the bitbake, meta-oe... to compile, 
just like using yocto in ARM board, so I need to add machine-sdk:riscv64 to support it.

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


