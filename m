Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B759C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25346.1785873868764384341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kHbngs/e;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260804200425ff348191c40002078b-i4izyr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260804200425ff348191c40002078b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Z9Ugi7f4felHI6r7PJgP21A/0xSXok3dV1EAlN9wKlc=;
 b=kHbngs/ek6B1tDHBZANTWJQBQu67LXr97NWUlOBWnpO/+Y1IBRg9mJuPRgEf3WUJLa3hQO
 T7YI6qF6IRepJ3zsDEg+gbUroU/toDdot6f4XyDrdzcKHwbh3VhKWDks4d0dMm2raCbRZTgG
 w+9KSt4LpUxL8NW6EyqrtfD2fWc3BSc9xrAA1hWar01pkCKeIkBInneKXgTamjirraaSWHZ8
 tGYjrVGXb9FE0rFeea8RT45alAOufkBF36T3Rr73ROyWBaDynzf4wh1pxHJwJxToiJE9gOjF
 EUP6adCSvIFMETJfh+9k86i96pjcyxZF9vYTv47IUAIXkra9hz4PHn9Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 1/6] connman: remove connection_manager from CVE_PRODUCTS
Date: Tue,  4 Aug 2026 22:03:51 +0200
Message-ID: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242796

From: Peter Marko <peter.marko@siemens.com>

The only CVE with this product/cpr is CVE-2013-10036 which is for
different connection manager and is showing up as false positive in CVE
reports with current sbom-cve-check tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 5b2046bf757622ae46e66691119cebc504113993)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index 6f7093301b..920745afc3 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -14,8 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-CVE_PRODUCT = "connman connection_manager"
-
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \

