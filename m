Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B9FC3DA49
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 12:21:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10361.1720700460746052819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 05:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dvOMnmpL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3B81240002;
	Thu, 11 Jul 2024 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720700458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NWvm6Atolz06IyDN+6eClnVpMI1mU/DB7cM1XBAJ8jI=;
	b=dvOMnmpL9aV/mTPdWNtgIp+kgzPc32h9Ly5LhxmsOCqRQJ6e/c6xw/8tPjCKRftuXkq4xl
	Q1sgnDkVkG3mAXMaKXiPRLstRk5ABts96enLIA58Tk4EXUiJqrQHuJ7dnbwMu7HBKe8Kcc
	1UginwV5oZRjFTcE9jgekIHS5GIztpbSgXpq+81gumEnRamnn5tGCos4WY9LdCSBFjKoew
	tgtN3/9XbDONNCLYEIKi2ttXGP3dmWT4iCQAurIyVk5DBVk7yv9MhnjfpMkNXtxnyhuBC1
	lzY+T7djNVCatkGOqUW+fgrpB34A3ZBZ86q26kY2cXWh5mMOFiNDA35BDsvZWw==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] [scarthgap] cve-exclusion: Drop the version comparision/warning
Date: Thu, 11 Jul 2024 14:20:56 +0200
Message-ID: <20240711122056.864643-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201780

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../recipes-kernel/linux/cve-exclusion_6.6.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 9f1f03ac533c..32a0701edfaa 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,14 +1,14 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-05-02 12:41:43.351358+00:00 for version 6.6.29
-
-python check_kernel_cve_status_version() {
-    this_version = "6.6.29"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+# Generated at 2024-06-06 20:41:33.044442+00:00 for version 6.6.32
+
+#python check_kernel_cve_status_version() {
+#    this_version = "6.6.29"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 CVE_STATUS[CVE-2003-1604] = "fixed-version: Fixed from version 2.6.12rc2"
 
-- 
2.45.2


