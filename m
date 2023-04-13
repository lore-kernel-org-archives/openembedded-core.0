Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A42FC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 10:31:22 +0000 (UTC)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
 by mx.groups.io with SMTP id smtpd.web10.9187.1681381875458694254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 03:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: aspeedtech.com, ip: 211.20.114.71, mailfrom: jamin_lin@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 33DAFEwp011533
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 18:15:14 +0800 (GMT-8)
	(envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.121) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Apr
 2023 18:31:11 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] kernel-fitimage/uboot-sign: support 64bits address
Date: Thu, 13 Apr 2023 18:31:07 +0800
Message-ID: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.121]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33DAFEwp011533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 10:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179968

v1:
kernel-fitimage.bbclass: allow users to change address-cells
to support 64bits address
uboot-sign.bbclass: allow users to change address-cells
to support 64bits address.

Jamin Lin (2):
  kernel-fitimage: support 64 bits address
  uboot-sign: support 64bits address

 meta/classes-recipe/kernel-fitimage.bbclass | 6 +++++-
 meta/classes-recipe/uboot-sign.bbclass      | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.17.1


