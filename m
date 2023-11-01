Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404E6C07CB1
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.8672.1698848705999739857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FNRRgIPd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hTE0ymzy;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b460a7e-e9b5b381-dc65-4acc-827b-091d493791df-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J2rwHaiV/zZzwtPqyUWvL9uFQt+kuefnnLftNBGbZiQ=;
	b=FNRRgIPdF3x0FRPuaBpaQSStNt8pWMdVqOrsUJnDgE7nVHYgonYWP/wEYyVmiA2G
	PtV+sFAxZgXiwgAxYx46noiwOxTKQC4cpLgeTOMzhgBfotizcnehtfFeAVAIYMKYXV5
	TDb4N0CJyea8GYF8+heq5n/Zgy6XqhveZZ6SQBiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J2rwHaiV/zZzwtPqyUWvL9uFQt+kuefnnLftNBGbZiQ=;
	b=hTE0ymzyV4mypYMZAgL907npsVR3H/Tv2yycpxeeqkI7dtFrCz6OoFJt7E+XzDqS
	lzTk7D4Bw9RLnuqWNvGjX5W2AnhXtV4paLfyeY367jdq64SoAfydSKoIRqVIYEQpVzF
	/xnLajXgseWYFxb03X6YoQiU8AEGXvHxnpRzrH9s=
Content-Type: multipart/mixed; boundary="===============6838434955563243551=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.0 FAILED
Message-ID: <0101018b8b460a7e-e9b5b381-dc65-4acc-827b-091d493791df-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189999

--===============6838434955563243551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *45.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-44.6-45.0.patch
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
From 361a161b31315f98930109bb642544f8586a8dc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:07:24 +0000
Subject: [PATCH] epiphany: upgrade 44.6 -> 45.0

