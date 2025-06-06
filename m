Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A29C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:19:28 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.28356.1749194358674990690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Jun
 2025 15:19:15 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Jun 2025 15:19:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1 0/2] uboot-sign: Make SPL DTB public key injection optional
Date: Fri, 6 Jun 2025 15:19:13 +0800
Message-ID: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 07:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218112

v1
- uboot-sign: Make SPL DTB public key injection optional

Jamin Lin (2):
  uboot-sign: Avoid symlink and install errors when SPL DTB is missing
  uboot-sign: Make SPL DTB public key injection optional

 meta/classes-recipe/uboot-sign.bbclass | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

--=20
2.43.0


