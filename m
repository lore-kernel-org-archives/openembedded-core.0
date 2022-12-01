Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66434C63705
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.46778.1669908628430953440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nDzESO6x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010184ce4f808f-0f6b0eb7-7d38-4c96-a3bc-8fd6907e6d07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HVcO/ZHc2WQVUzHm38079X9BN2Xo4VmcIAZ8K+lJs/4=;
	b=nDzESO6xBHpsxvJVfa0qki66uO9mHdsZv66kM86wa6Y+k4rwcnrhy8rymYCpjZzA
	OLwj/3CAGRZQcLHH8a/Re65InJjlANL5UrbT6/SOBEIgWWRjrjNd00S5l51Cavo0wCs
	JcnXVxUJZQRgIfPN75hTS4T4bCkZeFMCDrjPA93E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HVcO/ZHc2WQVUzHm38079X9BN2Xo4VmcIAZ8K+lJs/4=;
	b=WKoRVe4vTk6XcMu4AEEWx5l4uqXQwWO1UsGpj6Rc7eo73csPQypC/VvCdQZoj2HE
	KabUpi1VFIF3dvxEx7o78RTSnVyjUzdXcnSAeaywVFIuZMx15Kbtx+EQK8hIPQjFu0g
	3TtA3pj26M+H6++H9Fyn0QeptHs8lyxDQsPMs+oo=
Content-Type: multipart/mixed; boundary="===============3249599435365975096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.22.0 SUCCEEDED
Message-ID: <01010184ce4f808f-0f6b0eb7-7d38-4c96-a3bc-8fd6907e6d07-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174181

