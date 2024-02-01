Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD94BC52CF8
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2148.1706810404538100987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aTm4lG8I;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q6YS6VVD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3f91c-c402096d-96ca-4966-a7bb-2e928e386b33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0X5WgYEyxEBEhdNr53YG8xUhY4NkPs/chiwnXjdq43k=;
	b=aTm4lG8IkoK610jnPgeviu9ps1Mgv4cV2PwB3uZWJJ64jCiDUsMxajeBm45ELbtH
	djd6XZwWQLAO1AKM99GUyewXGrSLcIQ+ZLchO1e98oKfLzAv/2jT4zStxod+fEBEnPn
	/a6vX3XV5w9kaCHO0ffR3Wf9HdCW3mrkph7oKntk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0X5WgYEyxEBEhdNr53YG8xUhY4NkPs/chiwnXjdq43k=;
	b=Q6YS6VVDjSTm3TmC/ZoFJ5xnVzCfMugknXXph0I9iiVCidKidp9nGeecLdDvdOhp
	9np9ZyFl3gqHPrr8UqFVmHDkDkGMQS4wRlrx1+oSRDDSKqymFtcaAcvxYQ1/3i9cvZu
	0rWWgd1F69c32dUPCsiEY/HAYA8iwqMov4f8PUU4=
Content-Type: multipart/mixed; boundary="===============1558618908208279627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.25.0 SUCCEEDED
Message-ID: <0101018d65d3f91c-c402096d-96ca-4966-a7bb-2e928e386b33-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194684

--===============1558618908208279627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.24.0-1.25.0.patch
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
From 3d7e7077a991abb3ae42e3524018ca656fb4279e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 13:54:55 +0000
Subject: [PATCH] libinput: upgrade 1.24.0 -> 1.25.0

