Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E3FCD98F0
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50605.1781195496442115901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q9MEMARW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=maghZz+q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786b58d-7a3d747b-7c83-4881-b769-0b6c8dacff56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rECvhqbeQacmKj6LCSCWwvJnSOafGRmHfpdUOt4SEmE=;
	b=q9MEMARW8RIVoh3+u3Pb4fWa2XYcCUfD0rrdDNg6ogL6AYXsKjCNccgTUez+25Rw
	IEtXkEcw6nlesx73LTT1n4y+JEVmxF/NDsNNwWlL/QTRCVCTwXh/yh4x+JQOJkmewfY
	MWAunXZF08YzUL4sB8HvpW6YBxKZ3Gn0w8GrpOic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rECvhqbeQacmKj6LCSCWwvJnSOafGRmHfpdUOt4SEmE=;
	b=maghZz+qtioGLOzC+2plqKcq+EVyPTKvcxpiZmBpm5wlHst/iH9jC+F/jJWT2w+X
	o9OmnESUV8T11yVI0JDC9kKZPnUUOjD9HfyKkCpqWWAs/3mZUxtoI6npHGeDuZXWn98
	SKto2HGTjYUoqKtcxWzcIF+N+BqJEq9zpfdJCVqw=
Content-Type: multipart/mixed; boundary="===============0571186019414419237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.23 SUCCEEDED
Message-ID: <0101019eb786b58d-7a3d747b-7c83-4881-b769-0b6c8dacff56-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238552

--===============0571186019414419237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.22-21.1.23.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From ed8c16a154c7d34acf7cd45dc6579fb5fb2352a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:22:04 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.22 -> 21.1.23

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
-- 
2.47.1


--===============0571186019414419237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.22.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.23.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18737240 to 18738976 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1155461 to 1155696 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: FILELIST: directory renamed /usr/src/debug/xserver-xorg/21.1.22/randr -> /usr/src/debug/xserver-xorg/21.1.23/randr, directory renamed /usr/src/debug/xserver-xorg/21.1.22/mi -> /usr/src/debug/xserver-xorg/21.1.23/mi, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dixmods -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dixmods, directory renamed /usr/src/debug/xserver-xorg/21.1.22/damageext -> /usr/src/debug/xserver-xorg/21.1.23/damageext, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/bus -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/bus, directory renamed /usr/src/debug/xserver-xorg/21.1.22/xkb -> /usr/src/debug/xserver-xorg/21.1.23/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/shared -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/shared, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/parser -> 
 /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/parser, directory renamed /usr/src/debug/xserver-xorg/21.1.22/os -> /usr/src/debug/xserver-xorg/21.1.23/os, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/exa -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.22/dri3 -> /usr/src/debug/xserver-xorg/21.1.23/dri3, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/glamor_egl -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/glamor_egl, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/common -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/common, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/shadowfb -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/shadowfb, directory renamed /usr/src/debug/xserver-xorg/21.1.22/present -> /usr/src/
 debug/xserver-xorg/21.1.23/present, directory renamed /usr/src/debug/xserver-xorg/21.1.22/dbe -> /usr/src/debug/xserver-xorg/21.1.23/dbe, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/loader -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/loader, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/x86emu -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.22/miext/shadow -> /usr/src/debug/xserver-xorg/21.1.23/miext/shadow, directory renamed /usr/src/debug/xserver-xorg/21.1.22/glx -> /usr/src/debug/xserver-xorg/21.1.23/glx, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/ddc -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/ddc, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/drivers/modesetting -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/drivers/modesetting, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/i2c -> /usr/src/debug/xserver-xo
 rg/21.1.23/hw/xfree86/i2c, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/x86emu/x86emu -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/x86emu/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/drivers/inputtest -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/drivers/inputtest, directory renamed /usr/src/debug/xserver-xorg/21.1.22/miext/sync -> /usr/src/debug/xserver-xorg/21.1.23/miext/sync, directory renamed /usr/src/debug/xserver-xorg/21.1.22/composite -> /usr/src/debug/xserver-xorg/21.1.23/composite, directory renamed /usr/src/debug/xserver-xorg/21.1.22/xfixes -> /usr/src/debug/xserver-xorg/21.1.23/xfixes, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/vgahw -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/vgahw, directory renamed /usr/src/debug/xserver-xorg/21.1.22/render -> /usr/src/debug/xserver-xorg/21.1.23/render, directory renamed /usr/src/debug/xserver-xorg/21.1.22/dix -> /usr/src/debug/xserver-xorg/21.1.23/dix
 , directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dri2/pci_ids -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri2/pci_ids, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/fbdevhw -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/fbdevhw, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/utils/gtf -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/utils/gtf, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/misc -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/misc, directory renamed /usr/src/debug/xserver-xorg/21.1.22/Xi -> /usr/src/debug/xserver-xorg/21.1.23/Xi, directory renamed /usr/src/debug/xserver-xorg/21.1.22/exa -> /usr/src/debug/xserver-xorg/21.1.23/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/int10 -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/int10, directory renamed /usr/src/debug/xserver-xorg/21.1.22/fb -> /usr/src/debug/xserver-xorg/21.1.23/fb, directo
 ry renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/linux -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/os-support/linux, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dri2 -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri2, directory renamed /usr/src/debug/xserver-xorg/21.1.22/record -> /usr/src/debug/xserver-xorg/21.1.23/record, directory renamed /usr/src/debug/xserver-xorg/21.1.22/include -> /usr/src/debug/xserver-xorg/21.1.23/include, directory renamed /usr/src/debug/xserver-xorg/21.1.22/miext/damage -> /usr/src/debug/xserver-xorg/21.1.23/miext/damage, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/ramdac -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/ramdac, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/xkb -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.22/Xext -> /usr/src/debug/xserver-xorg/21.1.23/Xext, directory renamed /usr/src/debug
 /xserver-xorg/21.1.22/hw/xfree86/dri -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/dri, directory renamed /usr/src/debug/xserver-xorg/21.1.22/glamor -> /usr/src/debug/xserver-xorg/21.1.23/glamor, directory renamed /usr/src/debug/xserver-xorg/21.1.22/config -> /usr/src/debug/xserver-xorg/21.1.23/config, directory renamed /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/modes -> /usr/src/debug/xserver-xorg/21.1.23/hw/xfree86/modes
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11881144 to 11885261 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.22" to "21.1.23"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.22 [default] to 21.1.23 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.22" to "21.1.23"

