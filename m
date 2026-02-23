Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1B0EEC2A3
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:18:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7084.1771885121545255134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 14:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HTRtCyfg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202602232218390807edae6d00020794-jvw7yk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202602232218390807edae6d00020794
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 23:18:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cHF4jruEE/floGgwePl3mMPxHXoI3uRa1kwMy1TyBsI=;
 b=HTRtCyfgw0R/a8FJcjOMOCxHfXUb1TGLWfJHWr78u9bOYQzyJxjCoGAdS3dHV8/65qkeo3
 DixwqiOfYpdDI8++UIVIoUHIVoaWruMFLQoGq9VKp/ahlSqdUoE+LIpfB4e5P1S3HqskVI95
 gfEh5WKXBb/aavvWdsPgc5AYHNCJBMGCGITi2iZqEHa11445Ffs1OIqG49dhwWlwKY5DUiyj
 bvFCqAj5epQXOr+Gt9sMJHwCKk0Cig+/dCTP/Lmmj4tkeiB7AxRm6IOR/eHby560BcB7g0Vg
 nFIAQ5sjaDCPlDZkK3G0nvMBb2gq+eJR/9HRtwyGWLFFzUQyniHa/LaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] cve-exclusions: set status for 5 CVEs
Date: Mon, 23 Feb 2026 23:18:31 +0100
Message-Id: <20260223221831.11844-2-peter.marko@siemens.com>
In-Reply-To: <20260223221831.11844-1-peter.marko@siemens.com>
References: <20260223221831.11844-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 22:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231714

From: Peter Marko <peter.marko@siemens.com>

Reuse work of Debian researchers and set status for fixed CVEs
accordingly.
These are not tracked by kernel itself, so generated exclusions won't
help here.

* https://security-tracker.debian.org/tracker/CVE-2022-38096
* https://security-tracker.debian.org/tracker/CVE-2023-39176
* https://security-tracker.debian.org/tracker/CVE-2023-39179
* https://security-tracker.debian.org/tracker/CVE-2023-39180
* https://security-tracker.debian.org/tracker/CVE-2023-6535

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 80c76433ef..7d68a9bbaa 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -157,3 +157,19 @@ CVE_STATUS[CVE-2023-7042] = "fixed-version: Fixed from 6.9rc1"
 
 #Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
 CVE_STATUS[CVE-2024-0193] = "fixed-version: Fixed from 6.7"
+
+# Fix https://git.kernel.org/linus/517621b7060096e48e42f545fa6646fc00252eac
+CVE_STATUS[CVE-2022-38096] = "fixed-version: Fixed from 6.9"
+
+# Fix https://git.kernel.org/linus/5aa4fda5aa9c2a5a7bac67b4a12b089ab81fee3c
+# Fix https://git.kernel.org/linus/79ed288cef201f1f212dfb934bcaac75572fb8f6
+CVE_STATUS[CVE-2023-39176] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/e202a1e8634b186da38cbbff85382ea2b9e297cf
+CVE_STATUS[CVE-2023-39179] = "fixed-version: Fixed from 6.5"
+CVE_STATUS[CVE-2023-39180] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/efa56305908ba20de2104f1b8508c6a7401833be
+# Fix https://git.kernel.org/linus/0849a5441358cef02586fb2d60f707c0db195628
+# Fix https://git.kernel.org/linus/9a1abc24850eb759e36a2f8869161c3b7254c904
+CVE_STATUS[CVE-2023-6535] = "fixed-version: Fixed from 6.8"

