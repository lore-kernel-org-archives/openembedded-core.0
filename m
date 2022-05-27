Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDFAC433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 07:07:17 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.856.1653635233874280777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24R77CSc026829
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24R77BWU029053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 May 2022 00:07:10 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 27 May 2022 00:07:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] systemd: Set RebootWatchdogSec to 60s as watchdog
Date: Fri, 27 May 2022 00:07:10 -0700
Message-ID: <cover.1653635182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 07:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166201

The following changes since commit 579906b9f4ea32c8d4e0e11a87ee6c9e27cdf0dc:

  kernel.bbclass: Do not overwrite recipe's custom postinst (2022-05-23 21:31:07 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/watdog
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/watdog

Robert Yang (1):
  systemd: Set RebootWatchdogSec to 60s as watchdog

 meta/recipes-core/systemd/systemd_250.5.bb        | 8 ++++++++
 meta/recipes-extended/watchdog/watchdog-config.bb | 7 +++++++
 2 files changed, 15 insertions(+)

-- 
2.35.1


