Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5952BCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 19:17:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.2343.1755890222126650502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 12:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CkxdxOzw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250822191657bce298bfe8f9027c02-9nqt9e@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250822191657bce298bfe8f9027c02
        for <openembedded-core@lists.openembedded.org>;
        Fri, 22 Aug 2025 21:16:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C2QbjueTHHo7ShYc2PzhlXbqJjY+Sqp3VObSlYvXw+g=;
 b=CkxdxOzwS8Nn/e7f/QbQOhbshqgWr4n7Aq2lIZjTB/lLuCoYavEewP2xBd5AQrYJVMZ0Hm
 Os6b+U0cJwmIHNFYXZkDmsxdzkYvC6sFZEj0seHRR8Yv/esuOGyLimvV7MiaHOOf5CXZtT6W
 ooxvXaRc63s6S9t8SsqNOX6W2Rt7KZlAtQrdGmretWnutXtgWTbaVBv7pvUHFAQ2GxG2rdVl
 /UX1ecB1ePNbJzIOsUdQEYJtjf1vC6akytfay6/n97/ksM0yA9CECmw2kuDWP6XFZPbxWX8R
 T/Ri3tjwenmSau/3GQjBKOdoRsFC0Xy/nxpcxrAZpKepvgPnv0iHKmbQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] qemu: ignore CVE-2024-7730
Date: Fri, 22 Aug 2025 21:16:09 +0200
Message-Id: <20250822191609.24434-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 19:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222346

From: Peter Marko <peter.marko@siemens.com>

This CVE is for virtio-snd which was introduced in 8.2.0.
Therefore ignore this CVE for version 6.2.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cae33459e6..1298514cd7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -164,6 +164,9 @@ CVE_CHECK_IGNORE += "CVE-2022-36648"
 # disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985
 CVE_CHECK_IGNORE += "CVE-2023-1386"
 
+# virtio-snd was implemented in 8.2.0, so version 6.2.0 is not yet affected
+CVE_CHECK_IGNORE += "CVE-2024-7730"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

