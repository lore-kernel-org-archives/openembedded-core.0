Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBC7C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 19:24:50 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2530.1787426687630862122
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 12:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=iPKC3Yco;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202608221924443d204e4e10000207b1-sfsr5d@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608221924443d204e4e10000207b1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Aug 2026 21:24:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sT4jCKscKKqC4znkjUmSABdZptSuMRR90UiF7fldufw=;
 b=iPKC3Yco1Ren5YHAa/OS81Gwc8Oc1aGbjEq1J8wULPXKcCd4oOwZzS3Mib2LUfkD/Lcp99
 Z0wABDV9Ew5wZ0b2Z0JQWVA0vBgnaNBUvXWtmQLPBrB16C+wZlEv5eSfn8gCmhLb73Uf6g7Z
 TMu/PehBT7DTT8DXlHaeXypDxwaNPc4mrnS1YELfzOXxKKsscc8qacMDO4dQmmYlbZaxSrRU
 WL4bYZ2WhKW4G6NlPSs+fLsjSyWEFwqvTLodvUnqHJqH3buhNl3xNSXdxe+sop64jGqOV2QE
 tZoY1cMq3zVGQAHY8Es772hC9xq7Gyaqv8RkagoFGh40m3KpkDWPTSJw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] util-linux: set status for CVE-2026-13595
Date: Sat, 22 Aug 2026 21:24:38 +0200
Message-ID: <20260822192438.3334786-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 19:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244000

From: Peter Marko <peter.marko@siemens.com>

Per [1] this bas backported to 2.41.5.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13595

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index aec8721ca3..103e9d430c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,3 +25,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
 
 CVE_PRODUCT = "util-linux"
+
+CVE_STATUS[CVE-2026-13595] = "cpe-stable-backport: Fixed from version >2.41.5"

