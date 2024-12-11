Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF642E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 02:35:21 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.1956.1733884518864803607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 18:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 11 Dec
 2024 10:35:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 11 Dec 2024 10:35:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 0/3] uboot-sign: support ATF and TFE ITS generation
Date: Wed, 11 Dec 2024 10:35:12 +0800
Message-ID: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208568

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

v5:
  1. create a new variable to add users snippet ITS.
  2. remove uboot_fitimage_user_image hook function

Jamin Lin (3):
  uboot-sign: support to create TEE and ATF image tree source
  uboot-sign: support to add users specific image tree source
  oe-selftest: fitimage: add testcases to test ATF and TEE

 meta/classes-recipe/uboot-sign.bbclass   |  96 +++++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 288 +++++++++++++++++++++++
 2 files changed, 383 insertions(+), 1 deletion(-)

--=20
2.25.1


