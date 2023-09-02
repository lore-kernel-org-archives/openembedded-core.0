Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E26FCCF995
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5720.1693650552277418459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GJxRg6u9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IQUjKHG3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a557092d2-ee875bcd-ce45-4b76-ac16-84e6e1555da9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s3UroGhmJ4xGKI08kWjdpREKFJ20nCsN+ieN9gnDeos=;
	b=GJxRg6u946sSopTgZ+ORXcLPD89csgXrdoMFOifjV52RM+JL4qS76ZxDfbvp76tx
	yJJmDfKtE2fJkFSdomUSO9nVUpTuqJJRgM7FDPerJNXvL6j13BnFsGT32SqJg1IXcP7
	nl9PTfqK4RrQPbdUeqIicRb5gvt2J/T2ibtckur8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s3UroGhmJ4xGKI08kWjdpREKFJ20nCsN+ieN9gnDeos=;
	b=IQUjKHG31YxRoxR4DxrrZ05IO/NOpYiYR7Kv+t6tNQIr8Ih1Wd+6QK8huljndHqd
	xAbOPKsr6UZ3+pz47+SiUxssPQY8nNpK7yZbO+jm2To6Q1iW2xUcPruu7RwjdYKBmKy
	EaKwMVOq1Aip09kh/ad8Eqbw04eof+OUlu+pmgKo=
Content-Type: multipart/mixed; boundary="===============2922318817602889169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 12.0.2 SUCCEEDED
Message-ID: <0101018a557092d2-ee875bcd-ce45-4b76-ac16-84e6e1555da9-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187133

--===============2922318817602889169==
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
From e31320216f3dd52da9b3a2e566527cf919fc1849 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 02:35:41 +0000
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


--===============2922318817602889169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-12.0.1-12.0.2.patch"

RnJvbSBlMzEzMjAyMTZmM2RkNTJkYTliM2EyZTU2NjUyN2NmOTE5ZmMxODQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMjozNTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMi4wLjEgLT4gMTIuMC4yCgotLS0KIC4uLi93YXlsYW5kL3t3ZXN0b25f
MTIuMC4xLmJiID0+IHdlc3Rvbl8xMi4wLjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTIuMC4xLmJiID0+IHdlc3Rvbl8xMi4wLjIu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2Vz
dG9uXzEyLjAuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMi4w
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2VzdG9uXzEyLjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2VzdG9uXzEyLjAuMi5iYgppbmRleCBkOWVhZTFmZjYyLi5lY2QxZjA3MjU5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTIuMC4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMi4wLjIuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvd2F5bGFuZC93ZXN0b24vLS9yZWxlYXNlcy8ke1BWfS9kb3dubG8KICAgICAgICAgICAgZmls
ZTovL3N5c3RlbWQtbm90aWZ5Lndlc3Rvbi1zdGFydCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImIxODU5MWVhYjI3OGJjMTkxNzIwZjZjMDkxNTgwNDBiNzk1ZTcxMThh
ZjFkNWRkY2E2YWNkOWE4ZTIwMzk1MzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWI2ODZhN2Nm
MDA5OTJhMjNiMTdmMTkyZmNhOWE4ODczMTNlOTJjMzQ2ZWUzNWQ4NTc1MTk2OTgzZDY1NmI0YSIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd2F5bGFuZC5mcmVlZGVza3RvcC5vcmcv
cmVsZWFzZXMuaHRtbCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIndlc3Rvbi0oP1A8cHZlcj5c
ZCtcLlxkK1wuKD8hOVxkKylcZCspIgotLSAKMi4zOS4yCgo=

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-4e3e775c7a238e48fec258c031f3094b1928a2ad"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e3e775c7a238e48fec258c031f3094b1928a2ad"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 194 Local 92 Mirrors 0 Missed 102 Current 877 (47% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 921 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 943 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 980 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1001 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1067 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1068 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.2612365
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1069 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running task 1918 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2030 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 2137 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2161 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2182 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: Running task 2259 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2269 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2300 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2301 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2318 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2319 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2345 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2357 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2358 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2393 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2419 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2428 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2445 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2454 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: Running task 2525 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2566 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 2567 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: Running task 2611 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 2612 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2613 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2614 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: Running task 2615 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: Running task 2616 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2617 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 2618 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 2619 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2620 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2621 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 2622 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2623 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2624 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: Running task 2625 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2626 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2627 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 2628 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2629 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 2630 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2631 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2632 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2633 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: Running task 2634 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: Running task 2635 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 2636 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2637 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2638 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2639 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2640 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2641 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: Running task 2642 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2643 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1071 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: Running task 2645 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 2646 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: Running task 2647 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2648 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2649 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2650 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2651 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 2652 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: Running task 2653 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2654 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 2655 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2656 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 2657 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2658 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: Running task 2659 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2660 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2661 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: Running task 2662 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2664 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2665 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2673 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2680 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: Running task 2681 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: Running task 2683 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: Running task 2685 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2686 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: Running task 2687 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: Running task 2688 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2689 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: Running task 2690 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: Running task 2691 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2692 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2693 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: Running task 2694 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2695 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2696 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 2697 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2698 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 2699 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2700 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2701 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 2702 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2703 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: Running task 2704 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: Running task 2705 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2707 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2708 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: Running task 2709 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2711 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2712 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 74f8ea1812b11d9aae9b43bcacb255e7efac44ae953a7dac335fb4e5b883c56e
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2713 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2714 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2716 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2717 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Running task 2738 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2749 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2756 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Setscene tasks completed
NOTE: Running task 2760 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2762 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2765 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: Running task 2766 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2769 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2770 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2771 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2772 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2773 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: Running task 2775 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2776 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2777 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2778 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2779 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2780 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2781 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2783 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2784 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2785 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2786 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2787 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2789 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2790 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2791 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2792 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2793 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2794 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: Running task 2795 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_compile)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_compile)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Started
NOTE: Running task 2797 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2798 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: Running task 2799 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2800 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_compile: Succeeded
NOTE: Running task 2801 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_install: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2801 tasks of which 2649 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/seatd/0.7.0/temp/log.do_packagedata.2652479
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/weston: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.1/downloads/weston-12.0.1.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.2/downloads/weston-12.0.2.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-32-poky-linux/weston: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/libweston-12: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/libweston-12: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/libweston-12: FILELIST: removed "/usr/lib/libweston-12.so.0.0.1", added "/usr/lib/libweston-12.so.0.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-12.so.0 changed symlink target from libweston-12.so.0.0.1 to libweston-12.so.0.0.2
  /usr/lib/libweston-12.so.0.0.1 moved to /usr/lib/libweston-12.so.0.0.2
