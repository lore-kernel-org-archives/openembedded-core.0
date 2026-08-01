Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF084C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:23:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13289.1785619374008595581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F8ucmm6M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202608012122518455bd0a510002071a-jc4jyt@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608012122518455bd0a510002071a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Aug 2026 23:22:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+dVv+nywqXPqqV8hbrGaS+c50jhQVZ/2EZXulCtZJx0=;
 b=F8ucmm6MNyXHSiN048qNisToeOxNVTq/1ljMJIEVO7BNCr03oQOenHC1Gr1r4xZS5mb5d0
 nCLLP6BUaPBcOKSpvoZ9N2p2+jX66JCbLYUne+0lBitmmj/sfQyjDJ7SkG+lkuPwDFGPA6+M
 rxEL2umdThba0L7xvG0Git9vexlhxd/NuzQFEyT0xm9drwfcndC5YW7kuD0HbgQr83mI04Z5
 RQ9Y7CV+IMV+OuEZNC98G+ugdokaxH0UQSQEIfrU+2ShZtkXQf9Vv3+Isd9kGR/9nxrUIVEd
 0jT6yaemLzMQa7t2z/g0pdSLE53boKTtQMsf4BcpNrwqF8jHumMs02yQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] gstreamer1.0: set status for CVE-2026-5056
Date: Sat,  1 Aug 2026 23:22:32 +0200
Message-ID: <20260801212232.3770959-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 21:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242508

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed in 1.28.2.
cvelistV5 has just hash in version so creates false positive.

[1] https://security-tracker.debian.org/tracker/CVE-2026-5056

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
index b727783746..4e51418c98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
@@ -71,4 +71,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
 
+CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
+
 PTEST_BUILD_HOST_FILES = ""

