Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4153C001DC
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 09:21:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.22713.1690104076290443060
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 02:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M0ShpFyj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20230723092114025d387c910d775fc5-nmftrh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230723092114025d387c910d775fc5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Jul 2023 11:21:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vTD2XKm7HwahNIBE6hJ3wAEm40NR1CF/kcyQrz3DAdw=;
 b=M0ShpFyjzvZIA22sVVfz3yBi3ACUKPTbG3jXdHhuaKReLUwtbN/eX/jF0RrWBg3iqnhcPp
 MexExp8l4JHKbrZlfWodbEyNmeuT8lAdy9ODYy9U0niLeYEKZzYwimlZmHtwA3rffKGYA1Q4
 EIIMFTY6Z93tzt690QImd0yDGILr8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] python3: ignore CVE-2023-36632
Date: Sun, 23 Jul 2023 11:20:36 +0200
Message-Id: <20230723092036.40845-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 09:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184743

From: Peter Marko <peter.marko@siemens.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c652f094d86c4efb7ff99accba63b8169493ab18)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.10.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
index 867958c0fb..4ecc7614bb 100644
--- a/meta/recipes-devtools/python/python3_3.10.9.bb
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -61,6 +61,8 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_IGNORE += "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_IGNORE += "CVE-2023-36632"
 
 PYTHON_MAJMIN = "3.10"
 
-- 
2.30.2


