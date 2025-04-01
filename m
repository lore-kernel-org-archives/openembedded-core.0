Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD63C369D1
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18085.1743511405654944093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VsBVyojz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RBCajtBP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195f160d181-eaececa6-c825-4f03-a14c-4d583e0bd276-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w8LAPNog6hdYCoHdL2VWUIiq2vP91FyX9qXPnjUKSys=;
	b=VsBVyojzaSBgwoIN7Wnl1X4pIuSucLh7Rw/8eD6xjAqe+pzfPMfNXsAzH3eQv72F
	pcH12TmghshGvrVRt/o6yqcAYXW1X7IBy0Yw5rJiE8waQw1IO4JPkHAqISgEQhSv6K9
	3RBEWGhpAXdg50KTp1kbyq0A0oO//UFA01f91skc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w8LAPNog6hdYCoHdL2VWUIiq2vP91FyX9qXPnjUKSys=;
	b=RBCajtBPVXS4J1WIsueErCPOhxmIedSsYKgKu209FyZR+p6nQAhaKEym6fZeVjJG
	WM1XT817xVqw7E5FMCElWkJIvOY6juyr4kGxDthhRo9MJJI+dp0BnURYTDDfpGNXbtN
	anMO5zQZDdb0u10vncYotnumdjnKOPHQqNiFeJyQ=
Content-Type: multipart/mixed; boundary="===============5342144985685299368=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.28.1 SUCCEEDED
Message-ID: <01010195f160d181-eaececa6-c825-4f03-a14c-4d583e0bd276-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214106

--===============5342144985685299368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.28.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.27.1-1.28.1.patch
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
From cfe49c7e3e922367326d7ebb096dbf6dac292f49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:43:59 +0000
Subject: [PATCH] libinput: upgrade 1.27.1 -> 1.28.1

