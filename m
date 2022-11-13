Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562A7C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:34:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web08.2987.1668350081911118431
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SzMlj5Ic;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20221113143440acbae6de5d48af9567-t0bcb2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20221113143440acbae6de5d48af9567
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Nov 2022 15:34:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=m9UHyBhH0vDWxA3Rjxb9cPSd0xEw8cIF77QogWGcIqs=;
 b=SzMlj5IcTOhE4IDqaoTlffpPA5CAPIApGIdgCSZheW6Q6SVFzZnjLyKsB+S5Gbns42ZJLF
 WJs+CM/i2e29A14gJJAfQWEQoxLOD7FuK7OFPAQZqoDZQZ5JKdR5hanhPvzANJ7eLxdTldkI
 3mAl7AEH7N2qK7XFhrb67TmQ0h2PQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 2/2] meta-selftest/staticids: add render group for systemd
Date: Sun, 13 Nov 2022 15:33:06 +0100
Message-Id: <20221113143306.5413-3-peter.marko@siemens.com>
In-Reply-To: <20221108175154.280624-1-peter.marko@siemens.com>
References: <20221108175154.280624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173206

---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index b2e0e2f870..b13dde3218 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -23,3 +23,4 @@ _apt:x:523:
 weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
+render:x:527:
-- 
2.30.2


