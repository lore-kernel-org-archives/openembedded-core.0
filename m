Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F5EFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 19:12:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25568.1777230770514114621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 12:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NOkSmKV6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260426191247b3debe8354000207c6-ipcitn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260426191247b3debe8354000207c6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 21:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hR3WFPeJ0WKeJuh0uSINQCnSE/XxKzHKM+QDEFVp8xA=;
 b=NOkSmKV6HLILkZHKhj0IOTws6slV8GNZdoXDjk8HH0DPSIOwEqH4omseTHe8xsCaWj+ikL
 s2gai4iD1w52rIBo6mmPsinbyyFUjzyyl6fnJAMRS+NBqaFePCZ/bKwsoMjPfI0IoZY2RXvi
 gAB0uW3OcYE173X/GgtHYUuhpNFtK7p3yBbSSSdxIL15Wrde7D4KEa9fRSdCvV/sUTo41cuK
 s8NNVWFlC2KVsK+BOb7+MogRaHd41Dkqw8iCC5Pw1CiHMwrLaufdOMj72gFl9ifZEPBaP9Mo
 9LmGxPRPTK8pOezyWycOqn8vY5I/ZD0mIRpwIu3TpHDXc1XhNJw/+E4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] git: set status of 5 CVEs
Date: Sun, 26 Apr 2026 21:12:08 +0200
Message-ID: <20260426191208.1405257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 19:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235967

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
index 5fe1767e28..8d71905f41 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -171,3 +171,9 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
 SRC_URI[tarball.sha256sum] = "429dc0f5fe5f14109930cdbbb588c5d6ef5b8528910f0d738040744bebdc6275"
+
+CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
+CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
+CVE_STATUS[CVE-2024-52006] = "fixed-version: fixed since v2.49.0"
+CVE_STATUS[CVE-2025-48385] = "fixed-version: fixed since v2.51.0"
+CVE_STATUS[CVE-2025-48386] = "fixed-version: fixed since v2.51.0"

