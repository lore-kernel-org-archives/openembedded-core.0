Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDDCC48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 10:58:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.16976.1708772319566682534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 02:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=G4mN3wo8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240224105836bd8802170cfe33ee76-gpcavj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240224105836bd8802170cfe33ee76
        for <openembedded-core@lists.openembedded.org>;
        Sat, 24 Feb 2024 11:58:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ct91938tAF9xpQ2vYD3+nMaLx4YSg5UpRNa0+X/8JnA=;
 b=G4mN3wo8UO9bE4Mi++V/R1z8t1SBF/rSnnyF+1i3Q1sDj+z2ZmrcvrokfGXBPdnIE328LH
 t+Egyqp20LSAIISps62iSa5QsQLlYqWAQpZLtrPN+yqJ1+NWhbdpBOVtU9mnON111Qy+LknX
 1+botmj0AW7Z9wBiI5bflyl9qC27Q=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: ignore CVE-2023-0687
Date: Sat, 24 Feb 2024 11:57:37 +0100
Message-Id: <20240224105737.7942-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 10:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196125

From: Peter Marko <peter.marko@siemens.com>

This CVE was backported to glibc 2.35 branch 9 months ago.
NVD recently updated CPE and it appeared in kirkstone cve reports.

https://sourceware.org/git/?p=glibc.git;a=log;h=refs/heads/release/2.35/master
gmon: Fix allocated buffer overflow (bug 29444)
https://sourceware.org/git/?p=glibc.git;a=commit;h=f2820e478c68a73a38f81512cc38beeee220212a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 21cd99dfdd..3ec6610d01 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -24,7 +24,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010025"
 CVE_CHECK_IGNORE += "CVE-2023-4527"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.30.2


