Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A9C2BBE8
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.4386.1655298220493928915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KSHFqdOo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018167765cd2-12f381e3-e9ca-4371-87ab-7a69966fd1e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dsfDAlMxD4dq5+3eU8Sf/mDMrhDqMXY7+Te045GmDgM=;
	b=KSHFqdOoqn8B/pBDXgUZd2R6VU1D2WNh+E+Gii5cqxAV7OSGg9JQWqLZiCqQ3Okk
	0nRPeqQY4kuQUpCCC23GAkClUvSjwaItL6RUA4xtV/7EAQdupApnuphXslt2KrdOKGu
	TVi0aX3kPUkuxeNoDHfIsnHmLKksJ0v86HdjinRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dsfDAlMxD4dq5+3eU8Sf/mDMrhDqMXY7+Te045GmDgM=;
	b=CV/hObXhMDbFZ9GfvBs9dvZEI+1lQx1agkSXQ3P0ENQrZxfiQ1+NqW6HvQWOfeau
	il3rVRUABoH5mAEa0BvnZhSP4jfFU8ux17+NRookK8Z7NFD5t8G0fcv+bdFgmd8y67x
	aQbZJ1KerZQQe21RMD+RlMJNSGRBTLQBpS8Nv5Ko=
Content-Type: multipart/mixed; boundary="===============2464313231503122614=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.51 FAILED
Message-ID: 
 <0101018167765cd2-12f381e3-e9ca-4371-87ab-7a69966fd1e9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166938

--===============2464313231503122614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.51* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.50-0.51.patch
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
--===============2464313231503122614==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-ell-upgrade-0.50-0.51.patch"

From 07a76d2576c9c56a11489c1b5b60a932c5da5258 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 06:26:38 +0000
Subject: [PATCH] ell: upgrade 0.50 -> 0.51

