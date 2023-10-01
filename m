Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D31E776F1
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.64744.1696183991938401044
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ekESiieL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rlVLhUfb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018aec71bb00-2477568a-c127-4335-87c8-65599bda4021-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=COm25+xYJyrEaxb+1rHRx8f5htIDfhpoyloY1XyKtC8=;
	b=ekESiieL1zBJZv/BsK/c664uoRAUiHQrlV+hmfxRiDAx9juRn/wiMZCLalAQXddT
	XhLS92JteAwEj/D5QJuwNjdIfYWDKeIjWDOSjfsly+yaJxlwYiuankl/n6ONXsiSMDn
	ezvKQGvShhW7mj6VJjr8LY7HFywRDCiBxMe9HXAo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=COm25+xYJyrEaxb+1rHRx8f5htIDfhpoyloY1XyKtC8=;
	b=rlVLhUfbduqvSiwVcp0y6JSQrS7IcwjJOIQqRX++h0zfw1cgsE5PrRD7WyuhXIlg
	t1dBHnJoGOlCRxetf2fStr5wZjBUx6WBOPbXhl3xkboXWKf+n2HmT80tyTFQTIvw2i5
	2ZZN6tMSZG0+hVb4RfxXge7ZieDfwJgPp1AgLdgM=
Content-Type: multipart/mixed; boundary="===============4708948857835979357=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.0 FAILED
Message-ID: <0101018aec71bb00-2477568a-c127-4335-87c8-65599bda4021-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188562

--===============4708948857835979357==
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
From a24b0c5e74fbfe17fbacb2a5a8903c0aa42aa4b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 14:15:40 +0000
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


--===============4708948857835979357==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-44.6-45.0.patch"

RnJvbSBhMjRiMGM1ZTc0ZmJmZTE3ZmJhY2IyYTVhODkwM2MwYWE0MmFhNGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNDoxNTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
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

