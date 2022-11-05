Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E1C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 08:27:12 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by mx.groups.io with SMTP id smtpd.web09.4454.1667636822148711362
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 01:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.45, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTzhccM_1667636818;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTzhccM_1667636818)
          by smtp.aliyun-inc.com;
          Sat, 05 Nov 2022 16:26:59 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH v2 4/5] update meta/recipes-devtools/python/python3-brotli_1.0.9.bb
Date: Sat,  5 Nov 2022 16:25:34 +0800
Message-Id: <20221105082535.554-4-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221105082535.554-1-cp0613@linux.alibaba.com>
References: <20221105082535.554-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 08:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172734

From: cp0613 <cp0613@linux.alibaba.com>

Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
---
 meta/recipes-devtools/python/python3-brotli_1.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
index 5a90faaecd..db2b217aef 100644
--- a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
+++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -16,5 +16,5 @@ RDEPENDS:${PN} = "\
   ${PYTHON_PN}-cffi \
 "
 
-BBCLASSEXTEND = "native nativesdk1"
+BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


