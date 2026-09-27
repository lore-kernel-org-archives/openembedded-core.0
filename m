Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE52C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:37:30 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43478.1790537843680594474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ASI4D0+C;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260927193722d184462b02000207eb-rtbbut@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260927193722d184462b02000207eb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ENplt8LjoE26zvfD/K/QbNzTLvf2eN/pYzhnja0LnLw=;
 b=ASI4D0+C2H9T9fj1wxkAE+JI7cPzp6TAzgN+CGqlex9QUFOWFPnIsbwRiIP+LdeIpluf0E
 8Mh6gzxfi81g+REn6XfB4IC9IZC+fSrnRdpygeE9KVsXdViNYkCOF+gPujjjjgufNucP5WYE
 AzlnSU3pYQEd+FiRKmroXrikb9jh4S2U90P0K+KmHJL6YtdKPtBu7Ib7fX8BFx5UfrwS9GPY
 6HTNFVyG8ar8iIO7iZD3lwlxOMXuzlvUp4uaMxb8VNgVnUXbCj73gJTZ8taMjXlZwPoKEGL/
 dVBZpoCO2ZbvKOEdXmmtj4AoVBZtDPUgf725/pIzOYw1M1FpITJUuQnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/9] libxfont: set status for CVE-2026-44950 and CVE-2026-59679
Date: Sun, 27 Sep 2026 21:36:05 +0200
Message-ID: <20260927193609.359250-5-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246711

From: Peter Marko <peter.marko@siemens.com>

These CVEs have '?' in affected version (start).
This cannot be parsed by sbom-cve-check so it ends up with
'no-version-ranges'.
Affected version (lessThanOrEqual) is set to 2.0.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
index 82ca4d5024..18e822aebd 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
@@ -21,3 +21,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 CVE_PRODUCT = "libxfont libxfont2"
+
+CVE_STATUS[CVE-2026-44950] = "fixed-version: fixed since v2.0.9"
+CVE_STATUS[CVE-2026-59679] = "fixed-version: fixed since v2.0.9"

