Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A6BC25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.9075.1716634168842605899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F+haFSN8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202405251049266ff47e59c930ae2fb4-t7utqu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202405251049266ff47e59c930ae2fb4
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vqvyOtApwkYp8JBNaAYQu+CRKotIv76ei9Ac2tljBSE=;
 b=F+haFSN8hrO68ZoYMq3zvqPyd9KtQBUgBUgkEUQuh2ZE3I6GwrdpCSHl3dvTZ0pxnntl6N
 E8P1r1g+q9DYwCUR8w57CUo0qmzeLd4+nANTivi6PyY5o4sbXrHEhAmrsblxqzMVyriFYMGt
 3gqhLCRLr5pjoFSsEfs4cb3u57Hp0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 5/6] update-rc.d: add +git to PV
Date: Sat, 25 May 2024 12:48:37 +0200
Message-Id: <20240525104838.619254-6-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-1-peter.marko@siemens.com>
References: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199869

From: Peter Marko <peter.marko@siemens.com>

This hash is ahead of the tag, so adapt PV accordingly.

(From OE-Core rev: c94e46019a7d443ccc4763ba16d87e7e97abe977)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ba622fe716..27723c88ef 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f5354
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
 SRCREV = "b8f950105010270a768aa12245d6abf166346015"
+PV .= "+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.30.2


