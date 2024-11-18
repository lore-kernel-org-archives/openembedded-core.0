Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECDFD68BFC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 06:32:45 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.35187.1731911555263160883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 22:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 18 Nov
 2024 14:32:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 18 Nov 2024 14:32:33 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS generation
Date: Mon, 18 Nov 2024 14:32:30 +0800
Message-ID: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 06:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207203

v0:
  1. add variable to set load address and entrypoint.
  2. Fix to install nonexistent dtb file.
  3. support to verify signed FIT
  4. support to load optee-os and TFA images
v1:
  Fix patch for code review
v2:
  created a series patch
v3:
  add cover letter
v4:
  Add oe-self testcases for reviewer suggestion
  Add documentation for reviewer suggestion.
  Link: https://patchwork.yoctoproject.org/project/docs/patch/2024111806211=
3.269253-1-jamin_lin@aspeedtech.com/

  The following patches had been applied from v0 changes.
  a. Fix to install nonexistent dtb file
  b. support to verify signed FIT
  c. add variable to set load address and entrypoint.
=20
Jamin Lin (3):
  uboot-sign: support to create TEE and ATF image tree source
  uboot-sign: support to create users specific image tree source
  oe-selftest: fitimage: add testcases to test ATF and TEE

 meta/classes-recipe/uboot-sign.bbclass   | 100 +++++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 288 +++++++++++++++++++++++
 2 files changed, 387 insertions(+), 1 deletion(-)

--=20
2.25.1


