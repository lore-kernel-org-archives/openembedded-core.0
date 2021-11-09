Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00E9C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 08:12:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.9145.1636445525647675840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A98C4LJ021874
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 00:12:05 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1A98C41i021942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 00:12:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 00:12:02 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 00:12:02 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] bitbake.conf: Set ZSTD_THREADS to half of cpu number
Date: Tue, 9 Nov 2021 16:48:47 +0800
Message-ID: <cover.1636447679.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 08:12:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157999

The following changes since commit afad2f09ebbfe395f8fafce8218e26056479fe39:

  meson: improve SDK's wrapper to make Wraps work (2021-11-08 22:01:53 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/zstd
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/zstd

Robert Yang (1):
  bitbake.conf: Set ZSTD_THREADS to half of cpu number

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


