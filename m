Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4616.1794032732794100288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dxhARms3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dz9awKXF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1b4af0664-dc11e968-5f26-42ca-a779-ac7e8e91923f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032731;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Bx2mQxm7khPpJMEW7htJ1ZteAbWgtTxdaBVXOsumOFU=;
	b=dxhARms3WFFedewCcLzxap8k7B9zxrPmRByxK+258yxFXzjQeaJdoHJXQ0GHO4oX
	Y2EBB9/4Bkg9haLQDHTWZd4psd0mv9Y+ak8scYWbikI1HzIOaKph/ghruXDnk6EG/dO
	BVeLZSyNQUB9VdMxfK3BEoTozi0q2Ts0ZRP5/ROQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032731;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Bx2mQxm7khPpJMEW7htJ1ZteAbWgtTxdaBVXOsumOFU=;
	b=dz9awKXFByLBIcaRZvxpdpPjyVQ3WmJfXQgx0XWO+5MszguhCoGMfUMF60efBz8Z
	/oUOiaqT14w77Dzu0ap5EUeyxULS28Zz6XxhlYZzNSJbIkfGS08ihGz/dOeR6Rw10tP
	5OsMaqOihUAhgS+rmwULPQd4Ermzr5QtbRRf/myM=
Content-Type: multipart/mixed; boundary="===============1066029595607471459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.25 SUCCEEDED
Message-ID: <010101a1b4af0664-dc11e968-5f26-42ca-a779-ac7e8e91923f-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249729

--===============1066029595607471459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.24-21.1.25.patch
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
From 6fde9dc3fb5bd5ecc7f75fe2f86fb9dd292b0c8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:53:29 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.24 -> 21.1.25

xserver 21.1.25
Xi: clean up gesture sprite traces in WindowGone
Xi: add bounds check for barrier events in input_constrain_cursor
dix: remove passive grabs referencing a device on removal
present: unlink notifies from window list in present_clear_window_notifies
glx: validate dataBytes against cmdlen in RenderLarge first request
Xi: validate modifier values in ProcXIPassiveUngrabDevice
randr: fix size and offset in RRChangeProviderProperty PrependMode
xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
xkb: NULL text pointer after free in _CheckSetDoodad error path
glamor: Set `need_free_region` immediately after pixman region allocation
xf86: mark wasset unused in xf86UnblockSIGIO() compatibility wrapper
xkb: Keep the group counts of a loaded keymap in range
xkb: Never recompute a keymap's group count down to zero
xkb: Default to one group whenever a keymap reports none
xkb: Guard XkbAdjustGroup() against a keymap with no groups
damage: Unlink a damage from the list it was actually inserted on
meson: check cpu_family() instead of cpu()
meson: Fix build on FreeBSD/powerpc*
RegionValidate: Fix double free of badreg->data on the error path
Xi: byte-swap XIQueryDevice ScrollClass flags
Xi: byte-swap DeviceChanged valuator and scroll data
meson: only install dri3.h if building dri3 support
Handle -Wimplicit-fallthrough warnings from gcc 16.1
xf86: handle malloc failure in DoSubstitution()
exa: silence -Wold-style-declaration warning from gcc 16
test: silence -Wanalyzer-null-argument warnings in strndup tests
xf86: silence -Wanalyzer-possible-null-dereference warning in parser
xf86: prevent passing NULL pointer as strcat() destination
xf86: prevent passing NULL pointer as strcpy destination
xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
enhance: popen-fdopen-error-handling
xorg.conf.man: Fix escape sequence typo
config/udev: guard against NULL subsystem in fallback bus id
xfree86: set GPU screen FB/DGA defaults on runtime hotplug
Fix use-after-free caused by duplicate glyphs in one glyphset
fb: Don't widen the planemask over padding bits when ROOTLESS_SAFEALPHA is set
xquartz/GL: Log failures on the indirect GLX make-current path
modesetting: Check for NULL mode_output before printing warning message
ci: Prevent duplicate pipelines for MRs
gitlab CI: add workflow rules
xquartz: Activate the app via xp_window_activate() in -set_front_process:
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.25.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.25.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 14831b1a9b..a8f02d85f6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
+From 2822e2e7a32ea1c42db5877cab23d2a33ac9c290 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
index 8d7f9ae14d..b875efdebe 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.25.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
+SRC_URI[sha256sum] = "6ad4e3c7b59a309b32c92e5c15ce1267110f9e13f1ac78da62361a628da1a0eb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.1


