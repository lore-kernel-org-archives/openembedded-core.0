Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F69FE95A7D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:56:40 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62166.1767092191521499354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DDPhqQj2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202512301056288c56747abc000207ca-ny3b_p@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202512301056288c56747abc000207ca
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 11:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FtC44X4Mh+8Ga7qVZCFGYSk3XruBhRAC6Gtfd2y4+Yc=;
 b=DDPhqQj2/etTX+BYq9VTRT5OYP8ujUnvudZaXzlBqwbtygKaKYgZTuxx27khodQ7e2HtPW
 UyEb9Ihv51eQhuf4mTx5YaTNmB6y2cPl8tVccSrEIgodn4qqc8813beexmllqdbT1OWspYIf
 uHgsxqdP4cetE7W/xAttkKkhYFYseSL1fZmqTyKAngZO/ngk4+9mctoVEXklUxKAfRZ8THJH
 ATTRboqAHO7MQfuDwRVSamBFnmmzI08rqcapmidVBrKYWPKC5nkobZ0uuCV2oIYsoFFp2ZO5
 9KQa7SPNUa4zPAp48sA0g1nBQ65S3VcqOfh2hi1s0Br9WwalkR7tF2vg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 0/4] fragments: add a 'devtool-ide-sdk' fragment
Date: Tue, 30 Dec 2025 11:52:55 +0100
Message-ID: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228658

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v2:
- IMAGE_FSTYPES_DEBUGFS = "" breaks some tests, so removed that line again.
- Use the bitbake-config-build utility in the selftest to manage the fragments
  instead of manually overriding files.
  Also take care about restoring the original config after the test.
- Add one more commit which removes unused imports in case.py.

Adrian Freihofer (4):
  fragments: add a 'devtool-ide-sdk' fragment
  oe-selftest: case: support fragments
  oe-selftest: case.py: remove unused imports
  oe-selftest: ide_sdk: use the ide-sdk fragment

 .../conf/fragments/yocto/devtool-ide-sdk.conf | 26 ++++++++++++++++
 meta/lib/oeqa/selftest/case.py                | 30 +++++++++++++++++--
 meta/lib/oeqa/selftest/cases/devtool.py       |  8 ++---
 meta/lib/oeqa/selftest/context.py             |  1 +
 4 files changed, 58 insertions(+), 7 deletions(-)
 create mode 100644 meta/conf/fragments/yocto/devtool-ide-sdk.conf

-- 
2.52.0


