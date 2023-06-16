Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C8CC2FC05
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.799.1686887481902846143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W+E7F7EN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2543eeb-2a6c7ec7-1b03-4560-8921-b7d92e2d5cc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=owQQIZAHaZE4gZWVLYjhUISqL52gcIWKvnMIZYRvOk0=;
	b=W+E7F7EN2HIqBNq306qkC1D3V4cFgORFDFryg4nJLeMO7GBPC0irQNx37FCmgz4i
	vW/RLVG+PG8VgEsCE6oWea/SICXbs7+m1iBYCjMA0eQ51OOaSnYzprywB+K/TDOnGRU
	0K99f1cWujMy9E0xFTn3K1pXIFnGFEIXo1wiShMI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=owQQIZAHaZE4gZWVLYjhUISqL52gcIWKvnMIZYRvOk0=;
	b=D8mQZgvMKwjJwpyhnV9M2QjdCvTp4zi3cnLzQjt0s1IK9amc7f75cinqz0jxIvZm
	292cxk6nH1W/xnyzuR4IsHH08cukEWYqRrOA64UdIN6db1HpWAH1YR/tLO3nG/Ut4Gu
	OfMdlunUhTzyar3zWh4IBExuW/IS3iHL6XRwgBUc=
Content-Type: multipart/mixed; boundary="===============7420925606315427253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus: upgrading to 1.14.8 SUCCEEDED
Message-ID: <01010188c2543eeb-2a6c7ec7-1b03-4560-8921-b7d92e2d5cc3-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182891

--===============7420925606315427253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus* to *1.14.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-upgrade-1.14.6-1.14.8.patch
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
From e7c0b7e6bf7e9188d3954ef620f94c557a8dab72 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 07:08:21 +0000
Subject: [PATCH] dbus: upgrade 1.14.6 -> 1.14.8

---
 meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.6.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.6.bb
rename to meta/recipes-core/dbus/dbus_1.14.8.bb
index da25155773..b6c245d40b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
+SRC_URI[sha256sum] = "a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.39.2


--===============7420925606315427253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f144ead148e32a03845ed715a4c39c45aca1b683"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 0 Mirrors 0 Missed 63 Current 529 (0% match, 89% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1206 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1226 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1318 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1347 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1348 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1366 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: Running task 1600 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1606 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: Running task 1618 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1619 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1621 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1624 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1625 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 1626 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 1632 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1646 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1696 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1697 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1698 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1708 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running task 1709 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: Running task 1720 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1721 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1722 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1723 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1727 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1747 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1749 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1750 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1754 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: Running task 1806 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1812 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1813 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1814 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1815 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 1816 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1817 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1818 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1819 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: Running task 1820 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1821 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1823 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Started
NOTE: Running task 1824 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: Running task 1825 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1826 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 1827 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1828 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1829 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1831 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1832 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1833 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1835 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1836 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1837 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1838 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: Running task 1839 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Started
NOTE: Running task 1840 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1841 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_collect_spdx_deps)
NOTE: Running task 1842 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic unihash changed to a7969c1925efde57b265ac52533a95d133d2e1f6aa20bc2699b3b981913ac116
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: Running task 1843 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1844 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx)
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1845 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1846 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1847 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe kmod-30-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1848 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1849 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: Running task 1850 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1851 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1852 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1853 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1854 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1855 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1856 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: Running task 1857 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1858 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1859 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1863 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1868 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1869 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1870 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1874 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1876 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1877 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1881 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1883 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1884 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1887 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1888 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1889 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1890 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1891 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1894 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1895 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1900 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1901 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1902 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1904 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1905 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1906 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 1907 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1910 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 1911 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1912 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1914 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1919 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1920 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1924 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: Running task 1925 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 1926 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1927 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 1928 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 1929 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_qa: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_qa: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1930 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_runtime_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1931 tasks of which 1776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.1271193
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============7420925606315427253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dbus/dbus-common: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-common: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-dbg: FILELIST: removed "/usr/lib/.debug/libdbus-1.so.3.32.2", added "/usr/lib/.debug/libdbus-1.so.3.32.3"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-dbg: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 7641708 to 7649544 (+0%)
packages/core2-32-poky-linux/dbus/dbus-dev: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-dev: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-doc: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-doc: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.2", added "/usr/lib/libdbus-1.so.3.32.3"
packages/core2-32-poky-linux/dbus/dbus-lib: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-lib: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-locale: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-locale: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-ptest: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3662624 to 3670940 (+0%)
packages/core2-32-poky-linux/dbus/dbus-src: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-src: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-src: PKGSIZE changed from 4350796 to 4353849 (+0%)
packages/core2-32-poky-linux/dbus/dbus-staticdev: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-staticdev: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus-tools: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus-tools: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus/dbus: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus/dbus: PV changed from "1.14.6" to "1.14.8"
packages/core2-32-poky-linux/dbus: PKGV changed from 1.14.6 [default] to 1.14.8 [default]
packages/core2-32-poky-linux/dbus: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.6.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init" to "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init"
packages/core2-32-poky-linux/dbus: PV changed from "1.14.6" to "1.14.8"
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.2 to libdbus-1.so.3.32.3
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.2 to libdbus-1.so.3.32.3
  /usr/lib/libdbus-1.so.3.32.2 moved to /usr/lib/libdbus-1.so.3.32.3

