Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC809C001DC
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 09:18:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.22673.1690103927886567785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 02:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a7UzdPCR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20230723091844a9b7d7832fb222ae63-27pewl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230723091844a9b7d7832fb222ae63
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Jul 2023 11:18:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=40UK+3aciPwDHa9kk7LtT6KeqGanUyrVk5nEeNfs9bk=;
 b=a7UzdPCRrw/Z2D8/PHyTFVxN/H201zDgnNSlSt1T+l0U8quniU6JxmBoPE93nCUyEzn4ov
 QUTRaMVij0bAWyPBn00SN3rev/qut22yxp763l3Nfva/BcyQnAzYzOCFRY7f0PlfJsYn07Qb
 qLInQcF9tSReNe2MQfPxci2QX/tjI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH] python3: ignore CVE-2023-36632
Date: Sun, 23 Jul 2023 11:17:18 +0200
Message-Id: <20230723091718.40548-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 09:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184742

From: Peter Marko <peter.marko@siemens.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c652f094d86c4efb7ff99accba63b8169493ab18)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.8.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.17.bb b/meta/recipes-devtools/python/python3_3.8.17.bb
index 8c00d65794..00c4ff497a 100644
--- a/meta/recipes-devtools/python/python3_3.8.17.bb
+++ b/meta/recipes-devtools/python/python3_3.8.17.bb
@@ -61,6 +61,8 @@ CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_WHITELIST += "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_WHITELIST += "CVE-2023-36632"
 
 PYTHON_MAJMIN = "3.8"
 
-- 
2.30.2


