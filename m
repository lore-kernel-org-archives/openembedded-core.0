Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2078CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 22:11:32 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.1701.1761862283267075019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 15:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=OAzWrSJn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-664519-202510302211194f5da5d65100020797-9zkpan@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202510302211194f5da5d65100020797
        for <openembedded-core@lists.openembedded.org>;
        Thu, 30 Oct 2025 23:11:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=e0a3T7Zoh0jOWISSPbU+SP/tBns/8s2p9pSg9pGhcV0=;
 b=OAzWrSJnOAiqembH+PiwVz6245CiYZzpmtV0gCVmdFLPUHPeNHsBa/c+D/tYzENDqZ4hJI
 MSH9Yp/xYOLdAsU4WMcQGRPEYaXVqJC5iZC/6sG8e0GA8D2lfjOxKk2/wAg394Rwp2Ecf8yI
 BU3HV5mKQJGs8d1EJ3ZY15UCjyV5N27yvoaKSm/GkJSFeuxA/mzzbooqbq2IWVrkS3CyE+mV
 v8EqUMqWHuF4LWbU42Z59Nx3Wqjt/wABGIXayK/IWtZvJGmmZRX2H9rsofs0DTgDspMJOZ3F
 B+w489OwpqXz+KBNeUVXePn37wXm+Dy7J8ONbVigsRxcwg9Nmbct0/0g==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org,
	denis@denix.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [scarthgap][PATCH] Remove empty file
Date: Thu, 30 Oct 2025 23:10:24 +0100
Message-Id: <20251030221024.300873-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 22:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225521

An error occurred in backport commit
649147913e89cd8f7390cb17cd0be94c9710ffa6. The test file
is empty and has no functionality at all.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 test | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 test

diff --git a/test b/test
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.34.1


