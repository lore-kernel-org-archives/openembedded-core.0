Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66E0CD37B6
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 22:46:20 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20870.1778366775829130798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2026 15:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D39/RXsP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026050922461495921e3a2400020770-hgjiwf@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026050922461495921e3a2400020770
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 00:46:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q8Bgtq1rnsD9CiBv/tcLBiXAgXqfGZ/iCfExLLSBB0Q=;
 b=D39/RXsPjkItpW3mTvEFi5rh7KEx07WjtLZzI9NwSFr8QEYRkP03ZWhV6uTcTV1hlHmroj
 /pNlvFjr/rxwq9T//gx3nwP9GQs4BQazqNi1nJBQGlhfdvemipx/MRIewjN2yz3VY+vWJDDS
 kwmhlGPPXDsotOtei5LgdXZe+9vrd2h3EoR9v1hM1CIuJ98eAezUIeyJKKOTLh8woZBd/8MC
 RwACz57YUq+poCbwZQgpjO9EN14oB0N2eQ7ZQ3fcDNWGnuuZ5b2Opv1eav9XjULY8Xoo2HcV
 WOJemVn06Hpo8E7nnxifMAeNIjN1XwrwnxQEeFTOzUUt/1LYcDxa1Rog==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/4] xserver-xorg: set status for CVE-2026-34000 and CVE-2026-34002
Date: Sun, 10 May 2026 00:45:36 +0200
Message-ID: <20260509224536.27734-4-peter.marko@siemens.com>
In-Reply-To: <20260509224536.27734-1-peter.marko@siemens.com>
References: <20260509224536.27734-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 22:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236765

From: Peter Marko <peter.marko@siemens.com>

These are version-less RedHat CVEs.

[1] points to [2].
This was backported as [3 ]in v22.1.22.

[4] points to [5].
This was backported as [6] in v22.1.22.

[1] https://security-tracker.debian.org/tracker/CVE-2026-34000
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/81b6a34f90b28c32ad499a78a4f391b7c06daea2
[3] https://gitlab.freedesktop.org/xorg/xserver/-/commit/a48d67f38753de551cd177e471b545bd8b9b1b64
[4] https://security-tracker.debian.org/tracker/CVE-2026-34002
[5] https://gitlab.freedesktop.org/xorg/xserver/-/commit/f056ce1cc96ed9261052c31524162c78e458f98c
[6] https://gitlab.freedesktop.org/xorg/xserver/-/commit/5328a544ba6c32ecdd1758283ee69058dec100f8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0d8d782712..f720c9cef4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -29,6 +29,8 @@ connection to the X server is lost, so a typical desktop session is either \
 impossible or difficult to exploit. There is currently no upstream patch \
 available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
+CVE_STATUS[CVE-2026-34000] = "fixed-version: fixed since v21.1.22"
+CVE_STATUS[CVE-2026-34002] = "fixed-version: fixed since v21.1.22"
 
 S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 

