Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7353C4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 05:40:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.455.1784093993944596288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 22:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=j5/0pTc3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cKEkNJOp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f6449e741-7ef77ebc-6918-48ae-a69e-701ed47cb08f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784093993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q2VJTa7RKEgKnJUzNwHYsVci2Dq/7R449x6RsDbDeTs=;
	b=j5/0pTc39vkvu9jME4ni5SYIa8SUMXhqNkaQxwdAALhYNivJWQA45IwyrD0jSJPW
	qirOOKrVXrzgWSzRAUz2fBsYbfcQ5KYkt+pWF1vkDPFS03e0hGmYyMGMcJYiMVgpEKw
	WKPa/pzspTszgiJjzDwff+Jmb5iQ78d8wKWg/KrM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784093993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q2VJTa7RKEgKnJUzNwHYsVci2Dq/7R449x6RsDbDeTs=;
	b=cKEkNJOpJcDljtGWT/HfRxszrY2SXFBvuVCnJmURv3qcBBrHmEqgx9T5aZsba5cO
	ks7OnvdWmAaaqxPJb6W35JGuP/eA81lmjXvNlDO+EOa7mm2PW1ztTsNy1WC3YMLfYc+
	SWxQRf2CyZ3A+WlWkO7I4nrEUdYWZgjAgsNi+N2Q=
Content-Type: multipart/mixed; boundary="===============5286338060682934623=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 16.0.0 FAILED
Message-ID: <0101019f6449e741-7ef77ebc-6918-48ae-a69e-701ed47cb08f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jul 2026 05:39:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 05:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240933

--===============5286338060682934623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *16.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-15.0.1-16.0.0.patch
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
From 6dda9a0d4a98b8ffde06c091c384579bff21c157 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jul 2026 05:10:13 +0000
Subject: [PATCH] weston: upgrade 15.0.1 -> 16.0.0

