Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C7FC55822
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4393.1785794590181808857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BGEaVgcf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260803220307986c6a77bf0002076c-i2uhzd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260803220307986c6a77bf0002076c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aNSDqwP5H1+Ztx86uZRwZAXECpA0SAS0WgfuSL+EzgM=;
 b=BGEaVgcf8+jZgTOXTr0Nj99wPDuQoXM6JIGcs2RTw+hWMeo3eKMOtds6fef3v4uG0/d6ZM
 Saz5+qKMYfFWyQUyJpxH/HTL1UJVhwBc/tpHC1yLyt7SUzR7q3Z+BkGFH+EKYygyfded+fwP
 /Gy3hdNmfxbnIAOsfcUR6v1ZG+GP259l8zbwSOUSg6QvvVRrN2u+o7l0IXa64C9WVJfZ9tUF
 aJo/rTDrycN8Y4BCE8JuzaRreVvx1QITNG7dVvm06Vo45SK7h8DJ+vZFeLC2xEblvJJjm0RO
 1vQDsogUe5r51Q/xPLIUK0NoLOWrMLZAW9orBLVg9FbvobiV7/XeEfRA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 14/15] xwayland: upgrade 24.1.11 -> 24.1.12
Date: Tue,  4 Aug 2026 00:01:54 +0200
Message-ID: <20260803220157.1520377-14-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242670

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c8b621ec16840082b31cf76378b9940851a9d45c)

Release Notes:
* https://lists.x.org/archives/xorg-announce/2026-June/003702.html
* https://lists.x.org/archives/xorg-announce/2026-June/003704.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
index eabf66ffec..52572bfd21 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
+SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

