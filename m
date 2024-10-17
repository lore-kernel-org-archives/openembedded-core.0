Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D82D21243
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:40:13 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.44552.1729154403810974911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Oct
 2024 16:40:02 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Oct 2024 16:40:02 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 0/2] wic support different sector size
Date: Thu, 17 Oct 2024 16:40:00 +0800
Message-ID: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205991

v1: wic support different sector size

Vince Chang (2):
  wic: add WIC_SECTOR_SIZE variable
  util-linux: sfdisk sector size improvements

 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 ...-and-sfdisk-sector-size-improvements.patch | 252 ++++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py      |  56 ++--
 3 files changed, 286 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk=
-and-sfdisk-sector-size-improvements.patch

--=20
2.25.1


