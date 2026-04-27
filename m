Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B3FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:51:54 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7310.1777326705063825424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QWMBKoRx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026042721514364b2bd55dd00020712-agyhnu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026042721514364b2bd55dd00020712
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Apr 2026 23:51:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AWKQZ9ZNW4Zuyjkn1glHa8B0RlD+nGBayspIL5fHubU=;
 b=QWMBKoRxynoeFgGIp7OMhf4Ev2ZTABM+gd/grgW7rjHoThIcOjAi5xFLanHwXawlqIb/RN
 6vzkAOGKm5GXTNot3voSepyPWcIEcus2ClMLV7eSWVf7ZR8+Zt3PXTO7PvvnT028rCByUxdX
 xlE1+hmMGAre44sRNN/uh1RPrVouQL1cSAO2eojXfU3FsZOTPetmgsFCV18tbG1y/Thns+V6
 9frBI158ZjJVd3kbDQJEPStV1jQwIKNDjksQ7NpS6bdjQYMCL2/u/BQH01Zt8ytMWlsvK7Cf
 hF8xVHQ9LBEnyP3+tfAEEnOmPHwVef976HRmLoEmlwnWUTbyVZgq2oIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/4] cups: upgrade 2.4.16 -> 2.4.19
Date: Mon, 27 Apr 2026 23:51:18 +0200
Message-ID: <20260427215120.199335-2-peter.marko@siemens.com>
In-Reply-To: <20260427215120.199335-1-peter.marko@siemens.com>
References: <20260427215120.199335-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236032

From: Peter Marko <peter.marko@siemens.com>

Release notes:
* https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
  * CUPS 2.4.19 fixes a regression in shared printing from non-local accounts (Issue #1557)
* https://github.com/OpenPrinting/cups/releases/tag/v2.4.18
  * The new release 2.4.18 contains a hotfix after the CVE-2026-27447 fix:
    * Fixed cupsd crash if user does not exist (Issue #1555)
* https://github.com/OpenPrinting/cups/releases/tag/v2.4.17
  * The new release 2.4.17 contains the following security fixes:
    * CVE-2026-27447: The scheduler treated local user and group names as case-
      insensitive.
    * CVE-2026-34978: The RSS notifier could write outside the scheduler's RSS
      directory.
    * CVE-2026-34980: The scheduler did not filter control characters from option
      values.
    * CVE-2026-34979: The scheduler did not always allocate enough memory for a
      job's options string.
    * CVE-2026-34990: The scheduler incorrectly allowed local certificates over the
      loopback interface.
    * CVE-2026-39314: Fixed the range check for job password strings.
    * CVE-2026-39316: Fixed a printer subscription bug in the scheduler.
    * CVE-2026-NNNNN: Fixed a SNMP string conversion bug in the backends.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cups/{cups_2.4.16.bb => cups_2.4.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.16.bb => cups_2.4.19.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.16.bb b/meta/recipes-extended/cups/cups_2.4.19.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.16.bb
rename to meta/recipes-extended/cups/cups_2.4.19.bb
index 6c08e49728..c4885b60bc 100644
--- a/meta/recipes-extended/cups/cups_2.4.16.bb
+++ b/meta/recipes-extended/cups/cups_2.4.19.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d"
+SRC_URI[sha256sum] = "820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389"

