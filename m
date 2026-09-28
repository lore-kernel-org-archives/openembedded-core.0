Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA431CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:44:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66557.1790624653638973429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=InyXNwCo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260928194410bd7bf12870000207b5-mkiety@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260928194410bd7bf12870000207b5
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8fUaNcVEE4SWhU1lUNCC/Smn2EY36apFxzbsnBxlqLI=;
 b=InyXNwCoudPuzVSTIEW5E+nFI1jLeZlCrwVfZcfu8KMeHCj+HYm9htUx2s14SSTRWgwXFM
 roCdsuN8ezS0Z82IeRIXk2xphYZQORgUoA8D11flVzU7He6ofStC+RiARrXVbSkhO+z90TDt
 oeN/3Fonkhe5scp5yN/iHDDORW2LuJlceDmMyCNFp7mJyuToLvdB/RTkn/BiwSY6OVGZoawb
 nMYWnCCyZ3KA/qot+7RFREpYatZp55dHQtHwdl3dn3R6dvWZszHfLqc/0VBUFA3lMLHJFJBM
 e0ws+VWHrZPk8EJXKlA9RxAbrzDBHBjGWxosi2JEVE6VBD1ZOTxWD33A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/4] graphene: set status for CVE-2026-81281
Date: Mon, 28 Sep 2026 21:43:54 +0200
Message-ID: <20260928194357.37972-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246794

From: Peter Marko <peter.marko@siemens.com>

Per description in [1] and also per [2] this is CVE is for WordPress
theme.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/81xxx/CVE-2026-81281.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-81281

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 41cfe5df728cfeef3adac69f0bbdace70c339e78)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 7aa72b4a78..0d526d3d76 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -28,3 +28,4 @@ FILES:${PN} += "${libdir}/graphene-1.0"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-1984] = "cpe-incorrect: issue in a WordPress theme"
+CVE_STATUS[CVE-2026-81281] = "cpe-incorrect: issue in a WordPress theme"

