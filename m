Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB2C64EBC
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.173805.1692224344374195908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S0AmIQkS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XSfEz3DV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e6b2e-d2c7cea4-3a06-44c8-b910-f9e3e08de253-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/qjqUR+ihjbeV2E0k55cu+XhHAv010By3mz/VRhh3JY=;
	b=S0AmIQkSw5S7+F4yzaoRmeXMWotquUqnjEEhUSwV6GYeKtA50Tv9CBHyJiprebVg
	DzB055Fuht1BWScEdQj7alplRGMv75/rPRtohCaoixvKwOAz6ylo3ksVBgYKfSPSYZH
	BdT6Ac0iBX+a2PfB4Bd8MpLkQKtE89inG3aPdSJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/qjqUR+ihjbeV2E0k55cu+XhHAv010By3mz/VRhh3JY=;
	b=XSfEz3DVBJznpbZgW1qdU+gbUgmgBDdOcpqMp9NzVKqMmn1Q5XLXzm3Yjbr8dUav
	Hr87tNR6+4ZbyViXk6205/kUpejMIc4Vj0Jj1fs2N1ozdrYuC55b3ifM9HW4JEMANVq
	AVWFV2o1DrFxRPXmqqAN9ZBHSqeYmawR6bj1+1xI=
Content-Type: multipart/mixed; boundary="===============3602206529858879748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 12.0.2 SUCCEEDED
Message-ID: <0101018a006e6b2e-d2c7cea4-3a06-44c8-b910-f9e3e08de253-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186234

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *12.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-12.0.1-12.0.2.patch
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
From c2aaefb775b2cf3154e789b23adac05b14a950f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 16:13:17 +0000
Subject: [PATCH] weston: upgrade 12.0.1 -> 12.0.2