packages/core2-32-poky-linux/weston/weston-dbg: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dbg: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-dbg: PKGSIZE changed from 13569748 to 13570476 (+0%)
packages/core2-32-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-12.so.0.0.1", added "/usr/lib/.debug/libweston-12.so.0.0.2"
packages/core2-32-poky-linux/weston/weston-dev: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dev: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-doc: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-doc: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-doc: PKGSIZE changed from 54880 to 54884 (+0%)
packages/core2-32-poky-linux/weston/weston-examples: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-examples: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-locale: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-locale: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-src: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-src: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-src: PKGSIZE changed from 4955096 to 4956812 (+0%)
packages/core2-32-poky-linux/weston/weston-staticdev: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-staticdev: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston-xwayland: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston-xwayland: PV changed from "12.0.1" to "12.0.2"
packages/core2-32-poky-linux/weston/weston: PKGV changed from 12.0.1 [default] to 12.0.2 [default]
packages/core2-32-poky-linux/weston/weston: PV changed from "12.0.1" to "12.0.2"

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-4e3e775c7a238e48fec258c031f3094b1928a2ad"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e3e775c7a238e48fec258c031f3094b1928a2ad"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 663 Local 555 Mirrors 0 Missed 108 Current 375 (83% match, 89% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 9 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 410 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 465 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 565 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1044 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 1053 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa)
NOTE: Running task 1078 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 1098 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 1102 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1122 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1123 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 1148 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1149 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 1152 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 1153 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 1154 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 1155 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 1156 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1161 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1167 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 1169 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 1172 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 1173 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: Running task 1191 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: Running task 1207 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: Running task 1208 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 567 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Started
NOTE: Running setscene task 572 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.14/temp/log.do_packagedata_setscene.2684916
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 577 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa unihash changed to cb75665705b8f8060bedca8835fd36b3d7c2e67734e30cf950105d412a086197
NOTE: Running setscene task 557 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 556 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 559 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 596 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1243 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1244 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_fetch)
NOTE: Running task 1245 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1246 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: Running task 1247 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1248 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1249 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1250 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1251 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: Running task 1252 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: Running task 1254 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1255 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: Running task 1256 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: Running task 1257 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: Running task 1259 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: Running task 1261 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 1262 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: Running task 1263 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: Running setscene task 639 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: Running task 1265 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1266 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1268 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1269 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1270 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1285 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1288 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1295 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_unpack)
NOTE: Running task 1298 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1302 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1307 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1313 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 1316 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 646 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running task 1343 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1344 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 1345 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 1349 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: Running task 1354 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1355 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_patch)
NOTE: Running task 1362 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 1363 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: Running setscene task 666 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running task 1364 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1365 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 1366 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 668 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1367 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1368 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1369 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 1370 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 1371 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1372 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 670 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Started
NOTE: Running setscene task 671 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 1373 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1374 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: Running task 1376 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: Running task 1383 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1384 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1390 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1393 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: Running task 1394 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1397 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: Running task 1404 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 679 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 680 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1405 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1409 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1410 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch unihash changed to 14e5f99e8c63ce2bdaa7247b9639e15489ee98e9534c4d62199cb8add6b26e22
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running setscene task 669 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: Running task 1413 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_configure)
NOTE: Running task 1414 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: Running task 1415 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1416 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: Running task 1417 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 692 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 1418 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 74f8ea1812b11d9aae9b43bcacb255e7efac44ae953a7dac335fb4e5b883c56e
NOTE: Running task 1419 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1420 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1431 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 695 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 703 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 709 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 712 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1450 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 801 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 804 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 827 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 834 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running setscene task 872 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1631 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: Running setscene task 877 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1642 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 900 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 906 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running task 1643 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Succeeded
NOTE: Running setscene task 934 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 938 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 945 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 955 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1669 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_install)
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 975 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Succeeded
NOTE: Running setscene task 979 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1742 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1763 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_package)
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot unihash changed to 429e55ee9c32401bef49ea894b6ed250fd208279598cf1a64309b0e2ff80b348
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 996 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1010 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Succeeded
NOTE: Running task 1793 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1801 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1031 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1038 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2402 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2421 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2425 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2457 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2458 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2531 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2571 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2596 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2616 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2625 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2628 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2629 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: Running task 2643 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2656 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2658 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: Running task 2662 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2664 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2666 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Running task 2667 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2668 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2669 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2670 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2672 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2673 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2674 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e674b5c93ffaaba6f218d1060d51b2e2023bdc01969167a5eb944c404805895
NOTE: Running task 2675 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2676 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2677 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2678 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2679 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: Running task 2680 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2681 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2682 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2683 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2684 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2685 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2686 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2687 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: Running task 2688 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2689 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2690 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2691 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2692 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2693 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2694 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2695 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2696 of 2796 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2696 tasks of which 2536 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/seatd/0.7.0/temp/log.do_packagedata.2727947
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-4e3e775c7a238e48fec258c031f3094b1928a2ad"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e3e775c7a238e48fec258c031f3094b1928a2ad"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 193 Local 91 Mirrors 0 Missed 102 Current 872 (47% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 916 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 938 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 975 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1061 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1062 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.2473903
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1063 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: Running task 1908 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2021 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2124 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 2148 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2169 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: Running task 2250 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2256 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2287 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2289 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2305 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2306 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running task 2332 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2343 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2344 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2378 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2404 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2413 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 2430 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2439 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2510 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2549 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: Running task 2550 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 2594 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 2595 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: Running task 2596 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2597 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2598 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 2599 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 2600 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2601 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 2602 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2603 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: Running task 2604 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2605 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: Running task 2606 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2607 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: Running task 2608 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2609 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: Running task 2610 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2611 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2612 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2613 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: Running task 2614 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2615 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2616 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: Running task 2617 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 2618 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2619 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: Running task 2620 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2621 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: Running task 2622 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2623 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: Running task 2624 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2625 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: Running task 2626 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2627 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running setscene task 1065 of 1065 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: Running task 2629 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2630 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: Running task 2631 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2632 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2633 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: Running task 2634 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2635 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 2636 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 2637 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2638 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2639 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: Running task 2640 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2641 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 2642 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: Running task 2643 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2644 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2645 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 2646 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2660 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2661 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: Running task 2663 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: Running task 2665 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2667 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2668 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2669 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2670 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2672 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: Running task 2673 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2674 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2675 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2676 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2677 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2679 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2680 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: Running task 2681 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: Running task 2682 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: Running task 2683 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2684 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2685 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2686 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2687 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: Running task 2688 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 2689 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 2690 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2692 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2693 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2694 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 74f8ea1812b11d9aae9b43bcacb255e7efac44ae953a7dac335fb4e5b883c56e
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: Running task 2696 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2697 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: Running task 2698 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2699 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2721 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2731 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2738 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2742 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2744 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2747 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2749 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: Running task 2751 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2752 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2753 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2754 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2755 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2756 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2757 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2758 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2759 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2760 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2761 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2762 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2763 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2764 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2765 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2766 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2767 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2768 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2769 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2770 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2771 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2772 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2773 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2774 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2775 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2776 of 2871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2776 tasks of which 2632 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/seatd/0.7.0/temp/log.do_packagedata.2506952
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-4e3e775c7a238e48fec258c031f3094b1928a2ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e3e775c7a238e48fec258c031f3094b1928a2ad"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 184 Local 82 Mirrors 0 Missed 102 Current 895 (44% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 932 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 954 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 991 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1074 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1076 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.14/temp/log.do_packagedata_setscene.2303776
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1077 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 1919 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2035 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2145 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2169 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2190 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2280 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: Running task 2289 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2320 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2321 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2338 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2339 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2365 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2376 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: Running task 2377 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2413 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 2439 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2448 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: Running task 2463 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2475 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: Running task 2545 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: Running task 2587 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: Running task 2588 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: Running task 2635 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 2636 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2637 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 2638 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2639 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2640 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 2641 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2642 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2643 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2644 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2645 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: Running task 2646 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 2647 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running setscene task 1079 of 1079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: Running task 2649 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 2650 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2651 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2652 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: Running task 2653 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: Running task 2654 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: Running task 2655 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2656 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2657 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 2658 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 2659 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 2660 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2661 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2662 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: Running task 2663 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2664 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: Running task 2665 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2666 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2667 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: Running task 2668 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2669 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: Running task 2670 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 2671 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: Running task 2672 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2673 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2674 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: Running task 2682 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2689 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2692 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2693 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running task 2694 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2695 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2696 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: Running task 2697 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2698 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 2699 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: Running task 2700 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 2701 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 2702 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2703 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2704 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: Running task 2705 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2706 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: Running task 2707 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2708 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: Running task 2709 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2710 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2711 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: Running task 2712 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2713 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2714 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2715 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2716 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: Running task 2717 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2718 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2719 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2720 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2721 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2723 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2724 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: Running task 2725 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2726 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2727 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2728 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2729 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2730 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2731 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2732 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2733 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2734 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2735 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2736 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 74f8ea1812b11d9aae9b43bcacb255e7efac44ae953a7dac335fb4e5b883c56e
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2737 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2739 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2740 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2762 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2772 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2779 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2780 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Setscene tasks completed
NOTE: Running task 2784 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2788 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: Running task 2791 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: Running task 2793 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2794 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2795 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2797 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2798 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2799 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2800 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2801 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2802 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2803 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2804 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2805 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2806 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2808 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2809 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2810 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2811 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2812 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2813 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2814 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2815 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2816 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: Running task 2817 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2818 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2819 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: Running task 2820 of 2912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2820 tasks of which 2673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/seatd/0.7.0/temp/log.do_packagedata.2342538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-4e3e775c7a238e48fec258c031f3094b1928a2ad"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e3e775c7a238e48fec258c031f3094b1928a2ad"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 194 Local 92 Mirrors 0 Missed 102 Current 877 (47% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 921 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 943 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 980 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1001 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1067 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1068 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.14/temp/log.do_packagedata_setscene.2409307
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1069 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_package_setscene)
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Started
NOTE: Running task 1918 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Started
NOTE: Running task 2030 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_recipe_qa)
NOTE: Running task 2137 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa)
NOTE: Running task 2161 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2182 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2259 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 2269 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: Running task 2300 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 2301 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: Running task 2318 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa)
NOTE: Running task 2319 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa)
NOTE: Running task 2345 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_recipe_qa)
NOTE: Running task 2356 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa)
NOTE: Running task 2358 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2393 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 2419 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_recipe_qa)
NOTE: Running task 2428 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: Running task 2445 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 2455 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: Running task 2525 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: Running task 2566 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Started
NOTE: Running task 2567 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_recipe_qa)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Started
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2611 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Started
NOTE: recipe weston-12.0.2-r0: task do_write_config: Started
NOTE: Running task 2612 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 2613 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_fetch)
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2614 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_fetch)
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2615 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2616 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2617 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_write_config: Succeeded
NOTE: Running task 2618 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2619 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_fetch)
NOTE: Running task 2620 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_fetch)
NOTE: recipe xwayland-23.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_package_setscene: Succeeded
NOTE: Running task 2621 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_fetch)
NOTE: Running task 2622 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: Running setscene task 1071 of 1071 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running task 2624 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe weston-12.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2625 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 2626 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_fetch)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2627 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_unpack)
NOTE: Running task 2628 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2629 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 2630 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2631 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 2632 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: Running task 2633 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: Running task 2634 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 2635 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2636 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_unpack)
NOTE: Running task 2637 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.1.2-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2638 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_unpack)
NOTE: Running task 2639 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2640 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_unpack)
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2641 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2642 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Started
NOTE: Running task 2643 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2644 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Started
NOTE: recipe weston-12.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe kbd-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2645 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 2646 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: Running task 2647 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_unpack)
NOTE: Running task 2648 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Started
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Started
NOTE: Running task 2652 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2657 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2664 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 2666 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_patch)
NOTE: Running task 2667 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2668 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: Running task 2670 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2671 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_patch)
NOTE: Running task 2672 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 2673 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2674 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2675 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2676 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_patch)
NOTE: Running task 2677 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Started
NOTE: Running task 2678 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2679 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running task 2680 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_patch)
NOTE: recipe xwayland-23.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: Running task 2681 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_patch)
NOTE: recipe xcb-util-0.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2682 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2683 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe kbd-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2684 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_patch)
NOTE: Running task 2685 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: Running task 2687 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Started
NOTE: Running task 2688 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Started
NOTE: Running task 2689 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2690 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2691 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2692 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_patch)
NOTE: recipe kbd-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.1.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.6.1-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2693 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 2694 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2695 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: Running task 2696 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.14-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_patch: Started
NOTE: Running task 2698 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2699 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: Running task 2700 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-12.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2701 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2702 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2703 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2704 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic)
NOTE: recipe xcb-util-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 2705 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_configure)
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2706 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2707 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2708 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2709 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Started
NOTE: Running task 2711 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Started
NOTE: recipe kbd-2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2712 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.6.1.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-12.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-12.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.2.bb:do_populate_lic unihash changed to 74f8ea1812b11d9aae9b43bcacb255e7efac44ae953a7dac335fb4e5b883c56e
NOTE: recipe kbd-2.6.1-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2713 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2715 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_setscene: Succeeded
NOTE: Running task 2716 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 2737 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2748 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2755 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package_write_rpm)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2759 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2761 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2764 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: Running task 2765 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2768 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2769 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2770 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2771 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2772 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2773 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2775 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2776 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2777 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2778 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2779 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2780 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2781 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2783 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2784 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: Running task 2785 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2786 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2787 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: Running task 2789 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2790 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2791 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2792 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2793 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: Running task 2794 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2795 of 2888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Failed
NOTE: recipe xcb-util-0.4.1-r0: task do_configure: Succeeded
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: recipe kbd-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2795 tasks of which 2649 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/seatd/0.7.0/temp/log.do_packagedata.2446031
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata) failed with exit code '1'

--===============2922318817602889169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/weston/libweston-12: FILELIST: removed "/usr/lib/libweston-12.so.0.0.1", added "/usr/lib/libweston-12.so.0.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-12.so.0 changed symlink target from libweston-12.so.0.0.1 to libweston-12.so.0.0.2
  /usr/lib/libweston-12.so.0.0.1 moved to /usr/lib/libweston-12.so.0.0.2

--===============2922318817602889169==--