--===============0571186019414419237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-308e54502e16e06893ed39d6eb65e26f022d6dde"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:308e54502e16e06893ed39d6eb65e26f022d6dde"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 630 Local 511 Mirrors 0 Missed 119 Current 393 (81% match, 88% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 456 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_populate_lic_setscene)
NOTE: Running setscene task 512 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 600 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 603 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 604 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 608 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_populate_lic_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 643 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 650 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 655 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 666 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 667 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 679 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_package_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 708 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_setscene)
NOTE: Running setscene task 717 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: Running setscene task 720 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 725 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 737 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 743 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_package_setscene: Started
NOTE: Running setscene task 746 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 765 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 770 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 777 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 784 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 785 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 787 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 788 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_package_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 791 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 792 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 806 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 808 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 817 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 824 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1097 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_recipe_qa)
NOTE: Running task 1098 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1109 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_recipe_qa)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 834 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.6-r0: task do_recipe_qa: Started
NOTE: Running task 1266 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_fetch)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1298 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_fetch)
NOTE: recipe libinput-1.30.2-r0: task do_recipe_qa: Started
NOTE: Running task 1315 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_fetch)
NOTE: Running task 1317 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_fetch)
NOTE: Running task 1319 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1321 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 841 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1333 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Started
NOTE: Running setscene task 842 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Started
NOTE: Running setscene task 843 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libinput-1.30.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 845 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_recipe_qa: Started
NOTE: Running setscene task 847 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.30.2-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 849 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 850 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 853 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libinput-1.30.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 856 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 857 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 862 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 870 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1357 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_fetch)
NOTE: Running task 1358 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 874 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_fetch: Started
NOTE: Running setscene task 876 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 884 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 887 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libdrm/2.4.133/temp/log.do_packagedata_setscene.2205874
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 888 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1369 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1382 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_fetch)
NOTE: Running task 1385 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.133-r0: task do_package_setscene: Started
NOTE: Running task 1396 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_unpack)
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Started
NOTE: Running setscene task 897 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 901 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.30.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 903 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 914 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 921 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 922 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 924 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1408 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1410 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1422 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_unpack)
NOTE: Running task 1423 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_unpack)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1430 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_unpack)
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Started
NOTE: Running setscene task 928 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 932 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 935 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libinput-1.30.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_unpack)
NOTE: Running task 1450 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_package_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1451 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_patch)
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 936 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 938 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1458 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_patch)
NOTE: Running task 1464 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1470 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 944 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_fetch: Succeeded
NOTE: Running setscene task 947 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 950 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 951 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 954 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 957 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 972 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 974 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1492 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 977 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.30.2-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1500 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1505 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_unpack)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1522 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_write_config)
NOTE: Running task 1524 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe mtdev-1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libinput-1.30.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1550 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_recipe_qa)
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1553 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 985 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1556 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_recipe_qa)
NOTE: Running task 1559 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_fetch)
NOTE: Running task 1560 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_fetch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1567 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_write_config)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_deploy_source_date_epoch unihash changed to f3d1e3d981c7f0fb2485fc57a0c9d084abd9357ba2b33d8473c480d27bddc176
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_write_config: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 976 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 980 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1573 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: recipe rgb-1_1.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1590 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_unpack)
NOTE: Running task 1591 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_fetch)
NOTE: Running task 1612 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_recipe_spdx)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1651 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.30.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1653 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1654 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_unpack)
NOTE: Running task 1672 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_recipe_spdx)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 992 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1673 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_fetch)
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1674 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1675 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1676 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1677 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_unpack)
NOTE: Running task 1702 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_create_recipe_spdx)
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 1704 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 995 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libinput-1.30.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 997 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_deploy_source_date_epoch unihash changed to 61c709e59721640e6bc70dac5c954db36d2211b2cd837585484ffc4d5788603c
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.6-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 985 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1705 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_unpack)
NOTE: Running task 1706 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_patch)
NOTE: Running task 1707 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1708 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_patch)
NOTE: Running task 1709 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1710 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_unpack: Started
NOTE: Running task 1714 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_recipe_spdx)
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1715 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_recipe_spdx)
NOTE: recipe libevdev-1.13.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1716 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_create_recipe_spdx)
NOTE: recipe libevdev-1.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 1717 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1003 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1005 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1720 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_recipe_spdx)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1721 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1722 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.6-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1723 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_recipe_spdx)
NOTE: Running task 1724 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch unihash changed to dba4d95a3635e241ddf01349573d5e3f37365454ea38716bc5a0698eae658687
NOTE: recipe mtdev-1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libevdev-1.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch unihash changed to e8db76f24d125526e93c1d1b53646de8a5301a1b825badd2abb1e9444622560b
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch unihash changed to 73ef7617d8e634b19d88bc5cabd2585171c160ce0bfd7b99e35dda346481012c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c7a865d07183a6b64018052809ef7a46457c12e25e2878514e67f2b588e85833
NOTE: Running setscene task 974 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 982 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1739 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_create_recipe_spdx)
NOTE: Running task 1740 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_create_recipe_spdx)
NOTE: recipe libevdev-1.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_deploy_source_date_epoch unihash changed to 1993f478a1a41a7897d46e8862c81ca327af4fd9ded46c766c05f728ca34f056
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.30.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1021 of 1023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libinput-1.30.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2098 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2099 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata)
NOTE: Running task 2136 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2154 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2206 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2207 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2220 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_spdx)
NOTE: Running task 2235 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_create_recipe_spdx)
NOTE: Running task 2237 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_ipk)
NOTE: recipe libevdev-1.13.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2238 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_deb)
NOTE: Running task 2239 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2240 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_ipk: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_deb: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2241 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_configure)
NOTE: Running noexec task 2242 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_compile)
NOTE: Running task 2243 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_install)
NOTE: Running task 2244 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libevdev-1.13.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2245 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_configure)
NOTE: Running task 2246 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_configure)
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2247 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_unpack)
NOTE: recipe rgb-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2248 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2249 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2250 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_configure)
NOTE: recipe libevdev-1.13.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2251 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_spdx)
NOTE: recipe mtdev-1.1.7-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata: Succeeded
NOTE: Running task 2253 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_qa)
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2254 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Started
NOTE: Running task 2263 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2265 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_patch)
NOTE: Running task 2266 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2267 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_configure)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_qa: Started
NOTE: Running task 2268 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure)
NOTE: Running task 2269 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package)
NOTE: recipe rgb-1_1.1.1-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Succeeded
NOTE: Running task 2270 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2272 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2273 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2274 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_populate_sysroot)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2275 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch unihash changed to dcbce7eb9109c264cd1459d3c74a5c07dbddcf4d8881caf9bdaeb92806768510
NOTE: Setscene tasks completed
NOTE: Running task 2276 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Started
NOTE: Running task 2277 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_deploy_source_date_epoch unihash changed to 63a6da1139e68eca4589691c443ea756f665cc08fbec132565fdf8a0446d4695
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2278 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_configure)
NOTE: recipe rgb-1_1.1.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_qa unihash changed to 2a8790e71226a64fac2a8999610df792d98694cf831105a9dd9728863bc2e6d4
NOTE: Running task 2279 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_ipk)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_ipk unihash changed to 47d03163ff3c356251d353c5ffca89c4a1a6a658f3d0c634da96a86efab7948e
NOTE: Running task 2280 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_deb)
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_deb: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2281 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_compile)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2282 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2283 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa)
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package_qa: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_deb: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_deb unihash changed to 1a7dcfa5c71a75d841b40d3708ed297ab8f673498e5b65d412b7c28f615a5dcd
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata unihash changed to 464e0db075e531540bd79cc2f1bc901be7c4563a9636ec731b7883b2b79165b4
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2288 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_spdx)
NOTE: Running task 2289 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package_write_rpm unihash changed to d1a299b8b7c04c40d61ee3dc839626ae792acdf7d522e100752819a2b95b2f0e
NOTE: Setscene tasks completed
NOTE: Running task 2290 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb)
NOTE: Running task 2291 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2292 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata unihash changed to f845b38bd2dcb1146955b08664c0f273e8928fdb2acb0dbd16c57e6204059eb8
NOTE: Setscene tasks completed
NOTE: Running task 2293 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Started
NOTE: Running task 2294 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_package)
NOTE: Running task 2295 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2296 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2297 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_install)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk unihash changed to 6334594f1d853b06ad627c1d9e435d90deb86c2537e866e387300a87982dae32
NOTE: Running task 2298 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb unihash changed to 0b39167839dee693cfcc6f00efc0830858f1b20c45794ee4b1b43f6374766d49
NOTE: Running task 2299 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm unihash changed to 179afad2055a20e4372f6f30e2fefe80efea90374986955262676c1bf19ac7db
NOTE: Running task 2300 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa unihash changed to 9a6eddc6d4937f58df9df61621fce784583c83fe600c0e861b46041aae983446
NOTE: Running task 2301 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa unihash changed to f3245d1ef9b247f3ba27f0f019b851b7216066d735c7f76fc3051f14349d4c58
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk unihash changed to bf34cb1fc2d6b642addabbce6c84569917546ca6b58ec6541454b941333a2b58
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb unihash changed to 7c0dbe5e88d3489fb33ae8a7c0ef782946c2dbdbf3eb79314841cc2aaf090838
NOTE: Running task 2302 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2303 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_package)
NOTE: recipe mesa-2_26.0.6-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa unihash changed to 65db9befacf42233d96f281f48a6d68f164a3707864c9533e19b097d0105406e
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm unihash changed to 9ddfb953180c94c5e6cbff9f803241b01860ea1845916d62e49288f69c9b0500
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2304 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2305 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2306 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2307 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_compile)
NOTE: Running task 2309 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata)
NOTE: recipe mtdev-1.1.7-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_compile)
NOTE: recipe rgb-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2312 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_install)
NOTE: recipe mtdev-1.1.7-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_install)
NOTE: recipe rgb-1_1.1.1-r0: task do_install: Started
NOTE: recipe mtdev-1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_package)
NOTE: recipe rgb-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package)
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2317 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_populate_sysroot)
NOTE: recipe mtdev-1.1.7-r0: task do_package: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.6-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_compile)
NOTE: recipe libevdev-1.13.6-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_install)
NOTE: recipe libevdev-1.13.6-r0: task do_install: Started
NOTE: recipe mtdev-1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_packagedata)
NOTE: recipe libevdev-1.13.6-r0: task do_install: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata: Started
NOTE: Running task 2322 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_package)
NOTE: recipe rgb-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_compile)
NOTE: recipe libevdev-1.13.6-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx)
NOTE: recipe rgb-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_create_spdx)
NOTE: Running task 2327 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_ipk)
NOTE: Running task 2328 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_deb)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx: Started
NOTE: Running task 2329 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2330 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_qa)
NOTE: recipe rgb-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe libevdev-1.13.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_deb: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2331 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.1.1-r0: task do_package_qa: Started
NOTE: recipe libinput-1.30.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb:do_package_qa unihash changed to 6a3ffe7928ea7097e09abb725317cb01ffe088c825a48097de68a0a5c331fc95
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_configure)
NOTE: recipe rgb-1_1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_install)
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_install)
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Started
NOTE: recipe libevdev-1.13.6-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package)
NOTE: Running task 2338 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot)
NOTE: Running task 2340 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_package)
NOTE: recipe libevdev-1.13.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Started
NOTE: recipe libevdev-1.13.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2341 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.6.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.30.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.30.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2343 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_compile)
NOTE: recipe libinput-1.30.2-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_spdx)
NOTE: Running task 2347 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 2348 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_deb)
NOTE: Running task 2349 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 2350 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa)
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2351 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa unihash changed to f0d6e7c4f3f6df5650c9f3446bd797340d99c27280ea86be1f842ebd4082f0f1
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2355 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.30.2-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_compile_ptest_base)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.30.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.30.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2357 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_install)
NOTE: recipe libinput-1.30.2-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_configure: Started
NOTE: recipe libinput-1.30.2-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_install_ptest_base)
NOTE: Running task 2360 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libinput-1.30.2-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.30.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2361 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_package)
NOTE: Running task 2362 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.30.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 0563553393dfe3c6f7be439246624bcd4c92c18147186a3342a876476df4455f
NOTE: Setscene tasks completed
NOTE: Running task 2363 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.30.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.30.2-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_packagedata)
NOTE: recipe libinput-1.30.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.30.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2365 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.30.2.bb:do_create_spdx)
NOTE: recipe libinput-1.30.2-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.30.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2366 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_package)
NOTE: Running task 2369 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2370 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package: Succeeded
NOTE: Running task 2372 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2373 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package)
NOTE: Running task 2377 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_create_spdx)
NOTE: Running task 2380 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 2381 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_deb)
NOTE: Running task 2382 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 2383 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_qa)
NOTE: Running task 2384 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_package_write_ipk)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_ipk: Started
NOTE: Running task 2385 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_package_write_deb)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_deb: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2386 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_package_write_rpm)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_qa: Started
NOTE: Running task 2387 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_deb: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2388 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_create_package_spdx)
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_package_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_qa unihash changed to 41bf33fab32b0f8dbf6100378fe153df00b43a265d1361619265bc59ad75327a
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_create_package_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.23-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2389 of 2389 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2160 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.134-r0 to 0:2.4.133-r0) [version-going-backwards]
ERROR: libdrm-2.4.133-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0571186019414419237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.22-21.1.23.patch"