---
 .../wayland/{weston_12.0.1.bb => weston_12.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.1.bb => weston_12.0.2.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.2.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_12.0.1.bb
rename to meta/recipes-graphics/wayland/weston_12.0.2.bb
index d9eae1ff62..ecd1f07259 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535"
+SRC_URI[sha256sum] = "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8575196983d656b4a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.39.2


--===============3602206529858879748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-12.0.1-12.0.2.patch"

RnJvbSBjMmFhZWZiNzc1YjJjZjMxNTRlNzg5YjIzYWRhYzA1YjE0YTk1MGYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTY6MTM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTIuMC4xIC0+IDEyLjAuMgoKLS0tCiAuLi4vd2F5bGFuZC97d2VzdG9u
XzEyLjAuMS5iYiA9PiB3ZXN0b25fMTIuMC4yLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEyLjAuMS5iYiA9PiB3ZXN0b25fMTIuMC4y
LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dl
c3Rvbl8xMi4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTIu
MC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMi4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMi4wLjIuYmIKaW5kZXggZDllYWUxZmY2Mi4uZWNkMWYwNzI1
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEyLjAu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTIuMC4yLmJi
CkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZp
bGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiMTg1OTFlYWIyNzhiYzE5MTcyMGY2YzA5MTU4MDQwYjc5NWU3MTE4
YWYxZDVkZGNhNmFjZDlhOGUyMDM5NTM1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImViNjg2YTdj
ZjAwOTkyYTIzYjE3ZjE5MmZjYTlhODg3MzEzZTkyYzM0NmVlMzVkODU3NTE5Njk4M2Q2NTZiNGEi
CiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3dheWxhbmQuZnJlZWRlc2t0b3Aub3Jn
L3JlbGVhc2VzLmh0bWwiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ3ZXN0b24tKD9QPHB2ZXI+
XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuMzkuMgoK

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-32 sysroot...done.
Removing 102 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a335be40dc3856d1de7e2afbc3b2c70f93dd6305"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 661 Local 545 Mirrors 0 Missed 116 Current 377 (82% match, 88% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86...done.
Removing 9 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 378 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1001 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 567 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 568 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1045 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 1046 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 1055 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1080 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 1099 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 1104 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1124 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1125 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 1150 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1151 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 1154 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 1155 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 1156 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 1157 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1158 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 1163 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1169 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 1171 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 1174 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 1175 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: Running task 1193 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: Running task 1209 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: Running task 1210 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 571 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 572 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 574 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.14/temp/log.do_packagedata_setscene.837830
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 582 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa unihash changed to cb75665705b8f8060bedca8835fd36b3d7c2e67734e30cf950105d412a086197
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 556 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1245 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1246 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_fetch)
NOTE: Running task 1247 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1250 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 1251 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1252 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1253 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: Running task 1254 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1255 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1256 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1257 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1258 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: Running task 1259 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 1260 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: Running task 1261 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: Running task 1262 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: Running task 1263 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 1264 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: Running task 1265 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running setscene task 636 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1268 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1269 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1270 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_unpack)
NOTE: Running task 1271 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 1272 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1277 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1279 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1281 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 1297 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 1300 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1306 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1309 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 1313 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1318 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1320 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 1321 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 1335 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 644 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 646 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1351 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running setscene task 649 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running task 1352 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: Running setscene task 664 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 667 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1353 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 670 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 1354 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1355 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_patch)
NOTE: Running task 1356 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 1358 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 1359 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 1360 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: Running task 1362 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1363 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 1364 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 1365 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 1375 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1386 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1392 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running setscene task 675 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1395 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: Running task 1403 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: Running task 1406 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1409 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1410 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: Running task 1411 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 687 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1412 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1419 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1420 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1421 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 697 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch unihash changed to e1d5a05909df75136731e98e608b6614b7e5bdd1d70181b61b71323e9911d565
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: Running setscene task 680 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 698 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 699 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1424 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1430 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1431 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1432 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1433 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 708 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 8386bd4c227c1a70ed91e804afb54b9ee178f2b2b89e43d6d6de526ad9f1a8e7
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1450 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1451 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: Running task 1452 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 720 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 725 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 731 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 740 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 750 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 756 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 758 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 818 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 820 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 869 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 902 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 924 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 936 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 951 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 952 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 961 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 967 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 975 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1765 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_compile)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1776 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_install)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Succeeded
NOTE: Running task 1798 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot)
NOTE: Running task 1799 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot unihash changed to e4c84c884acbb7ca9c7dd1676380abe84dc158504c321cf8a0b683bc0c82cca6
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1031 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2359 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2410 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2414 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2446 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2448 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2479 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2517 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2581 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2601 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2602 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2606 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2612 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 2614 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2624 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2625 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2636 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2637 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2638 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2639 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Running task 2640 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2641 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2642 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: Running task 2650 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 2651 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: Running task 2652 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2655 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2656 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2657 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: Running task 2658 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2659 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: Running task 2660 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2661 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2662 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx)
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2663 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: Running task 2664 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2665 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2666 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2667 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2668 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2669 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2670 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2671 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2672 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2673 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: Running task 2674 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2675 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2676 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2677 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2678 tasks of which 2520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-src went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dbg went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-staticdev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-doc went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-locale went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/seatd/0.7.0/temp/log.do_packagedata.874665
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a335be40dc3856d1de7e2afbc3b2c70f93dd6305"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 199 Local 93 Mirrors 0 Missed 106 Current 872 (46% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 906 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 975 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1064 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1065 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.798413
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/kbd/2.6.1/temp/log.do_packagedata_setscene.798013
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1066 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_package_setscene)
NOTE: Running setscene task 1067 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: Running task 1931 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: Running task 2006 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2031 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2132 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2156 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2177 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: Running task 2246 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2252 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2283 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2285 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: Running task 2301 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2302 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2330 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2341 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: Running task 2342 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2378 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2404 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2412 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 2426 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2438 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: Running task 2507 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: Running task 2548 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2588 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 2589 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 2590 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2591 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: Running task 2592 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 2593 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: Running task 2594 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 2595 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 2596 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2597 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2598 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2599 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 2600 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 2601 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2602 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: Running task 2603 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2604 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 2605 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2606 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: Running task 2607 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 2608 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 2609 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2610 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: Running task 2611 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2612 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: Running task 2613 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2614 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2615 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2616 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2617 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running task 2618 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 2619 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2620 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 2621 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2622 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2623 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: Running task 2624 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: Running task 2625 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2626 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2627 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2628 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 2629 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2630 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2631 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2632 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2633 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 1069 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2634 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2635 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2636 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2637 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2638 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2639 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2640 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2641 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2642 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 2643 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1071 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running task 2645 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: Running task 2646 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2647 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2648 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: Running task 2649 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: Running task 2650 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2651 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2662 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2663 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2664 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: Running task 2666 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2667 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2668 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2682 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: Running task 2684 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2687 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2688 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: Running task 2689 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: Running task 2690 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2691 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2692 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: Running task 2693 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2694 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: Running task 2696 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2697 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2698 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: Running task 2699 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2701 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2702 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2703 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2704 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2705 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 8386bd4c227c1a70ed91e804afb54b9ee178f2b2b89e43d6d6de526ad9f1a8e7
NOTE: Running task 2708 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2709 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2710 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: Running task 2711 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2712 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2713 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2714 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2715 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2716 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2749 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2760 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2763 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2764 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2765 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2766 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2767 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2768 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2769 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2770 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2771 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2772 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2773 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2774 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2775 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2776 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2777 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2779 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2780 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2781 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2782 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: Running task 2784 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2785 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2786 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Succeeded
NOTE: Running task 2787 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2788 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Succeeded
NOTE: Running task 2789 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot)
NOTE: Running task 2790 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_package)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_package: Started
NOTE: Running task 2791 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2792 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Started
NOTE: Running task 2793 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: Running task 2794 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2795 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2796 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2797 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2798 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2799 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_install: Started
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2800 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2801 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: Running task 2802 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_install: Succeeded
NOTE: Running task 2803 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: Running task 2804 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot)
NOTE: Running task 2805 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2806 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2806 tasks of which 2636 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata
Summary: There were 50 ERROR messages, returning a non-zero exit code.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-src went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dbg went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-staticdev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-doc went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-locale went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/seatd/0.7.0/temp/log.do_packagedata.829527
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/weston: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.1/downloads/weston-12.0.1.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.2/downloads/weston-12.0.2.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-32-poky-linux/weston: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/libweston-12: FILELIST: removed "/usr/lib/libweston-12.so.0.0.1", added "/usr/lib/libweston-12.so.0.0.2"
packages/core2-32-poky-linux/weston/libweston-12: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/libweston-12: PV changed from "12.0.1" to "12.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-12.so.0 changed symlink target from libweston-12.so.0.0.1 to libweston-12.so.0.0.2
  /usr/lib/libweston-12.so.0.0.1 moved to /usr/lib/libweston-12.so.0.0.2
