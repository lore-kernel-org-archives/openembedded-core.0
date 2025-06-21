Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA470C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 16:17:04 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.10322.1750522617864095582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 09:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VVafiJO4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025062116165200e910c9a17c2a5f1d-d8bqqe@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025062116165200e910c9a17c2a5f1d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 21 Jun 2025 18:16:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0dUov5x3drJhno823YvvTq43rGBdFa7am8o5wfh70Oo=;
 b=VVafiJO4l7Fkoob6PyXJ1GsPehWh0XLYP1fqYLXrLLo9Ff5kk9qi3qYWbpmAD3MC42FdI8
 tFDTlvKSxS6N6Nm4NtVxZ6Sp1owL8uhpAEnlN/taVXAbiEPmWpg+JUwv5EU/rCYZoF1YAZip
 zz/7wgGmDcW0zyut7v3Ps2QsY1x15+5E6YCsoRUdLLjpcjSOkNQ4t9odGYNGp1Z/xcIh7X9E
 0F6gFyzybGX70wS4mHHj8zHqsyaWkgd+xpPGKF53JUXVWnVQyyNUb9MoiGZ/mxcYVNrv/qJI
 NyoOM0QQoEb9a/m2SLxSDZD3wd2lHZrydLU8+tAV3hOq/ruNPCRsgdXw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/1] FIT image beaglebone-yocto
Date: Sat, 21 Jun 2025 18:14:09 +0200
Message-ID: <20250621161649.798992-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 16:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219169

From: Adrian Freihofer <adrian.freihofer@siemens.com>

changes from v1:
- Send changes in meta-yocto-bsp to poky mailing list (will follow)
  Send only "oe-selftest: devtool: split tap detection into function" to oe-core
- Remove the check for /etc/runqemu-nosudo

Adrian Freihofer (1):
  oe-selftest: devtool: split tap detection into function

 meta/lib/oeqa/selftest/cases/devtool.py | 14 ++------------
 meta/lib/oeqa/utils/commands.py         | 10 ++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.49.0


