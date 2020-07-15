Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.79.1594831431750885522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97E6CE01E9C; Wed, 15 Jul 2020 09:43:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90ECFE01E92
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:59 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 49.2.0 FAILED
Message-Id: <20200715164351.97E6CE01E9C@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:51 -0700 (PDT)
X-Groupsio-MsgNum: 140659
Content-Type: multipart/mixed; boundary="===============1472131009836897473=="

--===============1472131009836897473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *49.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-47.3.1-49.2.0.patch
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

--===============1472131009836897473==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-47.3.1-49.2.0.patch"

From 7e83bac56bd6d8b63663c16b62f56a78ce0f7664 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 06:33:43 +0000
Subject: [PATCH] python3-setuptools: upgrade 47.3.1 -> 49.2.0

---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 meta/recipes-devtools/python/python-setuptools.inc            | 2 +-
 ...hon3-setuptools_47.3.1.bb => python3-setuptools_49.2.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_47.3.1.bb => python3-setuptools_49.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 201e3570d6..3f999b1998 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 234c3da52da09b28db5b2c4d33ebe9c800c461ac Mon Sep 17 00:00:00 2001
+From 6abaef829550b81ab7fdeebc492b161ce52b3e21 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 5a9576f..f5961cb 100644
+index 89be91a..4ab7f7b 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -656,6 +656,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index ecf1205752..58f5bb61f8 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "843037738d1e34e8b326b5e061f474aca6ef9d7ece41329afbc8aac6195a3920"
+SRC_URI[sha256sum] = "afe9e81fee0270d3f60d52608549cc8ec4c46dada8c95640c1a00160f577acf2"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_47.3.1.bb b/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_47.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_49.2.0.bb
-- 
2.17.1


--===============1472131009836897473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1339 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1339 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bcf7d67924539c4d6a13cebc9f036e3313268c5a"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 366 Found 215 Missed 151 Current 411 (58% match, 80% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 425 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.35.2.bb:do_package_setscene)
NOTE: recipe gettext-0.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 462 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 463 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-0.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 685 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 532 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 603 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.54.3.bb:do_fetch)
NOTE: Running task 643 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 726 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb:do_write_config)
NOTE: Running task 743 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 751 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 764 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: Running task 767 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 781 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 812 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.2.bb:do_fetch)
NOTE: Running task 813 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 833 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 847 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 849 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.20.2.bb:do_fetch)
NOTE: Running task 857 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 881 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_write_config)
NOTE: Running task 904 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.2.bb:do_write_config)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.35.2-r0: task do_package_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_fetch: Started
NOTE: recipe meson-native-0.54.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_20.1.2-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe gettext-0.20.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.102-r0: task do_write_config: Started
NOTE: recipe mesa-2_20.1.2-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: Running task 905 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 906 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 907 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 908 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_fetch)
NOTE: Running task 909 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_unpack)
NOTE: Running task 911 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: Running setscene task 755 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 913 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 914 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_write_config: Succeeded
NOTE: recipe meson-native-0.54.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: Running task 915 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.54.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_20.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 916 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 917 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: recipe libx11-1_1.6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-0.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 922 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb:do_fetch)
NOTE: Running task 924 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.2.bb:do_unpack)
NOTE: Running task 925 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: Running task 926 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: Running task 927 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.20.2.bb:do_unpack)
NOTE: Running task 928 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 942 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_fetch)
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 956 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.102-r0: task do_fetch: Started
NOTE: Running setscene task 758 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 957 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_unpack)
NOTE: Running task 958 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 961 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 962 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 963 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 964 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 965 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 974 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 975 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: Running task 1000 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 765 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1001 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1002 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.6.9-r0: task do_fetch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe meson-native-0.54.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.1.2-r0: task do_unpack: Started
NOTE: recipe gettext-0.20.2-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-49.2.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1008 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1017 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe libx11-1_1.6.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-49.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_unpack)
NOTE: Running task 1027 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1028 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: Running task 1029 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_unpack)
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_unpack)
NOTE: Running task 1045 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1070 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_fetch)
NOTE: Running task 1071 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running setscene task 767 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1081 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1084 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1086 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: Running task 1087 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: Running task 1088 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_unpack)
NOTE: Running task 1090 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_fetch)
NOTE: Running task 1092 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_fetch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.6.9-r0: task do_unpack: Started
NOTE: Running setscene task 770 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-49.2.0-r0: task do_unpack: Started
NOTE: Running task 1093 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: Running task 1098 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: Running task 1099 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1108 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb:do_fetch)
NOTE: Running task 1116 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_write_config)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_unpack: Started
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_fetch: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_write_config: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.6.1-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1134 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_write_config)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1135 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 1136 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1192 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: Running task 1195 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_unpack)
NOTE: Running task 1196 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: Running task 1197 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 1198 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1255 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_write_config)
NOTE: Running task 1260 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe python3-dbusmock-0.19-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Started
NOTE: recipe python3-setuptools-49.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_patch)
NOTE: recipe python3-setuptools-49.2.0-r0: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_unpack: Succeeded
NOTE: Running task 1353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libdrm-2.4.102-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1385 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 1386 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: Running task 1390 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_patch)
NOTE: Running task 1392 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 1393 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: Running task 1394 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_patch)
NOTE: recipe python3-dbusmock-0.19-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1402 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1403 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_patch)
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_unpack)
NOTE: recipe eudev-3.2.9-r0: task do_patch: Started
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 774 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running task 1405 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: Running task 1407 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1408 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb:do_unpack)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1409 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.6.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_patch: Started
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.9-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb:do_patch)
NOTE: recipe libx11-1_1.6.9-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-49.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_populate_lic)
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-49.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-49.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-49.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-49.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_patch: Started
NOTE: recipe meson-native-0.54.3-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.54.3.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.54.3-r0: task do_patch: Started
NOTE: recipe gettext-0.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.20.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe gettext-0.20.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb:do_patch)
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 2398 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.54.3-r0: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.9-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.35.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.6.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 776 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1458 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Started
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_unpack: Succeeded
NOTE: Running task 1459 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1460 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: Running setscene task 777 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe pkgconfig-0.29.2+gitAUTOINC+edf8e6f0ea-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2047 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.64.4-r0: task do_patch: Succeeded
ERROR: python3-setuptools-native-49.2.0-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/49.2.0-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 FAILED at 656.
1 out of 1 hunk FAILED -- rejects in file setuptools/command/easy_install.py
Patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch does not apply (enforce with -f)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/49.2.0-r0/temp/log.do_patch.35196
NOTE: recipe python3-setuptools-native-49.2.0-r0: task do_patch: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_patch) failed with exit code '1'
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.6.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.1.2-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2048 tasks of which 1923 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_49.2.0.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1472131009836897473==--