--===============7420925606315427253==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-upgrade-1.14.6-1.14.8.patch"

RnJvbSBlN2MwYjdlNmJmN2U5MTg4ZDM5NTRlZjYyMGY5NGM1NTdhOGRhYjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDc6MDg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
YnVzOiB1cGdyYWRlIDEuMTQuNiAtPiAxLjE0LjgKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZGJ1
cy97ZGJ1c18xLjE0LjYuYmIgPT4gZGJ1c18xLjE0LjguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy97ZGJ1c18xLjE0LjYuYmIgPT4gZGJ1c18xLjE0LjguYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuNi5iYiBiL21ldGEvcmVjaXBl
cy1jb3JlL2RidXMvZGJ1c18xLjE0LjguYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuNi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuOC5iYgppbmRleCBkYTI1MTU1NzczLi5iNmMyNDVk
NDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC42LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1c18xLjE0LjguYmIKQEAgLTE2LDcgKzE2LDcg
QEAgU1JDX1VSSSA9ICJodHRwczovL2RidXMuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzL2RidXMv
ZGJ1cy0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vZGJ1cy0xLmluaXQgXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZDJiZGYxYmI4OWRjMzY1YTQ2NTMx
YmZmNjMxNTM2ZjIyYjBkMWM2ZDVjZTJjNWM1ZTU5YjU1MjY1YjNkNjZiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE2YmQ1YmFjNWNmMTlmMGMzYzU5NGJkYWUyNTY1YTA5NTY5Njk4MGE2ODNhMGVm
MzdjYjYyMTJlMDkzYmRlMzUiCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUteG1sLWRvY3Mg
XAogICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1kb3h5Z2VuLWRvY3MgXAotLSAKMi4zOS4yCgo=

