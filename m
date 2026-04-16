Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEB5F8DFD0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:25:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28388.1776378346283784895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MwnZvhX/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260416222543defb8d72dc0002074d-n3myes@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260416222543defb8d72dc0002074d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 17 Apr 2026 00:25:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KncwWyZjiWoe2eVJbwETginXhxqtxNMCodN5eOVTDmU=;
 b=MwnZvhX/lAogFExL2YlMvE3rjRRUXPGFeZ9r/Mo9l9PWJKZ+YhUxGIg6JdfNOe9s/pOz90
 Aeeen9wY/ytwCrY/grmVHv0SJ8iYuyD78wjbLfvZPJp4uQPkdvqGLNp9k07ZKvJSQrjYAvFM
 vdsjaD80r911NQccdObwAMTDAexiFUxwrym1uFdtojAwvjf2vXGX20gxDpiNebnZNbTbiJxU
 gZYUVLDsOxQDf8giv0NI75UxgGNEORs8I9YrtIaN9ObmJZyPaEH1MOQADfgQa/ynQiunEFVN
 HMBY3HvGwIoY0AFEyZkebcWngqPbbDG0F+lKYQMmi6YE6phE3mt+KhIQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] cve-exclusions: set status for 5 CVEs
Date: Fri, 17 Apr 2026 00:25:25 +0200
Message-ID: <20260416222526.1992249-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235427

From: Peter Marko <peter.marko@siemens.com>

Reuse work of Debian researchers and set status for fixed CVEs
accordingly.

* https://security-tracker.debian.org/tracker/CVE-2023-53012
  * 6.2-rc5
* https://security-tracker.debian.org/tracker/CVE-2023-53187
  * 6.5-rc3
* https://security-tracker.debian.org/tracker/CVE-2024-49854
  * 6.12-rc1
* https://security-tracker.debian.org/tracker/CVE-2025-38656
  * 6.17-rc1
* https://security-tracker.debian.org/tracker/CVE-2025-68195
  * 6.18-rc5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 7d68a9bbaa..f86c8c3e2c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -173,3 +173,18 @@ CVE_STATUS[CVE-2023-39180] = "fixed-version: Fixed from 6.5"
 # Fix https://git.kernel.org/linus/0849a5441358cef02586fb2d60f707c0db195628
 # Fix https://git.kernel.org/linus/9a1abc24850eb759e36a2f8869161c3b7254c904
 CVE_STATUS[CVE-2023-6535] = "fixed-version: Fixed from 6.8"
+
+# Fix https://git.kernel.org/linus/6c54b7bc8a31ce0f7cc7f8deef05067df414f1d8
+CVE_STATUS[CVE-2023-53012] = "fixed-version: Fixed from 6.2"
+
+# Fix https://git.kernel.org/linus/0657b20c5a76c938612f8409735a8830d257866e
+CVE_STATUS[CVE-2023-53187] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/1ba0403ac6447f2d63914fb760c44a3b19c44eaf
+CVE_STATUS[CVE-2024-49854] = "fixed-version: Fixed from 6.12"
+
+# Fix https://git.kernel.org/linus/cf80c02a9fdb6c5bc8508beb6a0f6a1294fc32f6
+CVE_STATUS[CVE-2025-38656] = "fixed-version: Fixed from 6.17"
+
+# Fix https://git.kernel.org/linus/f1fdffe0afea02ba783acfe815b6a60e7180df40
+CVE_STATUS[CVE-2025-68195] = "fixed-version: Fixed from 6.18"

