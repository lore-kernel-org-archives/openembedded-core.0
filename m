Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC13C3A59F
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.2323.1651434542967956137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A9i2bTL3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180812b5b18-25772cd9-e37e-4112-b18f-a5de5eba5409-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3t0z15P6UJKt/YCoK5OtFh1WsG3AYBN8WYYh1KEY9dI=;
	b=A9i2bTL3PKyVf2ao2luiL4q9oHhQkG8xIoe6g7iNCq4J5yUIDH/b+omy17Vyatce
	3DwsG9/f616PhI7ngDkgLpwLPzdit+zZRuzfaXm3B77UefTlPC6HmVZuKoT94N49Ujk
	r4mzLnmrfMvPwT54DthYOHZH3O/Ho2Uf6L7BJHD4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3t0z15P6UJKt/YCoK5OtFh1WsG3AYBN8WYYh1KEY9dI=;
	b=MqglHvl+aRsswEu50NxoSOFY+BEcMzwOnPsCCGoCwHZM6P0rypB6hLgOkvChoo4k
	+BmpPd1gkqrTmWPUPP7W8hS4k/GZNYWR/7ZHJA43wI33BeVRpdxkxVMH1iizhZHaiVu
	r+NqmrLCLetPeAxdPHSTQ/nPDqFzZGisD/syECEo=
Content-Type: multipart/mixed; boundary="===============7585711038259942298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.19.4 SUCCEEDED
Message-ID: 
 <01010180812b5b18-25772cd9-e37e-4112-b18f-a5de5eba5409-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165142

--===============7585711038259942298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.19.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.19.3-1.19.4.patch
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
--===============7585711038259942298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.19.3-1.19.4.patch"

From 896271161b429bf24c66de2de8b4b3ab70f6cc7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:25:31 +0000
Subject: [PATCH] libinput: upgrade 1.19.3 -> 1.19.4

---
 .../wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.3.bb b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.4.bb
index a7f13240d5..a7d0c4be69 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068"
+SRC_URI[sha256sum] = "ff33a570b5a936c81e6c08389a8581c2665311d026ce3d225c88d09c49f9b440"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.27.0


--===============7585711038259942298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.19.3.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.19.4.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4507012 to 4513180 (+0%)
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1240886 to 1245414 (+0%)
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3331453 to 3334103 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/src -> /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/src, directory renamed /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/udev -> /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/udev, directory renamed /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/tools -> /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/tools, directory renamed /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/include/linux/linux -> /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/include/linux/linux, directory renamed /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/include/valgrind -> /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/include/valgrind, removed "/usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libi
 nput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-int.h /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-pointer.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest
 -device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-misc.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-log.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-udev.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-path.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-as
 us-rog-gladius.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-touchpad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.
 19.3/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-yubikey.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-touchpad-tap.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-touchpad-buttons.c /usr/src/
 debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-i
 sdv4-4200-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-trackpoint.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-gestures.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-switch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-logitec
 h-trackball.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-keyboard.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-trackball.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.19.3-r0/libi
 nput-1.19.3/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-device.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-tablet.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest.h /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-touch.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/
 test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-quirks.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-touchscreen-fuzz.c /usr/src/debug/li
 binput/1.19.3-r0/libinput-1.19.3/test/test-keyboard.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/test-totem.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.19.3-r0/libinput-1.19.3/test/litest-device-magic-trackpad.c", added "/usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-quirks.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-bam
 boo-16fg-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-format-string.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-trackpoint.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test
 -log.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-gestures.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-a
 sus-rog-gladius.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-trackball.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-path.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-pointer.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-switch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-generic-singlet
 ouch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-mouse.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest.h /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-devi
 ce-mouse-wheel-tilt.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-touchpad-tap.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-yubikey.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/d
 ebug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-udev.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-keyboard.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-misc.c /
 usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-int.h /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device
 -magic-trackpad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-device.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-touch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-totem.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/lite
 st-device-elantech-touchpad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-thinkpad-ext
 rabuttons.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/test-touchpad.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.19.4-r0/libinput-1.19.4/test/litest-device-logitech-media-keyboard-elite.c"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.19.3 [default] to 1.19.4 [default]

--===============7585711038259942298==--

