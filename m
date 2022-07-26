Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C1DC19F2B
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 23:11:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.13554.1658877110445984105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 16:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QNBldP024605
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 18:11:49 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] runqemu: Add missing space on default display option
Date: Tue, 26 Jul 2022 18:11:44 -0500
Message-Id: <20220726231147.3744000-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
References: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 23:11:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168520

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index b4c1ae6d83..b6fc212ebe 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1375,7 +1375,7 @@ class BaseConfig(object):
             elif "-display sdl" in output:
                 self.sdl = True
             else:
-                self.qemu_opt += '-display none'
+                self.qemu_opt += ' -display none'
 
         if self.sdl == True or self.gtk == True or self.egl_headless == True:
 
-- 
2.25.1


