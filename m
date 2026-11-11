Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1103.1794436336749652597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 14:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NVsrwpG5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261111223214eb53cd0f910002076d-sd703n@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261111223214eb53cd0f910002076d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Nov 2026 23:32:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=myW7TPj5tIipa1oOYJooQaUSaLxjBswseYvGUwOWl/k=;
 b=NVsrwpG5XbbgwB93OTfVsR6fY0j2A79jyu/13dhgd0j8VIC0sRNFmmL2tiyEwEf2bwAqRT
 ST6OvdEMMaZDYp0sAq9LJp94L1oXidLgxlB2jfCHuDb4iHCpkWW5Vm0qkEZQ1+fs55T2zpbo
 XtOA8c/Ccylej4GwYVDfP81DQNjb/3/ljaOVl9GITqBi7H43jEG0TqD7NqgdkI8KOkJNQV2F
 ee6eD2gS/6WdC1k2tnaYmb6+smG1DMrjF/lelr+l2sh+iBAuqil+YrIUCHz+ixSFbCDzeOVj
 yZxx0cckV9RwqdC7ycJ5pW6rI75IFZxH3yhsy3VLpa1jkbdqYOx9aD5w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 2/2] xserver-xorg: upgrade 21.1.24 -> 21.1.26
Date: Wed, 11 Nov 2026 23:30:17 +0100
Message-ID: <20261111223017.2727134-2-peter.marko@siemens.com>
In-Reply-To: <20261111223017.2727134-1-peter.marko@siemens.com>
References: <20261111223017.2727134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 22:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250058
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

From release notes 24.1.25 ([1]):
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

From release notes 24.1.26 ([2]):
* CVE-2026-109091: X.Org Server EDID DS_RANGES Out-Of-Bounds Write
* CVE-2026-109092: X.Org Server XvShmPutImage Shared-Memory Bounds Overflow
* CVE-2026-109093: X.Org Server XTestFakeInput Valuator Stack Out-Of-Bounds Write
* CVE-2026-109904: X.Org Server XRes QueryClientIds Request Size Overflow
* CVE-2026-109094: X.Org Server XRes QueryResourceBytes Swap Path Size Overflow
* CVE-2026-109095: X.Org Server glamor Xv Image Size Integer Overflow
* CVE-2026-109096: X.Org Server XvPutImage Negative Image Size Length Bypass
* CVE-2026-109903: X.Org Server XvQueryImageAttributes Negative Size Reply

[1] https://lists.x.org/archives/xorg-announce/2026-October/003748.html
[2] https://lists.x.org/archives/xorg-announce/2026-November/003760.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.26.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.26.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
index 8d7f9ae14d2..d5a0f65640a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
+SRC_URI[sha256sum] = "c8609f9cdafde14de7ec7cb406dac9507add1d536df8d3c3e3d3d9c1cd864066"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