---
 .../wayland/{weston_15.0.1.bb => weston_16.0.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{weston_15.0.1.bb => weston_16.0.0.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_15.0.1.bb b/meta/recipes-graphics/wayland/weston_16.0.0.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_15.0.1.bb
rename to meta/recipes-graphics/wayland/weston_16.0.0.bb
index 946e64cea5..925f0f1b0a 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_16.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f8025d8a64b791f6d"
+SRC_URI[sha256sum] = "dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543ee3e618d294ca0f7f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.47.1


--===============5286338060682934623==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-15.0.1-16.0.0.patch"

RnJvbSA2ZGRhOWEwZDRhOThiOGZmZGUwNmMwOTFjMzg0NTc5YmZmMjFjMTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSnVsIDIwMjYgMDU6MTA6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTUuMC4xIC0+IDE2LjAuMAoKLS0tCiAuLi4vd2F5bGFuZC97d2VzdG9u
XzE1LjAuMS5iYiA9PiB3ZXN0b25fMTYuMC4wLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzE1LjAuMS5iYiA9PiB3ZXN0b25fMTYuMC4w
LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dl
c3Rvbl8xNS4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTYu
MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xNS4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xNi4wLjAuYmIKaW5kZXggOTQ2ZTY0Y2VhNS4uOTI1ZjBmMWIw
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzE1LjAu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTYuMC4wLmJi
CkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZp
bGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1NTFkMDM5YmZiMGM4MzdiYTVhNGQwMjdjZGI4ZWUxNmJkZWQwZWVk
Yjc4OTgyMWY4MDI1ZDhhNjRiNzkxZjZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmYjMyZTJi
Y2NhYmRhOTU3Yjk0YThkMGVjNjA3NWFjZDE4YzcxYzg3ZWJjNTQzZWUzZTYxOGQyOTRjYTBmN2Yi
CiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
d2F5bGFuZC93ZXN0b24vLS90YWdzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMv
KD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuNDcuMQoK

--===============5286338060682934623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c2bd43b373d65d717e606cab3793b8a64facd946"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c2bd43b373d65d717e606cab3793b8a64facd946"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 821 Local 808 Mirrors 0 Missed 13 Current 746 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3173 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_recipe_qa)
NOTE: Running task 3384 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_write_config)
NOTE: recipe weston-16.0.0-r0: task do_recipe_qa: Started
NOTE: Running task 3583 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_create_recipe_spdx)
NOTE: recipe weston-16.0.0-r0: task do_write_config: Started
NOTE: recipe weston-16.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe weston-16.0.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-16.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3606 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_fetch)
NOTE: recipe weston-16.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe weston-16.0.0-r0: task do_fetch: Started
NOTE: recipe weston-16.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3607 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_unpack)
NOTE: Running task 3608 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-16.0.0-r0: task do_unpack: Started
NOTE: recipe weston-16.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-16.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 3609 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_patch)
NOTE: recipe weston-16.0.0-r0: task do_patch: Started
NOTE: recipe weston-16.0.0-r0: task do_patch: Succeeded
NOTE: Running task 3610 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3611 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_populate_lic)
NOTE: recipe weston-16.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-16.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-16.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-16.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe weston-16.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3612 of 3628 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_configure)
NOTE: recipe weston-16.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/seatd/seatd_0.9.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_259.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded
 -core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_popula
 te_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.31.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/o
 penembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-l
 ib/pixman_0.46.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipe
 s-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'seatd', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'libtirpc', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcursor', 'libxcvt', 'lib
 xdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxfont2', 'libxft', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xwayland', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'libcap-ng', 'libcap', 'libdisplay-info', 'libevdev', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-n
 ative', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'glslang-native', 'spirv-headers-native', 'spirv-tools-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dtests=false -Dsimple-clients=all -Ddemo-clients=true -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dcolor-management-lcms=false -Dperfetto=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Ddeprecated-screenshare=true -Dshell-desktop=true -Ddeprecated-shell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dshell-lua=false -Dsystemd=true -Ddeprecated-backend-drm-screencast-vaapi=false -Dbackend-vnc=false -Drenderer-vulkan=true -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/sources/weston-16.0.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/build
| Build type: cross build
| 
| ../sources/weston-16.0.0/meson.build:1:0: ERROR: Unknown option: "pipewire".
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Main binary: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/recipe-sysroot-native/usr/bin/nativepython3
| Build Options: -Dbuildtype=plain -Dprefix=/usr -Dbindir=/usr/bin -Ddatadir=/usr/share -Dincludedir=/usr/include -Dinfodir=/usr/share/info -Dlibdir=/usr/lib -Dlibexecdir=/usr/libexec -Dlocalstatedir=/var -Dmandir=/usr/share/man -Dsbindir=/usr/sbin -Dsharedstatedir=/com -Dsysconfdir=/etc -Dwrap_mode=nodownload -Dpipewire=false -Dtests=false -Dsimple-clients=all -Ddemo-clients=true -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dcolor-management-lcms=false -Dperfetto=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Ddeprecated-screenshare=true -Dshell-desktop=true -Ddeprecated-shell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dshell-lua=false -Dsystemd=true -Ddeprecated-backend-drm-screencast-vaapi=false -Dbackend-vnc=false -Drenderer-vulkan=true -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true --cross-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/
 meson.cross --native-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/meson.native
| Python system: Linux
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/sources/weston-16.0.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/build
| Build type: cross build
| 
| ../sources/weston-16.0.0/meson.build:1:0: ERROR: Unknown option: "pipewire".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123, line 183
NOTE: recipe weston-16.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3612 tasks of which 3602 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260715050956.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260715050956.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/log.do_configure.1806123
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-16.0.0-r0 do_configure: meson setup failed
ERROR: weston-16.0.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/run.do_configure.1806123' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/weston/16.0.0/temp/log.do_configure.1806123
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/weston_16.0.0.bb:do_configure) failed with exit code '1'

--===============5286338060682934623==--

