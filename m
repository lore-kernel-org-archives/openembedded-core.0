Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7612EC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 01:21:32 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.1137.1747790485245780897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 18:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 21 May
 2025 09:21:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 21 May 2025 09:21:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<vince_chang@aspeedtech.com>
Subject: [PATCH v3 0/2] Add support for setting firmware property in FIT configuration
Date: Wed, 21 May 2025 09:21:19 +0800
Message-ID: <20250521012121.3697660-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216957

v1:
 1. Fix unintended "-e" written into ITS
 2. Add support for setting firmware property in FIT
    configuration

v2:
  Fix review issue
 =20
v3:
  Fix the alignment issue

Jamin Lin (2):
  uboot-sign: Fix unintended "-e" written into ITS
  uboot-sign: Add support for setting firmware property in FIT
    configuration

 meta/classes-recipe/uboot-sign.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--=20
2.43.0


