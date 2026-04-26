Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FF5FF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25127.1777229468447189441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eW2mQ590;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260426185106afc0d15f3900020789-0rfeye@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260426185106afc0d15f3900020789
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:51:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=k6yPCQgIwXwOMHrUxCzvtSbKy4ZA23cBvedKXDOKg90=;
 b=eW2mQ590GU42aSCGlj3MS8QVbDkYhtB7NQ7wMOmQfOf0Bl2BeXe9lgRsxobSR6NWspQgrC
 RnThKRSQUKqVvXDyZBZzkD66wQBNJOodzzk0zlcy987gB/jeTxSiQVA7aNlr9sX6QdXtwFrK
 hG8Po+Mff+TM7vyaqBEp/m0IOlLbbwXl72viT3HaUtb/+PX19RtiUMeJOq0iKeSpXsxvmwP/
 OWGRVho5sK7U9JRxj6SklayplAiuloqOEH7FwHtH9tA4U5bEkL+DP9DCcZ10zIJyC5gCc4sR
 RgIc+TxnRWR7N8X2iw2ZBAICD1bjNiLLnsjlSYOL6kEZZhD1JVy/bLuw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/6] git: set status of 5 CVEs
Date: Sun, 26 Apr 2026 20:50:23 +0200
Message-ID: <20260426185025.13217-4-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
References: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235964

From: Peter Marko <peter.marko@siemens.com>

It is unclear why entries in cvelistV5 cause these CVEs to appear in CVE
reports.
There is one which should also not be shown per listed CPEs, however it
does not have a patch, so it's not added to the list - CVE-2024-52005.
The others are set to fixed with version based on which .0 release
included patch mentioned in Debian security tracker for respective CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/git/git_2.53.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 5fe1767e28..5169e93931 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -171,3 +171,9 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
 SRC_URI[tarball.sha256sum] = "429dc0f5fe5f14109930cdbbb588c5d6ef5b8528910f0d738040744bebdc6275"
+
+CVE_STATUS[CVE-2024-32002] = "fixed version: fixed since v2.46.0"
+CVE_STATUS[CVE-2024-50349] = "fixed version: fixed since v2.49.0"
+CVE_STATUS[CVE-2024-52006] = "fixed version: fixed since v2.49.0"
+CVE_STATUS[CVE-2025-48385] = "fixed version: fixed since v2.51.0"
+CVE_STATUS[CVE-2025-48386] = "fixed version: fixed since v2.51.0"

