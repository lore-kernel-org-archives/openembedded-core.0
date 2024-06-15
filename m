Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8747BC3DA44
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18606.1718475798910888158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Lpa1qWmW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NKsCoWS8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23bcf5-6ec0da3d-41b1-4154-9181-7fd3e3296f1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pqsce1M/2/cXVnYpxoM/nODI2ENH9PHnDGuMpV4Yg7A=;
	b=Lpa1qWmWkGntCqjj9f5FgYavL8v/ky88hCBnKjpLGjyldn+0sBCBcjpL5Yd+jC/k
	pGaoq4kb2hAytyeVW624HEiBQP8zZVIdXMfikTRiONR7JX1iDiRTOkxFNbxuaBliKPA
	LUJBYFUPjNKD4bweqbKblr+oP/zaD0L31lR7XlDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pqsce1M/2/cXVnYpxoM/nODI2ENH9PHnDGuMpV4Yg7A=;
	b=NKsCoWS8/+UOHeqioCNLOoAg983mxfS3/W1jwpXLS4pvvSPM6inSLCEYEJ+QsooT
	7WXV8CjJyTVd2Mel5ALz3/O4tdpoVilXTJFW+bMuz/oZ8e69pBt0G9WN1EA+4Utwj1x
	vND9ppbYj2OGTWNPwoukZg1xZjZkfOGm50e7uFjU=
Content-Type: multipart/mixed; boundary="===============0557734091481189074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.26.0 SUCCEEDED
Message-ID: <010101901d23bcf5-6ec0da3d-41b1-4154-9181-7fd3e3296f1a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200722

--===============0557734091481189074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.25.0-1.26.0.patch
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
From 3e8ce7a00db7f22ac6bf78df7b17b83594dcc15b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 14:36:39 +0000
Subject: [PATCH] libinput: upgrade 1.25.0 -> 1.26.0

