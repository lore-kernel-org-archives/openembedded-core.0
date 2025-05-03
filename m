Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1E8C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 18:57:33 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.16513.1746298645314536705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 11:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NUpvOt+S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250503185721ca2a8f869deb88d928-gnbfnv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250503185721ca2a8f869deb88d928
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 May 2025 20:57:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rt7f77GzuJw5MSnwKChlg4ismmBQ8vkmTgEOD5ipdc0=;
 b=NUpvOt+S2GmHEDEqEK9CmsuFMNMTu2/wI2lObsmIhtFjntFTknQP0hpnFAok0XNYcEbDYX
 ygm6F5Unh88GKa5ZRlD9Z4hmpFRkFPlqX7x+TSW7b+yL6pQHGUrcuYaEw021PDnc5NSUQ4r8
 el7cC0hJbB502E2KKasD8kL/MCO1iTF+yIlRgU0iIlWTxmYHuk49Vw7Z7cBRMHspctFVDZIc
 Hrd78kThC4u84AHP8eswzfe90vWbTuB6gf0yogqtGUoq64fumzCX7rUwFf7YN3FjUFVQ+3nc
 WRPq7p6oZczJ2QLw8daoWyTyYvHVMoPil2wvU6DHBQSWo3gbH8fWPZ+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] ghostscript: ignore CVE-2025-27837
Date: Sat,  3 May 2025 20:56:34 +0200
Message-Id: <20250503185635.686386-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 18:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215936

From: Peter Marko <peter.marko@siemens.com>

This CVE only impacts codepaths relevant for Windows builds.
Se [1] from Debian which marks it as not applicable.

[1] https://security-tracker.debian.org/tracker/CVE-2025-27837

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 3d4ac77cfa..fd0506f438 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -26,6 +26,8 @@ CVE_CHECK_IGNORE += "CVE-2013-6629"
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 # Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
 CVE_CHECK_IGNORE += "CVE-2025-27833"
+# Only impacts codepaths relevant for Windows builds
+CVE_CHECK_IGNORE += "CVE-2025-27837"
 
 def gs_verdir(v):
     return "".join(v.split("."))

