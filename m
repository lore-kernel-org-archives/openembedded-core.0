Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7C1E674B8
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 08:22:13 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.33025.1730449331223081229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 01:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 1 Nov
 2024 16:22:08 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 1 Nov 2024 16:22:08 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 0/1] wic support different sector size
Date: Fri, 1 Nov 2024 16:22:07 +0800
Message-ID: <20241101082208.1635320-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 08:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206606


v3:
- oe-selftest add wic-tools path for wic_sector_size test case=20

v2:
- For "wic ls" modify get_partitions() to support WIC_SECTOR_SIZE (merged)
- Add oe-selftest for WIC_SECTOR_SIZE (merged)

v1:
- wic support different sector size=20
- util-linux: sfdisk sector size improvements (merged)


Vince Chang (1):
  selftest: wic: wic_sector_size add wic-tools path

 meta/lib/oeqa/selftest/cases/wic.py | 92 +++++++++++++++--------------
 1 file changed, 48 insertions(+), 44 deletions(-)

--=20
2.25.1