--===============4708948857835979357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-dd18b2f6f525186c1e3f2b83cbd6f35c97cbee86"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd18b2f6f525186c1e3f2b83cbd6f35c97cbee86"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 299 Local 288 Mirrors 0 Missed 11 Current 1312 (96% match, 99% complete)
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
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4365 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure)
NOTE: recipe epiphany-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot',
  '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/
 desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/poky
 build/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'zlib-native', 'openssl-native', 'sqlite3-native', 'gdbm-native', 'libffi-native', 'libnsl2-native', 'libedit-native', 'libtool-native', 'ncurses-native', 'bzip2-native', 'util-linux-libuuid-native', 'libtirpc-native', 'expat-native', 're2c-native', 'libxcursor-native', 'at-spi2-core-native', 'libx11-native', 'gettext-minimal-native', 'libpng-native', 'libxdamage-native', 'fontconfig-native', 'libxfixes-native', 'libxi-native', 'gdk-pixbuf
 -native', 'gobject-introspection-native', 'pango-native', 'libxrandr-native', 'libjpeg-turbo-native', 'libxrender-native', 'cairo-native', 'libxcomposite-native', 'libxext-native', 'systemd', 'glib-2.0', 'vala', 'shared-mime-info', 'p11-kit', 'gtk4', 'libgcrypt', 'gobject-introspection', 'binutils-cross-i686', 'flex-native', 'texinfo-dummy-native', 'linux-libc-headers', 'gmp-native', 'mpfr-native', 'libmpc-native', 'gnu-config-native', 'zstd-native', 'libwebp', 'harfbuzz', 'libxcomposite', 'at-spi2-core', 'libxdamage', 'libxslt', 'wayland', 'libx11', 'libxt', 'libwpe', 'wpebackend-fdo', 'libsecret', 'cairo', 'libnotify', 'libjpeg-turbo', 'libxrender', 'gstreamer1.0', 'libtasn1', 'mesa', 'gstreamer1.0-plugins-base', 'enchant2', 'gmp', 'attr-native', 'opkg-utils', 'bzip2', 'xz', 'zlib', 'attr', 'zstd', 'acl', 'python3-wheel-native', 'python3-setuptools-native', 'python3-build-native', 'python3-installer-native', 'nghttp2', 'libxml2', 'libpsl', 'sqlite3', 'appstream', 'libgcc', 'util-l
 inux-native', 'libpcre2-native', 'libpng', 'pango', 'fontconfig', 'libxfixes', 'libxkbcommon', 'libepoxy', 'libxi', 'libxext', 'libxrandr', 'wayland-protocols', 'libxcursor', 'perl-native', 'cmake-native', 'util-macros-native', 'libxml2-native', 'libxtst-native', 'dbus-native', 'libxcb-native', 'xorgproto-native', 'xtrans-native', 'freetype-native', 'shared-mime-info-native', 'libxft-native', 'harfbuzz-native', 'fribidi-native', 'pixman-native', 'libsm-native', 'libcap', 'update-rc.d', 'kmod', 'initscripts', 'base-passwd', 'bash-completion', 'base-files', 'libpam', 'shadow-sysroot', 'shadow', 'libseccomp', 'shadow-native', 'util-linux', 'libffi', 'libpcre2', 'fribidi', 'tiff', 'gi-docgen', 'librsvg', 'gstreamer1.0-plugins-bad', 'vulkan-loader', 'vulkan-headers', 'graphene', 'libxinerama', 'libgpg-error', 'python3', 'm4-native', 'freetype', 'icu', 'util-macros', 'xorgproto', 'libxtst', 'dbus', 'expat', 'libxcb', 'xtrans', 'libxdmcp', 'libsm', 'pixman', 'libxxf86vm', 'xrandr', 'libdrm
 ', 'libxshmfence', 'alsa-lib', 'libvorbis', 'libogg', 'libtheora', 'iso-codes', 'libglu', 'libxv', 'orc', 'aspell', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'curl', 'libyaml', 'libxmlb', 'libcap-ng-native', 'libxft', 'xkeyboard-config', 'make-native', 'xcb-proto-native', 'libpthread-stubs-native', 'libxdmcp-native', 'libxau-native', 'itstool-native', 'icu-native', 'libice-native', 'openssl', 'libxcrypt', 'cracklib', 'libcap-ng', 'util-linux-libuuid', 'ncurses', 'libstd-rs', 'sbc', 'libgudev', 'bluez5', 'libsndfile1', 'libusb1', 'gdbm', 'libtirpc', 'libnsl2', 'libedit', 'libpthread-stubs', 'xcb-proto', 'libxau', 'libice', 'libpciaccess', 'unzip-native', 'libidn2', 'readline', 'libical', 'flac', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.2.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/epiphany-45.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 45.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot (gcc 13.2.0 "i686-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency gcr-4 found: YES 4.1.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.10
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency gio-unix-2.0 found: YES 2.78.0
| Run-time dependency glib-2.0 found: YES 2.78.0
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 44.0
| Run-time dependency gstreamer-1.0 found: YES 1.22.5
| Run-time dependency gtk4 found: YES 4.12.1
| Run-time dependency gtk4-unix-print found: YES 4.12.1
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
| Run-time dependency sqlite3 found: YES 3.43.1
| Dependency webkitgtk-6.0 found: NO found 2.40.5 but need: '>= 2.41.1'
| Found CMake: NO
| Run-time dependency webkitgtk-6.0 found: NO
| 
| ../epiphany-45.0/meson.build:112:16: ERROR: Dependency lookup for webkitgtk-6.0 with method 'pkgconfig' failed: Invalid version, need 'webkitgtk-6.0' ['>= 2.41.1'] found '2.40.5'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003, line 187
NOTE: recipe epiphany-45.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4365 tasks of which 4355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-45.0-r0 do_configure: meson failed
ERROR: epiphany-45.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.2186003', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/log.do_configure.2186003
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure) failed with exit code '1'

--===============4708948857835979357==--

