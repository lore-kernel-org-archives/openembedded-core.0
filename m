Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0230EC83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 13:07:16 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.35618.1752325628325611434
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=mfGuyJcY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250712130704de000a4e6ed23fc616-g0_26z@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250712130704de000a4e6ed23fc616
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 15:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3seJrgmGhhtJihMHfYmc56hlRze8zbETpu9v1siQ7B8=;
 b=mfGuyJcYdQiQrGHpTVrXb2Q2HW1oDL5BYasKFaNCo4kh24w0ku8lb7cmseU+iqZkAuW1e3
 omN0CgKhsScjmpncDRAJnOZ99nU8EMZ3Nk64rlct4gO308ZLadEYGMYa1uYtZkBGSNC4fS6G
 1p+j5AB/5YSd9JFz+/UrkdKC65CTWTn87NAbaLVDKGULtQyaVrZit4WjjM2SOlLFV9eGXnw9
 gk/xPWnEqm6F9U01KfCtGnVPITB/57xMcaT9AWEeEIsSOZ7wCvdGjIfxOre+iDykESMuMory
 CZCnSbYOgNADy0CnZTBONcrhwtjBfNUGz0ligccbNRGAMV3dyro4xLFw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] oe-selftest: Add a test for devtool deploy-target --strip
Date: Sat, 12 Jul 2025 15:06:35 +0200
Message-ID: <20250712130650.3406826-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 13:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220188

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The first patch adds test coverage for the
'devtool deploy-target --strip' functionality.

The second patch removes a dependency on the meta-poky layer;
please consider it if it helps progress towards removing the poky git
repository in the context of bitbake-setup, otherwise feel free to
ignore it.

Adrian Freihofer (2):
  oe-selftest: devtool deploy-target test --strip option
  oe-selftest: devtool: run without poky

 meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++------------
 1 file changed, 34 insertions(+), 30 deletions(-)

-- 
2.49.0


