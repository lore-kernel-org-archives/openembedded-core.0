Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0EECCF994
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.5736.1693650554391069667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WnN7izB0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XJSFPGfZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a557091cd-b3d87640-45e6-4ae6-854e-515ff61cc7fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+d20Ap9+q5oh9PcsCUYiepLqw+7Cf4/0KNEVb9PdhYE=;
	b=WnN7izB0UGPXIIfsHUzixN6G+a86HN7uq2UYJm4b2fU4AT3KWnPdYBDCNXm3qw3R
	aFCIye1C0NvI4Lhd2Y7GxiOiI8eBdIpAZzmuGqb1PjDkM0qfANrpjf313ovd39I0dOx
	DyvP9tzJJFSyjRE3lKk7VElciXFDqHLCh04XTkWc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+d20Ap9+q5oh9PcsCUYiepLqw+7Cf4/0KNEVb9PdhYE=;
	b=XJSFPGfZwyHdJg8yUgq5uSlGVwoO9LoCSrJJhEuPH3FZ0b/j+Hhz5UXNiDQngePx
	q8K65u/Sjxi+jDz6d1sbLNXFO5080s37N1ggU8GaeoHbEKNjcqkzXsDcQZ3heoXVQBd
	BrgIWWUTVtWy88tV2iUXzgFnbcDGH6TfxWLoYxCw=
Content-Type: multipart/mixed; boundary="===============3529139012436787973=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.24.0 SUCCEEDED
Message-ID: <0101018a557091cd-b3d87640-45e6-4ae6-854e-515ff61cc7fe-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187118

--===============3529139012436787973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.23.0-1.24.0.patch
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
From 1b9548c2c9fc6d66dcdc243e5362347e8f537d5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 02:18:59 +0000
Subject: [PATCH] libinput: upgrade 1.23.0 -> 1.24.0

