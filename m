Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80982C3DA51
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18364.1718475798373015591
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UbxWw2WH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=U5nnA9t5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23bc87-c09fd02a-f85a-43f4-b9c6-53a90d167059-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ENSyvFkEeHy9ecqdr+AQeyhYXVWUfsg7wWzsso4IxNk=;
	b=UbxWw2WHqC9yZgDHaPi8NxM9+MK7Iq1A0jDqGrusYr4Xly985CjWUTKy5ZCYLge6
	k9ssvzXk5Gr8+F1AIsAjYEwzA+AlfnOIjI2do+7LqXOvO4VIc2/haJFYGzJY6khTqgK
	dEdacCEAsL1VHHkXDYRyVfOaqmYJPTkFTA1nNkG0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ENSyvFkEeHy9ecqdr+AQeyhYXVWUfsg7wWzsso4IxNk=;
	b=U5nnA9t5N8gdq3ElwV+8HspibdhnqMY+UD6Kk34PFElWxCtFrzP1pW9xi5nE4KmD
	A8qOo68jSiS0WIpToLz4j7zLu/rugtu648bnMa1zrH7ts4jpNZ4Hw4+d0YfGJnc4jH0
	koUaD1MdjVCvlg7NX7Sx0pdr+iGkfPBoDgSB3wWw=
Content-Type: multipart/mixed; boundary="===============8152619347961957381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.21.0 FAILED
Message-ID: <010101901d23bc87-c09fd02a-f85a-43f4-b9c6-53a90d167059-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200708

--===============8152619347961957381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.21.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.20.0-2.21.0.patch
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
From 2c80c1605a53cd532db1f13a62ae25c01011b9ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 14:09:39 +0000
Subject: [PATCH] libva: upgrade 2.20.0 -> 2.21.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.20.0.bb => libva_2.21.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.21.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bced..af40d8cbba 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "9dc1a84373b656434e6a8f3ac7522bc1c959cc3434aea89d2c02092986d87016"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.21.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.21.0.bb
-- 
2.44.0


--===============8152619347961957381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.20.0-2.21.0.patch"

RnJvbSAyYzgwYzE2MDVhNTNjZDUzMmRiMWYxM2E2MmFlMjVjMDEwMTFiOWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTQ6MDk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjIwLjAgLT4gMi4yMS4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjIwLjAuYmIgPT4gbGlidmFfMi4yMS4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMjAuMC5iYiA9PiBsaWJ2
YV8yLjIxLjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDQ4NjI5MWJjZWQuLmFmNDBkOGNiYmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3MmJkYjRmNDhkZmU3MWFkMDFm
MWNiZWZlMDY5NjcyYTJjOTQ5YTZhYmQ1MWNmM2M0ZDQ3ODQyMTBiYWRjNDkiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOWRjMWE4NDM3M2I2NTY0MzRlNmE4ZjNhYzc1MjJiYzFjOTU5Y2MzNDM0YWVh
ODlkMmMwMjA5Mjk4NmQ4NzAxNiIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4yMC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjEuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjEu
MC5iYgotLSAKMi40NC4wCgo=

--===============8152619347961957381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (918 cached, 2 parsed). 1881 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-631f7049fd5f145c147b8881ebd0c6a8a56fc4e8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:631f7049fd5f145c147b8881ebd0c6a8a56fc4e8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 263 Local 251 Mirrors 0 Missed 12 Current 439 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_recipe_qa)
NOTE: Running task 1876 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_write_config)
NOTE: recipe libva-2.21.0-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.21.0-r0: task do_write_config: Started
NOTE: recipe libva-2.21.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_recipe_qa unihash changed to 0077e840c447b61dcd25f448911c5fca67a291ce29629a3d2cbc0d049d8ddd5d
NOTE: Setscene tasks completed
NOTE: Running task 1977 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_fetch)
NOTE: recipe libva-2.21.0-r0: task do_fetch: Started
NOTE: recipe libva-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1978 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_unpack)
NOTE: Running task 1979 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.21.0-r0: task do_unpack: Started
NOTE: recipe libva-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1980 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_patch)
NOTE: Running task 1981 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.21.0-r0: task do_patch: Started
NOTE: recipe libva-2.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libva-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1982 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1983 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_populate_lic)
NOTE: recipe libva-2.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.21.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.21.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_populate_lic unihash changed to 45d99f1087fa3bf26a157fb7fb844d802d72ff0ea30f9667fca9137acbad3b20
NOTE: recipe libva-2.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_deploy_source_date_epoch unihash changed to c1d28c86b69fc00a11eb711dc421e75c4f3fe5336b5a1a254de46371e87c69c5
NOTE: Setscene tasks completed
NOTE: Running task 1984 of 1996 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure)
NOTE: recipe libva-2.21.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot', '
 /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.4.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/
 auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'libdrm', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-nat
 ive', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_glx=yes -Dwith_wayland=yes -Dwith_x11=yes...
| The Meson build system
| Version: 1.4.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/libva-2.21.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/build
| Build type: cross build
| Project name: libva
| Project version: 2.21.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot (gcc 14.1.0 "x86_64-poky-linux-gcc (GCC) 14.1.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot ld.bfd 2.42.0.20240513
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Library dl found: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libdrm found: YES 2.4.120
| Run-time dependency x11 found: YES 1.8.9
| Run-time dependency xext found: YES 1.3.6
| Run-time dependency xfixes found: YES 6.0.1
| Run-time dependency x11-xcb found: YES 1.8.9
| Run-time dependency xcb found: YES 1.17.0
| Run-time dependency xcb-dri3 found: YES 1.17.0
| Run-time dependency gl found: YES 24.0.7
| Run-time dependency wayland-client found: YES 1.23.0
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Build-time dependency wayland-scanner found: YES 1.23.0
| Program /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner)
| Checking for function "secure_getenv" : YES
| Configuring va_version.h using configuration
| Checking if "-Wl,--version-script" : links: YES
| Program doxygen found: NO
| 
| ../libva-2.21.0/meson.build:161:6: ERROR: Program './autogen.sh' not found or not executable
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890, line 170
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890, line 159
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890, line 183
NOTE: recipe libva-2.21.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1984 tasks of which 1974 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615140918.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615140918.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libva-2.21.0-r0 do_configure: meson failed
ERROR: libva-2.21.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.520890', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/log.do_configure.520890
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure) failed with exit code '1'

--===============8152619347961957381==--

