Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691E7C3DA40
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.842.1686887485347008232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hFjMFvnW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c2544cfd-a9337b38-afd4-421f-b8fd-8b70e735cdc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ERplhEblUv55F/tloUr368seuvyho3nm6Dx5F8O/WZE=;
	b=hFjMFvnW+wH7KygqQRojvpf8bTAllGLSLOcCaMxd1xiKRLZb7CB3ockeoW5WGnE3
	DZbVQsQDUnXrOObhk/XKQjKQnSeT7aajEGnmpnE/B4gNGQjGR0woU27Eig4cKEHliHf
	B2qxy7CA4S29QV2/34HHPafGXJpcXlbht4/cngzI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ERplhEblUv55F/tloUr368seuvyho3nm6Dx5F8O/WZE=;
	b=FZa/DSz+nbloM/GBeVaR8MgC2PF0FOhc2+8MwfajHk2UQM0rcY1Q0BvnZMIImKPm
	euEqdZfpn0wFmrdnjwBAHgscwuZB1Tcu/LG/1lxYtImINDtOXtGkTU1BVDO/ZXYTa9r
	FoBCTAABnzxDYDvcGb1cbdIeXpjWc1pmqqVSw5/g=
Content-Type: multipart/mixed; boundary="===============7235858140963669527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-libinput: upgrading to 1.3.0 SUCCEEDED
Message-ID: <01010188c2544cfd-a9337b38-afd4-421f-b8fd-8b70e735cdc4-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182980

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-libinput* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch
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
From 1fcfdc89fc5104fb47590018916927a1ffac88e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 21:29:11 +0000
Subject: [PATCH] xf86-input-libinput: upgrade 1.2.1 -> 1.3.0

---
 ...f86-input-libinput_1.2.1.bb => xf86-input-libinput_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.2.1.bb => xf86-input-libinput_1.3.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
index e1c47aa5e7..892046e959 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 DEPENDS += "libinput"
 
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-SRC_URI[sha256sum] = "8151db5b9ddb317c0ce92dcb62da9a8db5079e5b8a95b60abc854da21e7e971b"
+SRC_URI[sha256sum] = "1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.39.2


--===============7235858140963669527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch"

