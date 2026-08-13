Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E504C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:56:35 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22398.1786636590715889418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XOUajg4R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202608131556272a8e0d9c4d000207fd-pjxih4@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608131556272a8e0d9c4d000207fd
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Aug 2026 17:56:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KglKsH1RAGGcNKf6M0C7WHy+N2sokmN+45LXooc0waI=;
 b=XOUajg4Rlp9ZPWldGFxuxu3OHleRqnG97tXOMbWPOJyNF0buavr3A3TyBaVjLKoJRfhP1U
 N8Wns7XZqb+hRSFAeXL7XKaq5nfDqG1PhSjhlJkxPwNQsTPOAGvEZwG58fkShu2rNKmL+J7P
 UCI9JzHoH3RG2qXz7llsOflfRcp+D577hKSAS14s0biflO/w0mdNc6Oh5TVdAmJrhrAImqfS
 FsLQOj+a6AEuEb6YxTcgXJABJgqQARBoO68aYg45LpbRJ/gZdiQqau7EShIKGd40Urur3dK6
 n9lhmWa0RIiokPmD/kQ8lXfX6pWA3KuZW2G2uCJrO64CZkq3cKydmkTA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] qemu: set status for CVE-2024-6519
Date: Thu, 13 Aug 2026 17:56:07 +0200
Message-ID: <20260813155607.64382-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243375

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is finxed in v11.0.0-rc2.
This is RedHat version-less CVE so needs explicit status set.

[1] https://security-tracker.debian.org/tracker/CVE-2024-6519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9ec522124c..b28f4002ee 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 
 # NVD DB has this CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+CVE_STATUS[CVE-2024-6519] = "fixed-version: this CVE is fixed since 11.0.0"
 CVE_STATUS[CVE-2024-8354] = "fixed-version: this CVE is fixed since 10.0.5"
 
 CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"

