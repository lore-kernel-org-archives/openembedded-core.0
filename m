Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7B0C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 09:13:58 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by mx.groups.io with SMTP id smtpd.web08.1108.1668244436255223537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 01:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.57, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VUaSrZ-_1668244427;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VUaSrZ-_1668244427)
          by smtp.aliyun-inc.com;
          Sat, 12 Nov 2022 17:13:53 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [meta-oe] [PATCH 2/2] Support for building on RISCV
Date: Sat, 12 Nov 2022 17:12:18 +0800
Message-Id: <20221112091217.1025-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221112091217.1025-1-cp0613@linux.alibaba.com>
References: <20221112091217.1025-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 09:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173148

From: Chen Pei <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 meta/recipes-devtools/meson/meson_0.64.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson_0.64.0.bb b/meta/recipes-devtools/meson/meson_0.64.0.bb
index 84c3c84515..c8ef8a23c5 100644
--- a/meta/recipes-devtools/meson/meson_0.64.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.64.0.bb
@@ -67,6 +67,8 @@ def generate_native_link_template(d):
         loader = 'ld-linux-aarch64.so.1'
     elif 'ppc64le' in build_arch:
         loader = 'ld64.so.2'
+    elif 'riscv64' in build_arch:
+        loader = 'ld-linux-riscv64-lp64d.so.1'
 
     if loader:
         val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
-- 
2.25.1


