Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3FDC55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4253.1785794591535925060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XUOJg7Gg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260803220309586a78b56500020781-rfbiig@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260803220309586a78b56500020781
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=V6/tMIMvy07p3D35gNA5PiC2ofT9Zegk3P3EElMowcM=;
 b=XUOJg7GgjGQG+UJ4ECSctn36J2MKgPFCjFSvrCJdNMt4gMzHcoX7wQ0l3eF/+vUqGy0h5+
 7u6F8FiZKCprqkHdXRZ6TdhKSSao9urct06qZ4eijcqUXIVqoDRk8IE1Wx3mKGR5A4qwjd0y
 nNFQ7kK9wOVrfW4X/NHP1Xlshsv40nzK0sppHPXMOKSloWutpA2pNBIA4juPODeVJ2B/SsTX
 0pM8eQVOR5MRvTgpeI+7axcjRdJofX6Xqr6AKeeZD413xQSWuYxNknMq+YFoRHgGX2VDKWpw
 5WOcrhJudWDL4zZJajk7fji0xSGbbM2SPn60WfPgqKAD+x8c1YLHnfPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 15/15] xwayland: upgrade 24.1.12 -> 24.1.13
Date: Tue,  4 Aug 2026 00:01:55 +0200
Message-ID: <20260803220157.1520377-15-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242671

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f93929ba6cae77b6e28dce24c63a7501bdbd4cda)

Release:
* https://lists.x.org/archives/xorg-announce/2026-July/003716.html
* https://lists.x.org/archives/xorg-announce/2026-July/003717.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
index 52572bfd21..41bf1687a2 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
+SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