RnJvbSAxZmNmZGM4OWZjNTEwNGZiNDc1OTAwMTg5MTY5MjdhMWZmYWM4OGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjE6Mjk6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Zjg2LWlucHV0LWxpYmlucHV0OiB1cGdyYWRlIDEuMi4xIC0+IDEuMy4wCgotLS0KIC4uLmY4Ni1p
bnB1dC1saWJpbnB1dF8xLjIuMS5iYiA9PiB4Zjg2LWlucHV0LWxpYmlucHV0XzEuMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci97eGY4Ni1pbnB1dC1saWJpbnB1
dF8xLjIuMS5iYiA9PiB4Zjg2LWlucHV0LWxpYmlucHV0XzEuMy4wLmJifSAoNzclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlu
cHV0XzEuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5w
dXQtbGliaW5wdXRfMS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbGliaW5wdXRfMS4yLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0
LWxpYmlucHV0XzEuMy4wLmJiCmluZGV4IGUxYzQ3YWE1ZTcuLjg5MjA0NmU5NTkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlucHV0
XzEuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlu
cHV0LWxpYmlucHV0XzEuMy4wLmJiCkBAIC03LDYgKzcsNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1hMjI5MjUxMjdiZDNjODI3YzM4NGNlZGQyM2VkMjMwOSIKIERF
UEVORFMgKz0gImxpYmlucHV0IgogCiBYT1JHX0RSSVZFUl9DT01QUkVTU09SID0gIi50YXIueHoi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1MWRiNWI5ZGRiMzE3YzBjZTkyZGNiNjJkYTlhOGRi
NTA3OWU1YjhhOTViNjBhYmM4NTRkYTIxZTdlOTcxYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIx
NDQ2YmEyMGEyMmJjOTY4YjVhNGEwYjRkYmMzYjhlMDM3YzUwZDljNTlhYzc1ZmEzZjdmYzUwNmM1
OGMxYWJiIgogCiBGSUxFUzoke1BOfSArPSAiJHtkYXRhZGlyfS9YMTEveG9yZy5jb25mLmQiCi0t
IAoyLjM5LjIKCg==

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:75e1f534b39b896507d92108e0103d09f42289e4"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 35 Mirrors 0 Missed 54 Current 637 (39% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 654 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.2334234
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1571 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1572 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 1606 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1644 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1746 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1789 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1823 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1824 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1825 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1912 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1913 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 1914 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1915 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1920 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1957 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1973 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1978 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 2007 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2045 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 2071 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2127 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2128 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 2129 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: Running task 2145 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2146 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 2147 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2148 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 2149 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2150 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 2151 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2152 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 2153 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2154 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2175 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: Running task 2183 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2184 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2186 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2188 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2193 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2194 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2210 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2211 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2212 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Running task 2213 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2214 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 4abb3125e167b63d8b0f294409a80cbe9543e798a2a54ab391ecb60e3dd87297
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2216 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2217 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2220 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2224 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2231 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2232 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2234 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2235 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2236 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2239 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2241 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2242 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2249 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2250 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2251 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2253 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2254 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2255 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2256 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2258 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_spdx)
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2160 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-libinput: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.2.1.tar.xz" to "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.3.0.tar.xz"
packages/core2-32-poky-linux/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGSIZE changed from 218556 to 239868 (+10%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGSIZE changed from 9974 to 10867 (+9%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGSIZE changed from 17951 to 19140 (+7%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: FILELIST: removed "/usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.h /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/xf86libinput.c", added "/usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/xf86libinput.c"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGSIZE changed from 90033 to 98289 (+9%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:75e1f534b39b896507d92108e0103d09f42289e4"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 35 Mirrors 0 Missed 54 Current 637 (39% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.2392968
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1570 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1572 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 1606 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1644 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1747 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1789 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1823 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1824 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1825 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: Running task 1916 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1959 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1960 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1969 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1972 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 1973 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1976 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2005 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 2019 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 2020 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 2022 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 2044 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: Running task 2082 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2083 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2084 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2145 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 2146 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2147 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2148 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 2149 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2150 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: Running task 2151 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2152 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2154 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2155 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 2158 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2159 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2181 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2189 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2194 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2197 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 2198 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2199 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2200 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2201 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2202 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2203 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 4abb3125e167b63d8b0f294409a80cbe9543e798a2a54ab391ecb60e3dd87297
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2217 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2218 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2220 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2224 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2231 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2232 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2233 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2234 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2235 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2236 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2238 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2241 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2242 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2249 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2250 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2251 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2252 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2253 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2254 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2255 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2256 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2258 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_spdx)
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2160 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:75e1f534b39b896507d92108e0103d09f42289e4"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 35 Mirrors 0 Missed 54 Current 637 (39% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.2486459
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 726 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1570 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1572 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 1606 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1644 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1746 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1789 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1821 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1823 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1825 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1893 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1894 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1895 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 1896 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: Running task 1920 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1940 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1941 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1973 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1978 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 2007 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 2008 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2072 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2073 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2074 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2145 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2146 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 2147 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2149 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: Running task 2150 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2152 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 2153 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2154 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2169 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2176 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2184 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2185 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2186 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2187 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: Running task 2190 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2193 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2209 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: Running task 2210 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2211 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: Running task 2212 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2213 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2214 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 2215 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 2216 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 4abb3125e167b63d8b0f294409a80cbe9543e798a2a54ab391ecb60e3dd87297
NOTE: Running task 2217 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2220 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2224 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2231 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2232 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2233 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2234 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: Running task 2235 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2236 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2239 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2242 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2243 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2244 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2249 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2250 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2251 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2253 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2254 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2255 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2256 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2258 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2262 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2263 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2266 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2268 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2270 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2271 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: Running task 2272 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 2273 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2277 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2278 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2279 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2280 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2282 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2283 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 2287 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_spdx)
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2160 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:75e1f534b39b896507d92108e0103d09f42289e4"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 35 Mirrors 0 Missed 54 Current 632 (39% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.2439539
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1559 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 1561 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1594 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1632 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1734 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1777 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1809 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1810 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1812 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: Running task 1904 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1935 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1936 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1949 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 1950 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1955 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1962 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1986 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1993 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 2088 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 2125 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2126 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 2127 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2128 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2129 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2130 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 2131 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2132 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 2133 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2134 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: Running task 2135 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2136 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 2137 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2138 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2139 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: Running task 2161 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2162 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2170 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2171 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2175 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2178 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2179 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 2180 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2196 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2197 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2198 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2199 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 4abb3125e167b63d8b0f294409a80cbe9543e798a2a54ab391ecb60e3dd87297
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 2200 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2201 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 2203 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2204 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2208 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2213 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2215 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2217 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2218 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2219 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2222 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2226 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2228 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2231 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2232 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2233 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2234 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2235 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2236 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2237 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2239 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2240 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2242 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2247 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2251 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2252 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2253 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 2254 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2255 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: Running task 2256 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 2257 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2258 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2262 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2263 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2265 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2266 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2267 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2268 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 2271 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2276 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2277 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 2280 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2282 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_spdx)
NOTE: Running task 2283 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 2284 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2285 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2286 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2286 tasks of which 2144 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7235858140963669527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 99 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:75e1f534b39b896507d92108e0103d09f42289e4"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 372 Local 318 Mirrors 0 Missed 54 Current 262 (85% match, 91% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 289 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running task 706 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 707 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: Running task 717 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 726 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 774 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 790 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 793 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 794 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 795 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 808 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 809 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 810 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 813 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 829 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 830 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 831 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 832 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 833 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 835 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 837 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 383 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 852 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: Running task 861 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 863 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 864 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 865 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 867 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 877 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 878 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: Running task 883 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 884 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 889 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 890 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 891 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 892 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 898 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Started
NOTE: Running task 899 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: Running task 900 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 4abb3125e167b63d8b0f294409a80cbe9543e798a2a54ab391ecb60e3dd87297
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: Running setscene task 442 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 927 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 928 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 929 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.2553976
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 456 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 458 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 459 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 520 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 552 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 634 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1706 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1770 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: Running task 1822 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1898 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1916 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 1917 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: Running task 1918 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 1920 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1923 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: Running task 1924 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1938 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1939 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1940 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1942 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1943 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1944 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1945 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1946 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: Running task 1949 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1953 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1954 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1955 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1956 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1958 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1960 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_create_spdx)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1962 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1963 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1964 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1965 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 1968 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 1969 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1970 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1971 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 1974 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1975 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1976 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1977 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1978 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1981 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1982 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1983 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1985 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1986 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1987 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1988 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1990 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: Running task 1991 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: Running task 1992 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1993 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1994 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_create_spdx)
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1998 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1999 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2000 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2002 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2003 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 2007 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2009 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2011 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2012 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2013 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 2016 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2017 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2018 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_spdx)
NOTE: Running task 2019 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 2020 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2021 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2022 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2022 tasks of which 1880 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.0-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7235858140963669527==--

