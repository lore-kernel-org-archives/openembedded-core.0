Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D852EC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13446.1713248040139167736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Aba9Aak2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FUaIM5Ho;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58aa0a5-d13431b4-b956-4e0c-876f-d243977fcb75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M6cyehKGxuyJeDog6H3rRtbOT/jwQs7b7nbh/dYazGU=;
	b=Aba9Aak2JzuW4/YC5JWN8yV8arHHA8oXvO43NtrrlGO8PMo6UCivEyYLdIGqKwwl
	aImvyly0rsiRrYNSgOmnS4LEMrY6Xzoa41zwFtek9ZHS8s8Y5pVFqqnzguI3NQxtXao
	MgQSlXRDXcaCR2v52iDst3/9IeTxPWiFt8iRJhvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M6cyehKGxuyJeDog6H3rRtbOT/jwQs7b7nbh/dYazGU=;
	b=FUaIM5Ho6pvc9jY/nwJDtS6wh3sbBV1/m0+MY7giwuoO58B30lBlMTFw0XiHlios
	EfUwHfRdFmMuKRoIGr7PREtlblDrq7XY/obNC7YFHQtxF5eU7hKkwtUdRMF8ctffJBv
	OoirwbZ6Hi8YrKhdxfFYkvaHEwVPLV8cSG0AvKqI=
Content-Type: multipart/mixed; boundary="===============6266320212124854874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.24.2 FAILED
Message-ID: <0101018ee58aa0a5-d13431b4-b956-4e0c-876f-d243977fcb75-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198405

--===============6266320212124854874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.24.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.11-1.24.2.patch
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
From a9029bc47f2b21e21d978239516e3d9dd2edc0e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 01:58:09 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.22.11 -> 1.24.2

---
 ...treamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.24.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb
index 87eb8484a1..660a55af35 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6eae1360658302b9b512fa46b4d06f5b818dfce5f2f43d7d710ca8142719d8ad"
+SRC_URI[sha256sum] = "cc5ab8c88443e0f5bf23d6110b4aac33df59e4ae626f536d968b1605cc7b962f"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.42.0


--===============6266320212124854874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.11-1.24.2.patch"

RnJvbSBhOTAyOWJjNDdmMmIyMWUyMWQ5NzgyMzk1MTZlM2Q5ZGQyZWRjMGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDE6NTg6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjI0LjIKCi0tLQogLi4udHJl
YW1lcjEuMC12YWFwaV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC12YWFwaV8xLjI0LjIuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMi4xMS5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yNC4yLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
dmFhcGlfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtdmFhcGlfMS4yNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4y
Mi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC12YWFwaV8xLjI0LjIuYmIKaW5kZXggODdlYjg0ODRhMS4uNjYwYTU1YWYzNSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12
YWFwaV8xLjIyLjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtdmFhcGlfMS4yNC4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjLyR7UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNmVhZTEzNjA2NTgzMDJiOWI1MTJmYTQ2YjRkMDZmNWI4MThkZmNlNWYyZjQzZDdkNzEw
Y2E4MTQyNzE5ZDhhZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYzVhYjhjODg0NDNlMGY1YmYy
M2Q2MTEwYjRhYWMzM2RmNTllNGFlNjI2ZjUzNmQ5NjhiMTYwNWNjN2I5NjJmIgogCiBTID0gIiR7
V09SS0RJUn0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAg
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoy
LjQyLjAKCg==

--===============6266320212124854874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-341bcd40273bd28761b0c6cceb22ac33b0e5b92b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:341bcd40273bd28761b0c6cceb22ac33b0e5b92b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 450 Local 437 Mirrors 0 Missed 13 Current 771 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3046 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_recipe_qa)
NOTE: Running task 3179 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3350 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_fetch: Succeeded
NOTE: Running task 3351 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_unpack)
NOTE: Running task 3352 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_unpack: Succeeded
NOTE: Running task 3353 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_patch)
NOTE: Running task 3354 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_patch: Succeeded
NOTE: Running task 3355 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3356 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3357 of 3369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot', '/home/po
 kybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/met
 a/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'cracklib', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libva', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', '
 libxext', 'libxfixes', 'libxft', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'libvorbis', 'sbc', 'libwebp', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native
 ', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddoc=disabled -Dexamples=disabled -Dtests=enabled -Ddrm=enabled -Degl=disabled -Dencoders=enabled -Dglx=enabled -Dwayland=enabled -Dx11=enabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/gstreamer-vaapi-1.24.2
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/build
| Build type: cross build
| Project name: gstreamer-vaapi
| Project version: 1.24.2
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Library m found: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gstreamer-vaapi-1.24.2/meson.build:47:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311, line 170
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311, line 159
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311, line 183
NOTE: recipe gstreamer1.0-vaapi-1.24.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3357 tasks of which 3347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416015748.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416015748.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-vaapi-1.24.2-r0 do_configure: meson failed
ERROR: gstreamer1.0-vaapi-1.24.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/run.do_configure.2235311', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.24.2/temp/log.do_configure.2235311
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.2.bb:do_configure) failed with exit code '1'

--===============6266320212124854874==--