--===============7420925606315427253==
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
meta-yocto-bsp       = "tmp-auh-upgrades:f144ead148e32a03845ed715a4c39c45aca1b683"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 0 Mirrors 0 Missed 63 Current 529 (0% match, 89% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1206 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1226 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1318 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1347 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1348 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1366 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: Running task 1600 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1606 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1618 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: Running task 1624 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1638 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1660 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: Running task 1690 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: Running task 1691 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1692 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1694 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1695 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 1705 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: Running task 1716 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running task 1717 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 1718 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 1722 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1743 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1746 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1748 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1749 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1750 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1807 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running task 1808 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1809 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1810 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1811 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1812 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1813 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1814 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1815 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_create_spdx)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1816 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx)
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 1817 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1818 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1819 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1820 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1821 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 1823 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1824 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1825 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1826 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1827 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: Running task 1828 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1829 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1830 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1831 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1832 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 1833 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1834 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1835 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_collect_spdx_deps)
NOTE: Running task 1836 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1838 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1839 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1841 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1842 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1844 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx)
NOTE: Running task 1845 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic unihash changed to a7969c1925efde57b265ac52533a95d133d2e1f6aa20bc2699b3b981913ac116
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1846 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1847 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1848 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1849 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1850 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1851 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1852 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1853 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1854 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1855 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1856 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: Running task 1857 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1858 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1859 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1863 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1868 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1869 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1870 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1874 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1875 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1876 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1877 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1881 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1886 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1887 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 1888 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1889 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1890 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1891 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1892 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1893 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1894 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1898 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1899 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1900 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1904 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1906 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 1907 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1911 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1912 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 1913 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1914 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1919 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1920 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1924 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: Running task 1925 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 1926 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1927 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 1928 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 1929 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1930 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_package_qa: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1930 tasks of which 1776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/coreutils/9.1-r0/temp/log.do_packagedata.1419235
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============7420925606315427253==
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
meta-yocto-bsp       = "tmp-auh-upgrades:f144ead148e32a03845ed715a4c39c45aca1b683"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 0 Mirrors 0 Missed 63 Current 529 (0% match, 89% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1206 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1226 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1318 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1347 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1348 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1366 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: Running task 1600 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1606 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1619 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1620 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: Running task 1626 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1631 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1632 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1633 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1643 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1644 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: Running task 1645 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running task 1684 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 1696 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_collect_spdx_deps)
NOTE: Running task 1706 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1717 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1718 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1722 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: Running task 1731 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1732 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running task 1744 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1745 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1746 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1747 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1751 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1752 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx)
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1753 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1788 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1812 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1813 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1814 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1815 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1816 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1817 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_create_spdx)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: Running task 1818 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Started
NOTE: Running task 1819 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: Running task 1820 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1821 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1822 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: Running task 1823 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1824 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Started
NOTE: Running task 1825 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1826 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: Running task 1827 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 1828 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1831 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1832 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1833 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1835 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1836 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 1837 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: Running task 1838 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Started
NOTE: Running task 1839 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1840 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1841 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1842 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic unihash changed to a7969c1925efde57b265ac52533a95d133d2e1f6aa20bc2699b3b981913ac116
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: Running task 1843 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1844 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx)
NOTE: Running task 1845 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Started
NOTE: Running task 1846 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1847 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-30-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1848 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1849 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1850 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1851 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1852 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1853 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1854 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1855 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1856 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: Running task 1857 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1858 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1859 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1862 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1863 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1868 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1869 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1870 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1873 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1876 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1877 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1881 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1886 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1888 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1889 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1890 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1891 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1892 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1893 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1894 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1898 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1899 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1900 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1904 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1906 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 1907 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1909 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1911 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1912 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 1913 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1914 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1918 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1920 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1924 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: Running task 1925 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1926 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1933 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Tasks Summary: Attempted 1927 tasks of which 1776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.1719934
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============7420925606315427253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.2", added "/usr/lib/libdbus-1.so.3.32.3"
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.2 to libdbus-1.so.3.32.3
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.2 to libdbus-1.so.3.32.3
  /usr/lib/libdbus-1.so.3.32.2 moved to /usr/lib/libdbus-1.so.3.32.3

