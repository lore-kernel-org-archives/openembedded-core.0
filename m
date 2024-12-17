Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF82AE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 18:05:09 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.88365.1734458700794939708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 10:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4BHI4x3c010626
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:04:59 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: write_local_conf add shutil import
Date: Tue, 17 Dec 2024 12:04:58 -0600
Message-Id: <1734458698-17830-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 18:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208845

Add shutil import to resolve error:

Exception: NameError: name 'shutil' is not defined, Did you forget to import 'shutil'

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 8cb27ad..3019dad 100644
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
1.8.3.1


