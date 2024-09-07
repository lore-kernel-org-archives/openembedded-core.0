Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9907ECE571
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 21:42:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.17616.1725745351961742090
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Sep 2024 14:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oySnD2ra;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2115C1BF203;
	Sat,  7 Sep 2024 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725745350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3FPkeryM1UdDo3hZxCJm6O2LZraAA7pOleE0Ijj5JH0=;
	b=oySnD2raIBdaUm9+73XXPx6+BIXUd3usElO8ElsUt2TWBzrjwo8V+xzfpG0dygDethvax9
	WqoUAJVwM//AGRdE6UUSYpda9xR8v7TTojqGcyHO4cjdCNS4A6B4PZxVSjxpQiS4KVmQTY
	/NDuhPkvFCaC8Qc4tSkCs7IGY4kbMZ2DgaJeniJ0DwDPj2HMRajejjudrC7UGbDrABs/qj
	tE2xHv+9dt2CTALR3x1oXt8OwO8m9TaKb6OWvrNEN6ahs6r6NwYs/4t7Vx/Y2ld/6xXrhR
	akHHYF5EzhrWh5TpaORXotMPIJDXl/hV3xyHPq1JmxKzow0nVTobLqm4iQ6voA==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH][kirkstone] cve-exclusion: Drop the version comparision/warning
Date: Sat,  7 Sep 2024 23:42:15 +0200
Message-ID: <20240907214215.1100431-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Sep 2024 21:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204294

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 4d959c90b129..4ce0664c0d56 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
 
-python check_kernel_cve_status_version() {
-    this_version = "5.10.209"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.10.209"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index f5ccf2bc22ad..1f5c783db471 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
 
-python check_kernel_cve_status_version() {
-    this_version = "5.15.157"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.15.157"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"
-- 
2.46.0