--===============3249599435365975096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.21.0-1.22.0.patch
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
--===============3249599435365975096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4847708 to 4831612 (-0%)
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-src: FILELIST: directory renamed /usr/src/debug/libinput/1.21.0-r0/udev -> /usr/src/debug/libinput/1.22.0-r0/udev, directory renamed /usr/src/debug/libinput/1.21.0-r0/include/linux/linux -> /usr/src/debug/libinput/1.22.0-r0/include/linux/linux, directory renamed /usr/src/debug/libinput/1.21.0-r0/test -> /usr/src/debug/libinput/1.22.0-r0/test, directory renamed /usr/src/debug/libinput/1.21.0-r0/include/valgrind -> /usr/src/debug/libinput/1.22.0-r0/include/valgrind, directory renamed /usr/src/debug/libinput/1.21.0-r0/tools -> /usr/src/debug/libinput/1.22.0-r0/tools, removed "/usr/src/debug/libinput/1.21.0-r0/src/evdev.c /usr/src/debug/libinput/1.21.0-r0/src/evdev.h /usr/src/debug/libinput/1.21.0-r0/src/util-list.h /usr/src/debug/libinput/1.21.0-r0/src/filter-low-dpi.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.21.0-r0/src/filter.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-wheel.c /usr/src
 /debug/libinput/1.21.0-r0/src/filter-private.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.21.0-r0/src/quirks.c /usr/src/debug/libinput/1.21.0-r0/src/libinput-versionsort.h /usr/src/debug/libinput/1.21.0-r0/src/timer.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.21.0-r0/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-debounce.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-fallback.h /usr/src/debug/libinput/1.21.0-r0/src/libinput-private.h /usr/src/debug/libinput/1.21.0-r0/src/udev-seat.c /usr/src/debug/libinput/1.21.0-r0/src/udev-seat.h /usr/src/debug/libinput/1.21.0-r0/src/util-list.c /usr/src/debug/libinput/1.21.0-r0/src/util-input-event.h /usr/src/debug/libinput/1.21.0-r0/src/timer.c /usr/src/debug/libinput/1.21.0-r0/src/libinput.c /usr/src/debug/libinput/1.21.0-r0/src/libinput-private-config.h /usr/src/debug/li
 binput/1.21.0-r0/src/filter-flat.c /usr/src/debug/libinput/1.21.0-r0/src/util-ratelimit.h /usr/src/debug/libinput/1.21.0-r0/src/filter-touchpad.c /usr/src/debug/libinput/1.21.0-r0/src/libinput.h /usr/src/debug/libinput/1.21.0-r0/src/util-prop-parsers.c /usr/src/debug/libinput/1.21.0-r0/src/util-matrix.h /usr/src/debug/libinput/1.21.0-r0/src/libinput-private-config.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-tablet.c /usr/src/debug/libinput/1.21.0-r0/src/util-strings.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-fallback.c /usr/src/debug/libinput/1.21.0-r0/src/util-prop-parsers.h /usr/src/debug/libinput/1.21.0-r0/src/path-seat.c /usr/src/debug/libinput/1.21.0-r0/src/util-bits.h /usr/src/debug/libinput/1.21.0-r0/src/util-time.h /usr/src/debug/l
 ibinput/1.21.0-r0/src/filter-tablet.c /usr/src/debug/libinput/1.21.0-r0/src/filter-trackpoint.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.21.0-r0/src/quirks.h /usr/src/debug/libinput/1.21.0-r0/src/filter-mouse.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-totem.c /usr/src/debug/libinput/1.21.0-r0/src/builddir.h /usr/src/debug/libinput/1.21.0-r0/src/evdev-tablet.h /usr/src/debug/libinput/1.21.0-r0/src/filter.c /usr/src/debug/libinput/1.21.0-r0/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.21.0-r0/src/util-ratelimit.c /usr/src/debug/libinput/1.21.0-r0/src/evdev-middle-button.c /usr/src/debug/libinput/1.21.0-r0/src/util-strings.c", added "/usr/src/debug/libinput/1.22.0-r0/src/filter-trackpoint.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-totem.c /usr/src/debug/libinput/1.22.0-r0/src/filter-low-dpi.c /usr/src/debug/libinput/1.22.0-r0/src/libinput-private.h /usr/src/debug
 /libinput/1.22.0-r0/src/evdev-fallback.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad-gestures.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-tablet-pad.h /usr/src/debug/libinput/1.22.0-r0/src/filter-touchpad.c /usr/src/debug/libinput/1.22.0-r0/src/util-ratelimit.h /usr/src/debug/libinput/1.22.0-r0/src/filter-trackpoint-flat.c /usr/src/debug/libinput/1.22.0-r0/src/util-strings.c /usr/src/debug/libinput/1.22.0-r0/src/quirks.h /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad-thumb.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-tablet.h /usr/src/debug/libinput/1.22.0-r0/src/libinput-private-config.h /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad-tap.c /usr/src/debug/libinput/1.22.0-r0/src/filter-touchpad-x230.c /usr/src/debug/libinput/1.22.0-r0/src/filter-tablet.c /usr/src/debug/libinput/1.22.0-r0/src/filter-mouse.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-fallback.h /usr/src/debug/libinput/1.22.0-r0/
 src/filter-private.h /usr/src/debug/libinput/1.22.0-r0/src/libinput-private-config.c /usr/src/debug/libinput/1.22.0-r0/src/util-prop-parsers.c /usr/src/debug/libinput/1.22.0-r0/src/util-prop-parsers.h /usr/src/debug/libinput/1.22.0-r0/src/util-time.h /usr/src/debug/libinput/1.22.0-r0/src/libinput.h /usr/src/debug/libinput/1.22.0-r0/src/filter-touchpad-flat.c /usr/src/debug/libinput/1.22.0-r0/src/filter.h /usr/src/debug/libinput/1.22.0-r0/src/timer.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-debounce.c /usr/src/debug/libinput/1.22.0-r0/src/util-strings.h /usr/src/debug/libinput/1.22.0-r0/src/udev-seat.h /usr/src/debug/libinput/1.22.0-r0/src/quirks.c /usr/src/debug/libinput/1.22.0-r0/src/timer.h /usr/src/debug/libinput/1.22.0-r0/src/evdev-wheel.c /usr/src/debug/libinput/1.22.0-r0/src/libinput.c /usr/src/debug/libinput/1.22.0-r0/src/evdev.c /usr/src/debug/libinput/1.22.0-r0/src/udev-seat.c /usr/src/debug/libinput/1.22.0-r0/src/util-input-event.h /usr/src/debug/libinput/1.22.0-r0/src/
 util-list.h /usr/src/debug/libinput/1.22.0-r0/src/util-matrix.h /usr/src/debug/libinput/1.22.0-r0/src/util-ratelimit.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad.h /usr/src/debug/libinput/1.22.0-r0/src/evdev-middle-button.c /usr/src/debug/libinput/1.22.0-r0/src/libinput-versionsort.h /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad-buttons.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-tablet-pad-leds.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-tablet-pad.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-tablet.c /usr/src/debug/libinput/1.22.0-r0/src/evdev-mt-touchpad-edge-scroll.c /usr/src/debug/libinput/1.22.0-r0/src/builddir.h /usr/src/debug/libinput/1.22.0-r0/src/filter-flat.c /usr/src/debug/libinput/1.22.0-r0/src/util-bits.h /usr/src/debug/libinput/1.22.0-r0/src/path-seat.c /usr/src/debug/libinput/1.22.0-r0/src/evdev.h /usr/src/debug/libinput/1.22.0-r0/src/util-list.c /usr/src/debug/libinput/1.22.0-r0/src/filter.c"
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3443253 to 3447987 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.21.0 [default] to 1.22.0 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.21.0" to "1.22.0"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1221885 to 1218498 (-0%)
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.21.0 [default] to 1.22.0 [default]

--===============3249599435365975096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.21.0-1.22.0.patch"

RnJvbSA3NGRiMGI5Y2Q3MGMyNzg1NzMxYjNkMjU4YWZhODQ0MzY1Y2M4OWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMjo0OToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjEuMCAtPiAxLjIyLjAKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjEuMC5iYiA9PiBsaWJpbnB1dF8xLjIyLjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjEuMC5iYiA9PiBsaWJpbnB1dF8x
LjIyLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yMi4wLmJiCmluZGV4IGNmNTliZDgx
YzUuLjVhNWZjOWYzNWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjIyLjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlucHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczti
cmEKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly9kZXRl
cm1pbmlzbS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJiYzM2MzMyOGE3MDRiM2M1
ZTBlZTJmMGZjZjA4OGRlNjdjNzA4OTc5IgorU1JDUkVWID0gImZjNTllNTc0ZTA1MGM1MDJjOWEz
YWRlZmFjZjk3YmFiZjNkMDljN2EiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBVUFNUUkVBTV9D
SEVDS19SRUdFWCA9ICJsaWJpbnB1dC0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCspIgot
LSAKMi4zMS4xCgo=

--===============3249599435365975096==--