---
 .../epiphany/{epiphany_44.6.bb => epiphany_45.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_44.6.bb => epiphany_45.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_44.6.bb b/meta/recipes-gnome/epiphany/epiphany_45.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_44.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.0.bb
index d8dd3d6dae..e20a5e993e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "5335dd573581db61e126d854dc16ae519657a5b8790789a47d25e43e17cd3a43"
+SRC_URI[archive.sha256sum] = "0ba2443a3390d75d63271e30b9aa1c7b8f37c1bba37bd346a7fdd20bbdb34791"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


--===============6838434955563243551==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-44.6-45.0.patch"

RnJvbSAzNjFhMTYxYjMxMzE1Zjk4OTMwMTA5YmI2NDI1NDRmODU4NmE4ZGMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjowNzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ0LjYgLT4gNDUuMAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ0LjYuYmIgPT4gZXBpcGhhbnlfNDUuMC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQ0LjYuYmIgPT4gZXBpcGhhbnlfNDUuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDQuNi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80NC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDUuMC5iYgppbmRleCBkOGRkM2Q2ZGFlLi5lMjBhNWU5OTNlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuNi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMC5iYgpAQCAtMzIsNyArMzIsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1MzM1ZGQ1NzM1ODFkYjYxZTEyNmQ4NTRk
YzE2YWU1MTk2NTdhNWI4NzkwNzg5YTQ3ZDI1ZTQzZTE3Y2QzYTQzIgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiMGJhMjQ0M2EzMzkwZDc1ZDYzMjcxZTMwYjlhYTFjN2I4ZjM3YzFiYmEz
N2JkMzQ2YTdmZGQyMGJiZGIzNDc5MSIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVn
Z2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10
cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCi0tIAoyLjM5LjIKCg==

--===============6838434955563243551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8795064872a157a7d497372a40d7629cdff5e2d3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8795064872a157a7d497372a40d7629cdff5e2d3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 102 Mirrors 0 Missed 11 Current 1498 (90% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3857 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_recipe_qa)
NOTE: Running task 4113 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_write_config)
NOTE: recipe epiphany-45.0-r0: task do_recipe_qa: Started
NOTE: recipe epiphany-45.0-r0: task do_write_config: Started
NOTE: recipe epiphany-45.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4358 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_fetch)
NOTE: recipe epiphany-45.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_fetch: Started
NOTE: recipe epiphany-45.0-r0: task do_fetch: Succeeded
NOTE: Running task 4359 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_unpack)
NOTE: Running task 4360 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-45.0-r0: task do_unpack: Started
NOTE: recipe epiphany-45.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-45.0-r0: task do_unpack: Succeeded
NOTE: Running task 4361 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_patch)
NOTE: Running task 4362 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-45.0-r0: task do_patch: Started
NOTE: recipe epiphany-45.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-45.0-r0: task do_patch: Succeeded
NOTE: Running task 4363 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4364 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_populate_lic)
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4365 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure)
NOTE: recipe epiphany-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot',
  '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/
 desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/poky
 build/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'gobject-introspection', 'vala', 'libgcc', 'linux-libc-headers', 'python3-build-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-wheel-native', 'glib-2.0', 'gtk4', 'gstreamer1.0-plugins-base', 'libsecret', 'at-spi2-core', 'cairo', 'libxt', 'systemd', 'libxrender', 'libjpeg-turbo', 'libwpe', 'wayland', 'libtasn1', 'mesa', 'libnotify', 'libxcomposite', 'libwebp', 'libxdamage', 'wpebackend-fdo', 'harfbuzz', 'gstrea
 mer1.0', 'libx11', 'enchant2', 'libxslt', 'libpcre2-native', 'zlib-native', 'libffi-native', 'util-linux-native', 'gettext-minimal-native', 'libtool-native', 're2c-native', 'libx11-native', 'libxrandr-native', 'libxdamage-native', 'libpng-native', 'libjpeg-turbo-native', 'pango-native', 'fontconfig-native', 'gdk-pixbuf-native', 'libxfixes-native', 'cairo-native', 'gobject-introspection-native', 'libxrender-native', 'libxcursor-native', 'libxcomposite-native', 'libxext-native', 'at-spi2-core-native', 'libxi-native', 'libmpc-native', 'gnu-config-native', 'mpfr-native', 'binutils-cross-x86_64', 'flex-native', 'texinfo-dummy-native', 'zstd-native', 'gmp-native', 'gmp', 'nghttp2', 'libxml2', 'sqlite3', 'libpsl', 'acl', 'attr', 'zstd', 'bzip2', 'xz', 'opkg-utils', 'zlib', 'attr-native', 'libxkbcommon', 'libxi', 'pango', 'libxext', 'libepoxy', 'wayland-protocols', 'libxfixes', 'libxcursor', 'libpng', 'fontconfig', 'libxrandr', 'appstream', 'libnsl2-native', 'libedit-native', 'ncurses-nativ
 e', 'expat-native', 'bzip2-native', 'openssl-native', 'sqlite3-native', 'util-linux-libuuid-native', 'libtirpc-native', 'gdbm-native', 'p11-kit', 'libgcrypt', 'shared-mime-info', 'python3', 'libffi', 'python3-pyproject-hooks-native', 'python3-flit-core-native', 'python3-packaging-native', 'bash-completion', 'libpcre2', 'util-linux', 'vulkan-headers', 'vulkan-loader', 'tiff', 'gstreamer1.0-plugins-bad', 'gi-docgen', 'fribidi', 'libxinerama', 'librsvg', 'graphene', 'libxv', 'libdrm', 'libglu', 'libvorbis', 'alsa-lib', 'libsm', 'orc', 'iso-codes', 'libogg', 'libtheora', 'dbus', 'libxtst', 'pixman', 'libxcb', 'libxdmcp', 'xorgproto', 'util-macros', 'update-rc.d', 'libpam', 'shadow-native', 'kmod', 'base-passwd', 'libcap', 'shadow', 'initscripts', 'base-files', 'shadow-sysroot', 'libseccomp', 'expat', 'libxshmfence', 'libxxf86vm', 'xrandr', 'freetype', 'icu', 'xtrans', 'aspell', 'libcap-ng-native', 'util-macros-native', 'xtrans-native', 'libxcb-native', 'xorgproto-native', 'cmake-native'
 , 'libxft-native', 'harfbuzz-native', 'freetype-native', 'fribidi-native', 'shared-mime-info-native', 'libsm-native', 'pixman-native', 'dbus-native', 'libxml2-native', 'libxtst-native', 'm4-native', 'xkeyboard-config', 'libxft', 'curl', 'libyaml', 'libxmlb', 'perl-native', 'libgpg-error', 'ncurses', 'libtirpc', 'gdbm', 'util-linux-libuuid', 'libedit', 'openssl', 'libnsl2', 'libxcrypt', 'unzip-native', 'libcap-ng', 'bluez5', 'sbc', 'libusb1', 'libgudev', 'libsndfile1', 'libstd-rs', 'libpthread-stubs', 'libpciaccess', 'libice', 'xcb-proto', 'libxau', 'cracklib', 'libxau-native', 'libxdmcp-native', 'xcb-proto-native', 'libpthread-stubs-native', 'icu-native', 'itstool-native', 'libice-native', 'libidn2', 'make-native', 'readline', 'libical', 'flac', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/epiphany-45.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 45.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency gcr-4 found: YES 4.1.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.10
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency gio-unix-2.0 found: YES 2.78.0
| Run-time dependency glib-2.0 found: YES 2.78.0
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 44.0
| Run-time dependency gstreamer-1.0 found: YES 1.22.6
| Run-time dependency gtk4 found: YES 4.12.3
| Run-time dependency gtk4-unix-print found: YES 4.12.3
| Run-time dependency hogweed found: YES 3.9.1
| Dependency iso-codes found: YES 4.15.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.6.6
| Run-time dependency libarchive found: YES 3.7.2
| Run-time dependency libadwaita-1 found: YES 1.4.0
| Run-time dependency libsecret-1 found: YES 0.21.1
| Run-time dependency libsoup-3.0 found: YES 3.4.2
| Run-time dependency libxml-2.0 found: YES 2.11.5
| Run-time dependency nettle found: YES 3.9.1
| Run-time dependency libportal-gtk4 found: YES 0.7.1
| Run-time dependency sqlite3 found: YES 3.43.2
| Dependency webkitgtk-6.0 found: NO found 2.40.5 but need: '>= 2.41.1'
| Found CMake: NO
| Run-time dependency webkitgtk-6.0 found: NO
| 
| ../epiphany-45.0/meson.build:112:16: ERROR: Dependency lookup for webkitgtk-6.0 with method 'pkgconfig' failed: Invalid version, need 'webkitgtk-6.0' ['>= 2.41.1'] found '2.40.5'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576, line 187
NOTE: recipe epiphany-45.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4365 tasks of which 4355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-45.0-r0 do_configure: meson failed
ERROR: epiphany-45.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/run.do_configure.1828576', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/epiphany/45.0/temp/log.do_configure.1828576
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure) failed with exit code '1'

--===============6838434955563243551==--

