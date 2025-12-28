Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6DAE92725
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 18:09:56 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29083.1766945391865602282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=j8pHkvHo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251228180948bb35df7011000207b8-cpomff@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251228180948bb35df7011000207b8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Dec 2025 19:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ITqzIzGARHOsKbizF+k0nBKD/rKFdtwIUoTWup3tvsE=;
 b=j8pHkvHov6Xltko65Oqh2CyN9fXU+55TJzHZsStH8TJl7uiH4uCGMlAvS9XO8eje0uVvC9
 8kVltwih67WsstP5pVJeJLalZr29Cb0jh4ettnab1RLt9XOCVaV8a/DPtHD9btj5ukAMSmya
 GWpxZo3WjS/ew/dsbfE6dnwZyumLdNcY9EW4hhtrMHnd+UoBRctCQRmcylNQadozoXSOcZDl
 f4i/BoFnhKH2kL4ECoin3t2oCk4Vbj0t9REluP0nT78KBJBwjE8D8o5xJmHr0EgZt59D16Jt
 cHllJO+4CCcz79wnrL17SZ3ZAjKhWOsHzVR0MjcIYw9leQd/ykyfzDmw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/3] fragments: add a 'devtool-ide-sdk' fragment
Date: Sun, 28 Dec 2025 19:08:30 +0100
Message-ID: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 18:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228590

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v1:
- Drop the insecure root login part from the fragment description.
- Add support for fragments in write_config.
- Use the ide-sdk fragment in the ide_sdk selftest.

Adrian Freihofer (3):
  fragments: add a 'devtool-ide-sdk' fragment
  oe-selftest: case: support fragments in write_config
  oe-selftest: ide_sdk: use the ide-sdk fragment

 .../conf/fragments/yocto/devtool-ide-sdk.conf | 26 +++++++++++++++++++
 meta/lib/oeqa/selftest/case.py                |  9 ++++++-
 meta/lib/oeqa/selftest/cases/devtool.py       |  8 +++---
 meta/lib/oeqa/selftest/context.py             |  1 +
 4 files changed, 38 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/fragments/yocto/devtool-ide-sdk.conf

-- 
2.52.0


