Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5587FE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 15:35:46 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.108314.1734536145804540743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 07:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4BIFZhUt019274;
	Wed, 18 Dec 2024 09:35:44 -0600
Received: from localhost.localdomain (70-99-78-137.nuveramail.net [70.99.78.137] (may be forged))
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 4BIFZgTY024684;
	Wed, 18 Dec 2024 09:35:43 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][styhead][PATCH] populate_sdk_ext: write_local_conf add shutil import
Date: Wed, 18 Dec 2024 09:35:42 -0600
Message-Id: <20241218153542.63564-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208872

Add shutil import to resolve error:

Exception: NameError: name 'shutil' is not defined, Did you forget to import 'shutil'

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b64263a43b4d82f1ebba13815bccb8a8cd3127f9)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 8cb27ad995..3019dad0f3 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -289,6 +289,8 @@ def copy_uninative(d, baseoutpath):
     return uninative_checksum
 
 def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum):
+    import shutil
+
     #check if custome templateconf path is set
     use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
 
-- 
2.39.5 (Apple Git-154)


