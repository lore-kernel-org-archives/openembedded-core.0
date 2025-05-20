Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730DEC54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:01:41 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.17048.1747735291141590457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 03:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 18:01:28 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 18:01:28 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<vince_chang@aspeedtech.com>
Subject: [PATCH v2 0/2]  Add support for setting firmware property in FIT configuration
Date: Tue, 20 May 2025 18:01:26 +0800
Message-ID: <20250520100128.4019721-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216896

v1:
 1. Fix unintended "-e" written into ITS
 2. Add support for setting firmware property in FIT
    configuration

v2:
  Fix review issue
 =20

documentation:
https://patchwork.yoctoproject.org/project/docs/patch/20250520095457.364201=
2-1-jamin_lin@aspeedtech.com/

Jamin Lin (2):
  uboot-sign: Fix unintended "-e" written into ITS
  uboot-sign: Add support for setting firmware property in FIT
    configuration

 meta/classes-recipe/uboot-sign.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--=20
2.43.0