--===============7420925606315427253==
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
meta-yocto-bsp       = "tmp-auh-upgrades:f144ead148e32a03845ed715a4c39c45aca1b683"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 0 Mirrors 0 Missed 62 Current 525 (0% match, 89% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1157 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1200 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 1220 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1310 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1339 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1340 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1356 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: Running task 1588 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1593 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1604 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: Running task 1610 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1624 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1644 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: Running task 1645 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: Running task 1676 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1678 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1679 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1680 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1681 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 1691 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running task 1692 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 1703 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 1704 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1709 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1730 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1733 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1734 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1735 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1792 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1793 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1794 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1795 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1796 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1797 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1798 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe libxml2-2.10.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1799 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_create_spdx)
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: Running task 1800 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 1801 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1802 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1803 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1804 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1805 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: Running task 1806 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: Running task 1807 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1808 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1809 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: Running task 1810 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1811 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 1812 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1813 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 1814 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1815 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1817 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1818 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_collect_spdx_deps)
NOTE: Running task 1819 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1820 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic)
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1821 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: Running task 1822 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1823 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1824 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1825 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1826 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1827 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1828 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx)
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1829 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic unihash changed to a7969c1925efde57b265ac52533a95d133d2e1f6aa20bc2699b3b981913ac116
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1831 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-30-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1832 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1833 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: Running task 1834 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1835 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1836 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1837 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1838 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1839 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1840 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_collect_spdx_deps)
NOTE: Running task 1841 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1842 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_create_spdx)
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1846 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1848 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1850 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1851 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1852 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1853 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1854 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1857 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1861 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1863 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1864 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1865 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1870 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1871 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1872 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1874 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1876 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1877 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1878 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1881 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1882 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1883 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1884 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1887 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1888 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1889 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1890 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1891 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1892 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1893 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1894 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1895 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1896 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 1897 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1898 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1900 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1902 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1904 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1906 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 1907 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1908 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: Running task 1909 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1910 tasks of which 1762 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata.1567162
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============7420925606315427253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 60 recipes from the core2-32 sysroot...done.
Removing 64 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f144ead148e32a03845ed715a4c39c45aca1b683"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 253 Local 166 Mirrors 0 Missed 87 Current 234 (65% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 244 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 245 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 251 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 284 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 860 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 863 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 286 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 895 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: Running task 896 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 897 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 898 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 899 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 900 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 901 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 902 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 903 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 904 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 905 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 906 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 908 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 909 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 910 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 911 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 924 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running setscene task 366 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 933 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 934 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 935 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: Running setscene task 367 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 370 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: Running setscene task 371 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 936 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 941 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 943 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 944 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 945 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running setscene task 375 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 946 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: Running task 947 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 948 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 949 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: Running task 950 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 951 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 382 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 385 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running setscene task 387 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 389 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running task 961 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: Running task 964 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: Running task 967 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 969 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 971 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: Running task 972 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 973 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 976 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 977 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 980 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: Running task 981 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 995 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: Running task 998 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 1000 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 1001 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: Running setscene task 396 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 1002 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1003 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1005 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 1011 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1012 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1013 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1015 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1020 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1021 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 401 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: Running task 1022 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: Running task 1023 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Started
NOTE: Running setscene task 403 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1024 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_lic: Succeeded
NOTE: Running task 1025 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_lic unihash changed to a7969c1925efde57b265ac52533a95d133d2e1f6aa20bc2699b3b981913ac116
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1026 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1027 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 1028 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 410 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1029 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 1030 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 415 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1042 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 420 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1047 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1065 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1066 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running task 1071 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1091 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Running task 1094 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1261 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1278 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1285 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1309 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1310 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1371 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1374 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_collect_spdx_deps)
NOTE: Running task 1395 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1411 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 1433 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1440 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1441 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1476 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx)
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1477 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1478 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1479 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1480 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1481 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1482 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1483 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1485 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1486 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1488 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1491 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1492 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_package)
NOTE: Running task 1496 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1497 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: Running task 1498 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1499 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1500 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1502 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_collect_spdx_deps)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1503 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1504 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: Running task 1505 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1507 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1508 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: Running task 1510 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1511 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_create_spdx)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata)
NOTE: recipe xorgproto-2022.2-r0: task do_create_spdx: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1514 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1515 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx)
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1516 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 1517 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 1518 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1519 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1520 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx)
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1524 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1525 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1527 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1528 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1530 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1535 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1537 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1538 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_configure_ptest_base)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1540 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1541 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1545 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1546 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1550 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1551 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1552 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1554 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1555 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1556 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1559 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1560 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1561 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1562 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1563 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1567 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install: Succeeded
NOTE: Running task 1568 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1569 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot)
NOTE: Running task 1570 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1571 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1572 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1573 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1576 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1578 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 1579 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1581 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1583 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1586 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1587 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 1588 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1589 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1591 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1592 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1593 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1601 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1602 tasks of which 1378 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.3-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/coreutils/9.1-r0/temp/log.do_packagedata.1917354
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata) failed with exit code '1'

--===============7420925606315427253==--

