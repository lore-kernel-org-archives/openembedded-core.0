Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55EFD13596
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 03:46:27 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.43841.1730087180638284109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 20:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 28 Oct
 2024 11:46:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 28 Oct 2024 11:46:18 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 0/2]  wic support different sector size
Date: Mon, 28 Oct 2024 11:46:16 +0800
Message-ID: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 03:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206417

v1:=20
- wic support different sector size
- util-linux: sfdisk sector size improvements (merged)

v2:=20
- For "wic ls" modify get_partitions() to support WIC_SECTOR_SIZE.
- Add oe-selftest for WIC_SECTOR_SIZE.

Vince Chang (2):
  wic: add WIC_SECTOR_SIZE variable
  selftest: wic: add test for WIC_SECTOR_SIZE

 meta/lib/oeqa/selftest/cases/wic.py      | 50 +++++++++++++++++++++
 scripts/lib/wic/engine.py                | 18 +++++++-
 scripts/lib/wic/plugins/imager/direct.py | 56 ++++++++++++++----------
 3 files changed, 100 insertions(+), 24 deletions(-)

--=20
2.25.1


