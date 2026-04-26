Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D39FF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17137.1777205026838585745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RXTRsOiV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202604261203453ecf4c2a5000020751-3u29al@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202604261203453ecf4c2a5000020751
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B7Pe/vh25nldoJj3p259kZeBT8/6/IN4XbjcTu3YXSc=;
 b=RXTRsOiVcrE2aGfpQpGHkjeV/Y6cZ7EwTrFk15K4XrCLawYqYnxhsyTwaVIWxOTzt3vtR4
 7tHVe1Xp3jdOlFKRSGEo0dGKmMHA/7t9FT+nC8G7eY+wm3ZmBaYwZ02nZQXibjgD416omEjJ
 zQTg/a/bNSCavVr+5csw0QB7ZUAA4I1VF8Wh9+BForDczkm7VozSWO0kBKGiAUXy9X3CSLNS
 927ZEdiyzlBU2RQkD4lC36o+g+S/CA5T98tLLLY+P1k7I07WhemHqMkfj8XCM7Pz8hOX9LW6
 3EmCP+y1sz1t0WNZhJX+Za1/ErM4j+KF2dCT3xLomhdeTMrXaNJFFJZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 6/8] rsync: set status for CVE-2024-12084
Date: Sun, 26 Apr 2026 14:02:51 +0200
Message-ID: <20260426120253.825060-6-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235957

From: Peter Marko <peter.marko@siemens.com>

Debian security tracker [1] says it's fixed in v3.4.0.
NVD [2] does not say that our version is vulnerable.

The CVE is reported probably because cvelistV5 has many CPE groups and
some of them are unparseable (so assumes vulnerable).

[1] https://security-tracker.debian.org/tracker/CVE-2024-12084
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-12084

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rsync/rsync_3.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 697cdee829..509be486b8 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -64,3 +64,5 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-12084] = "fixed-version: fixed since v3.4.0"

