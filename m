Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E884D10DC7
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.149812.1733047567127021579
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dm7GNnKQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OK3hLB87;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019381af4072-155abb68-d186-4c03-bf50-6675b172425c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EoVuRszohlihwB6xvSHDO5nnWjozFnzesy2dee0aCeI=;
	b=dm7GNnKQpul9EWZFPdwM2/BlOc2m6g5M+ZNdHHQubj62bH0XpOcKFpKhxw7cgV1K
	Yr3QrKb5EM4i56zS7MJ3q1GEMJDkcWO6SH4uLbBg7yiTtIu18NokJUvCanzSzUhi8Pi
	PIN/tzkQg5WuEAtri3o3up1cDWUuS6sg6Gst4ATk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EoVuRszohlihwB6xvSHDO5nnWjozFnzesy2dee0aCeI=;
	b=OK3hLB87W6lh/5C+IR5X0hfNzkQ2WPymoB30iyDlPNjgBuf+a73H0u2PQNyL4jYq
	cOoHYf0Af5SGBW9hyKpva/Yx+FzSodei/gh9ktGcmpPtMKBcVatLOgtSKWU0/XsprH+
	g9W10kU8VU4IuC6rjWFu4bzL5jZZ6pm8DAdcVqQc=
Content-Type: multipart/mixed; boundary="===============2529622215209591791=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.27.0 SUCCEEDED
Message-ID: <0101019381af4072-155abb68-d186-4c03-bf50-6675b172425c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208097

--===============2529622215209591791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.27.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.26.2-1.27.0.patch
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
From c7509092bd06f3786e66d30effc49030d585254b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 08:40:00 +0000
Subject: [PATCH] libinput: upgrade 1.26.2 -> 1.27.0

---
 .../wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.2.bb b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.26.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.27.0.bb
index 6a96b0e14a..0222e4c9bf 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "3402f380019dc4f882e1d8627029607aca3f4be6"
+SRCREV = "64d1f198fb2764dfb852a19becaf6f7f097fce2c"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.1


--===============2529622215209591791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: removed "libcheck-dbg"
packages/core2-64-poky-linux/libinput/libinput-ptest: RDEPENDS: removed all items "libcheck (['>= 0.15.2'])"
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-icl.quirks /usr/share/libinput/50-system-honor.quirks"
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: removed all items "libcheck (['>= 0.15.2'])"
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-honor.quirks was added
  /usr/share/libinput/50-system-icl.quirks was added

--===============2529622215209591791==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.26.2-1.27.0.patch"

RnJvbSBjNzUwOTA5MmJkMDZmMzc4NmU2NmQzMGVmZmM0OTAzMGQ1ODUyNTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwODo0MDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjYuMiAtPiAxLjI3LjAKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjYuMi5iYiA9PiBsaWJpbnB1dF8xLjI3LjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjYuMi5iYiA9PiBsaWJpbnB1dF8x
LjI3LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yNy4wLmJiCmluZGV4IDZhOTZiMGUx
NGEuLjAyMjJlNGM5YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI3LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlu
cHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMzQwMmYzODAwMTlk
YzRmODgyZTFkODYyNzAyOTYwN2FjYTNmNGJlNiIKK1NSQ1JFViA9ICI2NGQxZjE5OGZiMjc2NGRm
Yjg1MmExOWJlY2FmNmY3ZjA5N2ZjZTJjIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQr
KSIKLS0gCjIuNDQuMQoK