---
 meta/recipes-core/ell/{ell_0.50.bb => ell_0.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.50.bb => ell_0.51.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.50.bb b/meta/recipes-core/ell/ell_0.51.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.50.bb
rename to meta/recipes-core/ell/ell_0.51.bb
index 243ac01530..40b9c37d9b 100644
--- a/meta/recipes-core/ell/ell_0.50.bb
+++ b/meta/recipes-core/ell/ell_0.51.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "0fe51d51c6eddc2a2784092f1dfdd1143a5ef27f15c274ecfbadd680d3a72fd9"
+SRC_URI[sha256sum] = "ba86cfa4aaf10151443edd63a7687914465d969f5dda00a2c1fcb11bd85e417f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.31.1


--===============2464313231503122614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 57 recipes from the core2-32 sysroot...done.
Removing 56 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ee0d001b8104419798fc129c3ed9769c98b0832c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee0d001b8104419798fc129c3ed9769c98b0832c"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 31 Mirrors 0 Missed 139 Current 164 (18% match, 58% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 294 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 235 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 237 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: Running task 241 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 365 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 369 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_fetch)
NOTE: Running task 371 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 372 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 472 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 501 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running task 502 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 503 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_fetch)
NOTE: Running task 504 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 505 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: Running task 660 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 663 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 664 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 665 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 667 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 681 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_fetch)
NOTE: Running task 690 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 697 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 698 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_write_config)
NOTE: Running task 700 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_fetch)
NOTE: Running task 703 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 704 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 705 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 706 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_fetch)
NOTE: Running task 707 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 708 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 711 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_fetch)
NOTE: Running task 713 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 714 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_fetch)
NOTE: Running task 715 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 716 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 717 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 719 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 759 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: Running task 764 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 765 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_unpack)
NOTE: Running task 766 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 767 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: Running task 768 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 769 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 771 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 772 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 773 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: Running task 775 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_unpack)
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 776 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 777 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_unpack)
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 778 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 780 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 781 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_unpack)
NOTE: Running task 782 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe ncurses-6.3-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8-r0: task do_fetch: Started
NOTE: Running task 783 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 784 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 785 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 786 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: Running task 787 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: Running task 788 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 789 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 790 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 791 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 792 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 793 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 794 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: Running task 795 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_unpack)
NOTE: Running task 797 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: Running task 798 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_unpack)
NOTE: Running task 799 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_unpack)
NOTE: Running task 800 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: recipe xorgproto-2022.1-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 801 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Started
NOTE: Running task 802 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 803 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running setscene task 307 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 804 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe ncurses-6.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_unpack: Started
NOTE: Running task 805 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 806 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Started
NOTE: Running task 807 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 808 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 809 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 309 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 812 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: Running task 813 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe util-linux-2.38-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: Running task 816 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 817 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 818 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 819 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_patch)
NOTE: Running task 821 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 822 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: Running task 823 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_patch)
NOTE: Running task 824 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 825 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 826 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: Running task 827 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_patch: Started
NOTE: recipe zlib-1.2.12-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: Running task 829 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 830 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_patch)
NOTE: Running setscene task 311 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: Running task 832 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 833 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 834 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 835 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 836 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 837 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 838 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: Running task 840 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_lic)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 312 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 843 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 844 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 845 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 846 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 847 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 848 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_patch: Started
NOTE: Running task 849 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 850 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 851 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 852 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 853 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_patch)
NOTE: Running task 854 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.11.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 855 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_populate_lic: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 856 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8-r0: task do_patch: Started
NOTE: Running task 857 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 858 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 315 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 859 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_unpack: Succeeded
NOTE: Running task 860 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 861 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_populate_lic: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_lic unihash changed to 3d4a3f56810a34c03b2122003350b57e4866a89ecb59b947bc8cb92fe9653869
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 864 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 318 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 871 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 872 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 873 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.5.52-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 874 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 875 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 876 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 877 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 879 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 328 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running task 894 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 895 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Succeeded
NOTE: Running task 896 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 898 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe util-linux-2.38-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: Running task 899 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 900 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_patch)
NOTE: Running task 901 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 908 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 909 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 966 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 967 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 968 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 973 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 974 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 979 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 980 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 981 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe zlib-1.2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 982 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_configure)
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 983 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 984 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe zlib-1.2.12-r0: task do_configure: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 985 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 986 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 987 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: Running task 988 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: recipe zlib-1.2.12-r0: task do_configure: Succeeded
NOTE: Running task 989 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: recipe zlib-1.2.12-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 990 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 991 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_compile: Started
NOTE: Running task 992 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot)
NOTE: Running task 993 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_compile: Succeeded
NOTE: Running task 994 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 995 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe zlib-1.2.12-r0: task do_compile_ptest_base: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 996 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: Running task 997 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: Running task 998 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: Running task 999 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.12-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1000 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_install: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: Running task 1001 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_install_ptest_base)
NOTE: Running task 1002 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe zlib-1.2.12-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1003 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot)
NOTE: Running task 1004 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_package)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.2.12-r0: task do_package: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1005 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1006 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_package: Succeeded
NOTE: Running task 1007 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata)
NOTE: Running task 1008 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1009 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1010 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 1011 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1012 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 1013 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: Running task 1014 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1015 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_compile)
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1016 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_install)
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1017 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1018 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1019 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1020 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1021 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1022 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1023 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1024 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1025 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1026 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1027 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1028 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1029 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1030 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1031 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_configure)
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1032 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1033 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1034 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure)
NOTE: Running task 1035 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1036 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_configure)
NOTE: Running task 1037 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe base-passwd-3.5.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1038 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_configure)
NOTE: Running task 1039 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1040 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_configure)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1041 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: Running task 1042 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe cracklib-2.9.7-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Started
NOTE: recipe flex-2.6.4-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_configure: Started
NOTE: Running task 1043 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe ncurses-6.3-r0: task do_configure: Started
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1044 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 1045 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: Running task 1046 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe xcb-proto-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1047 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1048 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1049 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1050 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xcb-proto-1.15-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_configure: Succeeded
NOTE: Running task 1051 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_compile: Started
NOTE: Running task 1052 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: Running task 1053 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1054 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1055 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1056 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1057 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15-r0: task do_install: Succeeded
NOTE: Running task 1058 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot)
NOTE: Running task 1059 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot: Started
NOTE: Running task 1060 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1061 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: Running task 1062 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1063 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1064 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_compile: Succeeded
NOTE: Running task 1065 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_install)
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_install: Succeeded
NOTE: Running task 1066 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1067 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.15-r0: task do_package: Succeeded
NOTE: Running task 1068 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1069 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1070 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_package)
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1071 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1072 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: Running task 1073 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1074 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1075 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1076 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1077 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_package: Succeeded
NOTE: Running task 1078 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1079 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1080 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: Running task 1081 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1082 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe cracklib-2.9.7-r0: task do_configure: Succeeded
NOTE: Running task 1083 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1084 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1085 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: Running task 1086 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1087 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1088 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1089 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_compile: Succeeded
NOTE: Running task 1090 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe cracklib-2.9.7-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1092 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1093 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1094 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: Running task 1095 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1096 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1097 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1098 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1099 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_install: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1100 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot)
NOTE: Running task 1101 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: Running task 1102 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 1103 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1104 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_package: Started
NOTE: Running task 1105 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe libffi-3.4.2-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1106 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot)
NOTE: Running task 1107 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1108 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1109 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1110 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: Running task 1111 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.2-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_install)
NOTE: recipe libffi-3.4.2-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1113 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: Running task 1114 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1115 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_install: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile: Started
NOTE: Running task 1116 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot)
NOTE: Running task 1117 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 1118 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1120 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: Running task 1122 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe cracklib-2.9.7-r0: task do_package: Succeeded
NOTE: Running task 1123 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata: Started
NOTE: Running task 1124 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1125 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 1126 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1127 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1128 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: Running task 1129 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1130 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1131 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1132 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1133 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1134 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1135 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 1136 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1137 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1138 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1139 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1140 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1141 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1142 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1143 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1144 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe ncurses-6.3-r0: task do_configure: Succeeded
NOTE: Running task 1145 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_compile: Started
NOTE: Running task 1146 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot)
NOTE: Running task 1147 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1148 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_package: Succeeded
NOTE: Running task 1149 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1151 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1152 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1153 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1154 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1155 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1157 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe ncurses-6.3-r0: task do_compile: Succeeded
NOTE: Running task 1159 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_install)
NOTE: recipe ncurses-6.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1161 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1162 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1164 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1165 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1167 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_configure)
NOTE: recipe libx11-1_1.8-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1168 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_install: Succeeded
NOTE: Running task 1169 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot)
NOTE: Running task 1170 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_compile)
NOTE: recipe libx11-1_1.8-r0: task do_compile: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Running task 1172 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata)
NOTE: recipe ncurses-6.3-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1173 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_install)
NOTE: recipe libx11-1_1.8-r0: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1174 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot)
NOTE: Running task 1175 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1176 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8-r0: task do_package: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1178 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot)
NOTE: Running task 1179 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: Running task 1180 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1181 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1182 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1184 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1185 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1186 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1187 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1188 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1189 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1190 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1191 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1192 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1193 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_configure)
NOTE: Running task 1194 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_configure: Started
NOTE: recipe util-linux-2.38-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1195 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1196 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_compile)
NOTE: recipe shadow-4.11.1-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1197 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_install)
NOTE: recipe shadow-4.11.1-r0: task do_install: Started
NOTE: recipe shadow-4.11.1-r0: task do_install: Succeeded
NOTE: Running task 1198 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: Running task 1199 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_package)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.11.1-r0: task do_package: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1200 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.38-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.38-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1201 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_compile)
NOTE: recipe util-linux-2.38-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_package: Succeeded
NOTE: Running task 1202 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1203 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.38-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.38-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1204 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_install)
NOTE: recipe util-linux-2.38-r0: task do_install: Started
NOTE: recipe util-linux-2.38-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.38-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.38-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1206 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot)
NOTE: Running task 1207 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_package)
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38-r0: task do_package: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1208 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1209 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1210 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1211 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.38-r0: task do_package: Succeeded
NOTE: Running task 1212 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata)
NOTE: recipe util-linux-2.38-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1213 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1214 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1216 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1217 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1218 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1219 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1220 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1222 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1223 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1224 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1225 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1226 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1227 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1228 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1229 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1230 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 1231 of 1238 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make --no-print-directory all-am
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o tools/certchain-verify.o ../ell-0.51/tools/certchain-verify.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o tools/genl-discover.o ../ell-0.51/tools/genl-discover.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o tools/genl-watch.o ../ell-0.51/tools/genl-watch.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o tools/genl-request.o ../ell-0.51/tools/genl-request.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o tools/gpio.o ../ell-0.51/tools/gpio.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/util.lo ../ell-0.51/ell/util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/test.lo ../ell-0.51/ell/test.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/strv.lo ../ell-0.51/ell/strv.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/utf8.lo ../ell-0.51/ell/utf8.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/queue.lo ../ell-0.51/ell/queue.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/hashmap.lo ../ell-0.51/ell/hashmap.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/string.lo ../ell-0.51/ell/string.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/settings.lo ../ell-0.51/ell/settings.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/main.lo ../ell-0.51/ell/main.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/idle.lo ../ell-0.51/ell/idle.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/signal.lo ../ell-0.51/ell/signal.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/timeout.lo ../ell-0.51/ell/timeout.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/io.lo ../ell-0.51/ell/io.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/ringbuf.lo ../ell-0.51/ell/ringbuf.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/log.lo ../ell-0.51/ell/log.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/checksum.lo ../ell-0.51/ell/checksum.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/netlink.lo ../ell-0.51/ell/netlink.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/genl.lo ../ell-0.51/ell/genl.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/rtnl.lo ../ell-0.51/ell/rtnl.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus.lo ../ell-0.51/ell/dbus.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-message.lo ../ell-0.51/ell/dbus-message.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-util.lo ../ell-0.51/ell/dbus-util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-service.lo ../ell-0.51/ell/dbus-service.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-client.lo ../ell-0.51/ell/dbus-client.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-name-cache.lo ../ell-0.51/ell/dbus-name-cache.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dbus-filter.lo ../ell-0.51/ell/dbus-filter.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/gvariant-util.lo ../ell-0.51/ell/gvariant-util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/siphash.lo ../ell-0.51/ell/siphash.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/hwdb.lo ../ell-0.51/ell/hwdb.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/cipher.lo ../ell-0.51/ell/cipher.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/random.lo ../ell-0.51/ell/random.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/uintset.lo ../ell-0.51/ell/uintset.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/base64.lo ../ell-0.51/ell/base64.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/pem.lo ../ell-0.51/ell/pem.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/tls.lo ../ell-0.51/ell/tls.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/tls-record.lo ../ell-0.51/ell/tls-record.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/tls-extensions.lo ../ell-0.51/ell/tls-extensions.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/tls-suites.lo ../ell-0.51/ell/tls-suites.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/uuid.lo ../ell-0.51/ell/uuid.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/key.lo ../ell-0.51/ell/key.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/file.lo ../ell-0.51/ell/file.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dir.lo ../ell-0.51/ell/dir.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/net.lo ../ell-0.51/ell/net.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp.lo ../ell-0.51/ell/dhcp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp-transport.lo ../ell-0.51/ell/dhcp-transport.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp-lease.lo ../ell-0.51/ell/dhcp-lease.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp6.lo ../ell-0.51/ell/dhcp6.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp6-transport.lo ../ell-0.51/ell/dhcp6-transport.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp6-lease.lo ../ell-0.51/ell/dhcp6-lease.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp-util.lo ../ell-0.51/ell/dhcp-util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/dhcp-server.lo ../ell-0.51/ell/dhcp-server.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/test.c  -fPIC -DPIC -o ell/.libs/test.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/hashmap.c  -fPIC -DPIC -o ell/.libs/hashmap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/signal.c  -fPIC -DPIC -o ell/.libs/signal.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/main.c  -fPIC -DPIC -o ell/.libs/main.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-util.c  -fPIC -DPIC -o ell/.libs/dbus-util.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/idle.c  -fPIC -DPIC -o ell/.libs/idle.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/string.c  -fPIC -DPIC -o ell/.libs/string.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/timeout.c  -fPIC -DPIC -o ell/.libs/timeout.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/strv.c  -fPIC -DPIC -o ell/.libs/strv.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus.c  -fPIC -DPIC -o ell/.libs/dbus.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/netlink.c  -fPIC -DPIC -o ell/.libs/netlink.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-service.c  -fPIC -DPIC -o ell/.libs/dbus-service.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/hwdb.c  -fPIC -DPIC -o ell/.libs/hwdb.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/queue.c  -fPIC -DPIC -o ell/.libs/queue.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-name-cache.c  -fPIC -DPIC -o ell/.libs/dbus-name-cache.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/utf8.c  -fPIC -DPIC -o ell/.libs/utf8.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/cert.lo ../ell-0.51/ell/cert.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/gvariant-util.c  -fPIC -DPIC -o ell/.libs/gvariant-util.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/cert-crypto.lo ../ell-0.51/ell/cert-crypto.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/util.c  -fPIC -DPIC -o ell/.libs/util.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-filter.c  -fPIC -DPIC -o ell/.libs/dbus-filter.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/tls-extensions.c  -fPIC -DPIC -o ell/.libs/tls-extensions.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/io.c  -fPIC -DPIC -o ell/.libs/io.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-message.c  -fPIC -DPIC -o ell/.libs/dbus-message.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/checksum.c  -fPIC -DPIC -o ell/.libs/checksum.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/tls.c  -fPIC -DPIC -o ell/.libs/tls.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/random.c  -fPIC -DPIC -o ell/.libs/random.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/uintset.c  -fPIC -DPIC -o ell/.libs/uintset.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/log.c  -fPIC -DPIC -o ell/.libs/log.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/rtnl.c  -fPIC -DPIC -o ell/.libs/rtnl.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/uuid.c  -fPIC -DPIC -o ell/.libs/uuid.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/ecc-external.lo ../ell-0.51/ell/ecc-external.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/ecc.lo ../ell-0.51/ell/ecc.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp.c  -fPIC -DPIC -o ell/.libs/dhcp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/pem.c  -fPIC -DPIC -o ell/.libs/pem.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/net.c  -fPIC -DPIC -o ell/.libs/net.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/file.c  -fPIC -DPIC -o ell/.libs/file.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/tls-suites.c  -fPIC -DPIC -o ell/.libs/tls-suites.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp-util.c  -fPIC -DPIC -o ell/.libs/dhcp-util.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/settings.c  -fPIC -DPIC -o ell/.libs/settings.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/cipher.c  -fPIC -DPIC -o ell/.libs/cipher.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dbus-client.c  -fPIC -DPIC -o ell/.libs/dbus-client.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/tls-record.c  -fPIC -DPIC -o ell/.libs/tls-record.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp6.c  -fPIC -DPIC -o ell/.libs/dhcp6.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/ringbuf.c  -fPIC -DPIC -o ell/.libs/ringbuf.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp-server.c  -fPIC -DPIC -o ell/.libs/dhcp-server.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/genl.c  -fPIC -DPIC -o ell/.libs/genl.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/key.c  -fPIC -DPIC -o ell/.libs/key.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp6-transport.c  -fPIC -DPIC -o ell/.libs/dhcp6-transport.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dir.c  -fPIC -DPIC -o ell/.libs/dir.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp6-lease.c  -fPIC -DPIC -o ell/.libs/dhcp6-lease.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/base64.c  -fPIC -DPIC -o ell/.libs/base64.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/siphash.c  -fPIC -DPIC -o ell/.libs/siphash.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp-transport.c  -fPIC -DPIC -o ell/.libs/dhcp-transport.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/dhcp-lease.c  -fPIC -DPIC -o ell/.libs/dhcp-lease.o
| In file included from ../ell-0.51/ell/dhcp6.c:37:
| ../ell-0.51/ell/time-private.h:26:50: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    26 | uint64_t _time_realtime_to_boottime(const struct timeval *ts);
|       |                                                  ^~~~~~~
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/ecdh.lo ../ell-0.51/ell/ecdh.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/time.lo ../ell-0.51/ell/time.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/gpio.lo ../ell-0.51/ell/gpio.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/path.lo ../ell-0.51/ell/path.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/icmp6.lo ../ell-0.51/ell/icmp6.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/acd.lo ../ell-0.51/ell/acd.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/ecc.c  -fPIC -DPIC -o ell/.libs/ecc.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/cert.c  -fPIC -DPIC -o ell/.libs/cert.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/tester.lo ../ell-0.51/ell/tester.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51    -fvisibility=hidden -DUNITDIR=\""../ell-0.51/unit/"\" -DCERTDIR=\""./unit/"\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot=                      -fdebug-p
 refix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot-native=  -c -o ell/netconfig.lo ../ell-0.51/ell/netconfig.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/ecc-external.c  -fPIC -DPIC -o ell/.libs/ecc-external.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/cert-crypto.c  -fPIC -DPIC -o ell/.libs/cert-crypto.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/ecdh.c  -fPIC -DPIC -o ell/.libs/ecdh.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/time.c  -fPIC -DPIC -o ell/.libs/time.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/icmp6.c  -fPIC -DPIC -o ell/.libs/icmp6.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/gpio.c  -fPIC -DPIC -o ell/.libs/gpio.o
