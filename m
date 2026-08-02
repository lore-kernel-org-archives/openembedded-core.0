Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8468C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 21:34:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30981.1785706476315040303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 14:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k9p0hLbD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026080221343271b31f9d6d00020757-gwn_qg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026080221343271b31f9d6d00020757
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 23:34:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sE+tofCrk7kYme/EuikycWvLN5oovBKMqmWC7N2345g=;
 b=k9p0hLbDbS/Ol/9aB6qxQGDraAAuSEU8dRSYyv1PWOFAWjcLSIxgmRbrv2fGBTeuMuWenk
 vkwbZ80wJN3166jx1zRCDbZJrkx5X5IRKtNvfalPdX12jn+nZbMScHCKxxlfgx4pM2/XaVBK
 N0bo7Qnc1UdcyRTf8Y7Y+yLAo8FOJSNRMsa19ztZehB7r9Psu0Ndl3UpMq8RFfpNGYn1aLtB
 dqX6X7hHDCdMbG8iEy1/gJsnh09NuJAB/WZrOxV9SUn56qJWztC3+hH2bQh8QeuP7tY1ZJV4
 nhJqMbsSfyiIJPOOAG9BTXeyrmkug1jjH9MfcRXK9DtUtf2KPOR5tarA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] xserver-xorg: set status for CVE-2026-55999 and  CVE-2026-56000
Date: Sun,  2 Aug 2026 23:34:13 +0200
Message-ID: <20260802213413.2425121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242591

From: Peter Marko <peter.marko@siemens.com>

Per [1], CVE-2026-55999 was fixed by [2] which was backported as [3].
Per [4], CVE-2026-56000 was fixed by [5] which was backported as [6].

[1] https://security-tracker.debian.org/tracker/CVE-2026-55999
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/fbf7bac22e2c6bd627fb042742a23318263edae1
[3] https://gitlab.freedesktop.org/xorg/xserver/-/commit/0f1f4bcbfb1f23b800dfe386782d3a0f05b6756f
[4] https://security-tracker.debian.org/tracker/CVE-2026-56000
[5] https://gitlab.freedesktop.org/xorg/xserver/-/commit/2779affbdb4354e894f490e56f962527d6125043
[6] https://gitlab.freedesktop.org/xorg/xserver/-/commit/d6d96084f305a142eb3db7f720d7edd21e4c98b4

cvelistV5 has correct version identification, so CNA (SUSE) has it
correct, too.
NVD however shows non-existing version 21.2.24 (probably from CVE
description), so it's showing up in reports as unfixed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7c0a24e58b..689758fd6b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -31,6 +31,8 @@ available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
 CVE_STATUS[CVE-2026-34000] = "fixed-version: fixed since v21.1.22"
 CVE_STATUS[CVE-2026-34002] = "fixed-version: fixed since v21.1.22"
+CVE_STATUS[CVE-2026-55999] = "fixed-version: fixed since v21.1.24"
+CVE_STATUS[CVE-2026-56000] = "fixed-version: fixed since v21.1.24"
 
 S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 

