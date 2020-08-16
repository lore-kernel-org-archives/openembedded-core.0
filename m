Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19867.1597558920751930356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BA3DE02036; Sat, 15 Aug 2020 23:22:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01528E0206C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:43 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.16.1 SUCCEEDED
Message-Id: <20200816062200.9BA3DE02036@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:00 -0700 (PDT)
X-Groupsio-MsgNum: 141506
Content-Type: multipart/mixed; boundary="===============7360817634568823155=="

--===============7360817634568823155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.16.0-1.16.1.patch
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

--===============7360817634568823155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4475576 to 4484364 (+0%)
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1149478 to 1150822 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/tools -> /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/tools, directory renamed /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/udev -> /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/udev, directory renamed /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/include/linux/linux -> /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/include/linux/linux, directory renamed /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/include/valgrind -> /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/include/valgrind, directory renamed /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/src -> /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/src, removed "/usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.16.0-r0/
 libinput-1.16.0/test/test-udev.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-tablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-trackpoint.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.16.0-r0/li
 binput-1.16.0/test/test-path.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-misc.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-device.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-totem.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.16.
 0-r0/libinput-1.16.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-gestures.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-pointer.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-
 isdv4-4200-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-trackball.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-switch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-touch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-log.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-bcm5974.c
  /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.16.0-r0/libin
 put-1.16.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-quirks.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest.h /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-aiptek-tablet.c /usr/src/debug/libin
 put/1.16.0-r0/libinput-1.16.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse.c /usr/s
 rc/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-int.h /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-touchpad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.
 16.0-r0/libinput-1.16.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/te
 st/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/test-keyboard.c /usr/src/debug/libinput/1.16.0-r0/libinput-1.16.0/test/litest-device-wacom-isdv4-e6-pen.c", added "/usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-int.h /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-switch.c /usr/src/debug/libinput/1
 .16.1-r0/libinput-1.16.1/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-keyboard.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-touch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-trackpoint.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-mouse-
 wheel-tilt.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-pro-16-f
 inger.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-misc.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-yubikey.c /usr/src/debug/libinput/1.16.1-r0/libinput-1
 .16.1/test/test-log.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest.h /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-bambo
 o-2fg-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-gestures.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/deb
 ug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-logitech-media-keyboard-elite.
 c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-device.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-mouse.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/li
 test-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-touchpad.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-udev.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-pointer.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/te
 st/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-touchpad-tap.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-trackball.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-keyboard.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-quirks.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/litest.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-path.c /usr/src/debug/libinput/1.16.1-r0/libinput-1.16.1/test/test-totem.c"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3149060 to 3154254 (+0%)
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.16.0 [default] to 1.16.1 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.16.0" to "1.16.1"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1006501 to 1007100 (+0%)

--===============7360817634568823155==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.16.0-1.16.1.patch"

From 71ef0643e47663e80cdda692e90335f4cd0aa03d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 01:47:11 +0000
Subject: [PATCH] libinput: upgrade 1.16.0 -> 1.16.1

---
 .../wayland/{libinput_1.16.0.bb => libinput_1.16.1.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.0.bb => libinput_1.16.1.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.0.bb b/meta/recipes-graphics/wayland/libinput_1.16.1.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.16.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.1.bb
index baf5c1d167..1497609183 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.1.bb
@@ -16,8 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "b518dae7f603040872739216971ee97b"
-SRC_URI[sha256sum] = "83f6d0c94e5e0dd87094ce73f0edb631919617d24a60ee0ab9bd9197411d76e8"
+SRC_URI[sha256sum] = "7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


--===============7360817634568823155==--