--===============2529622215209591791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGSIZE changed from 59656 to 63752 (+7%)
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: removed "libcheck-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6530968 to 6894936 (+6%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 219936 to 225927 (+3%)
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 46417 to 46862 (+1%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1143590 to 1098678 (-4%)
packages/core2-64-poky-linux/libinput/libinput-ptest: RDEPENDS: removed all items "libcheck (['>= 0.15.2'])"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3587165 to 3698229 (+3%)
packages/core2-64-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.26.2/include/linux/linux -> /usr/src/debug/libinput/1.27.0/include/linux/linux, directory renamed /usr/src/debug/libinput/1.26.2/udev -> /usr/src/debug/libinput/1.27.0/udev, directory renamed /usr/src/debug/libinput/1.26.2/tools -> /usr/src/debug/libinput/1.27.0/tools, directory renamed /usr/src/debug/libinput/1.26.2/include/valgrind -> /usr/src/debug/libinput/1.27.0/include/valgrind, removed "/usr/src/debug/libinput/1.26.2/src/util-list.h /usr/src/debug/libinput/1.26.2/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.26.2/test/litest-device-tablet-doubledial.c /usr/src/debug/libinput/1.26.2/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.26.2/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.26.2/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.26.2/src/util-list.c /usr/src/debug/libinput/1.26.2/t
 est/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.26.2/src/evdev-fallback.h /usr/src/debug/libinput/1.26.2/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.26.2/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.26.2/test/test-device.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.26.2/src/filter-flat.c /usr/src/debug/libinput/1.26.2/test/test-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-alps-semi-mt.c /usr/src/debug/libinput/1.26.2/src/evdev-fallback.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.26.2/src/filter-mouse.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.26.2/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.26.2/test/litest.c /usr/src/debug/libinput/1.26.2/test/
 litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.26.2/test/test-touchpad.c /usr/src/debug/libinput/1.26.2/test/litest.h /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-yubikey.c /usr/src/debug/libinput/1.26.2/test/test-misc.c /usr/src/debug/libinput/1.26.2/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.26.2/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.26.2/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.26.2/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput
 /1.26.2/src/builddir.h /usr/src/debug/libinput/1.26.2/src/filter-low-dpi.c /usr/src/debug/libinput/1.26.2/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.26.2/src/evdev-middle-button.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.26.2/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.26.2/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.26.2/src/udev-seat.h /usr/src/debug/libinput/1.26.2/test/litest-device-touchpad-palm-threshold-zero.c /usr/src/debug/libinput/1.26.2/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.26.2/src/path-sea
 t.c /usr/src/debug/libinput/1.26.2/src/udev-seat.c /usr/src/debug/libinput/1.26.2/test/litest-device-mouse.c /usr/src/debug/libinput/1.26.2/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.26.2/src/libinput-private.h /usr/src/debug/libinput/1.26.2/src/filter.h /usr/src/debug/libinput/1.26.2/src/util-time.h /usr/src/debug/libinput/1.26.2/src/filter.c /usr/src/debug/libinput/1.26.2/test/litest-device-mouse-low-dpi.c /usr/src/debug/libinput/1.26.2/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-int.h /usr/src/debug/libinput/1.26.2/src/util-matrix.h /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.26.2/test/test-udev.c /usr/src/debug/libinput/1.26.2/src/util-files.h /usr/src/debug/l
 ibinput/1.26.2/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.26.2/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.26.2/test/litest-device-tablet-rel-dial.c /usr/src/debug/libinput/1.26.2/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.26.2/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.26.2/test/test-pad.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.26.2/test/test-pointer.c /usr/src/debug/libinput/1.26.2/test/test-utils.c /usr/src/debug/libinput/1.26.2/src/evdev-tablet.h /usr/src/debug/libinput/1.26.2/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.26.2/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.26.2/src/evdev-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-intuos
 5-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.26.2/test/test-path.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.26.2/test/test-quirks.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-intuos5-pad.c /usr/src/debug/libinput/1.26.2/test/test-switch.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.26.2/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.26.2/src/evdev.c /usr/src/debug/libinput/1.26.2/src/timer.c /usr/src/debug/libinput/1.26.2/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.26.2/src/evdev.h /usr/src/debug/libinput/1.26.2/src/timer.h /usr/src/debug/libinput/1.26.2/src/quirks.h /usr/src/debug/libinput/1.26.2/src/util-input-event.h /usr/src/debug/libinput/1.26.2/test/litest-device-tr
 ackpoint.c /usr/src/debug/libinput/1.26.2/src/quirks.c /usr/src/debug/libinput/1.26.2/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.26.2/test/test-keyboard.c /usr/src/debug/libinput/1.26.2/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.26.2/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.26.2/src/libinput-private-config.c /usr/src/debug/libinput/1.26.2/src/util-ratelimit.c /usr/src/debug/libinput/1.26.2/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.26.2/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.26.2/src/libinput-private-config.h /usr/src/debug/libinput/1.26.2/src/util-ratelimit.h /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.26.2/test/test-totem.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.26.2/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinpu
 t/1.26.2/src/libinput-versionsort.h /usr/src/debug/libinput/1.26.2/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.26.2/src/util-strings.c /usr/src/debug/libinput/1.26.2/src/util-strings.h /usr/src/debug/libinput/1.26.2/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.26.2/src/util-prop-parsers.h /usr/src/debug/libinput/1.26.2/test/litest-device-huion-q620m-dial.c /usr/src/debug/libinput/1.26.2/test/test-log.c /usr/src/debug/libinput/1.26.2/src/filter-private.h /usr/src/debug/libinput/1.26.2/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.26.2/test/test-touch.c /usr/src/debug/libinput/1.26.2/src/util-prop-parsers.c /usr/src/debug/libinput/1.26.2/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.26.2/test/litest-de
 vice-ms-surface-cover.c /usr/src/debug/libinput/1.26.2/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.26.2/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.26.2/src/filter-trackpoint.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.26.2/src/evdev-debounce.c /usr/src/debug/libinput/1.26.2/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.26.2/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.26.2/src/evdev-wheel.c /usr/src/debug/libinput/1.26.2/test/test-trackball.c /usr/src/debug/libinput/1.26.2/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.26.2/src/filter-custom.c /usr/src/debug/libinput/1.26.2/src/filter-tablet.c /usr/src/debug/libinput/1.26.2/test/test-touchpad-tap.c /usr/src/debug/libinput/1.26.2/test/litest-device-apple-internal-keyboard.c 
 /usr/src/debug/libinput/1.26.2/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.26.2/src/filter-touchpad.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-format-string.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.26.2/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.26.2/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.26.2/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.26.2/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.26.2/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.26.2/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.26.2/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.26.2/test/litest-dev
 ice-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.26.2/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.26.2/test/test-gestures.c /usr/src/debug/libinput/1.26.2/src/evdev-totem.c /usr/src/debug/libinput/1.26.2/src/libinput.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.26.2/src/libinput.h /usr/src/debug/libinput/1.26.2/test/litest-device-keyboard.c /usr/src/debug/libinput/1.26.2/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.26.2/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.26.2/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.26.2/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.26.2/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.26.2/src/util-bits.h /usr/src/debug/libinput/1.26.2/test/test-track
 point.c", added "/usr/src/debug/libinput/1.27.0/src/util-list.h /usr/src/debug/libinput/1.27.0/test/litest-device-atmel-hover.c /usr/src/debug/libinput/1.27.0/test/litest-device-tablet-doubledial.c /usr/src/debug/libinput/1.27.0/test/litest-device-asus-rog-gladius.c /usr/src/debug/libinput/1.27.0/test/litest-device-keyboard-razer-blade-stealth-videoswitch.c /usr/src/debug/libinput/1.27.0/test/litest-device-acer-hawaii-touchpad.c /usr/src/debug/libinput/1.27.0/src/util-list.c /usr/src/debug/libinput/1.27.0/test/litest-device-keyboard-razer-blackwidow.c /usr/src/debug/libinput/1.27.0/src/evdev-fallback.h /usr/src/debug/libinput/1.27.0/test/litest-device-sony-vaio-keys.c /usr/src/debug/libinput/1.27.0/test/litest-device-xen-virtual-pointer.c /usr/src/debug/libinput/1.27.0/test/test-device.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-ekr.c /usr/src/debug/libinput/1.27.0/src/filter-flat.c /usr/src/debug/libinput/1.27.0/test/test-tablet.c /usr/src/debug/libinput/1.27.0/test/l
 itest-device-alps-semi-mt.c /usr/src/debug/libinput/1.27.0/src/evdev-fallback.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-calibrated-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-isdv4-e6-pen.c /usr/src/debug/libinput/1.27.0/src/filter-mouse.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-13hdt-finger.c /usr/src/debug/libinput/1.27.0/test/litest-device-mouse-wheel-click-angle.c /usr/src/debug/libinput/1.27.0/test/litest.c /usr/src/debug/libinput/1.27.0/test/litest-device-dell-canvas-totem.c /usr/src/debug/libinput/1.27.0/test/test-touchpad.c /usr/src/debug/libinput/1.27.0/test/litest.h /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-13hdt-pad.c /usr/src/debug/libinput/1.27.0/test/litest-device-keyboard-razer-blade-stealth.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-13hdt-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device-tablet-mode-switch.c /usr/src/debug/libinput/1.27.0/test/litest-device-wa
 com-cintiq-24hdt-pad.c /usr/src/debug/libinput/1.27.0/src/util-range.h /usr/src/debug/libinput/1.27.0/test/litest-device-yubikey.c /usr/src/debug/libinput/1.27.0/test/litest-device-thinkpad-extrabuttons.c /usr/src/debug/libinput/1.27.0/test/litest-device-logitech-media-keyboard-elite.c /usr/src/debug/libinput/1.27.0/test/test-misc.c /usr/src/debug/libinput/1.27.0/test/litest-device-uclogic-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-bcm5974.c /usr/src/debug/libinput/1.27.0/test/litest-device-calibrated-touchscreen.c /usr/src/debug/libinput/1.27.0/src/builddir.h /usr/src/debug/libinput/1.27.0/src/filter-low-dpi.c /usr/src/debug/libinput/1.27.0/test/litest-device-keyboard-all-codes.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-t440.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-x220.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-rmi4.c /usr/src/debug/libinput/1.27.0/src/evdev-middle-button.c /usr/src/debug/libinput/1.27.0/te
 st/litest-device-wacom-cintiq-12wx-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device-absinfo-override.c /usr/src/debug/libinput/1.27.0/test/litest-device-logitech-trackball.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-x1-carbon-3rd.c /usr/src/debug/libinput/1.27.0/test/litest-device-cyborg-rat-5.c /usr/src/debug/libinput/1.27.0/src/udev-seat.h /usr/src/debug/libinput/1.27.0/test/litest-device-touchpad-palm-threshold-zero.c /usr/src/debug/libinput/1.27.0/test/litest-device-hp-wmi-hotkeys.c /usr/src/debug/libinput/1.27.0/src/path-seat.c /usr/src/debug/libinput/1.27.0/src/udev-seat.c /usr/src/debug/libinput/1.27.0/test/litest-device-mouse.c /usr/src/debug/libinput/1.27.0/test/litest-device-anker-mouse-kbd.c /usr/src/debug/libinput/1.27.0/src/libinput-private.h /usr/src/debug/libinput/1.27.0/src/filter.h /usr/src/debug/libinput/1.27.0/src/util-time.h /usr/src/debug/libinput/1.27.0/src/filter.c /usr/src/debug/libinput/1.27.0/test/litest-device-mouse-low-dpi.c /usr/
 src/debug/libinput/1.27.0/test/litest-device-aiptek-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-waltop-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-int.h /usr/src/debug/libinput/1.27.0/src/util-matrix.h /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-bamboo-2fg-pad.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-24hd-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-pro-16-pen.c /usr/src/debug/libinput/1.27.0/test/test-udev.c /usr/src/debug/libinput/1.27.0/src/util-files.h /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-cintiq-pro-16-pad.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-bamboo-2fg-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device-apple-appletouch.c /usr/src/debug/libinput/1.27.0/test/litest-device-magic-trackpad.c /usr/src/debug/libinput/1.27.0/test/litest-device-tablet-rel-dial.c /usr/src/debug/libinput/1.27.0/test/litest-device-acer-hawaii-keyboard.c /usr/src/debug/libinput/1.2
 7.0/test/litest-device-keyboard-quirked.c /usr/src/debug/libinput/1.27.0/test/test-pad.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.27.0/test/test-pointer.c /usr/src/debug/libinput/1.27.0/test/test-utils.c /usr/src/debug/libinput/1.27.0/src/evdev-tablet.h /usr/src/debug/libinput/1.27.0/test/litest-device-mouse-wheel-tilt.c /usr/src/debug/libinput/1.27.0/test/litest-device-protocol-a-touch-screen.c /usr/src/debug/libinput/1.27.0/src/evdev-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-intuos5-pen.c /usr/src/debug/libinput/1.27.0/src/util-backtrace.h /usr/src/debug/libinput/1.27.0/test/litest-device-touchscreen-mt-tool.c /usr/src/debug/libinput/1.27.0/test/test-path.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.27.0/test/test-quirks.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-intuos3-pad.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-intuos5-pad.c /usr/src/deb
 ug/libinput/1.27.0/test/test-switch.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.27.0/test/litest-device-alps-3fg.c /usr/src/debug/libinput/1.27.0/src/evdev.c /usr/src/debug/libinput/1.27.0/src/timer.c /usr/src/debug/libinput/1.27.0/test/litest-device-elan-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-generic-singletouch.c /usr/src/debug/libinput/1.27.0/src/evdev.h /usr/src/debug/libinput/1.27.0/src/timer.h /usr/src/debug/libinput/1.27.0/src/quirks.h /usr/src/debug/libinput/1.27.0/src/util-input-event.h /usr/src/debug/libinput/1.27.0/test/litest-device-trackpoint.c /usr/src/debug/libinput/1.27.0/src/quirks.c /usr/src/debug/libinput/1.27.0/test/litest-device-touch-screen.c /usr/src/debug/libinput/1.27.0/test/test-keyboard.c /usr/src/debug/libinput/1.27.0/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.27.0/test/litest-device-ms-nano-transceiver-mouse.c /usr/src/debug/libinput/1.27.0/src/libinput-private-config.c /usr/src/debug/libin
 put/1.27.0/src/util-ratelimit.c /usr/src/debug/libinput/1.27.0/test/litest-device-apple-magicmouse.c /usr/src/debug/libinput/1.27.0/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.27.0/src/libinput-private-config.h /usr/src/debug/libinput/1.27.0/src/util-ratelimit.h /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-phantomclicks.c /usr/src/debug/libinput/1.27.0/test/test-totem.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.27.0/test/litest-device-ignored-mouse.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-hid4800-pen.c /usr/src/debug/libinput/1.27.0/src/libinput-versionsort.h /usr/src/debug/libinput/1.27.0/test/litest-device-alps-dualpoint.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-pressurepad.c /usr/src/debug/libinput/1.27.0/src/util-strings.c /usr/src/debug/libinput/1.27.0/src/util-strings.h /usr/src/debug/libinput/1.27.0/test/litest-device-touchscreen-invalid-range.c /usr/src/debug/libinput/1.27.0
 /test/litest-device-wacom-cintiq-pro-16-finger.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-st.c /usr/src/debug/libinput/1.27.0/src/util-prop-parsers.h /usr/src/debug/libinput/1.27.0/test/litest-device-huion-q620m-dial.c /usr/src/debug/libinput/1.27.0/test/test-log.c /usr/src/debug/libinput/1.27.0/src/filter-private.h /usr/src/debug/libinput/1.27.0/test/litest-device-wheel-only.c /usr/src/debug/libinput/1.27.0/test/test-touch.c /usr/src/debug/libinput/1.27.0/src/util-prop-parsers.c /usr/src/debug/libinput/1.27.0/test/litest-device-lid-switch.c /usr/src/debug/libinput/1.27.0/test/litest-device-ms-surface-cover.c /usr/src/debug/libinput/1.27.0/test/litest-device-generic-pressurepad.c /usr/src/debug/libinput/1.27.0/test/litest-device-mouse-roccat.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.27.0/src/filter-trackpoint.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.27.0/src/evdev-deboun
 ce.c /usr/src/debug/libinput/1.27.0/test/litest-device-lid-switch-surface3.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-intuos5-finger.c /usr/src/debug/libinput/1.27.0/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.27.0/src/evdev-wheel.c /usr/src/debug/libinput/1.27.0/test/test-trackball.c /usr/src/debug/libinput/1.27.0/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.27.0/src/filter-custom.c /usr/src/debug/libinput/1.27.0/src/filter-tablet.c /usr/src/debug/libinput/1.27.0/test/test-touchpad-tap.c /usr/src/debug/libinput/1.27.0/test/litest-device-apple-internal-keyboard.c /usr/src/debug/libinput/1.27.0/test/litest-device-elantech-touchpad.c /usr/src/debug/libinput/1.27.0/src/filter-touchpad.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-isdv4-524c-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device-format-string.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-bamboo-16fg-pen.c /usr/src/debug/libinput/1.27.0/test/litest-device
 -wacom-isdv4-e6-finger.c /usr/src/debug/libinput/1.27.0/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.27.0/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.27.0/test/litest-device-mouse-wheel-click-count.c /usr/src/debug/libinput/1.27.0/test/litest-device-dell-canvas-totem-touch.c /usr/src/debug/libinput/1.27.0/test/litest-device-gpio-keys.c /usr/src/debug/libinput/1.27.0/test/litest-device-huion-pentablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-lenovo-scrollpoint.c /usr/src/debug/libinput/1.27.0/test/litest-device-nexus4-touch-screen.c /usr/src/debug/libinput/1.27.0/test/litest-device-vmware-virtual-usb-mouse.c /usr/src/debug/libinput/1.27.0/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-mobilestudio-pro-pad.c /usr/src/debug/libinput/1.27.0/test/test-gestures.c /usr/src/debug/libinput/1.27.0/src/evdev-totem.c /usr/src/debug/libinput/1.27.0/test/litest-runner.c /usr/src/debug/libinput/1.27.0/src/libinput.c /usr/src/debug/l
 ibinput/1.27.0/test/litest-device-synaptics-hover.c /usr/src/debug/libinput/1.27.0/src/libinput.h /usr/src/debug/libinput/1.27.0/test/litest-device-keyboard.c /usr/src/debug/libinput/1.27.0/test/litest-runner.h /usr/src/debug/libinput/1.27.0/test/test-touchpad-buttons.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-bamboo-2fg-finger.c /usr/src/debug/libinput/1.27.0/test/litest-device-qemu-usb-tablet.c /usr/src/debug/libinput/1.27.0/test/litest-device-synaptics-i2c.c /usr/src/debug/libinput/1.27.0/test/litest-device-touchscreen-fuzz.c /usr/src/debug/libinput/1.27.0/test/litest-device-wacom-isdv4-4200-pen.c /usr/src/debug/libinput/1.27.0/src/util-bits.h /usr/src/debug/libinput/1.27.0/src/util-stringbuf.h /usr/src/debug/libinput/1.27.0/test/test-trackpoint.c"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.26.2" to "1.27.0"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1241153 to 1358258 (+9%)
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: removed all items "libcheck (['>= 0.15.2'])"
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-honor.quirks /usr/share/libinput/50-system-icl.quirks"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.26.2 [default] to 1.27.0 [default]
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-honor.quirks was added
  /usr/share/libinput/50-system-icl.quirks was added

--===============2529622215209591791==--