--===============1066029595607471459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.24.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.25.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18735664 to 18740280 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1155696 to 1156011 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132739 to 132740 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: FILELIST: directory renamed /usr/src/debug/xserver-xorg/21.1.24/dri3 -> /usr/src/debug/xserver-xorg/21.1.25/dri3, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/i2c -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/i2c, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/utils/gtf -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/utils/gtf, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/inputtest -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/drivers/inputtest, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/ddc -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/ddc, directory renamed /usr/src/debug/xserver-xorg/21.1.24/exa -> /usr/src/debug/xserver-xorg/21.1.25/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/misc -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/os-support/misc, directory renamed /usr/src/debug/xser
 ver-xorg/21.1.24/render -> /usr/src/debug/xserver-xorg/21.1.25/render, directory renamed /usr/src/debug/xserver-xorg/21.1.24/xfixes -> /usr/src/debug/xserver-xorg/21.1.25/xfixes, directory renamed /usr/src/debug/xserver-xorg/21.1.24/xkb -> /usr/src/debug/xserver-xorg/21.1.25/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/present -> /usr/src/debug/xserver-xorg/21.1.25/present, directory renamed /usr/src/debug/xserver-xorg/21.1.24/randr -> /usr/src/debug/xserver-xorg/21.1.25/randr, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/vgahw -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/vgahw, directory renamed /usr/src/debug/xserver-xorg/21.1.24/dix -> /usr/src/debug/xserver-xorg/21.1.25/dix, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/glamor_egl -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/glamor_egl, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86emu -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/x86emu, di
 rectory renamed /usr/src/debug/xserver-xorg/21.1.24/mi -> /usr/src/debug/xserver-xorg/21.1.25/mi, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86emu/x86emu -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/x86emu/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.24/miext/damage -> /usr/src/debug/xserver-xorg/21.1.25/miext/damage, directory renamed /usr/src/debug/xserver-xorg/21.1.24/config -> /usr/src/debug/xserver-xorg/21.1.25/config, directory renamed /usr/src/debug/xserver-xorg/21.1.24/glamor -> /usr/src/debug/xserver-xorg/21.1.25/glamor, directory renamed /usr/src/debug/xserver-xorg/21.1.24/record -> /usr/src/debug/xserver-xorg/21.1.25/record, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/int10 -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/int10, directory renamed /usr/src/debug/xserver-xorg/21.1.24/Xext -> /usr/src/debug/xserver-xorg/21.1.25/Xext, directory renamed /usr/src/debug/xserver-xorg/21.1.24/miext/shadow -> /usr/src/
 debug/xserver-xorg/21.1.25/miext/shadow, directory renamed /usr/src/debug/xserver-xorg/21.1.24/os -> /usr/src/debug/xserver-xorg/21.1.25/os, directory renamed /usr/src/debug/xserver-xorg/21.1.24/composite -> /usr/src/debug/xserver-xorg/21.1.25/composite, directory renamed /usr/src/debug/xserver-xorg/21.1.24/dbe -> /usr/src/debug/xserver-xorg/21.1.25/dbe, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri2/pci_ids -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/dri2/pci_ids, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dixmods -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/dixmods, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/shared -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/os-support/shared, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/parser -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/parser, directory renamed /usr/src/debug/xserver-xorg/21.1.24/fb -> /usr/src/debug/xserver-x
 org/21.1.25/fb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/dri, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/bus -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/os-support/bus, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/exa -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/modesetting -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/drivers/modesetting, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/modes -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/modes, directory renamed /usr/src/debug/xserver-xorg/21.1.24/damageext -> /usr/src/debug/xserver-xorg/21.1.25/damageext, directory renamed /usr/src/debug/xserver-xorg/21.1.24/glx -> /usr/src/debug/xserver-xorg/21.1.25/glx, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/fbdevhw -> /usr/src/de
 bug/xserver-xorg/21.1.25/hw/xfree86/fbdevhw, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/common -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/common, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/xkb -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/Xi -> /usr/src/debug/xserver-xorg/21.1.25/Xi, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/os-support, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/shadowfb -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/shadowfb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri2 -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/dri2, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/linux -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/os-support/linux, directory renamed /usr/src/debug/xserver-xorg/21.1
 .24/hw/xfree86/ramdac -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/ramdac, directory renamed /usr/src/debug/xserver-xorg/21.1.24/include -> /usr/src/debug/xserver-xorg/21.1.25/include, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/loader -> /usr/src/debug/xserver-xorg/21.1.25/hw/xfree86/loader, directory renamed /usr/src/debug/xserver-xorg/21.1.24/miext/sync -> /usr/src/debug/xserver-xorg/21.1.25/miext/sync
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11908448 to 11916983 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.24" to "21.1.25"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.24 [default] to 21.1.25 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.24" to "21.1.25"

