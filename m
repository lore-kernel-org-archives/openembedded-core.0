Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52476C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:02:40 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4364.1785794551735366202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FV3hHS6i;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202608032202274cc514a3270002072d-5vqcz7@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608032202274cc514a3270002072d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bHFQODvSdB2w7Dgu+VdiY5ku+Wes9OjJwbNAFBr+bR4=;
 b=FV3hHS6i6npdhTXMF1+guA3ToPIw//yM6dBiaCnKN3+mKEN3qrYJsH1QDcIz0A+M9p7fc8
 ftXNaPVQcA80ZCmrUM68dMNuyAx54IxInR/RwO47gvJPfolCO9yKMVjD8vyIp3wQDVpsHKYq
 PQ0R1EWGjKIWzBTsY2mFhwVH+Ru6zelkhz/aCf5zMQWEn9DXa+Y5isJAA+cOAOiw/rB8X1LV
 rDV2JeRQP92JqhqtYL534LBKL5VocDA2gqNkRbLrXF+XqWpbCyaFbgGa4qwSpXjSPFESFzCO
 1wKmXWUBb3mEPoblmz/DlXl0JBhZ2y9vh65ZPvy6LSR96NdsBa2UAKhg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 01/15] xserver-xorg: upgrade 21.1.22 -> 21.1.23
Date: Tue,  4 Aug 2026 00:01:41 +0200
Message-ID: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242657

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ad22af929c5928ac202cb84ef07ee25689f928b4)

Release notes:
* https://lists.x.org/archives/xorg-announce/2026-June/003702.html
* https://lists.x.org/archives/xorg-announce/2026-June/003703.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 7d151aaa63..4a5bf4ba43 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From 6d23037f48f3d534286fc2bda927c9b6ee5d1445 Mon Sep 17 00:00:00 2001
+From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
index 6a9826d959..d3c00e087e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
+SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

