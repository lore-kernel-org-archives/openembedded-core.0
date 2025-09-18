Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27818CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.276.1758229693986857871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=pcjPZcxi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025091821081163abda4191000207c0-hcpsbl@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025091821081163abda4191000207c0
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6b4hKb8rHzWV1fYmCcbbh9GsQZ4QbFFp8rLDBmuHjTo=;
 b=pcjPZcxiXNJU141VFbQhlj3NLWSEg2mC6kpXKByG/IiQrCp3lAYZWZPxUkFR2s2YtcgWdn
 NBr7dsbbnDrYm5hLNW4d9dYkXXzU1o0KDJFmcReY/av8VSxXMp29q1mhJPY3zxI4JxSd0mMC
 68Y8ZKcy7hxdZDvZmrtDsJz3XpdD8Ter4Op5ewlzkLz23JU4E5EUBX03MshXXwwJYxd2cUoN
 zGaaNCD5Biej83U4V4TB9vYAQF6h9m0rFKQO3jy7MUOUycE+H+4qf/kJib6BsTk9o2gJiF66
 BhyJLxHMcC3+ueQ09NDJRWSBFW5bvQr0DrXJHQ/SJfZTQahUJ8ff70hQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/19] meta-skeleton: fix spaces in assignment
Date: Thu, 18 Sep 2025 23:07:06 +0200
Message-ID: <20250918210754.477049-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223668

From: Adrian Freihofer <adrian.freihofer@siemens.com>

There is now a warning for = without spaces. Fix it also in
meta-skeleton.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 0879bb17b91..0ceb6ed5845 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -62,7 +62,7 @@ LINUX_VERSION_EXTENSION:append = "-custom"
 # Modify SRCREV to a different commit hash in a copy of this recipe to
 # build a different release of the Linux kernel.
 # tag: v4.2 64291f7db5bd8150a74ad2036f1037e6a0428df2
-SRCREV_machine="64291f7db5bd8150a74ad2036f1037e6a0428df2"
+SRCREV_machine = "64291f7db5bd8150a74ad2036f1037e6a0428df2"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.51.0