| In file included from ../ell-0.51/ell/time.c:31:
| ../ell-0.51/ell/time-private.h:26:50: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    26 | uint64_t _time_realtime_to_boottime(const struct timeval *ts);
|       |                                                  ^~~~~~~
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/path.c  -fPIC -DPIC -o ell/.libs/path.o
| ../ell-0.51/ell/time.c:40:49: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|    40 | static uint64_t _time_from_timeval(const struct timeval *tv)
|       |                                                 ^~~~~~~
| ../ell-0.51/ell/time.c: In function '_time_from_timeval':
| ../ell-0.51/ell/time.c:42:18: error: invalid use of undefined type 'const struct timeval'
|    42 |         return tv->tv_sec * L_USEC_PER_SEC + tv->tv_usec;
|       |                  ^~
| ../ell-0.51/ell/time.c:42:48: error: invalid use of undefined type 'const struct timeval'
|    42 |         return tv->tv_sec * L_USEC_PER_SEC + tv->tv_usec;
|       |                                                ^~
| ../ell-0.51/ell/time.c: At top level:
| ../ell-0.51/ell/time.c:125:50: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
|   125 | uint64_t _time_realtime_to_boottime(const struct timeval *ts)
|       |                                                  ^~~~~~~
| ../ell-0.51/ell/time.c:125:10: error: conflicting types for '_time_realtime_to_boottime'; have 'uint64_t(const struct timeval *)' {aka 'long long unsigned int(const struct timeval *)'}
|   125 | uint64_t _time_realtime_to_boottime(const struct timeval *ts)
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| ../ell-0.51/ell/time-private.h:26:10: note: previous declaration of '_time_realtime_to_boottime' with type 'uint64_t(const struct timeval *)' {aka 'long long unsigned int(const struct timeval *)'}
|    26 | uint64_t _time_realtime_to_boottime(const struct timeval *ts);
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| ../ell-0.51/ell/time.c: In function '_time_realtime_to_boottime':
| ../ell-0.51/ell/time.c:135:42: warning: passing argument 1 of '_time_from_timeval' from incompatible pointer type [-Wincompatible-pointer-types]
|   135 |         ts_realtime = _time_from_timeval(ts);
|       |                                          ^~
|       |                                          |
|       |                                          const struct timeval *
| ../ell-0.51/ell/time.c:40:58: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
|    40 | static uint64_t _time_from_timeval(const struct timeval *tv)
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~^~
| In file included from ../ell-0.51/ell/pem.c:45:
| In function 'rawmemchr',
|     inlined from 'pem_load_buffer' at ../ell-0.51/ell/pem.c:227:21:
| ../ell-0.51/ell/missing.h:76:16: warning: 'memchr' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
|    76 |         return memchr(s, c, (size_t) -1);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/acd.c  -fPIC -DPIC -o ell/.libs/acd.o
| make[1]: *** [Makefile:1975: ell/time.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/tester.c  -fPIC -DPIC -o ell/.libs/tester.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../ell-0.51 -fvisibility=hidden -DUNITDIR=\"../ell-0.51/unit/\" -DCERTDIR=\"./unit/\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0=/usr/src/debug/ell/0.51-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0
 .51-r0/recipe-sysroot-native= -c ../ell-0.51/ell/netconfig.c  -fPIC -DPIC -o ell/.libs/netconfig.o
| make: *** [Makefile:1258: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 183
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 167
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 162
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 157
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 152
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487, line 196
NOTE: recipe ell-0.51-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1231 tasks of which 820 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ell-0.51-r0 do_compile: oe_runmake failed
ERROR: ell-0.51-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/run.do_compile.1886487', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.51-r0/temp/log.do_compile.1886487
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile) failed with exit code '1'

--===============2464313231503122614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1285008 to 1312980 (+2%)
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 146552 to 147769 (+1%)
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1349293 to 1380508 (+2%)
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell-src: FILELIST: directory renamed /usr/src/debug/ell/0.50-r0/ell-0.50/linux -> /usr/src/debug/ell/0.51-r0/ell-0.51/linux, removed "/usr/src/debug/ell/0.50-r0/ell-0.50/ell/dir.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-name-cache.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tester.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hwdb.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/queue.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gpio.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-service.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/asn1-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-client.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc-external.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/checksum.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-transport.c /usr/src/debu
 g/ell/0.50-r0/ell-0.50/ell/uuid.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-transport.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/file.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/idle.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/queue.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tester.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/base64.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/log.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/acd.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/time.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-client.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/io.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netconfig.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/time-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/rtnl.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecdh.h /usr/src/debug/ell/0
 .50-r0/ell-0.50/ell/dbus-service.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/io.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-message.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gvariant-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/time.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/string.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cipher.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netlink.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/test.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/key.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/idle.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-filter.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/genl.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/net-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/genl.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-suites.c /usr/src/debug/
 ell/0.50-r0/ell-0.50/ell/dhcp.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/net.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/path.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/base64.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/test.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/checksum.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/util.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecdh.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/settings.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/settings.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/timeout.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/string.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uintset.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-record.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-extensions.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/siphash.c /usr/src/debug/ell/0.50-r0/ell-
 0.50/ell/cert-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/timeout.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/pem-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ringbuf.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netconfig.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/log.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/pem.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/utf8.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/useful.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/utf8.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/strv.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uintset.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netlink.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hashmap.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/rtnl.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert-crypto.c /usr/src/debug/ell/0.50-r0/
 ell-0.50/ell/net.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gvariant-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/strv.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hwdb.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dir.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/signal.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hashmap.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uuid.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-lease.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/key.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cipher.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/signal.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/random.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ringbuf.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-server.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-lease.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main.h /usr/src/debug/ell/0.50-r0/ell-0.5
 0/ell/acd.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/random.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main.c", added "/usr/src/debug/ell/0.51-r0/ell-0.51/ell/uintset.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netconfig.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/genl.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hwdb.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-filter.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uuid.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc-external.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/idle.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/io.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hashmap.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uuid.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/signal.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-tr
 ansport.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hwdb.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/checksum.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-server.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/io.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/string.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ringbuf.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gpio.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/path.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/log.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/genl.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/timeout.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-transport.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/checksum.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-client.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tim
 eout.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-message.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/settings.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-client.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gvariant-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/test.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/test.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netlink.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/key.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/pem.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/strv.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/file.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uintset.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-lease.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dir.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/main-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/queue.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecdh.c /
 usr/src/debug/ell/0.51-r0/ell-0.51/ell/random.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netconfig.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tester.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/rtnl.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netlink.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ringbuf.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/asn1-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/queue.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/main.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/main.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/base64.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/base64.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert-crypto.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/pem-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/
 rtnl.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecdh.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/rtnl-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-name-cache.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tester.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cipher.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/string.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/settings.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/util.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/log.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/siphash.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/strv.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-record.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/
 idle.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-service.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-extensions.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/acd.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/random.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-service.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/useful.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gvariant-util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dir.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/signal.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hashmap.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cipher.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-lease.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-suites.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/utf8.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/key.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/acd.c /usr/src/debug/ell/0.51-r0/
 ell-0.51/ell/cert.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/utf8.h"
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell/ell: PKGSIZE changed from 543915 to 560299 (+3%)
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell: PV changed from "0.50" to "0.51"
packages/core2-32-poky-linux/ell: PKGV changed from 0.50 [default] to 0.51 [default]
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.50.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.51.tar.xz"

--===============2464313231503122614==--