packages/core2-32-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-12.so.0.0.1", added "/usr/lib/.debug/libweston-12.so.0.0.2"
packages/core2-32-poky-linux/weston/weston-dbg: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dbg: PKGSIZE changed from 13575540 to 13576252 (+0%)
packages/core2-32-poky-linux/weston/weston-dbg: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-dev: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dev: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-doc: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-doc: PKGSIZE changed from 54880 to 54884 (+0%)
packages/core2-32-poky-linux/weston/weston-doc: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-examples: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-examples: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-locale: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-locale: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-src: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-src: PKGSIZE changed from 4955096 to 4956812 (+0%)
packages/core2-32-poky-linux/weston/weston-src: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-staticdev: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-staticdev: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-xwayland: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-xwayland: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston: PV changed from "12.0.1" to "12.0.2"

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a335be40dc3856d1de7e2afbc3b2c70f93dd6305"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 199 Local 93 Mirrors 0 Missed 106 Current 866 (46% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 900 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 927 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 969 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 990 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1058 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.1/temp/log.do_packagedata_setscene.764158
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.764257
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1060 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_package_setscene)
NOTE: Running setscene task 1061 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running task 1920 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 1996 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2019 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2119 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2143 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2164 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: Running task 2230 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2239 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2270 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2272 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: Running task 2288 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2289 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2317 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2327 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2328 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: Running task 2363 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2389 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2397 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2411 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2422 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2492 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: Running task 2531 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: Running task 2571 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 2572 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2573 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2574 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: Running task 2575 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2576 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 2577 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: Running task 2578 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2579 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2580 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: Running task 2581 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 2582 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2583 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2584 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2585 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2586 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2587 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 2588 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2589 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 2590 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 2591 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1063 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running task 2593 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: Running task 2594 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: Running task 2595 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2596 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 2597 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2598 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2599 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running task 2600 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2601 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2602 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 2603 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 2604 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2605 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2606 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2607 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2608 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2609 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2610 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2611 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2612 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2613 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: Running task 2614 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2615 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2629 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2630 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2632 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running setscene task 1065 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2633 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2634 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2636 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 2637 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2638 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: Running task 2639 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: Running task 2640 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2641 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: Running task 2642 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2643 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2644 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2645 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 2646 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2647 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2648 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2649 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: Running task 2650 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: Running task 2661 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: Running task 2662 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 2663 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2664 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: Running task 2665 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: Running task 2667 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2668 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2671 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: Running task 2672 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2674 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2675 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2676 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 2677 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2678 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: Running task 2679 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2680 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2681 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2682 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Running task 2683 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2684 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2685 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2686 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2687 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2688 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2689 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2690 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: Running task 2691 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 8386bd4c227c1a70ed91e804afb54b9ee178f2b2b89e43d6d6de526ad9f1a8e7
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2692 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2693 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2694 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2727 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2739 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2740 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: Running task 2742 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2743 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2744 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2745 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2746 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2747 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2748 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2749 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2750 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2751 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2752 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2753 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2756 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2757 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2758 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2759 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2760 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2761 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2762 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2763 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2764 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2766 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2768 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2769 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: Running task 2770 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_compile)
NOTE: Running task 2771 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2772 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2773 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_compile)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2774 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2775 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2775 tasks of which 2619 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata
Summary: There were 50 ERROR messages, returning a non-zero exit code.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-src went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dbg went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-staticdev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-doc went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-locale went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/seatd/0.7.0/temp/log.do_packagedata.792098
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a335be40dc3856d1de7e2afbc3b2c70f93dd6305"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 199 Local 93 Mirrors 0 Missed 106 Current 872 (46% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 906 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 975 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1064 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1065 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.6.1/temp/log.do_packagedata_setscene.731334
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.14/temp/log.do_packagedata_setscene.731670
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1066 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_package_setscene)
NOTE: Running setscene task 1067 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: Running task 1931 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 2006 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2029 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2132 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2156 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2177 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: Running task 2242 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2252 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2283 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2284 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2301 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2302 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2330 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2342 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2343 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: Running task 2378 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2404 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2412 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2428 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2438 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2507 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: Running task 2548 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: Running task 2588 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: Running task 2589 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 2590 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 2591 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2592 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2593 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2594 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2595 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2596 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 2597 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2598 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 2599 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: Running task 2600 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 2601 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2602 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: Running task 2603 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2604 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2605 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: Running task 2606 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 2607 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2608 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2609 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2610 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1069 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2612 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2613 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2614 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: Running task 2615 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2616 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 2617 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: Running task 2618 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2619 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2620 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running task 2621 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2622 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: Running task 2623 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2624 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2625 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: Running task 2626 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2627 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2628 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 2629 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: Running task 2630 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: Running task 2631 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2632 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1071 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2633 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: Running task 2634 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 2648 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running task 2649 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2650 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2651 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2652 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: Running task 2653 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 2655 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2656 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2657 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2658 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2659 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2660 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2661 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2663 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: Running task 2664 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2665 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2666 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: Running task 2667 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: Running task 2668 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 2673 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2680 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: Running task 2681 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2682 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2683 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2684 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2685 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2686 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2687 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2688 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2689 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2690 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2691 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2692 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2693 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2694 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2695 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2696 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2697 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2699 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2700 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2701 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: Running task 2702 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2703 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 2704 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2705 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: Running task 2706 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: Running task 2707 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2708 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 8386bd4c227c1a70ed91e804afb54b9ee178f2b2b89e43d6d6de526ad9f1a8e7
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2709 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2710 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2711 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2744 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2756 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2758 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2759 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2760 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2761 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2762 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2763 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2764 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2766 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2768 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2769 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2770 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2771 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2772 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: Running task 2773 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2775 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2776 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2777 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2778 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2779 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2780 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2781 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2782 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2784 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: Running task 2785 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_compile)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2786 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2787 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_compile)
NOTE: Running task 2789 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Succeeded
NOTE: Running task 2790 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2791 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2791 tasks of which 2636 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata
Summary: There were 50 ERROR messages, returning a non-zero exit code.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-src went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dbg went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-staticdev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-doc went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-locale went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/seatd/0.7.0/temp/log.do_packagedata.759236
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a335be40dc3856d1de7e2afbc3b2c70f93dd6305"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 198 Local 92 Mirrors 0 Missed 106 Current 881 (46% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 914 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 941 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 977 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 983 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 988 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1071 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1072 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1073 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.689600
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1074 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/kbd/2.6.1/temp/log.do_packagedata_setscene.689265
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1075 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_package_setscene)
NOTE: Running task 1935 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: Running task 2011 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2034 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Started
NOTE: Running task 2140 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running task 2164 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2185 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 2263 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2272 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2303 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2304 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: Running task 2321 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2322 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2350 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2361 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2362 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: Running task 2398 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2424 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2432 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 2446 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2458 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2527 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2569 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2612 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: Running task 2613 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 2614 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2615 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: Running task 2616 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 2617 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 2618 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2619 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2620 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2621 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: Running task 2622 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2623 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2624 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: Running task 2625 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 2626 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2627 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 2628 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2629 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 2630 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 2631 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 2632 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2633 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 2634 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: Running task 2635 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running task 2636 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: Running task 2637 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2638 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2639 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 2640 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2641 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2642 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 2643 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 2644 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: Running task 2645 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2646 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2647 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2648 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2649 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: Running task 2650 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2651 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2652 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2653 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2654 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2655 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 1077 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 2657 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2658 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2659 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 2660 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2661 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2662 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: Running task 2663 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1079 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2664 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2665 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 2666 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 2667 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2668 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2669 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 2670 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2671 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2672 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2673 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 2674 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2688 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: Running task 2689 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2692 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: Running task 2703 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_packagedata)
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: Running task 2704 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: Running task 2705 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2706 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2707 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2709 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Started
NOTE: Running task 2711 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2712 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2713 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2714 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2715 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2716 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2717 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 2718 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: Running task 2719 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2720 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2721 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 2722 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2723 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2724 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2725 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2726 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2727 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2729 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2730 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: Running task 2731 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 8386bd4c227c1a70ed91e804afb54b9ee178f2b2b89e43d6d6de526ad9f1a8e7
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: Running task 2732 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2733 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: Running task 2734 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe kbd-2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2735 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2736 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2769 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2781 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2783 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2784 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2785 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2786 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2787 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2789 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2790 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2791 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2792 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2793 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2794 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2795 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2796 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2797 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2798 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2799 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2800 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2801 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2802 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2803 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2804 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2805 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2806 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2807 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2808 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2809 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: Running task 2810 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_compile)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2811 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_compile)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2812 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2813 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2814 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_install)
NOTE: Running task 2815 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2816 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2817 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_install)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2818 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2819 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2820 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: Running task 2821 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot)
NOTE: Running task 2822 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2823 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_install: Succeeded
NOTE: Running task 2824 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: Running task 2825 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_package)
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2826 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2827 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2828 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2829 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2830 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2831 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_configure)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2832 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_package: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2832 tasks of which 2660 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata
Summary: There were 50 ERROR messages, returning a non-zero exit code.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.51.0-r0 to 0:1.50.14-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: pango-1.50.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.6.2-r0 to 0:2.6.1-r0) [version-going-backwards]
ERROR: kbd-2.6.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-src went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dbg went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-staticdev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-dev went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-doc went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd-locale went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: QA Issue: Package version for package seatd went backwards which would break package feeds (from 0:0.8.0-r0 to 0:0.7.0-r0) [version-going-backwards]
ERROR: seatd-0.7.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/seatd/0.7.0/temp/log.do_packagedata.720789
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============3602206529858879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/weston/libweston-12: FILELIST: removed "/usr/lib/libweston-12.so.0.0.1", added "/usr/lib/libweston-12.so.0.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-12.so.0 changed symlink target from libweston-12.so.0.0.1 to libweston-12.so.0.0.2
  /usr/lib/libweston-12.so.0.0.1 moved to /usr/lib/libweston-12.so.0.0.2

--===============3602206529858879748==--

