Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3751FC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:57:27 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.36873.1741611441783338587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Kk1ySGZp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250310125719d4461ff1b88a411449-o4q_ac@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250310125719d4461ff1b88a411449
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Mar 2025 13:57:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2gypXPboAMxjvfm8/ptIUEJ8kklttFGupjK9Fg28MrU=;
 b=Kk1ySGZpBoJVN5hCNam1TRwzW76rusY2Vsy3nXWSuHY2iS3AKuw0AHIrZJJcdiZovwaKWE
 CLa+/dS882AAT4pyCyUbZGGc/wlbDJIJsPuJ8v2FDM2PWXOP0C775G95+YNrrk/2Yc9X8jlq
 H/r47xnFWJQTbtH7YP7lxeyCr4Mn12c7nP2JO798a30EdNS0BwUh1z6VBdN/U39VYyykH/G+
 TIzqzqoy+0vdswTd7EFkvY8XjPAcq2CVCWB3FjvGo/+XID3ws2044FFQ6QADQmCyvLyYeKmP
 ZapkZmX+Hu1A3Lb0PvAPTKr+LLrpOKGkXFzJVhtYp37go6cawj8TjgdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH] xwayland: upgrade 21.1.4 -> 21.1.6
Date: Mon, 10 Mar 2025 13:56:22 +0100
Message-Id: <20250310125622.2415014-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212518

From: Peter Marko <peter.marko@siemens.com>

Handle following CVEs:
* CVE-2025-26594
* CVE-2025-26595
* CVE-2025-26596
* CVE-2025-26597
* CVE-2025-26598
* CVE-2025-26599
* CVE-2025-26600
* CVE-2025-26601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xwayland/{xwayland_24.1.4.bb => xwayland_24.1.6.bb}     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.4.bb => xwayland_24.1.6.bb} (84%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
similarity index 84%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 6f8589ba5a..0774c1bbf5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
+SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
@@ -48,3 +48,7 @@ do_install:append() {
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
 RDEPENDS:${PN} += "xkbcomp"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 24.1.6"

