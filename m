Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B71CCA472
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:01:03 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.20222.1759701661192343292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Nf/OMFuT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20251005220057eb9c017e27000207fb-uwqey3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251005220057eb9c017e27000207fb
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 00:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YJ9fRIBckNk4dtFUs3OL8x3Z8dQccfPxET9yTrOgQOA=;
 b=Nf/OMFuT/nAcrEsJBojUwm4QOGi/td+dI1lJc9uAam7APSDguPxfK+4ufk0d65+Lbqz4zJ
 X9etB0fXmrkeLMgbi0V4PYfHqkB+iYXzWrn7vsGky9VlG5KuLIDo/6OlF3CN//HsfuIpkwKP
 Zt6TSko14d1i3H/8ZZQ+RjnrLl3kyseeFXNY1ybvzgT5qXLdbU5Dxmjw13E/PlXaaXWr7w23
 59InDRnlhpOvdhjDwWfkVKXZ1RG9/87NbX2gFdEj7uXuxIRsSt524rStX8fBKWlWwN5gMJgc
 kVfm5XK9GcBg3AYIOC6JEDDqs8bF70wuvwexCmYYTFsozLSTNXbKoqqw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] devtool: ide_sdk: trivial alphabetical reorder
Date: Mon,  6 Oct 2025 00:00:31 +0200
Message-ID: <20251005220047.4101591-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
References: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224447

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 931408fa74..419222fa23 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -297,6 +297,7 @@ class RecipeModified:
         self.package_debug_split_style = None
         self.path = None
         self.pn = None
+        self.recipe_id = None
         self.recipe_sysroot = None
         self.recipe_sysroot_native = None
         self.staging_incdir = None
@@ -305,7 +306,6 @@ class RecipeModified:
         self.target_dbgsrc_dir = None
         self.topdir = None
         self.workdir = None
-        self.recipe_id = None
         # replicate bitbake build environment
         self.exported_vars = None
         self.cmd_compile = None
-- 
2.51.0