---
 .../wayland/{libinput_1.24.0.bb => libinput_1.25.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.24.0.bb => libinput_1.25.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.24.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.24.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 26ab1adaea..517b247fed 100644
--- a/meta/recipes-graphics/wayland/libinput_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "1680f2fbaa63a91739012c6b57988ab1918ea0b7"
+SRCREV = "3fd38d89276b679ac3565efd7c2150fd047902cb"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.42.0


--===============1558618908208279627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput: FILELIST: removed "/usr/share/libinput/50-framework.quirks", added "/usr/share/libinput/30-vendor-oracle.quirks /usr/share/libinput/30-vendor-qemu.quirks /usr/share/libinput/50-system-graviton.quirks /usr/share/libinput/50-system-framework.quirks"
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-oracle.quirks was added
  /usr/share/libinput/30-vendor-qemu.quirks was added
  /usr/share/libinput/50-system-framework.quirks was added
  /usr/share/libinput/50-system-graviton.quirks was added
  /usr/share/libinput/50-framework.quirks was removed

--===============1558618908208279627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.24.0-1.25.0.patch"

RnJvbSAzZDdlNzA3N2E5OTFhYmIzYWU0MmUzNTI0MDE4Y2E2NTZmYjQyNzllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMzo1NDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjQuMCAtPiAxLjI1LjAKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjQuMC5iYiA9PiBsaWJpbnB1dF8xLjI1LjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjQuMC5iYiA9PiBsaWJpbnB1dF8x
LjI1LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yNS4wLmJiCmluZGV4IDI2YWIxYWRh
ZWEuLjUxN2IyNDdmZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI1LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlu
cHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMTY4MGYyZmJhYTYz
YTkxNzM5MDEyYzZiNTc5ODhhYjE5MThlYTBiNyIKK1NSQ1JFViA9ICIzZmQzOGQ4OTI3NmI2Nzlh
YzM1NjVlZmQ3YzIxNTBmZDA0NzkwMmNiIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQr
KSIKLS0gCjIuNDIuMAoK

--===============1558618908208279627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6309200 to 6319880 (+0%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1124006 to 1125718 (+0%)
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3510026 to 3516121 (+0%)
packages/core2-64-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.24.0/udev -> /usr/src/debug/libinput/1.25.0/udev, directory renamed /usr/src/debug/libinput/1.24.0/src -> /usr/src/debug/libinput/1.25.0/src, directory renamed /usr/src/debug/libinput/1.24.0/include/valgrind -> /usr/src/debug/libinput/1.25.0/include/valgrind, directory renamed /usr/src/debug/libinput/1.24.0/include/linux/linux -> /usr/src/debug/libinput/1.25.0/include/linux/linux, directory renamed /usr/src/debug/libinput/1.24.0/tools -> /usr/src/debug/libinput/1.25.0/tools, removed "/usr/src/debug/libinput/1.24.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/l
 ibinput/1.24.0/test/test-trackpoint.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.24.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.24.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.24.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.24.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.24.0/test/test-gestures.c /usr/src/debug/libinput/1.24.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.24.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/
 1.24.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.24.0/test/test-misc.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.24.0/test/litest.h /usr/src/debug/libinput/1.24.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.24.0/test/litest.c /usr/src/debug/libinput/1.24.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.24.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.24.0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.24.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.24.0/test/test-quirks.c /usr/src/debug/libinput/1.24.0/test/test-switch.c /usr/src/debug/libinput/1.24.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.24.0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-aiptek-tablet.c /u
 sr/src/debug/libinput/1.24.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.24.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.24.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.24.0/test/litest-int.h /usr/src/debug/libinput/1.24.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.24.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.24.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.24.0/test/test-touchpad-butto
 ns.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.24.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.24.0/test/test-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.24.0/test/test-keyboard.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.24.0/test/test-pointer.c /usr/src/debug/libinput/1.24.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.24.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-bamboo-16
 fg-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.24.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.24.0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.24.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.24.0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.24.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.24.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.24.0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.24.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.24.0/test/litest-device-keyboard.c /usr/sr
 c/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.24.0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.24.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.24.0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.24.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.24.0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.24.0/test/test-path.c /usr/src/debug/libinput/1.24.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.24.0/test/test-device.c /usr/src/debug/libinput/1.24.0/test/test-tablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.24.0/test/test-utils.c /usr/src/debug/libinput/1.24.0/test
 /test-log.c /usr/src/debug/libinput/1.24.0/test/litest-device-format-string.c /usr/src/debug/libinput/1.24.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.24.0/test/test-touch.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.24.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-hover.c /usr/s
 rc/debug/libinput/1.24.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.24.0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.24.0/test/test-totem.c /usr/src/debug/libinput/1.24.0/test/test-udev.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.24.0/test/test-trackball.c /usr/src/debug/libinput/1.24.0/test/test-touchpad.c /usr/src/debug/libinput/1.24.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.24.0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.24.0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.24.0/test/litest-device-anker-mouse-kbd.c", added "/usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-click-count.c
  /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.25.0/test/test-trackpoint.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.25.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.25.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.25.0/test/test-gestures.c /usr/src/debug/libinput/1.25.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.25.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.25.0/test/litest-devic
 e-mouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.25.0/test/test-misc.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.25.0/test/litest.h /usr/src/debug/libinput/1.25.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.25.0/test/litest.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.25.0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.25.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.25.0/test/test-quirks.c /usr/src/debug/libinput/1.25.0/test/test-switch.c /usr/src/debug/libinput/1.25.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1
 .25.0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.25.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.25.0/test/litest-int.h /usr/src/debug/libinput/1.25.0/test/litest-device-touchpad-palm-threshold-zero.c /usr/src/debug/libinput/1.25.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.25.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-t44
 0.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.25.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.25.0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.25.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.25.0/test/test-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.25.0/test/test-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.25.0/test/test-pointer.c /usr/src/debug/lib
 input/1.25.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.25.0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.25.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.25.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.25.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libin
 put/1.25.0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.25.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.25.0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.25.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.25.0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.25.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.25.0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.25.0/test/test-path.c /usr/src/debug/libinput/1.25.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.25.0/test/test-device.c /usr/src/debug
 /libinput/1.25.0/test/test-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.25.0/test/test-utils.c /usr/src/debug/libinput/1.25.0/test/test-log.c /usr/src/debug/libinput/1.25.0/test/litest-device-format-string.c /usr/src/debug/libinput/1.25.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.25.0/test/test-touch.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.25.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.25
 .0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.25.0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.25.0/test/test-totem.c /usr/src/debug/libinput/1.25.0/test/test-udev.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.25.0/test/test-trackball.c /usr/src/debug/libinput/1.25.0/test/test-touchpad.c /usr/src/debug/libinput/1.25.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.25.0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.25.0/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.25.0/test/litest-device-anker-mouse-kbd.c"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.24.0" to "1.25.0"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1204167 to 1206065 (+0%)
packages/core2-64-poky-linux/libinput/libinput: FILELIST: removed "/usr/share/libinput/50-framework.quirks", added "/usr/share/libinput/30-vendor-qemu.quirks /usr/share/libinput/50-system-framework.quirks /usr/share/libinput/50-system-graviton.quirks /usr/share/libinput/30-vendor-oracle.quirks"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.24.0 [default] to 1.25.0 [default]
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-oracle.quirks was added
  /usr/share/libinput/30-vendor-qemu.quirks was added
  /usr/share/libinput/50-system-framework.quirks was added
  /usr/share/libinput/50-system-graviton.quirks was added
  /usr/share/libinput/50-framework.quirks was removed

--===============1558618908208279627==--