---
 .../wayland/{libinput_1.25.0.bb => libinput_1.26.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.25.0.bb => libinput_1.26.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.26.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.25.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.26.0.bb
index 894858e361..f6285826ad 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.26.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "3fd38d89276b679ac3565efd7c2150fd047902cb"
+SRCREV = "98ba56fb31104e12a11220958f484158927ca093"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============0557734091481189074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-huion.quirks /usr/share/libinput/30-vendor-uniwill.quirks /usr/share/libinput/30-vendor-ite.quirks"
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-huion.quirks was added
  /usr/share/libinput/30-vendor-ite.quirks was added
  /usr/share/libinput/30-vendor-uniwill.quirks was added

--===============0557734091481189074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6290824 to 6414912 (+2%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 209299 to 219686 (+5%)
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 45504 to 45584 (+0%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1113430 to 1143590 (+3%)
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3516121 to 3581993 (+2%)
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.25.0/tools -> /usr/src/debug/libinput/1.26.0/tools, directory renamed /usr/src/debug/libinput/1.25.0/include/linux/linux -> /usr/src/debug/libinput/1.26.0/include/linux/linux, directory renamed /usr/src/debug/libinput/1.25.0/include/valgrind -> /usr/src/debug/libinput/1.26.0/include/valgrind, directory renamed /usr/src/debug/libinput/1.25.0/udev -> /usr/src/debug/libinput/1.26.0/udev, removed "/usr/src/debug/libinput/1.25.0/src/filter-private.h /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.25.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.25.0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.25.0/src/evdev.c /usr/src/debug/libinput/1.25.0/src/timer.c /usr/src/debug/libinput/1.25.0/src/timer.h /usr/src/debug/libinput/1.25.0/src/evdev.h /usr/src/debug/libinput/1.25.0/src/util-strings.h /usr/src/debug/libinput/1.25
 .0/src/util-strings.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.25.0/test/test-pointer.c /usr/src/debug/libinput/1.25.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.25.0/test/test-trackball.c /usr/src/debug/libinput/1.25.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.25.0/src/util-bits.h /usr/src/debug/libinput/1.25.0/test/litest.c /usr/src/debug/libinput/1.25.0/test/test-udev.c /usr/src/debug/libinput/1.25.0/src/builddir.h /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.25.0/test/litest.h /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.25.0/src/filter-flat.c /usr/src/debug/libinput/1.25.0/test/test-touch.c /usr/src/debug/libinput/1.25.0/test/litest-device-waco
 m-bamboo-2fg-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchpad-palm-threshold-zero.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.25.0/src/util-list.h /usr/src/debug/libinput/1.25.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.25.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.25.0/test/test-switch.c /usr/src/debug/libinput/1.25.0/test/test-quirks.c /usr/src/debug/libinput/1.25.0/src/util-list.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.25.0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libi
 nput/1.25.0/src/evdev-fallback.h /usr/src/debug/libinput/1.25.0/src/util-input-event.h /usr/src/debug/libinput/1.25.0/src/evdev-fallback.c /usr/src/debug/libinput/1.25.0/src/util-time.h /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.25.0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.25.0/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.25.0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.25.0/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.25.0/src/filter.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.25.0/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.25.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.25.0/src/filter.h /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr
 /src/debug/libinput/1.25.0/src/libinput.h /usr/src/debug/libinput/1.25.0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.25.0/src/libinput.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.25.0/test/test-touchpad.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.25.0/src/evdev-debounce.c /usr/src/debug/libinput/1.25.0/src/filter-trackpoint.c /usr/src/debug/
 libinput/1.25.0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.25.0/src/quirks.h /usr/src/debug/libinput/1.25.0/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.25.0/src/quirks.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.25.0/test/test-totem.c /usr/src/debug/libinput/1.25.0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.25.0/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.25.0/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.25.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.25.0/test/test-g
 estures.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.25.0/src/libinput-private.h /usr/src/debug/libinput/1.25.0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.25.0/src/util-prop-parsers.h /usr/src/debug/libinput/1.25.
 0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.25.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.25.0/test/test-misc.c /usr/src/debug/libinput/1.25.0/src/evdev-totem.c /usr/src/debug/libinput/1.25.0/src/util-prop-parsers.c /usr/src/debug/libinput/1.25.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.25.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.25.0/src/udev-seat.h /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.25.0/src/util-matrix.h /usr/src/debug/libinput/1.25.0/src/path-seat.c /usr/src/debug/libinput/1.25.0/src/
 udev-seat.c /usr/src/debug/libinput/1.25.0/test/test-log.c /usr/src/debug/libinput/1.25.0/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.25.0/src/libinput-private-config.c /usr/src/debug/libinput/1.25.0/test/test-path.c /usr/src/debug/libinput/1.25.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.25.0/src/libinput-private-config.h /usr/src/debug/libinput/1.25.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.25.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.25.0/test/test-trackpoint.c /usr/src/debug/libinput/1.25.0/src/evdev-middle-button.c /usr/src/debug/libinput/1.25.0/src/filter-touchpad.c /usr/src/debug/libinput/1.25.0/src/filter-mouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-int.h /usr/src/debug/libinput/1.25.0/test/test-device.c /usr/src/d
 ebug/libinput/1.25.0/test/test-tablet.c /usr/src/debug/libinput/1.25.0/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.25.0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.25.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.25.0/src/evdev-wheel.c /usr/src/debug/libinput/1.25.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.25.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.25.0/test/test-utils.c /usr/src/debug/libinput/1.25.0/src/filter-low-dpi.c /usr/src/debug/libinput/1.25.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.25.0/test/litest-devi
 ce-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.25.0/src/libinput-versionsort.h /usr/src/debug/libinput/1.25.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.25.0/src/filter-custom.c /usr/src/debug/libinput/1.25.0/src/filter-tablet.c /usr/src/debug/libinput/1.25.0/src/evdev-tablet.c /usr/src/debug/libinput/1.25.0/test/test-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.25.0/src/evdev-tablet.h /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.25.0/test/litest-device-format-string.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blade-ste
 alth-videoswitch.c /usr/src/debug/libinput/1.25.0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.25.0/src/util-ratelimit.h /usr/src/debug/libinput/1.25.0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.25.0/test/test-keyboard.c /usr/src/debug/libinput/1.25.0/src/util-ratelimit.c /usr/src/debug/libinput/1.25.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.25.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.25.0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.25.0/test/litest-device-nexus4-touch-screen.c", added "/usr/src/debug/libinput/1.26.0/src/filter-private.h /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.26.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.26.0/test/litest-device-thinkpad-extrabut
 tons.c /usr/src/debug/libinput/1.26.0/src/evdev.c /usr/src/debug/libinput/1.26.0/src/timer.c /usr/src/debug/libinput/1.26.0/src/timer.h /usr/src/debug/libinput/1.26.0/src/evdev.h /usr/src/debug/libinput/1.26.0/src/util-strings.h /usr/src/debug/libinput/1.26.0/src/util-strings.c /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.26.0/test/test-pointer.c /usr/src/debug/libinput/1.26.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.26.0/test/test-trackball.c /usr/src/debug/libinput/1.26.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.26.0/src/util-bits.h /usr/src/debug/libinput/1.26.0/test/litest.c /usr/src/debug/libinput/1.26.0/test/test-udev.c /usr/src/debug/libinput/1.26.0/src/builddir.h /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad-gestures.c /usr/src/debu
 g/libinput/1.26.0/test/litest.h /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.26.0/src/filter-flat.c /usr/src/debug/libinput/1.26.0/test/test-touch.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-touchpad-palm-threshold-zero.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.26.0/src/util-list.h /usr/src/debug/libinput/1.26.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.26.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.26.0/test/test-switch.c /usr/src/debug/libinput/1.26.0/test/test-quirks.c /usr/src/debug/libinput/1.26.0/src/util-list.c /usr/src/debug/lib
 input/1.26.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.26.0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.26.0/test/litest-device-mouse.c /usr/src/debug/libinput/1.26.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.26.0/src/evdev-fallback.h /usr/src/debug/libinput/1.26.0/src/util-input-event.h /usr/src/debug/libinput/1.26.0/src/evdev-fallback.c /usr/src/debug/libinput/1.26.0/src/util-time.h /usr/src/debug/libinput/1.26.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.26.0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.26.0/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.26.0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.26.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.26.0/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.26.0/src/filter.c /usr/src/debug/libinput/1.26.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.26.0/test/litest-device-huion-q62
 0m-dial.c /usr/src/debug/libinput/1.26.0/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.26.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.26.0/src/filter.h /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.26.0/src/libinput.h /usr/src/debug/libinput/1.26.0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.26.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.26.0/src/libinput.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.26.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.2
 6.0/test/test-touchpad.c /usr/src/debug/libinput/1.26.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.26.0/src/evdev-debounce.c /usr/src/debug/libinput/1.26.0/src/filter-trackpoint.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-tablet-doubledial.c /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.26.0/src/quirks.h /usr/src/debug/libinput/1.26.0/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.26.0/src/quirks.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.26.0/test/test-totem.c /usr/src/debug/libinput/1.26.0/test/litest-device-
 magic-trackpad.c /usr/src/debug/libinput/1.26.0/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.26.0/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.26.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.26.0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.26.0/test/test-gestures.c /usr/src/debug/libinput/1.26.0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.26.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/l
 ibinput/1.26.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.26.0/src/libinput-private.h /usr/src/debug/libinput/1.26.0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.26.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.26.0/src/util-prop-parsers.h /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.26.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.26.0/test/test-misc.c /usr/src/debug/libinput/1.26.0/src/evdev-totem.c /usr/src/debug/libinput/1.26.0/src/util-prop-parsers.c /usr/src/debug/libinput/1.26.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.26.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.26.0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.26.0/src/udev-seat.h /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard-all-codes.c /usr/src/deb
 ug/libinput/1.26.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.26.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.26.0/src/util-matrix.h /usr/src/debug/libinput/1.26.0/src/path-seat.c /usr/src/debug/libinput/1.26.0/src/udev-seat.c /usr/src/debug/libinput/1.26.0/test/test-log.c /usr/src/debug/libinput/1.26.0/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.26.0/src/libinput-private-config.c /usr/src/debug/libinput/1.26.0/test/test-path.c /usr/src/debug/libinput/1.26.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.26.0/src/libinput-private-config.h /usr/src/debug/libinput/1.26.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.26.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.26.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.26.0/test/test-trackpoin
 t.c /usr/src/debug/libinput/1.26.0/src/evdev-middle-button.c /usr/src/debug/libinput/1.26.0/src/filter-touchpad.c /usr/src/debug/libinput/1.26.0/src/filter-mouse.c /usr/src/debug/libinput/1.26.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.26.0/test/litest-int.h /usr/src/debug/libinput/1.26.0/test/test-device.c /usr/src/debug/libinput/1.26.0/test/test-tablet.c /usr/src/debug/libinput/1.26.0/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.26.0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.26.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.26.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.26.0/src/evdev-wheel.c /usr/src/debug/libinput/1.26.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.26.0/test/litest-dev
 ice-alps-dualpoint.c /usr/src/debug/libinput/1.26.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.26.0/test/test-utils.c /usr/src/debug/libinput/1.26.0/src/filter-low-dpi.c /usr/src/debug/libinput/1.26.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.26.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.26.0/src/libinput-versionsort.h /usr/src/debug/libinput/1.26.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.26.0/src/filter-custom.c /usr/src/debug/libinput/1.26.0/src/filter-tablet.c /usr/src/debug/libinput/1.26.0/src/evdev-tablet.c /usr/src/debug/libinput/1.26.0/test/test-pad.c /usr/src/debug/libinput/1.26.0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/
 libinput/1.26.0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.26.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.26.0/src/evdev-tablet.h /usr/src/debug/libinput/1.26.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.26.0/test/litest-device-format-string.c /usr/src/debug/libinput/1.26.0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.26.0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.26.0/src/util-ratelimit.h /usr/src/debug/libinput/1.26.0/src/util-files.h /usr/src/debug/libinput/1.26.0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.26.0/test/test-keyboard.c /usr/src/debug/libinput/1.26.0/src/util-ratelimit.c /usr/src/debug/libinput/1.26.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.26.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.26.0/test/litest-device-qemu-usb-tablet.c /usr/src/deb
 ug/libinput/1.26.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.26.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.26.0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.26.0/test/litest-device-tablet-rel-dial.c"
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.25.0" to "1.26.0"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1201985 to 1212862 (+1%)
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-huion.quirks /usr/share/libinput/30-vendor-ite.quirks /usr/share/libinput/30-vendor-uniwill.quirks"
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.25.0" to "1.26.0"
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-huion.quirks was added
  /usr/share/libinput/30-vendor-ite.quirks was added
  /usr/share/libinput/30-vendor-uniwill.quirks was added

--===============0557734091481189074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.25.0-1.26.0.patch"

RnJvbSAzZThjZTdhMDBkYjdmMjJhYzZiZjc4ZGY3YjE3YjgzNTk0ZGNjMTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTQ6MzY6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI1LjAgLT4gMS4yNi4wCgotLS0KIC4uLi93YXlsYW5kL3tsaWJp
bnB1dF8xLjI1LjAuYmIgPT4gbGliaW5wdXRfMS4yNi4wLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3tsaWJpbnB1dF8xLjI1LjAuYmIgPT4gbGliaW5wdXRf
MS4yNi4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL2xpYmlucHV0XzEuMjUuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xp
YmlucHV0XzEuMjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI1LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjYuMC5iYgppbmRleCA4OTQ4NThl
MzYxLi5mNjI4NTgyNmFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQv
bGliaW5wdXRfMS4yNi4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGliZXZkZXYg
dWRldiBtdGRldiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJp
bnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjNmZDM4ZDg5Mjc2
YjY3OWFjMzU2NWVmZDdjMjE1MGZkMDQ3OTAyY2IiCitTUkNSRVYgPSAiOThiYTU2ZmIzMTEwNGUx
MmExMTIyMDk1OGY0ODQxNTg5MjdjYTA5MyIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gImxpYmlucHV0LSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxk
KykiCi0tIAoyLjQ0LjAKCg==

--===============0557734091481189074==--