---
 .../wayland/{libinput_1.27.1.bb => libinput_1.28.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.27.1.bb => libinput_1.28.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.27.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.27.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.28.1.bb
index 04a03f0807..767a7675f2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.27.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "3aa004b96488bf0b2446c11b97a7f8a75ff37c23"
+SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.47.1


--===============5342144985685299368==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.27.1-1.28.1.patch"

RnJvbSBjZmU0OWM3ZTNlOTIyMzY3MzI2ZDdlYmIwOTZkYmY2ZGFjMjkyZjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTo0Mzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjcuMSAtPiAxLjI4LjEKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjcuMS5iYiA9PiBsaWJpbnB1dF8xLjI4LjEuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjcuMS5iYiA9PiBsaWJpbnB1dF8x
LjI4LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yNy4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjcuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yOC4xLmJiCmluZGV4IDA0YTAzZjA4
MDcuLjc2N2E3Njc1ZjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI4LjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlu
cHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiM2FhMDA0Yjk2NDg4
YmYwYjI0NDZjMTFiOTdhN2Y4YTc1ZmYzN2MyMyIKK1NSQ1JFViA9ICI0ZjdiNGVmMGU0ZWI1ZDU2
OWRmMzZiZTM4NzU3OTg1OGViYTM0OWJiIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQr
KSIKLS0gCjIuNDcuMQoK

--===============5342144985685299368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7286864 to 7719184 (+6%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 225927 to 228925 (+1%)
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 46862 to 47709 (+2%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1098678 to 1151926 (+5%)
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3698279 to 3796919 (+3%)
packages/core2-64-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.27.1/tools -> /usr/src/debug/libinput/1.28.1/tools, directory renamed /usr/src/debug/libinput/1.27.1/include/linux/linux -> /usr/src/debug/libinput/1.28.1/include/linux/linux, directory renamed /usr/src/debug/libinput/1.27.1/test -> /usr/src/debug/libinput/1.28.1/test, directory renamed /usr/src/debug/libinput/1.27.1/udev -> /usr/src/debug/libinput/1.28.1/udev, directory renamed /usr/src/debug/libinput/1.27.1/include/valgrind -> /usr/src/debug/libinput/1.28.1/include/valgrind, removed "/usr/src/debug/libinput/1.27.1/src/evdev-fallback.h /usr/src/debug/libinput/1.27.1/src/util-prop-parsers.c /usr/src/debug/libinput/1.27.1/src/libinput-private-config.h /usr/src/debug/libinput/1.27.1/src/evdev-debounce.c /usr/src/debug/libinput/1.27.1/src/util-prop-parsers.h /usr/src/debug/libinput/1.27.1/src/evdev-fallback.c /usr/src/debug/libinput/1.27.1/src/filter-trackpoint.c /usr/src/debug/libi
 nput/1.27.1/src/libinput-private-config.c /usr/src/debug/libinput/1.27.1/src/util-ratelimit.h /usr/src/debug/libinput/1.27.1/src/util-stringbuf.h /usr/src/debug/libinput/1.27.1/src/path-seat.c /usr/src/debug/libinput/1.27.1/src/udev-seat.c /usr/src/debug/libinput/1.27.1/src/util-time.h /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.27.1/src/udev-seat.h /usr/src/debug/libinput/1.27.1/src/util-ratelimit.c /usr/src/debug/libinput/1.27.1/src/builddir.h /usr/src/debug/libinput/1.27.1/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.27.1/src/util-list.c /usr/src/debug/libinput/1.27.1/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.27.1/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.27.1/src/util-list.h /usr/src/debug/libinput/1.27.1/src/evdev.c /usr/src/debug/libinput/1.27.1/src/timer.c /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.2
 7.1/src/util-input-event.h /usr/src/debug/libinput/1.27.1/src/util-range.h /usr/src/debug/libinput/1.27.1/src/util-strings.c /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.27.1/src/util-strings.h /usr/src/debug/libinput/1.27.1/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.27.1/src/evdev.h /usr/src/debug/libinput/1.27.1/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.27.1/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.27.1/src/filter-custom.c /usr/src/debug/libinput/1.27.1/src/filter-tablet.c /usr/src/debug/libinput/1.27.1/src/libinput.h /usr/src/debug/libinput/1.27.1/src/timer.h /usr/src/debug/libinput/1.27.1/src/util-files.h /usr/src/debug/libinput/1.27.1/src/libinput.c /usr/src/debug/libinput/1.27.1/src/libinput-versionsort.h /usr/src/debug/libinput/1.27.1/src/quirks.c /usr/src/debug/libinput/1.27.1/src/filter.h /usr/src/debug/libinput/1.27.1/src/libinput-priva
 te.h /usr/src/debug/libinput/1.27.1/src/filter-low-dpi.c /usr/src/debug/libinput/1.27.1/src/quirks.h /usr/src/debug/libinput/1.27.1/src/filter.c /usr/src/debug/libinput/1.27.1/src/util-bits.h /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.27.1/src/evdev-totem.c /usr/src/debug/libinput/1.27.1/src/filter-flat.c /usr/src/debug/libinput/1.27.1/src/filter-private.h /usr/src/debug/libinput/1.27.1/src/evdev-tablet.c /usr/src/debug/libinput/1.27.1/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.27.1/src/evdev-wheel.c /usr/src/debug/libinput/1.27.1/src/evdev-tablet.h /usr/src/debug/libinput/1.27.1/src/evdev-middle-button.c /usr/src/debug/libinput/1.27.1/src/util-backtrace.h /usr/src/debug/libinput/1.27.1/src/filter-touchpad.c /usr/src/debug/libinput/1.27.1/src/util-matrix.h /usr/src/debug/libinput/1.27.1/src/filter-mouse.c", added "/usr/src/debug/libinput/1.28.1/src/evdev-fallback.h /usr/src/debug/libinput/1.28.1/src/util-prop-parsers.c /usr/src/debug/libi
 nput/1.28.1/src/libinput-private-config.h /usr/src/debug/libinput/1.28.1/src/evdev-debounce.c /usr/src/debug/libinput/1.28.1/src/util-multivalue.h /usr/src/debug/libinput/1.28.1/src/evdev-fallback.c /usr/src/debug/libinput/1.28.1/src/filter-trackpoint.c /usr/src/debug/libinput/1.28.1/src/util-prop-parsers.h /usr/src/debug/libinput/1.28.1/src/libinput-private-config.c /usr/src/debug/libinput/1.28.1/src/util-ratelimit.h /usr/src/debug/libinput/1.28.1/src/util-libinput.h /usr/src/debug/libinput/1.28.1/src/util-stringbuf.h /usr/src/debug/libinput/1.28.1/src/path-seat.c /usr/src/debug/libinput/1.28.1/src/udev-seat.c /usr/src/debug/libinput/1.28.1/src/util-time.h /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.28.1/src/udev-seat.h /usr/src/debug/libinput/1.28.1/src/util-libinput.c /usr/src/debug/libinput/1.28.1/src/util-ratelimit.c /usr/src/debug/libinput/1.28.1/src/builddir.h /usr/src/debug/libinput/1.28.1/src/evdev-tablet-pad.c /usr/src/debug/libinpu
 t/1.28.1/src/util-list.c /usr/src/debug/libinput/1.28.1/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.28.1/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.28.1/src/util-list.h /usr/src/debug/libinput/1.28.1/src/evdev.c /usr/src/debug/libinput/1.28.1/src/timer.c /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.28.1/src/util-input-event.h /usr/src/debug/libinput/1.28.1/src/util-range.h /usr/src/debug/libinput/1.28.1/src/util-strings.c /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.28.1/src/util-strings.h /usr/src/debug/libinput/1.28.1/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.28.1/src/evdev.h /usr/src/debug/libinput/1.28.1/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.28.1/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.28.1/src/filter-custom.c
  /usr/src/debug/libinput/1.28.1/src/filter-tablet.c /usr/src/debug/libinput/1.28.1/src/libinput.h /usr/src/debug/libinput/1.28.1/src/timer.h /usr/src/debug/libinput/1.28.1/src/util-files.h /usr/src/debug/libinput/1.28.1/src/libinput.c /usr/src/debug/libinput/1.28.1/src/libinput-versionsort.h /usr/src/debug/libinput/1.28.1/src/quirks.c /usr/src/debug/libinput/1.28.1/src/filter.h /usr/src/debug/libinput/1.28.1/src/libinput-private.h /usr/src/debug/libinput/1.28.1/src/filter-low-dpi.c /usr/src/debug/libinput/1.28.1/src/quirks.h /usr/src/debug/libinput/1.28.1/src/filter.c /usr/src/debug/libinput/1.28.1/src/util-bits.h /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.28.1/src/evdev-totem.c /usr/src/debug/libinput/1.28.1/src/filter-flat.c /usr/src/debug/libinput/1.28.1/src/filter-private.h /usr/src/debug/libinput/1.28.1/src/evdev-tablet.c /usr/src/debug/libinput/1.28.1/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.28.1/src/evdev-wheel.c /usr/src/debug/l
 ibinput/1.28.1/src/evdev-tablet.h /usr/src/debug/libinput/1.28.1/src/evdev-middle-button.c /usr/src/debug/libinput/1.28.1/src/util-backtrace.h /usr/src/debug/libinput/1.28.1/src/filter-touchpad.c /usr/src/debug/libinput/1.28.1/src/util-matrix.h /usr/src/debug/libinput/1.28.1/src/filter-mouse.c"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.27.1 [default] to 1.28.1 [default]
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.27.1" to "1.28.1"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1363723 to 1441935 (+6%)
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.27.1 [default] to 1.28.1 [default]

--===============5342144985685299368==--

