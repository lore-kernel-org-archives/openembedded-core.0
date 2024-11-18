Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BCDD591CA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4788.1731964607190591230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UewdqOPV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lL/Akws0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019341229813-66804790-a609-470d-ae7f-4e792ec4ce77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7hKgesPUiae6itPGKe5THeqAboOBEfwJcBRpDse0DK4=;
	b=UewdqOPVoV6Ds4P2uyVuI8Dn5Cuart+rJAzT3znaioN2Ko0h7/u93DF1Q4vIIMFE
	RlR0CKQzdG7u+hT6zdiaZhWW3lgpmOvQLQ2KUwL2cmMsq3ni2uIi0hAn9UHnvv9xyH9
	9SOjL0nvsKBxf+OSvNSr4mf4Jqy6mzE5jSG/P5Jg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7hKgesPUiae6itPGKe5THeqAboOBEfwJcBRpDse0DK4=;
	b=lL/Akws02E1BWQNY4zGNzmrDFOQX8QypMLLxdq9U7OTPR7tSfPfjqzEil8ZzPITK
	fubt/NyPPhwuPHI2Qeu7J1XAOzF3HwLd/FbwiJxCMJKXIPEtfT+rC3XdY7YOiicwHI9
	EiRmhFZgtZU/p1Id3ObF4rRx5jiXdEu7pDm5Durk=
Content-Type: multipart/mixed; boundary="===============6495039934994452435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.12 FAILED
Message-ID: <0101019341229813-66804790-a609-470d-ae7f-4e792ec4ce77-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207247

--===============6495039934994452435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.12* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.11-2.12.patch
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
From cb9d9734c5069602b0dbb3408080ec2fba23e92b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 03:55:18 +0000
Subject: [PATCH] ofono: upgrade 2.11 -> 2.12

---
 .../recipes-connectivity/ofono/{ofono_2.11.bb => ofono_2.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.11.bb => ofono_2.12.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.11.bb b/meta/recipes-connectivity/ofono/ofono_2.12.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.11.bb
rename to meta/recipes-connectivity/ofono/ofono_2.12.bb
index 85119c73d4..cb1f4742c9 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.11.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "fa908ac79e2ffaa52391b6c6737cd451275ef788284e46d3f05a7a409bc52cfc"
+SRC_URI[sha256sum] = "0de08f969c063bc0ca2a6f7fc346c09bab9ef057d26f32eaf6aac2a2a4eac9eb"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.1


--===============6495039934994452435==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.11-2.12.patch"

RnJvbSBjYjlkOTczNGM1MDY5NjAyYjBkYmIzNDA4MDgwZWMyZmJhMjNlOTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDM6NTU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjExIC0+IDIuMTIKCi0tLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18yLjExLmJiID0+IG9mb25vXzIuMTIuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi4xMS5iYiA9PiBvZm9ub18yLjEyLmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4x
MS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xMi5iYgppbmRleCA4NTExOWM3M2Q0Li5jYjFmNDc0MmM5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjEyLmJiCkBAIC0xMSw3ICsxMSw3
IEBAIFNSQ19VUkkgPSAiXAogICAgICR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29yay8k
e0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICBmaWxlOi8vb2Zvbm8gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImZhOTA4YWM3OWUyZmZhYTUyMzkxYjZjNjczN2NkNDUxMjc1ZWY3ODgyODRlNDZk
M2YwNWE3YTQwOWJjNTJjZmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGRlMDhmOTY5YzA2M2Jj
MGNhMmE2ZjdmYzM0NmMwOWJhYjllZjA1N2QyNmYzMmVhZjZhYWMyYTJhNGVhYzllYiIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1yYy5kIHN5c3RlbWQgZ29iamVjdC1pbnRy
b3NwZWN0aW9uLWRhdGEKIAotLSAKMi40NC4xCgo=

--===============6495039934994452435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bad445f1ec56d86e4c1c068162689227d790b660"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 495 Local 485 Mirrors 0 Missed 10 Current 593 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 596 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx_setscene)
NOTE: Running setscene task 603 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_populate_lic_setscene)
NOTE: Running setscene task 605 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.12-r0: task do_populate_lic_setscene: Started
NOTE: recipe ell-0.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.12-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 942 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 950 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_256.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1786 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_fetch)
NOTE: recipe ofono-2.12-r0: task do_fetch: Started
NOTE: recipe systemd-1_256.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 965 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 968 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1073 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2083 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1086 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.12-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.12-r0: task do_unpack: Succeeded
NOTE: Running task 2135 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_patch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1088 of 1088 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.12-r0: task do_patch: Started
NOTE: recipe ofono-2.12-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2784 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2922 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2948 of 2960 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_configure)
NOTE: recipe ofono-2.12-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_2
 56.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/met
 a/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng'
 , 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
| 
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/ofono-2.12/build-aux/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/ofono-2.12/build-aux/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'build-aux'.
| libtoolize: copying file 'build-aux/libtool.m4'
| libtoolize: copying file 'build-aux/ltoptions.m4'
| libtoolize: copying file 'build-aux/ltsugar.m4'
| libtoolize: copying file 'build-aux/ltversion.m4'
| libtoolize: copying file 'build-aux/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/ofono-2.12/build-aux/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/bin/autoconf --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/ofono-2.12/build-aux/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/bin/autoheader --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/ofono-2.12/build-aux/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:23: installing 'build-aux/compile'
| configure.ac:8: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../ofono-2.12/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking how to create a pax tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot   option to reload object files... -r
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot object... ok
| checking for sysroot... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot
| checking for a working dd... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for _init in -lasan... no
| checking for _init in -llsan... no
| checking for _init in -lubsan... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for dlopen in -ldl... yes
| checking for glib-2.0 >= 2.68... yes
| checking for dbus-1 >= 1.6... yes
| checking for libudev >= 143... yes
| checking for ell >= 0.70... no
| configure: error: Embedded Linux library >= 0.70 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907, line 285
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907, line 261
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907, line 231
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907, line 289
NOTE: recipe ofono-2.12-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2948 tasks of which 2942 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116035312.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116035312.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/log.do_configure.3880907
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.12-r0 do_configure: configure failed
ERROR: ofono-2.12-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/run.do_configure.3880907' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.12/temp/log.do_configure.3880907
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.12.bb:do_configure) failed with exit code '1'

--===============6495039934994452435==--