--===============1066029595607471459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xserver-xorg-changelog.txt"

xserver 21.1.25
Xi: clean up gesture sprite traces in WindowGone
Xi: add bounds check for barrier events in input_constrain_cursor
dix: remove passive grabs referencing a device on removal
present: unlink notifies from window list in present_clear_window_notifies
glx: validate dataBytes against cmdlen in RenderLarge first request
Xi: validate modifier values in ProcXIPassiveUngrabDevice
randr: fix size and offset in RRChangeProviderProperty PrependMode
xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
xkb: NULL text pointer after free in _CheckSetDoodad error path
glamor: Set `need_free_region` immediately after pixman region allocation
xf86: mark wasset unused in xf86UnblockSIGIO() compatibility wrapper
xkb: Keep the group counts of a loaded keymap in range
xkb: Never recompute a keymap's group count down to zero
xkb: Default to one group whenever a keymap reports none
xkb: Guard XkbAdjustGroup() against a keymap with no groups
damage: Unlink a damage from the list it was actually inserted on
meson: check cpu_family() instead of cpu()
meson: Fix build on FreeBSD/powerpc*
RegionValidate: Fix double free of badreg->data on the error path
Xi: byte-swap XIQueryDevice ScrollClass flags
Xi: byte-swap DeviceChanged valuator and scroll data
meson: only install dri3.h if building dri3 support
Handle -Wimplicit-fallthrough warnings from gcc 16.1
xf86: handle malloc failure in DoSubstitution()
exa: silence -Wold-style-declaration warning from gcc 16
test: silence -Wanalyzer-null-argument warnings in strndup tests
xf86: silence -Wanalyzer-possible-null-dereference warning in parser
xf86: prevent passing NULL pointer as strcat() destination
xf86: prevent passing NULL pointer as strcpy destination
xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
enhance: popen-fdopen-error-handling
xorg.conf.man: Fix escape sequence typo
config/udev: guard against NULL subsystem in fallback bus id
xfree86: set GPU screen FB/DGA defaults on runtime hotplug
Fix use-after-free caused by duplicate glyphs in one glyphset
fb: Don't widen the planemask over padding bits when ROOTLESS_SAFEALPHA is set
xquartz/GL: Log failures on the indirect GLX make-current path
modesetting: Check for NULL mode_output before printing warning message
ci: Prevent duplicate pipelines for MRs
gitlab CI: add workflow rules
xquartz: Activate the app via xp_window_activate() in -set_front_process:

--===============1066029595607471459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.24-21.1.25.patch"