RnJvbSBlZDhjMTZhMTU0YzdkMzRhY2Y3Y2Q0NWRjNjU3OWZiNWZiMjM1MmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MjI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4yMiAtPiAyMS4xLjIzCgotLS0KIC4uLjEteGY4NnBj
aUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCB8IDIg
Ky0KIC4uLi97eHNlcnZlci14b3JnXzIxLjEuMjIuYmIgPT4geHNlcnZlci14b3JnXzIxLjEuMjMu
YmJ9ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIve3hz
ZXJ2ZXIteG9yZ18yMS4xLjIyLmJiID0+IHhzZXJ2ZXIteG9yZ18yMS4xLjIzLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14
b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFy
ZHdhci5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14
b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFy
ZHdhci5wYXRjaAppbmRleCA3ZDE1MWFhYTYzLi40YTViZjRiYTQzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lC
dXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2
cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA2ZDIzMDM3ZjQ4ZjNkNTM0Mjg2ZmMyYmRhOTI3YzliNmVlNWQx
NDQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZWMyYTNjODkyMmVlNzUyNmQ1OWU5
ZmEyYzZhZDA5NDMwMThiN2IwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2FsaWZv
cm5pYSBTdWxsaXZhbiA8Y2FsaWZvcm5pYS5sLnN1bGxpdmFuQGludGVsLmNvbT4KIERhdGU6IEZy
aSwgMTYgTWFyIDIwMTggMTc6MjM6MTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0geGY4NnBjaUJ1
cy5jOiB1c2UgSW50ZWwgZGR4IG9ubHkgZm9yIHByZS1nZW40IGhhcmR3YXJlCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIy
LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEu
MS4yMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIyLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIzLmJiCmlu
ZGV4IDZhOTgyNmQ5NTkuLmQzYzAwZTA4N2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4yMy5iYgpAQCAtMSw3
ICsxLDcgQEAKIHJlcXVpcmUgeHNlcnZlci14b3JnLmluYwogCiBTUkNfVVJJICs9ICIgZmlsZTov
LzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdh
ci5wYXRjaCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYTI0MmM4OTE3YzQ5YmEyOWNjYzFmNjAy
MTYxM2Q4YTJiOTgwNWRkMGQyNzFhNjZhZTlkMDlmNGIwYmIwNmIzIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImUzOTgzMmU1NjE3ZGFkYWYwNzJmZGY5ZjBlMTllNWQyZTFjMmExMzYwN2FjMjgwYmFj
MWFiYTlmOGZlMTQ2MzQiCiAKICMgVGhlc2UgZXh0ZW5zaW9ucyBhcmUgbm93IGludGVncmF0ZWQg
aW50byB0aGUgc2VydmVyLCBzbyBkZWNsYXJlIHRoZSBtaWdyYXRpb24KICMgcGF0aCBmb3IgaW4t
cGxhY2UgdXBncmFkZXMuCi0tIAoyLjQ3LjEKCg==

--===============0571186019414419237==--