---
 .../wayland/{libinput_1.23.0.bb => libinput_1.24.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.23.0.bb => libinput_1.24.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.23.0.bb b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.23.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.24.0.bb
index b83d5fdb43..49a1da2b22 100644
--- a/meta/recipes-graphics/wayland/libinput_1.23.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev libcheck"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "0b005eb64b12603e65a620a77c67ec62fd03f413"
+SRCREV = "1680f2fbaa63a91739012c6b57988ab1918ea0b7"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.39.2


--===============3529139012436787973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4967856 to 5011180 (+1%)
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGSIZE changed from 209267 to 209299 (+0%)
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGSIZE changed from 45405 to 45504 (+0%)
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1265094 to 1279302 (+1%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3489093 to 3510026 (+1%)
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.23.0-r0/include/linux/linux -> /usr/src/debug/libinput/1.24.0-r0/include/linux/linux, directory renamed /usr/src/debug/libinput/1.23.0-r0/udev -> /usr/src/debug/libinput/1.24.0-r0/udev, directory renamed /usr/src/debug/libinput/1.23.0-r0/include/valgrind -> /usr/src/debug/libinput/1.24.0-r0/include/valgrind, directory renamed /usr/src/debug/libinput/1.23.0-r0/tools -> /usr/src/debug/libinput/1.24.0-r0/tools, directory renamed /usr/src/debug/libinput/1.23.0-r0/src -> /usr/src/debug/libinput/1.24.0-r0/src, removed "/usr/src/debug/libinput/1.23.0-r0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.23.0-r0/test/test-touch.c /usr/src/debug/libinput/1.23.0-r0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-
 device-mouse-low-dpi.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-st.c /usr/src/debug/li
 binput/1.23.0-r0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.23.0-r0/test/test-pointer.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.23.0-r0/test/test-tablet.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-p
 ro-16-finger.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.23.0-r0/test/test-trackpoint.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-int
 uos3-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest.h /usr/src/debug/libinput/1.23.0-r0/test/litest.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.23.0-r0/test/test-totem.c /usr/src/debug/libinput/1.23.0-r0/test/test-quirks.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.23.0-r0/test/test-trackball.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-an
 ker-mouse-kbd.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.23.0-r0/test/test-switch.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.23.0-r0/test/test-keyboard.c /usr/src/debug/libinput/1.23.0-r0/test/test-gestures.c /usr/src/
 debug/libinput/1.23.0-r0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-mouse.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.23.0-r0/test/test-log.c /usr/src/debug/libinput/1.23.0-r0/test/test-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.23.0-r0/test/litest-int.h /usr/src/debug/libinput/1.23.0-r0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.23.0-r0/test/test-touchpad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.23.0-r0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-13hdt-pa
 d.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.23.0-r0/te
 st/test-device.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.23.0-r0/test/test-utils.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-format-string.c /usr/src/debug/libinput/1.23.0-r0/test/test-misc.c /usr/src/debug/libinput/1.23.0-r0/test/test-path.c /usr/src/debug/libinput/1.23.0-r0/test/test-udev.c /usr/src/debug/libinput/1.23.0-r0/test/litest-device-wacom-isdv4-4200-pen.c", added "/usr/src/debug/libinput/1.24.0-r0/test/litest-device-ignor
 ed-mouse.c /usr/src/debug/libinput/1.24.0-r0/test/test-touch.c /usr/src/debug/libinput/1.24.0-r0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-at
 mel-hover.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.24.0-r0/test/test-pointer.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.24.0-r0/test/test-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse-whee
 l-click-count.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinp
 ut/1.24.0-r0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.24.0-r0/test/test-trackpoint.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest.h /usr/src/debug/libinput/1.24.0-r0/test/litest.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.24.0-r0/test/test-totem.c /usr/src/debug/libinput/1.24.0-r0/test/test-quirks.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libi
 nput/1.24.0-r0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.24.0-r0/test/test-trackball.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/test-switch.c /usr/src/debug/libinput/1
 .24.0-r0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.24.0-r0/test/test-keyboard.c /usr/src/debug/libinput/1.24.0-r0/test/test-gestures.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-mouse.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.24.0-r0/test/test-log.c /usr/src/debug/libinput/1.24.0-r0/test/test-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.24.0-r0/test/litest-int.h /usr/src/debug/libinput/1.24.0-
 r0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.24.0-r0/test/test-touchpad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.24.0-r0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-keyboard-quirked.c /usr
 /src/debug/libinput/1.24.0-r0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/test-device.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-synaptics-hover.c /usr/src/debug/li
 binput/1.24.0-r0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.24.0-r0/test/test-utils.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-format-string.c /usr/src/debug/libinput/1.24.0-r0/test/test-misc.c /usr/src/debug/libinput/1.24.0-r0/test/test-path.c /usr/src/debug/libinput/1.24.0-r0/test/test-udev.c /usr/src/debug/libinput/1.24.0-r0/test/litest-device-wacom-isdv4-4200-pen.c"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.23.0 [default] to 1.24.0 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.23.0" to "1.24.0"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1255816 to 1260975 (+0%)

--===============3529139012436787973==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.23.0-1.24.0.patch"

RnJvbSAxYjk1NDhjMmM5ZmM2ZDY2ZGNkYzI0M2U1MzYyMzQ3ZThmNTM3ZDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMjoxODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjMuMCAtPiAxLjI0LjAKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjMuMC5iYiA9PiBsaWJpbnB1dF8xLjI0LjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjMuMC5iYiA9PiBsaWJpbnB1dF8x
LjI0LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yNC4wLmJiCmluZGV4IGI4M2Q1ZmRi
NDMuLjQ5YTFkYTJiMjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI0LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IGxpYmNoZWNrIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2xpYmlucHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAg
ICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMGIw
MDVlYjY0YjEyNjAzZTY1YTYyMGE3N2M2N2VjNjJmZDAzZjQxMyIKK1NSQ1JFViA9ICIxNjgwZjJm
YmFhNjNhOTE3MzkwMTJjNmI1Nzk4OGFiMTkxOGVhMGI3IgogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/
ITlcZCspXGQrKSIKLS0gCjIuMzkuMgoK

--===============3529139012436787973==--

