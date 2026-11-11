Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1061.1794436347041274135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 14:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ePDr7KMs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202611112232250bbf9a01f0000207fa-js76qr@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202611112232250bbf9a01f0000207fa
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Nov 2026 23:32:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W7KESX4ge3x0UGynTYzd3S8+Qbq3Jzx7Xg4be1fqyb8=;
 b=ePDr7KMscNfb61+cmwZcB6oOlTobBxlGeY9lkvojz4B9bgUSQPxzcv2OxBmpEK7wklI6Ur
 eVtTlhJg/OhjqYACOVwf6YPV3O9Lg3I3k55H/AgJJdhPzxyMk0cPSfKVg/+1G7+sZ6GfPpVg
 EdFkKI3Eovmyrl88NSO4KstYJuV5Dgw3ARE2TjK/n+Zp/6Ka7wiNoualfeBBNTWwJcpe533i
 D9y+CTcL7I9w5jzNnNleDnNO6rEtpU7/y+YgDK6r+59MLJKhnYnrtX1Xhj+f709zgwtuCY6y
 fCBBMpVTet63Cak9vbNxzRlT/Zkvou2wBhGRYvq9E0dUQqkVAQExDugQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] xwayland: upgrade 24.1.13 -> 24.1.15
Date: Wed, 11 Nov 2026 23:30:32 +0100
Message-ID: <20261111223033.2727881-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 22:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250059
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
index 41bf1687a2..b221a2d139 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
+SRC_URI[sha256sum] = "7311b4bcda22cfc19cb99680eb1c35cfc1ea885981310639f0429fe2948c122e"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
