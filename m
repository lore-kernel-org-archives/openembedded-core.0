Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDCFC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:38:30 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43494.1790537900336354767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AOcWO4d1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260927193818299c6d3a85000207f5-uxu6cr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260927193818299c6d3a85000207f5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:38:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wTPFveGm31WQHhZOjBMDp1xPreTRUM2cW4ACDCdI+VM=;
 b=AOcWO4d1uo2UO0hLyl+KIrlh2wGmuI5YB675EBwVEIHo4uoPyxDrmUC0Br6le1uC5A3qeb
 /2mZGB2rmtw2tl9XIJA/5TPOCVYOLPwb5CsMzoDkQayhkMM4lexeyINdDFfNvlM9ljBAWP5u
 64hwbOFXMD1ed+2Qx1FRbIDezvctqUcitkk8Os1sywLaFDyVLo0ajLP2vRv3rbFdEWwUjm/W
 O3b8+3Qrj+O2uGk2mAnrK1pPdeogRpj+MjYXH76bnhQkgADyDYzhW9NrKscVwa6AEELkg8DJ
 yDM2s+geBS5Dq4zeox1f07/4y8JKbYl0WVvsgBa4BgN43VycvUQr8ZUQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 9/9] graphene: set status for CVE-2026-81281
Date: Sun, 27 Sep 2026 21:36:09 +0200
Message-ID: <20260927193609.359250-9-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246715

From: Peter Marko <peter.marko@siemens.com>

Per description in [1] and also per [2] this is CVE is for WordPress
theme.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/81xxx/CVE-2026-81281.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-81281

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

