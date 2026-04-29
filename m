Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309B6CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:54:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14817.1777478057188603671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 08:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=lJrsqV0L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202604291554138aae50c6a60002074d-cnfvsj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202604291554138aae50c6a60002074d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 17:54:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hbJCh+7JEt+fWZqfzrXABG+WNME61MR798BRrFIeUVA=;
 b=lJrsqV0LQkzbtncj0rp5+QBKcBPnRmJ7mj+jCemwO2Q7FjDItxGVZ06op3bV/Ic46x8kqq
 1SjDXqUHeTkRwpuiHhYR6ReSM3fO2TqVdzkAmlL1UZkT46N/aO5m7BqVUeQt+ci7JJ1ZT3Nu
 nOL/AbZCmpeY04IJJYsWTsgNZOPpKrYZ4dJ1Ya+dXW0NjJadc1+DPmx2lw91B4O7uPpcYphm
 y+goS73Id8NHnQZHkV/8P3TKmeboTw4+pDdROxR5ieoREmHSZ24FAqPJd7XNMcgGepysiUXR
 L576A5UOuQY/3y+TjUpkQnnSmmPuPqv0wYajnoJD0/V2JSJ+wHj23KpQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libsoup: set status for CVE-2026-2369
Date: Wed, 29 Apr 2026 17:54:04 +0200
Message-ID: <20260429155404.205979-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 15:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236112

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by commit in version 3.6.6.
It is RedHat version-less CVE.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2369

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index b36976a2be..792cb26e93 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -63,5 +63,6 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2026-1467] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1536] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2369] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"