RnJvbSA2ZmRlOWRjM2ZiNWJkNWVjYzdmNzVmZTJmODZmYjlkZDI5MmIwYzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNTo1MzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjI0IC0+IDIxLjEuMjUKCnhzZXJ2ZXIgMjEuMS4yNQpY
aTogY2xlYW4gdXAgZ2VzdHVyZSBzcHJpdGUgdHJhY2VzIGluIFdpbmRvd0dvbmUKWGk6IGFkZCBi
b3VuZHMgY2hlY2sgZm9yIGJhcnJpZXIgZXZlbnRzIGluIGlucHV0X2NvbnN0cmFpbl9jdXJzb3IK
ZGl4OiByZW1vdmUgcGFzc2l2ZSBncmFicyByZWZlcmVuY2luZyBhIGRldmljZSBvbiByZW1vdmFs
CnByZXNlbnQ6IHVubGluayBub3RpZmllcyBmcm9tIHdpbmRvdyBsaXN0IGluIHByZXNlbnRfY2xl
YXJfd2luZG93X25vdGlmaWVzCmdseDogdmFsaWRhdGUgZGF0YUJ5dGVzIGFnYWluc3QgY21kbGVu
IGluIFJlbmRlckxhcmdlIGZpcnN0IHJlcXVlc3QKWGk6IHZhbGlkYXRlIG1vZGlmaWVyIHZhbHVl
cyBpbiBQcm9jWElQYXNzaXZlVW5ncmFiRGV2aWNlCnJhbmRyOiBmaXggc2l6ZSBhbmQgb2Zmc2V0
IGluIFJSQ2hhbmdlUHJvdmlkZXJQcm9wZXJ0eSBQcmVwZW5kTW9kZQp4a2I6IGZpeCBDaGVja0tl
eVN5bXMgb3ZlcndyaXRpbmcgcmVxdWVzdC1yYW5nZSBzeW1zUGVyS2V5IGVudHJpZXMKeGtiOiB3
aWRlbiBzaXplX3N5bXMsIG51bV9zeW1zLCBzaXplX2FjdHMsIG51bV9hY3RzIHRvIHVuc2lnbmVk
IGludAp4a2I6IGFsbG9jYXRlIG5hbWVzLT5rZXlzIHRvIE1BUF9MRU5HVEggaW4gWGtiQWxsb2NO
YW1lcwp4a2I6IE5VTEwgdGV4dCBwb2ludGVyIGFmdGVyIGZyZWUgaW4gX0NoZWNrU2V0RG9vZGFk
IGVycm9yIHBhdGgKZ2xhbW9yOiBTZXQgYG5lZWRfZnJlZV9yZWdpb25gIGltbWVkaWF0ZWx5IGFm
dGVyIHBpeG1hbiByZWdpb24gYWxsb2NhdGlvbgp4Zjg2OiBtYXJrIHdhc3NldCB1bnVzZWQgaW4g
eGY4NlVuYmxvY2tTSUdJTygpIGNvbXBhdGliaWxpdHkgd3JhcHBlcgp4a2I6IEtlZXAgdGhlIGdy
b3VwIGNvdW50cyBvZiBhIGxvYWRlZCBrZXltYXAgaW4gcmFuZ2UKeGtiOiBOZXZlciByZWNvbXB1
dGUgYSBrZXltYXAncyBncm91cCBjb3VudCBkb3duIHRvIHplcm8KeGtiOiBEZWZhdWx0IHRvIG9u
ZSBncm91cCB3aGVuZXZlciBhIGtleW1hcCByZXBvcnRzIG5vbmUKeGtiOiBHdWFyZCBYa2JBZGp1
c3RHcm91cCgpIGFnYWluc3QgYSBrZXltYXAgd2l0aCBubyBncm91cHMKZGFtYWdlOiBVbmxpbmsg
YSBkYW1hZ2UgZnJvbSB0aGUgbGlzdCBpdCB3YXMgYWN0dWFsbHkgaW5zZXJ0ZWQgb24KbWVzb246
IGNoZWNrIGNwdV9mYW1pbHkoKSBpbnN0ZWFkIG9mIGNwdSgpCm1lc29uOiBGaXggYnVpbGQgb24g
RnJlZUJTRC9wb3dlcnBjKgpSZWdpb25WYWxpZGF0ZTogRml4IGRvdWJsZSBmcmVlIG9mIGJhZHJl
Zy0+ZGF0YSBvbiB0aGUgZXJyb3IgcGF0aApYaTogYnl0ZS1zd2FwIFhJUXVlcnlEZXZpY2UgU2Ny
b2xsQ2xhc3MgZmxhZ3MKWGk6IGJ5dGUtc3dhcCBEZXZpY2VDaGFuZ2VkIHZhbHVhdG9yIGFuZCBz
Y3JvbGwgZGF0YQptZXNvbjogb25seSBpbnN0YWxsIGRyaTMuaCBpZiBidWlsZGluZyBkcmkzIHN1
cHBvcnQKSGFuZGxlIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggd2FybmluZ3MgZnJvbSBnY2MgMTYu
MQp4Zjg2OiBoYW5kbGUgbWFsbG9jIGZhaWx1cmUgaW4gRG9TdWJzdGl0dXRpb24oKQpleGE6IHNp
bGVuY2UgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gd2FybmluZyBmcm9tIGdjYyAxNgp0ZXN0OiBz
aWxlbmNlIC1XYW5hbHl6ZXItbnVsbC1hcmd1bWVudCB3YXJuaW5ncyBpbiBzdHJuZHVwIHRlc3Rz
CnhmODY6IHNpbGVuY2UgLVdhbmFseXplci1wb3NzaWJsZS1udWxsLWRlcmVmZXJlbmNlIHdhcm5p
bmcgaW4gcGFyc2VyCnhmODY6IHByZXZlbnQgcGFzc2luZyBOVUxMIHBvaW50ZXIgYXMgc3RyY2F0
KCkgZGVzdGluYXRpb24KeGY4NjogcHJldmVudCBwYXNzaW5nIE5VTEwgcG9pbnRlciBhcyBzdHJj
cHkgZGVzdGluYXRpb24KeGtiOiBGaXggLVdjYWxsb2MtdHJhbnNwb3NlZC1hcmdzIHdhcm5pbmcg
aW4gX1hrYkNvcHlHZW9tKCkKZW5oYW5jZTogcG9wZW4tZmRvcGVuLWVycm9yLWhhbmRsaW5nCnhv
cmcuY29uZi5tYW46IEZpeCBlc2NhcGUgc2VxdWVuY2UgdHlwbwpjb25maWcvdWRldjogZ3VhcmQg
YWdhaW5zdCBOVUxMIHN1YnN5c3RlbSBpbiBmYWxsYmFjayBidXMgaWQKeGZyZWU4Njogc2V0IEdQ
VSBzY3JlZW4gRkIvREdBIGRlZmF1bHRzIG9uIHJ1bnRpbWUgaG90cGx1ZwpGaXggdXNlLWFmdGVy
LWZyZWUgY2F1c2VkIGJ5IGR1cGxpY2F0ZSBnbHlwaHMgaW4gb25lIGdseXBoc2V0CmZiOiBEb24n
dCB3aWRlbiB0aGUgcGxhbmVtYXNrIG92ZXIgcGFkZGluZyBiaXRzIHdoZW4gUk9PVExFU1NfU0FG
RUFMUEhBIGlzIHNldAp4cXVhcnR6L0dMOiBMb2cgZmFpbHVyZXMgb24gdGhlIGluZGlyZWN0IEdM
WCBtYWtlLWN1cnJlbnQgcGF0aAptb2Rlc2V0dGluZzogQ2hlY2sgZm9yIE5VTEwgbW9kZV9vdXRw
dXQgYmVmb3JlIHByaW50aW5nIHdhcm5pbmcgbWVzc2FnZQpjaTogUHJldmVudCBkdXBsaWNhdGUg
cGlwZWxpbmVzIGZvciBNUnMKZ2l0bGFiIENJOiBhZGQgd29ya2Zsb3cgcnVsZXMKeHF1YXJ0ejog
QWN0aXZhdGUgdGhlIGFwcCB2aWEgeHBfd2luZG93X2FjdGl2YXRlKCkgaW4gLXNldF9mcm9udF9w
cm9jZXNzOgotLS0KIC4uLjEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJl
LWdlbjQtaGFyZHdhci5wYXRjaCB8IDIgKy0KIC4uLi97eHNlcnZlci14b3JnXzIxLjEuMjQuYmIg
PT4geHNlcnZlci14b3JnXzIxLjEuMjUuYmJ9ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjI0LmJiID0+IHhzZXJ2ZXIt
eG9yZ18yMS4xLjI1LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1k
ZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1k
ZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaAppbmRleCAxNDgzMWIxYTliLi5hOGYw
MmQ4NWY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1n
ZW40LWhhcmR3YXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1w
cmUtZ2VuNC1oYXJkd2FyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMzg3NTgwMTk0ZTkx
YWQ3M2Y4OTZhOTY2OTc1NzYxMmM4NjAxYzkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyODIyZTJlN2EzMmVhMWM0MmRiNTg3N2NhYjIzZDJhMzNhYzljMjkwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2FsaWZvcm5pYSBTdWxsaXZhbiA8Y2FsaWZvcm5pYS5sLnN1bGxp
dmFuQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTYgTWFyIDIwMTggMTc6MjM6MTEgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0geGY4NnBjaUJ1cy5jOiB1c2UgSW50ZWwgZGR4IG9ubHkgZm9yIHByZS1n
ZW40IGhhcmR3YXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2Vy
dmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjI0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4yNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18y
MS4xLjI0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjI1LmJiCmluZGV4IDhkN2Y5YWUxNGQuLmI4NzVlZmRlYmUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIx
LjEuMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVy
LXhvcmdfMjEuMS4yNS5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVpcmUgeHNlcnZlci14b3JnLmlu
YwogCiBTUkNfVVJJICs9ICIgZmlsZTovLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgt
b25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIx
YTRlYjM2Y2E2NWNjM2IxYjkzNjU2NmQ2NzdhOTc4NmUxM2MxMWNkNTgwNmU5NTFhYzU1ZjNmNWNl
Mzk4NGFmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZhZDRlM2M3YjU5YTMwOWIzMmM5MmU1YzE1
Y2UxMjY3MTEwZjllMTNmMWFjNzhkYTYyMzYxYTYyOGRhMWEwZWIiCiAKICMgVGhlc2UgZXh0ZW5z
aW9ucyBhcmUgbm93IGludGVncmF0ZWQgaW50byB0aGUgc2VydmVyLCBzbyBkZWNsYXJlIHRoZSBt
aWdyYXRpb24KICMgcGF0aCBmb3IgaW4tcGxhY2UgdXBncmFkZXMuCi0tIAoyLjQ3LjEKCg==

--===============1066029595607471459==--
