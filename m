Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6213DC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 02:02:27 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by mx.groups.io with SMTP id smtpd.web08.6794.1667527340882703259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 19:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.43, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R471e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTuYNYV_1667527332;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTuYNYV_1667527332)
          by smtp.aliyun-inc.com;
          Fri, 04 Nov 2022 10:02:17 +0800
From: cp0613 <cp0613@linux.alibaba.com>
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [PATCH 0/1] add python3-brotli_1.0.9 in meta/recipes-devtools/python
Date: Fri,  4 Nov 2022 10:02:08 +0800
Message-Id: <cover.1667525891.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 02:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172658

The following changes since commit 6050d1f74c02495490d982ead2993b6b3c9cc04a:
are available in the Git repository at:

  https://github.com/cp0613/openembedded-core brotli
  https://github.com/cp0613/openembedded-core/tree/brotli

cp0613 (1):
  add python3-brotli_1.0.9 in meta/recipes-devtools/python

 .../python/python3-brotli_1.0.9.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-brotli_1.0.9.bb

-- 
2.25.1


