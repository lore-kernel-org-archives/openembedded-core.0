Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C878BC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:01:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12977.1785618101569994962
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eyzHvO5D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260801210137573ff7cdd2000207f0-2q6ujg@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260801210137573ff7cdd2000207f0
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Aug 2026 23:01:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=e4slglV238u8m/bX3/JdYnT+LWRw02+SVVEFiZxPPY8=;
 b=eyzHvO5DEYwUOtGOTyvj1gdhG6Ob++aEFdCOweLhHBm4tgBXWzqAtv+LuRW3X/Flw379lR
 ROuKYaUCahbGLSgXvUQfnuwLae3WfW68C6NASD6yHMjoizJ9tgc/kvddBrIk49xAAwM0V3Zf
 cNXXxCu6ExA5jtNdgyJaDxT0fNaAv8XwyBX+MSOv2cF+bynlwMk5uVAd6uURoVN5muIUIAc/
 WhW7i5OadPcXTLCZOvmgupAiCxC5FWHyKqFzbon3xOUXnAddS0Za09FQQ41V3/7VLXAjJIQL
 dkkmTLM0T2l8aAsf482COY1NW93/FoztMvKx8Os977p02cB3/crxL36g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] util-linux: set status for CVE-2026-3184
Date: Sat,  1 Aug 2026 23:01:17 +0200
Message-ID: <20260801210117.3767668-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 21:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242506

This is RedHat version-less CVE.
Per [1] this is fixed in 2.42-rc1.

[1] https://security-tracker.debian.org/tracker/CVE-2026-3184

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 460b996403..9713c8b882 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -22,3 +22,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 SRC_URI[sha256sum] = "03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c0370f74000679ce8a"
 
 CVE_PRODUCT = "util-linux"
+
+CVE_STATUS[CVE-2026-3184] = "fixed-version: Fixed since 2.42"

