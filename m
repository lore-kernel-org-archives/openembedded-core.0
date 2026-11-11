Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1056.1794436326377916327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 14:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AxipcT9S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611112232046b78e2deaf00020750-aolw8y@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611112232046b78e2deaf00020750
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Nov 2026 23:32:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dRW9ogbLzdqiFhAIcf7VLaFyObia5GFHoRPF+qqUU9A=;
 b=AxipcT9S4HC2PcU1/FzGa8xAQwPgrJCEY4SM2ZLbPbXFE4yLJsFLafa0zXkSCVvdQpSC2T
 mu0+EhNiRqH9f2mRpGfxH0Wzzh0dJrcFnidBRTDRHsqxsIfPjP9m5HvNFKAGHm+5fuKVH7L2
 Kayhp/9p4KhufMRQakY4RwEls9c2vD3CM4QzAcVO4FcK4SMxfL5U5Ochw6vaMkU2KxDp4i3B
 zJaTE2AtGeve2R0+lp6Hm+okerszZblj6wP/Em6qXGaOszOS6i17J9C+mZFHLjqec3MO1Cfk
 WyPPyjABvlPpvBrAVLvIANCM60qX2xO9wD3oosVwMfgjzGuRiFZ00rrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/2] xwayland: upgrade 24.1.13 -> 24.1.15
Date: Wed, 11 Nov 2026 23:30:16 +0100
Message-ID: <20261111223017.2727134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 22:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250057
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

From release notes 24.1.14 ([1]):
* CVE-2026-88812: XKB SetGeometry TextDoodad Double Free
* CVE-2026-93515: Present Extension Cross-Window Notify Use-After-Free
* CVE-2026-93516: XInput Passive Grab modifierDevice Use-After-Free
* CVE-2026-93517: GLX RenderLarge Heap Buffer Overflow
* CVE-2026-93518: XKB ResizeKeyType Numeric Truncation
* CVE-2026-93519: XFixes Pointer Barrier Event List Buffer Overflow
* CVE-2026-93520: XKB ChangeKeycodeRange Heap Out-of-Bounds Write
* CVE-2026-93521: RandR ChangeProviderProperty Heap Buffer Overflow
* CVE-2026-93522: Glamor CopyArea CPU-FBO Heap Buffer Overflow
* CVE-2026-93523: XInput2 PassiveUngrabDevice Modifier Out-of-Bounds Write
* CVE-2026-93524: XKB SetMap Key Width/Action Count Desync Out-Of-Bounds Read
* CVE-2026-93536: GestureBuildSprite Use-After-Free

From release notes 24.1.15 ([2]):
* CVE-2026-109092: X.Org Server XvShmPutImage Shared-Memory Bounds Overflow
* CVE-2026-109093: X.Org Server XTestFakeInput Valuator Stack Out-Of-Bounds Write
* CVE-2026-109904: X.Org Server XRes QueryClientIds Request Size Overflow
* CVE-2026-109094: X.Org Server XRes QueryResourceBytes Swap Path Size Overflow
* CVE-2026-109095: X.Org Server glamor Xv Image Size Integer Overflow
* CVE-2026-109096: X.Org Server XvPutImage Negative Image Size Length Bypass
* CVE-2026-109903: X.Org Server XvQueryImageAttributes Negative Size Reply

[1] https://lists.x.org/archives/xorg-announce/2026-October/003749.html
[2] https://lists.x.org/archives/xorg-announce/2026-November/003761.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xwayland/{xwayland_24.1.13.bb => xwayland_24.1.15.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.13.bb => xwayland_24.1.15.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
index 1f32177ec5b..0bf88664576 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
@@ -10,7 +10,7 @@ LICENSE = "Adobe-Display-PostScript AND BSD-3-Clause AND DEC-3-Clause AND HPND A
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
+SRC_URI[sha256sum] = "7311b4bcda22cfc19cb99680eb1c35cfc1ea885981310639f0429fe2948c122e"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
